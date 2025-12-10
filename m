Return-Path: <linux-i2c+bounces-14490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF08CB3120
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 14:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63E9E30F69E5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 13:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26939325723;
	Wed, 10 Dec 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iy9lwT0i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay112-hz1.antispameurope.com (mx-relay112-hz1.antispameurope.com [94.100.132.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD0317711
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765374875; cv=pass; b=Mm47fRfDdS+c8KyGtLxvlrNOqvqPCyJLKA4dx+zKMdg1+CE/n5uvQncAP0FdJA2CdbR/ZW9+lgJDjzkw2fmVbMltFDxUZ3/tTPMs6JxjS0tUXOGs1rlwLc+x23ni0mV67h/VkbEA5qsaJY1OOGIiChiwnbyzMBTANB7BkSwRN2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765374875; c=relaxed/simple;
	bh=J61y2+gUfyHFzLGwLWzBQRzZC1YNTsSEyQdFmIAK360=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dEGhAjLsIuJ84HXr9dXjSXbtWLcWab65xhzv0kYzFXFcuhXFh0PGEa89GK6cQJ+Ho8a/ZH1moX2FAiJEQL5Ua8zfwUxwsiHRBN8SrKQDgSfXOCTY453zc+ryhDAH6euFfGzCRoshfxfOrdXYoipTd6G1CArop6+wLE7zM8B1E9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iy9lwT0i; arc=pass smtp.client-ip=94.100.132.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate112-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Rc5m14+w/GT2smQr7a0YPWZgzOaul5JPO2JsZD5uGJk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765374858;
 b=cz6JxHk214oFfu+gvW3lAQIo7CeBCE54pTq7mJoTkOy3jnCbcZik9uncJTmmONEJfOYH0auq
 WH9xNq4wxVCPPTilAF6nM5MiTmixdHyFKnvhw/fgnD+SDqqa6SP9dVzfLcHvtESspuu+o1OZFQe
 eh64U40ISozRooVvO8w4+DcnYsfOv7mK/XGsJen5pGHMhkiSSdw5nkleztxey+y3AZNfF5/LLSp
 nPs1x1NY7T247rkGyhuPxbMLbLiApvPCBTdOfE1/k/03qdSk/yG+KIoVJRgS9vd+D/PPiQRtJfz
 vDOhYbtO0YEt8UDUUN/AsR6FBauCsHFPc9t5CmitWgF4Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765374858;
 b=LjIoveKCXRvMyl9xUw/dGZ5zazSmfhRXJLZPGbuZVwQR6ftcD8vew+E64PSyIQ3MWhB0lHoO
 tgAsD+q5JmCGOheUYGG3Q59yVkl1S7uruTYJipXoX5SEuT1mGUoILicsrBMTu88G6IcswLIIPhB
 Y48u6rWDGvDSYPWsrDhYlEdrHZpfgrGU96ZSHrQ5oKQ25gpERyKwQ5pAXCk7ao+zeB3D6lFIsV6
 PL+I5v76ESNQLfN616AaI44YCJ1OZxg9tA1EoKE3Fky8tyjeCPynetgCBsARFaBNn8gb3evNyzU
 A+jayVir9a7Vhd+s+lbWCVy2G51X5mnfy3+peHJwMDpng==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay112-hz1.antispameurope.com;
 Wed, 10 Dec 2025 14:54:18 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6A9C1CC0CB7;
	Wed, 10 Dec 2025 14:54:10 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v4 4/4] mfd: tqmx86: add detection for MachXO2 I2C controller
Date: Wed, 10 Dec 2025 14:52:53 +0100
Message-ID: <8d275757b7544fe81e5cec4a1a5d4524e9b6967b.1765373900.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <128cfc422f60d674f5ced8e8350b794945c8fa59.1765373900.git.matthias.schiffer@ew.tq-group.com>
References: <128cfc422f60d674f5ced8e8350b794945c8fa59.1765373900.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:linux-i2c@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay112-hz1.antispameurope.com with 4dRHJL62Gtzwdsl
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:9a981fd536c9a08f7dbcbc0b6e67203b
X-cloud-security:scantime:2.237
DKIM-Signature: a=rsa-sha256;
 bh=Rc5m14+w/GT2smQr7a0YPWZgzOaul5JPO2JsZD5uGJk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765374857; v=1;
 b=iy9lwT0iQ3teKJpsAJ8jGamldK2j2LLJ2k+CzHl8w0nkUrHUI0arWRQ8ial9FTOys9M5Q7l3
 U0jpIvNlhEwpC8gNuSG+iW3nzpy3rbB880SFc45C5PYP/WMYfMxdC8OJ0v315ECnNURPosX0yZM
 vRD4fFRB5I9bpBJd/5URfHWeDd2QrLkPpvN/vTgG2WTR2N9d7EiXMyUuOImVP7wgxwxc8Fl1qRs
 zjWrZEc98jb8K1ImqbtqBKFluT7sxfCmWOr11G4A/CooltUV3oiSa6XZIQlyz826yriYy4H5f7c
 W5TOdIiD8J26xFRKi7R18fw48E+85AyDI0sJSwxfT8oRw==

The TQMx86 PLD may contain two kinds of I2C controllers as its secondary
instance: the previously supported OpenCores I2C, or the MachXO2 I2C. Add
support for the latter.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

v3: no changes

v4:
- Reorder patch (was 3/4) - the new order makes more sense with the changed (less generic) approach
- Platform data and mfd_cell are toplevel variables now
- With the new less generic approach i2c-machxo2 detection is only done for the secondary I2C controller
  (as the primary one is always i2c-ocores anyways)


 drivers/mfd/tqmx86.c | 44 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 708b33c3e5724..a4e3ecfccb8ab 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/mfd/core.h>
 #include <linux/module.h>
+#include <linux/platform_data/i2c-machxo2.h>
 #include <linux/platform_data/i2c-ocores.h>
 #include <linux/platform_device.h>
 
@@ -61,6 +62,8 @@
 #define TQMX86_REG_I2C_DETECT	0x7
 #define TQMX86_REG_I2C_DETECT_OCORES	0xa5
 
+#define TQMX86_REG_I2C_IEN	0x9
+
 static uint gpio_irq;
 module_param(gpio_irq, uint, 0);
 MODULE_PARM_DESC(gpio_irq, "GPIO IRQ number (valid parameters: 7, 9, 12)");
@@ -130,6 +133,8 @@ static const struct mfd_cell tqmx86_i2c1_dev_ocores = {
 	.num_resources = ARRAY_SIZE(tqmx_i2c1_resources),
 };
 
+/* Only one of the tqmx86_i2c2_* instances is registered, depending on which is detected */
+
 static struct ocores_i2c_platform_data tqmx86_i2c2_platform_data_ocores = {};
 
 static const struct mfd_cell tqmx86_i2c2_dev_ocores = {
@@ -140,6 +145,18 @@ static const struct mfd_cell tqmx86_i2c2_dev_ocores = {
 	.num_resources = ARRAY_SIZE(tqmx_i2c2_resources),
 };
 
+struct machxo2_i2c_platform_data tqmx86_i2c2_platform_data_machxo2 = {
+	.bus_khz = 100,
+};
+
+static const struct mfd_cell tqmx86_i2c2_dev_machxo2 = {
+	.name = "i2c-machxo2",
+	.platform_data = &tqmx86_i2c2_platform_data_machxo2,
+	.pdata_size = sizeof(tqmx86_i2c2_platform_data_machxo2),
+	.resources = tqmx_i2c2_resources,
+	.num_resources = ARRAY_SIZE(tqmx_i2c2_resources),
+};
+
 static const struct mfd_cell tqmx86_devs[] = {
 	{
 		.name = "tqmx86-wdt",
@@ -282,9 +299,9 @@ static int tqmx86_detect_i2c1(struct device *dev, void __iomem *io_base, int clo
 	}
 
 	/*
-	 * The I2C_DETECT register is in the range assigned to the I2C driver
-	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
-	 * access instead of ioport_map + unmap.
+	 * These registers are in the range assigned to the I2C driver
+	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for these one-off
+	 * accesses instead of ioport_map + unmap.
 	 */
 	i2c_det = inb(TQMX86_IOBASE_I2C1 + TQMX86_REG_I2C_DETECT);
 
@@ -300,7 +317,7 @@ static int tqmx86_detect_i2c1(struct device *dev, void __iomem *io_base, int clo
 
 static int tqmx86_detect_i2c2(struct device *dev, void __iomem *io_base, int clock_khz)
 {
-	u8 i2c_det;
+	u8 i2c_det, i2c_ien;
 
 	if (i2c2_irq) {
 		if (!tqmx86_setup_irq(dev, "I2C2", i2c2_irq, io_base,
@@ -312,16 +329,33 @@ static int tqmx86_detect_i2c2(struct device *dev, void __iomem *io_base, int clo
 	 * The I2C_DETECT register is in the range assigned to the I2C driver
 	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
 	 * access instead of ioport_map + unmap.
+	 *
+	 * There are 3 cases to distinguish for the secondary controller:
+	 *
+	 * - ocores: i2c_det is a TQMx86-specific register that always contains
+	 *   the value 0xa5. i2c_ien is unused and reads as 0xff.
+	 * - machxo2: i2c_det is the data register can read as any value.
+	 *   i2c_ien is the interrupt enable register; the upper nibble is
+	 *   reserved and always reads as 0.
+	 * - none: both i2c_det and i2c_ien read as 0xff if no I2C controller
+	 *   exists at a given base address.
 	 */
 	i2c_det = inb(TQMX86_IOBASE_I2C2 + TQMX86_REG_I2C_DETECT);
+	i2c_ien = inb(TQMX86_IOBASE_I2C2 + TQMX86_REG_I2C_IEN);
 
-	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES) {
+	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES && i2c_ien == 0xff) {
 		tqmx86_i2c2_platform_data_ocores.clock_khz = clock_khz;
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 					    &tqmx86_i2c2_dev_ocores, 1, NULL, 0,
 					    NULL);
+	} else if ((i2c_ien & 0xf0) == 0x00) {
+		tqmx86_i2c2_platform_data_machxo2.clock_khz = clock_khz;
+		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+					    &tqmx86_i2c2_dev_machxo2, 1, NULL, 0,
+					    NULL);
 	}
 
+
 	return 0;
 }
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


