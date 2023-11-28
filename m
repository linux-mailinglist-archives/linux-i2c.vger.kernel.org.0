Return-Path: <linux-i2c+bounces-503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC067FB67B
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 11:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6CF1C21042
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 10:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6204BAAB;
	Tue, 28 Nov 2023 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="DPmy9lQD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D29AE6
	for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 02:00:18 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-332ca7f95e1so3660210f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1701165615; x=1701770415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KM+51/Ab8q9Ob1ygxdet2j1y8TyHO4eFE3VACdVz/qw=;
        b=DPmy9lQD8Oa8gozxHMssDF4akvL8spS8WhcoTdR1cXi/IbG1+0ra0JGQCzaN8hCmUA
         ypV7h25+dNieVZxrWHck5nMFM0Mce2BZ4hkUbp42MsT1FPagR01/z+5gEioByxw7NYFW
         YnP9tvr89pVV+gSQblrhEO3ckPk2mwgv8SojmHjXmTaGuoGWr4ncgXej2A1JmfO//a2Z
         acO4dBWGazMn6FfltV86MRAiaxcbzHM6OASRwGrYmV95UrK0xghrg7bbFAfFcwSh8Nkf
         aEJY8/9trkS3ErMakqIHhjR46415jiHPS502cgc/buo/aVzpNaKX44mDrhg421eIviue
         wRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165615; x=1701770415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KM+51/Ab8q9Ob1ygxdet2j1y8TyHO4eFE3VACdVz/qw=;
        b=WXEy5BfPHm/cipmb/fIWPg3gCLAHPjY/2TABNp4UmHe4wFmzSuecgXAxQz7jm0Mpkg
         WCQUPMXv0f6pAKpcpUs35btgFej7647l+Nh8is2hDGxGIXzSKhDMtosAGyKol98HHrKv
         py/oOBtmjqKWTRyUf5NssyB6pyi3PAkmEf4wWg0JkyfjF85GkhXlrffdYhOo36kKoNeH
         vASNX71ps2ST/vv9NzUhj02CIyMlEc8IJctoYzOnwjLqjODSfT29FzBtlHDrplO/Lpqj
         EKpdWi/eu23Q44D89hPHRPlhOPR7TZ+cO0RFpeu7vMSBY1wsDmFItNqS9CVD+NwL7C/A
         UoCw==
X-Gm-Message-State: AOJu0Yy6oxofAsCI2D5pRJ901wRCrgJdV+N7R0/El+uLfBFVS4FOmG+S
	BfbBJaXoJRfJpPN16OmKY8sGnA==
X-Google-Smtp-Source: AGHT+IGCxctw2ZM4M4swOO43u0BADO9IEzug1carEuaCnXRjujpSdATC0LQNJ2aDdBBmxFQivkVGZA==
X-Received: by 2002:a5d:4a4e:0:b0:332:e715:f0c3 with SMTP id v14-20020a5d4a4e000000b00332e715f0c3mr9596437wrs.60.1701165615169;
        Tue, 28 Nov 2023 02:00:15 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id m5-20020a5d56c5000000b00332cbd59f8bsm14437444wrw.25.2023.11.28.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 02:00:14 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Peter Rosin <peda@axentia.se>
Cc: andi.shyti@kernel.org,
	robh@kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Date: Tue, 28 Nov 2023 10:00:08 +0000
Message-ID: <20231128100009.3727407-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
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


