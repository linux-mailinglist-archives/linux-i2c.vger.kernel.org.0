Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00076353E0E
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 12:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237355AbhDEJDi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 05:03:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15543 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237687AbhDEJDd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Apr 2021 05:03:33 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FDPky5t5mzPnpt
        for <linux-i2c@vger.kernel.org>; Mon,  5 Apr 2021 17:00:42 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 5 Apr 2021 17:03:24 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <linux-i2c@vger.kernel.org>
Subject: [PATCH drivers/i2c 1/3] i2c: amd8111: Fix coding style issues
Date:   Mon, 5 Apr 2021 17:03:48 +0800
Message-ID: <1617613430-11921-2-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following checkpatch errors:

  ERROR: "foo * bar" should be "foo *bar"
  #189: FILE: drivers/i2c/busses/i2c-amd8111.c:189:

  ERROR: "foo * bar" should be "foo *bar"
  #191: FILE: drivers/i2c/busses/i2c-amd8111.c:191:

  ERROR: switch and case should be at the same indent
  #201: FILE: drivers/i2c/busses/i2c-amd8111.c:201:

  ERROR: switch and case should be at the same indent
  #359: FILE: drivers/i2c/busses/i2c-amd8111.c:359:

No functional changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
Cc: Jean Delvare <jdelvare@suse.com>
---
 drivers/i2c/busses/i2c-amd8111.c | 268 +++++++++++++++++++--------------------
 1 file changed, 134 insertions(+), 134 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd8111.c b/drivers/i2c/busses/i2c-amd8111.c
