Return-Path: <linux-i2c+bounces-7922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E697E9C4025
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 15:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BFD1F22069
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 14:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6273319CD0E;
	Mon, 11 Nov 2024 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTOSjXon"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414219CCEC;
	Mon, 11 Nov 2024 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333759; cv=none; b=HTMs7xk6LKZC2PRuhYUeTktUu835KQjWaUzxhTH0SDmZyM19RzkqkQjWYv8gIucfLG42L/4C1kquq6ixzz/bPJ3blVAAJROgNDOgylg7RlIoLgXouY2MtEgYzAkinydhU1GuKRtIA9NOl21bDa/FmIWangkgbRbWdZkEP37nscU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333759; c=relaxed/simple;
	bh=sBefKsr3KgW4di7oz7BIIPuDaPFxBlT9Rk0bw7cu4Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8pAGFVnOmwwnK+bJkLvs3T08iGeLhjNp5CEuaX+wygbGg1lABbg54lGdR6ofaA6DQukamVptAbjnBmEKCVGi3oP08nXuVHIGjD9JwpgbXGUH3YCiDUTx+I2tU8ylC2wlrAniNKQbVm5p+zkm47Qj2MVeKcztrhfvPFwdIjsyOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTOSjXon; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f53973fdso4374647e87.1;
        Mon, 11 Nov 2024 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731333756; x=1731938556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLwofSycxbEjkUA5lJl/n5oLWGu66YVCpMwEJsJykfQ=;
        b=CTOSjXonE1thhSd0/kiFtN/9voiiym0u/955Ym0eTGlAwXMLeulY7EafR81KGs79SR
         dndzJL/aBLURo45EFmQlnQe1pnwP/Yr7xNspAN9rkl1RrmHQxlyNyIbE/T8WsLxqm0Yw
         /rwiQ7RRV9XivvONOWu5xgZxxYTRMkKZ3R0phUuOHVdKPEjLSxyPrj699GtwG2Nh6hRR
         jAgfEGBAUIS+4HRIW2MlUZaLRv9rUBXI98o8GPOtpuBYte8vXN6I/YY0pDQ3SD6s0Wgi
         sitRoQ+M0Mwz5+3WxChpkHazaRsmCOhZ4itINrZkReQdM9vJDu+HWpXFf2Y0h99Xh5Uk
         k3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731333756; x=1731938556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLwofSycxbEjkUA5lJl/n5oLWGu66YVCpMwEJsJykfQ=;
        b=l3LNlMPRSYhVIbjNlctIzQv/4BsKJcza3xnHgo1Crv+kc7ICGGSOB6ebmBEoSFiiGj
         oWlHGyL0MtnhEuYbVhjFLRDx1Zs2PCHihTSWrDKW/lnpK3DQd725vCKYZGRbw56EVWIZ
         PV4tl0Tj4RW9gRCGnwdB5ls3mKy2R1wCagQJpEKiOiUcDCGAb0NCH0pNt9JzE0PjT+Bq
         AkmWJtqBdudP49zo/nVVYqySuv5/PkT9L/hhFxrvQnI8BJhlWlRLdcvG3E+u9Dscyg1/
         MAZqyalctOOkpzu1Q6CB7HX+cjI5mg3o5oAkQgj1gWwXd4bKMbxVeI8xRQN/dTKDi+mj
         RG8A==
X-Forwarded-Encrypted: i=1; AJvYcCWewI7mE/4CN/8nyUnEIlzcWD+mlYKz2//IQBdy4PaIxTZYjU7KS2C4DAsi+FYk1oEvO3ZZfAdTem/ceHbD@vger.kernel.org, AJvYcCX9pN42TW+UnLXphhQMPG3tV7GHPN5bfkMkOYmrvyfM79LPB/TyTjeOX2mTu/bYZhty44hyoEBFQOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHt3kCar6bHehXXOp2LkgYRt/fSiEoekC+4mE0/OEc4HxJpzBs
	GwI3QrRXPIcwwa8c6vrBGAXtScJxFmBt9++vp/UePAUolbfZ/6Sf
