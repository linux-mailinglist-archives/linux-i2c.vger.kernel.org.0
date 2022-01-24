Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CA1497A64
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 09:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbiAXIbq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 03:31:46 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]:53160 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236417AbiAXIbp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 03:31:45 -0500
Received: by codeconstruct.com.au (Postfix, from userid 10001)
        id 4824420313; Mon, 24 Jan 2022 16:31:38 +0800 (AWST)
From:   Matt Johnston <matt@codeconstruct.com.au>
Cc:     Daniel Stodden <dns@arista.com>, linux-i2c@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>,
        Jeremy Kerr <jk@codeconstruct.com.au>
Subject: [PATCH v2 2/4] i2c: dev: Support smbus3 block size of 255 bytes
Date:   Mon, 24 Jan 2022 16:31:29 +0800
Message-Id: <20220124083131.417420-3-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124083131.417420-1-matt@codeconstruct.com.au>
References: <20220124083131.417420-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Daniel Stodden <dns@arista.com>

* Add 3 new transaction types for
    - I2C_SMBUS_BLOCK_DATA,
    - I2C_SMBUS_BLOCK_PROC_CALL
    - I2C_SMBUS_I2C_BLOCK_DATA

* These take the names of the old types, not a "3" in a new
  transfer name. Meaning new builds will just adapt.

Old/existing binaries will pass the old transaction types. The i2c dev
code handles copying with a 32 byte block_max.

i2cdev_ioctl_smbus() can

1. Test for old transaction types

2. Adjust copy_from_user block length accordingly.

3. Proceed into i2c_smbus_xfer, with smbus3 limits established,
  and size likewise mapped to smbus3 transaction type names,
  for the remainder of the call.

4. upon return from i2c_smbus_xfer, a user block size conflict
  will result in -EMSGSIZE.

Original patch
https://lore.kernel.org/linux-i2c/20200729203658.411-1-daniel.stodden@gmail.com/

Modified by Matt Johnston to treat the transaction types as opaque values
rather than having special meaning for values > I2C_SMBUS1_BLOCK_DATA.
Constants I2C_SMBUS1_... were renamed to I2C_SMBUS2_...

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 drivers/i2c/i2c-dev.c    | 91 +++++++++++++++++++++++++++++++++-------
 include/uapi/linux/i2c.h |  6 +--
 2 files changed, 80 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index cf5d049342ea..b524c62ccfb2 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -50,7 +50,7 @@ struct i2c_dev {
 static LIST_HEAD(i2c_dev_list);
 static DEFINE_SPINLOCK(i2c_dev_list_lock);
 
-static struct i2c_dev *i2c_dev_get_by_minor(unsigned index)
+static struct i2c_dev *i2c_dev_get_by_minor(unsigned int index)
 {
 	struct i2c_dev *i2c_dev;
 
@@ -233,9 +233,10 @@ static int i2cdev_check_addr(struct i2c_adapter *adapter, unsigned int addr)
 }
 
 static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
-		unsigned nmsgs, struct i2c_msg *msgs)
+		unsigned int nmsgs, struct i2c_msg *msgs)
 {
 	u8 __user **data_ptrs;
+	u16 user_len[I2C_RDWR_IOCTL_MAX_MSGS];
 	int i, res;
 
 	data_ptrs = kmalloc_array(nmsgs, sizeof(u8 __user *), GFP_KERNEL);
@@ -262,16 +263,34 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		msgs[i].flags |= I2C_M_DMA_SAFE;
 
 		/*
-		 * If the message length is received from the slave (similar
-		 * to SMBus block read), we must ensure that the buffer will
-		 * be large enough to cope with a message length of
-		 * I2C_SMBUS_BLOCK_MAX as this is the maximum underlying bus
-		 * drivers allow. The first byte in the buffer must be
-		 * pre-filled with the number of extra bytes, which must be
-		 * at least one to hold the message length, but can be
-		 * greater (for example to account for a checksum byte at
-		 * the end of the message.)
+		 * If the block length is received from the slave
+		 * (similar to SMBus block read), we ensure that
+		 *
+		 *  - the user buffer is large enough to hold a
+		 *    message length of I2C_SMBUS_BLOCK_MAX (32), as
+		 *    this is what any Smbus version allows.
+		 *
+		 *  - the kernel buffer is large enough to hold a
+		 *    message length of I2C_SMBUS3_BLOCK_MAX (255),
+		 *    which is what Smbus >= 3.0 allows.
+		 *
+		 * Kernel block lengths up to I2SMBUS3_BLOCK_MAX
+		 * ensure that drivers can always return up to 255
+		 * bytes safely.
+		 *
+		 * User block lengths up to only I2C_SMBUS_BLOCK_MAX
+		 * are supported for backward compatibility. If an
+		 * Smbus 3.0 slave produces a longer message than
+		 * userspace provides for, we truncate the user copy
+		 * and return -EMSGSIZE.
+		 *
+		 * The first byte in the user buffer must be
+		 * pre-filled with the number of extra bytes, at least
+		 * one to hold the message length, but can be greater
+		 * (for example to account for a checksum byte at the
+		 * end of the message.)
 		 */
+		user_len[i] = msgs[i].len;
 		if (msgs[i].flags & I2C_M_RECV_LEN) {
 			if (!(msgs[i].flags & I2C_M_RD) ||
 			    msgs[i].len < 1 || msgs[i].buf[0] < 1 ||
@@ -282,11 +301,26 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 				break;
 			}
 
+			if (msgs[i].len < msgs[i].buf[0] +
+					   I2C_SMBUS3_BLOCK_MAX) {
+				u8 *buf = krealloc(msgs[i].buf,
+						 msgs[i].buf[0] +
+						 I2C_SMBUS3_BLOCK_MAX,
+						 GFP_KERNEL);
+				if (!buf) {
+					i++;
+					res = -ENOMEM;
+					break;
+				}
+				msgs[i].buf = buf;
+			}
+
 			msgs[i].len = msgs[i].buf[0];
 		}
 	}
 	if (res < 0) {
 		int j;
+
 		for (j = 0; j < i; ++j)
 			kfree(msgs[j].buf);
 		kfree(data_ptrs);
@@ -298,8 +332,10 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 	while (i-- > 0) {
 		if (res >= 0 && (msgs[i].flags & I2C_M_RD)) {
 			if (copy_to_user(data_ptrs[i], msgs[i].buf,
-					 msgs[i].len))
+					 min(msgs[i].len, user_len[i])))
 				res = -EFAULT;
+			if (msgs[i].len > user_len[i])
+				res = res ? : -EMSGSIZE;
 		}
 		kfree(msgs[i].buf);
 	}
