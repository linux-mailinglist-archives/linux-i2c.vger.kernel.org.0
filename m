Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27BD77F0F9
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 09:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348361AbjHQHLZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 03:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348375AbjHQHLH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 03:11:07 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFB42D5E
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 00:11:04 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98377c5d53eso955236466b.0
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 00:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692256263; x=1692861063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6lotLojQ1FtLW5br6dNExLIFwwLXzZYXdRfDLzNsvI=;
        b=RqINhEDBx2CQD2y8ECXOvQo/ibRF9CYh3v2VSCewsYuIc/jOfu8DpKV8aNK3vUl99y
         YhDQrgIh4rJUdbfjMJ/Z64Go8dAJxhe0IBnLVENj72V788PaRmYDOFSHTzgV9AWdcy5V
         SaQvtNwC5bcAKJaHUFckvcpbi2FlGomfoNzg4zU0m3cOW/lXUerP/IitHLVfN8uAi0ZC
         AvGyiJHs6VrLxN5Q+f92Xx+3lUsyFtS/RkZT8j8En9zIOYSQ/Icy6RxidgTsySXiwY7u
         2tZ5uPJmRoeqRfc2K/NNJq96wd41zGVjSZj+KaAr1e8IBMTTTTwOXoXwfotllM6UqsHN
         dxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256263; x=1692861063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6lotLojQ1FtLW5br6dNExLIFwwLXzZYXdRfDLzNsvI=;
        b=Y7J7xdEPJmKjbIQfk6u0I729KZcEUjTUKzQLYs6c3WLliR/SebqASbDnPd72z5q08c
         Q0y32Tj6KxCpcKuKhqu0QoONSa7BGtyxHZDLGUEGMSjgtcCCWk1Wdsn+pKF8EQiReU0I
         KtvXmJQ9Kk+Vtri1SEQWCqXV6YSlftc8I4BLfix0BqLWrN6ZndrTHu2nGKI0z7FWpzeA
         91QrC2ZQPUwuQoWiCK8XrYQlNox9Z1BiubMB6FBw4wm0pxsPmMs9UvfAbbLmoJDnPpDV
         /PGQgr9bYsJgR9JeTPkbBIo7/0x04KhtmyrzxRxqpZ4bfQYo3ZAtdwNDbubA8+HIIK3V
         E7jg==
X-Gm-Message-State: AOJu0Yz6OEY+WTQUnJhzx31IHve3AnIwA4SCZH/fw6UaaykFvDdK+5lF
        XpJYLjplo2/uZH58Kvmf8xRwRA7wNkP/FrtPekzcGQ==
X-Google-Smtp-Source: AGHT+IHItXPAsSWcj7ZQeceHrkE1zlRbsJHRTQH9dM9h1AyD5xMkHPT8t5X/7ZlAUFeVBx3g9XUW/A==
X-Received: by 2002:a17:906:300d:b0:99b:d693:cb8e with SMTP id 13-20020a170906300d00b0099bd693cb8emr3305434ejz.71.1692256263250;
        Thu, 17 Aug 2023 00:11:03 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id qn17-20020a170907211100b00992b510089asm9674361ejb.84.2023.08.17.00.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 00:11:02 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     naresh.solanki@9elements.com,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v15 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Date:   Thu, 17 Aug 2023 09:10:52 +0200
Message-ID: <20230817071056.2125679-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
2.41.0

