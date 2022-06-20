Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E149C55276C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 01:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345250AbiFTXBg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 19:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345096AbiFTXBV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 19:01:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0819821268;
        Mon, 20 Jun 2022 16:01:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8DD60B81647;
        Mon, 20 Jun 2022 23:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3044DC3411B;
        Mon, 20 Jun 2022 23:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655766077;
        bh=KWnfCOcy6EMVGZ+IQ1j1MYLRVJmYd3M9MCbfdqtcwy8=;
        h=From:To:Cc:Subject:Date:From;
        b=A+wc3ri+Y0ZgunxbbsOwClAShd6qwCHrUKPc/hX/9bpBFaAbZqUKq0i2i90nuim1a
         L+aqK8Ema22rXkAgb3Dsc8h/yiBVjcZiQBGIFzBtp6LAUb+7f/gv91S7nOB5/k1Tup
         N/KxxGrs3SHxbmb/NY93A4fnQJa2ZcJp8SqUrzrU+L+fVn3fQ1wVWwFjkiNG1NwVHk
         zkVAoegkraCaimTJx8jZUsPDGFHWhOqxLsESsIqjuTJ2r9B5qyo83m3W0pqPPyD+BD
         SiWVcZGBLCzNv+e0PDFpQvHpf3rLOv9Q8ZtiyWq9AzJPvkLYXv06iFli0f1hv9ieqN
         dPCPjPpdgQj5g==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     jarkko.nikula@linux.intel.com
Cc:     dinguyen@kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCHv6 1/2] i2c: designware: introduce a custom scl recovery for SoCFPGA platforms
Date:   Mon, 20 Jun 2022 18:01:08 -0500
Message-Id: <20220620230109.986298-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
thus cannot be recovered by the default method of by doing a GPIO access.
Only a reset of the I2C IP block can a recovery be successful, so this
change effectively resets the I2C controller, NOT any attached clients.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v6: Updated commit log to emphasize this change only resets the I2C
    controller and not any attached clients.
v5: removed strayed nextline
v4: re-arrange code per Andy Shevchenko's recommendation
v3: simplify the function
    update commit message
v2: remove change to MODEL_MASK
    s/i2c_custom_scl_recovery/i2c_socfpga_scl_recovery
---
 drivers/i2c/busses/i2c-designware-core.h    |  1 +
 drivers/i2c/busses/i2c-designware-master.c  | 49 ++++++++++++++++++---
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 3 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 70b80e710990..7b22ec1d6a96 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -303,6 +303,7 @@ struct dw_i2c_dev {
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
 #define MODEL_AMD_NAVI_GPU	BIT(10)
+#define MODEL_SOCFPGA		BIT(11)
 #define MODEL_MASK		GENMASK(11, 8)
 
 /*
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 44a94b225ed8..fa2ea162acbd 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -813,10 +813,26 @@ static void i2c_dw_unprepare_recovery(struct i2c_adapter *adap)
 	i2c_dw_init_master(dev);
 }
 
-static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
+static int i2c_socfpga_scl_recovery(struct i2c_adapter *adap)
+{
+	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
+
+	bri->prepare_recovery(adap);
+	bri->unprepare_recovery(adap);
+
+	return 0;
+}
+
+static int i2c_dw_init_socfpga_recovery_info(struct dw_i2c_dev *dev,
+					     struct i2c_bus_recovery_info *rinfo)
+{
+	rinfo->recover_bus = i2c_socfpga_scl_recovery;
+	return 1;
+}
+
+static int i2c_dw_init_generic_recovery_info(struct dw_i2c_dev *dev,
+					     struct i2c_bus_recovery_info *rinfo)
 {
-	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
-	struct i2c_adapter *adap = &dev->adapter;
 	struct gpio_desc *gpio;
 
 	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
@@ -831,13 +847,34 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	rinfo->sda_gpiod = gpio;
 
 	rinfo->recover_bus = i2c_generic_scl_recovery;
-	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
-	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
-	adap->bus_recovery_info = rinfo;
 
 	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
 		 rinfo->sda_gpiod ? ",sda" : "");
 
+	return 1;
+}
+
+static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
+{
+	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
+	struct i2c_adapter *adap = &dev->adapter;
+	int ret;
+
+	switch (dev->flags & MODEL_MASK) {
+	case MODEL_SOCFPGA:
+		ret = i2c_dw_init_socfpga_recovery_info(dev, rinfo);
+		break;
+	default:
+		ret = i2c_dw_init_generic_recovery_info(dev, rinfo);
+		break;
+	}
+	if (ret <= 0)
+		return ret;
+
+	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
+	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
+	adap->bus_recovery_info = rinfo;
+
 	return 0;
 }
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 70ade5306e45..b33e015e6732 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -153,6 +153,7 @@ static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{ .compatible = "intel,socfpga-i2c", .data = (void *)MODEL_SOCFPGA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
-- 
2.25.1

