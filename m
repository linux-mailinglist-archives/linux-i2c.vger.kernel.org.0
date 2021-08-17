Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204F13EE708
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 09:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbhHQHMG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 03:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbhHQHMG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Aug 2021 03:12:06 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D332C061764;
        Tue, 17 Aug 2021 00:11:33 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id j12-20020a05600c1c0c00b002e6d80c902dso1454532wms.4;
        Tue, 17 Aug 2021 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpAYEtBYP24QK9Fy/Ow+uf4hp5yoI/DRZsKp8Rcdp7Y=;
        b=mYSjMg2PU4AvB0yGdJt1/zwJXCptrWHqMCtb89bPHvtkljWiR7m82jnJ19r1vAOb/R
         QlBL6o8pjuihTM6Lk9h6mZ60u6Z29PEp+aiee9TiaPm+p+5LEf9CmtqtoDWu2NkVYMlr
         qgYtDpKenXWij2IjdZutd89B4JoAemx4AvvN/rmRVkSrVqHxGyAeTd8iEVtVUg8a/nw2
         2xDxto/x6d9G1DrZSDwlYccST3u1ZoVjXmeCTpNw9P4O/a8mzOn5uoHL5mB9feeNXjTe
         RQeOZ9F9H1GA5p5m9jdXbnrsaSAM/H8oKqkyfL0PNGB8TAlC/4VgQocICdriDFdJHURf
         2TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpAYEtBYP24QK9Fy/Ow+uf4hp5yoI/DRZsKp8Rcdp7Y=;
        b=hlU/VPZXdLY53/7AH5vrVc8oUam/uV7O4yT/rZCP4w9LnApJ6Yrt2zrot3YiI3kX7/
         Wpob+VM/oqaIkZH0N5+5gLQ1xoFrut/dQ1nGC66YyBJW7UXcli0COuL6aIGvkknosruz
         tBdHqQPRFxlNJJGeUGssb5jgKzHVsDBU5Lg+Gt1WJghXl0yPNkW+cHnfO6XIZh0m76g6
         t/Nd98SWcje7ntXkxHHKXx1eZWvRzTdTvuUGGJSGwSmUEtsat8Ka9/dNStl5ApbHztlE
         +iLQmpuKEd/wBzt09Vq4BJij9tvc7yy1wjJuUBK4gqQEmmF1S6dkof4DcWAYh1Hx0Qwt
         Tjng==
X-Gm-Message-State: AOAM531bZfcn1Gm4/c253jcrWvnfzoxAOR74Fkrx432RL6d4+1Q04LS7
        5G01Uqbkn3eVlF0Ao5FcIR3syTeQdls=
X-Google-Smtp-Source: ABdhPJw7VX8B1g7kdMNTWBwWSnupImXzrVt49lJGyX5rRQCP3jJLJ7eKh/FhLAI1ILnQ0VZAyMHfig==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id o19mr1829157wmq.34.1629184291406;
        Tue, 17 Aug 2021 00:11:31 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id d4sm1340458wrc.34.2021.08.17.00.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 00:11:30 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] i2c: remove dead PMC MSP TWI/SMBus/I2C driver
Date:   Tue, 17 Aug 2021 09:11:26 +0200
Message-Id: <20210817071126.8096-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit 1b00767fd8e1 ("MIPS: Remove PMC MSP71xx platform") removes the
config PMC_MSP in ./arch/mips/Kconfig.

Hence, since then, the corresponding PMC MSP TWI/SMBus/I2C driver is
dead code. Remove this dead driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Wolfram, please pick this minor non-urgent clean-up patch.

 drivers/i2c/busses/Kconfig      |   9 -
 drivers/i2c/busses/Makefile     |   1 -
 drivers/i2c/busses/i2c-pmcmsp.c | 600 --------------------------------
 3 files changed, 610 deletions(-)
 delete mode 100644 drivers/i2c/busses/i2c-pmcmsp.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 10acece9d7b9..23b2eca45bce 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -866,15 +866,6 @@ config I2C_PCA_PLATFORM
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-pca-platform.
 
