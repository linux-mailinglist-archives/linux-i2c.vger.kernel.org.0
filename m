Return-Path: <linux-i2c+bounces-13539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC110BDE353
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 13:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C8943B1804
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 11:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C26F31CA75;
	Wed, 15 Oct 2025 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RyK9xtue"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay67-hz1.antispameurope.com (mx-relay67-hz1.antispameurope.com [94.100.132.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08231A560
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760526307; cv=pass; b=bjz8rOa7SdvP2XIBUJJ8Q5R5bbpZfjdhP/XZhGQwDDRQEtIN1OmgNckbOVz81l8kvnvu8pKbDJtVfZyIdAhMwhtYjWyB4fRO0Ime+Hlg4dE59i8tdCJR8zf7oEiOlFjTfZVc/dNdnijwDgyNDrlW3z70jQsCP1J0h8X4aCxOqgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760526307; c=relaxed/simple;
	bh=OCvfcbXuoCpeZFGmsuQFKHkAfBggH+KCZIYz3kkFP9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAjb8Mmm41qHcW3lonXYHA7IY7uHpp6+oBPofyXja8ixV+Ho0jK2K4aOQtWMgp+4PPNFYyCpKxaKeB1HQReJ606AEg11pl61r7jEI8W9dC3X0MtYuIH3Lave3YrTgiBXk1m+MuO+IEX+hVRyK29s8rgltwiUBHDAYX+dPUBxtB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RyK9xtue; arc=pass smtp.client-ip=94.100.132.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate67-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=V452y9Hfsr5irYMFqPrKWAs2TWQwteCPJNKBahTxZRM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760526253;
 b=hm+9WgSOO2YUGwvluKVupRW9ls7sZI6CuHZxjIBbfqgGZBystZoG9BHXoKFlLVuveZ3FkfW1
 o7uDA+BNaihYo/p5vkUuh3y+v3pGSDjZAAzqCxoNpeHzK/r67ynDBNHLq8vhLiPuy7g69nqDqzn
 W9TOn4/fJRS0vdSintv8BC3OkKiywO/qC1JQHb08mgQ9BpTGfV96hDxKC+/8FUmBQKYx+V2nEu3
 VP96Il+tkbhSi+0zumXjIfFivMkZLya+JBGPo0pGztToWdjsWQEhsfIWeLxfbTrJUhz5axU/QnF
 OszxsmKkXzS3ombbm9W76Km0Ob1txmzuwST3qZXxmW+lw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760526253;
 b=Mqd7Hxw1tzPhdSsFCJHy0Q2utVmCm5rwac9Xl6XVjA4D4DLnILgueSfAqc24KHws9JAw2sba
 HLYiR4sko2M/ceVnUsHSVGD+OqH9EVai4GI0ZxRvZDgjMO+ip/9YeaKbcnQLaGX5IEzB5XXvfno
 Fc5+0/zXAN5ev1MQxXRDaLJ0IjCKGj9kBPr5XXollZkdD8eCAhR0kuNpTBUpW8yHPqT3LVmeyq5
 5zb3J9nh8Oc5VAOK99ScU3aMolvAMY5HKq8QIwZYlBqJovfGl4OrdsIS8FTyt3SEm3ul2xb4yjy
 bnAVABjwWgbt9FqNnTab4ZQGTOXHRIxOg3v1KzUlz4cGg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay67-hz1.antispameurope.com;
 Wed, 15 Oct 2025 13:04:13 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 01F7CCC0E57;
	Wed, 15 Oct 2025 13:04:03 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 3/4] mfd: tqmx86: add detection for MachXO2 I2C controller
Date: Wed, 15 Oct 2025 13:03:08 +0200
Message-ID: <932c7e543ced2fa8969453ba9685445d7ef0c9ad.1760525985.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <9e00b0ff4e90e4fb31c3012bd7a753d06ae21b45.1760525985.git.matthias.schiffer@ew.tq-group.com>
References: <9e00b0ff4e90e4fb31c3012bd7a753d06ae21b45.1760525985.git.matthias.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay67-hz1.antispameurope.com with 4cmp9w2V7tzKp1y
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:c43876b5d7da1c449cb7ee17c3553cee
X-cloud-security:scantime:2.675
DKIM-Signature: a=rsa-sha256;
 bh=V452y9Hfsr5irYMFqPrKWAs2TWQwteCPJNKBahTxZRM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760526252; v=1;
 b=RyK9xtueZN3ljlcKDCHLkbyaa4xS1+VjfWnjGkoEjGwlSXhYENE5XZuL1OrXjutXO44dtkZp
 z+Ju01bhYFK92HDVQIXczFFz7GBGqmN2OJF1WfehICMcoGlBsxi9I4nDjOqzhHc4f/KQu7wmFOG
 dntLIc3Qr4S4OY9p3wfBksyz6ez+OiBaJa7JDAYktLOOh/Ax4XnqOw3/Ljr8UdX+jRBzGfWLl/r
 843FI14zT+KAbs8G9zoWP0kn0Tj8LhXLJ8NwA1hlnhVeqfMsEc+GAOU/Z+6VnEqjY6L9QgvhUwK
 mtSd/WlVaCLXwd1iWbQN+EzCgzTC7pxS6hI6AHsMKDvoQ==

The TQMx86 PLD may contain two kinds of I2C controllers: the previously
supported OpenCores I2C, or the MachXO2 I2C. Add support for the latter.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
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