X-Google-Smtp-Source: AGHT+IEvQMYsT8waS8wR5X2E0Ii1l9ccp+FRrxL3qu68MhQBvaCtP9eH1C6Yge9Gggb8tuBiWkr0nw==
X-Received: by 2002:a05:6512:e8d:b0:539:f554:78c4 with SMTP id 2adb3069b0e04-53d866b215dmr4116314e87.1.1731333755044;
        Mon, 11 Nov 2024 06:02:35 -0800 (PST)
Received: from PC10411.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-53d826aebf5sm1561719e87.244.2024.11.11.06.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 06:02:33 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: aladyshev22@gmail.com,
	Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: i2c: piix4: Add ACPI section
Date: Mon, 11 Nov 2024 17:02:31 +0300
Message-ID: <20241111140231.15198-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZzH-KeSavsPkldLU@smile.fi.intel.com>
References: <ZzH-KeSavsPkldLU@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide information how to reference I2C busses created by the PIIX4
chip driver from the ACPI code.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 Documentation/i2c/busses/i2c-piix4.rst | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-piix4.rst b/Documentation/i2c/busses/i2c-piix4.rst
index 07fe6f6f4b18..90447dff7419 100644
--- a/Documentation/i2c/busses/i2c-piix4.rst
+++ b/Documentation/i2c/busses/i2c-piix4.rst
@@ -109,3 +109,65 @@ which can easily get corrupted due to a state machine bug. These are mostly
 Thinkpad laptops, but desktop systems may also be affected. We have no list
 of all affected systems, so the only safe solution was to prevent access to
 the SMBus on all IBM systems (detected using DMI data.)
+
+
+Description in the ACPI code
+----------------------------
+
+Device driver for the PIIX4 chip creates a separate I2C bus for each of its ports::
+
+    $ i2cdetect -l
+    ...
+    i2c-7   unknown         SMBus PIIX4 adapter port 0 at 0b00      N/A
+    i2c-8   unknown         SMBus PIIX4 adapter port 2 at 0b00      N/A
+    i2c-9   unknown         SMBus PIIX4 adapter port 1 at 0b20      N/A
+    ...
+
+Therefore if you want to access one of these busses in the ACPI code, port subdevices
+are needed to be declared inside the PIIX device::
+
+    Scope (\_SB_.PCI0.SMBS)
+    {
+        Name (_ADR, 0x00140000)
+
+        Device (SMB0) {
+            Name (_ADR, 0)
+        }
+        Device (SMB1) {
+            Name (_ADR, 1)
+        }
+        Device (SMB2) {
+            Name (_ADR, 2)
+        }
+    }
+
+If it is not the case for your UEFI firmware and you don't have access to the source
+code, you can use ACPI SSDT Overlays to provide the missing parts. Just keep in mind
+that in this case you would need to load your extra SSDT table before the piix4 driver
+start, i.e. you should provide SSDT via initrd or EFI variable methods and not via
+configfs.
+
+As an example of usage here is the ACPI snippet code that would assign jc42 driver
+to the 0x1C device on the I2C bus created by the PIIX port 0::
+
+    Device (JC42) {
+        Name (_HID, "PRP0001")
+        Name (_DDN, "JC42 Temperature sensor")
+        Name (_CRS, ResourceTemplate () {
+            I2cSerialBusV2 (
+                0x001c,
+                ControllerInitiated,
+                100000,
+                AddressingMode7Bit,
+                "\\_SB.PCI0.SMBS.SMB0",
+                0
+            )
+        })
+
+        Name (_DSD, Package () {
+            ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+            Package () {
+                Package () { "compatible", Package() { "jedec,jc-42.4-temp" } },
+            }
+        })
+    }
-- 
2.43.0