-config I2C_PMCMSP
-	tristate "PMC MSP I2C TWI Controller"
-	depends on PMC_MSP || COMPILE_TEST
-	help
-	  This driver supports the PMC TWI controller on MSP devices.
-
-	  This driver can also be built as module. If so, the module
-	  will be called i2c-pmcmsp.
-
 config I2C_PNX
 	tristate "I2C bus support for Philips PNX and NXP LPC targets"
 	depends on ARCH_LPC32XX || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 69e9963615f6..afdb84902dd2 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -86,7 +86,6 @@ obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
 obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi.o
 obj-$(CONFIG_I2C_PCA_PLATFORM)	+= i2c-pca-platform.o
-obj-$(CONFIG_I2C_PMCMSP)	+= i2c-pmcmsp.o
 obj-$(CONFIG_I2C_PNX)		+= i2c-pnx.o
 obj-$(CONFIG_I2C_PXA)		+= i2c-pxa.o
 obj-$(CONFIG_I2C_PXA_PCI)	+= i2c-pxa-pci.o
diff --git a/drivers/i2c/busses/i2c-pmcmsp.c b/drivers/i2c/busses/i2c-pmcmsp.c
deleted file mode 100644
index 5d89c7c1b3a8..000000000000
--- a/drivers/i2c/busses/i2c-pmcmsp.c
+++ /dev/null
@@ -1,600 +0,0 @@
-/*
- * Specific bus support for PMC-TWI compliant implementation on MSP71xx.
- *
- * Copyright 2005-2007 PMC-Sierra, Inc.
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- *  THIS  SOFTWARE  IS PROVIDED   ``AS  IS'' AND   ANY  EXPRESS OR IMPLIED
- *  WARRANTIES,   INCLUDING, BUT NOT  LIMITED  TO, THE IMPLIED WARRANTIES OF
- *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN
- *  NO  EVENT  SHALL   THE AUTHOR  BE    LIABLE FOR ANY   DIRECT, INDIRECT,
- *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *  NOT LIMITED   TO, PROCUREMENT OF  SUBSTITUTE GOODS  OR SERVICES; LOSS OF
- *  USE, DATA,  OR PROFITS; OR  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
- *  ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT
- *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
- *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/i2c.h>
-#include <linux/interrupt.h>
-#include <linux/completion.h>
-#include <linux/mutex.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-
-#define DRV_NAME	"pmcmsptwi"
-
-#define MSP_TWI_SF_CLK_REG_OFFSET	0x00
-#define MSP_TWI_HS_CLK_REG_OFFSET	0x04
-#define MSP_TWI_CFG_REG_OFFSET		0x08
-#define MSP_TWI_CMD_REG_OFFSET		0x0c
-#define MSP_TWI_ADD_REG_OFFSET		0x10
-#define MSP_TWI_DAT_0_REG_OFFSET	0x14
-#define MSP_TWI_DAT_1_REG_OFFSET	0x18
-#define MSP_TWI_INT_STS_REG_OFFSET	0x1c
-#define MSP_TWI_INT_MSK_REG_OFFSET	0x20
-#define MSP_TWI_BUSY_REG_OFFSET		0x24
-
-#define MSP_TWI_INT_STS_DONE			(1 << 0)
-#define MSP_TWI_INT_STS_LOST_ARBITRATION	(1 << 1)
-#define MSP_TWI_INT_STS_NO_RESPONSE		(1 << 2)
-#define MSP_TWI_INT_STS_DATA_COLLISION		(1 << 3)
-#define MSP_TWI_INT_STS_BUSY			(1 << 4)
-#define MSP_TWI_INT_STS_ALL			0x1f
-
-#define MSP_MAX_BYTES_PER_RW		8
-#define MSP_MAX_POLL			5
-#define MSP_POLL_DELAY			10
-#define MSP_IRQ_TIMEOUT			(MSP_MAX_POLL * MSP_POLL_DELAY)
-
-/* IO Operation macros */
-#define pmcmsptwi_readl		__raw_readl
-#define pmcmsptwi_writel	__raw_writel
-
-/* TWI command type */
-enum pmcmsptwi_cmd_type {
-	MSP_TWI_CMD_WRITE	= 0,	/* Write only */
-	MSP_TWI_CMD_READ	= 1,	/* Read only */
-	MSP_TWI_CMD_WRITE_READ	= 2,	/* Write then Read */
-};
-
-/* The possible results of the xferCmd */
-enum pmcmsptwi_xfer_result {
-	MSP_TWI_XFER_OK	= 0,
-	MSP_TWI_XFER_TIMEOUT,
-	MSP_TWI_XFER_BUSY,
-	MSP_TWI_XFER_DATA_COLLISION,
-	MSP_TWI_XFER_NO_RESPONSE,
-	MSP_TWI_XFER_LOST_ARBITRATION,
-};
-
-/* Corresponds to a PMCTWI clock configuration register */
-struct pmcmsptwi_clock {
-	u8 filter;	/* Bits 15:12,	default = 0x03 */
-	u16 clock;	/* Bits 9:0,	default = 0x001f */
-};
-
-struct pmcmsptwi_clockcfg {
-	struct pmcmsptwi_clock standard;  /* The standard/fast clock config */
-	struct pmcmsptwi_clock highspeed; /* The highspeed clock config */
-};
-
-/* Corresponds to the main TWI configuration register */
-struct pmcmsptwi_cfg {
-	u8 arbf;	/* Bits 15:12,	default=0x03 */
-	u8 nak;		/* Bits 11:8,	default=0x03 */
-	u8 add10;	/* Bit 7,	default=0x00 */
-	u8 mst_code;	/* Bits 6:4,	default=0x00 */
-	u8 arb;		/* Bit 1,	default=0x01 */
-	u8 highspeed;	/* Bit 0,	default=0x00 */
-};
-
-/* A single pmctwi command to issue */
-struct pmcmsptwi_cmd {
-	u16 addr;	/* The slave address (7 or 10 bits) */
-	enum pmcmsptwi_cmd_type type;	/* The command type */
-	u8 write_len;	/* Number of bytes in the write buffer */
-	u8 read_len;	/* Number of bytes in the read buffer */
-	u8 *write_data;	/* Buffer of characters to send */
-	u8 *read_data;	/* Buffer to fill with incoming data */
-};
-
-/* The private data */
-struct pmcmsptwi_data {
-	void __iomem *iobase;			/* iomapped base for IO */
-	int irq;				/* IRQ to use (0 disables) */
-	struct completion wait;			/* Completion for xfer */
-	struct mutex lock;			/* Used for threadsafeness */
-	enum pmcmsptwi_xfer_result last_result;	/* result of last xfer */
-};
-
-/* The default settings */
-static const struct pmcmsptwi_clockcfg pmcmsptwi_defclockcfg = {
-	.standard = {
-		.filter	= 0x3,
-		.clock	= 0x1f,
-	},
-	.highspeed = {
-		.filter	= 0x3,
-		.clock	= 0x1f,
-	},
-};
-
-static const struct pmcmsptwi_cfg pmcmsptwi_defcfg = {
-	.arbf		= 0x03,
-	.nak		= 0x03,
-	.add10		= 0x00,
-	.mst_code	= 0x00,
-	.arb		= 0x01,
-	.highspeed	= 0x00,
-};
-
-static struct pmcmsptwi_data pmcmsptwi_data;
-
-static struct i2c_adapter pmcmsptwi_adapter;
-
-/* inline helper functions */
-static inline u32 pmcmsptwi_clock_to_reg(
-			const struct pmcmsptwi_clock *clock)
-{
-	return ((clock->filter & 0xf) << 12) | (clock->clock & 0x03ff);
-}
-
-static inline u32 pmcmsptwi_cfg_to_reg(const struct pmcmsptwi_cfg *cfg)
-{
-	return ((cfg->arbf & 0xf) << 12) |
-		((cfg->nak & 0xf) << 8) |
-		((cfg->add10 & 0x1) << 7) |
-		((cfg->mst_code & 0x7) << 4) |
-		((cfg->arb & 0x1) << 1) |
-		(cfg->highspeed & 0x1);
-}
-
-static inline void pmcmsptwi_reg_to_cfg(u32 reg, struct pmcmsptwi_cfg *cfg)
-{
-	cfg->arbf = (reg >> 12) & 0xf;
-	cfg->nak = (reg >> 8) & 0xf;
-	cfg->add10 = (reg >> 7) & 0x1;
-	cfg->mst_code = (reg >> 4) & 0x7;
-	cfg->arb = (reg >> 1) & 0x1;
-	cfg->highspeed = reg & 0x1;
-}
-
-/*
- * Sets the current clock configuration
- */
-static void pmcmsptwi_set_clock_config(const struct pmcmsptwi_clockcfg *cfg,
-					struct pmcmsptwi_data *data)
-{
-	mutex_lock(&data->lock);
-	pmcmsptwi_writel(pmcmsptwi_clock_to_reg(&cfg->standard),
-				data->iobase + MSP_TWI_SF_CLK_REG_OFFSET);
-	pmcmsptwi_writel(pmcmsptwi_clock_to_reg(&cfg->highspeed),
-				data->iobase + MSP_TWI_HS_CLK_REG_OFFSET);
-	mutex_unlock(&data->lock);
-}
-
-/*
- * Gets the current TWI bus configuration
- */
-static void pmcmsptwi_get_twi_config(struct pmcmsptwi_cfg *cfg,
-					struct pmcmsptwi_data *data)
-{
-	mutex_lock(&data->lock);
-	pmcmsptwi_reg_to_cfg(pmcmsptwi_readl(
-				data->iobase + MSP_TWI_CFG_REG_OFFSET), cfg);
-	mutex_unlock(&data->lock);
-}
-
-/*
- * Sets the current TWI bus configuration
- */
-static void pmcmsptwi_set_twi_config(const struct pmcmsptwi_cfg *cfg,
-					struct pmcmsptwi_data *data)
-{
-	mutex_lock(&data->lock);
-	pmcmsptwi_writel(pmcmsptwi_cfg_to_reg(cfg),
-				data->iobase + MSP_TWI_CFG_REG_OFFSET);
-	mutex_unlock(&data->lock);
-}
-
-/*
- * Parses the 'int_sts' register and returns a well-defined error code
- */
-static enum pmcmsptwi_xfer_result pmcmsptwi_get_result(u32 reg)
-{
-	if (reg & MSP_TWI_INT_STS_LOST_ARBITRATION) {
-		dev_dbg(&pmcmsptwi_adapter.dev,
-			"Result: Lost arbitration\n");
-		return MSP_TWI_XFER_LOST_ARBITRATION;
-	} else if (reg & MSP_TWI_INT_STS_NO_RESPONSE) {
-		dev_dbg(&pmcmsptwi_adapter.dev,
-			"Result: No response\n");
-		return MSP_TWI_XFER_NO_RESPONSE;
-	} else if (reg & MSP_TWI_INT_STS_DATA_COLLISION) {
-		dev_dbg(&pmcmsptwi_adapter.dev,
-			"Result: Data collision\n");
-		return MSP_TWI_XFER_DATA_COLLISION;
-	} else if (reg & MSP_TWI_INT_STS_BUSY) {
-		dev_dbg(&pmcmsptwi_adapter.dev,
-			"Result: Bus busy\n");
-		return MSP_TWI_XFER_BUSY;
-	}
-
-	dev_dbg(&pmcmsptwi_adapter.dev, "Result: Operation succeeded\n");
-	return MSP_TWI_XFER_OK;
-}
-
-/*
- * In interrupt mode, handle the interrupt.
- * NOTE: Assumes data->lock is held.
- */
-static irqreturn_t pmcmsptwi_interrupt(int irq, void *ptr)
-{
-	struct pmcmsptwi_data *data = ptr;
-
-	u32 reason = pmcmsptwi_readl(data->iobase +
-					MSP_TWI_INT_STS_REG_OFFSET);
-	pmcmsptwi_writel(reason, data->iobase + MSP_TWI_INT_STS_REG_OFFSET);
-
-	dev_dbg(&pmcmsptwi_adapter.dev, "Got interrupt 0x%08x\n", reason);
-	if (!(reason & MSP_TWI_INT_STS_DONE))
-		return IRQ_NONE;
-
-	data->last_result = pmcmsptwi_get_result(reason);
-	complete(&data->wait);
-
-	return IRQ_HANDLED;
-}
-
-/*
- * Probe for and register the device and return 0 if there is one.
- */
-static int pmcmsptwi_probe(struct platform_device *pldev)
-{
-	struct resource *res;
-	int rc = -ENODEV;
-
-	/* get the static platform resources */
-	res = platform_get_resource(pldev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pldev->dev, "IOMEM resource not found\n");
-		goto ret_err;
-	}
-
-	/* reserve the memory region */
-	if (!request_mem_region(res->start, resource_size(res),
-				pldev->name)) {
-		dev_err(&pldev->dev,
-			"Unable to get memory/io address region %pap\n",
-			&res->start);
-		rc = -EBUSY;
-		goto ret_err;
-	}
-
-	/* remap the memory */
-	pmcmsptwi_data.iobase = ioremap(res->start,
-						resource_size(res));
-	if (!pmcmsptwi_data.iobase) {
-		dev_err(&pldev->dev,
-			"Unable to ioremap address %pap\n", &res->start);
-		rc = -EIO;
-		goto ret_unreserve;
-	}
-
-	/* request the irq */
-	pmcmsptwi_data.irq = platform_get_irq(pldev, 0);
-	if (pmcmsptwi_data.irq) {
-		rc = request_irq(pmcmsptwi_data.irq, &pmcmsptwi_interrupt,
-				 IRQF_SHARED, pldev->name, &pmcmsptwi_data);
-		if (rc == 0) {
-			/*
-			 * Enable 'DONE' interrupt only.
-			 *
-			 * If you enable all interrupts, you will get one on
-			 * error and another when the operation completes.
-			 * This way you only have to handle one interrupt,
-			 * but you can still check all result flags.
-			 */
-			pmcmsptwi_writel(MSP_TWI_INT_STS_DONE,
-					pmcmsptwi_data.iobase +
-					MSP_TWI_INT_MSK_REG_OFFSET);
-		} else {
-			dev_warn(&pldev->dev,
-				"Could not assign TWI IRQ handler "
-				"to irq %d (continuing with poll)\n",
-				pmcmsptwi_data.irq);
-			pmcmsptwi_data.irq = 0;
-		}
-	}
-
-	init_completion(&pmcmsptwi_data.wait);
-	mutex_init(&pmcmsptwi_data.lock);
-
-	pmcmsptwi_set_clock_config(&pmcmsptwi_defclockcfg, &pmcmsptwi_data);
-	pmcmsptwi_set_twi_config(&pmcmsptwi_defcfg, &pmcmsptwi_data);
-
-	printk(KERN_INFO DRV_NAME ": Registering MSP71xx I2C adapter\n");
-
-	pmcmsptwi_adapter.dev.parent = &pldev->dev;
-	platform_set_drvdata(pldev, &pmcmsptwi_adapter);
-	i2c_set_adapdata(&pmcmsptwi_adapter, &pmcmsptwi_data);
-
-	rc = i2c_add_adapter(&pmcmsptwi_adapter);
-	if (rc)
-		goto ret_unmap;
-
-	return 0;
-
-ret_unmap:
-	if (pmcmsptwi_data.irq) {
-		pmcmsptwi_writel(0,
-			pmcmsptwi_data.iobase + MSP_TWI_INT_MSK_REG_OFFSET);
-		free_irq(pmcmsptwi_data.irq, &pmcmsptwi_data);
-	}
-
-	iounmap(pmcmsptwi_data.iobase);
-
-ret_unreserve:
-	release_mem_region(res->start, resource_size(res));
-
-ret_err:
-	return rc;
-}
-
-/*
- * Release the device and return 0 if there is one.
- */
-static int pmcmsptwi_remove(struct platform_device *pldev)
-{
-	struct resource *res;
-
-	i2c_del_adapter(&pmcmsptwi_adapter);
-
-	if (pmcmsptwi_data.irq) {
-		pmcmsptwi_writel(0,
-			pmcmsptwi_data.iobase + MSP_TWI_INT_MSK_REG_OFFSET);
-		free_irq(pmcmsptwi_data.irq, &pmcmsptwi_data);
-	}
-
-	iounmap(pmcmsptwi_data.iobase);
-
-	res = platform_get_resource(pldev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, resource_size(res));
-
-	return 0;
-}
-
-/*
- * Polls the 'busy' register until the command is complete.
- * NOTE: Assumes data->lock is held.
- */
-static void pmcmsptwi_poll_complete(struct pmcmsptwi_data *data)
-{
-	int i;
-
-	for (i = 0; i < MSP_MAX_POLL; i++) {
-		u32 val = pmcmsptwi_readl(data->iobase +
-						MSP_TWI_BUSY_REG_OFFSET);
-		if (val == 0) {
-			u32 reason = pmcmsptwi_readl(data->iobase +
-						MSP_TWI_INT_STS_REG_OFFSET);
-			pmcmsptwi_writel(reason, data->iobase +
-						MSP_TWI_INT_STS_REG_OFFSET);
-			data->last_result = pmcmsptwi_get_result(reason);
-			return;
-		}
-		udelay(MSP_POLL_DELAY);
-	}
-
-	dev_dbg(&pmcmsptwi_adapter.dev, "Result: Poll timeout\n");
-	data->last_result = MSP_TWI_XFER_TIMEOUT;
-}
-
-/*
- * Do the transfer (low level):
- *   May use interrupt-driven or polling, depending on if an IRQ is
- *   presently registered.
- * NOTE: Assumes data->lock is held.
- */
-static enum pmcmsptwi_xfer_result pmcmsptwi_do_xfer(
-			u32 reg, struct pmcmsptwi_data *data)
-{
-	dev_dbg(&pmcmsptwi_adapter.dev, "Writing cmd reg 0x%08x\n", reg);
-	pmcmsptwi_writel(reg, data->iobase + MSP_TWI_CMD_REG_OFFSET);
-	if (data->irq) {
-		unsigned long timeleft = wait_for_completion_timeout(
-						&data->wait, MSP_IRQ_TIMEOUT);
-		if (timeleft == 0) {
-			dev_dbg(&pmcmsptwi_adapter.dev,
-				"Result: IRQ timeout\n");
-			complete(&data->wait);
-			data->last_result = MSP_TWI_XFER_TIMEOUT;
-		}
-	} else
-		pmcmsptwi_poll_complete(data);
-
-	return data->last_result;
-}
-
-/*
- * Helper routine, converts 'pmctwi_cmd' struct to register format
- */
-static inline u32 pmcmsptwi_cmd_to_reg(const struct pmcmsptwi_cmd *cmd)
-{
-	return ((cmd->type & 0x3) << 8) |
-		(((cmd->write_len - 1) & 0x7) << 4) |
-		((cmd->read_len - 1) & 0x7);
-}
-
-/*
- * Do the transfer (high level)
- */
-static enum pmcmsptwi_xfer_result pmcmsptwi_xfer_cmd(
-			struct pmcmsptwi_cmd *cmd,
-			struct pmcmsptwi_data *data)
-{
-	enum pmcmsptwi_xfer_result retval;
-
-	mutex_lock(&data->lock);
-	dev_dbg(&pmcmsptwi_adapter.dev,
-		"Setting address to 0x%04x\n", cmd->addr);
-	pmcmsptwi_writel(cmd->addr, data->iobase + MSP_TWI_ADD_REG_OFFSET);
-
-	if (cmd->type == MSP_TWI_CMD_WRITE ||
-	    cmd->type == MSP_TWI_CMD_WRITE_READ) {
-		u64 tmp = be64_to_cpup((__be64 *)cmd->write_data);
-		tmp >>= (MSP_MAX_BYTES_PER_RW - cmd->write_len) * 8;
-		dev_dbg(&pmcmsptwi_adapter.dev, "Writing 0x%016llx\n", tmp);
-		pmcmsptwi_writel(tmp & 0x00000000ffffffffLL,
-				data->iobase + MSP_TWI_DAT_0_REG_OFFSET);
-		if (cmd->write_len > 4)
-			pmcmsptwi_writel(tmp >> 32,
-				data->iobase + MSP_TWI_DAT_1_REG_OFFSET);
-	}
-
-	retval = pmcmsptwi_do_xfer(pmcmsptwi_cmd_to_reg(cmd), data);
-	if (retval != MSP_TWI_XFER_OK)
-		goto xfer_err;
-
-	if (cmd->type == MSP_TWI_CMD_READ ||
-	    cmd->type == MSP_TWI_CMD_WRITE_READ) {
-		int i;
-		u64 rmsk = ~(0xffffffffffffffffLL << (cmd->read_len * 8));
-		u64 tmp = (u64)pmcmsptwi_readl(data->iobase +
-					MSP_TWI_DAT_0_REG_OFFSET);
-		if (cmd->read_len > 4)
-			tmp |= (u64)pmcmsptwi_readl(data->iobase +
-					MSP_TWI_DAT_1_REG_OFFSET) << 32;
-		tmp &= rmsk;
-		dev_dbg(&pmcmsptwi_adapter.dev, "Read 0x%016llx\n", tmp);
-
-		for (i = 0; i < cmd->read_len; i++)
-			cmd->read_data[i] = tmp >> i;
-	}
-
-xfer_err:
-	mutex_unlock(&data->lock);
-
-	return retval;
-}
-
-/* -- Algorithm functions -- */
-
-/*
- * Sends an i2c command out on the adapter
- */
-static int pmcmsptwi_master_xfer(struct i2c_adapter *adap,
-				struct i2c_msg *msg, int num)
-{
-	struct pmcmsptwi_data *data = i2c_get_adapdata(adap);
-	struct pmcmsptwi_cmd cmd;
-	struct pmcmsptwi_cfg oldcfg, newcfg;
-	int ret;
-
-	if (num == 2) {
-		struct i2c_msg *nextmsg = msg + 1;
-
-		cmd.type = MSP_TWI_CMD_WRITE_READ;
-		cmd.write_len = msg->len;
-		cmd.write_data = msg->buf;
-		cmd.read_len = nextmsg->len;
-		cmd.read_data = nextmsg->buf;
-	} else if (msg->flags & I2C_M_RD) {
-		cmd.type = MSP_TWI_CMD_READ;
-		cmd.read_len = msg->len;
-		cmd.read_data = msg->buf;
-		cmd.write_len = 0;
-		cmd.write_data = NULL;
-	} else {
-		cmd.type = MSP_TWI_CMD_WRITE;
-		cmd.read_len = 0;
-		cmd.read_data = NULL;
-		cmd.write_len = msg->len;
-		cmd.write_data = msg->buf;
-	}
-
-	cmd.addr = msg->addr;
-
-	if (msg->flags & I2C_M_TEN) {
-		pmcmsptwi_get_twi_config(&newcfg, data);
-		memcpy(&oldcfg, &newcfg, sizeof(oldcfg));
-
-		/* Set the special 10-bit address flag */
-		newcfg.add10 = 1;
-
-		pmcmsptwi_set_twi_config(&newcfg, data);
-	}
-
-	/* Execute the command */
-	ret = pmcmsptwi_xfer_cmd(&cmd, data);
-
-	if (msg->flags & I2C_M_TEN)
-		pmcmsptwi_set_twi_config(&oldcfg, data);
-
-	dev_dbg(&adap->dev, "I2C %s of %d bytes %s\n",
-		(msg->flags & I2C_M_RD) ? "read" : "write", msg->len,
-		(ret == MSP_TWI_XFER_OK) ? "succeeded" : "failed");
-
-	if (ret != MSP_TWI_XFER_OK) {
-		/*
-		 * TODO: We could potentially loop and retry in the case
-		 * of MSP_TWI_XFER_TIMEOUT.
-		 */
-		return -EIO;
-	}
-
-	return num;
-}
-
-static u32 pmcmsptwi_i2c_func(struct i2c_adapter *adapter)
-{
-	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
-		I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA |
-		I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_PROC_CALL;
-}
-
-static const struct i2c_adapter_quirks pmcmsptwi_i2c_quirks = {
-	.flags = I2C_AQ_COMB_WRITE_THEN_READ | I2C_AQ_NO_ZERO_LEN,
-	.max_write_len = MSP_MAX_BYTES_PER_RW,
-	.max_read_len = MSP_MAX_BYTES_PER_RW,
-	.max_comb_1st_msg_len = MSP_MAX_BYTES_PER_RW,
-	.max_comb_2nd_msg_len = MSP_MAX_BYTES_PER_RW,
-};
-
-/* -- Initialization -- */
-
-static const struct i2c_algorithm pmcmsptwi_algo = {
-	.master_xfer	= pmcmsptwi_master_xfer,
-	.functionality	= pmcmsptwi_i2c_func,
-};
-
-static struct i2c_adapter pmcmsptwi_adapter = {
-	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
-	.algo		= &pmcmsptwi_algo,
-	.quirks		= &pmcmsptwi_i2c_quirks,
-	.name		= DRV_NAME,
-};
-
-static struct platform_driver pmcmsptwi_driver = {
-	.probe  = pmcmsptwi_probe,
-	.remove	= pmcmsptwi_remove,
-	.driver = {
-		.name	= DRV_NAME,
-	},
-};
-
-module_platform_driver(pmcmsptwi_driver);
-
-MODULE_DESCRIPTION("PMC MSP TWI/SMBus/I2C driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.26.2

