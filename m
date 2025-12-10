Return-Path: <linux-i2c+bounces-14492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D6CB3126
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 14:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F2CB302CC94
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 13:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88193325721;
	Wed, 10 Dec 2025 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oMkua1nZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FAD324B2B
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765374906; cv=pass; b=t9Zn9KkBLGwRHAZaBw53UW289DIS6YLYSRlh1p8stLYqeW8PwgZLDHPoqrWoakNOL6RavsRT9+v4ogryMHRossLsrA2fLZ9j3+mPlFGLhbn2G0Ntvj98b/vevrQiHTXSHVqzbCd0aU8pY+YU6fIBH3x2Gsb/BUche7MWkXQjvqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765374906; c=relaxed/simple;
	bh=y2z/ivb5j5SaYR0Te47XnkrOowGemw2FHL00IlSz188=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5JIIKBCqk+6PI+71LC4qX6uaxOINaO5iILhBtQ/8eme1SAUT3r4VNEj5KhIg646FeLG4Jz3vOF0HrIrseQW+M3KGSuYRVdjnMCumdreUC6W2bvvVI0FwkVwTqtiVADlJUnsu2+L6u6duoLYUYXi8/g2xf89prPEGuasx7azS/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oMkua1nZ; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qFb9y2Gb+Tyrk8cpB1W3RbjKuUVEe8JIj450Hgwa0+M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765374857;
 b=ITp2gFBJcDOS+opfviBpJfoKOs14U5r0DOQ/S96dnRhBPuPCPIkh8zGRuf25dImVRNY+BbmG
 KyP598OxUGmB8OjPEEBxM0LSAvqyQxfsBHakE5bY110cQbG9ZCTJ/uAKYoIU8b4X7UgxhjXnjuC
 HccoqJPSYkkbiotNIyd7FhI43ug5GagT/lsDrsQxthtSvUv8s9CpCNfzlID8Lip3SJAFskzuCtl
 XytoRxYhbdGu8pf+FfjHqNXeVVTXs7kk1O4rwgOa1fShqQ8CqTM0wWM2tQIWZ4tdJ7LXjXVT8Ea
 GH7lGnE+Gpq6zlW/G9TapqnxvlLyarcK4Ja1Dx0Utu3IQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765374857;
 b=LFks0GZ6KZdmkWa4ct2MrRgCgieIAMJLgqDHpJW7zuQJBok7D9f1UYTzRx4JhdIAuLNtdL62
 vCmW9K/0mOTjzlZoCbnmNFBKEk9nHiDeBAC5zFQJnPuxwB1uAvM4TLzp0sYmeYaqIYnm/u/1UWK
 /kj1jJcjNyT6lQHKYDn1JrRNbEro4WmaDsmYXmbDk7fWI1BzedBl+hpr7OEDbsEQydXeMuoQiiv
 d8qnWdOamMy4DGuiIAEG9zBUYNFjNJr43F3frw6hpEQp6rPOKf+I4X66d+g9R7q7ipqJo6YazAl
 UAh5zQUQnRvfPpZYCYTO79RbPEg7XbjCCtUFxayUZbuPw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Wed, 10 Dec 2025 14:54:17 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 140F4CC0CCA;
	Wed, 10 Dec 2025 14:54:10 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v4 3/4] mfd: tqmx86: add detection for secondary I2C controller
Date: Wed, 10 Dec 2025 14:52:52 +0100
Message-ID: <62c6fc03a62aa867689e0d4d3e38e3c598deeb3f.1765373900.git.matthias.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4dRHJL3VHQz2nHXj
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:50108c093861614efcef227e7817273d
X-cloud-security:scantime:1.987
DKIM-Signature: a=rsa-sha256;
 bh=qFb9y2Gb+Tyrk8cpB1W3RbjKuUVEe8JIj450Hgwa0+M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765374857; v=1;
 b=oMkua1nZLgZ/CsvDqZbvXmxHbR9aWkCAZxy9DR3g3F4dIZc3BSa+1q6J4loKTfXD3pihEhCy
 pcjTe1Td62jyudChTxwq/3y8wgfaX791qJi/Y7jPhg4YKVw6p11rs/U0Vx+9SB3JbVoQ4TVhwuG
 L5Erj3M0obkyOObUBFvyhOoSyswd0U1XEt2gZM9H7I7AJI8b1Lw0ZLhfKyzeMvLio5Xaojw2uaX
 9LxSw/6Pm/kU3F8SowW+6FZZ635FYpcIYMQDF/lVjSSiFo0MxRHNeodVwdmUYuFtpkhXAtYUySW
 k9lWkhopFhQHzbCACiW505l+jTFITfB/sJZavHzdfWWuQ==

Many TQMx86 PLDs contain 2 I2C controllers. Add support for the second
one.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

v3: no changes

v4:
- Reorder patch (was 4/4)
- Introduce tqmx86_detect_i2c2(), duplicating tqmx86_detect_i2c1() instead of having a single
  more generic function
