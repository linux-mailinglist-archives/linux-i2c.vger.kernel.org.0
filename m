Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D8B497A66
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 09:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236417AbiAXIbr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 03:31:47 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]:53150 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242127AbiAXIbp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 03:31:45 -0500
Received: by codeconstruct.com.au (Postfix, from userid 10001)
        id B54BD2030D; Mon, 24 Jan 2022 16:31:37 +0800 (AWST)
From:   Matt Johnston <matt@codeconstruct.com.au>
Cc:     linux-i2c@vger.kernel.org, Daniel Stodden <dns@arista.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jeremy Kerr <jk@codeconstruct.com.au>
Subject: [PATCH v2 1/4] i2c: core: Allow 255 byte transfers for SMBus 3.x
Date:   Mon, 24 Jan 2022 16:31:28 +0800
Message-Id: <20220124083131.417420-2-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124083131.417420-1-matt@codeconstruct.com.au>
References: <20220124083131.417420-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SMBus 3.0 increased the maximum block transfer size from 32 bytes to
255 bytes. We increase the size of struct i2c_smbus_data's block[]
member.

i2c_smbus_xfer() and i2c_smbus_xfer_emulated() now support 255 byte
block operations, other block functions remain limited to 32 bytes for
compatibility with existing callers.

We allow adapters to indicate support for the larger size with
I2C_FUNC_SMBUS3_BLOCKSIZE. Most emulated drivers should be able to use
255 byte blocks by replacing I2C_SMBUS_BLOCK_MAX with
I2C_SMBUS3_BLOCK_MAX though some will have hardware limitations that
need testing.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 drivers/i2c/i2c-core-smbus.c | 20 +++++++++++++-------
 include/uapi/linux/i2c.h     | 16 +++++++++++-----
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e5b2d1465e7e..5c0706e632f3 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -303,7 +303,8 @@ static void i2c_smbus_try_get_dmabuf(struct i2c_msg *msg, u8 init_val)
 	bool is_read = msg->flags & I2C_M_RD;
 	unsigned char *dma_buf;
 
-	dma_buf = kzalloc(I2C_SMBUS_BLOCK_MAX + (is_read ? 2 : 3), GFP_KERNEL);
+	dma_buf = kzalloc(I2C_SMBUS3_BLOCK_MAX + (is_read ? 2 : 3),
+		GFP_KERNEL);
 	if (!dma_buf)
 		return;
 
@@ -329,9 +330,10 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	 * initialize most things with sane defaults, to keep the code below
 	 * somewhat simpler.
 	 */
-	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
-	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
+	unsigned char msgbuf0[I2C_SMBUS3_BLOCK_MAX+3];
+	unsigned char msgbuf1[I2C_SMBUS3_BLOCK_MAX+2];
 	int nmsgs = read_write == I2C_SMBUS_READ ? 2 : 1;
