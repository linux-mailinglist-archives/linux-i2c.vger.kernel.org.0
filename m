Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C9358F823
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 09:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234350AbiHKHK7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 03:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234346AbiHKHK5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 03:10:57 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B96647E2
        for <linux-i2c@vger.kernel.org>; Thu, 11 Aug 2022 00:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=gqt9Q9WucgCdGlad70NWyt4Md/Z
        A7SQcDXpyS5vvu4Q=; b=G2BGIRuF5a/MF74IokdoP0coT4r6dfKS6kCIqn4FKUw
        IseBr71MaPQzQgl8ONlUV0acYnq5YWxC5k/uLgf52yG0QSJzckxUBMGEXOU6T2ca
        l0WX3FfCnl3gmVWEq9nqM0xzNYLjkWUhbszGe81pTxjja5OayaUOcNdIk7bDHcj0
        =
Received: (qmail 947841 invoked from network); 11 Aug 2022 09:10:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2022 09:10:49 +0200
X-UD-Smtp-Session: l3s3148p1@6W4+3fHlT+IucrFA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: move drivers from strlcpy to strscpy
Date:   Thu, 11 Aug 2022 09:10:30 +0200
Message-Id: <20220811071030.3388-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Follow the advice of the below link and prefer 'strscpy'. Conversion is
easy because no driver used the return value and has been done with a
simple sed invocation.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-altera.c         | 2 +-
 drivers/i2c/busses/i2c-aspeed.c         | 2 +-
 drivers/i2c/busses/i2c-au1550.c         | 2 +-
 drivers/i2c/busses/i2c-axxia.c          | 2 +-
 drivers/i2c/busses/i2c-bcm-kona.c       | 2 +-
 drivers/i2c/busses/i2c-brcmstb.c        | 2 +-
 drivers/i2c/busses/i2c-cbus-gpio.c      | 2 +-
 drivers/i2c/busses/i2c-cht-wc.c         | 2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 2 +-
 drivers/i2c/busses/i2c-davinci.c        | 2 +-
 drivers/i2c/busses/i2c-digicolor.c      | 2 +-
 drivers/i2c/busses/i2c-eg20t.c          | 2 +-
 drivers/i2c/busses/i2c-emev2.c          | 2 +-
 drivers/i2c/busses/i2c-exynos5.c        | 2 +-
 drivers/i2c/busses/i2c-gpio.c           | 2 +-
 drivers/i2c/busses/i2c-highlander.c     | 2 +-
 drivers/i2c/busses/i2c-hix5hd2.c        | 2 +-
 drivers/i2c/busses/i2c-i801.c           | 4 ++--
 drivers/i2c/busses/i2c-ibm_iic.c        | 2 +-
 drivers/i2c/busses/i2c-icy.c            | 2 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c      | 2 +-
 drivers/i2c/busses/i2c-lpc2k.c          | 2 +-
 drivers/i2c/busses/i2c-meson.c          | 2 +-
 drivers/i2c/busses/i2c-mt65xx.c         | 2 +-
 drivers/i2c/busses/i2c-mt7621.c         | 2 +-
 drivers/i2c/busses/i2c-mv64xxx.c        | 2 +-
 drivers/i2c/busses/i2c-mxs.c            | 2 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c     | 2 +-
 drivers/i2c/busses/i2c-omap.c           | 2 +-
 drivers/i2c/busses/i2c-opal.c           | 4 ++--
 drivers/i2c/busses/i2c-parport.c        | 2 +-
 drivers/i2c/busses/i2c-pxa.c            | 2 +-
 drivers/i2c/busses/i2c-qcom-geni.c      | 2 +-
 drivers/i2c/busses/i2c-qup.c            | 2 +-
 drivers/i2c/busses/i2c-rcar.c           | 2 +-
 drivers/i2c/busses/i2c-riic.c           | 2 +-
 drivers/i2c/busses/i2c-rk3x.c           | 2 +-
 drivers/i2c/busses/i2c-s3c2410.c        | 2 +-
 drivers/i2c/busses/i2c-sh_mobile.c      | 2 +-
 drivers/i2c/busses/i2c-simtec.c         | 2 +-
 drivers/i2c/busses/i2c-taos-evm.c       | 2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c     | 2 +-
 drivers/i2c/busses/i2c-tegra.c          | 2 +-
 drivers/i2c/busses/i2c-uniphier-f.c     | 2 +-
 drivers/i2c/busses/i2c-uniphier.c       | 2 +-
 drivers/i2c/busses/i2c-versatile.c      | 2 +-
 drivers/i2c/busses/i2c-wmt.c            | 2 +-
 47 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 354cf7e45c4a..50e7f3f670b6 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -447,7 +447,7 @@ static int altr_i2c_probe(struct platform_device *pdev)
 	mutex_unlock(&idev->isr_mutex);
 
 	i2c_set_adapdata(&idev->adapter, idev);
