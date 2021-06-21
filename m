Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5033AF737
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jun 2021 23:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhFUVLM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Jun 2021 17:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhFUVLM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Jun 2021 17:11:12 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE90C061574
        for <linux-i2c@vger.kernel.org>; Mon, 21 Jun 2021 14:08:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id s15so20828474edt.13
        for <linux-i2c@vger.kernel.org>; Mon, 21 Jun 2021 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Hzps9jYx1XsYbJ/tT9/yW4FfhUU1P1/OCxReaTL617Y=;
        b=oIOm7AKha8jO6rkUleUcFO2Wd91rDx+7Dl6RXkH6KT/mbjOwHW0gN9dN/Xoee7F5uy
         76rBA+aRWlxZAOHq052M6u/DqXEETE0RfFqlkiACLHLZrL+E8HuARE1tjyT/ST3/0p9k
         9U1E2bBCWlarX0EqhHwclIX1aOLgF9x5Tx+yhtv+AnT8W81eVkKl4zXzx/OIARVcnZVC
         R05lLGdeOl/1HNvNZICJMBA1OB4S7FrVeG5/8SngAzJJ615qcPnPkmDQTFJVQTjNrXwt
         6Z5Mn6M4TXBFjIhyi6JE1qxZp4/KLBw5Ix5m24D/vRJGWBJnaiRkEA6SvHaR21kK8dQ9
         BB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Hzps9jYx1XsYbJ/tT9/yW4FfhUU1P1/OCxReaTL617Y=;
        b=bBKWbGgoqkw7NmWzZpVYrC2jpHsmwkcFKcVD+R7UBnF1NVdiIF8ciHA83DnCIjB9HW
         dd6qY/1ag5OFkFK1jWnyveX9STZHtnO3DMDazqYtz1938ZCR/8b6ak7k4UAKZYADVBWj
         huCIjmNPpMZYEnCB8qDzQCaKaGMa39USXv2MQhNQblTkA1ZbRRBXr5UQ98R8vj5/o4B9
         TAhsuRlGxp4sCmHZkWpEJXidgJiA4wXMqICudUpRDMcmIKAk3/f5MmMK/CTtiB7uY19f
         AfVJk+MzZsWUyljLeX8XN9M8FcjnhiSXehao4k/B2+dDzjtKQbUjcwyKoMAZNDjN39a2
         HW7g==
X-Gm-Message-State: AOAM5308MbRIOjWDoSTunsn14KA+e4z3tOVGUq4rTJe2Fu7EF6YB/FZX
        96uUCaiavvb+Bh0esNfsgopZwlPFb+PRCg==
X-Google-Smtp-Source: ABdhPJxrYtm4RrSStXavLqnz2fD4UETpcLYrF/5cBn7Dvbdux1Vq1ye6ixG61V2Pk1gWUY7ZHtU5/w==
X-Received: by 2002:a50:ff01:: with SMTP id a1mr408592edu.253.1624309734263;
        Mon, 21 Jun 2021 14:08:54 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f29:3800:dc3d:e9f8:f609:79a8? (p200300ea8f293800dc3de9f8f60979a8.dip0.t-ipconnect.de. [2003:ea:8f29:3800:dc3d:e9f8:f609:79a8])
        by smtp.googlemail.com with ESMTPSA id fl21sm5262074ejc.79.2021.06.21.14.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 14:08:53 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Fix handling SMBHSTCNT_PEC_EN
Message-ID: <15db81d0-ddbd-b590-3996-51e588c5b10a@gmail.com>
Date:   Mon, 21 Jun 2021 23:08:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
---
This patch may be a candidate for stable (with a little bit of fuzz)
once somebody with a PEC-capable device has tested it.
---
 drivers/i2c/busses/i2c-i801.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 0153a21f4..161176fcd 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -516,12 +516,9 @@ static int i801_transaction(struct i801_priv *priv, int xact)
 
 static int i801_block_transaction_by_block(struct i801_priv *priv,
 					   union i2c_smbus_data *data,
-					   char read_write, int command,
-					   int hwpec)
+					   char read_write, int command)
 {
-	int i, len;
-	int status;
-	int xact = hwpec ? SMBHSTCNT_PEC_EN : 0;
+	int i, len, status, xact = 0;
 
 	switch (command) {
 	case I2C_SMBUS_BLOCK_PROC_CALL:
@@ -678,8 +675,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
  */
 static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 					       union i2c_smbus_data *data,
-					       char read_write, int command,
-					       int hwpec)
+					       char read_write, int command)
 {
 	int i, len;
 	int smbcmd;
@@ -777,9 +773,8 @@ static int i801_set_block_buffer_mode(struct i801_priv *priv)
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
@@ -815,11 +810,11 @@ static int i801_block_transaction(struct i801_priv *priv,
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
@@ -936,8 +931,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		       SMBAUXCTL(priv));
 
 	if (block)
-		ret = i801_block_transaction(priv, data, read_write, size,
-					     hwpec);
+		ret = i801_block_transaction(priv, data, read_write, size);
 	else
 		ret = i801_transaction(priv, xact);
 
@@ -1625,6 +1619,7 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
 	unsigned char hstcfg = priv->original_hstcfg;
 
 	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
+	hstcfg &= ~SMBHSTCNT_PEC_EN;
 	hstcfg |= SMBHSTCFG_HST_EN;
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
 
-- 
2.32.0

