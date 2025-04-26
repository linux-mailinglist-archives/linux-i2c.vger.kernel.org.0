Return-Path: <linux-i2c+bounces-10633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E91A9D9F0
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 11:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 217B94A4D53
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26182512FF;
	Sat, 26 Apr 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yalPM+J9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lpqfg57x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B41FBCB0;
	Sat, 26 Apr 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745661425; cv=none; b=n2Oj20rdOYRTPLq07PT8USY5xkEqKtgs6Y+NJrRU2wtdryVq6QgU0v9jIMeXq7SDpdQsCUSspS2BdYLY3h3kfGr1/AGAknOCa8xVt4Mxm7E9TVxDwSv3asfYy20p3ZpQkI0JSL5J2VUmdyUm1Rbn87dVncpBmaoEszWDngGyJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745661425; c=relaxed/simple;
	bh=tIhQBmjYSsc1ebQJ/dAZB4A4lIu46DIAC76cFvtzVqE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Ygb4COwWNyAeqTsbJhdSh7H10bDnEvjyK0j8C2NUzM4pzDHaNOTPhhYWxSWvZbyFR11N4VGEMuKt+g+Mw4gvEj+gRPTNzieVnIBFj9E4b6lrRfBq2KF9c4VHwg1U83KikHzpyb5bGcknRHdAYmJO+dlxDWS5XMQdag4kKn6AHmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yalPM+J9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lpqfg57x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 26 Apr 2025 09:57:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745661421;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ax+uEl+FF/rPS2zVSvX5zpVWySHgMYePOozMl8h/08=;
	b=yalPM+J9iYPwYm38+/u6JuTtUFFrJAV2BQ2sBTsepgbh2a2/sWJO0zRm1E6FC0chAmi8oB
	ynhaeha1rpAXjRU7wns8RC/WANJHeKhY9fQW8J6Qjs7Hk3XxXADg+pcAeNrm687iDN3Y1s
	bC3eOeVR/gSOzxzWCGR1+GGSr7aNxD82IOrEoF9vQSdBaJrCkmE7KzfqLZ7TZH9b6svVFG
	K5doUw+okYwhTXqiAtjpBXvBmwOULot31wz76k8zrkUOegnOTD2nFc0SPEow7qzwvTz1/q
	YRIB/1XNze6JCGHoyTyEkeQ6Pl3NPUTz8+/t5855e0Gr5v7p/86FEDpaOIQwhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745661421;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ax+uEl+FF/rPS2zVSvX5zpVWySHgMYePOozMl8h/08=;
	b=lpqfg57xiAXRlPtTQPyP6BBhfkASVz5d97F+KfnjnvbBmfMYjktykxmk3OqgoTX326OfP7
	FZAoqiZ+aGod1QDw==
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
Message-ID: <174566142040.31282.7334143550650903312.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/platform branch of tip:

Commit-ID:     624b0d5696a89b138408d385899dd35372db324b
Gitweb:        https://git.kernel.org/tip/624b0d5696a89b138408d385899dd35372d=
b324b
Author:        Mario Limonciello <mario.limonciello@amd.com>
AuthorDate:    Tue, 22 Apr 2025 18:48:28 -05:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sat, 26 Apr 2025 11:41:06 +02:00

i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fc=
h.h>

SB800_PIIX4_FCH_PM_ADDR is used to indicate the base address for the
FCH PM registers.  Multiple drivers may need this base address, so
move related defines to a common header location and rename them
accordingly.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
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

