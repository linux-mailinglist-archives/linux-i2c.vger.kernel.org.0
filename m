Return-Path: <linux-i2c+bounces-12068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E637B14C3E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 12:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52C975455FA
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 10:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E70B270EA3;
	Tue, 29 Jul 2025 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewkJ1iIo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549E2222A0;
	Tue, 29 Jul 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785308; cv=none; b=lMAN2CkV+ojNsXqGwwZZVUOapKLw/zU5zHv4oUrCMZv6eEcOdlmwVp0XPDaRinAV6kMvCBBE0AbXDb7seQ+2vAe59EGtCtGkH5BYx3VHOo/ftS8AdsLAf7OGR0BJ6VVy6Bw8jEfTsrZNi3BHm1ZL3tLAHnI1HkHoj2cN/FhFEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785308; c=relaxed/simple;
	bh=maqiodVoglk/yB6AFlvImWGUrIOSmKcUxjZYK1+1lmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UaQKAs7tGSfVa4aDmVZp4H6sHAJOJfgrp9MYp0t4UVtk80ainiyNn7GWbpDZwIRQMYLaiaSqrTl9ATnzB9cRfTJPBH4hMcSlFJOxvv2QgaVh/0KPnYsHoAMfHjL5xNyTbQM5yS2yB6z2PNdq3fXqPztKAS1DRK5R06Y+z98nDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewkJ1iIo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31ecd40352fso1938403a91.2;
        Tue, 29 Jul 2025 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753785306; x=1754390106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJNqwM4dovBm0FVo4bLX7E3wVC0H5ZiuzMt4Ugoc/zE=;
        b=ewkJ1iIowJglstJ1zEhr8TZGdBhBGSEgMrrISIAu2ZDrxvqsxYlxlkP+l6BVtDKbDG
         W0JuERjzABKIzH8HqpO4Chza0dyAxsDYyIYZJsB8nD8D8DRqvQmCSEDIn5yP1oKqOYxw
         5j/2gPYtDr7neOeK2o2LGKsaQ4orkV+MQXK2mpDJRSgjlsS5wXiYpy83DbNBL7VFOjR5
         g9BnJFEZr8rSlu6css2NgLCnnp3xFakkKvsX0WmQb5LNIooLmrefyzgUorvJz602ZyzS
         AYi6mDn9kvLWikc98XNyoOHXsJnPwl5CH1CTLheEqHaVjctRD2Lrdmbe+e67MTdsN3Vz
         W6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785306; x=1754390106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJNqwM4dovBm0FVo4bLX7E3wVC0H5ZiuzMt4Ugoc/zE=;
        b=uZjtJKZT9RYC4kpaKxKORP44sRekTDclxPu4nCb1+Csl4NqTrHUFLvveB+qHkWqCDS
         AYsKOv71QjWnbjCy1eR4TissGBeX0kD6vXd7nBcZO2s2BVKxBzPsGlNxE4vbPuhyrTjh
         9FLRts3Y/mYbHvVha5wG2REw7BSuXHc/udywevW+nTpF3S3HYZVu9zKkVqFVfxoJqpyG
         pZFR7x/U6m7pRu1vZNgN9Fj2bzDl7VlN7D7eJCcd6g+v4CzFCxYgyYvvlT5k2hQLed1n
         Psf3601udhBXRlSGYCfl3TWi1z3LeMuG9zjfHrnfC/1NeoDUGxjIKgIugtk8b7Jn0ojo
         y3yA==
X-Forwarded-Encrypted: i=1; AJvYcCVB/JwV1LHO3JH+GVucwTvgGbIlADH1VMUKokIVHTmQvXRpu0mNcKg/QzPjeHQyxU9mC9sBAhDHYeMKhOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVwtII4qqOCk+NZgI/gAK7Gt8RuinW418muUyZKBbVesxV6/W
	B/TXpLhXB5otbGANz4WTwt5QLBAT4ZrGCUcj0KB5ceeeNR8zviqXve4B
