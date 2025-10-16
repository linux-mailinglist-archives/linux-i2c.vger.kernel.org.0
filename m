Return-Path: <linux-i2c+bounces-13586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D31BE34A1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 14:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D25C5060F7
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 12:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214F2326D4B;
	Thu, 16 Oct 2025 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nUCShaL7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038C2FD1CC
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 12:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616855; cv=pass; b=HikkKN+2MWiY+h4RSyNrZVWAdKvsiwDPXfbFYeyry1Q4Twl3DBqpcZd2Jv84X+/bhtA+XZ+pgVw9cLwihRdX1yVkrFodRVq8H20KM4J0fyT1IeKRCn0NXfHK8fZh6/apCGa6P8xDNAf6FNXsUEyA26AvmPYoQrT1wjsSTsMNdtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616855; c=relaxed/simple;
	bh=DAM8XDJLzBgwm33gfEPZMyouQn4Jb3TBLQZxOzbo9dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srrPlC+H/DjF3Srn9Gf3ABoeYCdFsOta30CPxoArZviPlATuc0a8/ArbFSe+VeHRw2Y7ZF2p5cF4oPkfeHLHX7OYQwEG80bBHookEZZJ6GOc+TRWgnNCIz5HFfRgNNcK3dbxQIjFgIBTcoD8DEz18d2BYm9Jwo+r6PfPfCQh2bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nUCShaL7; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wUhlaVs+IE9kPgZhZTQ36uoZ0h0C/n4mWtF/lmoWzOA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760616841;
 b=XL7Oe25k++V5yIstl0RUjC655A2YXYoxAM4DKHIILvt7HGqWhtuQPivhYAu8KD6nJDCgV1/Y
 ZrMYD3aTO484twfRYvqJWmeCk77rDuNv5s6ZFq80xJUFQAmaFHvRbqP0LB7LeD+gLFOpGhuGmGb
 QKQecOdPDzca2oVlzsBE7LU9GwEqcsFgoegvL14828yiq5IkOb4yk6OU68JDoQZjCswP55Ev94o
 xsukK0TESl/AXLw+lODKuEeK8MnymbXLWB9+v/FgdbzSZXkrsuaujkm66Jxvb6VsbI0yW+kpsbl
 mdy1foMpCQfWYSOzuCnjgMr2lRrNtYV87d1P9sLvUDhXQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760616841;
 b=LG7PEZQnhZSRi+Sv1NgHh0lMgumEN1AZ7A0BFZUE2EhJudJXoTEMJZlWG0+WE0I+9o2G8YfG
 5GUg7yPVWhmIc8MSZTZ+yUbmBuMZHRey1H6Rk+2ru07OOpgjzQ6jUCHNJzsrLg3zpOsySXZEGGC
 rDF/vA0q5slbGNmK8cQbv9SW+wXs7CqRpzk8jcCpXJmMypAm+QWnR9M2Jxw2ztCkF1UbK35f0JN
 Bv+Mv38DBKIwLBGBqMg0RdGNjVhaiXnEKoSrIcwHDOgCP0zfDn8LJsdz2jNSGFoMKuNyXhUxXn4
 OfeMUjjz23JzFl2FetlemB+TXXAWlEU+WdmMeCRdeQ9+A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 16 Oct 2025 14:14:01 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 54808A40FA1;
	Thu, 16 Oct 2025 14:13:50 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 3/4] mfd: tqmx86: add detection for MachXO2 I2C controller
Date: Thu, 16 Oct 2025 14:13:28 +0200
Message-ID: <419419dd6269f033fd68af55e33a1f0d640b60df.1760601899.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <5855f15ad83617d3a71b40d89d61273722c6e15f.1760601899.git.matthias.schiffer@ew.tq-group.com>
References: <5855f15ad83617d3a71b40d89d61273722c6e15f.1760601899.git.matthias.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4cnRgy65qyz4MZyL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:16a24d8eea459d453325dc3610ee9d4e
X-cloud-security:scantime:2.402
DKIM-Signature: a=rsa-sha256;
 bh=wUhlaVs+IE9kPgZhZTQ36uoZ0h0C/n4mWtF/lmoWzOA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760616841; v=1;
 b=nUCShaL7R4O+ZfhZ2d0T8+/MQIwZ3s60kJRB0GXEYrrQEcGPA+QPAj8oyImiNPJAOjEXXpeg
 jJDWzYi3PqY+rurqsfmJFd3BKMaaswkO+HaCr3nzeg2YNsvRQ0TFIZb7Jd9QSe0G12S2LjXKH3g
 2CQ1F5saSbb2CT4FCIfC+Ch1Z0TlEIyXd+KutcKUtjFdVKVWj7Am2YmgAz1Bpqw+O1NR6gFzdyX
 c2eYbG1aawTWZKI7GoZ+Ej6mlvU2aGFKXdzl1ccU0N2ZBjYRcSGRDQqY+3/p38bjZ15ZvTL64Dj
 mTENLobI1yA3VPc5hPOENvuRehpnCrd8bv4WVjAftv/og==

