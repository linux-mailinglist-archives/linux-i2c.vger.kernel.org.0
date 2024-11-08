Return-Path: <linux-i2c+bounces-7877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AB29C12EB
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 01:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D836284194
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 00:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5C61FB4;
	Fri,  8 Nov 2024 00:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sF2ENVVt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB33F1BD9CB
	for <linux-i2c@vger.kernel.org>; Fri,  8 Nov 2024 00:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731024958; cv=none; b=F8QRqeOJhcHrcQPat7AdNZwWu3uQrJ34lNxQAMWB7XHy6R65hIp0l0uk7CR9gO/O3axT6hg64zMv/HzeT8mrRKCC452plwL1JAK5Fi3ZORKvi+rWUHdCKHfjBQxpU7kHVnPi93PhfWSuxUl93okIkzpMmgtEpyy5/7wbSnRY1I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731024958; c=relaxed/simple;
	bh=bNQqUDWSpPVDp9f74/Vz4JfMnPFVGdfl7TBWEGPIpRs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LCD1QFkMDjVI4CzN0vQbkTAsnYDr4sidJdHFzMC2Ib7bFDaV3poZCOD56oqldzmAGOtRwurDmxSFRNaVRZbueaV6n2N0e4ITVVnKI46aTmSRSHBEdtnbh9zmjPDkmCF70nztgUPi9bAn4EavtwPo2w1eZlezvlylW7DQ1OBmA8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sF2ENVVt; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e330f65bcd9so2450033276.1
        for <linux-i2c@vger.kernel.org>; Thu, 07 Nov 2024 16:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731024956; x=1731629756; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C+cvhfxMxcAGwNEI/sTbc9zPJ+TFYlYM6Rgfn0qgxwA=;
        b=sF2ENVVtyxwszfyTYrQyMNvoYVJu7ny1sk8HeukAVJ4HVIrY2x+aQiFFRNRAHu0d7y
         twwwvALNAfQLqdOsHiAguGMLMSFAPA0m/WHgNbSxx34e3h2YPt9k5NEAbP8FzD6xSUNK
         CHs1n00i0BOw8ev8GbEsicI4UJvd5lIm4N8XTlLjf5j6vr7CuUwxzJuz24VOjy75JKI8
         x20GMayxUNHNsupTYsObbd6nadegQRZ251lifz93lMua9RzvLEm7a9oFqSO+ti4mAyme
         Wy7WjsntL6yrC4GS79l019Vyq/FD2Wp5BqxAXAbpqx3QTDKyPB5ln5b8KPeW4YEosW1O
         Dmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731024956; x=1731629756;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+cvhfxMxcAGwNEI/sTbc9zPJ+TFYlYM6Rgfn0qgxwA=;
        b=tEgxsqR5n55tRkv9OP25myaVr58in0l17j7V3r5ga1AzaF22ICCPFV64TMyzeqX+pe
         rOnQiOSMtfPJae4gyIHbmjuf34R0RZ9AD5A9PSoMNMFZidOaIbk1YixudfE5wI9wMByp
         3pKB+A0VIxQBGUsGzANMt9BqJtdnsUl2mxJ8nmyBBMVXkVfP5quqCHixBw7L/tIKyx/o
         lVXbad3DSq/RwBc4KLco6AlfTXiForeTdf9xyDW0XrS9EJbmnjzSaitw+GosV8OhcMmC
         V9hXNCSshzOZkez2c7ji+ONAL+ydwj3jqOC07zz3dSKFfnHuJJjD9b/C8v3RZX3tMZvB
         Qyjg==
X-Gm-Message-State: AOJu0YwAxYx5FOb5brcn8AN8IPhTCy0PhsNn0Q2rq3OjKymAzb5AZ4J6
	IroVfX/FZkAj4eEg7XF+Djb7jrH1LeY6vz1yFZPlcIT4c7fFU2Ex2t3icoXe//968qpGK/6I92x
	aAPZdI2F5Ww==
