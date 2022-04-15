Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB830502E1C
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 19:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356043AbiDORCr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 13:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356037AbiDORCq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 13:02:46 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FD254BC5
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:17 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id l7so16311546ejn.2
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=ASk5uZk2fLWGA+NYzLU0luN5ZBTpjvEbcnbyw6pqzkg=;
        b=NmF1gfBuEWSPHJid0rX+RacmpMNnwKECJWmTVbJ70XTnVxUreHGXq7463L8DwPdiy6
         TV28JGRgDjURZhntapTrP9CSa+bRmgbYKMnhB5n5kJ9Tpfh5vhTBmTqQXmR9KhN2LDi1
         eYcfroHdMA3Z8UEc+603Grhzvhok1gsbtQ88w1jYWURBtmIVbrMKLuUikXId0GOyrKtz
         S6PflafmTbXOFgLswbS1E7Y0cOhhRdY+K23MrIf+ROw971TFrdcqX9U9/mY9FpyD49uW
         694B26zJT0aT6btN0Wk4JDOvavzuKcY4n3qqKbD4u9YEtvRdSwMLgD+9FSnNSf1OLOad
         Xdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=ASk5uZk2fLWGA+NYzLU0luN5ZBTpjvEbcnbyw6pqzkg=;
        b=5ITiB2lxCOya/K9ke0CJIMYjb/Xof+PFDwdPRV+DJevygw75tlJB5kTjo9y7Qig3SY
         CgqGqSp4LEqmLTfnPOVvQNAtLrnkj/8RYINfvUY7I4AKsmNv8+YADwnmZzKAH/ZTUOO9
         b+f74gDZcOVZ6mTDZU4dHYxv7z6NPWCGhbJN0FhSnSTKvc+KvkAD5/ZxFlu5Kk7I43ZK
         jrZblUUFBQOzS92gvjpMLwAN0lEuoBcjeYHEZ3FStT9SeDJV1DsEowpypCmVw0xaPlrF
         sEOSsauKRYNDg9l2Or1+yGBg8KtwVqIHEJNUBKAk4p8I1swdR7JT4EV4sObhgbji+BXp
         UE5Q==
X-Gm-Message-State: AOAM530cLM56rk1zUKXpFyBVB7fDB0u87KIeKI4oddwF+Hz81GNzd6vy
        jXge7sPrQXsbQpW64ygtodjTiF0CBzs=
X-Google-Smtp-Source: ABdhPJx+XcEhmaPvic2CO771rKg5wOrCx6Qgs0nHjwchw24BL5njy317nF9ev0fldFF4Zeqw3pT/Ew==
X-Received: by 2002:a17:907:6284:b0:6e0:f895:15a with SMTP id nd4-20020a170907628400b006e0f895015amr25680ejc.713.1650042015728;
        Fri, 15 Apr 2022 10:00:15 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id cq24-20020a056402221800b00420ad7d2dd0sm2888134edb.29.2022.04.15.10.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 10:00:15 -0700 (PDT)
Message-ID: <9103e680-6436-42a3-d4be-39edf851aaf9@gmail.com>
Date:   Fri, 15 Apr 2022 18:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 8/8] i2c: i801: call i801_check_post() from i801_access()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
In-Reply-To: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Avoid code duplication by calling i801_check_post() from i801_access().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 9061333f2..ecec7a3a8 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -432,7 +432,7 @@ static int i801_wait_intr(struct i801_priv *priv)
 		busy = status & SMBHSTSTS_HOST_BUSY;
 		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 		if (!busy && status)
-			return status;
+			return status & STATUS_ERROR_FLAGS;
 	} while (time_is_after_eq_jiffies(timeout));
 
 	return -ETIMEDOUT;
@@ -456,7 +456,6 @@ static int i801_wait_byte_done(struct i801_priv *priv)
 
 static int i801_transaction(struct i801_priv *priv, int xact)
 {
-	int status;
 	unsigned long result;
 	const struct i2c_adapter *adap = &priv->adapter;
 
@@ -465,13 +464,12 @@ static int i801_transaction(struct i801_priv *priv, int xact)
 		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
 		       SMBHSTCNT(priv));
 		result = wait_for_completion_timeout(&priv->done, adap->timeout);
-		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
+		return result ? priv->status : -ETIMEDOUT;
 	}
 
 	outb_p(xact | SMBHSTCNT_START, SMBHSTCNT(priv));
 
-	status = i801_wait_intr(priv);
-	return i801_check_post(priv, status);
+	return i801_wait_intr(priv);
 }
 
 static int i801_block_transaction_by_block(struct i801_priv *priv,
@@ -618,7 +616,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 
 	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 	if (status) {
-		priv->status = status;
+		priv->status = status & STATUS_ERROR_FLAGS;
 		complete(&priv->done);
 	}
 
@@ -668,7 +666,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		reinit_completion(&priv->done);
 		outb_p(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
 		result = wait_for_completion_timeout(&priv->done, adap->timeout);
-		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
+		return result ? priv->status : -ETIMEDOUT;
 	}
 
 	for (i = 1; i <= len; i++) {
@@ -682,7 +680,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 
 		status = i801_wait_byte_done(priv);
 		if (status)
-			goto exit;
+			return status;
 
 		if (i == 1 && read_write == I2C_SMBUS_READ
 		 && command != I2C_SMBUS_I2C_BLOCK_DATA) {
@@ -712,9 +710,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
 	}
 
-	status = i801_wait_intr(priv);
-exit:
-	return i801_check_post(priv, status);
+	return i801_wait_intr(priv);
 }
 
 /* Block transaction function */
@@ -922,6 +918,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	else
 		ret = i801_single_transaction(priv, data, read_write, size);
 
+	ret = i801_check_post(priv, ret);
+
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
 	   time, so we forcibly disable it after every transaction. Turn off
 	   E32B for the same reason. */
-- 
2.35.3


