Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA472532BBA
	for <lists+linux-i2c@lfdr.de>; Tue, 24 May 2022 15:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236993AbiEXNyt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 09:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbiEXNyt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 09:54:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E85B95DC1;
        Tue, 24 May 2022 06:54:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C1E60615AD;
        Tue, 24 May 2022 13:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BA6C385AA;
        Tue, 24 May 2022 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653400487;
        bh=u5EmhhjVWPHe+QKXcXFA8uj/2wXqkYugmdUHptvAmmY=;
        h=From:To:Cc:Subject:Date:From;
        b=c2WHa5t4vBSwboxZwhqf2PB+Hq5e8SJ7+7LZC/lkBVwU4EPPaq/rNlBlqQZjlOyQ1
         /AhhJDfkDrgqoeBVHbXkDvY4aTzRsginP2H4kFPAhvcPaaP8PV530/AmlDFiArier4
         gP0i+JQbwcyXXJSaGWJgES8KAm8r8+9T7GE3n2iCg1VgtjZ5cmmOkS65dM7X5ZgyC9
         WBUOeDikHCPJVYxAKMAU/lZ7ENwX4yaU6r8hkbCYR4MXA14KcRHbVnSIZmKfY0Gpfk
         X2ZwpXv0BD3e0qzmFYk/gqgIIeX61grEGvl0jfG3Io/uT/eeKXeuTPs8o5TEsWHt//
         g30x+nGpkv7zQ==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     jarkko.nikula@linux.intel.com
Cc:     dinguyen@kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCHv2 1/2] i2c: designware: introduce a custom scl recovery for SoCFPGA platforms
Date:   Tue, 24 May 2022 08:54:40 -0500
Message-Id: <20220524135441.420600-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
v2: remove change to MODEL_MASK
    s/i2c_custom_scl_recovery/i2c_socfpga_scl_recovery
---
 drivers/i2c/busses/i2c-designware-core.h    |  1 +
 drivers/i2c/busses/i2c-designware-master.c  | 19 +++++++++++++++++--
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 3 files changed, 19 insertions(+), 2 deletions(-)

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
index 44a94b225ed8..843d4bbab9cc 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -813,12 +813,29 @@ static void i2c_dw_unprepare_recovery(struct i2c_adapter *adap)
 	i2c_dw_init_master(dev);
 }
 
+static int i2c_socfpga_scl_recovery(struct i2c_adapter *adap)
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
+		rinfo->recover_bus = i2c_socfpga_scl_recovery;
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

