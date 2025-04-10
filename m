Return-Path: <linux-i2c+bounces-10256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F16A84DBA
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 22:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D60D179F62
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 20:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE495290BB8;
	Thu, 10 Apr 2025 20:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yv7SIKuX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F55119DF99;
	Thu, 10 Apr 2025 20:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315343; cv=none; b=JhxP8YqR+ybvUV4GVeiaNh2WamsC4LXqCXAyUhsnQcRf0OMuw1Ir7+6geffcEKRhsWI0f3vO3sn88yu5gH9XCrZ4eZ9xB6x46xidX96XEOt5jSrN10kb76WesvCvuvQCaU3dYpQ7ZQzzfm2hg0Lee3Qa38Fv6ixEdSkxYngiKcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315343; c=relaxed/simple;
	bh=ULFbnNf/hvDw+1NTZ+kLF9e+tvJn1FWc+GWv/LrHRAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THF5GVUrWVOSqP+THa0X+gq/hMH5c0MnXoNrcJ6ztUmsyCOIYRolEfI4IiBWHzZCRM6UbezLFrTpwQjLhEOfHeGqIHKPW2B+IlLa82hXwUsWqSYPLu/+XLf8n5vHlo19qEBmkyIpih08nSXMClTULU0hd5u+edLkDvjEJJ8LIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yv7SIKuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A03DC4CEEA;
	Thu, 10 Apr 2025 20:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744315342;
	bh=ULFbnNf/hvDw+1NTZ+kLF9e+tvJn1FWc+GWv/LrHRAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yv7SIKuXR/dspukAHhBiNpVfesY2FtQldpjTrNkVG1+F4Y2A7spiNelUTbU1KwFFn
	 uWNPi7T6ULdSQuOcEDeIphkAQ/b0GZjdsivMBm4tfd6bO2/w3Gtk9eMKhDbnW90LIw
	 GT89MlZGxLWGvRuWf5R/7joW5ZPS5RnjLzEHZX2SUJ0GYCCRGXSS3RN1+NAEMJReZV
	 Ml/Wvbgi0CTm0BIM3a1B5WcTAUDwXpZ+ZIm9ktbyajayhWiJbq5kkD24Xal2uRweN2
	 fLYB5dx4YoLvVB+3l1amlfcKJz3rSu4xmqvS0XFRpPh0WOH3Oa5geRG6NwwNwcBIcu
	 ppjoqeZaLEpQw==
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
Subject: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR definition to amd_node.h
Date: Thu, 10 Apr 2025 15:02:00 -0500
Message-ID: <20250410200202.2974062-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410200202.2974062-1-superm1@kernel.org>
References: <20250410200202.2974062-1-superm1@kernel.org>
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
 arch/x86/include/asm/amd_node.h |  2 ++
 drivers/i2c/busses/i2c-piix4.c  | 12 ++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/amd_node.h b/arch/x86/include/asm/amd_node.h
index 23fe617898a8f..f4993201834ea 100644
--- a/arch/x86/include/asm/amd_node.h
+++ b/arch/x86/include/asm/amd_node.h
@@ -19,6 +19,8 @@
 
 #include <linux/pci.h>
 
+#define FCH_PM_BASE		0xFED80300
+
 #define MAX_AMD_NUM_NODES	8
 #define AMD_NODE0_PCI_SLOT	0x18
 
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index dd75916157f05..7c895001c5e8f 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -21,6 +21,7 @@
    an i2c_algorithm to access them.
 */
 
+#include <asm/amd_node.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/pci.h>
@@ -85,7 +86,6 @@
 #define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
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