-	strlcpy(idev->adapter.name, pdev->name, sizeof(idev->adapter.name));
+	strscpy(idev->adapter.name, pdev->name, sizeof(idev->adapter.name));
 	idev->adapter.owner = THIS_MODULE;
 	idev->adapter.algo = &altr_i2c_algo;
 	idev->adapter.dev.parent = &pdev->dev;
diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 771e53d3d197..185dedfebbac 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1022,7 +1022,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	bus->adap.algo = &aspeed_i2c_algo;
 	bus->adap.dev.parent = &pdev->dev;
 	bus->adap.dev.of_node = pdev->dev.of_node;
-	strlcpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
+	strscpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
 	i2c_set_adapdata(&bus->adap, bus);
 
 	bus->dev = &pdev->dev;
diff --git a/drivers/i2c/busses/i2c-au1550.c b/drivers/i2c/busses/i2c-au1550.c
index 22aed922552b..99bd24d0e6a5 100644
--- a/drivers/i2c/busses/i2c-au1550.c
+++ b/drivers/i2c/busses/i2c-au1550.c
@@ -321,7 +321,7 @@ i2c_au1550_probe(struct platform_device *pdev)
 	priv->adap.algo = &au1550_algo;
 	priv->adap.algo_data = priv;
 	priv->adap.dev.parent = &pdev->dev;
-	strlcpy(priv->adap.name, "Au1xxx PSC I2C", sizeof(priv->adap.name));
+	strscpy(priv->adap.name, "Au1xxx PSC I2C", sizeof(priv->adap.name));
 
 	/* Now, set up the PSC for SMBus PIO mode. */
 	i2c_au1550_setup(priv);
diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 5294b73beca8..bdf3b50de8ad 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -783,7 +783,7 @@ static int axxia_i2c_probe(struct platform_device *pdev)
 	}
 
 	i2c_set_adapdata(&idev->adapter, idev);
-	strlcpy(idev->adapter.name, pdev->name, sizeof(idev->adapter.name));
+	strscpy(idev->adapter.name, pdev->name, sizeof(idev->adapter.name));
 	idev->adapter.owner = THIS_MODULE;
 	idev->adapter.algo = &axxia_i2c_algo;
 	idev->adapter.bus_recovery_info = &axxia_i2c_recovery_info;
diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 8e350f20cde0..e8fc395b27b4 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -849,7 +849,7 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	adap = &dev->adapter;
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
-	strlcpy(adap->name, "Broadcom I2C adapter", sizeof(adap->name));
+	strscpy(adap->name, "Broadcom I2C adapter", sizeof(adap->name));
 	adap->algo = &bcm_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 3ba6cbbe84ac..352e33cc2603 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -684,7 +684,7 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 	adap = &dev->adapter;
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
-	strlcpy(adap->name, dev_name(&pdev->dev), sizeof(adap->name));
+	strscpy(adap->name, dev_name(&pdev->dev), sizeof(adap->name));
 	adap->algo = &brcmstb_i2c_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
diff --git a/drivers/i2c/busses/i2c-cbus-gpio.c b/drivers/i2c/busses/i2c-cbus-gpio.c
index f8639a4457d2..d97c61eec95c 100644
--- a/drivers/i2c/busses/i2c-cbus-gpio.c
+++ b/drivers/i2c/busses/i2c-cbus-gpio.c
@@ -245,7 +245,7 @@ static int cbus_i2c_probe(struct platform_device *pdev)
 	adapter->nr		= pdev->id;
 	adapter->timeout	= HZ;
 	adapter->algo		= &cbus_i2c_algo;
