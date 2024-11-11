Return-Path: <linux-i2c+bounces-7917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FCE9C3DCD
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 12:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3ABE1C2190A
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 11:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5141991AA;
	Mon, 11 Nov 2024 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7S0RsBJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E7153820;
	Mon, 11 Nov 2024 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731326227; cv=none; b=ELby2KiiFKW24SnEXCImtge+WlYxZX5eKsB04yhX+Azgce2FiTInINAbDEj/JnKNBhCt/oT34+OeKQW1yYnMV0ILPqkJuCpIqCJjFZKQN49ehB86lGXG2jm8vmIh00JRxHZiEstTRzYg0/I2UGvjPbqoF86s7cabjz/izS0A0Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731326227; c=relaxed/simple;
	bh=vwpxLPqs6e9mK8zFIWmULmuEM7zyKfZQlEVhMUWXvDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pNUOQgpVVQEFfDyYsoCtTCuoJHp4JvaoBE9UP+vepVosVvu8q7BJ8NKfeYmCO7oa0cE3SV1PCB0lOo/D6qBBcVh22JdPtkUXAWDHpI5iNisCZTjAyDy0hhWqH6ADT7prANtp53ZBUvESArfSj8+uEn9kaJEYmWH8zAgEB/ULrRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7S0RsBJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53c78ebe580so5968996e87.1;
        Mon, 11 Nov 2024 03:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731326223; x=1731931023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4gRipgU/qVxirvz+WYr+6bdwv9Aapc1v6Tm0i8THg8=;
        b=c7S0RsBJAW9KVMHfFGeB2q7ixOkeEmgSJUP8EkXQbS2VrzssNhOQ6Im4U8IYlHa/MJ
         +Q4ssA124DcLJRSe7AWGJ3bPOjvRhoeHOwM1zcpvQyIE19RAQISqE9ue4dEZD20vcFXp
         be573I2uSgn4ytHuztto2jdlBt5tdWejbdMeyJg8NLfvM2QVEMVnx1EKkNBcBy3M2lnW
         5lB/OmHxKkkccrpCZH2fVkOPVpxFKF8RnnTv88ZldMU0afRi699Ltg+oiXhPotA27cHH
         K3RzZ2ecynUHLU2qq2UgfJfn3jBW4ZDFViWTi4ag8ghQg53jXlUzTzrX7FOw7Fyhl4Eg
         bg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326223; x=1731931023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4gRipgU/qVxirvz+WYr+6bdwv9Aapc1v6Tm0i8THg8=;
        b=dX/B8Lifsw2oSxKPpE8I0ZoWc+ItBWoe1ULlvL6r7qDqWmm+SXgD5r+d6pEdg7WuqW
         vhEm0O0ay7XDA/Kbpk57NwGhD0lyVVFyq9zqCG6kpPD67+6Dq9UiItWaLwDTYQb6dK3P
         0KYV5E8XhRUyAnrTZ5pcQtyS/oTpwlaXT9RL9aGlsy/mFXl2q6IBnDG8g9ULFpkMZ2dg
         4f6npbgN2Dhzzwtdd4irZreD90qzk/8dDmJIaHl7R5vP2g3miqhyNl3vC6QZYMQWtFkg
         oivKeDEVTllPGZnu4lH8rGiiSvbbjvnhvDneFFLB8TtsWLM13zgAoOe69EKCRk7wrEVh
         2/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWty8HHhuHuZpEXjORNlD+kcdjjFrMYOydAlIc1GIU6R7YHekaP7tnk6brAGP92epiyfPlcOPJbWpg=@vger.kernel.org, AJvYcCXmEZeqErhpXPK9kiqGmmvvqPxSOakDnQrQMViJobOfZmMHQI7sDU6+QSYoFAJWh9NKPMF+APbJhbGJFFOd@vger.kernel.org
X-Gm-Message-State: AOJu0YyERvBlnhL3r6/DwEEln4ZPPZdV6FVcHMDc3+qYm82YZmn/HXno
	BJ6sPgCJVo39xwmYgMciSnbB3z2Z8ptoHxNAINuSJJ7o6LksK1UX
X-Google-Smtp-Source: AGHT+IEaie61UgfrXf0LmdPOZAyuHoON1t9bH1ow34KyDKYJYUkLLuPNtSQN0Y1U9XG0SNN8lA1lLQ==
X-Received: by 2002:a05:6512:3c87:b0:52f:1b08:d2d8 with SMTP id 2adb3069b0e04-53d866c8fa6mr3932093e87.7.1731326223110;
        Mon, 11 Nov 2024 03:57:03 -0800 (PST)
Received: from PC10411.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-53d82685f9fsm1558218e87.91.2024.11.11.03.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:57:02 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: aladyshev22@gmail.com,
	Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: i2c: piix4: Add ACPI section
Date: Mon, 11 Nov 2024 14:56:52 +0300
Message-ID: <20241111115652.10831-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 Documentation/i2c/busses/i2c-piix4.rst | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-piix4.rst b/Documentation/i2c/busses/i2c-piix4.rst
index 07fe6f6f4b18..2a00158b508a 100644
--- a/Documentation/i2c/busses/i2c-piix4.rst
+++ b/Documentation/i2c/busses/i2c-piix4.rst
@@ -109,3 +109,59 @@ which can easily get corrupted due to a state machine bug. These are mostly
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
+Therefore if you want to access one of these busses in the ACPI code, you need to
+declare port subdevices inside the PIIX device::
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


