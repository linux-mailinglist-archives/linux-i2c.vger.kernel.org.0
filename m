Return-Path: <linux-i2c+bounces-10077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC7A77984
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 13:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC92E3AC623
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 11:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA28D1F1902;
	Tue,  1 Apr 2025 11:26:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760651E5B7E;
	Tue,  1 Apr 2025 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506776; cv=none; b=eQ2uIzfPq022uuT6YHZE+SyaTR6uScIBrmksBi2YRTfOSDNGcMtblZpNddSZteDmGT9dC7o7BuUVmnErSJAY6kA7NpHHkxckuLEq21YoDRbmjf31btuEyEr+rbhTpRADgaS7ijiJjkEEivnc9zOzJ+IGNcmQ3Rf45P77pPWHinw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506776; c=relaxed/simple;
	bh=zoPSDo7tdhtE3qurVVo42MaDdzHKssSDq/6EMSeyRtg=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=JKFE0sXvZCVqzLv6vtdplkX38WepvSz9jjxe2m70mKxjojK4OxNoyn+Cov58GXO2pdaK3cgasmpgWE4Abd1Povf+LflIEexFGIbQbW46C6dttvuXvNQntAfC6/sWSu2r7HULvKBn7M9nC0Ru4NL86gSJxo5trmds7o3IvGdpQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZRm0M4BgYz5B1KS;
	Tue,  1 Apr 2025 19:26:11 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 531BQ0Lu086035;
	Tue, 1 Apr 2025 19:26:00 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 1 Apr 2025 19:26:03 +0800 (CST)
Date: Tue, 1 Apr 2025 19:26:03 +0800 (CST)
X-Zmail-TransId: 2afa67ebcd4bffffffffaa4-8ca27
X-Mailer: Zmail v1.0
Message-ID: <20250401192603311H5OxuFmUSbPc4VnQQkhZr@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <kblaiech@nvidia.com>
Cc: <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <asmaa@nvidia.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <feng.wei8@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IG1seGJmOiBVc2Ugc3RyX3JlYWRfd3JpdGUoKSBoZWxwZXI=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 531BQ0Lu086035
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EBCD53.001/4ZRm0M4BgYz5B1KS

From: Feng Wei <feng.wei8@zte.com.cn>

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Feng Wei <feng.wei8@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/i2c/busses/i2c-mlxbf.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 280dde53d7f3..2e8291e96323 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>

 /* Defines what functionality is present. */
 #define MLXBF_I2C_FUNC_SMBUS_BLOCK \
@@ -2038,21 +2039,21 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 					  read ? &data->byte : &command, read,
 					  pec);
 		dev_dbg(&adap->dev, "smbus %s byte, slave 0x%02x.\n",
-			read ? "read" : "write", addr);
+			str_read_write(read), addr);
 		break;

 	case I2C_SMBUS_BYTE_DATA:
 		mlxbf_i2c_smbus_data_byte_func(&request, &command, &data->byte,
 					       read, pec);
 		dev_dbg(&adap->dev, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
-			read ? "read" : "write", command, addr);
+			str_read_write(read), command, addr);
 		break;

 	case I2C_SMBUS_WORD_DATA:
 		mlxbf_i2c_smbus_data_word_func(&request, &command,
 					       (u8 *)&data->word, read, pec);
 		dev_dbg(&adap->dev, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
-			read ? "read" : "write", command, addr);
+			str_read_write(read), command, addr);
 		break;

 	case I2C_SMBUS_I2C_BLOCK_DATA:
@@ -2060,7 +2061,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		mlxbf_i2c_smbus_i2c_block_func(&request, &command, data->block,
 					       &byte_cnt, read, pec);
 		dev_dbg(&adap->dev, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
-			read ? "read" : "write", byte_cnt, command, addr);
+			str_read_write(read), byte_cnt, command, addr);
 		break;

 	case I2C_SMBUS_BLOCK_DATA:
@@ -2068,7 +2069,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		mlxbf_i2c_smbus_block_func(&request, &command, data->block,
 					   &byte_cnt, read, pec);
 		dev_dbg(&adap->dev, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
-			read ? "read" : "write", byte_cnt, command, addr);
+			str_read_write(read), byte_cnt, command, addr);
 		break;

 	case I2C_FUNC_SMBUS_PROC_CALL:
-- 
2.25.1

