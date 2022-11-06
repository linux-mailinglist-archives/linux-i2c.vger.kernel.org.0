Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E807F61E381
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Nov 2022 17:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiKFQnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Nov 2022 11:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbiKFQmx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Nov 2022 11:42:53 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDA8B1C8;
        Sun,  6 Nov 2022 08:42:52 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so1111294wmi.1;
        Sun, 06 Nov 2022 08:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBBnZk9CGHds25bK4AquHJJWU5YRQFIcofoONm9EE0Y=;
        b=oB2xaw02K/qsKo4gQmAc2N2vBGa8XdYAEaZH12L7S7024adpZByZGxjyinfmWAVnDI
         1JOhtyhB3pBST1p2+VYs2bywldGyYoLXZZGKbcFQ/ZCXy1H2yDPchMxsrfjiLLXnzp+5
         V8Vy0DGQ/B1Gd87KOez+DPwZ3E7vPXR7Jo5GamCrX/8YnKmzQFZ6uzJhE1Bcivv4LuD7
         DCKkbIUt5zceJcZNODWaWiofOpSS4ELUOTtCw0vwxl7Dg+p2BDNgoilFbULLbxTps3W3
         2AAVfzEML051Bh2ohMpGz5269PdXgFiXr5+IFpz/cqSfW8k3gH2NUp0jPycFb9YtCFa2
         DZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBBnZk9CGHds25bK4AquHJJWU5YRQFIcofoONm9EE0Y=;
        b=v8PaxPP+rpNeaLo6FI6ABYzn38BGb490S0/Ohh7tj68IrzPt+jEt6XB4T+UGhGhbvl
         2Nee0VfBkkhW8/EVPWx05D05Lc92LtLEnnSp/YmUSbSytSIunIcX7QD3VGc6aLM6XNgg
         IDZD4eZGJAZEoAC9zHp0SjfKZf9mCN4Ya+Y9WYrVmXsHyzB1Vv/R5t5wBDwOjnen88Xz
         1uOStwl8Fwdt16yAiUr5jeSzLHYYdgHP8nr5DgnKHGY608MimH7egYQG451ERGHahpaJ
         uznPjItZFXP3srHL/gZdJSfNRYv4CyrEEONnx2bgGuU9f2+EOGXnKkoKcDz9f5Zqng5u
         jizg==
X-Gm-Message-State: ACrzQf0Av5XuiS8qfs7dH7BDZSP2lP4j/ZFxHX+J4qHercI159h+mBmU
        iRMI1pTtg0/RgCGft4O6Msm0YZTwJ+U=
X-Google-Smtp-Source: AMsMyM7vAXI0FILuF40ugZH/Y7fO2Z5Zp4f9W1SWmz1CKQWreZ+VpCFP4SOa9gVALB+TzsvojGvU4w==
X-Received: by 2002:a7b:c4c2:0:b0:3b4:fdc4:6df9 with SMTP id g2-20020a7bc4c2000000b003b4fdc46df9mr29783642wmk.123.1667752970427;
        Sun, 06 Nov 2022 08:42:50 -0800 (PST)
Received: from localhost.localdomain (188.red-83-35-57.dynamicip.rima-tde.net. [83.35.57.188])
        by smtp.gmail.com with ESMTPSA id fc15-20020a05600c524f00b003cf57329221sm9930077wmb.14.2022.11.06.08.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:42:50 -0800 (PST)
From:   Angel Iglesias <ang.iglesiasg@gmail.com>
To:     linux-iio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: core: Introduce i2c_client_get_device_id helper function
Date:   Sun,  6 Nov 2022 17:42:24 +0100
Message-Id: <bb8d7f33c6b9e960d542c3951101587b4ddfaef6.1667750698.git.ang.iglesiasg@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667750698.git.ang.iglesiasg@gmail.com>
References: <cover.1667750698.git.ang.iglesiasg@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b4edf10e8fd0..920676e62c22 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2236,6 +2236,21 @@ int i2c_get_device_id(const struct i2c_client *client,
 }
 EXPORT_SYMBOL_GPL(i2c_get_device_id);
 
+/**
+ * i2c_client_get_device_id - get the driver match table entry of a device
+ * @client: the device to query. The device must be bound to a driver or
+ *	    the function oopses.
+ *
+ * Returns a pointer to the matching entry if found, NULL otherwise.
+ */
+const struct i2c_device_id *i2c_client_get_device_id(const struct i2c_client *client)
+{
+	const struct i2c_driver *drv = to_i2c_driver(client->dev.driver);
+
+	return i2c_match_id(drv->id_table, client);
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

