Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85DD46E219C
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 13:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjDNLC4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 07:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjDNLCn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 07:02:43 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77EA65A8
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 04:02:15 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id i3so7765752wrc.4
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 04:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681470122; x=1684062122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bm4XIRxI6fOd57JSedvLIb3BsQi8yvkHPmjONnmY8qA=;
        b=ZKDm/Utnz7B+P0cx8wom+oVOGG7goIDQhr8ySuW4sVZsI0yIlLIcesoNg1zFLrDspK
         E4BwC9Movk1U7FXzBE+aMU4aT2SRK4MBdc+q+YIdr5+8FJpSgBvifRWcZifQpl1lCgL0
         h855eES0W+4RARaLQq51qb1TYCe7WV8nvF80moNqi6dcvDY4jJPHKDNSCNgQPUh25jBS
         kWdFGISAD43pi0qA/XxlHrqQeZ1B0W++LVGoxRwRbRBwmV79N/sCAXVB61SqsAIUoWWh
         87xyvJhqMkR4G5DplSX9hseYA8Xm9DcvD5Jm0+S9hiW+9Fg4nzS1lF1N7jfvyu1iwyBj
         EG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681470122; x=1684062122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm4XIRxI6fOd57JSedvLIb3BsQi8yvkHPmjONnmY8qA=;
        b=Ej5KtgdFiF3kSUTw5YsaTAjp4BQY0Nb0N1wTLs5/Z3fFgGfNhyhQjaxH6mKfuhG3lu
         cghdYrfATJtaz9JNNR3+QxlhzCAdxuhaNSeYstUKJHK9unPxYrV/BWDaVWYLMsoW5Hnm
         L7qasjv1K1pAaynktfvGE0EGshvu1KOUlscfZF35kri6IlZJPyW8eGM23HQRW202/Oq6
         Sl/jkgkzaKL2+2n3abMWkd5KCQjynHQSYSAyMGRQmaA9XfJ+KuNI+nbSDB+4uGkLG7I6
         0e7EUqLIa/0qg1myO9LUZtmexdxPKEq5JRiPD3f6woFEyZMGgWtKuRrO5O8is1IamBZ+
         fnJw==
X-Gm-Message-State: AAQBX9d+GShan2b9dUMO9B7SbvmXnjfiC7Xp5yXpTXPNkeO+0j7H6xRS
        mtTE96kwhf60435WGniBAsma5A==
X-Google-Smtp-Source: AKy350ZMH7ZJTFArG6jbUb6EUVw45X4b4tt0Yf//dxA3nXRJuAVNQMjmpiDfGaBotx8iUD2+3dsTyw==
X-Received: by 2002:a5d:6e53:0:b0:2ef:eb54:4dc0 with SMTP id j19-20020a5d6e53000000b002efeb544dc0mr3701909wrz.51.1681470122051;
        Fri, 14 Apr 2023 04:02:02 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id u6-20020a5d6ac6000000b002f2789d1bcfsm3328830wrw.21.2023.04.14.04.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:02:01 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Date:   Fri, 14 Apr 2023 13:01:35 +0200
Message-Id: <20230414110137.401356-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414110137.401356-1-patrick.rudolph@9elements.com>
References: <20230414110137.401356-1-patrick.rudolph@9elements.com>
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
2.39.2

