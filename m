Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE47D4AB7B4
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 10:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbiBGJhT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 04:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351398AbiBGJ3G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 04:29:06 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A99C043181
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 01:29:05 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id k25so39812142ejp.5
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O0k8KhFMdBtBZFFVKWcjCSCyxGIr4s4QCXxRmW6v5O8=;
        b=dMUN3by6U4hZHRUiyZbQB88dim8pVI3xH+nIf5rpOYvAVUV2YKffWyoloOS8+mSB9B
         VI6r88auKKMD2YhbE78umjv84fl3CCk+r3EnrAeD8tF9Ca0ZVHfMW17eJdpoIRV9LRaP
         VUHRr07wnma+mo5Xvj8TB1AdmiDCsugE5j83JS52b+LcR13tHhWI7V6RT6oi0k5LYULg
         eVNuNr2NuH6M/WAyANBxUH0r81Fb/FwgmXP2OnbrR1YtQFe/BDlglDpzwlzEBMhannX4
         hYFPz3gSmH7kR4oSFLFCUKJ7La8fSc6MlWFIEb56ivEKO/ZaemdxjcoI3r4QzqqGkhV5
         +V1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O0k8KhFMdBtBZFFVKWcjCSCyxGIr4s4QCXxRmW6v5O8=;
        b=kvGA7ox+/wmv8jGh4DmtZ3kh7HDYkfooOACKJ+TljNWlgR7u7J8nUy4ngFfc76dETv
         VnWk8WVifvmI6swbe3TCOUyzV+8vmfXfp6Cn/tI3OG4Xk+mhpiU/ErLET3dLud/+b1pG
         Dp9uDZ3UvL3aRVchTm3yrCufbZA/rcQeCvTcWJdUc4Ppb5H2esjHvCtE0UB1prex8Wkh
         t1BWYNi6VraORZ1nxHU2mc7bGgJww9l6BaAgLDRo1VXElwDvH8Segh2y58CpL9Gq2sSf
         2i2t2l83Vy6tLjRCisnh9PfxRbUr5TqBWqmxZA8te+bAX6mTB5B+iKSJm0oMWz7WB8lR
         6iUg==
X-Gm-Message-State: AOAM531DFRl8vlWdSWFAGGp60pVmn613w4NAk2ySltIPRLpXqcFkI36c
        tfrGRONNHNCTbBKFgc6tlSQ07HRuikizSw==
X-Google-Smtp-Source: ABdhPJz+aQNvytf0rYMcnO0YPZsmW4+5G3DWaE54m44kEpckybhe3lTAjf9Li2zm6+YgM+bcv+O10w==
X-Received: by 2002:a17:907:8a27:: with SMTP id sc39mr9354396ejc.314.1644226144461;
        Mon, 07 Feb 2022 01:29:04 -0800 (PST)
Received: from fedora.. (ip-088-153-139-166.um27.pools.vodafone-ip.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id g9sm3487059ejm.152.2022.02.07.01.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 01:29:04 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v4 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Date:   Mon,  7 Feb 2022 10:28:25 +0100
Message-Id: <20220207092827.104978-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207092827.104978-1-patrick.rudolph@9elements.com>
References: <20220207092827.104978-1-patrick.rudolph@9elements.com>
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

The MAX7357 exposes 6 additional registers at Power-On-Reset and is
configured to:
 - Disabled interrupts on bus locked up detection
 - Enable bus locked-up clearing
 - Disconnect only locked bus instead of all channels

While the MAX7357/MAX7358 have interrupt support, they don't act as
interrupt controller like the PCA9545 does. Thus don't enable IRQ support
and handle them like the PCA9548.

Tested using the MAX7357 and verified that the stalled bus is disconnected
while the other channels remain operational.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/i2c/muxes/Kconfig           |  4 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c | 92 +++++++++++++++++++++++++++--
 2 files changed, 90 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index 1708b1a82da2..2ac99d044199 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
 	  will be called i2c-mux-pca9541.
 
 config I2C_MUX_PCA954x
-	tristate "NXP PCA954x and PCA984x I2C Mux/switches"
+	tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
 	depends on GPIOLIB || COMPILE_TEST
 	help
 	  If you say yes here you get support for the NXP PCA954x
-	  and PCA984x I2C mux/switch devices.
+	  and PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-pca954x.
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 4ad665757dd8..33b9a6a1fffa 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
  * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
+ * Copyright (c) 2022 Patrick Rudolph <patrick.rudolph@9elements.com>
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
@@ -50,7 +57,30 @@
 
 #define PCA954X_IRQ_OFFSET 4
 
+/*
+ * MAX7357 exposes 7 registers on POR which allow to configure additional
+ * features. Disable interrupts, enable bus locked-up clearing,
+ * isolate only the locked channel instead of all channels.
+ */
+#define MAX7357_CONF_INT_ENABLE			BIT(0)
+#define MAX7357_CONF_FLUSH_OUT			BIT(1)
+#define MAX7357_CONF_RELEASE_INT		BIT(2)
+#define MAX7357_CONF_LOCK_UP_CLEAR		BIT(3)
+#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
+#define MAX7357_CONF_BUS_LOCKUP_DETECTION	BIT(5)
+#define MAX7357_CONF_ENABLE_BASIC_MODE		BIT(6)
+#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)
+
+#define MAX7357_CONF_DEFAULTS (MAX7357_CONF_FLUSH_OUT | \
+	 MAX7357_CONF_DISCON_SINGLE_CHAN)
+
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
@@ -69,6 +99,7 @@ struct chip_desc {
 	u8 nchans;
 	u8 enable;	/* used for muxes only */
 	u8 has_irq;
+	u8 max7357;
 	enum muxtype {
 		pca954x_ismux = 0,
 		pca954x_isswi
@@ -90,8 +121,42 @@ struct pca954x {
 	raw_spinlock_t lock;
 };
 
-/* Provide specs for the PCA954x types we know about */
+/* Provide specs for the PCA954x and MAX735x types we know about */
 static const struct chip_desc chips[] = {
+	[max_7356] = {
+		.nchans = 8,
+		.muxtype = pca954x_isswi,
+		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
+	},
+	[max_7357] = {
+		.nchans = 8,
+		.muxtype = pca954x_isswi,
+		.max7357 = 1,
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
@@ -177,6 +242,12 @@ static const struct chip_desc chips[] = {
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
@@ -194,6 +265,12 @@ static const struct i2c_device_id pca954x_id[] = {
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
@@ -401,9 +478,16 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 	else
 		data->last_chan = 0; /* Disconnect multiplexer */
 
-	ret = i2c_smbus_write_byte(client, data->last_chan);
-	if (ret < 0)
-		data->last_chan = 0;
+	if (data->chip->max7357) {
+		ret = i2c_smbus_write_byte_data(client, data->last_chan,
+						MAX7357_CONF_DEFAULTS);
+		if (ret < 0)
+			data->last_chan = 0;
+	} else {
+		ret = i2c_smbus_write_byte(client, data->last_chan);
+		if (ret < 0)
+			data->last_chan = 0;
+	}
 
 	return ret;
 }
-- 
2.34.1

