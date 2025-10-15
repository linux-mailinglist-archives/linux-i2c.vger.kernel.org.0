Return-Path: <linux-i2c+bounces-13540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9B5BDE2F9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 13:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C7DC5044B0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 11:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EB331D381;
	Wed, 15 Oct 2025 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WSc/NS6k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BE831BCB0
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760526308; cv=pass; b=VPCb6R2DjNBTTr1UNEwfo8kBzoCzzxFP3WsYAjKt9XMDf0QkbclV3/xtQyy0refWMHame6ncdDED9ElgbjKp/34hqtbwa5x2/iJZurdLddXvQQ+nG9LdFQ9BeYwlAULxFQbbs7UPAx8/BkyKYXQeHVBM9pjrZFqfECrwKpIk6oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760526308; c=relaxed/simple;
	bh=Rr6CvkVEpa5r8mBiM/MbjIwWBnUXDrFRVMxxo+Gk2gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAufbl9n9TzSQL0+UoVySGCfJOynJKVnQ5hApOp6/mwQeRYliikgi8c35/89EvOy9NgHIh4Z1dMAH6mM02CjXYj90MefiwGIWSZqQ9CyKkxxIaqWVxlHkEDs8GMs073vk64kJE7n+RZpkGZTP6UQJvgFbpi9pAkUVuYomR1QRT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WSc/NS6k; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=aMDKz+P0CujfNYKJgBQXFi7Huoj9iA1kXP+7/tYrdhc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760526251;
 b=TvGrvbZdEO4REYQ4ptQ42BTH+mpckbzWSJENoUDiZVs0mJ+chd+gCnJc6Qsllhd0ypc2xB5e
 2o0eBPPDKFsPxeP2zL3dPO9xMZV2L6LSJwwFisdBmlC0xMMw/lLORVp0/dLvKlLrEizyZ6S1LFT
 OQ6X10CPqJc+uQoF/jN/xQ+qkJEX67yjqUZD9HqtM1fG91jtJABBGPUksYb+81s8yepgc9BCt2r
 m4hAcWHP5b33MGCbJHZogWJaxV3xnMyyOOZaNAdN0adW7LdxIpKp+SvRt1gVI80rNblLXtrWizi
 LIO/AjbTz17ROwIRsPAnYMRozpW/BoOgR4JZOSLv0IUiw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760526251;
 b=GuCd5FKC/UnetOnSci/1Uv/6m2EKKWZH76H5Yvtl7ZZm7k4bEwzyea6eY6CEwmzXxsq+tPnI
 uagh+DF2+ALzyFajvosBfpiVUmaDoP7I/9abSGUY0LA7pJmcGlzquZiTJ+TI7XE+wLE6MnCfGmi
 +RFCalvIlzJ7hNaQBHbLYVTB1qphRLWnGA7y4OwgIrZKqlZ0DBgOUgj/jmcrxklH4VlzYUnVbHQ
 F+Ht0IvjcqUQzoC+rqRXwGJss1RaSIw0/q9zKr/J2EMWCP7vCuwp0Xglhd/2ibIy+8zMtsBC7ga
 wBkwsLtHDdTmPPTYBZ2MtpNyrgu8L9wPE//5MSucgjfPg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Wed, 15 Oct 2025 13:04:11 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AF61CCC0E55;
	Wed, 15 Oct 2025 13:04:03 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 2/4] mfd: tqmx86: refactor I2C setup
Date: Wed, 15 Oct 2025 13:03:07 +0200
Message-ID: <5723459873610c09c381b1d8755acf989252413e.1760525985.git.matthias.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4cmp9w0hYCzWfcH
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:5318cefe37b5e31a4e488e64b42044b3
X-cloud-security:scantime:1.841
DKIM-Signature: a=rsa-sha256;
 bh=aMDKz+P0CujfNYKJgBQXFi7Huoj9iA1kXP+7/tYrdhc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760526250; v=1;
 b=WSc/NS6kQg/2UICv3T/0oGwbNd+LJrvX4yeqn94YdYdx+SL2ryraHPw/USQeCl6LO5ustsTs
 tyQz8i4T+9kSatqW8VCRk//qrokpwccFflcpUPXZgHhx+q0jQH9LQM5PXWOkbKJ1+HcWeSYpamz
 MYP/DnpOB2ziaTyjr3UpMZ5SdbMUqCxzaAwhXl6DlADPX8CecU1S0WfT62yUiC7U4PYnBcXYonw
 BlsqS9MMsbrAwdwNRlWgAv+6dCKup4xXwiyu73HKAQWtVbl/kwPXEuwpC1kreCYJWB17CrFCZ59
 wJywd4KnBS9b1Ta5elNpKlQ4NbUzTge158LmpJPYTZg5A==

Preparation for supporting the second I2C controller, and detecting both
ocores and machxo2 controllers.

- Avoid the confusing "soft" I2C controller term - just call it the
  ocores I2C
- All non-const parts of the MFD cell are moved from global variables
  into new functions tqmx86_setup_i2c_ocores() and tqmx86_setup_i2c()
