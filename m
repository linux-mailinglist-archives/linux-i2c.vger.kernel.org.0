Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E0F6F2FD3
	for <lists+linux-i2c@lfdr.de>; Mon,  1 May 2023 11:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjEAJQI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 May 2023 05:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbjEAJQD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 May 2023 05:16:03 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67221AE
        for <linux-i2c@vger.kernel.org>; Mon,  1 May 2023 02:16:00 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94f6c285d92so462215766b.3
        for <linux-i2c@vger.kernel.org>; Mon, 01 May 2023 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1682932559; x=1685524559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQeLaD3HUZbD2Ee3JfwMlwyfJrMSNuv/+sgPjlCpSVc=;
        b=TvhGRJGTK89DC0+U4lIRW+jv5IeBkYB5JNILcUIgu1mHGLN14ptqmmQHWK4CMX8JYU
         GokEDh2j1R9NWkT16/PSOYTLWtkd8tw3TRfImrsNREAAK3Gspkg94QAJQcbXXU4jvVkd
         8pyKNjDa3hnTq10wo0V6muWENjUTBn2uo/bsp+Fu59Zi/0uF5ETm5AEZNXlo8mVnaoZ2
         Fcvcttmm2Kt63DVk4+pwJq4c7eIFSKYE7jySDK8sl7L+L8TnTUIF1UKr2mXVFiuTxV/4
         2pNTlLMaVJeUEjwXYHVLVC1iLvTRyVdRTSwh/UemlcchVAEpSpfZRfPt3g1szDP7sDUN
         qVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682932559; x=1685524559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQeLaD3HUZbD2Ee3JfwMlwyfJrMSNuv/+sgPjlCpSVc=;
        b=LUkwg/ZsDsBJ0S/qYRwn9Dha0ctMPddbSG7l0tAoqtcmRmMA6idE4huAo6oH3mw7iu
         owkFim7Pif4GT798vfCeh7h5g1JQ7L/8j9y4OIoYJU8FucLdfV6Rjb53XSPjRr0s7tlN
         Y4zZfggHl+KVhHeOzs7Vih9VpzNCHWxuzpRIhKDgaIdIj6DQEL9XD8FDASs8islhaCOT
         PJDifWTgr7U0aj7wzNL9iZGepF2lRtxI4rF0IXUB5ZNca46iPH1QlSWggvufSfV0ZewG
         kHvkEHKLcisOGCREOU4+3fCP8w7EBauLVkQhS9mLlr8ljPyauw5puOrQ8gEZbsKvP+4E
         OTzA==
X-Gm-Message-State: AC+VfDyDGxrWsOm01cZPJbeHN+2J4qMp0+K/3gJjd5aOwhWCwfZCyQkt
        6YLN2zQ97ejYcAdI0Su2J/k3xA==
X-Google-Smtp-Source: ACHHUZ7LMzO3p4PsUnv9BbyEsQ4mDxsTpVPrsv8tedfXsc2elSsmvw1CgHgA2MrnBJuWb0QFwYyIJg==
X-Received: by 2002:a17:907:1b08:b0:961:be96:b0e6 with SMTP id mp8-20020a1709071b0800b00961be96b0e6mr317390ejc.68.1682932559076;
        Mon, 01 May 2023 02:15:59 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id xa3-20020a170907b9c300b0094e954fd015sm14714266ejc.175.2023.05.01.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 02:15:58 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Date:   Mon,  1 May 2023 11:15:50 +0200
Message-Id: <20230501091552.847240-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501091552.847240-1-patrick.rudolph@9elements.com>
References: <20230501091552.847240-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the following Maxim chips using the existing PCA954x
driver:
- MAX7356
- MAX7357
- MAX7358
- MAX7367
- MAX7368
- MAX7369

All added Maxim chips behave like the PCA954x, where a single SMBUS byte
write selects up to 8 channels to be bridged to the primary bus.

While the MAX7357/MAX7358 have interrupt support, they don't act as
interrupt controller like the PCA9545 does. Thus don't enable IRQ support
and handle them like the PCA9548.