X-Gm-Gg: ASbGnctgcLKb0HpjBeBtv0ew0ygQwWeqJasCV7fEKj9SoZ+VNaKoHHgm5dg9U7xNFTp
	Dgf6oB90wqoWbK0pnzEztvt+w9swXXCNV/kThnF5cnIYyo5x9vERyIVTIGUuXKoq1J8HjSE9o8Q
	WPHDG8OzKkTMTZ5zZKL6AHmm3gY+oWy7QFdqrfO7Jv+yUgUrP6s+AlRi75NeGe9/DWwToEqRAEv
	sRNz79ZbdJlSmNBao93niQi+Gvih/9RAb3Fume9KUDfHSv++mAScnMwB+sK3ukJuKxuIccwH38W
	Z5nlsr0UeRdGuRiVP6HfHr78S+R2r+NMma2dv10JXtVxWrArCxxGCsWhjfTZdiEXVgtYR3EOqfx
	vOyX4h5IiTUzJJNPZE3n3Ts4OTYc0rrxebM8ZWUrNZMnuPhBYfsQQ+2X8BKcaRhjbEt4W7BcvWj
	w6VfrQcQ==
X-Google-Smtp-Source: AGHT+IE9dD7XwuR66hU9u4aNrC+7FImtUo6B40EfgpXdpz4aasOoI0VHqNy4nyjfu6o3YfMwrA9j3g==
X-Received: by 2002:a17:90b:2b8b:b0:314:2892:b1e0 with SMTP id 98e67ed59e1d1-31e77a1a327mr18241108a91.34.1753785306362;
        Tue, 29 Jul 2025 03:35:06 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([122.162.223.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f67b3b0sm6818046a12.44.2025.07.29.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:35:06 -0700 (PDT)
From: "Darshan R." <rathod.darshan.0896@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Darshan R." <rathod.darshan.0896@gmail.com>
Subject: [PATCH] [PATCH v2] i2c: sis96x: Refactor for readability and style improvements
Date: Tue, 29 Jul 2025 10:27:44 +0000
Message-ID: <20250729102744.3176-1-rathod.darshan.0896@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces several minor, non-functional code quality
improvements to the SiS96x I2C bus driver. The primary goal is to
enhance code clarity and align better with standard kernel coding
practices.

Key changes include:
*   **Separating assignments from conditionals:** Break out `read` operations
    (e.g., `sis96x_read()`) from `if` statement conditions, making the
    control flow more explicit and easier to follow. This avoids
    common pitfalls of assignment within conditional expressions.
*   **Whitespace and alignment fixes:** Adjust parameter alignment in
    function definitions and remove extraneous trailing whitespace,
    improving visual consistency and adherence to kernel coding style.

These changes are purely refactoring-oriented and have no functional
impact on the driver's operation.

Signed-off-by: Darshan R. <rathod.darshan.0896@gmail.com>
---
v2:
 - Fixed inconsistent indenting warning from smatch as reported by
   the kernel test robot.
---
 drivers/i2c/busses/i2c-sis96x.c | 35 +++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index 77529dda6fcd..f5005679e799 100644
--- a/drivers/i2c/busses/i2c-sis96x.c
+++ b/drivers/i2c/busses/i2c-sis96x.c
@@ -11,7 +11,7 @@
 
     This module relies on quirk_sis_96x_smbus (drivers/pci/quirks.c)
     for just about every machine for which users have reported.
-    If this module isn't detecting your 96x south bridge, have a 
+    If this module isn't detecting your 96x south bridge, have a
     look there.
 
     We assume there can only be one SiS96x with one SMBus interface.
@@ -65,12 +65,12 @@ static u16 sis96x_smbus_base;
 
 static inline u8 sis96x_read(u8 reg)
 {
-	return inb(sis96x_smbus_base + reg) ;
+	return inb(sis96x_smbus_base + reg);
 }
 
 static inline void sis96x_write(u8 reg, u8 data)
 {
-	outb(data, sis96x_smbus_base + reg) ;
+	outb(data, sis96x_smbus_base + reg);
 }
 
 /* Execute a SMBus transaction.
@@ -85,16 +85,18 @@ static int sis96x_transaction(int size)
 	dev_dbg(&sis96x_adapter.dev, "SMBus transaction %d\n", size);
 
 	/* Make sure the SMBus host is ready to start transmitting */
-	if (((temp = sis96x_read(SMB_CNT)) & 0x03) != 0x00) {
+	temp = sis96x_read(SMB_CNT);
 
-		dev_dbg(&sis96x_adapter.dev, "SMBus busy (0x%02x). "
-			"Resetting...\n", temp);
+	if ((temp & 0x03) != 0x00) {
+		dev_dbg(&sis96x_adapter.dev, "SMBus busy (0x%02x). Resetting...\n", temp);
 
 		/* kill the transaction */
 		sis96x_write(SMB_HOST_CNT, 0x20);
 
 		/* check it again */
-		if (((temp = sis96x_read(SMB_CNT)) & 0x03) != 0x00) {
+		temp = sis96x_read(SMB_CNT);
+
+		if ((temp & 0x03) != 0x00) {
 			dev_dbg(&sis96x_adapter.dev, "Failed (0x%02x)\n", temp);
 			return -EBUSY;
 		} else {
@@ -138,7 +140,9 @@ static int sis96x_transaction(int size)
 
 	/* Finish up by resetting the bus */
 	sis96x_write(SMB_STS, temp);
-	if ((temp = sis96x_read(SMB_STS))) {
+
+	temp = sis96x_read(SMB_STS);
+	if (temp) {
 		dev_dbg(&sis96x_adapter.dev, "Failed reset at "
 			"end of transaction! (0x%02x)\n", temp);
 	}
@@ -147,9 +151,9 @@ static int sis96x_transaction(int size)
 }
 
 /* Return negative errno on error. */
-static s32 sis96x_access(struct i2c_adapter * adap, u16 addr,
+static s32 sis96x_access(struct i2c_adapter *adap, u16 addr,
 			 unsigned short flags, char read_write,
-			 u8 command, int size, union i2c_smbus_data * data)
+			 u8 command, int size, union i2c_smbus_data *data)
 {
 	int status;
 
@@ -182,7 +186,7 @@ static s32 sis96x_access(struct i2c_adapter * adap, u16 addr,
 			sis96x_write(SMB_BYTE, data->word & 0xff);
 			sis96x_write(SMB_BYTE + 1, (data->word & 0xff00) >> 8);
 		}
-		size = (size == I2C_SMBUS_PROC_CALL ? 
+		size = (size == I2C_SMBUS_PROC_CALL ?
 			SIS96x_PROC_CALL : SIS96x_WORD_DATA);
 		break;
 
@@ -196,7 +200,7 @@ static s32 sis96x_access(struct i2c_adapter * adap, u16 addr,
 		return status;
 
 	if ((size != SIS96x_PROC_CALL) &&
-		((read_write == I2C_SMBUS_WRITE) || (size == SIS96x_QUICK)))
+	   ((read_write == I2C_SMBUS_WRITE) || (size == SIS96x_QUICK)))
 		return 0;
 
 	switch (size) {
@@ -240,7 +244,7 @@ static const struct pci_device_id sis96x_ids[] = {
 MODULE_DEVICE_TABLE (pci, sis96x_ids);
 
 static int sis96x_probe(struct pci_dev *dev,
-				const struct pci_device_id *id)
+			const struct pci_device_id *id)
 {
 	u16 ww = 0;
 	int retval;
@@ -263,7 +267,7 @@ static int sis96x_probe(struct pci_dev *dev,
 		return -EINVAL;
 	}
 	dev_info(&dev->dev, "SiS96x SMBus base address: 0x%04x\n",
-			sis96x_smbus_base);
+		 sis96x_smbus_base);
 
 	retval = acpi_check_resource_conflict(&dev->resource[SIS96x_BAR]);
 	if (retval)
@@ -286,7 +290,8 @@ static int sis96x_probe(struct pci_dev *dev,
 	snprintf(sis96x_adapter.name, sizeof(sis96x_adapter.name),
 		"SiS96x SMBus adapter at 0x%04x", sis96x_smbus_base);
 
-	if ((retval = i2c_add_adapter(&sis96x_adapter))) {
+	retval = i2c_add_adapter(&sis96x_adapter);
+	if (retval) {
 		dev_err(&dev->dev, "Couldn't register adapter!\n");
 		release_region(sis96x_smbus_base, SMB_IOSIZE);
 		sis96x_smbus_base = 0;
-- 
2.43.0


