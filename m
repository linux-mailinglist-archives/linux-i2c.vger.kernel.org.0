Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8B836DC59
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 17:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhD1PuG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 11:50:06 -0400
Received: from mga18.intel.com ([134.134.136.126]:41372 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229961AbhD1PuF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Apr 2021 11:50:05 -0400
IronPort-SDR: mMmckBoR7CNcrIPZ9vKtDUeW1BiSwKji1pwz+a3JmMt8WZGLFzOnh5fGIEwsVucTZNa4jIXJp5
 8xpeLRLRlH2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="184255598"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="184255598"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 08:49:20 -0700
IronPort-SDR: fMUOybP9h0vM5RPsSC1rVWj12IBTrhQzlDTC+sRReoXEjMJw5YZJVMfCwy+qUbluG01IfQuL7W
 zyv89gMoPRQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="616076262"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2021 08:49:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 244B33C8; Wed, 28 Apr 2021 18:49:36 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: core: Propagate all possible errors when requesting recovery GPIOs
Date:   Wed, 28 Apr 2021 18:49:34 +0300
Message-Id: <20210428154934.18807-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If GPIO is available but we can't get it by some other, than deferred probe,
reason, propagate it to the caller.

No functional change since i2c_register_adapter() still cares only about
deferred probe.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7f711853d464..6c1d8bfdd3d4 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -348,19 +348,20 @@ static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
 	 * GPIO recovery is available
 	 */
 	if (!bri->scl_gpiod) {
-		gpiod = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
-		if (PTR_ERR(gpiod) == -EPROBE_DEFER) {
-			ret  = -EPROBE_DEFER;
+		gpiod = devm_gpiod_get_optional(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
 			goto cleanup_pinctrl_state;
 		}
-		if (!IS_ERR(gpiod)) {
+
+		if (gpiod) {
 			bri->scl_gpiod = gpiod;
 			bri->recover_bus = i2c_generic_scl_recovery;
 			dev_info(dev, "using generic GPIOs for recovery\n");
 		}
 	}
 
-	/* SDA GPIOD line is optional, so we care about DEFER only */
+	/* SDA GPIO line is optional */
 	if (!bri->sda_gpiod) {
 		/*
 		 * We have SCL. Pull SCL low and wait a bit so that SDA glitches
@@ -368,18 +369,19 @@ static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
 		 */
 		gpiod_direction_output(bri->scl_gpiod, 0);
 		udelay(10);
-		gpiod = devm_gpiod_get(dev, "sda", GPIOD_IN);
+
+		gpiod = devm_gpiod_get_optional(dev, "sda", GPIOD_IN);
 
 		/* Wait a bit in case of a SDA glitch, and then release SCL. */
 		udelay(10);
 		gpiod_direction_output(bri->scl_gpiod, 1);
 
-		if (PTR_ERR(gpiod) == -EPROBE_DEFER) {
-			ret = -EPROBE_DEFER;
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
 			goto cleanup_pinctrl_state;
 		}
-		if (!IS_ERR(gpiod))
-			bri->sda_gpiod = gpiod;
+
+		bri->sda_gpiod = gpiod;
 	}
 
 cleanup_pinctrl_state:
@@ -401,12 +403,14 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	bool error_or_debug = true;
 	char *err_str;
+	int ret;
 
 	if (!bri)
 		return 0;
 
-	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	ret = i2c_gpio_init_recovery(adap);
+	if (ret)
+		return ret;
 
 	if (!bri->recover_bus) {
 		err_str = "no suitable method provided";
-- 
2.30.2

