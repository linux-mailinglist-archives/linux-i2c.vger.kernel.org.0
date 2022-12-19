Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF8C6511B4
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbiLSSW7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiLSSW6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:22:58 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298C5614D
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:22:57 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id e13so14113855edj.7
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CDnj2dm5dbh1+Vu4PBJuDR7da2c7xAZwDxTtO2AJvg=;
        b=TvhhNzYJepZ3y+Gve/WVHqWHbypcI5w9Oq43cdmIN2cm8RgGm0lxQkKvQUleatkdgS
         yYTbh4C+Co49xjwogUTRlh4nYTOLhsqTAeFOoTBL47zLfrxful1IVFHoEbruDex0KeZy
         b7QI2Qw6F2hgonAAIDhYxy8F2IsWlAhmPLJmIxSW3tWu6b2wMNPBct4XJYDCju5vqysP
         WlcmwKWRdLvxKNCIGsp6MJSUe+Jq3TCW/wIWM1il+W5/3PlZTfeCrzLd8x5jszpF4zy5
         FRVs9dL48g0p9hfDcCR/OfP6VBAv9EktX3EuzP7ZjwZd1RAIBU9v0Ibx/5eSFmN9I9Zc
         c3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CDnj2dm5dbh1+Vu4PBJuDR7da2c7xAZwDxTtO2AJvg=;
        b=hyfzTxofQKeAupAn8MI7MxY1wUjv2ma5kw5+FIvr7gVeWtEyLFMj6x3k6chPPEMNm2
         hgqpKBoz46An0HORNu0o+xbh/Pgljlq44yutAGjfAh2WxGhIwPlY6k3/6L4JjHWHGsDp
         k7IewxK0a3vYcZDYZFmsdi8TQUK1ti/+uut7QBwl1APCuANMfJ0ec72bropOaoHjAi7+
         ynLkZ1zasixH0UAx49VN2EuNDTtnhQFa/Ny+rudxgfdF+wBU0B0Wf3v+A89/vCedKnNP
         TIRgjL0b3JcNrHq1FMgt1vgWUc0pCuLUmJ5UswXPbMG1aQhVLxBATM2caG84mt+8bTjr
         4AAA==
X-Gm-Message-State: ANoB5pmAs1Qqgd66SQbMJNKUm/WalRVIUcCVvuPl0aXJxZhf6M98pZdN
        iJLBnBYyXwhA7sIKCDIxvHZCL0SBxM4=
X-Google-Smtp-Source: AA0mqf4gFLSbW9cpuD0MEl3XLbny8b8bFzMdMY4Ru91HiH9ZdCnwIPBUMG/3z6aYkPWeOaP70XX02g==
X-Received: by 2002:a05:6402:2034:b0:470:49a2:ad70 with SMTP id ay20-20020a056402203400b0047049a2ad70mr21820088edb.5.1671474175600;
        Mon, 19 Dec 2022 10:22:55 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id e2-20020a50ec82000000b0045723aa48ccsm4627660edr.93.2022.12.19.10.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:22:55 -0800 (PST)
Message-ID: <dbca2f66-c3ab-428d-74b1-70c472664bc9@gmail.com>
Date:   Mon, 19 Dec 2022 19:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 01/10] i2c: i801: improve interrupt handler
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

Not sure if it can happen, but better play safe: If SMBHSTSTS_BYTE_DONE
and an error flag is set, then don't trust the result and skip calling
i801_isr_byte_done(). In addition clear status bit SMBHSTSTS_BYTE_DONE
in the main interrupt handler, this allows to simplify the code a
little.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- change one expression for generating less binary code
---
 drivers/i2c/busses/i2c-i801.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1fda1eaa6..da773c563 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -558,9 +558,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 		/* Write next byte, except for IRQ after last byte */
 		outb_p(priv->data[++priv->count], SMBBLKDAT(priv));
 	}
-
-	/* Clear BYTE_DONE to continue with next byte */
-	outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
 }
 
 static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
@@ -590,7 +587,6 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
  *      BUS_ERR - SMI# transaction collision
  *      FAILED - transaction was canceled due to a KILL request
  *    When any of these occur, update ->status and signal completion.
- *    ->status must be cleared before kicking off the next transaction.
  *
  * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
  *    occurs for each byte of a byte-by-byte to prepare the next byte.
@@ -615,23 +611,18 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	}
 
 	status = inb_p(SMBHSTSTS(priv));
-	if (status & SMBHSTSTS_BYTE_DONE)
+	if ((status & (SMBHSTSTS_BYTE_DONE | STATUS_ERROR_FLAGS)) == SMBHSTSTS_BYTE_DONE)
 		i801_isr_byte_done(priv);
 
 	/*
-	 * Clear remaining IRQ sources: Completion of last command, errors
-	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
-	 * assertion independently of the interrupt generation being blocked
-	 * or not so clear it always when the status is set.
-	 */
-	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
-	if (status)
-		outb_p(status, SMBHSTSTS(priv));
-	status &= ~SMBHSTSTS_SMBALERT_STS; /* SMB_ALERT not reported */
-	/*
-	 * Report transaction result.
-	 * ->status must be cleared before the next transaction is started.
+	 * Clear IRQ sources: SMB_ALERT status is set after signal assertion
+	 * independently of the interrupt generation being blocked or not
+	 * so clear it always when the status is set.
 	 */
+	status &= STATUS_FLAGS | SMBHSTSTS_SMBALERT_STS;
+	outb_p(status, SMBHSTSTS(priv));
+
+	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 	if (status) {
 		priv->status = status;
 		complete(&priv->done);
-- 
2.39.0


