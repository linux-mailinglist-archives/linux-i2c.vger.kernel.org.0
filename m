Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA5077A02BD
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 13:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbjINLeb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 07:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbjINLe3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 07:34:29 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F69D1FE9
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 04:34:23 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so119207066b.3
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1694691262; x=1695296062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV1vLMgIGx4rvSnOJBSF85XJaepjxLerEmm9st1yuuc=;
        b=M8jdaMwpYsUGNprr4R1C6mpHdu7BaMbT47YAoIQFAqDBHKBd+mY9P02ziI7Ex6Fh5N
         I9cgeLhD8ZYtnuV2dg/07rbnTRKBextdyt9+4aHFCHDDnfoatuHbvSj1JBz6bKGipg8f
         nvH0dkT4jA4in/lcOMCzWD5+PRoyCJBd3/2omF+8XL6740jp7jWH8+6+TiVSpnyzgqxE
         saz2rYgGEm8hP1u5P4nGTCapybkvd3zOVP4kng30wnNzn7xZjkh2vTjJK3nqq04Q3h2Q
         TpzyjDVutanyoFRaUASssJ20EvTL1Cu+nQ+OERhGobTqqDGIBOwj0RWla/VueGGVDsZ5
         /C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694691262; x=1695296062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV1vLMgIGx4rvSnOJBSF85XJaepjxLerEmm9st1yuuc=;
        b=LGNrRldG3Lm9BUfGkPtTXuFGJNuKUZtB6cP0FHzd1rA8gDEaMFiYyl+Otvf1fJN59w
         +h9UFdjje9gbTXglAJ4Tk/5NonTVG63GGGp7XbjPAjcYYDyC5CXYcGz3zpQlOg+Wqe0V
         DMNQBmFQmGKqBMe1F8kyaIiLeG9NDP8DEkHRGesA43UyT/KRjd7K/D/tyehckzR4LWIx
         N8C9VBMZ/qh75qR3SAFV4B1MzAv4pl5WqcO6NoxW/12IqiQ5B3VQHY65/O064WwWCPxU
         PhksQ3KfCuPkmPoeWwFzGUVkIWsd1M9liVpxNUBqhhrcbfq9Sxx4SlIFN/KHexdquvSS
         mkNA==
X-Gm-Message-State: AOJu0YxOI8fjQ3aqtFXh7Uu2B9Akfmivf0yZT+dPKwVxgkbDtcRe36R1
        G5Aq/FL2OG/MlykuX3NaoxLfNg==
X-Google-Smtp-Source: AGHT+IEiO6lUl1syd4gFkJfKzwtfdKEUnNw0/c9PW9DPf2xh/ND4dxFbxRHsrctmMEooYdA1DFFwkA==
X-Received: by 2002:a17:907:789a:b0:9aa:1e2f:7a9c with SMTP id ku26-20020a170907789a00b009aa1e2f7a9cmr4421990ejc.8.1694691262042;
        Thu, 14 Sep 2023 04:34:22 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906854b00b0099ccee57ac2sm875119ejy.194.2023.09.14.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:34:21 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] i2c: muxes: pca954x: Enable features on MAX7357/MAX7358
Date:   Thu, 14 Sep 2023 13:34:15 +0200
Message-ID: <20230914113416.1285518-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914113416.1285518-1-naresh.solanki@9elements.com>
References: <20230914113416.1285518-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

