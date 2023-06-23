Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3101C73C1FA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 23:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbjFWVHi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 17:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbjFWVHa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 17:07:30 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4950D1997;
        Fri, 23 Jun 2023 14:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687554449; x=1719090449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3CL7AMEd4iWfhNY7rztjIZf6Et4SGAj+Z92S97fPh/g=;
  b=uxRTiPCkDFAEc5km3xw1s3WXU03M3UzF1K9b9077NNfEN5APPOTLIjEu
   gI78SRbo4u3zgX4KGA+Cv6cosluuCtAqOg1j1AxrjGTs2JRK7C3zCnXSm
   Kka/EgW79jP9XX9w4x78HU9UKU2fzlq65haCKS4iExnJYPka/1U7XsQRN
   KYQ4uGxojvbllMKnR8tLoaSzG3vWvdANLJmn+hGdWttwEnki55s3VnscK
   v4gev6xBu5YW9kTh8x2Xl55Lxih6ytAGfk+nK3xhWyNS8tgp0nTQMDzez
   mSLsoHEkp9J8lX6ehqbH35+H6F8lNauvaAHZmtDN7iy4GnP314XPIpMa7
   A==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="221705150"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 14:07:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:51:26 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:50:57 -0700
From:   Varshini Rajendran <varshini.rajendran@microchip.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <vkoul@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>,
        <lee@kernel.org>, <ulf.hansson@linaro.org>,
        <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
        <p.zabel@pengutronix.de>, <olivia@selenic.com>,
        <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
        <richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <arnd@arndb.de>,
        <olof@lixom.net>, <soc@kernel.org>, <linux@armlinux.org.uk>,
        <sre@kernel.org>, <jerry.ray@microchip.com>,
        <horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
        <varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
        <alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
        <mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC:     <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
        <balamanikandan.gunasundar@microchip.com>,
        <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
        <nayabbasha.sayed@microchip.com>, <balakrishnan.s@microchip.com>
Subject: [PATCH v2 41/45] ARM: at91: Kconfig: add config flag for SAM9X7 SoC
Date:   Sat, 24 Jun 2023 02:00:52 +0530
Message-ID: <20230623203056.689705-42-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add config flag for sam9x7 SoC.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/mach-at91/Kconfig | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 3dd9e718661b..4e9cb30f5091 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -143,11 +143,28 @@ config SOC_SAM9X60
 	help
 	  Select this if you are using Microchip's SAM9X60 SoC
 
+config SOC_SAM9X7
+	bool "SAM9X7"
+	depends on ARCH_MULTI_V5
+	select ATMEL_AIC5_IRQ
+	select ATMEL_PM if PM
+	select ATMEL_SDRAMC
+	select CPU_ARM926T
+	select HAVE_AT91_USB_CLK
+	select HAVE_AT91_GENERATED_CLK
+	select HAVE_AT91_SAM9X60_PLL
+	select MEMORY
+	select PINCTRL_AT91
+	select SOC_SAM_V4_V5
+	select SRAM if PM
+	help
+	  Select this if you are using Microchip's SAM9X7 SoC
+
 comment "Clocksource driver selection"
 
 config ATMEL_CLOCKSOURCE_PIT
 	bool "Periodic Interval Timer (PIT) support"
-	depends on SOC_AT91SAM9 || SOC_SAM9X60 || SOC_SAMA5
+	depends on SOC_AT91SAM9 || SOC_SAM9X60 || SOC_SAM9X7 || SOC_SAMA5
 	default SOC_AT91SAM9 || SOC_SAMA5
 	select ATMEL_PIT
 	help
@@ -157,7 +174,7 @@ config ATMEL_CLOCKSOURCE_PIT
 
 config ATMEL_CLOCKSOURCE_TCB
 	bool "Timer Counter Blocks (TCB) support"
-	default SOC_AT91RM9200 || SOC_AT91SAM9 || SOC_SAM9X60 || SOC_SAMA5
+	default SOC_AT91RM9200 || SOC_AT91SAM9 || SOC_SAM9X60 || SOC_SAM9X7 || SOC_SAMA5
 	select ATMEL_TCB_CLKSRC
 	help
 	  Select this to get a high precision clocksource based on a
@@ -168,7 +185,7 @@ config ATMEL_CLOCKSOURCE_TCB
 
 config MICROCHIP_CLOCKSOURCE_PIT64B
 	bool "64-bit Periodic Interval Timer (PIT64B) support"
-	default SOC_SAM9X60 || SOC_SAMA7
+	default SOC_SAM9X60 || SOC_SAM9X7 || SOC_SAMA7
 	select MICROCHIP_PIT64B
 	help
 	  Select this to get a high resolution clockevent (SAM9X60) or
-- 
2.25.1

