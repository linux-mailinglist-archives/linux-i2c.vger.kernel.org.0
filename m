Return-Path: <linux-i2c+bounces-13725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B9BFB0B1
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 11:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CE554FB71E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 09:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B6B30FC25;
	Wed, 22 Oct 2025 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="L9VKLSaf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay02-hz1.antispameurope.com (mx-relay02-hz1.antispameurope.com [94.100.132.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C337305967
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123786; cv=pass; b=tztqKckM5HlTGttbkSGWH6tiqwOYZCxNyljuVBJUrburnMbbpR2UwB9px4T+bQMY7GaGiapKiPgpCsVYHvPs2cJWVya5MY56nxoWMRI1j0/5OFCISAhUBaGNRY7ibDt+tbQAnFtxg7g5tAlitd4/mgTwLUbBiwqT/z8CTy/1vZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123786; c=relaxed/simple;
	bh=OVh0ZUwx27cW7RIRa1zzhCPbRQKVVM/TG+TpYX7rzsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlNEeFh0BsVuowim0Oy5apTot2hfIeKLU1hmvGuj/Klw3BX618S4IqQNkYsQoDnbIThJXebnKvE/Z+iN04KbSxMY3+q1RDtB/nxDXRpgK4FfNSgL+LhvNqR0ExNOAmwKbmlS42cqoADWKqc8Ey0uurvR3KiF/DpdxtKwr5BoCZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=L9VKLSaf; arc=pass smtp.client-ip=94.100.132.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate02-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=z9MN8x1a3dmQkT2iCoRwYtoRNiqkW2k/qHJlG0OXDeM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761123714;
 b=r33u3EnmTU6/lXGKA1WzOl0YZYikVr6EGLuhULX5raOlNVeQAa6Vmh5XJnmCjOn3vKu5vUPk
 wKd6NvAizCIonDfYsIXmijwJvMhkSe+ENVCHmNSRGE8zJZQWJfyUMKGWsc9vElgRMQA0iY8RfJQ
 3HiM7MufZFF0+a0LYKhd+UJMPCp/iNP03sHkaRDhBVzyCKtiD71uI+8R+Pv3cB15xXfRD2TKjiv
 brhVC8zd4GESPjnhsn3clqLwCA0UhCgKlwtMkTcNcu0XJgDRm2t1XyA5Nlk8iMhvOTleGeDSsGL
 1k3Mis851103zxt7kQYMY1ePt8NxH2bwa6PxCbkZcbRSQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761123714;
 b=pWSnTruNAr07dPme92vdmxccwd+GeKDn4CFqtpKmymJZQ9cwy000tWN6/tqmzKoZvHVG9TLK
 PZEU68KeRa8BB4sHPRXEVz062llHTqGPVHmHMMsiL9CIXUNx75AWxDrX+F+4J9WDSTnLrCxUChB
 ok/Zf+Fxsa+Iiv0OmcxCKRohacXGzd3kt64Q5RXSoZXMMS6HWnL4+FTAkObF6XARzt6qwHlA7iA
 a1AsAEXHI8OfeISztIQWNfM6fcJ3IXIV+kIHP59WYvh9DMaQ216KU+bZPKa3dih4U+lIpo02w2T
 kHFUXn0Jwl//hsz/ZxnTLG4HUK3UREtA0RwxupOS4H/Lw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay02-hz1.antispameurope.com;
 Wed, 22 Oct 2025 11:01:54 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 390095A20FB;
	Wed, 22 Oct 2025 11:01:36 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 3/4] mfd: tqmx86: add detection for MachXO2 I2C controller
Date: Wed, 22 Oct 2025 11:01:15 +0200
Message-ID: <0f08a5785424e23a99aea82e539cc2fcec61b71d.1761123080.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>
References: <bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay02-hz1.antispameurope.com with 4cs37N5kWZzR1JG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:fcd2d86e937189137eebea87f5b8cfd6
X-cloud-security:scantime:3.441
DKIM-Signature: a=rsa-sha256;
 bh=z9MN8x1a3dmQkT2iCoRwYtoRNiqkW2k/qHJlG0OXDeM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761123713; v=1;
 b=L9VKLSafINbk2HAQrgnz5jr0x3ShYN2zTReYYblLFgCT8GXXUQHOq2xv0TNwZhZdzEQkb0Ls
 2gfIX9kwrwcK8aHUtot6gUgCm0qhz4rUzpEeYT0yLSAikkC7b/CCQGs/IPF7+ObianyXN4aS3iR
 LTwwiuXIYY3lTPjsbpFaIvVIPvQ4L3sghVBVBhR3fol5Sf2K9duRzoRQsnN8LOKDir3epCB0xo2
 noM3Nl6YfMPNfqVUy0fAJSEEJ79jna2UlYPoj2uTZKlF36rUq69TXqc973u0yRg+/GlVoPXPn2Q
 UNtQNdP4EHLRgoBQA4nBZihMyR2+EIrjPiBEJlauBGnAA==

The TQMx86 PLD may contain two kinds of I2C controllers: the previously
supported OpenCores I2C, or the MachXO2 I2C. Add support for the latter.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes
v3: no changes

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

