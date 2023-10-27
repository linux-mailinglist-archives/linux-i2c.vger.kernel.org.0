Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1E97DA100
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 20:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346544AbjJ0SsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 14:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235244AbjJ0Srq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 14:47:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F2D1BCC
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 11:47:23 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32db8f8441eso1632594f8f.0
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 11:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1698432441; x=1699037241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM+51/Ab8q9Ob1ygxdet2j1y8TyHO4eFE3VACdVz/qw=;
        b=hCuE/XxwPWtTF5iPZCADkjYwkp3/0mZ6nKDv0DQRwhpG7VqVl6uaOMi8jODvzcPCKU
         3/rLFVByVldZignqZ8Pu2hoQy4huW4sidrnJtIq5OTI2qgCCK0gVBKjFTehBnURx5ahP
         WvrgmMdLu4wXIcCC0V8qAthInYguwJmi8PpYCzjN4o0MwLIknYh1PJE4XFwPQzn2XLwA
         aLBvZ9o+lFjAoxBo4YvRM0nCXn4NNX3ESvwvNZr104NUKwV/bbrXwIm0TtoC4kehqXOw
         GHddrQwKZCwpvXbPG6uBw3vD6PWijNYwMec8oAGWfi/4kEfrot7lkuvV4AbGpXqcS85U
         aAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698432441; x=1699037241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KM+51/Ab8q9Ob1ygxdet2j1y8TyHO4eFE3VACdVz/qw=;
        b=IhsBV5n5gihLg1RPssdboonjGRicQRtTTkdL/F6v4L8N4THRq3l2maWHWOrBPyIf2D
         ce7Dfb95jIREC9oIlWfcK7/lxTQ5cmUS9HqjX4MRkW15EUq+9diapHeDQIu7zl1SYpQY
         sCSQCIiyyyLffSPEzD+/sfSvFjMENoV9kqaN+9w7tYFCEVFy6O+/WLFC2XKb+nmJruos
         E/yC3EE0zL/sJHUKxXJdTNArt2fU3EQBltUIsvrPSgidgEhDPTyShcOOybrZgBM1JZEM
         kMIsw2lhm4+gdviQMybRrDsYuZsUYWTV4jxZMkBMGZQqckGEKiameGQX6xstVBQ2Rsqq
         kQYg==
X-Gm-Message-State: AOJu0YyE/1pFNhWCIYUmYWuR5gnMNCB6vfOv/3SjAGoKh1FtUJ0uUs6k
        DGsitB2eJIC/LWlSN8C0WOqeNUa+gbEl+F7pou5j+Q==
X-Google-Smtp-Source: AGHT+IFWqlm00BaupR79L1SlcmNEIRt9UdMgo4l4svnvWQ4cGIzxVBiML9tRB/CNAPiaAGmfj7WFSQ==
X-Received: by 2002:a5d:5b0e:0:b0:32d:ad4a:bcef with SMTP id bx14-20020a5d5b0e000000b0032dad4abcefmr3447970wrb.2.1698432440652;
        Fri, 27 Oct 2023 11:47:20 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id j12-20020adfe50c000000b0032d893d8dc8sm2298527wrm.2.2023.10.27.11.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 11:47:20 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     andi.shyti@kernel.org, robh@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Date:   Fri, 27 Oct 2023 18:47:08 +0000
Message-ID: <20231027184709.1541375-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027184709.1541375-1-naresh.solanki@9elements.com>
References: <20231027184709.1541375-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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

