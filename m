Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87BD522FE92
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 02:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgG1Arh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 20:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG1Arh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 20:47:37 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DB6C061794
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 17:47:37 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i92so2228083pje.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 17:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qOl6/hTPRyQTjsHm4JeT/jdbB0t5IXGBPhSoZjFk+AY=;
        b=i8gxLn4JM+w3w5YHEjT9pEmdLi+LkGrun+O3IcTacI5ht16eS/qDVEzVzbuI9trhr0
         ycOvt7eFXr/rIogTQ2n5FZUr6xi0FxYp9shwDVDah8Vhwy+CStJryYO4ivs7xlN/A4QQ
         TZl3WXPU4OnX91jtHIyZMwdqa3teL3DYhgXpNyhkTlM47fc8Uj7pj/yqGeycrmzUt1PS
         yw8m/BWPe8Wc20cVHUu1u13RXFI6bArmx5IeJN0M26KNaPQz4tPFmp3bRTmO+nYa6gso
         HpbzI8gg2lDk95e1qZ8RjpQTKyCmOWeOy/Z1QlAxzSSDOb9LWKrlMexMrnec4fkJm+u/
         Prpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qOl6/hTPRyQTjsHm4JeT/jdbB0t5IXGBPhSoZjFk+AY=;
        b=o5IyxSvIBHFSxCaaZH0Oeaw/xcpBHKybOsCdThC6R+PhvgI7bcPyRbHZKLfM+VSNoo
         E2SB+aB66G4SAMAmWK270IJW0qAyMoatYkxlwAQg9Rlpne7TykrefLncCBHaZx0cV6Nn
         UpDgq6sZxiJW+DBC0HywjzsojQYeAcQI7MkmhaU/fqT1zsk/64tnEM6yaX+B+FoKPzEu
         kaojp3N2AOe3F85aa3vYMHx4bvHE6CRCfzuZAnsN/3SsW1LNiXM3FWJ6qIc1cZ9Ayzla
         XaFfywvpvNvg9y100SDJEIq1z4beXT9eDTebXDGh7ONFxFDxaBJtiCuZNpXeELWQbzeF
         ZEjw==
X-Gm-Message-State: AOAM530Hh84KtIIPZbAS18dBEky11EVUP06gCj/3I+t/LYwYS8pwkI1g
        kz9/ONIo7jBnETxc0juenyp7zzU2dsc=
X-Google-Smtp-Source: ABdhPJw4SzV9Kx6NYuZ6TXPsDKuCs9qWWBXD1Sbd5NfOcNhxKQ+dVK6KnitTCp9qq9Ybs6rU7yOq3A==
X-Received: by 2002:a17:90a:6c97:: with SMTP id y23mr1834451pjj.28.1595897255946;
        Mon, 27 Jul 2020 17:47:35 -0700 (PDT)
