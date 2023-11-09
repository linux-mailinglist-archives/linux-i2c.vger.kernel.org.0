Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C97987E669E
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 10:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbjKIJXj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 04:23:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234333AbjKIJXh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 04:23:37 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F3726B1
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 01:23:35 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so102502066b.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 Nov 2023 01:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1699521814; x=1700126614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM+51/Ab8q9Ob1ygxdet2j1y8TyHO4eFE3VACdVz/qw=;
        b=NyielVkyhghbYaYkE+xEF7ifhuYLssoBlbepRZFZOZX2xpLJMHRZVR4Jxah0zY2GBT
         vG/ICtUL6ZerkuR5zg3tyLQVVZ8LapkyPzpusvA0u0WK93cs2iX3ibeB5LQHdhU7WbsP
         +uMaR6BAi0gHejFg4W06ePQrUGuXibEGqt4LQYFiYm1PcvtPDG1jezrLmMZyti7Uj50r
         E+3ayK094mZruRafd7IkWhM2VIJo2d226gpfopoyTny7+RqpEbcKNcc+ID9SjWcNcbH6
         nIGEHvynq8P9dSqced7oNtvqKqmfxVKU8l1KXzQKloi9OX86Y2zggjMM/TOZW4UNUunx
         fVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699521814; x=1700126614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KM+51/Ab8q9Ob1ygxdet2j1y8TyHO4eFE3VACdVz/qw=;
        b=hOK5p9W/yJ8MqNV6/XkpXBir/ZTHWkacW+RWqYbQve/XeetmczEvDMT9OQD4gXrPsA
         2qkmN1jrpiC4xhiBu+7ZZkeWKEii7oo//ja4EL4iXi95xFJb/OaKEUV9Ref0BSYh7XHB
         KfDDoNWWqxQ8l9dUhHs0bQBHnalGVqGEVVfOKaZUeCBbvVa9sVnhxdGkg9gDTxJkCXBM
         kU9E13ZJ6GiHdPHOG/vCEPcwVzzKq8ZAfZKkg/VEmgPLARkLV+i9YDhELKq1R64DpVvw
         K7TxXzxjqe8QvT8d2Tp0aUgfxlpc9XvYHuXDh932rvLUCo7MF8THO/4YcLzcdoMDebTa
         P+aA==
X-Gm-Message-State: AOJu0YzXvf42I9A8TO8TBH9QTdr//cu6eypJERZfAk6+rWNCAQGz41t9
        I3yFekElwaipet52JjhQSROmUg==
X-Google-Smtp-Source: AGHT+IG8NylJbk6sL0rgMWAxvKR4U7Rs8ENCxcPPyl4ucM5zPQY1D4dVZPN98Dd+djq6QCHybRLZDg==
X-Received: by 2002:a17:907:7f1e:b0:9d5:ecf9:e6a0 with SMTP id qf30-20020a1709077f1e00b009d5ecf9e6a0mr2305594ejc.0.1699521813764;
        Thu, 09 Nov 2023 01:23:33 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id c7-20020a7bc847000000b0040836519dd9sm1453917wml.25.2023.11.09.01.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:23:33 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     andi.shyti@kernel.org, robh@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Date:   Thu,  9 Nov 2023 09:23:27 +0000
Message-ID: <20231109092328.3238241-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109092328.3238241-1-naresh.solanki@9elements.com>
References: <20231109092328.3238241-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

