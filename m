Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9886511BC
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbiLSSXI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbiLSSXF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:23:05 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B70B13D64
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:03 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n20so23720282ejh.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16C8DHb//JLX5SNLT9iZxVSsHPYyMhSVUrSupsu/ioc=;
        b=AodjOFiVuPqz8RNKks5H0vHgWCLGrXbTDhX2YJbI4SbWvzBpN0CdGiPYz5tGO0O3NU
         fDX0ZchwcgbpsarooryQ9PziMi2wmjDGUY6Q6I4fqchrfMZy6hyK5FoiBwsJHWZE97Aj
         W5OaVhODHnn9Y+ct3rxCR+LTQQYUZ4cmXXdUVxxDRG+dLvVh4LjFTddiT0SDpCeTFuFV
         FtSY5Tldmyzp1WqDX6eIU0AakBShTxGYfzm8mGnAFAiZpiXVkORQNyewa8ziFjYqAqH2
         /rxB1hTSEh2s2GkmAAnGK3SclBoyVkeNbjQbnx/g6gkDYg6L+BRTA7YRXC7NAssLDYUL
         TiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16C8DHb//JLX5SNLT9iZxVSsHPYyMhSVUrSupsu/ioc=;
        b=rJotDl6TubEtniYrVaCJ/vJwvHNIqmBiSLOAOA2+iLGDE7SnnswzQFFhTW+DGvsqtf
         i6M3jHQmIeAq1B6SAzXjQ2DfG2e3sEmEOCQzrOsufuHLhked2aHT1Y1DoBKuT4cPT8QI
         PwXpj2yc26y4iyk0fvmKtTOoWYeKb16cFFYz2lT7QoQMli8RsC3zyrMFmysXd+4PI7zk
         l46gZZVDQT2nkxqsPuQgAfKzn55M9HikOcUh61qxr3RXzOltYrXek2Z6D29ZMAJ4/kz9
         dVvmKhfD5fpcncqo0jrbo0OYYmQL6W2Tn7oJ2BpYJTZny5zwQQJ/eMwjKXhmil6pMNj9
         /g+Q==
X-Gm-Message-State: ANoB5pnWBBibaaMIJpV8nk1qSzIcjpwfO5K9PIFzXS6FBs1bVOn4WEBc
        qiBZ5xfzslaANzHPZvs9MGrMkvDlDB4=
X-Google-Smtp-Source: AA0mqf7QMnZE1CshD+l4T3/EXD5J6zKsHtRTJJIn/1vaY4Aiv8DMlMaYMXbQN4S0T3RLn+TGSU8l/w==
X-Received: by 2002:a17:906:ae46:b0:7c0:aa0b:b0d7 with SMTP id lf6-20020a170906ae4600b007c0aa0bb0d7mr22211866ejb.50.1671474182682;
        Mon, 19 Dec 2022 10:23:02 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id kz6-20020a17090777c600b007c0aefd9339sm4763220ejc.175.2022.12.19.10.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:23:02 -0800 (PST)
Message-ID: <0a170b74-c105-7ca3-9811-a370c81462b8@gmail.com>
Date:   Mon, 19 Dec 2022 19:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 10/10] i2c: i801: call i801_check_post() from i801_access()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
In-Reply-To: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
index 4b5fb2c61..7313efadf 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -434,7 +434,7 @@ static int i801_wait_intr(struct i801_priv *priv)
 		busy = status & SMBHSTSTS_HOST_BUSY;
 		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 		if (!busy && status)
-			return status;
+			return status & STATUS_ERROR_FLAGS;
 	} while (time_is_after_eq_jiffies(timeout));
 
 	return -ETIMEDOUT;
@@ -458,7 +458,6 @@ static int i801_wait_byte_done(struct i801_priv *priv)
 
 static int i801_transaction(struct i801_priv *priv, int xact)
 {
-	int status;
 	unsigned long result;
 	const struct i2c_adapter *adap = &priv->adapter;
 
@@ -467,13 +466,12 @@ static int i801_transaction(struct i801_priv *priv, int xact)
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
@@ -624,7 +622,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 
 	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 	if (status) {
-		priv->status = status;
+		priv->status = status & STATUS_ERROR_FLAGS;
 		complete(&priv->done);
 	}
 
@@ -674,7 +672,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		reinit_completion(&priv->done);
 		outb_p(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
 		result = wait_for_completion_timeout(&priv->done, adap->timeout);
-		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
+		return result ? priv->status : -ETIMEDOUT;
 	}
 
 	for (i = 1; i <= len; i++) {
@@ -688,7 +686,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 
 		status = i801_wait_byte_done(priv);
 		if (status)
-			goto exit;
+			return status;
 
 		if (i == 1 && read_write == I2C_SMBUS_READ
 		 && command != I2C_SMBUS_I2C_BLOCK_DATA) {
@@ -718,9 +716,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
 	}
 
-	status = i801_wait_intr(priv);
-exit:
-	return i801_check_post(priv, status);
+	return i801_wait_intr(priv);
 }
 
 static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
@@ -905,6 +901,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	else
 		ret = i801_simple_transaction(priv, data, addr, command, read_write, size);
 
+	ret = i801_check_post(priv, ret);
+
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
 	 * time, so we forcibly disable it after every transaction.
 	 */
-- 
2.39.0