Tested using the MAX7357.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/i2c/muxes/Kconfig           |  6 +--
 drivers/i2c/muxes/i2c-mux-pca954x.c | 64 ++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index ea838dbae32e..db1b9057612a 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
 	  will be called i2c-mux-pca9541.
 
 config I2C_MUX_PCA954x
-	tristate "NXP PCA954x and PCA984x I2C Mux/switches"
+	tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
 	depends on GPIOLIB || COMPILE_TEST
 	help
-	  If you say yes here you get support for the NXP PCA954x
-	  and PCA984x I2C mux/switch devices.
+	  If you say yes here you get support for NXP PCA954x/PCA984x
+	  and Maxim MAX735x/MAX736x I2C mux/switch devices.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-pca954x.
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 0ccee2ae5720..968111442625 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
  * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
+ * Copyright (c) 2022 9elements GmbH <patrick.rudolph@9elements.com>
  *
  * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
  * chips made by NXP Semiconductors.
@@ -11,6 +12,12 @@
  *	 PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
  *	 PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
  *
+ * It's also compatible to Maxims MAX735x I2C switch chips, which are controlled
+ * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
+ *
+ * This includes the:
+ *	 MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
+ *
  * These chips are all controlled via the I2C bus itself, and all have a
  * single 8-bit register. The upstream "parent" bus fans out to two,
  * four, or eight downstream busses or channels; which of these
@@ -51,6 +58,12 @@
 #define PCA954X_IRQ_OFFSET 4
 
 enum pca_type {
+	max_7356,
+	max_7357,
+	max_7358,
+	max_7367,
+	max_7368,
+	max_7369,
 	pca_9540,
 	pca_9542,
 	pca_9543,
@@ -90,8 +103,45 @@ struct pca954x {
 	raw_spinlock_t lock;
 };
 
-/* Provide specs for the PCA954x types we know about */
+/* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
 static const struct chip_desc chips[] = {
+	[max_7356] = {
+		.nchans = 8,
+		.muxtype = pca954x_isswi,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
+	},
+	[max_7357] = {
+		.nchans = 8,
+		.muxtype = pca954x_isswi,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
+		/* No interrupt controller support.
+		   The interrupt provides information about stuck channels. */
+	},
+	[max_7358] = {
+		.nchans = 8,
+		.muxtype = pca954x_isswi,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
+		/* No interrupt controller support.
+		   The interrupt provides information about stuck channels. */
+	},
+	[max_7367] = {
+		.nchans = 4,
+		.muxtype = pca954x_isswi,
+		.has_irq = 1,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
+	},
+	[max_7368] = {
+		.nchans = 4,
+		.muxtype = pca954x_isswi,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
+	},
+	[max_7369] = {
+		.nchans = 4,
+		.enable = 0x4,
+		.muxtype = pca954x_ismux,
+		.has_irq = 1,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
+	},
 	[pca_9540] = {
 		.nchans = 2,
 		.enable = 0x4,
@@ -177,6 +227,12 @@ static const struct chip_desc chips[] = {
 };
 
 static const struct i2c_device_id pca954x_id[] = {
+	{ "max7356", max_7356 },
+	{ "max7357", max_7357 },
+	{ "max7358", max_7358 },
+	{ "max7367", max_7367 },
+	{ "max7368", max_7368 },
+	{ "max7369", max_7369 },
 	{ "pca9540", pca_9540 },
 	{ "pca9542", pca_9542 },
 	{ "pca9543", pca_9543 },
@@ -194,6 +250,12 @@ static const struct i2c_device_id pca954x_id[] = {
 MODULE_DEVICE_TABLE(i2c, pca954x_id);
 
 static const struct of_device_id pca954x_of_match[] = {
+	{ .compatible = "maxim,max7356", .data = &chips[max_7356] },
+	{ .compatible = "maxim,max7357", .data = &chips[max_7357] },
+	{ .compatible = "maxim,max7358", .data = &chips[max_7358] },
+	{ .compatible = "maxim,max7367", .data = &chips[max_7367] },
+	{ .compatible = "maxim,max7368", .data = &chips[max_7368] },
+	{ .compatible = "maxim,max7369", .data = &chips[max_7369] },
 	{ .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
 	{ .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
 	{ .compatible = "nxp,pca9543", .data = &chips[pca_9543] },
-- 
2.39.2

