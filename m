Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896E57B9F34
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Oct 2023 16:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbjJEOUT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 10:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233256AbjJEOSc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 10:18:32 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C698528122
        for <linux-i2c@vger.kernel.org>; Thu,  5 Oct 2023 06:45:47 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3231d67aff2so1022782f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 05 Oct 2023 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1696513546; x=1697118346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBNNqrHa2yEgalSP+O5HBVONjN/jujiaMQ0nBzAx80Q=;
        b=cTG7cnIzvKHOhK0kwfVA9Y7CLfmjOXRwT/M+qp64BaXVK5NNBP9Ix9qCmvQOhhy7Ho
         zmu4FDrEVY6p++aHNcRyGwQ8fMYehcZQ84Z1Wv7chKWwvGV5d7aAqYODr4dktMxZAZxS
         1Xj7bBHncvsIM6yZZlxLZUF0jpQc+SXoGD/RcoXoreHQC97CbyBeB0Q5Jb6pgwbPF42v
         IsJgSCCA25RB9doZAxPnBWF/oMoz7Bkm1h7dJSIaBDhoKa8tzDPHh/TNWYA2Fwe+NUmR
         3j3oE1egSXmSCcWpVBlW6TYAlsCWHjyiy3G9hntgJfgGWCA2qygFdVN17SWK/PT6v7+m
         UIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696513546; x=1697118346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBNNqrHa2yEgalSP+O5HBVONjN/jujiaMQ0nBzAx80Q=;
        b=KJ4W0BxAqLZ9pFDzuLOFur/efuK58HSTUV25IuVIVj00Wy9dQioWi71ju+avnKY6HE
         9h3butnllRhq/OJEski+CJta6+0mBRi7vd8xSCtdntfS1L1qGPTkQ78/Tn458VOpvjvf
         6JcEZ+FVowKkumizGDcSTp2Q1JzFk1YFN22NL/4bOhzUDiYnece6pvJZtwbnY3wkyy66
         o4Vt2on1b/TWaVrdppuvHaaBEKKQHCb/NSsbQw8ujZvoZujUNdt8BPJ1g5YrfW+UrPXq
         fD3OrByiaMx84YUWFhY745I8RjPAYm0ijkhm2Bf6JGqfarIEq7AELxK8stto5U2E1vik
         HTjw==
X-Gm-Message-State: AOJu0YxKq65fVEOsjMxFOEOas91kJqm3OTHOuWAJ6goMQXQXUsvKt+4C
        F/L3h7KrcpXjU1WDO8eA27/rjw==
X-Google-Smtp-Source: AGHT+IEvfbDlg11EPVS8AQqyquwChxDq+IH+GS2d7jqezFdZKEXMtTj5xoMdMZ6QcwuKu6QiN/BJMQ==
X-Received: by 2002:a5d:4990:0:b0:320:a16:7028 with SMTP id r16-20020a5d4990000000b003200a167028mr5185033wrq.31.1696513546176;
        Thu, 05 Oct 2023 06:45:46 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id d7-20020adfef87000000b0032326908972sm1840961wro.17.2023.10.05.06.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 06:45:45 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Date:   Thu,  5 Oct 2023 15:45:40 +0200
Message-ID: <20231005134541.947727-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005134541.947727-1-naresh.solanki@9elements.com>
References: <20231005134541.947727-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

These features aren't enabled by default & its up to board designer
to enable the same as it may have unexpected side effects.

These should be validated for proper functioning & detection of devices
in secondary bus as sometimes it can cause secondary bus being disabled.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
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
 drivers/i2c/muxes/i2c-mux-pca954x.c | 44 ++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2219062104fb..f37ce332078c 100644
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
@@ -470,7 +484,35 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 	else
 		data->last_chan = 0; /* Disconnect multiplexer */
 
-	ret = i2c_smbus_write_byte(client, data->last_chan);
+	if (device_is_compatible(&client->dev, "maxim,max7357")) {
+		if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
+			u8 conf = MAX7357_POR_DEFAULT_CONF;
+			/*
+			 * The interrupt signal is shared with the reset pin. Release the
+			 * interrupt after 1.6 seconds to allow using the pin as reset.
+			 * The interrupt isn't serviced yet.
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
+			dev_warn(&client->dev,
+				 "Write byte not supported. Cannot enable enhanced mode features");
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

