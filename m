Return-Path: <linux-i2c+bounces-14491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D8CB3123
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 14:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C45B93074CF3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 13:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227C9325710;
	Wed, 10 Dec 2025 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pf8SHKf+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay62-hz1.antispameurope.com (mx-relay62-hz1.antispameurope.com [94.100.133.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DEB31B111
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.231
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765374905; cv=pass; b=sfSTqR+ddNMdSq9azvCFnJQlcMCit4tTK6YmMgBI9/+HoRTVbKvwX8wCNltoxS05AdUzDXspCdW9p+RHdDFRiotgdKELqAddoN8Ugwp8+o7QtgSr87lLJ2xYRbio1yWk9XcKJN52Woa0EeZQGbhobmkmvnBlV+9FZ127143Kejw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765374905; c=relaxed/simple;
	bh=Iyl0g4jM4WtlyhgmF3rvPpu1GKN5HCSVIUWHUuvo/B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g88e+FpSMK9L3yi33IrfL2rg7MK2cToBWkKt7VOjuvrc9b++DoazMjzca+TUpuip6Kr2B5/GrvcvxxI8PzX+P6R9jK9E5O3wPr+S3lYm4F7XnNJnneQoZmBX1eOkgfqSGliY9XGx+NjIK0dzam1mCJwSXj6P+I0X+2v1lnIjL8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pf8SHKf+; arc=pass smtp.client-ip=94.100.133.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate62-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=WNtfNT5WfrjglKAVeovDwhEUf8jNL1MZBoPG+eDDW7M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765374857;
 b=Y9Jvz9jNVVCl+rQVLdH4kW+8hc8rREwn4UaL9VSzMVvvjk+uMMic31zuvC+AdeUSwRMm4GV+
 XVag8N7yG+KYNffMt6gXHy2USCfDJvbt8nqFduAcqhQqn9TaFYHA1RFSO3c5Dfg8ANHkQkj9e3E
 iFlFjwGSnlGI+K83bZ8UOp1JoxplxukUFSRHFrGP/8gK5BKmC/h77Kb5+7F/5fIVokh/SNmITA/
 M+JqoVL34ezWG371V6fNT8lm21gGkNevHaTZWh9E+w8PZFU6erZfEUKM54yv4B6HNNpAFxbspYW
 TeXlo6xyjww+jgqxVkQx7ZpfZVJENnLIPPnoBU4durVWw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765374857;
 b=JNfhPMwAoG71AkfGjh5tZXSdR7AOVwmEvKlifBYuQSOdVFMvlr+/+xmxUQjashMVTMgzMFZb
 Z1ERuDP58ev4QdiG053e0M1uh3DiSY8tLn6+/6xcF8kzS25BkfrDOJDVsjrQpxdSB76An6WsaZL
 wX7SCW0zTdLFRSclCUaFK8dSuvvTAFfkMHfYKthh3/IbT8FbCB6SCvcFkkx3v2IAUi0WdXJATuo
 fJGPVU4rtBM5mW5rijQeBWmPZ2bZTJCOBscZjHRl8eMlmQlGMrsZfvXj+aXd7pXUlCWTn1eRHV9
 4I6T4ZrCbx8/tbMctsOlibBjLT7uFNoSzVUakL9qGx/Tw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay62-hz1.antispameurope.com;
 Wed, 10 Dec 2025 14:54:17 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A7EBCCC0CC9;
	Wed, 10 Dec 2025 14:54:09 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v4 2/4] mfd: tqmx86: refactor I2C setup
Date: Wed, 10 Dec 2025 14:52:51 +0100
Message-ID: <10b68f0c46a68d9b946d6cedfacb5a9efb476e37.1765373900.git.matthias.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay62-hz1.antispameurope.com with 4dRHJL0qwnz40bhb
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0af6f318f21841ad19a3cafb7d15f915
X-cloud-security:scantime:2.128
DKIM-Signature: a=rsa-sha256;
 bh=WNtfNT5WfrjglKAVeovDwhEUf8jNL1MZBoPG+eDDW7M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765374856; v=1;
 b=pf8SHKf+rTxvxXmaPj++Tx0tdkvootSgM/PAdJy3PQyYzInY3ZKnHlEmxVzbB3ie5ZZ2/FCt
 gcSb1RB3TGIPvS1Bp4ijunv5q7Acq4KW5M1fXNTxClyuymC4/RhQtgyx23/ZqyjlwsRHbkV1u18
 ecuzCrJBZ9+pfa2m1n/guidJ2i1MVMmMwfpnt0HiwJ6lJm3EjqYdhGNBPSuO4Nx30Ol/F0gPGfg
 iDi01aKC/ODSLu+iDQFxXWFUeL6FC4hl+jgwEfVPpIxswcgK0P+3kfPpBrp1KNdQi4/qnRBz8Oj
 /9A4aucrtOtzuoO6JPIRs2BtZv1taJDWlfOhcUABhwnUw==

Preparation for supporting the second I2C controller, and detecting both
ocores and machxo2 controllers.

- Introduce tqmx86_detect_i2c1()
- Avoid the confusing "soft" I2C controller term - just call it the
  ocores I2C
- Define TQMX86_REG_I2C_DETECT relative to I2C base register

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

v3: no changes

v4:
- Keep resource and mfd_cell definitions at the toplevel
- The very generic tqmx86_detect_i2c() of the previous version is replaced with
  tqmx86_detect_i2c1(), so we don't need to pass so many arguments around

 drivers/mfd/tqmx86.c | 92 +++++++++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 1c2fe3f912389..6d304741f8989 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -18,7 +18,7 @@
 
 #define TQMX86_IOBASE	0x180
 #define TQMX86_IOSIZE	0x20
-#define TQMX86_IOBASE_I2C	0x1a0
+#define TQMX86_IOBASE_I2C1	0x1a0
 #define TQMX86_IOSIZE_I2C	0xa
 #define TQMX86_IOBASE_WATCHDOG	0x18b
 #define TQMX86_IOSIZE_WATCHDOG	0x2
@@ -56,8 +56,8 @@
 #define TQMX86_REG_IO_EXT_INT_GPIO_SHIFT	4
 #define TQMX86_REG_SAUC		0x17
 
-#define TQMX86_REG_I2C_DETECT	0x1a7
-#define TQMX86_REG_I2C_DETECT_SOFT		0xa5
+#define TQMX86_REG_I2C_DETECT	0x7
+#define TQMX86_REG_I2C_DETECT_OCORES	0xa5
 
 static uint gpio_irq;
 module_param(gpio_irq, uint, 0);
@@ -72,8 +72,8 @@ enum tqmx86_i2c1_resource_type {
 	TQMX86_I2C1_IRQ,
 };
 
-static struct resource tqmx_i2c_soft_resources[] = {
-	[TQMX86_I2C1_IO] = DEFINE_RES_IO(TQMX86_IOBASE_I2C, TQMX86_IOSIZE_I2C),
+static struct resource tqmx_i2c1_resources[] = {
+	[TQMX86_I2C1_IO] = DEFINE_RES_IO(TQMX86_IOBASE_I2C1, TQMX86_IOSIZE_I2C),
 	/* Placeholder for IRQ resource */
 	[TQMX86_I2C1_IRQ] = {},
 };
@@ -93,26 +93,24 @@ static struct resource tqmx_gpio_resources[] = {
 	[TQMX86_GPIO_IRQ] = {},
 };
 
-static struct i2c_board_info tqmx86_i2c_devices[] = {
+static const struct i2c_board_info tqmx86_i2c1_devices[] = {
 	{
 		/* 4K EEPROM at 0x50 */
 		I2C_BOARD_INFO("24c32", 0x50),
 	},
 };
 
-static struct ocores_i2c_platform_data ocores_platform_data = {
-	.num_devices = ARRAY_SIZE(tqmx86_i2c_devices),
-	.devices = tqmx86_i2c_devices,
+static struct ocores_i2c_platform_data tqmx86_i2c1_platform_data_ocores = {
+	.num_devices = ARRAY_SIZE(tqmx86_i2c1_devices),
+	.devices = tqmx86_i2c1_devices,
 };
 
-static const struct mfd_cell tqmx86_i2c_soft_dev[] = {
-	{
-		.name = "ocores-i2c",
-		.platform_data = &ocores_platform_data,
-		.pdata_size = sizeof(ocores_platform_data),
-		.resources = tqmx_i2c_soft_resources,
-		.num_resources = ARRAY_SIZE(tqmx_i2c_soft_resources),
-	},
+static const struct mfd_cell tqmx86_i2c1_dev_ocores = {
+	.name = "ocores-i2c",
+	.platform_data = &tqmx86_i2c1_platform_data_ocores,
+	.pdata_size = sizeof(tqmx86_i2c1_platform_data_ocores),
+	.resources = tqmx_i2c1_resources,
+	.num_resources = ARRAY_SIZE(tqmx_i2c1_resources),
 };
 
 static const struct mfd_cell tqmx86_devs[] = {
@@ -246,13 +244,40 @@ static int tqmx86_setup_irq(struct device *dev, const char *label, u8 irq,
 	return 0;
 }
 
+static int tqmx86_detect_i2c1(struct device *dev, void __iomem *io_base, int clock_khz)
+{
+	u8 i2c_det;
+
+	if (i2c1_irq) {
+		if (!tqmx86_setup_irq(dev, "I2C1", i2c1_irq, io_base,
+				      TQMX86_REG_IO_EXT_INT_I2C1_SHIFT))
+			tqmx_i2c1_resources[TQMX86_I2C1_IRQ] = DEFINE_RES_IRQ(i2c1_irq);
+	}
+
+	/*
+	 * The I2C_DETECT register is in the range assigned to the I2C driver
+	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
+	 * access instead of ioport_map + unmap.
+	 */
+	i2c_det = inb(TQMX86_IOBASE_I2C1 + TQMX86_REG_I2C_DETECT);
+
+	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES) {
+		tqmx86_i2c1_platform_data_ocores.clock_khz = clock_khz;
+		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+					    &tqmx86_i2c1_dev_ocores, 1, NULL, 0,
+					    NULL);
+	}
+
+	return 0;
+}
+
 static int tqmx86_probe(struct platform_device *pdev)
 {
-	u8 board_id, sauc, rev, i2c_det;
+	u8 board_id, sauc, rev;
 	struct device *dev = &pdev->dev;
 	const char *board_name;
 	void __iomem *io_base;
-	int err;
+	int err, clock_khz;
 
 	io_base = devm_ioport_map(dev, TQMX86_IOBASE, TQMX86_IOSIZE);
 	if (!io_base)
@@ -267,13 +292,6 @@ static int tqmx86_probe(struct platform_device *pdev)
 		 "Found %s - Board ID %d, PCB Revision %d, PLD Revision %d\n",
 		 board_name, board_id, rev >> 4, rev & 0xf);
 
-	/*
-	 * The I2C_DETECT register is in the range assigned to the I2C driver
-	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
-	 * access instead of ioport_map + unmap.
-	 */
-	i2c_det = inb(TQMX86_REG_I2C_DETECT);
-
 	if (gpio_irq) {
 		err = tqmx86_setup_irq(dev, "GPIO", gpio_irq, io_base,
 				       TQMX86_REG_IO_EXT_INT_GPIO_SHIFT);
@@ -281,23 +299,11 @@ static int tqmx86_probe(struct platform_device *pdev)
 			tqmx_gpio_resources[TQMX86_GPIO_IRQ] = DEFINE_RES_IRQ(gpio_irq);
 	}
 
-	ocores_platform_data.clock_khz = tqmx86_board_id_to_clk_rate(dev, board_id);
-
-	if (i2c_det == TQMX86_REG_I2C_DETECT_SOFT) {
-		if (i2c1_irq) {
-			err = tqmx86_setup_irq(dev, "I2C1", i2c1_irq, io_base,
-					       TQMX86_REG_IO_EXT_INT_I2C1_SHIFT);
-			if (!err)
-				tqmx_i2c_soft_resources[TQMX86_I2C1_IRQ] = DEFINE_RES_IRQ(i2c1_irq);
-		}
-
-		err = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-					   tqmx86_i2c_soft_dev,
-					   ARRAY_SIZE(tqmx86_i2c_soft_dev),
-					   NULL, 0, NULL);
-		if (err)
-			return err;
-	}
+	clock_khz = tqmx86_board_id_to_clk_rate(dev, board_id);
+
+	err = tqmx86_detect_i2c1(dev, io_base, clock_khz);
+	if (err)
+		return err;
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				    tqmx86_devs,
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


