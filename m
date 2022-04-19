Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4215A506CA3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Apr 2022 14:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243468AbiDSMnt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Apr 2022 08:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350222AbiDSMnq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Apr 2022 08:43:46 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF1436162
        for <linux-i2c@vger.kernel.org>; Tue, 19 Apr 2022 05:41:01 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 21so21132642edv.1
        for <linux-i2c@vger.kernel.org>; Tue, 19 Apr 2022 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GiiakbZrYZsutR3hm5vzK0RdBB42qhkHtdNfJL6cDvs=;
        b=ejE86aBzZk0lLY+LUTq5NPnHSyedt53ZjvUpKNwemaeckBq8/6gjSJ7G4Ay8dDhKIX
         zbuQ8JGKeYiVgQYCPkE8wWA2yCfgzb5Ta6avm4kpblN699qnWIgLiei4msWKt01LKAV/
         h6E9FER+ktjuEoj6YnMZStoo1cJjgydm5CXQ/KG+SzjLPyAVl5N2SmCFMhtoXQoxuMIp
         3jB7V9PMAffDl0fibuG7uiXxCCGSXN+NoV/O27tll1RwSOpicmq8eTGCJNhvQh51JdGx
         hJWtReu8oaugqsVPogHhoyNoUIs5o5w//A6OEw3tRaTERx3FPgPb64DC00MAeExt7LCP
         olTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GiiakbZrYZsutR3hm5vzK0RdBB42qhkHtdNfJL6cDvs=;
        b=QZR8QoCBjCo+dnbdstAfqKBqhcRk5atnUDaoB4ALZytGZ/++GwCJxQSFjXvsPp1zBQ
         DJVfQUxtGjwDxFCqgl1LhoQeDOs5d/JrNaRT/G5O7eIe6w0O71xmsUqc2YN8qLLFtjZ4
         x1hyTIsaoBGH5vCuM3IOJw3Clba+6JhoisWpqklMLXfGOm5SxYcm9Hg4ilZNW8ttsYps
         d2ws7YQfOAqMaoIQw8hrXhStSP2JJxchoCpOx46uuR7hrBNSo+r/FEVii10lG+QOHN2s
         A5IZxrCF86LQQtQuIYRomugzeSWZsGimpdH/0ptkV5Sm5q10ppbuTwn1iVDv1jzSQGwb
         BbkQ==
X-Gm-Message-State: AOAM530I7cGqnXfP5VSWSr/tjrsFiC0jNFfSmhX2ksf4yqS4ntxlbwKg
        2nTvELGF8Hv62tS6SQ2rnlXGjTmE44ivbw==
X-Google-Smtp-Source: ABdhPJxykgeklQlZyEnFcelvkrkDD3D+CdqmV8LKGKMOVdsQ2r73RUHQ4E8CzLqXFlc9BbHtyk/tlA==
X-Received: by 2002:a50:fb0b:0:b0:41d:8cd4:659f with SMTP id d11-20020a50fb0b000000b0041d8cd4659fmr17588944edq.10.1650372060348;
        Tue, 19 Apr 2022 05:41:00 -0700 (PDT)
Received: from fedora.lab.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n27-20020a1709062bdb00b006da975173bfsm5709274ejg.170.2022.04.19.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 05:40:59 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v8 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Date:   Tue, 19 Apr 2022 14:40:23 +0200
Message-Id: <20220419124025.1733230-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419124025.1733230-1-patrick.rudolph@9elements.com>
References: <20220419124025.1733230-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

The MAX7357 and MAX7358 have 6 additional registers called enhanced mode
in the following paragraphs. While the MAX7357 exposes those registers
without a special sequence, the MAX7358 requires an unlock sequence.
The enhanced mode allows to configure optional features which are nice to
have on a I2C mux, but are not mandatory for it's general operation.

As I don't have a MAX7358 for testing the special unlock sequence the
enhanced mode isn't used on the MAX7358, but it could be added later
if required.

The MAX7357 enhanced mode is used to configure:
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
index 4ad665757dd8..122b7a28fc60 100644
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
@@ -50,7 +57,30 @@
 
 #define PCA954X_IRQ_OFFSET 4
 
+/*
+ * MAX7357 exposes 7 registers without extra commands which allow to configure
+ * additional features. Disable interrupts, enable bus locked-up clearing,
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
+	u8 maxim_enhanced_mode;
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
+		.maxim_enhanced_mode = 1,
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
+	if (data->chip->maxim_enhanced_mode) {
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
2.35.1

