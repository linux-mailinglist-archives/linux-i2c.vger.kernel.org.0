Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A01F612C09
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 18:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiJ3Rws (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 13:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ3Rwr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 13:52:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6294FA465;
        Sun, 30 Oct 2022 10:52:46 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j15so13093897wrq.3;
        Sun, 30 Oct 2022 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28Iwy7WKJjysP3FQcTD5YLfwHgdLEiUyOzIwRxaeXuY=;
        b=UHI2eGkxHl4aC1YV3nhvbQT8zM5JFKOSbltNjzKAW2i+nPhDjx5ApRDTLz5LtYuObJ
         oo94xgCk31E76rnXugf46SP5rzis++enI0d7swa9X4pxJXZEGSsJjuWKU4CSM4gz9U8V
         2RAYOnUUfKYsLty66lpzo2pWHyETXq0HTp9GI6QvGaM2AATcoDyYapdImddSTha/mdIY
         moI5LzDdRlGPeSFRF5N5u8oYrUk+kmE1RhnvYKENZvwZR63qVem/Bfm9AdCuJjAr1N/E
         9jKjgXjLd6enEQNUPZSyCzwOlvhsTxTM1dXdE/hT/+Rq7m7vYgaxwEK7PrkhWhptq0fm
         jj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28Iwy7WKJjysP3FQcTD5YLfwHgdLEiUyOzIwRxaeXuY=;
        b=ZTYV1P7TXRUEU9IR7ZVisn5dQm35Ibp04JwIFS3pFdhgOUVFeZOaEPPcBeGoVfGLNZ
         uj43N4cqnl/MTrJu+O2wZQpgjciXjDJndX0Q6J643+HpOidu2DTbIPoU9Z4D0+DKbBVO
         pdKsLXPUybm1hQGIdaqbzdmjoRQELrMPJLFrMgONEmHep9sKDSfwrN0GMHqcR8o1HhEw
         EWX6hCkduYlyPbY+XPhYxfnZq2KXE7KEs6BU4G+nTR2DNF1P4fgUb3kSfnv71rsN5a7P
         EB6PZInaQhKwdOv10CAYOrugwitoxprDJeZ3fgqkds4FZGmFYkytz1NUNetVNusvEIu/
         PshA==
X-Gm-Message-State: ACrzQf0GRctzX86gJ3PFF1am0eSTSaDbNCAlpC3iUS8E9qTqlfWi5G0J
        MtlA0CWGqSmtdaozRX1DqigZdAM6uj8=
X-Google-Smtp-Source: AMsMyM7Bk0qhnhi2+JXqmzSYgeY05l4LgJUOCCXgkcpFF2YfG5Tnv6QuKENysbvax5HVFa+HDygjzw==
X-Received: by 2002:adf:a31c:0:b0:236:ba0d:246b with SMTP id c28-20020adfa31c000000b00236ba0d246bmr3615120wrb.448.1667152364691;
        Sun, 30 Oct 2022 10:52:44 -0700 (PDT)
Received: from localhost.localdomain (188.red-83-35-57.dynamicip.rima-tde.net. [83.35.57.188])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe58d000000b002366f300e57sm4815074wrm.23.2022.10.30.10.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 10:52:44 -0700 (PDT)
From:   Angel Iglesias <ang.iglesiasg@gmail.com>
To:     linux-iio@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] i2c: core: Introduce i2c_client_get_device_id helper function
Date:   Sun, 30 Oct 2022 18:52:18 +0100
Message-Id: <aeac9f372ffe0013757e261229e6e23f76f2d8f9.1667151588.git.ang.iglesiasg@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667151588.git.ang.iglesiasg@gmail.com>
References: <cover.1667151588.git.ang.iglesiasg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduces new helper function to aid in .probe_new() refactors. In order
to use existing i2c_get_device_id() on the probe callback, the device
match table needs to be accessible in that function, which would require
bigger refactors in some drivers using the deprecated .probe callback.

This issue was discussed in more detail in the IIO mailing list.

Link: https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koenig@pengutronix.de/
Suggested-by: Nuno Sá <noname.nuno@gmail.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angel Iglesias <ang.iglesiasg@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 15 +++++++++++++++
 include/linux/i2c.h         |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b4edf10e8fd0..e6623226e393 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2236,6 +2236,21 @@ int i2c_get_device_id(const struct i2c_client *client,
 }
 EXPORT_SYMBOL_GPL(i2c_get_device_id);
 
+/**
+ * i2c_client_get_device_id - get the driver match table entry of a device
+ * @client: the device to query
+ *
+ * Returns a pointer to the matching entry if found, NULL otherwise.
+ */
+const struct i2c_device_id *i2c_client_get_device_id(const struct i2c_client *client)
+{
+	const struct i2c_driver *drv = to_i2c_driver(client->dev.driver);
+
+	return i2c_match_id(drv->id_table, client);
+
+}
+EXPORT_SYMBOL_GPL(i2c_client_get_device_id);
+
 /* ----------------------------------------------------
  * the i2c address scanning function
  * Will not work for 10-bit addresses!
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f7c49bbdb8a1..d84e0e99f084 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -189,6 +189,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 					      u8 *values);
 int i2c_get_device_id(const struct i2c_client *client,
 		      struct i2c_device_identity *id);
+const struct i2c_device_id *i2c_client_get_device_id(const struct i2c_client *client);
 #endif /* I2C */
 
 /**
-- 
2.38.1