X-Google-Smtp-Source: AGHT+IF0uTz7dBmajkyMIyFuU38iEJPA3KUjwQ01O9i7tJDtXL5GXG6kS20R+PmADwYVMvNey9lNK63kXsGa2w==
X-Received: from ip.c.googlers.com ([fda3:e722:ac3:cc00:ef:85c8:ac13:4138])
 (user=ipylypiv job=sendgmr) by 2002:a25:c2c7:0:b0:e29:9c5:5fcb with SMTP id
 3f1490d57ef6-e337e1b0c47mr13777276.4.1731024955790; Thu, 07 Nov 2024 16:15:55
 -0800 (PST)
Date: Fri,  8 Nov 2024 00:15:42 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108001542.255155-1-ipylypiv@google.com>
Subject: [PATCH v2] i2c: dev: Fix memory leak when underlying adapter does not
 support I2C
From: Igor Pylypiv <ipylypiv@google.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Jean Delvare <jdelvare@suse.de>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Igor Pylypiv <ipylypiv@google.com>
Content-Type: text/plain; charset="UTF-8"

Early return in i2cdev_ioctl_rdwr() failed to free the memory allocated
by the caller. Move freeing the memory to the function where it has been
allocated to prevent similar leaks in the future.

Fixes: 97ca843f6ad3 ("i2c: dev: Check for I2C_FUNC_I2C before calling i2c_transfer")
Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
---
 drivers/i2c/i2c-dev.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 61f7c4003d2f..7717db1f4c23 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -251,10 +251,8 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		return -EOPNOTSUPP;
 
 	data_ptrs = kmalloc_array(nmsgs, sizeof(u8 __user *), GFP_KERNEL);
-	if (data_ptrs == NULL) {
-		kfree(msgs);
+	if (data_ptrs == NULL)
 		return -ENOMEM;
-	}
 
 	res = 0;
 	for (i = 0; i < nmsgs; i++) {
@@ -302,7 +300,6 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		for (j = 0; j < i; ++j)
 			kfree(msgs[j].buf);
 		kfree(data_ptrs);
-		kfree(msgs);
 		return res;
 	}
 
@@ -316,7 +313,6 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 		kfree(msgs[i].buf);
 	}
 	kfree(data_ptrs);
-	kfree(msgs);
 	return res;
 }
 
@@ -446,6 +442,7 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case I2C_RDWR: {
 		struct i2c_rdwr_ioctl_data rdwr_arg;
 		struct i2c_msg *rdwr_pa;
+		int res;
 
 		if (copy_from_user(&rdwr_arg,
 				   (struct i2c_rdwr_ioctl_data __user *)arg,
@@ -467,7 +464,9 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(rdwr_pa))
 			return PTR_ERR(rdwr_pa);
 
-		return i2cdev_ioctl_rdwr(client, rdwr_arg.nmsgs, rdwr_pa);
+		res = i2cdev_ioctl_rdwr(client, rdwr_arg.nmsgs, rdwr_pa);
+		kfree(rdwr_pa);
+		return res;
 	}
 
 	case I2C_SMBUS: {
@@ -540,7 +539,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 		struct i2c_rdwr_ioctl_data32 rdwr_arg;
 		struct i2c_msg32 __user *p;
 		struct i2c_msg *rdwr_pa;
-		int i;
+		int i, res;
 
 		if (copy_from_user(&rdwr_arg,
 				   (struct i2c_rdwr_ioctl_data32 __user *)arg,
@@ -573,7 +572,9 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 			};
 		}
 
-		return i2cdev_ioctl_rdwr(client, rdwr_arg.nmsgs, rdwr_pa);
+		res = i2cdev_ioctl_rdwr(client, rdwr_arg.nmsgs, rdwr_pa);
+		kfree(rdwr_pa);
+		return res;
 	}
 	case I2C_SMBUS: {
 		struct i2c_smbus_ioctl_data32	data32;
-- 
2.47.0.277.g8800431eea-goog


