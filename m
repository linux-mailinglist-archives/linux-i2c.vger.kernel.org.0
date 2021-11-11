Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7987D44DD3B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 22:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhKKVqf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 16:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhKKVqe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 16:46:34 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04387C061766
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 13:43:45 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 133so6224109wme.0
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 13:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=kMdl26fsVblj6GDgxJgNtWgFdi7JCKCE//61RrWIKys=;
        b=hHC41NyKinJgENX5F1tjDCKg6QSPG1CgG1X4i3nFxbc3sMyQtpDf5/zcAppkdZxUr9
         fINkGoYg6YN/GWOmhzfCVW7pTbCbxNlJGZMdUOPDfF4j9bg7CTaPO1scLu210E5e0sEr
         I2Gat0+1bUjCstvuJS9Hjt2bL45+Op/uImnO3mSsUh8BlmtzoAaXTp2YOjFtr3lalyVr
         5dwRKI6Ario6IFSr+GGGJFvKzrOKrnkisaHOwlZ0lS54OfFmnzz7BB2FF8VRB1H7LCO0
         InWr/XBH4GDngRQkOUknqIZIoDnZVcddjVt6Esu53Qt7NpcBJPr+/OIjVpXAf+E0F/yZ
         Ok8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=kMdl26fsVblj6GDgxJgNtWgFdi7JCKCE//61RrWIKys=;
        b=3FL2iT8v6XpE2JZKF2voUeyDFKDPRqJ5WAGUKNieG70JLNo3BFuutkquEUrLPb6ggL
         6PRPC/tik40y7lQW4du/KYaC4r+K2A0j5NSFxjVoHh8LhZ8QEpB0ZO30P84CZF64hz3B
         leDpl2W0cHU/2zWDB2s7K0zWDXheS8i8VNkoozKG0V4sMT2tbOH9FTmytMB8V7xqkD5Y
         pJnR1oZY9nD4MNH38OnywSVBFgqyEyO1j6F5SLMKxtI1Daoh4MgddOZhMCc48DyudqjH
         E5MztKVGGQBAbH2gAw9mSz/+go65NN4EGEYfZlfffpa6fGvlX/S5cUMz2DBWI3MexZVL
         FzIg==
X-Gm-Message-State: AOAM5312Fwo06+AA7rZODw5aCEOI8YkBCVaVNd6J/6YgMFiaKaKnRarH
        PvDIlFyyy6Pkr0DXLhPLv2M3psfNYqA=
X-Google-Smtp-Source: ABdhPJxfrMH/1zODW0rO47aNnRY+6z66JlxePf3hP9giue1RoZcbDCfP3mc0GuyMeUsCswUlWzcPig==
X-Received: by 2002:a05:600c:2195:: with SMTP id e21mr11975291wme.187.1636667023631;
        Thu, 11 Nov 2021 13:43:43 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:3927:eb2e:28c7:205e? (p200300ea8f1a0f003927eb2e28c7205e.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:3927:eb2e:28c7:205e])
        by smtp.googlemail.com with ESMTPSA id u19sm4202654wmm.5.2021.11.11.13.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 13:43:43 -0800 (PST)
Message-ID: <ab295fad-3f5a-5cc9-14fe-5bfaea8099a9@gmail.com>
Date:   Thu, 11 Nov 2021 22:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Remove i801_set_block_buffer_mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If FEATURE_BLOCK_BUFFER is set I don't see how setting this bit could
fail. Reading it back seems to be overly paranoid. Origin of this
check seems to be 14 yrs ago when people were not completely sure
which chip versions support block buffer mode.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 4c96f1b47..608e928e9 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -521,9 +521,11 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 		return -EOPNOTSUPP;
 	}
 
+	/* Set block buffer mode */
+	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
+
 	inb_p(SMBHSTCNT(priv)); /* reset the data buffer index */
 
-	/* Use 32-byte buffer to process this transaction */
 	if (read_write == I2C_SMBUS_WRITE) {
 		len = data->block[0];
 		outb_p(len, SMBHSTDAT0(priv));
@@ -750,14 +752,6 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 	return i801_check_post(priv, status);
 }
 
-static int i801_set_block_buffer_mode(struct i801_priv *priv)
-{
-	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
-	if ((inb_p(SMBAUXCTL(priv)) & SMBAUXCTL_E32B) == 0)
-		return -EIO;
-	return 0;
-}
-
 /* Block transaction function */
 static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
 				  char read_write, int command)
@@ -786,9 +780,8 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 	/* Experience has shown that the block buffer can only be used for
 	   SMBus (not I2C) block transactions, even though the datasheet
 	   doesn't mention this limitation. */
-	if ((priv->features & FEATURE_BLOCK_BUFFER)
-	 && command != I2C_SMBUS_I2C_BLOCK_DATA
-	 && i801_set_block_buffer_mode(priv) == 0)
+	if (priv->features & FEATURE_BLOCK_BUFFER &&
+	    command != I2C_SMBUS_I2C_BLOCK_DATA)
 		result = i801_block_transaction_by_block(priv, data,
 							 read_write,
 							 command);
-- 
2.33.1