- Resources, platform data and mfd_cell are toplevel variables now

 drivers/mfd/tqmx86.c | 58 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 6d304741f8989..708b33c3e5724 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -19,6 +19,7 @@
 #define TQMX86_IOBASE	0x180
 #define TQMX86_IOSIZE	0x20
 #define TQMX86_IOBASE_I2C1	0x1a0
+#define TQMX86_IOBASE_I2C2	0x1aa
 #define TQMX86_IOSIZE_I2C	0xa
 #define TQMX86_IOBASE_WATCHDOG	0x18b
 #define TQMX86_IOSIZE_WATCHDOG	0x2
@@ -53,6 +54,7 @@
 #define TQMX86_REG_IO_EXT_INT_12		3
 #define TQMX86_REG_IO_EXT_INT_MASK		0x3
 #define TQMX86_REG_IO_EXT_INT_I2C1_SHIFT	0
+#define TQMX86_REG_IO_EXT_INT_I2C2_SHIFT	2
 #define TQMX86_REG_IO_EXT_INT_GPIO_SHIFT	4
 #define TQMX86_REG_SAUC		0x17
 
@@ -67,6 +69,10 @@ static uint i2c1_irq;
 module_param(i2c1_irq, uint, 0);
 MODULE_PARM_DESC(i2c1_irq, "I2C1 IRQ number (valid parameters: 7, 9, 12)");
 
+static uint i2c2_irq;
+module_param(i2c2_irq, uint, 0);
+MODULE_PARM_DESC(i2c2_irq, "I2C2 IRQ number (valid parameters: 7, 9, 12)");
+
 enum tqmx86_i2c1_resource_type {
 	TQMX86_I2C1_IO,
 	TQMX86_I2C1_IRQ,
@@ -78,6 +84,17 @@ static struct resource tqmx_i2c1_resources[] = {
 	[TQMX86_I2C1_IRQ] = {},
 };
 
+enum tqmx86_i2c2_resource_type {
+	TQMX86_I2C2_IO,
+	TQMX86_I2C2_IRQ,
+};
+
+static struct resource tqmx_i2c2_resources[] = {
+	[TQMX86_I2C2_IO] = DEFINE_RES_IO(TQMX86_IOBASE_I2C2, TQMX86_IOSIZE_I2C),
+	/* Placeholder for IRQ resource */
+	[TQMX86_I2C2_IRQ] = {},
+};
+
 static const struct resource tqmx_watchdog_resources[] = {
 	DEFINE_RES_IO(TQMX86_IOBASE_WATCHDOG, TQMX86_IOSIZE_WATCHDOG),
 };
@@ -113,6 +130,16 @@ static const struct mfd_cell tqmx86_i2c1_dev_ocores = {
 	.num_resources = ARRAY_SIZE(tqmx_i2c1_resources),
 };
 
+static struct ocores_i2c_platform_data tqmx86_i2c2_platform_data_ocores = {};
+
+static const struct mfd_cell tqmx86_i2c2_dev_ocores = {
+	.name = "ocores-i2c",
+	.platform_data = &tqmx86_i2c2_platform_data_ocores,
+	.pdata_size = sizeof(tqmx86_i2c2_platform_data_ocores),
+	.resources = tqmx_i2c2_resources,
+	.num_resources = ARRAY_SIZE(tqmx_i2c2_resources),
+};
+
 static const struct mfd_cell tqmx86_devs[] = {
 	{
 		.name = "tqmx86-wdt",
@@ -271,6 +298,33 @@ static int tqmx86_detect_i2c1(struct device *dev, void __iomem *io_base, int clo
 	return 0;
 }
 
+static int tqmx86_detect_i2c2(struct device *dev, void __iomem *io_base, int clock_khz)
+{
+	u8 i2c_det;
+
+	if (i2c2_irq) {
+		if (!tqmx86_setup_irq(dev, "I2C2", i2c2_irq, io_base,
+				      TQMX86_REG_IO_EXT_INT_I2C2_SHIFT))
+			tqmx_i2c2_resources[TQMX86_I2C2_IRQ] = DEFINE_RES_IRQ(i2c2_irq);
+	}
+
+	/*
+	 * The I2C_DETECT register is in the range assigned to the I2C driver
+	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
+	 * access instead of ioport_map + unmap.
+	 */
+	i2c_det = inb(TQMX86_IOBASE_I2C2 + TQMX86_REG_I2C_DETECT);
+
+	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES) {
+		tqmx86_i2c2_platform_data_ocores.clock_khz = clock_khz;
+		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+					    &tqmx86_i2c2_dev_ocores, 1, NULL, 0,
+					    NULL);
+	}
+
+	return 0;
+}
+
 static int tqmx86_probe(struct platform_device *pdev)
 {
 	u8 board_id, sauc, rev;
@@ -305,6 +359,10 @@ static int tqmx86_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = tqmx86_detect_i2c2(dev, io_base, clock_khz);
+	if (err)
+		return err;
+
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				    tqmx86_devs,
 				    ARRAY_SIZE(tqmx86_devs),
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


