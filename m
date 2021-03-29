Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208F534CE37
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbhC2KvR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:49554 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232734AbhC2Kuz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:55 -0400
IronPort-SDR: RSxkwKRQo4IcaY2cepr49Nf+h6M2H6JQeGakm6kMFgA9lBD2JdhoL/F4KGW0+0HZfpx6U4mMGX
 oIb41SC54kDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653674"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653674"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:51 -0700
IronPort-SDR: 1QVmwb5KTXWYJ1FegoDIfF+bA7p+nGsfPzTTUn/xS4RiLicZ9db8HRhl+NPGyqfD/UmJvPHyGX
 GwmmemhOyIyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955897"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:49 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Max Staudt <max@enpas.org>
Subject: [PATCH 09/12] i2c: icy: Constify the software node
Date:   Mon, 29 Mar 2021 13:50:44 +0300
Message-Id: <20210329105047.51033-10-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Complete software node can now be supplied to the device
with struct i2c_board_info.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Max Staudt <max@enpas.org>
---
 drivers/i2c/busses/i2c-icy.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index 66c9923fc7665..c8c422e9dda43 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -54,7 +54,6 @@ struct icy_i2c {
 
 	void __iomem *reg_s0;
 	void __iomem *reg_s1;
-	struct fwnode_handle *ltc2990_fwnode;
 	struct i2c_client *ltc2990_client;
 };
 
@@ -115,6 +114,10 @@ static const struct property_entry icy_ltc2990_props[] = {
 	{ }
 };
 
+static const struct software_node icy_ltc2990_node = {
+	.properties = icy_ltc2990_props,
+};
+
 static int icy_probe(struct zorro_dev *z,
 		     const struct zorro_device_id *ent)
 {
@@ -123,6 +126,7 @@ static int icy_probe(struct zorro_dev *z,
 	struct fwnode_handle *new_fwnode;
 	struct i2c_board_info ltc2990_info = {
 		.type		= "ltc2990",
+		.swnode		= &icy_ltc2990_node,
 	};
 
 	i2c = devm_kzalloc(&z->dev, sizeof(*i2c), GFP_KERNEL);
@@ -174,26 +178,10 @@ static int icy_probe(struct zorro_dev *z,
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
-					       &ltc2990_info,
-					       icy_ltc2990_addresses,
-					       NULL);
-	}
-
+	i2c->ltc2990_client = i2c_new_scanned_device(&i2c->adapter,
+						     &ltc2990_info,
+						     icy_ltc2990_addresses,
+						     NULL);
 	return 0;
 }
 
@@ -202,8 +190,6 @@ static void icy_remove(struct zorro_dev *z)
 	struct icy_i2c *i2c = dev_get_drvdata(&z->dev);
 
 	i2c_unregister_device(i2c->ltc2990_client);
-	fwnode_remove_software_node(i2c->ltc2990_fwnode);
-
 	i2c_del_adapter(&i2c->adapter);
 }
 
-- 
2.30.2

