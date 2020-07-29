Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2002232664
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jul 2020 22:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgG2Uor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 16:44:47 -0400
Received: from mx.aristanetworks.com ([162.210.129.12]:60753 "EHLO
        smtp.aristanetworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgG2Uor (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 16:44:47 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Jul 2020 16:44:46 EDT
Received: from dns-buster.sjc.aristanetworks.com. (us178.sjc.aristanetworks.com [10.243.128.5])
        by smtp.aristanetworks.com (Postfix) with ESMTPS id DEF32401893;
        Wed, 29 Jul 2020 13:37:15 -0700 (PDT)
From:   daniel.stodden@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     dns@arista.com, jdelvare@suse.de
Subject: [RFC PATCH v2] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
Date:   Wed, 29 Jul 2020 20:36:58 +0000
Message-Id: <20200729203658.411-1-daniel.stodden@gmail.com>
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Daniel Stodden <dns@arista.com>

WIP, v2. (And still haven't had an opportunity to verify, but rsn.)

Updates since v1:

 * Prefer stack storage for user_len[] in i2cdev_ioctl_rdwr. Sized 84
   bytes, small enough to not kmalloc.

 * Keep original transfer type values around. For reference, and
   possibly for reverse compatibility (new code on old kernels).

 * Renames old transfer types to I2C_SMBUS1_*, assigns new transfer
   type values to old names.

 * Promotes new transfer types via source compatibility. This is not
   necessarily the agreed solution, just a proposed one.

 * Define I2C_FUNC_SMBUS3_BLOCKSIZE 0x20000000.  No use yet, assuming
   only adapter implementations will employ it.

Ongoing:

 * Like v1, I2C_SMBUS and I2C_RDWR return -EMSGSIZE to legacy clients,
   if the client buffer is 32 bytes but the device produced > 32
   bytes.

   Like the -EFAULT case, code will truncate data, but copy what can
   be copied before returning. Not 100% sure if this is really useful,
   or if truncated data should return 0 and rely on the client to
   figure it out.

   PS: I didn't notice the 'while (res >= 0..' in I2C_RDWR when I
       wrote that. But one could make it so...? (Or give up.)

   PPS: The old behavior was driver dependent. Some would fail
   	(e.g. piix4, -EPROTO), some would truncate (e.g. viapro).

   I'm starting to lean toward silent truncate, return 0.
   Most permissive.
---
 drivers/i2c/i2c-dev.c    | 77 +++++++++++++++++++++++++++++++++-------
 include/uapi/linux/i2c.h | 16 ++++++---
 2 files changed, 76 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index cb07651f4b46..581b7309210f 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -242,6 +242,7 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		unsigned nmsgs, struct i2c_msg *msgs)
 {
 	u8 __user **data_ptrs;
+	u16 user_len[I2C_RDWR_IOCTL_MAX_MSGS];
 	int i, res;
 
 	data_ptrs = kmalloc_array(nmsgs, sizeof(u8 __user *), GFP_KERNEL);
@@ -268,16 +269,34 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
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
@@ -288,6 +307,21 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 				break;
 			}
 
+			if (msgs[i].len < msgs[i].buf[0] +
+					   I2C_SMBUS3_BLOCK_MAX) {
+				u8* buf =
+					krealloc(msgs[i].buf,
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
@@ -304,8 +338,10 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
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
@@ -319,7 +355,22 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		union i2c_smbus_data __user *data)
 {
 	union i2c_smbus_data temp = {};
-	int datasize, res;
+	int block_max, datasize, res;
+
+	if (size <= I2C_SMBUS1_I2C_BLOCK_DATA) {
+		switch (size) {
+		case I2C_SMBUS1_BLOCK_DATA:
+			size = I2C_SMBUS_BLOCK_DATA;
+			break;
+		case I2C_SMBUS1_BLOCK_PROC_CALL:
+			size = I2C_SMBUS_BLOCK_PROC_CALL;
+			break;
+		case I2C_SMBUS1_I2C_BLOCK_DATA:
+			size = I2C_SMBUS_I2C_BLOCK_DATA;
+		}
+		block_max = I2C_SMBUS_BLOCK_MAX;
+	} else
+		block_max = I2C_SMBUS3_BLOCK_MAX;
 
 	if ((size != I2C_SMBUS_BYTE) &&
 	    (size != I2C_SMBUS_QUICK) &&
@@ -368,7 +419,7 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		 (size == I2C_SMBUS_PROC_CALL))
 		datasize = sizeof(data->word);
 	else /* size == smbus block, i2c block, or block proc. call */
-		datasize = sizeof(data->block);
+		datasize = block_max + 2;
 
 	if ((size == I2C_SMBUS_PROC_CALL) ||
 	    (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
@@ -391,6 +442,8 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		     (read_write == I2C_SMBUS_READ))) {
 		if (copy_to_user(data, &temp, datasize))
 			return -EFAULT;
+		if (temp.block[0] > block_max)
+			return -EMSGSIZE;
 	}
 	return res;
 }
diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index f71a1751cacf..885372f24a3c 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -107,6 +107,7 @@ struct i2c_msg {
 #define I2C_FUNC_SMBUS_READ_I2C_BLOCK	0x04000000 /* I2C-like block xfer  */
 #define I2C_FUNC_SMBUS_WRITE_I2C_BLOCK	0x08000000 /* w/ 1-byte reg. addr. */
 #define I2C_FUNC_SMBUS_HOST_NOTIFY	0x10000000
+#define I2C_FUNC_SMBUS3_BLOCKSIZE	0x20000000
 
 #define I2C_FUNC_SMBUS_BYTE		(I2C_FUNC_SMBUS_READ_BYTE | \
 					 I2C_FUNC_SMBUS_WRITE_BYTE)
@@ -131,11 +132,13 @@ struct i2c_msg {
 /*
  * Data for SMBus Messages
  */
-#define I2C_SMBUS_BLOCK_MAX	32	/* As specified in SMBus standard */
+#define I2C_SMBUS_BLOCK_MAX	32	/* As specified in SMBus standard <= 3.0 */
+#define I2C_SMBUS3_BLOCK_MAX	255	/* As specified in SMBus 3.0 */
+
 union i2c_smbus_data {
 	__u8 byte;
 	__u16 word;
-	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for length */
+	__u8 block[I2C_SMBUS3_BLOCK_MAX + 2]; /* block[0] is used for length */
 			       /* and one more for user-space compatibility */
 };
 
@@ -150,9 +153,12 @@ union i2c_smbus_data {
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
2.20.1

