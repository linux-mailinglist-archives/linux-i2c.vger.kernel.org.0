Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80662627154
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Nov 2022 18:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbiKMRrB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Nov 2022 12:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiKMRrA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Nov 2022 12:47:00 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72433E0E8;
        Sun, 13 Nov 2022 09:46:59 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id v1so13474057wrt.11;
        Sun, 13 Nov 2022 09:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2l0dzmwTO65CA0gPY3ng3ObRUSns6fVOx71jf/hSipk=;
        b=BIz809Utr/lOU6vpdJp3qPaelQRmkxk3jnrnqatFrYCd+WECF7jwa9baShSLjzLNUc
         2NTXzcDe3k/HjBo/qWr9yKncoZPWc5nGdkalR1voOliKF7QRpDy3Oq6hoJ0ZdxsaEhCx
         4jldVCS8dHlrxRg4iMVIr8dnedT4+tAAEAiIsFs4Q8kBVkH0Izob9jmebSdlhE6pb+Y+
         ZwSe1ef5cmm6AgGJRJj9zMGKyQr0ZWGPu/qdNFR04CkLEp3EJBDmO5Kl3XxZQCneVnbp
         XCXhBphT0oT+NT4cSasN1kQ34bKaZCMTsqcGnmWLGtKXYWS0fapvF5o6hN1wEsb/q2wS
         APKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2l0dzmwTO65CA0gPY3ng3ObRUSns6fVOx71jf/hSipk=;
        b=NzX6q3upBAAfZrZJKQT/uApRBeyNxEuRAl6r7yEgXvIMR0mpOEW0mI+PVqmHYV14su
         nEMtOQDgrXH4Thsvc4z9V+wKnmjd7360lLgttG2XzpKfcA18VqdEpUcjnB/gYxstk2CP
         9vcF5xkCa2XaKrROIAwsd9s8Vm2d6WTBbZZhRehQFqHLj7YXbrBM0Vk5l6MA/zxisnBp
         3FBS/61lizOjvFa58ORTYufgvFq8vSDnZ9GFG5ArsD1+eVM6dfFW8bpWJCg37S2Erdbo
         sO/TPbKh93ShFAaRB3CjOc1xY7o7rkTf0VVQInzeWTxvWQC26c0Vs+mJ6Qw7ly0RhSiD
         nUaw==
X-Gm-Message-State: ANoB5pmZS1pzT0hCs8XivPMUgMFH0wXqFRY/x8yYranaZUhDspF4Bm6H
        Yul/BArrR8hwrwVbh15TJEP7pmjVsS0=
X-Google-Smtp-Source: AA0mqf4kf/QAyhIrai8UZvBceUT7XPzxxgpTaFkSL0VxbP5G5NDyViFRA3xvg0WNYpgdYWWFm5PuHA==
X-Received: by 2002:a5d:4522:0:b0:236:5f1c:bedf with SMTP id j2-20020a5d4522000000b002365f1cbedfmr5842595wra.367.1668361617804;
        Sun, 13 Nov 2022 09:46:57 -0800 (PST)
Received: from localhost.localdomain (188.red-83-35-57.dynamicip.rima-tde.net. [83.35.57.188])
        by smtp.gmail.com with ESMTPSA id x10-20020adff64a000000b00236883f2f5csm7458463wrp.94.2022.11.13.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 09:46:57 -0800 (PST)
From:   Angel Iglesias <ang.iglesiasg@gmail.com>
To:     linux-iio@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH v3 1/2] i2c: core: Introduce i2c_client_get_device_id helper function
Date:   Sun, 13 Nov 2022 18:46:30 +0100
Message-Id: <a844cc7c85898b40abbdcb1f068338619c6010eb.1668361368.git.ang.iglesiasg@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1668361368.git.ang.iglesiasg@gmail.com>
References: <cover.1668361368.git.ang.iglesiasg@gmail.com>
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
index b4edf10e8fd0..9aa7b9d9a485 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2236,6 +2236,20 @@ int i2c_get_device_id(const struct i2c_client *client,
 }
 EXPORT_SYMBOL_GPL(i2c_get_device_id);
 
+/**
+ * i2c_client_get_device_id - get the driver match table entry of a device
+ * @client: the device to query. The device must be bound to a driver
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