-	strlcpy(adapter->name, "CBUS I2C adapter", sizeof(adapter->name));
+	strscpy(adapter->name, "CBUS I2C adapter", sizeof(adapter->name));
 
 	spin_lock_init(&chost->lock);
 	chost->dev = &pdev->dev;
diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index de15f09c9b47..190abdc46dd3 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -404,7 +404,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 	adap->adapter.class = I2C_CLASS_HWMON;
 	adap->adapter.algo = &cht_wc_i2c_adap_algo;
 	adap->adapter.lock_ops = &cht_wc_i2c_adap_lock_ops;
-	strlcpy(adap->adapter.name, "PMIC I2C Adapter",
+	strscpy(adap->adapter.name, "PMIC I2C Adapter",
 		sizeof(adap->adapter.name));
 	adap->adapter.dev.parent = &pdev->dev;
 
diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 892213d51f43..4e787dc709f9 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -267,7 +267,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
 	bus->dev = dev;
 
 	bus->adap.owner = THIS_MODULE;
-	strlcpy(bus->adap.name, "cros-ec-i2c-tunnel", sizeof(bus->adap.name));
+	strscpy(bus->adap.name, "cros-ec-i2c-tunnel", sizeof(bus->adap.name));
 	bus->adap.algo = &ec_i2c_algorithm;
 	bus->adap.algo_data = bus;
 	bus->adap.dev.parent = &pdev->dev;
diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 9e09db31a937..471c47db546b 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -845,7 +845,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
-	strlcpy(adap->name, "DaVinci I2C adapter", sizeof(adap->name));
+	strscpy(adap->name, "DaVinci I2C adapter", sizeof(adap->name));
 	adap->algo = &i2c_davinci_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 60c838c7c454..50925d97fa42 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -322,7 +322,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	strlcpy(i2c->adap.name, "Conexant Digicolor I2C adapter",
+	strscpy(i2c->adap.name, "Conexant Digicolor I2C adapter",
 		sizeof(i2c->adap.name));
 	i2c->adap.owner = THIS_MODULE;
 	i2c->adap.algo = &dc_i2c_algorithm;
diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 321b2770feab..4914bfbee2a9 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -773,7 +773,7 @@ static int pch_i2c_probe(struct pci_dev *pdev,
 
 		pch_adap->owner = THIS_MODULE;
 		pch_adap->class = I2C_CLASS_HWMON;
-		strlcpy(pch_adap->name, KBUILD_MODNAME, sizeof(pch_adap->name));
+		strscpy(pch_adap->name, KBUILD_MODNAME, sizeof(pch_adap->name));
 		pch_adap->algo = &pch_algorithm;
 		pch_adap->algo_data = &adap_info->pch_data[i];
 
diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index bdff0e6345d9..f2e537b137b2 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -371,7 +371,7 @@ static int em_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	strlcpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
+	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
 
 	priv->sclk = devm_clk_get(&pdev->dev, "sclk");
 	if (IS_ERR(priv->sclk))
diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index b812d1090c0f..4a6260d04db2 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -802,7 +802,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "clock-frequency", &i2c->op_clock))
 		i2c->op_clock = I2C_MAX_STANDARD_MODE_FREQ;
 
-	strlcpy(i2c->adap.name, "exynos5-i2c", sizeof(i2c->adap.name));
+	strscpy(i2c->adap.name, "exynos5-i2c", sizeof(i2c->adap.name));
 	i2c->adap.owner   = THIS_MODULE;
 	i2c->adap.algo    = &exynos5_i2c_algorithm;
 	i2c->adap.retries = 3;
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 7a048abbf92b..b1985c1667e1 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -436,7 +436,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->owner = THIS_MODULE;
 	if (np)
-		strlcpy(adap->name, dev_name(dev), sizeof(adap->name));
+		strscpy(adap->name, dev_name(dev), sizeof(adap->name));
 	else
 		snprintf(adap->name, sizeof(adap->name), "i2c-gpio%d", pdev->id);
 
diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index a2add128d084..4374a8677271 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -402,7 +402,7 @@ static int highlander_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
-	strlcpy(adap->name, "HL FPGA I2C adapter", sizeof(adap->name));
+	strscpy(adap->name, "HL FPGA I2C adapter", sizeof(adap->name));
 	adap->algo = &highlander_i2c_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->nr = pdev->id;
diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 61ae58f57047..0e34cbaca22d 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -423,7 +423,7 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 	}
 	clk_prepare_enable(priv->clk);
 
