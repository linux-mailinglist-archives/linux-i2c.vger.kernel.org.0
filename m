Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70952F33DE
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 16:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404604AbhALPNT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 10:13:19 -0500
Received: from www.zeus03.de ([194.117.254.33]:42712 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404578AbhALPNS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 10:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=3KzDC+8syWTyvZ
        Mn9GmFYMT4GOAjOIEzOj4X2jJeGRc=; b=z10cvDY/EwwrliGKm+9FR891nxDXHT
        euAY8YBMV633ZRFb6pYph450YVpS8RcGs2Kp2zgZXMM7wmYwyxCdif9U8EGX59qI
        M8QXItQbGxOyfNNZIvUMzrtoM+vPuUwVUYLm27AhUmCvXuzxgbYGSbol+57LvPy/
        tHRadmFVaEXQo=
Received: (qmail 2786184 invoked from network); 12 Jan 2021 16:12:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 16:12:36 +0100
X-UD-Smtp-Session: l3s3148p1@i47fc7W4eL4gAwDPXwxzAXsl+VVkdePs
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: smbus: improve naming in i2c_smbus_xfer_emulated()
Date:   Tue, 12 Jan 2021 16:12:30 +0100
Message-Id: <20210112151230.46518-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112151230.46518-1-wsa+renesas@sang-engineering.com>
References: <20210112151230.46518-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This may be just taste, but I think 'nmsgs' is way more readable than a
generic 'num' variable. Also, fix spaces around operators while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-smbus.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 6cda46913d89..d2d32c0fd8c3 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -323,7 +323,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	 */
 	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
 	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
-	int num = read_write == I2C_SMBUS_READ ? 2 : 1;
+	int nmsgs = read_write == I2C_SMBUS_READ ? 2 : 1;
 	u8 partial_pec = 0;
 	int status;
 	struct i2c_msg msg[2] = {
@@ -349,13 +349,13 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		/* Special case: The read/write field is used as data */
 		msg[0].flags = flags | (read_write == I2C_SMBUS_READ ?
 					I2C_M_RD : 0);
-		num = 1;
+		nmsgs = 1;
 		break;
 	case I2C_SMBUS_BYTE:
 		if (read_write == I2C_SMBUS_READ) {
 			/* Special case: only a read! */
 			msg[0].flags = I2C_M_RD | flags;
-			num = 1;
+			nmsgs = 1;
 		}
 		break;
 	case I2C_SMBUS_BYTE_DATA:
@@ -376,7 +376,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		}
 		break;
 	case I2C_SMBUS_PROC_CALL:
-		num = 2; /* Special case */
+		nmsgs = 2; /* Special case */
 		read_write = I2C_SMBUS_READ;
 		msg[0].len = 3;
 		msg[1].len = 2;
@@ -403,7 +403,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		}
 		break;
 	case I2C_SMBUS_BLOCK_PROC_CALL:
-		num = 2; /* Another special case */
+		nmsgs = 2; /* Another special case */
 		read_write = I2C_SMBUS_READ;
 		if (data->block[0] > I2C_SMBUS_BLOCK_MAX) {
 			dev_err(&adapter->dev,
@@ -447,28 +447,28 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	if (wants_pec) {
 		/* Compute PEC if first message is a write */
 		if (!(msg[0].flags & I2C_M_RD)) {
-			if (num == 1) /* Write only */
+			if (nmsgs == 1) /* Write only */
 				i2c_smbus_add_pec(&msg[0]);
 			else /* Write followed by read */
 				partial_pec = i2c_smbus_msg_pec(0, &msg[0]);
 		}
 		/* Ask for PEC if last message is a read */
-		if (msg[num-1].flags & I2C_M_RD)
-			msg[num-1].len++;
+		if (msg[nmsgs - 1].flags & I2C_M_RD)
+			msg[nmsgs - 1].len++;
 	}
 
-	status = __i2c_transfer(adapter, msg, num);
+	status = __i2c_transfer(adapter, msg, nmsgs);
 	if (status < 0)
 		goto cleanup;
-	if (status != num) {
+	if (status != nmsgs) {
 		status = -EIO;
 		goto cleanup;
 	}
 	status = 0;
 
 	/* Check PEC if last message is a read */
-	if (wants_pec && (msg[num-1].flags & I2C_M_RD)) {
-		status = i2c_smbus_check_pec(partial_pec, &msg[num-1]);
+	if (wants_pec && (msg[nmsgs - 1].flags & I2C_M_RD)) {
+		status = i2c_smbus_check_pec(partial_pec, &msg[nmsgs - 1]);
 		if (status < 0)
 			goto cleanup;
 	}
-- 
2.29.2

