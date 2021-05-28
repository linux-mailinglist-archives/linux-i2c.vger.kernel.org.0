Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6985393FA2
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 11:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbhE1JPK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 05:15:10 -0400
Received: from mga02.intel.com ([134.134.136.20]:32115 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234967AbhE1JPJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 05:15:09 -0400
IronPort-SDR: QgrU6mBBd4z6qej/kxakXkpI3PsEOUH1Z00hMM0I7uJOOs07sB74K8DzFxl+78znduAapWCkNO
 oEghAcqJ3eRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="190040211"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="190040211"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:13:34 -0700
IronPort-SDR: 9w4uSKreoXGZPMZikJmizy0IOVXPpcwXWsO0G2R2+zOTfY75UchsXRmhA+8tVemaOoNcv/9lp5
 trbTOBBfW3MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="473013704"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 28 May 2021 02:13:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4E9EBB7; Fri, 28 May 2021 12:13:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] i2c: core: Propagate all possible errors when requesting recovery GPIOs
Date:   Fri, 28 May 2021 12:13:51 +0300
Message-Id: <20210528091351.70699-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210528091351.70699-1-andriy.shevchenko@linux.intel.com>
References: <20210528091351.70699-1-andriy.shevchenko@linux.intel.com>
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
v2: made it as a series to avoid error when applying (LKP)
 drivers/i2c/i2c-core-base.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae1b1b610aca..40b8aa91db9a 100644
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
 	bool is_error_level = true;
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

