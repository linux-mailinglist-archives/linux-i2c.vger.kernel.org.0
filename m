Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A91F447620
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Nov 2021 22:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbhKGV7x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Nov 2021 16:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235308AbhKGV7w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Nov 2021 16:59:52 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72879C061570
        for <linux-i2c@vger.kernel.org>; Sun,  7 Nov 2021 13:57:09 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d24so23562701wra.0
        for <linux-i2c@vger.kernel.org>; Sun, 07 Nov 2021 13:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=xGXV2OPwarrgoBi6vJnz3pVKZ9rXX00jSZSrvocIyTQ=;
        b=M1pyQsrAvOWdC7/5anmYbpAIGyUmbUCZoRXwKiG/+E0kA4d1AEV+FwrZ+2zneIya5c
         sIUPMf4U2FZepRupR3JSblpjAv5+QoakaF09kJn9fw232ezCjecDXLVWznNqYt5N6T1A
         Ng5MR3z5etRa8JXO+Ocgysyjfag85XzrcSChM7Ss4X3nC6poA0Osmk53a87VXTGi1PTg
         lbZ/WRdeeXUny1PQJTEXqwCoUzi7WqOXQUptpCLmYPjMmer8NNpDPm3TY9exFhmbUSaJ
         tyS7r3g0xz16K3PnjmIxlR+1bHx81Z5htqm4O+0LDxz7wgRO+YQaKzFjISG7bSwXCSRk
         iIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=xGXV2OPwarrgoBi6vJnz3pVKZ9rXX00jSZSrvocIyTQ=;
        b=j8OaGecDWriWDowvpuwVWyp/FL36vgC+NWI1041PA1+GiwGMEZlluXEpzCyojSfpp1
         Kho/HzCzU9cWQmEUafwqfbfop5iyZ6/j2ZitrwYiVx8Zn3m2EMfRu3Xqf/P55rdpQ56v
         YfxZXrVd/n2bDi4qdJJ9Etc0ydf7mIMYnz+e0lkVn6cKw4JIxOIc9SKGvfAInMyrGvwb
         tyUxhltwLoJRqAmDe5y83XOofW+Z9Bp+dsfe3OvWNGms9sdcVYQ/Bnxz31b4T+Gpaa7d
         OIaoxgLq/aqW58VN+EjLYic/Xj+gze4A1zRwti047DGoip/GVF/VmTgjueBJfCYd6cvq
         18nQ==
X-Gm-Message-State: AOAM530nbSq1UrtQT6oUBAE7bDMlFqB4NLJ6almMj9gw1LaUqPxSWIwK
        CjHRbdIjEBrNOBXRZisdtA6lw+awU/A=
X-Google-Smtp-Source: ABdhPJzx58r7d5XJd+aLsHzxT2HQBIQAbzH3aY9kzAGY+ZNBcpXLvNrWrWC9kLyGolM1mSViG13INg==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr8322109wrd.105.1636322228077;
        Sun, 07 Nov 2021 13:57:08 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:3959:820:92f5:6d52? (p200300ea8f1a0f003959082092f56d52.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:3959:820:92f5:6d52])
        by smtp.googlemail.com with ESMTPSA id w17sm14969616wrp.79.2021.11.07.13.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 13:57:07 -0800 (PST)
Message-ID: <a5e9b8b5-82af-96a1-b983-d98c2fa140f9@gmail.com>
Date:   Sun, 7 Nov 2021 22:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: i2c: i801: Don't silently correct invalid transfer size
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If an invalid block size is provided, reject it instead of silently
changing it to a supported value. Especially critical I see the case of
a write transfer with block length 0. In this case we have no guarantee
that the byte we would write is valid. When silently reducing a read to
32 bytes then we don't return an error and the caller may falsely
assume that we returned the full requested data.

If this change should break any (broken) caller, then I think we should
fix the caller.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 2c48691d2..638198b4b 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -761,6 +761,11 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 	int result = 0;
 	unsigned char hostc;
 
+	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
+		data->block[0] = I2C_SMBUS_BLOCK_MAX;
+	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+		return -EPROTO;
+
 	if (command == I2C_SMBUS_I2C_BLOCK_DATA) {
 		if (read_write == I2C_SMBUS_WRITE) {
 			/* set I2C_EN bit in configuration register */
@@ -774,16 +779,6 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 		}
 	}
 
-	if (read_write == I2C_SMBUS_WRITE
-	 || command == I2C_SMBUS_I2C_BLOCK_DATA) {
-		if (data->block[0] < 1)
-			data->block[0] = 1;
-		if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
-			data->block[0] = I2C_SMBUS_BLOCK_MAX;
-	} else {
-		data->block[0] = 32;	/* max for SMBus block reads */
-	}
-
 	/* Experience has shown that the block buffer can only be used for
 	   SMBus (not I2C) block transactions, even though the datasheet
 	   doesn't mention this limitation. */
-- 
2.32.0