The TQMx86 PLD may contain two kinds of I2C controllers: the previously
supported OpenCores I2C, or the MachXO2 I2C. Add support for the latter.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

 drivers/mfd/tqmx86.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 3c6f158bf1a45..6447406f5026f 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/mfd/core.h>
 #include <linux/module.h>
+#include <linux/platform_data/i2c-machxo2.h>
 #include <linux/platform_data/i2c-ocores.h>
 #include <linux/platform_device.h>
 
@@ -57,6 +58,8 @@
 #define TQMX86_REG_I2C_DETECT	0x7
 #define TQMX86_REG_I2C_DETECT_OCORES	0xa5
 
+#define TQMX86_REG_I2C_IEN	0x9
+
 static uint gpio_irq;
 module_param(gpio_irq, uint, 0);
 MODULE_PARM_DESC(gpio_irq, "GPIO IRQ number (valid parameters: 7, 9, 12)");
@@ -248,27 +251,53 @@ static int tqmx86_setup_i2c_ocores(struct device *dev, const char *label,
 				sizeof(platform_data), irq);
 }
 
+static int tqmx86_setup_i2c_machxo2(struct device *dev, const char *label,
+				    unsigned long i2c_base, int clock_khz, u8 irq)
+{
+	const struct machxo2_i2c_platform_data platform_data = {
+		.clock_khz = clock_khz,
+		.bus_khz = 100,
+	};
+
+	return tqmx86_setup_i2c(dev, "i2c-machxo2", i2c_base, &platform_data,
+				sizeof(platform_data), irq);
+}
+
 static int tqmx86_detect_i2c(struct device *dev, const char *label,
 			     unsigned long i2c_base, int clock_khz, u8 irq,
 			     const struct i2c_board_info *devices,
 			     size_t num_devices, void __iomem *io_base,
 			     u8 irq_reg_shift)
 {
-	u8 i2c_det;
+	u8 i2c_det, i2c_ien;
 
 	if (tqmx86_setup_irq(dev, label, irq, io_base, irq_reg_shift))
 		irq = 0;
 
 	/*
-	 * The I2C_DETECT register is in the range assigned to the I2C driver
-	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
-	 * access instead of ioport_map + unmap.
+	 * These registers are in the range assigned to the I2C driver
+	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for these one-off
+	 * accesses instead of ioport_map + unmap.
+	 *
+	 * There are 3 cases to distinguish:
+	 *
+	 * - ocores: i2c_det is a TQMx86-specific register that always contains
+	 *   the value 0xa5. i2c_ien is unused and reads as 0xff.
+	 * - machxo2: i2c_det is the data register can read as any value.
+	 *   i2c_ien is the interrupt enable register; the upper nibble is
+	 *   reserved and always reads as 0.
+	 * - none: both i2c_det and i2c_ien read as 0xff if no I2C controller
+	 *   exists at a given base address.
 	 */
 	i2c_det = inb(i2c_base + TQMX86_REG_I2C_DETECT);
+	i2c_ien = inb(i2c_base + TQMX86_REG_I2C_IEN);
 
-	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES)
+	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES && i2c_ien == 0xff)
 		return tqmx86_setup_i2c_ocores(dev, label, i2c_base, clock_khz,
 					       irq, devices, num_devices);
+	else if ((i2c_ien & 0xf0) == 0x00)
+		return tqmx86_setup_i2c_machxo2(dev, label, i2c_base, clock_khz,
+						irq);
 
 	return 0;
 }
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