-	strlcpy(priv->adap.name, "hix5hd2-i2c", sizeof(priv->adap.name));
+	strscpy(priv->adap.name, "hix5hd2-i2c", sizeof(priv->adap.name));
 	priv->dev = &pdev->dev;
 	priv->adap.owner = THIS_MODULE;
 	priv->adap.algo = &hix5hd2_i2c_algorithm;
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 9e5b87e107ba..46e58c0f9c97 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1116,7 +1116,7 @@ static void dmi_check_onboard_device(u8 type, const char *name,
 
 		memset(&info, 0, sizeof(struct i2c_board_info));
 		info.addr = dmi_devices[i].i2c_addr;
-		strlcpy(info.type, dmi_devices[i].i2c_type, I2C_NAME_SIZE);
+		strscpy(info.type, dmi_devices[i].i2c_type, I2C_NAME_SIZE);
 		i2c_new_client_device(adap, &info);
 		break;
 	}
@@ -1267,7 +1267,7 @@ static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
 
 	memset(&info, 0, sizeof(struct i2c_board_info));
 	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
-	strlcpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
+	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
 	i2c_new_client_device(&priv->adapter, &info);
 }
 
diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index 9f71daf6db64..eeb80e34f9ad 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -738,7 +738,7 @@ static int iic_probe(struct platform_device *ofdev)
 	adap = &dev->adap;
 	adap->dev.parent = &ofdev->dev;
 	adap->dev.of_node = of_node_get(np);
-	strlcpy(adap->name, "IBM IIC", sizeof(adap->name));
+	strscpy(adap->name, "IBM IIC", sizeof(adap->name));
 	i2c_set_adapdata(adap, dev);
 	adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
 	adap->algo = &iic_algo;
diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index 5dae7cab7260..febcb6f01d4d 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -141,7 +141,7 @@ static int icy_probe(struct zorro_dev *z,
 	i2c->adapter.owner = THIS_MODULE;
 	/* i2c->adapter.algo assigned by i2c_pcf_add_bus() */
 	i2c->adapter.algo_data = algo_data;
-	strlcpy(i2c->adapter.name, "ICY I2C Zorro adapter",
+	strscpy(i2c->adapter.name, "ICY I2C Zorro adapter",
 		sizeof(i2c->adapter.name));
 
 	if (!devm_request_mem_region(&z->dev,
diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 8b9ba055c418..b51ab3cad2b1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -558,7 +558,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->adapter.algo		= &lpi2c_imx_algo;
 	lpi2c_imx->adapter.dev.parent	= &pdev->dev;
 	lpi2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
-	strlcpy(lpi2c_imx->adapter.name, pdev->name,
+	strscpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
 
 	lpi2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 4e30c5267142..8fff6fbb7065 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -417,7 +417,7 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.owner = THIS_MODULE;
-	strlcpy(i2c->adap.name, "LPC2K I2C adapter", sizeof(i2c->adap.name));
+	strscpy(i2c->adap.name, "LPC2K I2C adapter", sizeof(i2c->adap.name));
 	i2c->adap.algo = &i2c_lpc2k_algorithm;
 	i2c->adap.dev.parent = &pdev->dev;
 	i2c->adap.dev.of_node = pdev->dev.of_node;
diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 61cc5b2462c6..889eff06b78f 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -502,7 +502,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	strlcpy(i2c->adap.name, "Meson I2C adapter",
+	strscpy(i2c->adap.name, "Meson I2C adapter",
 		sizeof(i2c->adap.name));
 	i2c->adap.owner = THIS_MODULE;
 	i2c->adap.algo = &meson_i2c_algorithm;
diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index bdecb78bfc26..8cedb73e3bd1 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1389,7 +1389,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		speed_clk = I2C_MT65XX_CLK_MAIN;
 	}
 
-	strlcpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
+	strscpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
 
 	ret = mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
 	if (ret) {
diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index cfe6de8175dd..20eda5738ac4 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -312,7 +312,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	i2c_set_adapdata(adap, i2c);
 	adap->dev.of_node = pdev->dev.of_node;
-	strlcpy(adap->name, dev_name(&pdev->dev), sizeof(adap->name));
+	strscpy(adap->name, dev_name(&pdev->dev), sizeof(adap->name));
 
 	platform_set_drvdata(pdev, i2c);
 
diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 103a05ecc3d6..047dfef7a657 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -989,7 +989,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	if (IS_ERR(drv_data->reg_base))
 		return PTR_ERR(drv_data->reg_base);
 
-	strlcpy(drv_data->adapter.name, MV64XXX_I2C_CTLR_NAME " adapter",
+	strscpy(drv_data->adapter.name, MV64XXX_I2C_CTLR_NAME " adapter",
 		sizeof(drv_data->adapter.name));
 
 	init_waitqueue_head(&drv_data->waitq);
diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 68f67d084c63..5af5cffc444e 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -838,7 +838,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 		return err;
 
 	adap = &i2c->adapter;
-	strlcpy(adap->name, "MXS I2C adapter", sizeof(adap->name));
+	strscpy(adap->name, "MXS I2C adapter", sizeof(adap->name));
 	adap->owner = THIS_MODULE;
 	adap->algo = &mxs_i2c_algo;
 	adap->quirks = &mxs_i2c_quirks;
diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 6920c1b9a126..12e330cd7635 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -299,7 +299,7 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	i2c_set_adapdata(&i2cd->adapter, i2cd);
 	i2cd->adapter.owner = THIS_MODULE;
-	strlcpy(i2cd->adapter.name, "NVIDIA GPU I2C adapter",
+	strscpy(i2cd->adapter.name, "NVIDIA GPU I2C adapter",
 		sizeof(i2cd->adapter.name));
 	i2cd->adapter.algo = &gpu_i2c_algorithm;
 	i2cd->adapter.quirks = &gpu_i2c_quirks;
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d4f6c6d60683..f9ae520aed22 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1488,7 +1488,7 @@ omap_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(adap, omap);
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
-	strlcpy(adap->name, "OMAP I2C adapter", sizeof(adap->name));
+	strscpy(adap->name, "OMAP I2C adapter", sizeof(adap->name));
 	adap->algo = &omap_i2c_algo;
 	adap->quirks = &omap_i2c_quirks;
 	adap->dev.parent = &pdev->dev;
diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index 6eb0f50c5d28..9f773b4f5ed8 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -220,9 +220,9 @@ static int i2c_opal_probe(struct platform_device *pdev)
 	adapter->dev.of_node = of_node_get(pdev->dev.of_node);
 	pname = of_get_property(pdev->dev.of_node, "ibm,port-name", NULL);
 	if (pname)
-		strlcpy(adapter->name, pname, sizeof(adapter->name));
+		strscpy(adapter->name, pname, sizeof(adapter->name));
 	else
-		strlcpy(adapter->name, "opal", sizeof(adapter->name));
+		strscpy(adapter->name, "opal", sizeof(adapter->name));
 
 	platform_set_drvdata(pdev, adapter);
 	rc = i2c_add_adapter(adapter);
diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
index 231145c48728..0af86a542568 100644
--- a/drivers/i2c/busses/i2c-parport.c
+++ b/drivers/i2c/busses/i2c-parport.c
@@ -308,7 +308,7 @@ static void i2c_parport_attach(struct parport *port)
 	/* Fill the rest of the structure */
 	adapter->adapter.owner = THIS_MODULE;
 	adapter->adapter.class = I2C_CLASS_HWMON;
-	strlcpy(adapter->adapter.name, "Parallel port adapter",
+	strscpy(adapter->adapter.name, "Parallel port adapter",
 		sizeof(adapter->adapter.name));
 	adapter->algo_data = parport_algo_data;
 	/* Slow down if we can't sense SCL */
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 690188a9ffff..b605b6e43cb9 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1403,7 +1403,7 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	spin_lock_init(&i2c->lock);
 	init_waitqueue_head(&i2c->wait);
 
-	strlcpy(i2c->adap.name, "pxa_i2c-i2c", sizeof(i2c->adap.name));
+	strscpy(i2c->adap.name, "pxa_i2c-i2c", sizeof(i2c->adap.name));
 
 	i2c->clk = devm_clk_get(&dev->dev, NULL);
 	if (IS_ERR(i2c->clk)) {
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6ac179a373ff..15c906ed0e09 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -816,7 +816,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&gi2c->adap, gi2c);
 	gi2c->adap.dev.parent = dev;
 	gi2c->adap.dev.of_node = dev->of_node;
-	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
+	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, "qup-memory");
 	if (ret)
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 69e9f3ecf87d..2e153f2f71b6 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1878,7 +1878,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
 	qup->adap.dev.of_node = pdev->dev.of_node;
 	qup->is_last = true;
 
-	strlcpy(qup->adap.name, "QUP I2C adapter", sizeof(qup->adap.name));
+	strscpy(qup->adap.name, "QUP I2C adapter", sizeof(qup->adap.name));
 
 	pm_runtime_set_autosuspend_delay(qup->dev, MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(qup->dev);
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 6e7be9d9f504..cef82b205c26 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1076,7 +1076,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	adap->bus_recovery_info = &rcar_i2c_bri;
 	adap->quirks = &rcar_i2c_quirks;
 	i2c_set_adapdata(adap, priv);
-	strlcpy(adap->name, pdev->name, sizeof(adap->name));
+	strscpy(adap->name, pdev->name, sizeof(adap->name));
 
 	/* Init DMA */
 	sg_init_table(&priv->sg, 1);
diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index cded77e06670..ecba1dfc1278 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -448,7 +448,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	adap = &riic->adapter;
 	i2c_set_adapdata(adap, riic);
-	strlcpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));
+	strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));
 	adap->owner = THIS_MODULE;
 	adap->algo = &riic_algo;
 	adap->dev.parent = &pdev->dev;
diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 989040a73626..2e98e7793bba 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1240,7 +1240,7 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	/* use common interface to get I2C timing properties */
 	i2c_parse_fw_timings(&pdev->dev, &i2c->t, true);
 
-	strlcpy(i2c->adap.name, "rk3x-i2c", sizeof(i2c->adap.name));
+	strscpy(i2c->adap.name, "rk3x-i2c", sizeof(i2c->adap.name));
 	i2c->adap.owner = THIS_MODULE;
 	i2c->adap.algo = &rk3x_i2c_algorithm;
 	i2c->adap.retries = 3;
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index b49a1b170bb2..36dab9cd208c 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1076,7 +1076,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	else
 		s3c24xx_i2c_parse_dt(pdev->dev.of_node, i2c);
 
-	strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->adap.name));
+	strscpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->adap.name));
 	i2c->adap.owner = THIS_MODULE;
 	i2c->adap.algo = &s3c24xx_i2c_algorithm;
 	i2c->adap.retries = 2;
diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 72f024a0c363..29330ee64c9c 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -940,7 +940,7 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
 	adap->nr = dev->id;
 	adap->dev.of_node = dev->dev.of_node;
 
-	strlcpy(adap->name, dev->name, sizeof(adap->name));
+	strscpy(adap->name, dev->name, sizeof(adap->name));
 
 	spin_lock_init(&pd->lock);
 	init_waitqueue_head(&pd->wait);
diff --git a/drivers/i2c/busses/i2c-simtec.c b/drivers/i2c/busses/i2c-simtec.c
index 458c7bcf1d24..87701744752f 100644
--- a/drivers/i2c/busses/i2c-simtec.c
+++ b/drivers/i2c/busses/i2c-simtec.c
@@ -99,7 +99,7 @@ static int simtec_i2c_probe(struct platform_device *dev)
 	pd->adap.algo_data = &pd->bit;
 	pd->adap.dev.parent = &dev->dev;
 
-	strlcpy(pd->adap.name, "Simtec I2C", sizeof(pd->adap.name));
+	strscpy(pd->adap.name, "Simtec I2C", sizeof(pd->adap.name));
 
 	pd->bit.data = pd;
 	pd->bit.setsda = simtec_i2c_setsda;
diff --git a/drivers/i2c/busses/i2c-taos-evm.c b/drivers/i2c/busses/i2c-taos-evm.c
index b4050f5b6746..b0f0120793e1 100644
--- a/drivers/i2c/busses/i2c-taos-evm.c
+++ b/drivers/i2c/busses/i2c-taos-evm.c
@@ -239,7 +239,7 @@ static int taos_connect(struct serio *serio, struct serio_driver *drv)
 		dev_err(&serio->dev, "TAOS EVM identification failed\n");
 		goto exit_close;
 	}
