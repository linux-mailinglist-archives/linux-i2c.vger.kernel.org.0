Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 695F231744
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 00:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfEaWiE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 18:38:04 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33176 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfEaWiE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 18:38:04 -0400
Received: by mail-wr1-f66.google.com with SMTP id d9so7488845wrx.0
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 15:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XpL9+CuMZBi/PiTWMj4WheLdJA+o5zN9TKoGXQCpv7A=;
        b=fEc00Nzeoc0J0lUjfVX1AZE3zEU9BbJ89fVuxoSdGcnJY4TP4Rw09JPhZdvCvZME6s
         UjFHl34wdX3BPjD+ypY8qPIX+m2h8DNXCASviwwbT3hyHiLAvZ40q6ZUM6JoTerjfqZz
         IQxsy1A3n6VmlptkXbPRDxBcOkOwDoY5JwcG7uxjMlkXcnz1fcQuIneApX+b62gmrbS8
         HN1tGSSiFm35ddTc0ritVm9+TB45GnburjqGSmzV8qiN423A5RLxHj0uWnWoCmj6U8td
         0uaYB0Y8keAYlbilIgxD9OiPpgFsCzA8mm9fVirx4gb2r4sTcxJ94bM2laaoqex/5P5F
         MMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XpL9+CuMZBi/PiTWMj4WheLdJA+o5zN9TKoGXQCpv7A=;
        b=GgrGgsUsGp6icWcq+gb6aWUCWs5hnKAxCZNGsTLghSfbRtEPlmskXc9fS9ZBhfWl5o
         gDFZmhkD56WQ40ZuIm3eJq0NatA0I4Oir1RYch9UJgLVzGWnhu3OstayDO9Bu9Ooypu8
         ob6bRjQxU6pjHjZJEscwhrBUpTEZsfxo4nEKGw41i8dfxPi5h+1kLPMxfowEKmwMulbO
         +vtcW66fFdmOCSL3AvstBw4Mvb2iAtVeauBqUV/Vb6X4yBhQa5sBqZwBfq4knHmhfhWn
         04PbQxMzi/srHJXncUkxVzyzWfV8LiM/OHERA+vjOwwzOvIP6N+450AFaG14gRmbsijo
         /dPw==
X-Gm-Message-State: APjAAAVmq1JJciFX5x9AuX3OUpASJUTphzIWglOLL8dsEpvCUGzy/mHC
        1cSEltzEQkEMZbPsA9fJxdCTOQ==
X-Google-Smtp-Source: APXvYqzS8z++Gc9llPACviQcGyNABM2ReUHD4ityogHgigddUjqpLZBdKqzw9RK+1aMWrezwxvs+0A==
X-Received: by 2002:adf:9022:: with SMTP id h31mr7591206wrh.46.1559342281979;
        Fri, 31 May 2019 15:38:01 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id w185sm7501956wma.39.2019.05.31.15.38.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 15:38:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH] i2c: iop: Use GPIO descriptors
Date:   Sat,  1 Jun 2019 00:37:56 +0200
Message-Id: <20190531223756.1861-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The IOP3xx has some elaborate code to directly slam the
GPIO lines multiplexed with I2C down low before enablement,
apparently a workaround for a hardware bug found in the
early chips.

After consulting the developer documentation for IOP80321
and IOP80331 I can clearly see that this may be useful for
IOP80321 family (mach-iop32x) but it is highly dubious for
any 80331 series or later chip: in these chips the lines
are not multiplexed for UARTs.

We convert the code to pass optional GPIO descriptors
and register these only on the 80321-based boards where
it makes sense, optionally obtain them in the driver and
use the gpiod_set_raw_value() to ascertain the line gets
driven low when needed.

The GPIO driver does not give the GPIO chip a reasonable
label so the patch also adds that so that these machine
descriptor tables can be used.

Cc: arm@kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC mainatiners: looking for a handshake ACK on this
so Wolfram can merge it into the I2C subsystem.

Dan Williams: I have seen that you were patching IOP3xx code
in 2007, so maybe you remember something about this.
---
 arch/arm/include/asm/hardware/iop3xx.h |  2 ++
 arch/arm/mach-iop32x/em7210.c          |  3 +++
 arch/arm/mach-iop32x/glantank.c        |  3 +++
 arch/arm/mach-iop32x/iq31244.c         |  3 +++
 arch/arm/mach-iop32x/iq80321.c         |  3 +++
 arch/arm/mach-iop32x/n2100.c           |  2 ++
 arch/arm/plat-iop/i2c.c                | 24 +++++++++++++++++++
 drivers/gpio/gpio-iop.c                |  1 +
 drivers/i2c/busses/i2c-iop3xx.c        | 32 +++++++++++++++++---------
 drivers/i2c/busses/i2c-iop3xx.h        |  2 ++
 10 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/arch/arm/include/asm/hardware/iop3xx.h b/arch/arm/include/asm/hardware/iop3xx.h
