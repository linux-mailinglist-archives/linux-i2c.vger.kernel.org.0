Return-Path: <linux-i2c+bounces-12056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1AB13B84
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 15:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062C216A324
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 13:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF0626739E;
	Mon, 28 Jul 2025 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mouUhkFg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B58B4437A;
	Mon, 28 Jul 2025 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753709400; cv=none; b=bk1N9hQFj56qNhclQf5NO17LrIH0o5OHo5nsV6X3/Z8VfRvgaCqUw3LUKyXkdzs5CXyKfCda5iYNaMOTSSbOLPj9ZkFn8DJKMuEVjj6HzcZGU5KR7su2Tp08G+Xl3MZrQQzJudTIFXzUwLZuGVFsPf45wunTFsbhOVtd1NMcSyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753709400; c=relaxed/simple;
	bh=7Gi7wVAXtEdKVNW6s1qSEV87zKdzdjTkh/VWVFv8jfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMQwl5DjulQSzseA2x26jCgWoXI5juthiK1MObxGzjeAfoLtq5BIggc9vfetVsI1Ih0kxVx9rlwT5xVkEdD+Abxzse5lPj5M9fSgq84EIkPx4A2i7kt8CBN9VRvWm5+GGj+GclBztWKk9q10xIDLYKI6v+nY7OVTSRqAB3g0td8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mouUhkFg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74924255af4so3803368b3a.1;
        Mon, 28 Jul 2025 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753709398; x=1754314198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFNzLNCZ+mO1DSqPdBgFXnK9D2An91nqRyo5zO3fspE=;
        b=mouUhkFgwpoIfwoR1n5PmrMVkh25NVj5uzUUXjDEO1QUL+/QmX0IujZxpzhQ/7xU0d
         /YZM+oi491Eoxgi9r9Y9bnQwFFOOP9wdhVrg1rsJILEhaR3v30q4TikjFDKevKeceW09
         vMagjo+IA1p7yek4S+P+1AxUG4KpQ/2ToiFzeZgr3DYqYckPUWzxAM1T9E8LbyRjsiU+
         01D9kBRMKaojc5fqt7owl/kLe7pVbmidES1EL0XeYW3K1ozlfHBZPetf/1KTxA9G96Xd
         PQpw1TpXk4RTybZ1U0twDl5bHmYgNsmMfkd1x9fBPSmQmE7wUft6+WJ9A5HRe6y0csdj
         iiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753709398; x=1754314198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFNzLNCZ+mO1DSqPdBgFXnK9D2An91nqRyo5zO3fspE=;
        b=Oa4EyRX1Um7zYIoUC3uV7eF9xZP3GvSaYcjxy07kRbb43ToQAcBaDfLzlD8zeByq72
         YjQXYf9FTnkSDZsURZrorZUe44LLhscbRVFONOoOgHdPjjQ6/QYbOqQpM7U+k+SUHczz
         4ALJXOILQjfJpTv5YS3yVweWmaAogTchofPR6zSuFy+73Xog8192/2tcV8zgISfydyfT
         REkLLALED9sajBRTgLTRYcplk+/tY/Xr+3B3ICF4zWtOfmcvDMN/gXvPSIGbxG3Mic2X
         AV6985qzsIYEc7VXfLMAm6j26M+tq9HT7zraOCo5DDaT/x3Q2Kiduo+zAnRzjbzD0WZs
         fVHg==
X-Forwarded-Encrypted: i=1; AJvYcCXcgEJTP6VAZmJBuP81P3cj/A29r4HZIIITVHjrwZ4L1ah1fWhWim/C2t4r16oZMd9x5ewjIzNIqsQb4O8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhvb6F6h6JWgmxBVM/rljhzgHf01g0Em1lutUtLMIKL63sDHwK
	YYRGOMDGSr4vNm4PaCrS7A/vN9xjOwqTJaA1Rz0FjriLdn+NFYf4mEncxUV1YbMy