-	strlcpy(adapter->name, name, sizeof(adapter->name));
+	strscpy(adapter->name, name, sizeof(adapter->name));
 
 	/* Turn echo off for better performance */
 	taos->state = TAOS_STATE_EOFF;
diff --git a/drivers/i2c/busses/i2c-tegra-bpmp.c b/drivers/i2c/busses/i2c-tegra-bpmp.c
index ec0c7cad4240..95139985b2d5 100644
--- a/drivers/i2c/busses/i2c-tegra-bpmp.c
+++ b/drivers/i2c/busses/i2c-tegra-bpmp.c
@@ -305,7 +305,7 @@ static int tegra_bpmp_i2c_probe(struct platform_device *pdev)
 
 	i2c_set_adapdata(&i2c->adapter, i2c);
 	i2c->adapter.owner = THIS_MODULE;
-	strlcpy(i2c->adapter.name, "Tegra BPMP I2C adapter",
+	strscpy(i2c->adapter.name, "Tegra BPMP I2C adapter",
 		sizeof(i2c->adapter.name));
 	i2c->adapter.algo = &tegra_bpmp_i2c_algo;
 	i2c->adapter.dev.parent = &pdev->dev;
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2941e42aa6a0..031c78ac42e6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1825,7 +1825,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->hw->supports_bus_clear)
 		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
 