index 34862ad..1ed7e94 100644
--- a/drivers/i2c/busses/i2c-amd8111.c
+++ b/drivers/i2c/busses/i2c-amd8111.c
@@ -186,9 +186,9 @@ static int amd_ec_write(struct amd_smbus *smbus, unsigned char address,
 #define AMD_SMB_PRTCL_PEC		0x80
 
 
-static s32 amd8111_access(struct i2c_adapter * adap, u16 addr,
+static s32 amd8111_access(struct i2c_adapter *adap, u16 addr,
 		unsigned short flags, char read_write, u8 command, int size,
-		union i2c_smbus_data * data)
+		union i2c_smbus_data *data)
 {
 	struct amd_smbus *smbus = adap->algo_data;
 	unsigned char protocol, len, pec, temp[2];
@@ -199,130 +199,130 @@ static s32 amd8111_access(struct i2c_adapter * adap, u16 addr,
 	pec = (flags & I2C_CLIENT_PEC) ? AMD_SMB_PRTCL_PEC : 0;
 
 	switch (size) {
-		case I2C_SMBUS_QUICK:
-			protocol |= AMD_SMB_PRTCL_QUICK;
-			read_write = I2C_SMBUS_WRITE;
-			break;
-
-		case I2C_SMBUS_BYTE:
-			if (read_write == I2C_SMBUS_WRITE) {
-				status = amd_ec_write(smbus, AMD_SMB_CMD,
-						      command);
-				if (status)
-					return status;
-			}
-			protocol |= AMD_SMB_PRTCL_BYTE;
-			break;
-
-		case I2C_SMBUS_BYTE_DATA:
-			status = amd_ec_write(smbus, AMD_SMB_CMD, command);
+	case I2C_SMBUS_QUICK:
+		protocol |= AMD_SMB_PRTCL_QUICK;
+		read_write = I2C_SMBUS_WRITE;
+		break;
+
+	case I2C_SMBUS_BYTE:
+		if (read_write == I2C_SMBUS_WRITE) {
+			status = amd_ec_write(smbus, AMD_SMB_CMD,
+						command);
 			if (status)
 				return status;
-			if (read_write == I2C_SMBUS_WRITE) {
-				status = amd_ec_write(smbus, AMD_SMB_DATA,
-						      data->byte);
-				if (status)
-					return status;
-			}
-			protocol |= AMD_SMB_PRTCL_BYTE_DATA;
-			break;
+		}
+		protocol |= AMD_SMB_PRTCL_BYTE;
+		break;
 
-		case I2C_SMBUS_WORD_DATA:
-			status = amd_ec_write(smbus, AMD_SMB_CMD, command);
+	case I2C_SMBUS_BYTE_DATA:
+		status = amd_ec_write(smbus, AMD_SMB_CMD, command);
+		if (status)
+			return status;
+		if (read_write == I2C_SMBUS_WRITE) {
+			status = amd_ec_write(smbus, AMD_SMB_DATA,
+						data->byte);
 			if (status)
 				return status;
-			if (read_write == I2C_SMBUS_WRITE) {
-				status = amd_ec_write(smbus, AMD_SMB_DATA,
-						      data->word & 0xff);
-				if (status)
-					return status;
-				status = amd_ec_write(smbus, AMD_SMB_DATA + 1,
-						      data->word >> 8);
-				if (status)
-					return status;
-			}
-			protocol |= AMD_SMB_PRTCL_WORD_DATA | pec;
-			break;
+		}
+		protocol |= AMD_SMB_PRTCL_BYTE_DATA;
+		break;
 
-		case I2C_SMBUS_BLOCK_DATA:
-			status = amd_ec_write(smbus, AMD_SMB_CMD, command);
-			if (status)
-				return status;
-			if (read_write == I2C_SMBUS_WRITE) {
-				len = min_t(u8, data->block[0],
-					    I2C_SMBUS_BLOCK_MAX);
-				status = amd_ec_write(smbus, AMD_SMB_BCNT, len);
-				if (status)
-					return status;
-				for (i = 0; i < len; i++) {
-					status =
-					  amd_ec_write(smbus, AMD_SMB_DATA + i,
-						       data->block[i + 1]);
-					if (status)
-						return status;
-				}
-			}
-			protocol |= AMD_SMB_PRTCL_BLOCK_DATA | pec;
-			break;
-
-		case I2C_SMBUS_I2C_BLOCK_DATA:
-			len = min_t(u8, data->block[0],
-				    I2C_SMBUS_BLOCK_MAX);
-			status = amd_ec_write(smbus, AMD_SMB_CMD, command);
-			if (status)
-				return status;
-			status = amd_ec_write(smbus, AMD_SMB_BCNT, len);
-			if (status)
-				return status;
-			if (read_write == I2C_SMBUS_WRITE)
-				for (i = 0; i < len; i++) {
-					status =
-					  amd_ec_write(smbus, AMD_SMB_DATA + i,
-						       data->block[i + 1]);
-					if (status)
-						return status;
-				}
-			protocol |= AMD_SMB_PRTCL_I2C_BLOCK_DATA;
-			break;
-
-		case I2C_SMBUS_PROC_CALL:
-			status = amd_ec_write(smbus, AMD_SMB_CMD, command);
-			if (status)
-				return status;
+	case I2C_SMBUS_WORD_DATA:
+		status = amd_ec_write(smbus, AMD_SMB_CMD, command);
+		if (status)
+			return status;
+		if (read_write == I2C_SMBUS_WRITE) {
 			status = amd_ec_write(smbus, AMD_SMB_DATA,
-					      data->word & 0xff);
+						data->word & 0xff);
 			if (status)
 				return status;
 			status = amd_ec_write(smbus, AMD_SMB_DATA + 1,
-					      data->word >> 8);
+						data->word >> 8);
 			if (status)
 				return status;
-			protocol = AMD_SMB_PRTCL_PROC_CALL | pec;
-			read_write = I2C_SMBUS_READ;
-			break;
+		}
+		protocol |= AMD_SMB_PRTCL_WORD_DATA | pec;
+		break;
 
-		case I2C_SMBUS_BLOCK_PROC_CALL:
+	case I2C_SMBUS_BLOCK_DATA:
+		status = amd_ec_write(smbus, AMD_SMB_CMD, command);
+		if (status)
+			return status;
+		if (read_write == I2C_SMBUS_WRITE) {
 			len = min_t(u8, data->block[0],
-				    I2C_SMBUS_BLOCK_MAX - 1);
-			status = amd_ec_write(smbus, AMD_SMB_CMD, command);
-			if (status)
-				return status;
+					I2C_SMBUS_BLOCK_MAX);
 			status = amd_ec_write(smbus, AMD_SMB_BCNT, len);
 			if (status)
 				return status;
 			for (i = 0; i < len; i++) {
-				status = amd_ec_write(smbus, AMD_SMB_DATA + i,
-						      data->block[i + 1]);
+				status =
+					amd_ec_write(smbus, AMD_SMB_DATA + i,
+						data->block[i + 1]);
 				if (status)
 					return status;
 			}
-			protocol = AMD_SMB_PRTCL_BLOCK_PROC_CALL | pec;
-			read_write = I2C_SMBUS_READ;
-			break;
+		}
+		protocol |= AMD_SMB_PRTCL_BLOCK_DATA | pec;
+		break;
+
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		len = min_t(u8, data->block[0],
+				I2C_SMBUS_BLOCK_MAX);
+		status = amd_ec_write(smbus, AMD_SMB_CMD, command);
+		if (status)
+			return status;
+		status = amd_ec_write(smbus, AMD_SMB_BCNT, len);
+		if (status)
+			return status;
+		if (read_write == I2C_SMBUS_WRITE)
+			for (i = 0; i < len; i++) {
+				status =
+					amd_ec_write(smbus, AMD_SMB_DATA + i,
+						data->block[i + 1]);
+				if (status)
+					return status;
+			}
+		protocol |= AMD_SMB_PRTCL_I2C_BLOCK_DATA;
+		break;
 
-		default:
-			dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
-			return -EOPNOTSUPP;
+	case I2C_SMBUS_PROC_CALL:
+		status = amd_ec_write(smbus, AMD_SMB_CMD, command);
+		if (status)
+			return status;
+		status = amd_ec_write(smbus, AMD_SMB_DATA,
+					data->word & 0xff);
+		if (status)
+			return status;
+		status = amd_ec_write(smbus, AMD_SMB_DATA + 1,
+					data->word >> 8);
+		if (status)
+			return status;
+		protocol = AMD_SMB_PRTCL_PROC_CALL | pec;
+		read_write = I2C_SMBUS_READ;
+		break;
+
+	case I2C_SMBUS_BLOCK_PROC_CALL:
+		len = min_t(u8, data->block[0],
+				I2C_SMBUS_BLOCK_MAX - 1);
+		status = amd_ec_write(smbus, AMD_SMB_CMD, command);
+		if (status)
+			return status;
+		status = amd_ec_write(smbus, AMD_SMB_BCNT, len);
+		if (status)
+			return status;
+		for (i = 0; i < len; i++) {
+			status = amd_ec_write(smbus, AMD_SMB_DATA + i,
+						data->block[i + 1]);
+			if (status)
+				return status;
+		}
+		protocol = AMD_SMB_PRTCL_BLOCK_PROC_CALL | pec;
+		read_write = I2C_SMBUS_READ;
+		break;
+
+	default:
+		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		return -EOPNOTSUPP;
 	}
 
 	status = amd_ec_write(smbus, AMD_SMB_ADDR, addr << 1);