@@ -313,7 +349,28 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		union i2c_smbus_data __user *data)
 {
 	union i2c_smbus_data temp = {};
-	int datasize, res;
+	int block_max, datasize, res;
+
+	/* Limit legacy transaction types to 32 blocksize */
+	switch (size) {
+	case I2C_SMBUS2_BLOCK_DATA:
+		size = I2C_SMBUS_BLOCK_DATA;
+		block_max = I2C_SMBUS_BLOCK_MAX;
+		break;
+	case I2C_SMBUS2_BLOCK_PROC_CALL:
+		size = I2C_SMBUS_BLOCK_PROC_CALL;
+		block_max = I2C_SMBUS_BLOCK_MAX;
+		break;
+	case I2C_SMBUS2_I2C_BLOCK_DATA:
+		size = I2C_SMBUS_I2C_BLOCK_DATA;
+		block_max = I2C_SMBUS_BLOCK_MAX;
+		break;
+	case I2C_SMBUS_I2C_BLOCK_BROKEN:
+		block_max = I2C_SMBUS_BLOCK_MAX;
+		break;
+	default:
+		block_max = I2C_SMBUS3_BLOCK_MAX;
+	}
 
 	if ((size != I2C_SMBUS_BYTE) &&
 	    (size != I2C_SMBUS_QUICK) &&
@@ -362,7 +419,7 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		 (size == I2C_SMBUS_PROC_CALL))
 		datasize = sizeof(data->word);
 	else /* size == smbus block, i2c block, or block proc. call */
-		datasize = sizeof(data->block);
+		datasize = block_max + 2;
 
 	if ((size == I2C_SMBUS_PROC_CALL) ||
 	    (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
@@ -385,6 +442,8 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		     (read_write == I2C_SMBUS_READ))) {
 		if (copy_to_user(data, &temp, datasize))
 			return -EFAULT;
+		if (temp.block[0] > block_max)
+			return -EMSGSIZE;
 	}
 	return res;
 }
@@ -460,6 +519,7 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	case I2C_SMBUS: {
 		struct i2c_smbus_ioctl_data data_arg;
+
 		if (copy_from_user(&data_arg,
 				   (struct i2c_smbus_ioctl_data __user *) arg,
 				   sizeof(struct i2c_smbus_ioctl_data)))
@@ -520,6 +580,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 {
 	struct i2c_client *client = file->private_data;
 	unsigned long funcs;
+
 	switch (cmd) {
 	case I2C_FUNCS:
 		funcs = i2c_get_functionality(client->adapter);
@@ -549,6 +610,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 		p = compat_ptr(rdwr_arg.msgs);
 		for (i = 0; i < rdwr_arg.nmsgs; i++) {
 			struct i2c_msg32 umsg;
+
 			if (copy_from_user(&umsg, p + i, sizeof(umsg))) {
 				kfree(rdwr_pa);
 				return -EFAULT;
@@ -565,6 +627,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	}
 	case I2C_SMBUS: {
 		struct i2c_smbus_ioctl_data32	data32;
+
 		if (copy_from_user(&data32,
 				   (void __user *) arg,
 				   sizeof(data32)))
diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index b7e1100ca3be..7cd85594f287 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -159,10 +159,10 @@ union i2c_smbus_data {
 #define I2C_SMBUS_BYTE_DATA	    2
 #define I2C_SMBUS_WORD_DATA	    3
 #define I2C_SMBUS_PROC_CALL	    4
-#define I2C_SMBUS1_BLOCK_DATA	    5 /* Legacy 32 byte block limit */
+#define I2C_SMBUS2_BLOCK_DATA	    5 /* Legacy 32 byte block limit */
 #define I2C_SMBUS_I2C_BLOCK_BROKEN  6
-#define I2C_SMBUS1_BLOCK_PROC_CALL  7 /* SMBus 2.0, legacy 32 byte block limit */
-#define I2C_SMBUS1_I2C_BLOCK_DATA   8 /* Legacy 32 byte block limit */
+#define I2C_SMBUS2_BLOCK_PROC_CALL  7 /* SMBus 2.0, legacy 32 byte block limit */
+#define I2C_SMBUS2_I2C_BLOCK_DATA   8 /* Legacy 32 byte block limit */
 #define I2C_SMBUS_BLOCK_DATA        9 /* Smbus 3.0, 255 byte limit */
 #define I2C_SMBUS_BLOCK_PROC_CALL  10 /* Smbus 3.0, 255 byte limit */
 #define I2C_SMBUS_I2C_BLOCK_DATA   11 /* Smbus 3.0, 255 byte limit */
-- 
2.32.0

