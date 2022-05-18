Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5840E52C438
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 22:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242531AbiERUWj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 16:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242520AbiERUW3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 16:22:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18CDEBA9D;
        Wed, 18 May 2022 13:22:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4D3DBB820BF;
        Wed, 18 May 2022 20:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFCBC385A9;
        Wed, 18 May 2022 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652905346;
        bh=hLHKO7qKN+i0jdECk57N3nCVEGIJesNQBGUeRkLQTrg=;
        h=From:To:Cc:Subject:Date:From;
        b=VWFxt0ChnONpIORLUPrOsDgokdX6XJ0Xl6IYDhrDqfY3CUFz+1iWrX1LrvC1T1vqv
         2ZcFQLAmTPagIPJgoyk19yirlUorPByNN6hEzCKRotliwUJrvQdRxY0OxbP2l2KyYG
         2JK267/LEIb13lanePjToO+EMGAThE6q+nYw8A7SSLwGSpQGlGNLvEU/UVgrMqQscR
         K9tOuBqobzrLCo+TDFT7MP1vPRORTAoHw8E7OEHDh97MOmUXekCOR1I03wcz+2Z40k
         g9OJOggQ7sSEFiF1HgMHzRjbKrm8shxyX5Uih3zvO1FhksBi8+orBbZcidxmKW7FDQ
         Brdx2LQwcQ50A==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     jarkko.nikula@linux.intel.com
Cc:     dinguyen@kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] i2c: designware: introduce a custom scl recovery for SoCFPGA platforms
Date:   Wed, 18 May 2022 15:22:16 -0500
Message-Id: <20220518202217.85803-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Only a reset of the I2C IP block can a recovery be successful.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/i2c/busses/i2c-designware-core.h    |  3 ++-
 drivers/i2c/busses/i2c-designware-master.c  | 19 +++++++++++++++++--
 drivers/i2c/busses/i2c-designware-platdrv.c |  2 ++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 70b80e710990..4e997e381fb6 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -303,7 +303,8 @@ struct dw_i2c_dev {
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
 #define MODEL_AMD_NAVI_GPU	BIT(10)
-#define MODEL_MASK		GENMASK(11, 8)
+#define MODEL_SOCFPGA		BIT(11)
+#define MODEL_MASK		GENMASK(12, 8)
 
 /*
  * Enable UCSI interrupt by writing 0xd at register
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 44a94b225ed8..333ad17b967d 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -813,12 +813,29 @@ static void i2c_dw_unprepare_recovery(struct i2c_adapter *adap)
 	i2c_dw_init_master(dev);
 }
 
+static int i2c_custom_scl_recovery(struct i2c_adapter *adap)
+{
+	i2c_dw_prepare_recovery(adap);
+	i2c_dw_unprepare_recovery(adap);
+	return 0;
+}
+
 static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 {
 	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
 	struct i2c_adapter *adap = &dev->adapter;
 	struct gpio_desc *gpio;
 
+	switch (dev->flags & MODEL_MASK) {
+	case MODEL_SOCFPGA:
+		rinfo->recover_bus = i2c_custom_scl_recovery;
+		break;
+	default:
+		rinfo->recover_bus = i2c_generic_scl_recovery;
+		break;
+	}
+	adap->bus_recovery_info = rinfo;
+
 	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
 	if (IS_ERR_OR_NULL(gpio))
 		return PTR_ERR_OR_ZERO(gpio);
@@ -830,10 +847,8 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 		return PTR_ERR(gpio);
 	rinfo->sda_gpiod = gpio;
 
-	rinfo->recover_bus = i2c_generic_scl_recovery;
 	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
 	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
-	adap->bus_recovery_info = rinfo;
 
 	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
 		 rinfo->sda_gpiod ? ",sda" : "");
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 70ade5306e45..92dfe3456ca7 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -153,6 +153,8 @@ static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{ .compatible = "intel,socfpga-i2c", .data = (void *)MODEL_SOCFPGA },
+
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
-- 
2.25.1