+	u16 block_max;
 	u8 partial_pec = 0;
 	int status;
 	struct i2c_msg msg[2] = {
@@ -350,6 +352,10 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	bool wants_pec = ((flags & I2C_CLIENT_PEC) && size != I2C_SMBUS_QUICK
 			  && size != I2C_SMBUS_I2C_BLOCK_DATA);
 
+	/* Drivers must opt in to 255 byte max block size */
+	block_max = i2c_check_functionality(adapter, I2C_FUNC_SMBUS3_BLOCKSIZE)
+			? I2C_SMBUS3_BLOCK_MAX : I2C_SMBUS_BLOCK_MAX;
+
 	msgbuf0[0] = command;
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -399,7 +405,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			i2c_smbus_try_get_dmabuf(&msg[1], 0);
 		} else {
 			msg[0].len = data->block[0] + 2;
-			if (msg[0].len > I2C_SMBUS_BLOCK_MAX + 2) {
+			if (msg[0].len > block_max + 2) {
 				dev_err(&adapter->dev,
 					"Invalid block write size %d\n",
 					data->block[0]);
@@ -413,7 +419,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	case I2C_SMBUS_BLOCK_PROC_CALL:
 		nmsgs = 2; /* Another special case */
 		read_write = I2C_SMBUS_READ;
-		if (data->block[0] > I2C_SMBUS_BLOCK_MAX) {
+		if (data->block[0] > block_max) {
 			dev_err(&adapter->dev,
 				"Invalid block write size %d\n",
 				data->block[0]);
@@ -430,7 +436,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		i2c_smbus_try_get_dmabuf(&msg[1], 0);
 		break;
 	case I2C_SMBUS_I2C_BLOCK_DATA:
-		if (data->block[0] > I2C_SMBUS_BLOCK_MAX) {
+		if (data->block[0] > block_max) {
 			dev_err(&adapter->dev, "Invalid block %s size %d\n",
 				read_write == I2C_SMBUS_READ ? "read" : "write",
 				data->block[0]);
@@ -498,7 +504,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			break;
 		case I2C_SMBUS_BLOCK_DATA:
 		case I2C_SMBUS_BLOCK_PROC_CALL:
-			if (msg[1].buf[0] > I2C_SMBUS_BLOCK_MAX) {
+			if (msg[1].buf[0] > block_max) {
 				dev_err(&adapter->dev,
 					"Invalid block size returned: %d\n",
 					msg[1].buf[0]);
diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 92326ebde350..b7e1100ca3be 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -108,6 +108,7 @@ struct i2c_msg {
 #define I2C_FUNC_SMBUS_READ_I2C_BLOCK	0x04000000 /* I2C-like block xfer  */
 #define I2C_FUNC_SMBUS_WRITE_I2C_BLOCK	0x08000000 /* w/ 1-byte reg. addr. */
 #define I2C_FUNC_SMBUS_HOST_NOTIFY	0x10000000 /* SMBus 2.0 or later */
+#define I2C_FUNC_SMBUS3_BLOCKSIZE	0x20000000 /* Device supports 255 byte block */
 
 #define I2C_FUNC_SMBUS_BYTE		(I2C_FUNC_SMBUS_READ_BYTE | \
 					 I2C_FUNC_SMBUS_WRITE_BYTE)
@@ -137,11 +138,13 @@ struct i2c_msg {
 /*
  * Data for SMBus Messages
  */
-#define I2C_SMBUS_BLOCK_MAX	32	/* As specified in SMBus standard */
+#define I2C_SMBUS_BLOCK_MAX	32	/* As specified in SMBus standard < 3.0 */
+#define I2C_SMBUS3_BLOCK_MAX	255	/* As specified in SMBus 3.0 */
+
 union i2c_smbus_data {
 	__u8 byte;
 	__u16 word;
-	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for length */
+	__u8 block[I2C_SMBUS3_BLOCK_MAX + 2]; /* block[0] is used for length */
 			       /* and one more for user-space compatibility */
 };
 
@@ -156,9 +159,12 @@ union i2c_smbus_data {
 #define I2C_SMBUS_BYTE_DATA	    2
 #define I2C_SMBUS_WORD_DATA	    3
 #define I2C_SMBUS_PROC_CALL	    4
-#define I2C_SMBUS_BLOCK_DATA	    5
+#define I2C_SMBUS1_BLOCK_DATA	    5 /* Legacy 32 byte block limit */
 #define I2C_SMBUS_I2C_BLOCK_BROKEN  6
-#define I2C_SMBUS_BLOCK_PROC_CALL   7		/* SMBus 2.0 */
-#define I2C_SMBUS_I2C_BLOCK_DATA    8
+#define I2C_SMBUS1_BLOCK_PROC_CALL  7 /* SMBus 2.0, legacy 32 byte block limit */
+#define I2C_SMBUS1_I2C_BLOCK_DATA   8 /* Legacy 32 byte block limit */
+#define I2C_SMBUS_BLOCK_DATA        9 /* Smbus 3.0, 255 byte limit */
+#define I2C_SMBUS_BLOCK_PROC_CALL  10 /* Smbus 3.0, 255 byte limit */
+#define I2C_SMBUS_I2C_BLOCK_DATA   11 /* Smbus 3.0, 255 byte limit */
 
 #endif /* _UAPI_LINUX_I2C_H */
-- 
2.32.0

