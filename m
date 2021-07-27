Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCDE3D7F35
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 22:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbhG0UZj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 16:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbhG0UZj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 16:25:39 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DDFC061757
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jul 2021 13:25:37 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id l18so8952128wrv.5
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jul 2021 13:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=KQS+VnQfQzWTe5bY3UWveGWqlkNr7L0IiwQziY4iu2k=;
        b=YHO8ZfT2wyMmhD6kihoBdcwXhpsX1NjRGpWIZuZVqMBYhGMUroLotdBTqBXdru+Bvv
         PYB86BisV1gwY6ueC6hQQn/9aAe+FQRLBhNLM04SHQASjGilIInyl0MtmTIobpyKJOG5
         9sNo3oszCkGHtm5Ykw5S00ZqqNX5aIL4xQ07/d29TSdUzK8W5CXWBY0mTadHAoon02bK
         Yzgzld0s1dgWaamX6e+3mpkjy5nvmYGr6wRyymZXA5gmvmsULhCHEhFPoNKIW2y42XRm
         uRuwK3YcU/nPUm1vKO0ifEo5DiNNIDsopOW99cMoaJT2lTtufg2ZhqlAiKy3FHwi5o9c
         60Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=KQS+VnQfQzWTe5bY3UWveGWqlkNr7L0IiwQziY4iu2k=;
        b=rEUnp5/6SzMsya5/czke+/9/We0OTbxxedOVQULYPCycluDYmA8J9sHnV2szYi9Npr
         TDrW/3cgVjZ8pV/2F4ALvgIhy45v7F+nBUd7dIS3+QpPh6iwwErvQI23MjpTB0IIPa/3
         Xbf/Tx0t56LPR/2RzZzBjAFqaY53tP/iN0s/WbFOlCiBTtmtbAFoPc1u85NJiWwbGtkY
         6OT4+CW3iYg3LOI/xJtVMB8fKICrAEJ5e7fItIHqk2jKOTywjWphuahSGvfRmlKH3LxW
         bSFFtG+RP+cOpwiIJm87Sapa5r4E7ut/SWbU7mpylDy40pAp+Z58xpMNN+eojxGygl1t
         aOfw==
X-Gm-Message-State: AOAM530EVXmyI4wVYsp7CuBjdOCPuA6gg76DifcL4q8U3U9MEiU1Qyl7
        FXFatUJ0lPRAN/tgSZEL6bXyXbO7ep8=
X-Google-Smtp-Source: ABdhPJwbfuS1+lKgbBW6DuE0eAyxRn2EtV3mIdye4it814XVHPFYOQKK6ikhY3AqNWIm1fF+Uz/P3Q==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr26132079wrr.55.1627417536307;
        Tue, 27 Jul 2021 13:25:36 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f3a:f500:1581:5149:b8dd:692f? (p200300ea8f3af50015815149b8dd692f.dip0.t-ipconnect.de. [2003:ea:8f3a:f500:1581:5149:b8dd:692f])
        by smtp.googlemail.com with ESMTPSA id d8sm4779422wrv.20.2021.07.27.13.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 13:25:35 -0700 (PDT)
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: i801: Fix handling SMBHSTCNT_PEC_EN
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Message-ID: <c738b504-d545-8f7d-ab86-06dba876ddeb@gmail.com>
Date:   Tue, 27 Jul 2021 22:25:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Bit SMBHSTCNT_PEC_EN is used only if software calculates the CRC and
uses register SMBPEC. This is not supported by the driver, it supports
hw-calculation of CRC only (using bit SMBAUXSTS_CRCE). The chip spec
states the following, therefore never set bit SMBHSTCNT_PEC_EN.

Chapter SMBus CRC Generation and Checking
If the AAC bit is set in the Auxiliary Control register, the PCH
automatically calculates and drives CRC at the end of the transmitted
packet for write cycles, and will check the CRC for read cycles. It will
not transmit the contents of the PEC register for CRC. The PEC bit must
not be set in the Host Control register. If this bit is set, unspecified
behavior will result.

This patch is based solely on the specification and compile-tested only,
because I have no PEC-capable devices.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Tested-by: Jean Delvare <jdelvare@suse.de>
---
v2:
- further simplified the change in i801_block_transaction_by_block
- added comment to the change in i801_setup_hstcfg
---
 drivers/i2c/busses/i2c-i801.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index aa3f60e69..92ec291c0 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -503,19 +503,16 @@ static int i801_transaction(struct i801_priv *priv, int xact)
 
 static int i801_block_transaction_by_block(struct i801_priv *priv,
 					   union i2c_smbus_data *data,
-					   char read_write, int command,
-					   int hwpec)
+					   char read_write, int command)
 {
-	int i, len;
-	int status;
-	int xact = hwpec ? SMBHSTCNT_PEC_EN : 0;
+	int i, len, status, xact;
 
 	switch (command) {
 	case I2C_SMBUS_BLOCK_PROC_CALL:
-		xact |= I801_BLOCK_PROC_CALL;
+		xact = I801_BLOCK_PROC_CALL;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
-		xact |= I801_BLOCK_DATA;
+		xact = I801_BLOCK_DATA;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -665,8 +662,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
  */
 static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 					       union i2c_smbus_data *data,
-					       char read_write, int command,
-					       int hwpec)
+					       char read_write, int command)
 {
 	int i, len;
 	int smbcmd;
@@ -764,9 +760,8 @@ static int i801_set_block_buffer_mode(struct i801_priv *priv)
 }
 
 /* Block transaction function */
-static int i801_block_transaction(struct i801_priv *priv,
-				  union i2c_smbus_data *data, char read_write,
-				  int command, int hwpec)
+static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
+				  char read_write, int command)
 {
 	int result = 0;
 	unsigned char hostc;
@@ -802,11 +797,11 @@ static int i801_block_transaction(struct i801_priv *priv,
 	 && i801_set_block_buffer_mode(priv) == 0)
 		result = i801_block_transaction_by_block(priv, data,
 							 read_write,
-							 command, hwpec);
+							 command);
 	else
 		result = i801_block_transaction_byte_by_byte(priv, data,
 							     read_write,
-							     command, hwpec);
+							     command);
 
 	if (command == I2C_SMBUS_I2C_BLOCK_DATA
 	 && read_write == I2C_SMBUS_WRITE) {
@@ -917,8 +912,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		       SMBAUXCTL(priv));
 
 	if (block)
-		ret = i801_block_transaction(priv, data, read_write, size,
-					     hwpec);
+		ret = i801_block_transaction(priv, data, read_write, size);
 	else
 		ret = i801_transaction(priv, xact);
 
@@ -1690,6 +1684,7 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
 	unsigned char hstcfg = priv->original_hstcfg;
 
 	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
+	hstcfg &= ~SMBHSTCNT_PEC_EN;	/* Disable software PEC */
 	hstcfg |= SMBHSTCFG_HST_EN;
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
 }
-- 
2.32.0

