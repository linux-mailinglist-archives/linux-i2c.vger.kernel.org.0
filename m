Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89EAC6AACBD
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Mar 2023 22:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjCDViB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Mar 2023 16:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCDViA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Mar 2023 16:38:00 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC7E4C03
        for <linux-i2c@vger.kernel.org>; Sat,  4 Mar 2023 13:37:59 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id cy23so23705644edb.12
        for <linux-i2c@vger.kernel.org>; Sat, 04 Mar 2023 13:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkQOVstgTG2CpAyTsVjx/RO70rZF+cGmOO7FygJ4qqY=;
        b=mqldZ5sWRfFuofF8HN6XF9THjiW4GbehVBDhp/ieRfE/pPrKtm316dMLOxQZuCr+4P
         PZzYfgi/ccTVVKz4yP+Fk3T32fNhre/g299V6xqenJeIjp2LRamX+GSSdWGftGialE1m
         jzvd4usFaJUg89pIK02E1u6DhYCbqrkSccXci9+0Mr+dAQy6cC8c6M/zLfTgovcvi418
         XBX40gSxcUlqtKaVsBSaMguKU8jsfFv1GhMpYy0HRvYwNw7qF7VWCs7gZQH+DRceSPZ5
         lk32cmGNR26uxxCHFE9zd1UksAuNjO+QBhStXT/41oZpC8qZ8XZz8mbd4h8a0V9Ysa4U
         tSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkQOVstgTG2CpAyTsVjx/RO70rZF+cGmOO7FygJ4qqY=;
        b=DxMgT5hXhAgWCwrwna6697RMYIXpmPsfgWFshw/FJPl2b+gc9au8IlJQpEmGwIah1L
         +Hr3Q0iXGzpQIyK1Uw+SVkka0DNHHIThuvPgsk94lHVCNJQCgLaDIldDLaniLxemvzrO
         lrCQN6jrhfq+K2pXS5ePWRFTrYCkRjQD44V1ZWgk8E/ZaTyWcm9Vlr4G8Ao1UrSYFV7G
         JiaxUvXq+OrdbsO1rl3fUwfFdROaiBJg1mAxyk3CCcpL/KXat4flXc/LGxePHb6orZGk
         b7OSUxfU4em5RPCSdwmFBuUds08bLm6QWukeuUQm/zbTqkmoHJKvrFT/ervx8LdBbA1q
         iSug==
X-Gm-Message-State: AO0yUKXaA8E5S/JxufCODdiuw1lIsr22u3jREbWcLF1gg3ifC0RDdceN
        217jn5YdOFcII7fQ5pOtq0s=
X-Google-Smtp-Source: AK7set9d5qzLbCu+rAsO3noC5AUV9xmMJuZPovVesDl+3OqwfYnZU+mmM9n6GFc1VSuB9C8rhkwFTg==
X-Received: by 2002:a17:907:86a6:b0:84d:3403:f4f2 with SMTP id qa38-20020a17090786a600b0084d3403f4f2mr7844561ejc.62.1677965877634;
        Sat, 04 Mar 2023 13:37:57 -0800 (PST)
Received: from ?IPV6:2a01:c22:72de:8e00:a559:93c8:8a72:3308? (dynamic-2a01-0c22-72de-8e00-a559-93c8-8a72-3308.c22.pool.telefonica.de. [2a01:c22:72de:8e00:a559:93c8:8a72:3308])
        by smtp.googlemail.com with ESMTPSA id se9-20020a170906ce4900b008dd3956c2e3sm2452778ejb.183.2023.03.04.13.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 13:37:56 -0800 (PST)
Message-ID: <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
Date:   Sat, 4 Mar 2023 22:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 3/4] i2c: i801: Improve i801_block_transaction_byte_by_byte
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
In-Reply-To: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
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

Here we don't have to write SMBHSTCNT in each iteration of the loop.
Bit SMBHSTCNT_START is internally cleared immediately, therefore
we don't have to touch the value of SMBHSTCNT until the last byte.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7641bd0ac..e1350a8cc 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -677,11 +677,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 	for (i = 1; i <= len; i++) {
 		if (i == len && read_write == I2C_SMBUS_READ)
 			smbcmd |= SMBHSTCNT_LAST_BYTE;
-		outb_p(smbcmd, SMBHSTCNT(priv));
 
 		if (i == 1)
-			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
-			       SMBHSTCNT(priv));
+			outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
+		else if (smbcmd & SMBHSTCNT_LAST_BYTE)
+			outb_p(smbcmd, SMBHSTCNT(priv));
 
 		status = i801_wait_byte_done(priv);
 		if (status)
-- 
2.39.2


