Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7A9790976
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 22:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbjIBULJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 16:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjIBULJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 16:11:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0F4E54
        for <linux-i2c@vger.kernel.org>; Sat,  2 Sep 2023 13:11:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50087d47d4dso381178e87.1
        for <linux-i2c@vger.kernel.org>; Sat, 02 Sep 2023 13:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693685463; x=1694290263; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oagijnXdwApLzLrrhY/sdUJmvC/lVU1cxKXfNb3TM/k=;
        b=miajlgTRekv4ugvHKsNqCCY6ZZ3xXQNwnRAj7sbw8IKjhcJw76QA5zB7tNsVpZIwOe
         /HNpG1K0qKHiZihKNpdHBmcsYHX1fMp75TYfntRgn1KTi1tlqZcK4eKD+FIzCxerHfEE
         NI3Ng7rqun5ZJZ7HYS4HY7tRYdkfDI8v030BhDkbi1sgzjgEj/LQ19NRJY+APzDTBchR
         kvNIB3UHT2Su16pbF6vHMbftmh+Ke/12gBZkIF0zIxaI3GgyQhq0qefncW3HXk6mxltP
         b/p28isxnzFk9iz0dlfWwOkW9Nm2Qs7SE7nwvHgXH7glPYs7JdMsQKydA/+xPfjdQgRi
         17Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693685463; x=1694290263;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oagijnXdwApLzLrrhY/sdUJmvC/lVU1cxKXfNb3TM/k=;
        b=lOLAICgFjBNivRuGExnv9Jh70VsWe8ckRWVKnOd5LEXgzUo8FL0dgNg2ptj+5uQTn8
         teiyyuy0LYkCjl0nzlcGAmAbvAJf04XpCs1SgK11DOo/T3FeWFTqZo+Exs2YNdrU7bDs
         wOEF/50MDDmi3MPpW7BwBt6/8K2OyALgD0JSXjxz+EE4UZab9DuIBo2McLSSVvwCTR9r
         MECys7S7bRBPa9WkNDaWU3eJ982LZgJDtOZ5GxDmTHj1na+yp1eUWofadA4frYyQQ8xk
         +YqCGS/bpRQ3D39uVpgsUVFxBuxtm7v+QQa9uCW4hOMkPykkj8IZ82rukVa4P2YViccs
         tv8w==
X-Gm-Message-State: AOJu0Ywbbfpm1Ka5w7IxRNE4Oi7THykE3msXkcGGLyLbxfqEarjfHePy
        AunU6zT3+7nu2HL26QI2zQw=
X-Google-Smtp-Source: AGHT+IGzP2EMc68dko915xjmK+dTSViwBDC6d/6W9bm5tuHrCZPPyX+N/r/MapZ3kl/GldixaDqE7w==
X-Received: by 2002:a05:6512:4845:b0:4f8:74b5:b4ec with SMTP id ep5-20020a056512484500b004f874b5b4ecmr4068737lfb.41.1693685462482;
        Sat, 02 Sep 2023 13:11:02 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7326:d300:b9c4:4b23:eec7:79e? (dynamic-2a01-0c22-7326-d300-b9c4-4b23-eec7-079e.c22.pool.telefonica.de. [2a01:c22:7326:d300:b9c4:4b23:eec7:79e])
        by smtp.googlemail.com with ESMTPSA id g10-20020aa7c58a000000b005227e53cec2sm3762647edq.50.2023.09.02.13.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 13:11:01 -0700 (PDT)
Message-ID: <f056286a-1db9-b88c-6d36-a3358190b9c9@gmail.com>
Date:   Sat, 2 Sep 2023 22:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
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

Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
receiving the last byte. If we get e.g. preempted before setting
SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
before SMBHSTCNT_LAST_BYTE is set.
Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
is also consistent with what we do in i801_isr_byte_done().

Reported-by: Jean Delvare <jdelvare@suse.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove incorrect Fixes tag
---
 drivers/i2c/busses/i2c-i801.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7a0ccc584..8acf09539 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -679,15 +679,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		return result ? priv->status : -ETIMEDOUT;
 	}
 
-	for (i = 1; i <= len; i++) {
-		if (i == len && read_write == I2C_SMBUS_READ)
-			smbcmd |= SMBHSTCNT_LAST_BYTE;
-		outb_p(smbcmd, SMBHSTCNT(priv));
-
-		if (i == 1)
-			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
-			       SMBHSTCNT(priv));
+	if (len == 1 && read_write == I2C_SMBUS_READ)
+		smbcmd |= SMBHSTCNT_LAST_BYTE;
+	outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
 
+	for (i = 1; i <= len; i++) {
 		status = i801_wait_byte_done(priv);
 		if (status)
 			return status;
@@ -710,9 +706,12 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 			data->block[0] = len;
 		}
 
-		/* Retrieve/store value in SMBBLKDAT */
-		if (read_write == I2C_SMBUS_READ)
+		if (read_write == I2C_SMBUS_READ) {
 			data->block[i] = inb_p(SMBBLKDAT(priv));
+			if (i == len - 1)
+				outb_p(smbcmd | SMBHSTCNT_LAST_BYTE, SMBHSTCNT(priv));
+		}
+
 		if (read_write == I2C_SMBUS_WRITE && i+1 <= len)
 			outb_p(data->block[i+1], SMBBLKDAT(priv));
 
-- 
2.42.0

