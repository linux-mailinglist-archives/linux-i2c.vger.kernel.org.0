Return-Path: <linux-i2c+bounces-10336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C4CA89080
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 02:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 115F83A9D70
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 00:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22B415442C;
	Tue, 15 Apr 2025 00:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YblKGOIP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489F1531D5;
	Tue, 15 Apr 2025 00:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676836; cv=none; b=eckxuK7iwnruudFlPJeC8t6GsQeDNVCHqjpcXKTgc9qrIvPn3mYU/m7beaiNUT2dnhbYKglYsrmkyADoBzGRKf+0KCc4JL30MSdazCn4usHASEfImk/evz/NUCffSH0q/FKpd+TTyt5yDrv05vfrNUOTD4DM6W8OJq9g7MIpizo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676836; c=relaxed/simple;
	bh=OhRAvfI5XC0roD7CJN4SDA+Hiq02+jE5bWTG/sHe7hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JahYjCDNCd20CMZz9+F1kgWOXJtYgFOxbuYZAWelVxePbOr1tJRbm5y2HPzzNHN/8ZDveb6be/+mWesx3cnyXGAxuK+YEJcuu1tit9cYpOqk2uVztjePeZ6OrQsHao2c8V5q6RE1ASHczF0R6hHe4pqDe/V1KIbWPWgq6wlJiBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YblKGOIP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1AAC4CEF0;
	Tue, 15 Apr 2025 00:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676836;
	bh=OhRAvfI5XC0roD7CJN4SDA+Hiq02+jE5bWTG/sHe7hQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YblKGOIPqfxUFcwFWOULnOwi0UjojhmjPfoVu1t80Qwh1dR2Ob9XP5z0lnj7OBT12
	 ncsZjGcc//8pOCRFNasP/uF8jbisI6wrzGaGjtNPWpt3Tu2iZ7Sa9tjyEp5LcdhZUX
	 f79Q9L5lQ1pCMmJQdKeJMSSrSuFmMxMBqW3q/sqY8ecHoCgGPBOBjhPGzNCIq2jS1+
	 yiNTm7sDnbCt1cXb9sh7dQ7hXTIKHWJ8wAjYc8PTujlm0frWL/c35OXCVrKy6lvWXV
	 jLCnUZvUgDGkoYkW+lYEKeuGt2IFtn5T8G8Kh8dyU/rqjgmyjHNM+7KzFzVZMJ++V7
	 CvaSqnOQT1r6g==
From: Mario Limonciello <superm1@kernel.org>
To: Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC),
	platform-driver-x86@vger.kernel.org (open list:AMD PMC DRIVER)
Subject: [PATCH v4 3/5] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR definition to amd/fch.h
Date: Mon, 14 Apr 2025 19:26:56 -0500
Message-ID: <20250415002658.1320419-4-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415002658.1320419-1-superm1@kernel.org>
References: <20250415002658.1320419-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

SB800_PIIX4_FCH_PM_ADDR is used to indicate the base address for the
FCH PM registers.  Multiple drivers may need this base address, so
move it to a common header location and rename accordingly.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * Move FCH_PM_DECODEEN to fch.h, but shift it for use in piix4 because
   piix4 does 8 bit reads
---
 arch/x86/include/asm/amd/fch.h | 12 ++++++++++++
 drivers/i2c/busses/i2c-piix4.c | 18 +++++++++---------
 2 files changed, 21 insertions(+), 9 deletions(-)
 create mode 100644 arch/x86/include/asm/amd/fch.h

diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
new file mode 100644
index 0000000000000..a5fd91ff92df3
--- /dev/null
+++ b/arch/x86/include/asm/amd/fch.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_X86_AMD_FCH_H_
+#define _ASM_X86_AMD_FCH_H_
+
+#define FCH_PM_BASE			0xFED80300
+
+/* register offsets from PM base */
+#define FCH_PM_DECODEEN			0x00
+#define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
+
+#endif
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index dd75916157f05..6350003de32b1 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -21,6 +21,7 @@
    an i2c_algorithm to access them.
 */
 
+#include <asm/amd/fch.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/pci.h>
@@ -80,12 +81,11 @@
 #define SB800_PIIX4_PORT_IDX_MASK	0x06
 #define SB800_PIIX4_PORT_IDX_SHIFT	1
 
-/* On kerncz and Hudson2, SmBus0Sel is at bit 20:19 of PMx00 DecodeEn */
-#define SB800_PIIX4_PORT_IDX_KERNCZ		0x02
-#define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
+/* SmBus0Sel is at bit 20:19 of PMx00 DecodeEn */
+#define SB800_PIIX4_PORT_IDX_KERNCZ		(FCH_PM_DECODEEN + 0x02)
+#define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	(FCH_PM_DECODEEN_SMBUS0SEL >> 16)
 #define SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ	3
 
-#define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
 #define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
 
@@ -162,19 +162,19 @@ int piix4_sb800_region_request(struct device *dev, struct sb800_mmio_cfg *mmio_c
 	if (mmio_cfg->use_mmio) {
 		void __iomem *addr;
 
-		if (!request_mem_region_muxed(SB800_PIIX4_FCH_PM_ADDR,
+		if (!request_mem_region_muxed(FCH_PM_BASE,
 					      SB800_PIIX4_FCH_PM_SIZE,
 					      "sb800_piix4_smb")) {
 			dev_err(dev,
 				"SMBus base address memory region 0x%x already in use.\n",
-				SB800_PIIX4_FCH_PM_ADDR);
+				FCH_PM_BASE);
 			return -EBUSY;
 		}
 
-		addr = ioremap(SB800_PIIX4_FCH_PM_ADDR,
+		addr = ioremap(FCH_PM_BASE,
 			       SB800_PIIX4_FCH_PM_SIZE);
 		if (!addr) {
-			release_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+			release_mem_region(FCH_PM_BASE,
 					   SB800_PIIX4_FCH_PM_SIZE);
 			dev_err(dev, "SMBus base address mapping failed.\n");
 			return -ENOMEM;
@@ -201,7 +201,7 @@ void piix4_sb800_region_release(struct device *dev, struct sb800_mmio_cfg *mmio_
 {
 	if (mmio_cfg->use_mmio) {
 		iounmap(mmio_cfg->addr);
-		release_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+		release_mem_region(FCH_PM_BASE,
 				   SB800_PIIX4_FCH_PM_SIZE);
 		return;
 	}
-- 
2.43.0


