Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2DA78EA01
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 12:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344124AbjHaKPY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 06:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344089AbjHaKPW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 06:15:22 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B156CF9
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 03:15:19 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c1d03e124so64797966b.2
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693476918; x=1694081718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvR64YfFykIuTplXHLoUF5TAVVPyghve65irlTx5wBs=;
        b=SC3yyKD7iNfEbNe0MG+sPasDoADlnIZWPSzBNGT74904cArgPLzSgsDf+XOhQ7V3Bk
         05f7j266u0JujmepGzoWDQQsJAKQqF1xTo/6VA9tgBkXQr/4XGSA5AlFs6+12I+PSoxJ
         RkA6a+NhVYvpNSHCXqz++NNUq2utyxsDPDcgJugCBulAdP4xphkxq1iem8z641LN4bsN
         QJwZOMNs32UOWzN9Ke/ItSIbaGttvHJ8/sYIy5ymHZlEqbTB0SfUAcWqFXS8iJL/DSjD
         lNyqmAzx69tEZ4e4vmn2l7tb62QOX2rEQ+gsUZZBFGcQgXsaIPcgHv/uzq7qZe8N5qCd
         eqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693476918; x=1694081718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvR64YfFykIuTplXHLoUF5TAVVPyghve65irlTx5wBs=;
        b=YAU3XoAsdJh5mg6vGcvVVVWEHmBhQzujrcpXsLo88VOU1AYMNY77JFxw9lBWb9ZySg
         dJZDlksmv0K/wuCSfgCA2lmz07owoncAvHEQhg84rHRBiDOaUfp5IakFEEQdnbyblCVt
         83pbya3Wz1G/NeINDLwit3kW0vDeZRvNSovSw0PgrSnv/E0rsvXVh2R/vHxjzju4v2tW
         DHs2goM2cgyLiY26XOcZNFQpdp7ZY5eY0jXxuOzcgghMdisnx4xdngV1h3Xk3CGtU5uw
         mPSpwpwQ1ZXQmUVRu3h7hMjhrWmslGUgatrMwj3LjpoKslPjLan6XmmjZKA0NZBAGrBP
         23TQ==
X-Gm-Message-State: AOJu0YzHFbQumvvKKx8291X12J4OPTdCISd8ZWmd1uoxdkM2yFH/j6tw
        ViOCBr1l8uLVIoZK2khZCmFgUg==
X-Google-Smtp-Source: AGHT+IHeFvkMKGdmFGDJauJfmDmbUJX8j1QoTYP+UxzgbEh6JYzYbvkTBx9QwLxzR5C2nPPRmbBWXQ==
X-Received: by 2002:a17:907:a05b:b0:9a3:7148:503c with SMTP id gz27-20020a170907a05b00b009a37148503cmr3401597ejc.5.1693476917682;
        Thu, 31 Aug 2023 03:15:17 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709062dc500b009a2235ed496sm604388eji.141.2023.08.31.03.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 03:15:17 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: muxes: pca954x: Enable features on MAX7357/MAX7358
Date:   Thu, 31 Aug 2023 12:15:12 +0200
Message-ID: <20230831101513.2042773-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831101513.2042773-1-Naresh.Solanki@9elements.com>
References: <20230831101513.2042773-1-Naresh.Solanki@9elements.com>
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

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Detect that max7357 is being used and run custom init sequence.
Enable additional features based on DT settings and unconditionally
release the shared interrupt pin after 1.6 seconds and allow to use
it as reset.

The init sequence is not run for max7358 that needs to be unlocked
first, but that would need the unimplemented function
i2c_probe_func_quick_write().

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V2:
- Update comments
- Update check for DT properties
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 62 +++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2219062104fb..e4bf72122c9f 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -57,6 +57,23 @@
 
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
+#define MAX7357_CONF_LOCK_UP_CLEAR		BIT(3)
+#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
+#define MAX7357_CONF_BUS_LOCKUP_DETECT_DIS	BIT(5)
+#define MAX7357_CONF_ENABLE_BASIC_MODE		BIT(6)
+#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)
+
+#define MAX7357_POR_DEFAULT_CONF		BIT(0)
+
 enum pca_type {
 	max_7356,
 	max_7357,
@@ -477,6 +494,43 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 	return ret;
 }
 
+static int max7357_init(struct i2c_client *client, struct pca954x *data)
+{
+	struct i2c_adapter *adap = client->adapter;
+	u8 conf = MAX7357_POR_DEFAULT_CONF;
+	int ret;
+
+	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
+		dev_warn(&client->dev, "Device not configured: SMBUS_WRITE_BYTE_DATA is unsupported\n");
+		return pca954x_init(client, data);
+	}
+
+	if (data->idle_state >= 0)
+		data->last_chan = pca954x_regval(data, data->idle_state);
+	else
+		data->last_chan = 0; /* Disconnect multiplexer */
+
+	/*
+	 * The interrupt signal is shared with the reset pin. Release the
+	 * interrupt after 1.6 seconds to allow using the pin as reset.
+	 * The interrupt isn't serviced yet.
+	 */
+	conf |= MAX7357_CONF_RELEASE_INT;
+
+	if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
+		conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
+	if (device_property_read_bool(&client->dev, "maxim,send-flush-out-sequence"))
+		conf |= MAX7357_CONF_FLUSH_OUT;
+	if (device_property_read_bool(&client->dev, "maxim,preconnection-wiggle-test-enable"))
+		conf |= MAX7357_CONF_PRECONNECT_TEST;
+
+	ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
+	if (ret < 0)
+		data->last_chan = 0;
+
+	return ret;
+}
+
 /*
  * I2C init/probing/exit functions
  */
@@ -485,6 +539,7 @@ static int pca954x_probe(struct i2c_client *client)
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
+	struct device_node *node = dev->of_node;
 	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
@@ -560,6 +615,13 @@ static int pca954x_probe(struct i2c_client *client)
 	 * initializes the mux to a channel
 	 * or disconnected state.
 	 */
+	if ((node && of_device_is_compatible(node, "maxim,max7357")) ||
+	    id->driver_data == max_7357)
+		ret = max7357_init(client, data);
+	else if ((node && of_device_is_compatible(node, "maxim,max7358")) ||
+		 id->driver_data == max_7358)
+		dev_warn(dev, "Device not configured: unlock sequence not implemented\n");
+
 	ret = pca954x_init(client, data);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
-- 
2.41.0

