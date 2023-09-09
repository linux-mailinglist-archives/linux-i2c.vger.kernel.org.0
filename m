Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCCA5799B20
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Sep 2023 22:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbjIIUZ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Sep 2023 16:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjIIUZ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Sep 2023 16:25:57 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D822BCD5
        for <linux-i2c@vger.kernel.org>; Sat,  9 Sep 2023 13:25:10 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso34920545e9.3
        for <linux-i2c@vger.kernel.org>; Sat, 09 Sep 2023 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694291108; x=1694895908; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnFoVHtkQmsHgrralA9A98bvH5b1tiFwbwWAzM4O3bk=;
        b=WjGRfQxKfPEwiffo9nRQcfXCODnQVWWUT3BtYtfVzfdoiMpOqeKTZKnD86oWBOg3qA
         D9F0Vv15NlBtYVbHRHatySLrtHoWF1nninmPSqTPZCVklSAuuGPH7ZGhhs4US1wobmf7
         sImDT758HLMqxH/M+DM/wo2BnSRK078dHWVl4RYznYBMsGE673yxfoGWiX7bfh11jSPo
         j+w2Be+wd0QmjT9tiQ7h/ZvGU0942qljJPs+r7WhOzpkCDs+b+H7/NK33MfEG2iLIO5x
         t6drtNuV1nOZ6kaslHRexklJn8cSZOgyEcln+jpMgn5dH88OtC9QGv0yuFqZBgRI1rQ6
         WEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694291108; x=1694895908;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nnFoVHtkQmsHgrralA9A98bvH5b1tiFwbwWAzM4O3bk=;
        b=VfRn/i7jv0RJzacyGeZQcSkL6k6AloZXZIn/3e2XiPseMmwiN2d1iUbUc6GLBdlZ7z
         g8qCcj+lHM6ALxfHCa8aBxaVz9C/SZfnTGDxF7H1/z04Xzx0ACESyEVtEqftCH9QNX6W
         4nxoeXgj043b1Wsxe/z4pEq1XcraiQoespz+d9kqdSdiw6Ses883UXp+Kc0A+r6AcJ4q
         M31UCYBia631PExFuCDjTgdfO0or8v0fr3CpWutIiHRn4TA4eayqxFKuVebeo/q6+ryJ
         xe2QwWps1R7udBXHuydBCnMGkjooa3fJu4hTQxNL80gejo4ZzckVYJeHofqbhuLzFN0y
         XO/g==
X-Gm-Message-State: AOJu0YyRwgX5INEUeqC4C/oT6wq6jHQKvpa6d0lCbZRKxCKgstFspivs
        l241xaAf8su9HCws+r9KtouVvLeowf8=
X-Google-Smtp-Source: AGHT+IFeAVL7vM0FVUB3RwjEFqMaNXzvWFyoeen2+vbix/OxRoeUNATTXlQgl20p+Nx1T+PE3q8ynQ==
X-Received: by 2002:a05:6000:1c12:b0:31f:91ae:4507 with SMTP id ba18-20020a0560001c1200b0031f91ae4507mr1504558wrb.32.1694291108297;
        Sat, 09 Sep 2023 13:25:08 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c463:c00:c078:80be:4e95:df72? (dynamic-2a01-0c23-c463-0c00-c078-80be-4e95-df72.c23.pool.telefonica.de. [2a01:c23:c463:c00:c078:80be:4e95:df72])
        by smtp.googlemail.com with ESMTPSA id e12-20020a5d594c000000b0031ad5470f89sm5571213wri.18.2023.09.09.13.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Sep 2023 13:25:07 -0700 (PDT)
Message-ID: <205f1930-f26c-9533-ef09-e37377d9ef10@gmail.com>
Date:   Sat, 9 Sep 2023 22:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymion.delvare/
Cc: stable@vger.kernel.org
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- Apparently potential issue has been there forever, therefore cc
  to stable w/o Fixes tag.
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

