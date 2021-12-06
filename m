Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1298C46AA02
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 22:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351172AbhLFVWm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 16:22:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351187AbhLFVWe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 16:22:34 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A03CC0613FE
        for <linux-i2c@vger.kernel.org>; Mon,  6 Dec 2021 13:19:01 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d9so25151626wrw.4
        for <linux-i2c@vger.kernel.org>; Mon, 06 Dec 2021 13:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:from:to
         :subject:content-transfer-encoding;
        bh=dee1meTiwUxXBHJuYSnBGhDI4XmQHIUItcAXRFOLMUg=;
        b=pcH/Ulq/K4rLglDagJTMWxSSA4ScBrH3vdMu/paqD4+gC1kd+RUsxBPB9ZncfOgqX0
         BGY37UejcXJK3q8UqneoXC5yhc9aQSVK6lPPtp0/YDrr6EVKy+pRDNyEGX0Okr/Y3NgV
         SEpBKGsYXufUuFoyQ/j8iAsXHAi9gLB1zGjj49ADa0euhH8M6t79zPXHw+PlmsDESqBC
         D9zOQf3X3l68SX1lceaVmI21UDJDBq80bmWZwHxTOypxioGhP0cC08xc9hDtfW/Dr0a8
         wwpLAEiOXFPws1OSFfDDfLv+IOqvjDbLvihzD8GmTB40vSqBVvcOkh5bw5vrtRdYshYd
         fuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:from:to:subject:content-transfer-encoding;
        bh=dee1meTiwUxXBHJuYSnBGhDI4XmQHIUItcAXRFOLMUg=;
        b=ZWFG/WbPGEaEIzg5Ij5ZHeWe4ZZY0WATioOHPuCVvKMW4JsbaqIJfmTePqAeMvYvE4
         T8j8u/STe9XnfFrNQQ7R6nOnbn8+EYx6OM5lcjAzMMmE4UBsub2QYeUG7JMLm6mD1AlF
         6F9hQA7eiiar6f8HOazEyY6m+aXyrh1i5BIKqfTMoRuUqU0jpdy3UYDipGOnHJ1Hg9Ow
         VrVrWao6rEeIjA9/EP1MyqmF5rVCocTm28JMVGqgyuZyXaZ9ER/wIE5Ulpoj3S2OI+EW
         Yd4iWOZkSy7EH5z28CleDFarrZd1rh6ZbCn6yeBkPGrsUmqyWS4BMlNyaJU0zoKOs0H9
         64vw==
X-Gm-Message-State: AOAM531HNbqddtGn38+4TzafGx+RkXbsxsbdIzNYyOL6vqPFTf5Bz5Jq
        nRyh3o3xdJgUZMaH9Z9J0JyuCuOTggA=
X-Google-Smtp-Source: ABdhPJwO91wP8WfpLIL8qJ77kbtC8BNNetHIv+8Kq7IOpgzF8gcTPkhrs5W79GIXnTdW6M4BUrWX4w==
X-Received: by 2002:a5d:6843:: with SMTP id o3mr44762414wrw.174.1638825539673;
        Mon, 06 Dec 2021 13:18:59 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:1d95:3f45:4aa4:7aa7? (p200300ea8f1a0f001d953f454aa47aa7.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:1d95:3f45:4aa4:7aa7])
        by smtp.googlemail.com with ESMTPSA id r17sm603833wmq.11.2021.12.06.13.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 13:18:59 -0800 (PST)
Message-ID: <b4cb50db-7226-282f-e04a-02fbe0b605a0@gmail.com>
Date:   Mon, 6 Dec 2021 22:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: i801: I2C block read should be usable also on ICH/ICH0/ICH2/ICH3/ICH4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently we use the following feature definitions. However, according to
the respective datasheets, also ICH/ICH0/ICH2/ICH3/ICH4 support I2C block
read. The implementation we have should work also on these chip versions.

The commit message of 6342064cad7a ("i2c-i801: Implement I2C block read
support") states that i2c block read is supported from ICH5 only.
This doesn't seem to be true. Or is this feature broken on older chip
versions? 

To me it seems we could remove FEATURE_I2C_BLOCK_READ because all chip
versions support this feature. Below is an experimental patch, for the
ones with test hw. A test case could be to use decode-dimms that
uses i2c block read to read the EEPROM content.

* Supports the following Intel I/O Controller Hubs (ICH):
 *
 *					I/O			Block	I2C
 *					region	SMBus	Block	proc.	block
 * Chip name			PCI ID	size	PEC	buffer	call	read
 * ---------------------------------------------------------------------------
 * 82801AA (ICH)		0x2413	16	no	no	no	no
 * 82801AB (ICH0)		0x2423	16	no	no	no	no
 * 82801BA (ICH2)		0x2443	16	no	no	no	no
 * 82801CA (ICH3)		0x2483	32	soft	no	no	no
 * 82801DB (ICH4)		0x24c3	32	hard	yes	no	no
 * 82801E (ICH5)		0x24d3	32	hard	yes	yes	yes


diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 930c6edbe..fd9a19a80 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -294,7 +294,6 @@ struct i801_priv {
 #define FEATURE_SMBUS_PEC	BIT(0)
 #define FEATURE_BLOCK_BUFFER	BIT(1)
 #define FEATURE_BLOCK_PROC	BIT(2)
-#define FEATURE_I2C_BLOCK_READ	BIT(3)
 #define FEATURE_IRQ		BIT(4)
 #define FEATURE_HOST_NOTIFY	BIT(5)
 /* Not really a feature, but it's convenient to handle it as such */
@@ -780,10 +779,6 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 			pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
 			pci_write_config_byte(priv->pci_dev, SMBHSTCFG,
 					      hostc | SMBHSTCFG_I2C_EN);
-		} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
-			dev_err(&priv->pci_dev->dev,
-				"I2C block read is unsupported!\n");
-			return -EOPNOTSUPP;
 		}
 	}
 
@@ -956,11 +951,10 @@ static u32 i801_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
 	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
 	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
+	       I2C_FUNC_SMBUS_READ_I2C_BLOCK |
 	       ((priv->features & FEATURE_SMBUS_PEC) ? I2C_FUNC_SMBUS_PEC : 0) |
 	       ((priv->features & FEATURE_BLOCK_PROC) ?
 		I2C_FUNC_SMBUS_BLOCK_PROC_CALL : 0) |
-	       ((priv->features & FEATURE_I2C_BLOCK_READ) ?
-		I2C_FUNC_SMBUS_READ_I2C_BLOCK : 0) |
 	       ((priv->features & FEATURE_HOST_NOTIFY) ?
 		I2C_FUNC_SMBUS_HOST_NOTIFY : 0);
 }
@@ -997,7 +991,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= i801_func,
 };
 
-#define FEATURES_ICH5	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \
+#define FEATURES_ICH5	(FEATURE_BLOCK_PROC | 				  \
 			 FEATURE_IRQ | FEATURE_SMBUS_PEC		| \
 			 FEATURE_BLOCK_BUFFER | FEATURE_HOST_NOTIFY)
 #define FEATURES_ICH4	(FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER | \
-- 
2.34.1