@@ -357,40 +357,40 @@ static s32 amd8111_access(struct i2c_adapter * adap, u16 addr,
 		return 0;
 
 	switch (size) {
-		case I2C_SMBUS_BYTE:
-		case I2C_SMBUS_BYTE_DATA:
-			status = amd_ec_read(smbus, AMD_SMB_DATA, &data->byte);
-			if (status)
-				return status;
-			break;
+	case I2C_SMBUS_BYTE:
+	case I2C_SMBUS_BYTE_DATA:
+		status = amd_ec_read(smbus, AMD_SMB_DATA, &data->byte);
+		if (status)
+			return status;
+		break;
 
-		case I2C_SMBUS_WORD_DATA:
-		case I2C_SMBUS_PROC_CALL:
-			status = amd_ec_read(smbus, AMD_SMB_DATA, temp + 0);
-			if (status)
-				return status;
-			status = amd_ec_read(smbus, AMD_SMB_DATA + 1, temp + 1);
-			if (status)
-				return status;
-			data->word = (temp[1] << 8) | temp[0];
-			break;
+	case I2C_SMBUS_WORD_DATA:
+	case I2C_SMBUS_PROC_CALL:
+		status = amd_ec_read(smbus, AMD_SMB_DATA, temp + 0);
+		if (status)
+			return status;
+		status = amd_ec_read(smbus, AMD_SMB_DATA + 1, temp + 1);
+		if (status)
+			return status;
+		data->word = (temp[1] << 8) | temp[0];
+		break;
 
-		case I2C_SMBUS_BLOCK_DATA:
-		case I2C_SMBUS_BLOCK_PROC_CALL:
-			status = amd_ec_read(smbus, AMD_SMB_BCNT, &len);
+	case I2C_SMBUS_BLOCK_DATA:
+	case I2C_SMBUS_BLOCK_PROC_CALL:
+		status = amd_ec_read(smbus, AMD_SMB_BCNT, &len);
+		if (status)
+			return status;
+		len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
+		fallthrough;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		for (i = 0; i < len; i++) {
+			status = amd_ec_read(smbus, AMD_SMB_DATA + i,
+						data->block + i + 1);
 			if (status)
 				return status;
-			len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
-			fallthrough;
-		case I2C_SMBUS_I2C_BLOCK_DATA:
-			for (i = 0; i < len; i++) {
-				status = amd_ec_read(smbus, AMD_SMB_DATA + i,
-						     data->block + i + 1);
-				if (status)
-					return status;
-			}
-			data->block[0] = len;
-			break;
+		}
+		data->block[0] = len;
+		break;
 	}
 
 	return 0;
-- 
2.7.4

