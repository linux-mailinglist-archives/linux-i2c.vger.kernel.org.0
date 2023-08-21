Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4848F78239A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 08:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbjHUGVL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 02:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233385AbjHUGVL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 02:21:11 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1736A2
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:21:07 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so3812136a12.0
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692598866; x=1693203666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T63oHx4mCgWjkztpRdYRdNA8hHPbwN5F4C8d65My+U=;
        b=EpvS0Z2JGi25cb665fjMWh4qXkxgUd2oQpigrrJDlJ6oeb6XnpMy2ewqe0nskvt+7x
         PT2Fm2birbAjZZcDHjSEvPMVmyjfhLpJ5n7ve1w8r6JpW80FB3AqIfKh1dYKYE+wUVWx
         Ou/ls1c0vrS1nu+zYUf7Mtg0uTjMlCU7dU+M14FLar83OXYe2S3eUwcC+tWxYZyZam7X
         weOgtlVvI3SAnsX5PgPPu5zW1J594qofH+rpTQpbPs7n17LV5VblpDCtqCMMQ3Tb9Er9
         KrgKqyX1PQEIOY6H40vU4aPWUlL69mK4TFMs6aXHCFl9d6R3kNUGwemR9oFxBFVFfZi0
         ky1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598866; x=1693203666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T63oHx4mCgWjkztpRdYRdNA8hHPbwN5F4C8d65My+U=;
        b=avE2OZYAI2fKOFy+q6Y+FUjiW+9GR4tWr0hmxfm2ZIKgBj6BDiB+E/J8rrTMy+xlR1
         UF96ZraBUrjVgWPjmGK2yhSirnwCNN/cJVSK6mZkwweqZPUppITB4KpM8W+T4cFb6kBm
         /Slar6vhzgWPVQf5MsymU0SQYqo9JwKg30DlIsaYrHsDKhnrHk7ftPrv5kZUDZbahGir
         KuFakYbo8qeHHaWmGRpM/mzSAoOslWY52sBvnMdqgN9qLphv7iW8M8gw3tWglmfsez3P
         GbwnW1FACdnkJc0i+BAodLHKavhLicKzh9hkxP1V+jtyAJnzf69tZRMr7PTIsHxqg664
         zUXQ==
X-Gm-Message-State: AOJu0YxuWJDRT/ZlVsd8lPxbpIU3Hxcsn/zLNSuwhkjha0MCuzT4wQ4+
        abQOIIJ1wCaFFDvhbCZrqMyZag==
X-Google-Smtp-Source: AGHT+IEYK4lqOqTB3cxbW6Ofi9kIkXd+VFVksT9JATNvaiW9da0BU9I1I8WWSvn/Gfhl2Y90L7s+ng==
X-Received: by 2002:aa7:d058:0:b0:522:4c7a:d5a9 with SMTP id n24-20020aa7d058000000b005224c7ad5a9mr4519275edo.3.1692598865619;
        Sun, 20 Aug 2023 23:21:05 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id c4-20020aa7df04000000b00523b1335618sm5455003edy.97.2023.08.20.23.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 23:21:05 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     naresh.solanki@9elements.com,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v16 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Date:   Mon, 21 Aug 2023 08:20:23 +0200
Message-ID: <20230821062027.2631725-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
References: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/i2c/muxes/i2c-mux-pca954x.c | 67 ++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 4 deletions(-)

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
index 0ccee2ae5720..32873df56e33 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -11,6 +11,12 @@
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
@@ -51,6 +57,12 @@
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
@@ -90,8 +102,49 @@ struct pca954x {
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
+		/*
+		 * No interrupt controller support. The interrupt
+		 * provides information about stuck channels.
+		 */
+	},
+	[max_7358] = {
+		.nchans = 8,
+		.muxtype = pca954x_isswi,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
+		/*
+		 * No interrupt controller support. The interrupt
+		 * provides information about stuck channels.
+		 */
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
@@ -177,6 +230,12 @@ static const struct chip_desc chips[] = {
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
@@ -194,6 +253,12 @@ static const struct i2c_device_id pca954x_id[] = {
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

