Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC7F6C6732
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 12:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbjCWLyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 07:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjCWLyO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 07:54:14 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907A436680
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 04:54:02 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eh3so85234044edb.11
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1679572441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJx9YfDeyzKBmS+bcojKFFVZZqBcaFHf4T+2upySREE=;
        b=FtfgqKq1/7haJ9WAkfw6+Xy7oPSakVIZVMc/98M9YgKFQY5VfSjbDRnpIspjYE9KKz
         JtBZhP++MeCavs7Z+oc5nWko5f4TeRY44/bDM2KPelremvLEEE8lyBqV3A+hrn7kHO16
         gksD+fPRUyID82NenW91YfMNjXFLbZS19E1qYTjFhndNZl7JTjMa1klSU5jvEuwVMFSP
         1fku1SjTMwuLaT0uyV5EL46YAkk7jZ29Xqz7J/3c0ESpWoBgbvwoQf/5oX+MjtBCmF0E
         2/dEoMhoMDptGPZBoL+iRJwDIaA5XjlUjF8u+xDH50Gvd8QtoOG3MI2mhhGRLO08SvqW
         oq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679572441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJx9YfDeyzKBmS+bcojKFFVZZqBcaFHf4T+2upySREE=;
        b=VnGSGZ514qeT0UsiiscBaFOEVj2pPXsec4KlKhGVARUqeypIEJ4PniMuHv0MM/cKh8
         VEeKWEXVvAlwHrGKkhzdaZTjhtIqvm5ztXrrACVJt7NLJey8JoAVHmZ7briWnv9rk5zy
         2KO5rz29eaLpObGalPEDalLEuxDEmrxonxOFmAg5xaQ/JfHX2sCS6xsZWMMY2490Hizw
         2KiHSvF1ZNNDdlo0J9+Zm3z+afJyJqCyUVrwrOdR4qTxQkUY9GhGA5/UdzBSHJBraI+v
         r32AFR1Z29DwuAWKNJdA2wMvLr+HgKmzw2FkaUMHLmDV3wH7ZEk/LnENp8GOzqYrcAzk
         RzKw==
X-Gm-Message-State: AO0yUKU2PNKw8sYy2cby+c+eQAMweRMN3oDDj0CVBnDa4+4NlUidLz47
        NhExiAGCvEZUQ89L4of35f2jOA==
X-Google-Smtp-Source: AK7set/NrEbuOHwJpFRQG1FkRG50M/mDWeqRO5IaNseA6sB/foEgSTgtAVk5Nxz23fUc3/wA0wMHOA==
X-Received: by 2002:a17:907:d091:b0:939:fb22:c4c7 with SMTP id vc17-20020a170907d09100b00939fb22c4c7mr11180894ejc.43.1679572440877;
        Thu, 23 Mar 2023 04:54:00 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709064d0500b00923f05b2931sm8510047eju.118.2023.03.23.04.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 04:54:00 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Date:   Thu, 23 Mar 2023 12:53:54 +0100
Message-Id: <20230323115356.2602042-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
References: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/i2c/muxes/i2c-mux-pca954x.c | 60 ++++++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 4 deletions(-)

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
index 0ccee2ae5720..39f313658b18 100644
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
+	max_7367,
+	max_7368,
+	max_7369,
+	max_7356,
+	max_7357,
+	max_7358,
 	pca_9540,
 	pca_9542,
 	pca_9543,
@@ -90,8 +103,41 @@ struct pca954x {
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
+	},
+	[max_7358] = {
+		.nchans = 8,
+		.muxtype = pca954x_isswi,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
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
@@ -177,6 +223,12 @@ static const struct chip_desc chips[] = {
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
@@ -194,6 +246,12 @@ static const struct i2c_device_id pca954x_id[] = {
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
2.39.1

