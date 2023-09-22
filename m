Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82D4A7AAE1F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 11:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbjIVJcu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 05:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233202AbjIVJcd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 05:32:33 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A317E1981
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 02:31:33 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3214d4ecd39so1744508f8f.1
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 02:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1695375092; x=1695979892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lV1vLMgIGx4rvSnOJBSF85XJaepjxLerEmm9st1yuuc=;
        b=GIjBPaXiHZafVv4dgdY8ptLkNw1I0+IV3ZY4YgvvWe9F0RGXZnMKc2pY4NQto6qChe
         EqCIQNtD/rJgki2HWswC1VblDtseFKZP8ihefyuHh5/4wp0/faY3/Ea7k9y4yXubkaBg
         oXS4OikzRcDOXkMlEyhiXlYTfCuWmSQp+i8CSdqKd4ONGHtUxX3qRJmYDEJ3fyBArcej
         sbX8vAK91tngigC4FJioPfCJpNQInyKGbuTsCl+DSsFgfgOUOaZDwaYvsd80LxS6WZM1
         Gfqsd8ucn+AYlLhBXHR3cfRqhVPfIdeFzQtGPqBXEpFH0taSXhF+7+4dltD1fIaBN0jr
         2Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695375092; x=1695979892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV1vLMgIGx4rvSnOJBSF85XJaepjxLerEmm9st1yuuc=;
        b=j1pAdCwd6oZsyjG0NLph0aCv5q9lBEWf6WAcj5zHlE22TqVLDLriSeR/wx+dltv1gR
         o8eWf0VopbYMZSRVsCpfM2x6wFeIjgbErlK1EGRqbQGNjrkUDPDuQ4ARH+3ZUz4i56OT
         /AelnYXWtiRXJON5vE/hJ+YhcHcvtEks6RcYvwj25QoJblskBv3n+IyUqKLjepWCX23p
         PG1J4ypjgfDBggrkSR8stj0F3X9oAsIcas5F95tk6BHglmZhl2OB5AOLdrhKxoAXkOpn
         8tvWNbP8MyqQrdpmwRW74wi1qOFztyetHhRRNLega/5HAZDCWVonZ5OB/Mobhc83ztl6
         uAzg==
X-Gm-Message-State: AOJu0Yz1d5mWGuMFY/vdeI2e/+dBRdEzrpqh2ZzrP/gjYSlQr6bC/mHd
        9uU31dutmaMzpdpZSUi8ZZBE/A==
X-Google-Smtp-Source: AGHT+IG7989tVVxjAY0hhMJTcXV84q0wlOkDdX1G022GWYzIHacKiKDv5TuWzHf5P1p9+yl1oqePpw==
X-Received: by 2002:a5d:457a:0:b0:317:dd94:ed38 with SMTP id a26-20020a5d457a000000b00317dd94ed38mr6484316wrc.42.1695375091808;
        Fri, 22 Sep 2023 02:31:31 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id y7-20020adfd087000000b00317f70240afsm3929643wrh.27.2023.09.22.02.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 02:31:30 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 2/2] i2c: muxes: pca954x: Enable features on MAX7357/MAX7358
Date:   Fri, 22 Sep 2023 11:31:16 +0200
Message-ID: <20230922093117.3030977-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Detect that max7357 is being used and run custom init sequence.
Enable additional features based on DT settings and unconditionally
release the shared interrupt pin after 1.6 seconds and allow to use
it as reset.

These features aren't enabled by default & its up to board designer
to enable the same as it may have unexpected side effects.

These should be validated for proper functioning & detection of devices
in secondary bus as sometimes it can cause secondary bus being disabled.

The init sequence is not run for max7358 that needs to be unlocked
first, but that would need the unimplemented function
i2c_probe_func_quick_write().

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
Changes in V3:
- Delete unused #define
- Update pca954x_init
- Update commit message

Changes in V2:
- Update comments
- Update check for DT properties
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 38 ++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2219062104fb..91c7c1d13c89 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -57,6 +57,20 @@
 
 #define PCA954X_IRQ_OFFSET 4
 
+/*
+ * MAX7357's configuration register is writeable after POR, but
+ * can be locked by setting the basic mode bit. MAX7358 configuration
+ * register is locked by default and needs to be unlocked first.
+ * The configuration register holds the following settings:
+ */
+#define MAX7357_CONF_INT_ENABLE			BIT(0)
+#define MAX7357_CONF_FLUSH_OUT			BIT(1)
+#define MAX7357_CONF_RELEASE_INT		BIT(2)
+#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
+#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)
+
+#define MAX7357_POR_DEFAULT_CONF		BIT(0)
+
 enum pca_type {
 	max_7356,
 	max_7357,
@@ -463,6 +477,7 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 
 static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 {
+	u8 conf = MAX7357_POR_DEFAULT_CONF;
 	int ret;
 
 	if (data->idle_state >= 0)
@@ -470,7 +485,28 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 	else
 		data->last_chan = 0; /* Disconnect multiplexer */
 
-	ret = i2c_smbus_write_byte(client, data->last_chan);
+	if (device_is_compatible(&client->dev, "maxim,max7357") &&
+	    i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
+		/*
+		 * The interrupt signal is shared with the reset pin. Release the
+		 * interrupt after 1.6 seconds to allow using the pin as reset.
+		 * The interrupt isn't serviced yet.
+		 */
+		conf |= MAX7357_CONF_RELEASE_INT;
+
+		if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
+			conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
+		if (device_property_read_bool(&client->dev, "maxim,send-flush-out-sequence"))
+			conf |= MAX7357_CONF_FLUSH_OUT;
+		if (device_property_read_bool(&client->dev,
+					      "maxim,preconnection-wiggle-test-enable"))
+			conf |= MAX7357_CONF_PRECONNECT_TEST;
+
+		ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
+	} else {
+		ret = i2c_smbus_write_byte(client, data->last_chan);
+	}
+
 	if (ret < 0)
 		data->last_chan = 0;
 
-- 
2.41.0