index 2594a95ff19a..a15d08160e8f 100644
--- a/arch/arm/include/asm/hardware/iop3xx.h
+++ b/arch/arm/include/asm/hardware/iop3xx.h
@@ -305,6 +305,8 @@ extern struct platform_device iop3xx_dma_1_channel;
 extern struct platform_device iop3xx_aau_channel;
 extern struct platform_device iop3xx_i2c0_device;
 extern struct platform_device iop3xx_i2c1_device;
+extern struct gpiod_lookup_table iop3xx_i2c0_gpio_lookup;
+extern struct gpiod_lookup_table iop3xx_i2c1_gpio_lookup;
 
 #endif
 
diff --git a/arch/arm/mach-iop32x/em7210.c b/arch/arm/mach-iop32x/em7210.c
index 77e1ff057303..d2bcbac6b7f2 100644
--- a/arch/arm/mach-iop32x/em7210.c
+++ b/arch/arm/mach-iop32x/em7210.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <mach/hardware.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -211,6 +212,8 @@ static void __init em7210_init_machine(void)
 {
 	register_iop32x_gpio();
 	platform_device_register(&em7210_serial_device);
+	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
+	gpiod_add_lookup_table(&iop3xx_i2c1_gpio_lookup);
 	platform_device_register(&iop3xx_i2c0_device);
 	platform_device_register(&iop3xx_i2c1_device);
 	platform_device_register(&em7210_flash_device);
diff --git a/arch/arm/mach-iop32x/glantank.c b/arch/arm/mach-iop32x/glantank.c
index 547b2342d61a..4c4995007d17 100644
--- a/arch/arm/mach-iop32x/glantank.c
+++ b/arch/arm/mach-iop32x/glantank.c
@@ -25,6 +25,7 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/gpio/machine.h>
 #include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach/arch.h>
@@ -189,6 +190,8 @@ static void glantank_power_off(void)
 static void __init glantank_init_machine(void)
 {
 	register_iop32x_gpio();
+	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
+	gpiod_add_lookup_table(&iop3xx_i2c1_gpio_lookup);
 	platform_device_register(&iop3xx_i2c0_device);
 	platform_device_register(&iop3xx_i2c1_device);
 	platform_device_register(&glantank_flash_device);
diff --git a/arch/arm/mach-iop32x/iq31244.c b/arch/arm/mach-iop32x/iq31244.c
index 0e1392b20d18..56a64ffd3824 100644
--- a/arch/arm/mach-iop32x/iq31244.c
+++ b/arch/arm/mach-iop32x/iq31244.c
@@ -26,6 +26,7 @@
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/gpio/machine.h>
 #include <mach/hardware.h>
 #include <asm/cputype.h>
 #include <asm/irq.h>
@@ -285,6 +286,8 @@ void ep80219_power_off(void)
 static void __init iq31244_init_machine(void)
 {
 	register_iop32x_gpio();
+	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
+	gpiod_add_lookup_table(&iop3xx_i2c1_gpio_lookup);
 	platform_device_register(&iop3xx_i2c0_device);
 	platform_device_register(&iop3xx_i2c1_device);
 	platform_device_register(&iq31244_flash_device);
diff --git a/arch/arm/mach-iop32x/iq80321.c b/arch/arm/mach-iop32x/iq80321.c
index 66782ff1f46a..02abbf9efd54 100644
--- a/arch/arm/mach-iop32x/iq80321.c
+++ b/arch/arm/mach-iop32x/iq80321.c
@@ -23,6 +23,7 @@
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/gpio/machine.h>
 #include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach/arch.h>
@@ -172,6 +173,8 @@ static struct platform_device iq80321_serial_device = {
 static void __init iq80321_init_machine(void)
 {
 	register_iop32x_gpio();
+	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
+	gpiod_add_lookup_table(&iop3xx_i2c1_gpio_lookup);
 	platform_device_register(&iop3xx_i2c0_device);
 	platform_device_register(&iop3xx_i2c1_device);
 	platform_device_register(&iq80321_flash_device);
diff --git a/arch/arm/mach-iop32x/n2100.c b/arch/arm/mach-iop32x/n2100.c
index 23e8c93515d4..c780b6e82ad9 100644
--- a/arch/arm/mach-iop32x/n2100.c
+++ b/arch/arm/mach-iop32x/n2100.c
@@ -31,6 +31,7 @@
 #include <linux/reboot.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach/arch.h>
@@ -345,6 +346,7 @@ device_initcall(n2100_request_gpios);
 static void __init n2100_init_machine(void)
 {
 	register_iop32x_gpio();
+	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
 	platform_device_register(&iop3xx_i2c0_device);
 	platform_device_register(&n2100_flash_device);
 	platform_device_register(&n2100_serial_device);
diff --git a/arch/arm/plat-iop/i2c.c b/arch/arm/plat-iop/i2c.c
index 88215ad031a2..bac20f7f5f8a 100644
--- a/arch/arm/plat-iop/i2c.c
+++ b/arch/arm/plat-iop/i2c.c
@@ -19,6 +19,7 @@
 #include <linux/tty.h>
 #include <linux/serial_core.h>
 #include <linux/io.h>
+#include <linux/gpio/machine.h>
 #include <asm/pgtable.h>
 #include <asm/page.h>
 #include <asm/mach/map.h>
@@ -37,6 +38,29 @@
 #define IRQ_IOP3XX_I2C_1	IRQ_IOP33X_I2C_1
 #endif
 
+/*
+ * Each of the I2C busses have corresponding GPIO lines, and the driver
+ * need to access these directly to drive the bus low at times.
+ */
+
+struct gpiod_lookup_table iop3xx_i2c0_gpio_lookup = {
+	.dev_id = "IOP3xx-I2C.0",
+	.table = {
+		GPIO_LOOKUP("gpio-iop", 7, "scl", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-iop", 6, "sda", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+struct gpiod_lookup_table iop3xx_i2c1_gpio_lookup = {
+	.dev_id = "IOP3xx-I2C.1",
+	.table = {
+		GPIO_LOOKUP("gpio-iop", 5, "scl", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-iop", 4, "sda", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static struct resource iop3xx_i2c0_resources[] = {
 	[0] = {
 		.start	= 0xfffff680,
diff --git a/drivers/gpio/gpio-iop.c b/drivers/gpio/gpio-iop.c
index 11b77d868c89..e9546d6c7451 100644
--- a/drivers/gpio/gpio-iop.c
+++ b/drivers/gpio/gpio-iop.c
@@ -40,6 +40,7 @@ static int iop3xx_gpio_probe(struct platform_device *pdev)
 
 	gc->base = 0;
 	gc->owner = THIS_MODULE;
+	gc->label = "gpio-iop";
 
 	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
 }
diff --git a/drivers/i2c/busses/i2c-iop3xx.c b/drivers/i2c/busses/i2c-iop3xx.c
index a34cb3848280..eafc1a4d8656 100644
--- a/drivers/i2c/busses/i2c-iop3xx.c
+++ b/drivers/i2c/busses/i2c-iop3xx.c
@@ -38,7 +38,7 @@
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include "i2c-iop3xx.h"
 
@@ -71,17 +71,16 @@ iop3xx_i2c_enable(struct i2c_algo_iop3xx_data *iop3xx_adap)
 
 	/*
 	 * Every time unit enable is asserted, GPOD needs to be cleared
-	 * on IOP3XX to avoid data corruption on the bus.
+	 * on IOP3XX to avoid data corruption on the bus. We use the
+	 * gpiod_set_raw_value() to make sure the 0 hits the hardware
+	 * GPOD register. These descriptors are only passed along to
+	 * the device if this is necessary.
 	 */
-#if defined(CONFIG_ARCH_IOP32X) || defined(CONFIG_ARCH_IOP33X)
-	if (iop3xx_adap->id == 0) {
-		gpio_set_value(7, 0);
-		gpio_set_value(6, 0);
-	} else {
-		gpio_set_value(5, 0);
-		gpio_set_value(4, 0);
-	}
-#endif
+	if (iop3xx_adap->gpio_scl)
+		gpiod_set_raw_value(iop3xx_adap->gpio_scl, 0);
+	if (iop3xx_adap->gpio_sda)
+		gpiod_set_raw_value(iop3xx_adap->gpio_sda, 0);
+
 	/* NB SR bits not same position as CR IE bits :-( */
 	iop3xx_adap->SR_enabled =
 		IOP3XX_ISR_ALD | IOP3XX_ISR_BERRD |
@@ -434,6 +433,17 @@ iop3xx_i2c_probe(struct platform_device *pdev)
 		goto free_adapter;
 	}
 
+	adapter_data->gpio_scl = devm_gpiod_get_optional(&pdev->dev,
+							 "scl",
+							 GPIOD_ASIS);
+	if (IS_ERR(adapter_data->gpio_scl))
+		return PTR_ERR(adapter_data->gpio_scl);
+	adapter_data->gpio_sda = devm_gpiod_get_optional(&pdev->dev,
+							 "sda",
+							 GPIOD_ASIS);
+	if (IS_ERR(adapter_data->gpio_sda))
+		return PTR_ERR(adapter_data->gpio_sda);
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		ret = -ENODEV;
diff --git a/drivers/i2c/busses/i2c-iop3xx.h b/drivers/i2c/busses/i2c-iop3xx.h
index 2d6929c2bd92..231897838386 100644
--- a/drivers/i2c/busses/i2c-iop3xx.h
+++ b/drivers/i2c/busses/i2c-iop3xx.h
@@ -98,6 +98,8 @@ struct i2c_algo_iop3xx_data {
 	spinlock_t lock;
 	u32 SR_enabled, SR_received;
 	int id;
+	struct gpio_desc *gpio_scl;
+	struct gpio_desc *gpio_sda;
 };
 
 #endif /* I2C_IOP3XX_H */
-- 
2.20.1

