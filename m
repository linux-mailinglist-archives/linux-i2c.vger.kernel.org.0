Return-Path: <linux-i2c+bounces-10618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22368A9B3DD
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 18:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FE127A4991
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 16:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EC92820A6;
	Thu, 24 Apr 2025 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rLWiWYim";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vhdGt3IZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7927FD79;
	Thu, 24 Apr 2025 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511872; cv=none; b=gkIlrhGrubWTRQwj259C7+NiKQSWL+ORH94CTHvvpEwUd3+AiPo7QcbtRH55GfkljO7QbGC8L3J6Ry1P+gnyiHp1GLQA/MkFSB0N2vXAC7vex53J7tjVtDk1j9NValA72Y+miihZFemfiuEqwByJOxmpA4vrcAzJb4gjuMADe3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511872; c=relaxed/simple;
	bh=sDoGP7IJYDc2N6HZn3uksbko3jiZ6oZmcVVMjWTdpjY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=F/FWlaxjbKhzFCKr+tFhf5jFSIPrMcyGdIK0kyylWOgvDntHdIsDx7o/xbEiyb7Eu26LpggfKkxcY0HQHkYpOW7YAROsYy7tunPADhVvrzhjzlqyaiwB+rXb7BScTzqHee/q6Zps10tvwpTHDZrS+txTQrIs3Lm2Gp+Q1xfhhCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rLWiWYim; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vhdGt3IZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 24 Apr 2025 16:24:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745511868;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4J+9NlSHPMZMrP8zS7H8oh5NovKCQ8ixKk9OzcFSZ30=;
	b=rLWiWYimWBODPRBCO25F281g0kHkMRTrvmPftW8PIoh6LvK3I57e+638k5Wc/ED34s4NbL
	DdIWNvLjcPXS3S2SO/QpAwXZ0WzqjSYm4A9k3u0eaNR2Vol6mSDIFfm3SA/SNoiPCjJ4nN
	o2o69ViC7uvVDhUaAS4407enSkwN95wX8gAjDdnCo23xx8hGC9PiWS9a+LucXK9ATMlcrR
	4SLn/v3UByVMUPXFc6HcOGLyHpSd7PdCJEmRrVf2J1QK+H07QfxGXLYVSQig4cvRQEy6fL
	q4O+SbdTv0ynKHf3ORihWy/sIBszeOH/hLisQ47Vx+c7FRapCfP/W9/5AK2yLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745511868;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4J+9NlSHPMZMrP8zS7H8oh5NovKCQ8ixKk9OzcFSZ30=;
	b=vhdGt3IZB0fkvES99AMhCiojls1LfCeJTvcnH5QAgjObNMvZOt9vcvVLwiwiOp2TaWvjgj
	e3gMMlFsCS4PnVBA==
From: "tip-bot2 for Mario Limonciello" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/platform] i2c: piix4, x86/platform: Move the SB800 PIIX4
 FCH definitions to <asm/amd/fch.h>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Ingo Molnar <mingo@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Hans de Goede <hdegoede@redhat.com>,
 ilpo.jarvinen@linux.intel.com, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Sanket Goswami <Sanket.Goswami@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, linux-i2c@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250422234830.2840784-4-superm1@kernel.org>
References: <20250422234830.2840784-4-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <174551186764.31282.18307397945337573295.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/platform branch of tip:

Commit-ID:     f3715dfb7b665f1aa2cd162649bd3d5362e44377
Gitweb:        https://git.kernel.org/tip/f3715dfb7b665f1aa2cd162649bd3d5362e=
44377
Author:        Mario Limonciello <mario.limonciello@amd.com>
AuthorDate:    Tue, 22 Apr 2025 18:48:28 -05:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Thu, 24 Apr 2025 17:55:18 +02:00

i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fc=
h.h>

SB800_PIIX4_FCH_PM_ADDR is used to indicate the base address for the
FCH PM registers.  Multiple drivers may need this base address, so
move related defines to a common header location and rename them
accordingly.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Sanket Goswami <Sanket.Goswami@amd.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-i2c@vger.kernel.org
Link: https://lore.kernel.org/r/20250422234830.2840784-4-superm1@kernel.org
---
 arch/x86/include/asm/amd/fch.h | 11 +++++++++++
 drivers/i2c/busses/i2c-piix4.c | 18 +++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)
 create mode 100644 arch/x86/include/asm/amd/fch.h

diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
new file mode 100644
index 0000000..28972bd
--- /dev/null
+++ b/arch/x86/include/asm/amd/fch.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_AMD_FCH_H_
+#define _ASM_X86_AMD_FCH_H_
+
+#define FCH_PM_BASE			0xFED80300
+
+/* Register offsets from PM base: */
+#define FCH_PM_DECODEEN			0x00
+#define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
+
+#endif /* _ASM_X86_AMD_FCH_H_ */
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index dd75916..59ecaa9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -34,6 +34,7 @@
 #include <linux/dmi.h>
 #include <linux/acpi.h>
 #include <linux/io.h>
+#include <asm/amd/fch.h>
=20
 #include "i2c-piix4.h"
=20
@@ -80,12 +81,11 @@
 #define SB800_PIIX4_PORT_IDX_MASK	0x06
 #define SB800_PIIX4_PORT_IDX_SHIFT	1
=20
-/* On kerncz and Hudson2, SmBus0Sel is at bit 20:19 of PMx00 DecodeEn */
-#define SB800_PIIX4_PORT_IDX_KERNCZ		0x02
-#define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
+/* SmBus0Sel is at bit 20:19 of PMx00 DecodeEn */
+#define SB800_PIIX4_PORT_IDX_KERNCZ		(FCH_PM_DECODEEN + 0x02)
+#define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	(FCH_PM_DECODEEN_SMBUS0SEL >> 16)
 #define SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ	3
=20
-#define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
 #define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
=20
@@ -162,19 +162,19 @@ int piix4_sb800_region_request(struct device *dev, stru=
ct sb800_mmio_cfg *mmio_c
 	if (mmio_cfg->use_mmio) {
 		void __iomem *addr;
=20
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
=20
-		addr =3D ioremap(SB800_PIIX4_FCH_PM_ADDR,
+		addr =3D ioremap(FCH_PM_BASE,
 			       SB800_PIIX4_FCH_PM_SIZE);
 		if (!addr) {
-			release_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+			release_mem_region(FCH_PM_BASE,
 					   SB800_PIIX4_FCH_PM_SIZE);
 			dev_err(dev, "SMBus base address mapping failed.\n");
 			return -ENOMEM;
@@ -201,7 +201,7 @@ void piix4_sb800_region_release(struct device *dev, struc=
t sb800_mmio_cfg *mmio_
 {
 	if (mmio_cfg->use_mmio) {
 		iounmap(mmio_cfg->addr);
-		release_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+		release_mem_region(FCH_PM_BASE,
 				   SB800_PIIX4_FCH_PM_SIZE);
 		return;
 	}

