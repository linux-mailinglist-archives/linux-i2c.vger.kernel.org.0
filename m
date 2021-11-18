Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20634565F5
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 23:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbhKRXBe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 18:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbhKRXBd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 18:01:33 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2A5C061574
        for <linux-i2c@vger.kernel.org>; Thu, 18 Nov 2021 14:58:32 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o29so6785400wms.2
        for <linux-i2c@vger.kernel.org>; Thu, 18 Nov 2021 14:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=CvLL+Luxnu94FRY+3K+LGF9yUGlhCxJzQNH+MZ/w5ks=;
        b=iyuR//TtLFeVNIhjwKc0112XAsy/Tjtk6ovXkv2W9HUAk3W/LDBJKPXqfr1HV/zCpt
         Zaar20HCyXBAoo0nRPoGyk6z+LP82+Gm6nL6uz39CWRRGX102yshSLBDwh8IGpYQDujn
         ZaKkJtPOFFoJABfvgZiAhnbX2Brd7ezdBKL15Nx0l1sUYJRXzXmYmhycqOL8oPe6G9R4
         BYlQxZvee7f+Uum+NaPg+C1NqG63Jqri/zRNVBWXVN3quS15Wh4V7eDtZYl/ybp9DR7e
         2AVWAAzVgOr5pPrOOJJEOMCdkBn5a/0sQ+uhXARqIca//1rQqo0TAvLGd5edPoUwGXBf
         xcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=CvLL+Luxnu94FRY+3K+LGF9yUGlhCxJzQNH+MZ/w5ks=;
        b=Pdy1MNXI9tiYR/8uG/ewacW6lrKz2bMqL11HwIf3bSX+lCJQ6fZDp2mUc746qEArlX
         fNb/eT8gesI03eEb67nA6xb7N3mB4nOWNfGfbAVUcDyRqGUF0UaVtKppBqHRf8dK0xLN
         F5MDS39E7MYVLBcbRT1G6O0DdUTAzwAL+nwr1ur/ifVOxawn6qlLm4riqU7oRub8HrMz
         9D5YhC7YUH18noTrOwQYbd7UWK6RSu7Pc9QW68e5hEVX7a5fNzq8EWeZ9loHEGOvxDCB
         sED4nCDWe9PtAa0NxD+cwUwkNX4fmrWsr9K8uncE1KahOf4xtL8KsTiDhuPsU29oiSEe
         CGdA==
X-Gm-Message-State: AOAM530wRwK7UFHpG+910YJ3NkEHecm5UD5uHvm62bCatLjG9LOpV+sq
        rlfY0U1rUNcxgb+1Ks6E3nyG3GUX1v8=
X-Google-Smtp-Source: ABdhPJwI4wAXa/FmEP9Traa3FFnaT3V1ZvCFzwFA8G6bAqgf4C/z1qp0hDP13mKCKdbpCcGRq9pwzg==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr986625wmk.50.1637276311110;
        Thu, 18 Nov 2021 14:58:31 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:fc8d:4de8:c1d1:9213? (p200300ea8f1a0f00fc8d4de8c1d19213.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:fc8d:4de8:c1d1:9213])
        by smtp.googlemail.com with ESMTPSA id l5sm1025175wml.20.2021.11.18.14.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 14:58:30 -0800 (PST)
Message-ID: <f6e13674-7f86-529f-10e2-6b34bc5f8f6c@gmail.com>
Date:   Thu, 18 Nov 2021 23:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: i801: Remove i801_set_block_buffer_mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If FEATURE_BLOCK_BUFFER is set then bit SMBAUXCTL_E32B is supported
and there's no benefit in reading it back. Origin of this check
seems to be 14 yrs ago when people were not completely sure which
chip versions support the block buffer mode.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- made commit message less offending ;)
- re-added parentheses to a & b && c expression
---
 drivers/i2c/busses/i2c-i801.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 05187457f..f5c1589da 100644
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
@@ -791,9 +785,8 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 	/* Experience has shown that the block buffer can only be used for
 	   SMBus (not I2C) block transactions, even though the datasheet
 	   doesn't mention this limitation. */
-	if ((priv->features & FEATURE_BLOCK_BUFFER)
-	 && command != I2C_SMBUS_I2C_BLOCK_DATA
-	 && i801_set_block_buffer_mode(priv) == 0)
+	if ((priv->features & FEATURE_BLOCK_BUFFER) &&
+	    command != I2C_SMBUS_I2C_BLOCK_DATA)
 		result = i801_block_transaction_by_block(priv, data,
 							 read_write,
 							 command);
-- 
2.34.0

