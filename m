Return-Path: <linux-i2c+bounces-12705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73248B4734F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 18:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97F2A1891CEB
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 16:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA3E218E97;
	Sat,  6 Sep 2025 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxJm2k8o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B71C5F10;
	Sat,  6 Sep 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757174429; cv=none; b=mN3R2+1bR6fg7l1Mb6O/xJ5G482AICkbE3zjh0KZXkANxplIW4YtSG0bi+GwKwAZT7gi87EQbD+FuiF3nMc6QU+TvkAqda9Z+e62Thm03G5fo0+MOK/ftw2I5Fw8Tgvw8WelyZVBksWrD64qtZsP7DRvwqzVZ1Fzd6gY3NNldug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757174429; c=relaxed/simple;
	bh=kt4ZRqsjyWbyiunkwTd+cAol7wA86lovQZhhVf07LuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBnuzJqxeEL663UHBL6YLhz0q4D7W4Fq9aJxVZeH+XY2c4ziYO5qUQDDRAd6MbC7unlBgOxFkzcM/h0t9pwbn0yL+GWksDAPOzffBZPqBKVvC6Nu32V4ugiLD47n3AgkQ4hpiKUr4HWJISezKGo3FUIJrRiF1Z2D2UF7h0eSIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxJm2k8o; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so15331875e9.0;
        Sat, 06 Sep 2025 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757174426; x=1757779226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGPJKwcboHWX/IcVFu8FVAiq199ldM/4DzbDNSj65bE=;
        b=SxJm2k8o3+mNtMBSnp+eA4f0gl2MtY+RBBDlfeOf5rK08ZEXbm455c8wQC/0Fni0RY
         vMUhnJg2HxLBx8fFfSoMDd0+LZg8cP2kWNrXZ7eCelOagD7p5NaKGAaVZKnPwl9wizyy
         Hcru6SmoyAwiZMMzp7XE4+vsCCw1R60Uf3BOH6uyKtZCbQpiyfv2cg70UdyYI0RDSZr1
         Gm25Ycs603DPjXUu+8Rd/SkStES90VgceJhJMCD5/DFScZg2bwNEq/pNVo3fpnFXvpGJ
         ahGSL/eSS6cg2gYMosDj0WlLCV3JosSy86zoJXd7fo0VFo+SHGQj1Ngs/ALZJPUCcoed
         FSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757174426; x=1757779226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGPJKwcboHWX/IcVFu8FVAiq199ldM/4DzbDNSj65bE=;
        b=eZPZkKPDtRH3k3buSow+xnE0aJOysJUjY8jbuPA0O8VKZA59IB2hMohMS+pbAo8Hjd
         ndMu2yd+jpGorHHjIdUSmoXFKv7KMhRSnRSd03lQizr99i6Q13LqpDQpDQRpWgsqmp2q
         mMuREiSpprKTYPrBzNyRAMWMSGLJv4WvDDNuSxhWVMFsXpOOb2IPdTC6dMpGS8vXsv6d
         Ygz9ezgHKK/3OxxxBKLq0PssD2aGYHRGT4BbJ7Jd67e29m3YkgBhJwUCL1lkf6BkV4xX
         w4g+lsUK0fh772KDywcBlKwCxUzsA/egyWX5D8AfvnPGhq2EZQ5b5OMSklcvLXXRT2dh
         lbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBQqsS1E3+Lsqq6I3UPmpvRT4rXcAltDolYnt+TMEF4bq31fHTST9QgMxwwJuKuUw+k24f1F4EZiASgO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWZunlhXIj+0GNrgXM8hwtjycnklh32C0t1er50SPB3xW45YDY
	B6a0YBybmUft5UmvGnDkWq18wGPmCWADFgIfK+yLFNxOWrdC7ipxGmywchZVIg==