-	strlcpy(i2c_dev->adapter.name, dev_name(i2c_dev->dev),
+	strscpy(i2c_dev->adapter.name, dev_name(i2c_dev->dev),
 		sizeof(i2c_dev->adapter.name));
 
 	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index cb4666c54a23..d7b622891e52 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -564,7 +564,7 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
 	priv->adap.algo = &uniphier_fi2c_algo;
 	priv->adap.dev.parent = dev;
 	priv->adap.dev.of_node = dev->of_node;
-	strlcpy(priv->adap.name, "UniPhier FI2C", sizeof(priv->adap.name));
+	strscpy(priv->adap.name, "UniPhier FI2C", sizeof(priv->adap.name));
 	priv->adap.bus_recovery_info = &uniphier_fi2c_bus_recovery_info;
 	i2c_set_adapdata(&priv->adap, priv);
 	platform_set_drvdata(pdev, priv);
diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index ee00a44bf4c7..e3ebae381f08 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -358,7 +358,7 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 	priv->adap.algo = &uniphier_i2c_algo;
 	priv->adap.dev.parent = dev;
 	priv->adap.dev.of_node = dev->of_node;
-	strlcpy(priv->adap.name, "UniPhier I2C", sizeof(priv->adap.name));
+	strscpy(priv->adap.name, "UniPhier I2C", sizeof(priv->adap.name));
 	priv->adap.bus_recovery_info = &uniphier_i2c_bus_recovery_info;
 	i2c_set_adapdata(&priv->adap, priv);
 	platform_set_drvdata(pdev, priv);
diff --git a/drivers/i2c/busses/i2c-versatile.c b/drivers/i2c/busses/i2c-versatile.c
index 8d980b1374a8..1ab419f8fa52 100644
--- a/drivers/i2c/busses/i2c-versatile.c
+++ b/drivers/i2c/busses/i2c-versatile.c
@@ -79,7 +79,7 @@ static int i2c_versatile_probe(struct platform_device *dev)
 	writel(SCL | SDA, i2c->base + I2C_CONTROLS);
 
 	i2c->adap.owner = THIS_MODULE;
-	strlcpy(i2c->adap.name, "Versatile I2C adapter", sizeof(i2c->adap.name));
+	strscpy(i2c->adap.name, "Versatile I2C adapter", sizeof(i2c->adap.name));
 	i2c->adap.algo_data = &i2c->algo;
 	i2c->adap.dev.parent = &dev->dev;
 	i2c->adap.dev.of_node = dev->dev.of_node;
diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 88f5aafdce5b..7d4bc8736079 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -413,7 +413,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 
 	adap = &i2c_dev->adapter;
 	i2c_set_adapdata(adap, i2c_dev);
-	strlcpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
+	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
 	adap->owner = THIS_MODULE;
 	adap->algo = &wmt_i2c_algo;
 	adap->dev.parent = &pdev->dev;
-- 
2.35.1

