Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC7C1A2787
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 18:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgDHQwx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 12:52:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:39886 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727187AbgDHQwx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 12:52:53 -0400
IronPort-SDR: bUEa4mHCG+zQaqSeDh+UY9N6DMkzfF2hf4qsNWUk3GKaQa5JFRBoPabYjNV3ihxyAX2RIllvYv
 h8lsMaWVRIpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 09:52:53 -0700
IronPort-SDR: 9WmVBlKA3wfQFS95vRK8j8Lpiv5ZRsE96JSnZjE6rup4aK102b8zzqCcQloTzLfgf1ndMF8P79
 HanvBb4dWV5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; 
   d="scan'208";a="251614881"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 08 Apr 2020 09:52:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 40851130; Wed,  8 Apr 2020 19:52:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v1] i2c: icy: Don't use software node when it's an overkill
Date:   Wed,  8 Apr 2020 19:52:47 +0300
Message-Id: <20200408165247.13116-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no evidence, including commit message of the original change,
that software node should be used in the simple case where we would like
to instantiate an I²C client from board info. Board info contains a member
to pass device properties for long time. Let's use a simple way over
the complicated software node approach.

Fixes: 724041ae15ed ("i2c: icy: Add LTC2990 present on 2019 board revision")
Cc: Max Staudt <max@enpas.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-icy.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index 271470f4d8a9..ce68c436f06e 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -53,7 +53,7 @@ struct icy_i2c {
 
 	void __iomem *reg_s0;
 	void __iomem *reg_s1;
-	struct fwnode_handle *ltc2990_fwnode;
+
 	struct i2c_client *ltc2990_client;
 };
 
@@ -109,7 +109,7 @@ static unsigned short const icy_ltc2990_addresses[] = {
  */
 static const u32 icy_ltc2990_meas_mode[] = {0, 3};
 
-static const struct property_entry icy_ltc2990_props[] = {
+static const struct property_entry icy_ltc2990_properties[] = {
 	PROPERTY_ENTRY_U32_ARRAY("lltc,meas-mode", icy_ltc2990_meas_mode),
 	{ }
 };
@@ -122,6 +122,7 @@ static int icy_probe(struct zorro_dev *z,
 	struct fwnode_handle *new_fwnode;
 	struct i2c_board_info ltc2990_info = {
 		.type		= "ltc2990",
+		.properties	= icy_ltc2990_properties,
 	};
 
 	i2c = devm_kzalloc(&z->dev, sizeof(*i2c), GFP_KERNEL);
@@ -173,25 +174,10 @@ static int icy_probe(struct zorro_dev *z,
 	 *
 	 * See property_entry above for in1, in2, temp3.
 	 */
-	new_fwnode = fwnode_create_software_node(icy_ltc2990_props, NULL);
-	if (IS_ERR(new_fwnode)) {
-		dev_info(&z->dev, "Failed to create fwnode for LTC2990, error: %ld\n",
-			 PTR_ERR(new_fwnode));
-	} else {
-		/*
-		 * Store the fwnode so we can destroy it on .remove().
-		 * Only store it on success, as fwnode_remove_software_node()
-		 * is NULL safe, but not PTR_ERR safe.
-		 */
-		i2c->ltc2990_fwnode = new_fwnode;
-		ltc2990_info.fwnode = new_fwnode;
-
-		i2c->ltc2990_client =
-			i2c_new_scanned_device(&i2c->adapter,
+	i2c->ltc2990_client = i2c_new_scanned_device(&i2c->adapter,
 					       &ltc2990_info,
 					       icy_ltc2990_addresses,
 					       NULL);
-	}
 
 	return 0;
 }
@@ -201,7 +187,6 @@ static void icy_remove(struct zorro_dev *z)
 	struct icy_i2c *i2c = dev_get_drvdata(&z->dev);
 
 	i2c_unregister_device(i2c->ltc2990_client);
-	fwnode_remove_software_node(i2c->ltc2990_fwnode);
 
 	i2c_del_adapter(&i2c->adapter);
 }
-- 
2.25.1

