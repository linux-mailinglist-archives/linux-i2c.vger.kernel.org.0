Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5524E78BE62
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 08:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjH2GZv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 02:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233248AbjH2GZc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 02:25:32 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70126198
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 23:25:29 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9936b3d0286so534979966b.0
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 23:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693290327; x=1693895127;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rthfxxheec2AsG5HaONAROw1z5nnb7FJ8GUDyDy40Cg=;
        b=LF/iPQjjFnwC+F7NIhBUmI/OhpKyQ+g5Wb4KtrRijswtD9UuBcf3MtGMm78oQdVz0i
         1dTEj3zk9KYimN0pyNH+tI9lMnMyTr1c5CgX5XJ63cWHhJJl5RcDW7Q1Z+UZ1xI0PAdj
         TpmNIaT+iXBR4tYkAZIpq/4Jc2yNS3iygpHFFsNlp1ZzqyHBjHxcsXfRoAA8ycVopObi
         aByiQQyv5jVOyodm0EFOQ7i7kx916Z/AYfijgEBthlHQhCJ/FYDhAWhSOLQcXK7xBBIR
         tyilCaRoxXCnmu+3gCF+OZQTgKRVu1MOAfCZMwjP67gQ6u4yORM3cpQcr3/U9semyIHi
         dewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693290327; x=1693895127;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rthfxxheec2AsG5HaONAROw1z5nnb7FJ8GUDyDy40Cg=;
        b=Do1liKbkTPUy7A33o4j5X3iEmRYonGfmsEr3Ygu0QCPylwQjyNUfcoVFllLxOHOZ3m
         s1czQMWqgnrfQV0ui1MFCxb/5SxnMPDuLfCR0Xl8/LwpH7ugme3PeRzMjdjghxw5b38Z
         r5RMhVouULFKMg4hADDC6VahWCCx1rkLnLcnKInZKp7Re9DGgMeOJa2OT/izcdRyxen9
         qWYWyjSE+JYKnKqWXoEn7qdUAoW3C1sbWjDgZIk7gCH2NUPysmwV0BxuW6PGEcIUdN0A
         KtajHYpEt7+1OZv2DX650yEXfGOllSjMvh6yYnkiw7uXoatHKQsN0KNvrmP4LUrxvaQ/
         fQSg==
X-Gm-Message-State: AOJu0Yw1l2KbtmY/jCNwB+luOniBof1e99EcsMjRSIQJZPTgHPocGpxj
        GiDmZs6eq4Y02My+Wo31QFM=
X-Google-Smtp-Source: AGHT+IGlmZAFxsVGHxDF5iK2j5xCR34yJUX1OHG5b9uokCdTS/iRvXm8ylcuo0avZ9rvaBfJS+sj8g==
X-Received: by 2002:a17:906:3052:b0:9a5:c401:85e9 with SMTP id d18-20020a170906305200b009a5c40185e9mr1812022ejd.27.1693290327068;
        Mon, 28 Aug 2023 23:25:27 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b874:8100:450a:ef92:6833:4f2c? (dynamic-2a01-0c23-b874-8100-450a-ef92-6833-4f2c.c23.pool.telefonica.de. [2a01:c23:b874:8100:450a:ef92:6833:4f2c])
        by smtp.googlemail.com with ESMTPSA id z1-20020a17090655c100b0098cf565d98asm5568383ejp.22.2023.08.28.23.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 23:25:26 -0700 (PDT)
Message-ID: <679ddcf8-b03d-15eb-e914-bdbaa3f5b890@gmail.com>
Date:   Tue, 29 Aug 2023 08:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Daniel Kurtz <djkurtz@chromium.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: fix potential race in
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

Fixes: efa3cb15ad8b ("i2c-i801: Refactor use of LAST_BYTE in i801_block_transaction_byte_by_byte")
Reported-by: Jean Delvare <jdelvare@suse.com>
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
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