Received: from localhost (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id cv7sm760873pjb.9.2020.07.27.17.47.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 17:47:35 -0700 (PDT)
From:   daniel.stodden@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     jdelvare@suse.de, Daniel Stodden <dns@arista.com>
Subject: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
Date:   Tue, 28 Jul 2020 00:47:08 +0000
Message-Id: <20200728004708.4430-1-daniel.stodden@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Daniel Stodden <dns@arista.com>

This is purely WIP, I haven't had a chance to run this myself. Posting
early just to attract some more commentary. But I'm hopeful to have
this running on my own hardware later today.

First revision aims to maintain smallest kernel + user code footprint,
while not breaking compatibility with old user binaries.

That said, I like the direction, but recognize it may not come out of
review as ideal. Maybe it's just small.

 * I suggest to just settle on '3' for new macro and type names
   (I2C_SMBUS3_*, i2c_smbus3_*)

 * Block size definitions maintain I2C_SMBUS_BLOCK_MAX (32). Only adds
   I2C_SMBUS3_BLOCK_MAX (255)

   - Means that drivers in drivers/i2c/busses/ default to their safe
     32B block limit without refactoring.

 * Does not fork i2c_smbus_data, or .block. Instead, new builds may
   adapt, while i2c-dev.c deals with legacy block byte counts as
   numeric limits only. It didn't seem to sacrifice readability.

I2C_SMBUS:

 * Add 3 new transaction types for
     - I2C_SMBUS_BLOCK_DATA,
     - I2C_SMBUS_BLOCK_PROC_CALL
     - I2C_SMBUS_I2C_BLOCK_DATA

 * These take the names of the old types, not a "3" in a new
   transfer name. Meaning new builds will just adapt.

 * Leaves out I2C_SMBUS_I2C_BLOCK_BROKEN, assuming it won't be
   missed.

 * Allocated bit 4 (I2C_SMBUS3_BLOCK=0x10), to simplify Smbus2
   compatibility: I2C_SMBUS_*BLOCK* = (<old type>|0x10)

   Therefore, i2cdev_ioctl_smbus() can

   1. Test for the bit

   2. Adjust copy_from_user block length accordingly.

   3. Proceed into i2c_smbus_xfer, with smbus3 limits established,
      and size likewise mapped to smbus3 transaction type names,
      for the remainder of the call.

   4. upon return from i2c_smbus_xfer, a user block size conflict
      will result in -EMSGSIZE.

I2C_RDWR:

 * No uapi changes.

 * Like i2c_smbus_xfer, kernel i2c_transfer calls assume safe smbus3
   block limits.

 * Like i2cdev_ioctl_smbus, i2cdev_ioctl_rdwr deals with all
   backward compatibility:

   - User block limits assuming 32 bytes are detected and translate
     to and from kernel block limits established at 255 bytes.

   - Upon return from i2c_transfer, a user block size conflict will
     result in -EMSGSIZE.

 * The most straightforward change to adjust kernel buffers it to

   - Memdup msgs[i].len user bytes, as before.
     This makes msgs[i].block[0] available early.

   - Only enforce
          msgs[i].blocks[0] + I2C_SMBUS_BLOCK_MAX
     byte sized user buffers, as used to be.

   - If smaller than I2C_SMBUS3_BLOCK_MAX, krealloc() kernel buffers to
          msgs[i].blocks[0] + I2C_SMBUS3_BLOCK_MAX
     bytes.

   Implies only a small penalty, and on compat calls only. New builds
   walk the preferred path as it used to be. It also results in a
   comparatively small and straightforward diff.
---
 drivers/i2c/i2c-dev.c    | 82 ++++++++++++++++++++++++++++++++++------
 include/uapi/linux/i2c.h | 17 ++++++---
 2 files changed, 81 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index da020acc9bbd..99f291f519b3 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -236,6 +236,7 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		unsigned nmsgs, struct i2c_msg *msgs)
 {
 	u8 __user **data_ptrs;
+	u16 *user_len = NULL;
 	int i, res;
 
 	data_ptrs = kmalloc_array(nmsgs, sizeof(u8 __user *), GFP_KERNEL);
@@ -244,6 +245,12 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
+	user_len = kmalloc_array(nmsgs, sizeof(*user_len), GFP_KERNEL);
+	if (!user_len) {
+		res = -ENOMEM;
+		goto out;
+	}
+
 	res = 0;
 	for (i = 0; i < nmsgs; i++) {
 		/* Limit the size of the message to a sane amount */
@@ -262,16 +269,34 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
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
@@ -282,6 +307,21 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
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
@@ -298,11 +338,15 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
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
+out:
+	kfree(user_len);
 	kfree(data_ptrs);
 	kfree(msgs);
 	return res;
@@ -313,7 +357,19 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		union i2c_smbus_data __user *data)
 {
 	union i2c_smbus_data temp = {};
-	int datasize, res;
+	int block_max, datasize, res;
+
+	if (!(size & I2C_SMBUS3_BLOCK)) {
+		switch (size | I2C_SMBUS3_BLOCK) {
+		case I2C_SMBUS_BLOCK_DATA:
+		case I2C_SMBUS_BLOCK_PROC_CALL:
+		case I2C_SMBUS_I2C_BLOCK_DATA:
+			size |= I2C_SMBUS3_BLOCK;
+		}
+
+		block_max = I2C_SMBUS_BLOCK_MAX;
+	} else
+		block_max = I2C_SMBUS3_BLOCK_MAX;
 
 	if ((size != I2C_SMBUS_BYTE) &&
 	    (size != I2C_SMBUS_QUICK) &&
@@ -362,7 +418,7 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		 (size == I2C_SMBUS_PROC_CALL))
 		datasize = sizeof(data->word);
 	else /* size == smbus block, i2c block, or block proc. call */
-		datasize = sizeof(data->block);
+		datasize = block_max + 2;
 
 	if ((size == I2C_SMBUS_PROC_CALL) ||
 	    (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
@@ -385,6 +441,8 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		     (read_write == I2C_SMBUS_READ))) {
 		if (copy_to_user(data, &temp, datasize))
 			return -EFAULT;
+		if (temp.block[0] > block_max)
+			return -EMSGSIZE;
 	}
 	return res;
 }
diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index f71a1751cacf..93f68de134c1 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -131,11 +131,13 @@ struct i2c_msg {
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
 
@@ -145,14 +147,17 @@ union i2c_smbus_data {
 
 /* SMBus transaction types (size parameter in the above functions)
    Note: these no longer correspond to the (arbitrary) PIIX4 internal codes! */
-#define I2C_SMBUS_QUICK		    0
+
+#define I2C_SMBUS3_BLOCK 0x10
+
+#define I2C_SMBUS_QUICK	    0
 #define I2C_SMBUS_BYTE		    1
 #define I2C_SMBUS_BYTE_DATA	    2
 #define I2C_SMBUS_WORD_DATA	    3
 #define I2C_SMBUS_PROC_CALL	    4
-#define I2C_SMBUS_BLOCK_DATA	    5
+#define I2C_SMBUS_BLOCK_DATA	    (5|I2C_SMBUS3_BLOCK)
 #define I2C_SMBUS_I2C_BLOCK_BROKEN  6
-#define I2C_SMBUS_BLOCK_PROC_CALL   7		/* SMBus 2.0 */
-#define I2C_SMBUS_I2C_BLOCK_DATA    8
+#define I2C_SMBUS_BLOCK_PROC_CALL   (7|I2C_SMBUS3_BLOCK) /* SMBus >= 2.0 */
+#define I2C_SMBUS_I2C_BLOCK_DATA    (8|I2C_SMBUS3_BLOCK)
 
 #endif /* _UAPI_LINUX_I2C_H */
-- 
2.20.1