- Define TQMX86_REG_I2C_DETECT relative to I2C base register

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/mfd/tqmx86.c | 130 ++++++++++++++++++++++++-------------------
 1 file changed, 74 insertions(+), 56 deletions(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 1cba3b67b0fb9..3c6f158bf1a45 100644
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
@@ -54,8 +54,8 @@
 #define TQMX86_REG_IO_EXT_INT_GPIO_SHIFT	4
 #define TQMX86_REG_SAUC		0x17
 
-#define TQMX86_REG_I2C_DETECT	0x1a7
-#define TQMX86_REG_I2C_DETECT_SOFT		0xa5
+#define TQMX86_REG_I2C_DETECT	0x7
+#define TQMX86_REG_I2C_DETECT_OCORES	0xa5
 
 static uint gpio_irq;
 module_param(gpio_irq, uint, 0);
@@ -65,17 +65,6 @@ static uint i2c1_irq;
 module_param(i2c1_irq, uint, 0);
 MODULE_PARM_DESC(i2c1_irq, "I2C1 IRQ number (valid parameters: 7, 9, 12)");
 
-enum tqmx86_i2c1_resource_type {
-	TQMX86_I2C1_IO,
-	TQMX86_I2C1_IRQ,
-};
-
-static struct resource tqmx_i2c_soft_resources[] = {
-	[TQMX86_I2C1_IO] = DEFINE_RES_IO(TQMX86_IOBASE_I2C, TQMX86_IOSIZE_I2C),
-	/* Placeholder for IRQ resource */
-	[TQMX86_I2C1_IRQ] = {},
-};
-
 static const struct resource tqmx_watchdog_resources[] = {
 	DEFINE_RES_IO(TQMX86_IOBASE_WATCHDOG, TQMX86_IOSIZE_WATCHDOG),
 };
@@ -91,28 +80,13 @@ static struct resource tqmx_gpio_resources[] = {
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
-};
-
-static const struct mfd_cell tqmx86_i2c_soft_dev[] = {
-	{
-		.name = "ocores-i2c",
-		.platform_data = &ocores_platform_data,
-		.pdata_size = sizeof(ocores_platform_data),
-		.resources = tqmx_i2c_soft_resources,
-		.num_resources = ARRAY_SIZE(tqmx_i2c_soft_resources),
-	},
-};
-
 static const struct mfd_cell tqmx86_devs[] = {
 	{
 		.name = "tqmx86-wdt",
@@ -238,13 +212,74 @@ static int tqmx86_setup_irq(struct device *dev, const char *label, u8 irq,
 	return 0;
 }
 
+static int tqmx86_setup_i2c(struct device *dev, const char *name,
+			    unsigned long i2c_base, const void *platform_data,
+			    size_t pdata_size, u8 irq)
+{
+	const struct resource resources[] = {
+		DEFINE_RES_IO(i2c_base, TQMX86_IOSIZE_I2C),
+		irq ? DEFINE_RES_IRQ(irq) : (struct resource) {},
+	};
+	const struct mfd_cell i2c_dev = {
+		.name = name,
+		.platform_data = platform_data,
+		.pdata_size = pdata_size,
+		.resources = resources,
+		.num_resources = ARRAY_SIZE(resources),
+	};
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, &i2c_dev, 1,
+				    NULL, 0, NULL);
+
+}
+
+static int tqmx86_setup_i2c_ocores(struct device *dev, const char *label,
+				   unsigned long i2c_base, int clock_khz, u8 irq,
+				   const struct i2c_board_info *devices,
+				   size_t num_devices)
+{
+	const struct ocores_i2c_platform_data platform_data = {
+		.clock_khz = clock_khz,
+		.num_devices = num_devices,
+		.devices = devices,
+	};
+
+	return tqmx86_setup_i2c(dev, "ocores-i2c", i2c_base, &platform_data,
+				sizeof(platform_data), irq);
+}
+
+static int tqmx86_detect_i2c(struct device *dev, const char *label,
+			     unsigned long i2c_base, int clock_khz, u8 irq,
+			     const struct i2c_board_info *devices,
+			     size_t num_devices, void __iomem *io_base,
+			     u8 irq_reg_shift)
+{
+	u8 i2c_det;
+
+	if (tqmx86_setup_irq(dev, label, irq, io_base, irq_reg_shift))
+		irq = 0;
+
+	/*
+	 * The I2C_DETECT register is in the range assigned to the I2C driver
+	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
+	 * access instead of ioport_map + unmap.
+	 */
+	i2c_det = inb(i2c_base + TQMX86_REG_I2C_DETECT);
+
+	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES)
+		return tqmx86_setup_i2c_ocores(dev, label, i2c_base, clock_khz,
+					       irq, devices, num_devices);
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
@@ -259,13 +294,6 @@ static int tqmx86_probe(struct platform_device *pdev)
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
@@ -273,23 +301,13 @@ static int tqmx86_probe(struct platform_device *pdev)
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
+	err = tqmx86_detect_i2c(dev, "I2C1", TQMX86_IOBASE_I2C1, clock_khz, i2c1_irq,
+				tqmx86_i2c1_devices, ARRAY_SIZE(tqmx86_i2c1_devices),
+				io_base, TQMX86_REG_IO_EXT_INT_I2C1_SHIFT);
+	if (err)
+		return err;
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				    tqmx86_devs,
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


