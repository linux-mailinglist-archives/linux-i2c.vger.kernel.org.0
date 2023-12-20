Return-Path: <linux-i2c+bounces-898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB80819A76
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 09:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04A26B25AA0
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 08:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF6D1D55B;
	Wed, 20 Dec 2023 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="TnYbtwfb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81001CFB2
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a22deb95d21so628826266b.3
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 00:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1703060889; x=1703665689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsZ/9HB6yqurIFZ++8sH/zT31UdGeaTqC79G9+iRJHI=;
        b=TnYbtwfbauuNmhGkedlV5XQIWbDJ9dFObg4f/+uioRFOHLJ33aZxnEUpaPeNkP+U22
         9WBqnKkVyU/jwM7fx0BdvllAgbTRb5a2zRBXeHZmECSMrvMERrcc9vPuG1lRoEceehRB
         4UkLbV0Un+X8bG20OFCxfQJ4I3h/lWrvG5sP4b3z0dUfsVg+PBWUj3Vrtv/07HQeoy56
         seahj64Ch79Xl6pxJVQGXofcI96D/gwd8TO8A5/3Q8muTnp6rcftzdVoPvNl5d0KMYcH
         eqxi/WEmVXj/kcIkj/QD+jpdDOfHheboXsCjoP7AU1cZ/AQ+Uq3asDnBwH5HaKL3SBcB
         q+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703060889; x=1703665689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsZ/9HB6yqurIFZ++8sH/zT31UdGeaTqC79G9+iRJHI=;
        b=Ed1fQVtxDKkaP+zsZFYEjNUKRtFXN58GjrzxZqZTcrl2GmRRxywjThikXr8IrNpUH5
         jXvHB3fSZbSxHRf70682ULLlqouncz3Ee+4e/oqjvuiwRWpgYy5wYpE0L+OQ2wSZJ/9u
         J6QuvBfu8xJVIxj/KpCVEFikdIEKOG8eFi2U3JMhiwuypk0vGJ7kgEqqUy0iiTE/oXPG
         v1BmCB7DtE4L582eIBpIi4ZH+BCFXY2HUUoel/8P/HPGRT+ki0emi3CPkdXgq+xzKOSo
         hmWXEEkVzoAYDQxV8qaLXjYIIW5FMCv2XhKXHYgQbXLfj3N+BEb0nufBPYBeKhvSJ5Yd
         Xd/Q==
X-Gm-Message-State: AOJu0YyKPnV0iftuIIXoxf7jEXmtRWe05T/ckS78xemaufN7651BJO4u
	hIhd06IztTwKbE5Y/3lKdA7JUvxV2ArA+k9OIbgl8Q==
X-Google-Smtp-Source: AGHT+IFlbu0jo6vmstpx0UVaQeXu2CRGWxUFGIRoAzqhC2OGOUsitD089tzmWvztfqQ85EcnTlmstQ==
X-Received: by 2002:a17:906:2085:b0:a1b:714f:c59d with SMTP id 5-20020a170906208500b00a1b714fc59dmr9868165ejq.30.1703060889101;
        Wed, 20 Dec 2023 00:28:09 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906bc5400b00a26965e4caesm334778ejv.43.2023.12.20.00.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:28:08 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Peter Rosin <peda@axentia.se>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Date: Wed, 20 Dec 2023 13:58:02 +0530
Message-ID: <20231220082803.345153-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231220082803.345153-1-naresh.solanki@9elements.com>
References: <20231220082803.345153-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Enable additional features based on DT settings and unconditionally
release the shared interrupt pin after 1.6 seconds and allow to use
it as reset.

These features aren't enabled by default and it's up to board designer
to validate for proper functioning and detection of devices in secondary
bus as sometimes it can cause secondary bus being disabled.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

---
Changes in V5:
- Fix typos
- Update comment
- Add newline in dev_warn
Changes in V4:
- Drop max7358
- Update #define
- Move conf variable
- Print warning when I2C_FUNC_SMBUS_WRITE_BYTE_DATA isn't supported
Changes in V3:
- Delete unused #define
- Update pca954x_init
- Update commit message
Changes in V2:
- Update comments
- Update check for DT properties
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 43 ++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2219062104fb..f5dfc33b97c0 100644
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
+#define MAX7357_POR_DEFAULT_CONF		MAX7357_CONF_INT_ENABLE
+
 enum pca_type {
 	max_7356,
 	max_7357,
@@ -470,7 +484,34 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 	else
 		data->last_chan = 0; /* Disconnect multiplexer */
 
-	ret = i2c_smbus_write_byte(client, data->last_chan);
+	if (device_is_compatible(&client->dev, "maxim,max7357")) {
+		if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
+			u8 conf = MAX7357_POR_DEFAULT_CONF;
+			/*
+			 * The interrupt signal is shared with the reset pin. Release the
+			 * interrupt after 1.6 seconds to allow using the pin as reset.
+			 */
+			conf |= MAX7357_CONF_RELEASE_INT;
+
+			if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
+				conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
+			if (device_property_read_bool(&client->dev,
+						      "maxim,send-flush-out-sequence"))
+				conf |= MAX7357_CONF_FLUSH_OUT;
+			if (device_property_read_bool(&client->dev,
+						      "maxim,preconnection-wiggle-test-enable"))
+				conf |= MAX7357_CONF_PRECONNECT_TEST;
+
+			ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
+		} else {
+			dev_warn(&client->dev, "Write byte data not supported."
+				 "Cannot enable enhanced mode features\n");
+			ret = i2c_smbus_write_byte(client, data->last_chan);
+		}
+	} else {
+		ret = i2c_smbus_write_byte(client, data->last_chan);
+	}
+
 	if (ret < 0)
 		data->last_chan = 0;
 
-- 
2.41.0