X-Gm-Gg: ASbGncvVVmj+cWZJVeK0uuKsGyBTCymWwtnGBSKdvsQ50Be/9CT2Lwk2HCCFrAfCtnp
	n7msRX//ny4yqzDEyWOWubzIIzuh25ch9HsEJDEzMSKKX0Yzw3PkZYrB3iD5QnVkJ+ZQ9tnioNc
	ehPeHg2bCA6nVYguvIgPDy/jvzNZFXo8XTz0arM+IKF/i5OrrjBnwDw4FQth3jbgUcqVnTQ/u8F
	wW6gce2ehrGxaO3+YhmHv2f6WlB9n8ZMUPv8H3qjHru94XYD/7NWRJHmz9/Y7VrfszmNZuTFyn5
	mciUjSb5Rb4DgNK5R9LhZo6S3JwrGwP3BEObcbjGP2L1EufJkE0M7K958fVwDISXGnEikEiCtp/
	0hbZoOdMdjAi58A8pGqZtPFCPmnnO8iIiurXBltQnQmbuIMJXkCw=
X-Google-Smtp-Source: AGHT+IFfkTllRvQnRTGxTcmJgLuigxP8noNDXGg6hoWaTwMLCGyCeUWVxOP28+6pq/1l91Fhow3P/g==
X-Received: by 2002:a05:600c:8b5b:b0:45d:dc6c:9e30 with SMTP id 5b1f17b1804b1-45dde20ea5bmr21584945e9.14.1757174425595;
        Sat, 06 Sep 2025 09:00:25 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfa3ec60sm123676105e9.15.2025.09.06.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:00:25 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v2] i2c: i2c-dev: Fixed warnings generated by checkpatch
Date: Sat,  6 Sep 2025 18:59:26 +0300
Message-ID: <20250906155926.32699-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250906143119.21803-1-chiru.cezar.89@gmail.com>
References: <20250906143119.21803-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all warnings in i2c-dev.c file in drivers/i2c/ folder
The errors were: missing '*' from multiple line comment blocks,
missing new blank line after declarations and found 'unsigned'
instead of 'unsigned int'.
My motivation was to fix all possible warnings and errors from
/drivers/i2c/ subsystem. I will skip false positives.
Testing:
   * Built kernel with I2C_CHARDEV=y + my patch on and it succeeded.
   Date of last git pull: 06-September-2025 around 12:00 UTC + 03:00
   Latest commit SHA: <d1d10cea0895264cc3769e4d9719baa94f4b250b>
   Build succeeded
   * Installed kernel and external modules on my laptop with Ubuntu 24
   * Checked dmesg for i2c-dev using grep and checked for errors or
     success. Found 1 line related to i2c_dev:
     [    0.662406] i2c_dev: i2c /dev entries driver

v2: fixed commit message to not generate error and warning as in v1

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/i2c-dev.c | 51 +++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index e9577f920286..0902b7b9cca6 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -1,16 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
-    i2c-dev.c - i2c-bus driver, char device interface
-
-    Copyright (C) 1995-97 Simon G. Vogl
-    Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
-    Copyright (C) 2003 Greg Kroah-Hartman <greg@kroah.com>
-
-*/
+ *   i2c-dev.c - i2c-bus driver, char device interface
+ *
+ *   Copyright (C) 1995-97 Simon G. Vogl
+ *   Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
+ *   Copyright (C) 2003 Greg Kroah-Hartman <greg@kroah.com>
+ *
+ */
 
-/* Note that this is a complete rewrite of Simon Vogl's i2c-dev module.
-   But I have used so much of his original code and ideas that it seems
-   only fair to recognize him as co-author -- Frodo */
+/*
+ * Note that this is a complete rewrite of Simon Vogl's i2c-dev module.
+ *  But I have used so much of his original code and ideas that it seems
+ *  only fair to recognize him as co-author -- Frodo
+ */
 
 /* The I2C_RDWR ioctl code is written by Kolja Waschk <waschk@telos.de> */
 