X-Gm-Gg: ASbGncsLKxkls7TGa4fn8NGsEHstyFMu5FKLZf8GeS1kUfOCSHIbJfaQKsO6kdyk9cb
	Oy84i93TceGaP9OJvZVIcZI98+nUetLH/V1kV9uFuDGzaw8Q10IaEv+MMoDmbqn0IaNUgHBiVM6
	zB6U8X9O3EkqFRe/PFNsfuvXyv0aBXl4BoeySyVn2Sx2IHW5ogLfsQwFL1BW+WvcqGdMo0Z+yQe
	2hFL7/Sf45wNVcZ7ErZRvfD7HkZgLK9y1+eR1M0e7bFdefOmhCzzmBdbgZNC+6qQRzGTpA87zjm
	XpHAvbNnuz9cuLJyRpd7I0z8zNKNQVjPM5Pd4UQQe7G+q8gEmiFxw0PSJ8jQHZZjdmnGMsF2WVP
	zC5gqKdH47VcN0QXJCKUpgwcWLMzu2yCfZfxRFIVnPK0NQIjhfXOT0vPxXLhpvVy318ZHDVN+pD
	o4VP5igfIhEUAsN2Gh
X-Google-Smtp-Source: AGHT+IGYmO3/lYKBceRpf1yVUHUcdzSSKOc2OS5og63TakU0XWsmJW0EvhPDORCJ2KuQ/yWVFeTa+Q==
X-Received: by 2002:a05:6a00:2e23:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-763377f25f6mr17601605b3a.20.1753709397578;
        Mon, 28 Jul 2025 06:29:57 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([122.162.223.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-766d5821fa2sm3614887b3a.64.2025.07.28.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 06:29:56 -0700 (PDT)
From: "Darshan R." <rathod.darshan.0896@gmail.com>
To: jdelvare@suse.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Darshan R." <rathod.darshan.0896@gmail.com>
Subject: [PATCH] i2c: sis96x: Refactor for readability and style improvements
Date: Mon, 28 Jul 2025 13:14:18 +0000
Message-ID: <20250728131418.9424-1-rathod.darshan.0896@gmail.com>
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
 drivers/i2c/busses/i2c-sis96x.c | 51 ++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index 77529dda6fcd..1bab881b2610 100644
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
@@ -85,22 +85,24 @@ static int sis96x_transaction(int size)
 	dev_dbg(&sis96x_adapter.dev, "SMBus transaction %d\n", size);
 
 	/* Make sure the SMBus host is ready to start transmitting */
-	if (((temp = sis96x_read(SMB_CNT)) & 0x03) != 0x00) {
+	temp = sis96x_read(SMB_CNT);
 
-		dev_dbg(&sis96x_adapter.dev, "SMBus busy (0x%02x). "
-			"Resetting...\n", temp);
+	if ((temp & 0x03) != 0x00) {
+		dev_dbg(&sis96x_adapter.dev, "SMBus busy (0x%02x). Resetting...\n", temp);
 
-		/* kill the transaction */
-		sis96x_write(SMB_HOST_CNT, 0x20);
+	/* kill the transaction */
+	sis96x_write(SMB_HOST_CNT, 0x20);
 
-		/* check it again */
-		if (((temp = sis96x_read(SMB_CNT)) & 0x03) != 0x00) {
-			dev_dbg(&sis96x_adapter.dev, "Failed (0x%02x)\n", temp);
-			return -EBUSY;
-		} else {
-			dev_dbg(&sis96x_adapter.dev, "Successful\n");
-		}
+	/* check it again */
+	temp = sis96x_read(SMB_CNT);
+
+	if ((temp & 0x03) != 0x00) {
+		dev_dbg(&sis96x_adapter.dev, "Failed (0x%02x)\n", temp);
+		return -EBUSY;
+	} else {
+		dev_dbg(&sis96x_adapter.dev, "Successful\n");
 	}
+}
 
 	/* Turn off timeout interrupts, set fast host clock */
 	sis96x_write(SMB_CNT, 0x20);
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


