Return-Path: <linux-i2c+bounces-12704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B30B4706F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 16:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F284A06DC1
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 14:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DD9155389;
	Sat,  6 Sep 2025 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJQiuNGu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D12905;
	Sat,  6 Sep 2025 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757169097; cv=none; b=tPc8vA/UCTB+Gq60qz6049+iJEsrDY0fxS9ca9opO1xAiAakQvWNHCxMjNCIQgLPe+1u6ljg8eNUuL4GjejL7kxKhlNaDyUPMY7AQTCM6E+m2zcYgfBpUTaH4rROxg69ORWO9fLOXLm1Gq0beXhf7FWhTOmcCl6epgSZniwlw5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757169097; c=relaxed/simple;
	bh=n/iA2xiAiBGKptR76JM4k2hDpLRNGplYgkSh/8Ar3ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVpsiHUNteUdX9iMY2jcP3cUZQWj0bauj5ryJo5gijrPo/vBeqdRzpMY7+/mssFGHxUcRCbYJDT8qzHEqu8iF+I2ODYkAxmDwAxAZb3Ptnqx2kp2WzStROSluYMjyNdzwUkHlxvtOv4YO5pWilki2HZVw0nVAeQyFDco19OfMqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJQiuNGu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3e014bf8ec1so2135380f8f.1;
        Sat, 06 Sep 2025 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757169094; x=1757773894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKzQLWd8BNWxJCnVQxm3ZTSbkLGLSJ4oh/POdD4UaBw=;
        b=PJQiuNGugeVfoi9ywuM9TluDHjZVbHncLuYQwKYw39F0I242RHO9f+9NAtKjtz7Kvi
         1FKV9QSeaWaUzDUxiKqgyINbQg4FG1+bYLYeQtpJ4J0UMpyzRyteLV52nCRz2pk2kyDp
         eE+59I+yNY+4dgQKN5gse/W9J4pgWGrF+/Z9Vjh++CmZvxDcMBZ67VsC1WPK0XNdLtL3
         IobUKLX87Qz2Gqqw7CrR4TeG86pEZPw5s+j23oLNgIl7j+/nEU0TIOBOBsKJ+OwLvmDB
         oBcF3yLB3EghrY6ax88/D7yyTz6E+//5KDHquSA+0wadkN8xHkq/2EIdHTCW6weXa8tt
         BjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757169094; x=1757773894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKzQLWd8BNWxJCnVQxm3ZTSbkLGLSJ4oh/POdD4UaBw=;
        b=UJL4i/CltODYljDKKwcvhJq9QaS9CtKaCCEDmEWad92F+dZejGdNVNOXrKUu6MKz4Z
         SY0yvEovq5JNi49Ib/IiaUnEQZlrWdlVhCaCRQk1REqA+m4M0MO6d/isE5WKugMFucnb
         Ol5nqo+pYJT7M2Lp6osWCVTiOFfP08l/pVdpqAjJ+QlcsDrh7MbzxCi489Y4lCHYSSVk
         /8CVB0c2mP249rin8/4nN5KOo7PJrlJQpdhNi+hgCqzBwW8IsrpWFlurQnKfO+eoIiVu
         P1/+1bnHqEdrDFExD+PE0lvU80cJnEQZtT0Wszn9COohEODeI4c+v7JWD4fqlRe+qGFm
         g4/g==
X-Forwarded-Encrypted: i=1; AJvYcCULYC9RG19Skc6vzWPqyPG6hQMkbDFSZPrw7iZw9HabQdIO3nkzUk6h+wBTDsM/rB/jKhAT5fhSgmYMLf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiIg+mkwULLGkhouubYuLpnZaFD9p8+vayCs+IsPeySa5MMmYR
	BboAh6xms3GxIxs8olOMuvb8DMIOK4TAgK8c4MPDT0gicxuAcpV/HqCq
X-Gm-Gg: ASbGnctpQ5jf8ckSN1V7ptlAK6lobt192XmUKd0jULFfZ3O0Y1JSmcFTJXya9TYicab
	sItBe3VO6uXDuK0x7aNSbOXbJkR63okm8hHn5XeX79vt5BBdT1opCaTxCnrCzVgRvx9Qrc/LEBB
	dkJpG4ljTiWJUIlLCYeVGbSMuX5VWFpr4xecRgvr0AhXm0GSSNjXOoL+xH8TNAgUVPm2MKUl+6j
	cocxgva8yt5AT/h2cI7TveJuhlCveMMu8V7t3qokguq14XZpeypFv1u6bThqLft/SDtGj4l22AJ
	xXJhqjITf/4jYL45AfE1B4ygPXjFaJCfvrk+trV9VpMcIOOEwe9wLmHmNCl6twjIU4muiZzF417
	Tx+cJlHhBwalJmGAVf99pvQEMbWft3Q==
X-Google-Smtp-Source: AGHT+IFWve5lrZrXBMD2zEzmOPD3JBhdabzeORQlc+82/3ZASLV7zXyPS+LYWrnJUm2zRKUDurygiA==
X-Received: by 2002:a5d:5f96:0:b0:3dd:8b62:5fe7 with SMTP id ffacd0b85a97d-3e64355634amr1368733f8f.49.1757169093693;
        Sat, 06 Sep 2025 07:31:33 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fbd01sm35536943f8f.13.2025.09.06.07.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 07:31:33 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH] i2c: i2c-dev: Fixed warnings generated by checkpatch tool
Date: Sat,  6 Sep 2025 17:31:19 +0300
Message-ID: <20250906143119.21803-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
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
   Latest commit SHA: d1d10cea0895
   Build succeeded
   * Installed kernel and external modules on my laptop with Ubuntu 24
   * Checked dmesg for i2c-dev using grep and checked for errors or
     success. Found 1 line related to i2c_dev:
     [    0.662406] i2c_dev: i2c /dev entries driver

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