@@ -50,7 +52,7 @@ struct i2c_dev {
 static LIST_HEAD(i2c_dev_list);
 static DEFINE_SPINLOCK(i2c_dev_list_lock);
 
-static struct i2c_dev *i2c_dev_get_by_minor(unsigned index)
+static struct i2c_dev *i2c_dev_get_by_minor(unsigned int index)
 {
 	struct i2c_dev *i2c_dev;
 
@@ -222,9 +224,11 @@ static int i2cdev_check_mux_children(struct device *dev, void *addrp)
 	return result;
 }
 
-/* This address checking function differs from the one in i2c-core
-   in that it considers an address with a registered device, but no
-   driver bound to it, as NOT busy. */
+/*
+ * This address checking function differs from the one in i2c-core
+ *  in that it considers an address with a registered device, but no
+ *  driver bound to it, as NOT busy.
+ */
 static int i2cdev_check_addr(struct i2c_adapter *adapter, unsigned int addr)
 {
 	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
@@ -241,7 +245,7 @@ static int i2cdev_check_addr(struct i2c_adapter *adapter, unsigned int addr)
 }
 
 static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
-		unsigned nmsgs, struct i2c_msg *msgs)
+		unsigned int nmsgs, struct i2c_msg *msgs)
 {
 	u8 __user **data_ptrs;
 	int i, res;
@@ -297,6 +301,7 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 	}
 	if (res < 0) {
 		int j;
+
 		for (j = 0; j < i; ++j)
 			kfree(msgs[j].buf);
 		kfree(data_ptrs);
@@ -337,8 +342,10 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 			size);
 		return -EINVAL;
 	}
-	/* Note that I2C_SMBUS_READ and I2C_SMBUS_WRITE are 0 and 1,
-	   so the check is valid if size==I2C_SMBUS_QUICK too. */
+	/*
+	 * Note that I2C_SMBUS_READ and I2C_SMBUS_WRITE are 0 and 1,
+	 * so the check is valid if size==I2C_SMBUS_QUICK too.
+	 */
 	if ((read_write != I2C_SMBUS_READ) &&
 	    (read_write != I2C_SMBUS_WRITE)) {
 		dev_dbg(&client->adapter->dev,
@@ -380,8 +387,10 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 			return -EFAULT;
 	}
 	if (size == I2C_SMBUS_I2C_BLOCK_BROKEN) {
-		/* Convert old I2C block commands to the new
-		   convention. This preserves binary compatibility. */
+		/*
+		 * Convert old I2C block commands to the new
+		 * convention. This preserves binary compatibility.
+		 */
 		size = I2C_SMBUS_I2C_BLOCK_DATA;
 		if (read_write == I2C_SMBUS_READ)
 			temp.block[0] = I2C_SMBUS_BLOCK_MAX;
@@ -471,6 +480,7 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	case I2C_SMBUS: {
 		struct i2c_smbus_ioctl_data data_arg;
+
 		if (copy_from_user(&data_arg,
 				   (struct i2c_smbus_ioctl_data __user *) arg,
 				   sizeof(struct i2c_smbus_ioctl_data)))
@@ -531,6 +541,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 {
 	struct i2c_client *client = file->private_data;
 	unsigned long funcs;
+
 	switch (cmd) {
 	case I2C_FUNCS:
 		funcs = i2c_get_functionality(client->adapter);
@@ -560,6 +571,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 		p = compat_ptr(rdwr_arg.msgs);
 		for (i = 0; i < rdwr_arg.nmsgs; i++) {
 			struct i2c_msg32 umsg;
+
 			if (copy_from_user(&umsg, p + i, sizeof(umsg))) {
 				kfree(rdwr_pa);
 				return -EFAULT;
@@ -578,6 +590,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	}
 	case I2C_SMBUS: {
 		struct i2c_smbus_ioctl_data32	data32;
+
 		if (copy_from_user(&data32,
 				   (void __user *) arg,
 				   sizeof(data32)))
-- 
2.43.0


