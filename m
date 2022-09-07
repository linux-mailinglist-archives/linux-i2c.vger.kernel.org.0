Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 684C25AF9B2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 04:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiIGCHI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 22:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiIGCHH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 22:07:07 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2078286B6D
        for <linux-i2c@vger.kernel.org>; Tue,  6 Sep 2022 19:07:06 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-127d10b4f19so6951557fac.9
        for <linux-i2c@vger.kernel.org>; Tue, 06 Sep 2022 19:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=0HKwt65hYwuI3sEUQ25nZPwQD46kQnpjR2cNNC8wWic=;
        b=ggh+19QvKX7NbSGks5jWfkBp9NtnVhKjxeP/fmlcH1jT/E74HBPkRWhJSFSTP54iPG
         q8aPsgI9jkv2WPQhQ77y+bF5wt7NJHG6kW2WajaWkuq/1/GLLGLhENlzh2piQKtmSIDt
         9pyzeBk1ZTEzcGNPgK3+B0CB4FO6cYO8jezHoAwixt8ILnL/QrgmBUecelhTCmLeWSGb
         cnPbkEAmm3WRL2dgEKo84/TU5h7MYfVUk9JB//TRyWc+YZPdNLBIWb6VFy9ZThGoX1HL
         THlAebap0eA3iGmC4TQLeolEecYDrbFzvveKhEwJw1RovRDPS+7+Bcx0FiPh0Hf+oHOv
         0Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=0HKwt65hYwuI3sEUQ25nZPwQD46kQnpjR2cNNC8wWic=;
        b=aRO3+5dirrzDBSsq/Gmwv7skfrECxelGSQPvPiLHkO2yqOKrqVVOo0OjUGlUcwlffn
         8KfVBMj6KPV/XNO6/YleNqAiLBxm3sCbZtI4SEHG8m+VeZOUrXd6xx3HLZV9Gb9UAaSA
         cOOv89bGX4UBtNCMXnGzZwteT57yTk/npNklqEKSlZRjwlfuMbgQzGOowi7d2idlLRX3
         9GIPy0sPOIewkQ6hb7XuK0ExxkVNq9Nn3ZiLtbISplIjqtCbTq7FcrqKvfmQFqkRQrjA
         oh7PsySThodL8zVmY3mt72yXWzdZ12iAWUHXK6F377RtCpZYrr35moyPUdGZO0TQpNHe
         02eg==
X-Gm-Message-State: ACgBeo2Kw6omOUnzzu7oUlfgnc7el4xRvGRlOmO6EKTNTqdaOgIssc+b
        7gdseVR0Yfou4DppNB77xYVZeqrInLiPEg==
X-Google-Smtp-Source: AA6agR6MoILU/VuVMzg4EjlJgozv2S+Wqkg2zYWQ8cmbPF1szo4cquJ8EV5/W/+3SjEf9Rd3S2vmbQ==
X-Received: by 2002:a05:6808:1b20:b0:343:678c:451b with SMTP id bx32-20020a0568081b2000b00343678c451bmr559246oib.171.1662516425261;
        Tue, 06 Sep 2022 19:07:05 -0700 (PDT)
Received: from Adam-Desktop.lan (2603-8090-0107-77e3-0000-0000-0000-0d04.res6.spectrum.com. [2603:8090:107:77e3::d04])
        by smtp.gmail.com with ESMTPSA id r11-20020acaf30b000000b00345cce8083dsm6014975oih.33.2022.09.06.19.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 19:07:04 -0700 (PDT)
From:   Adam Honse <calcprogrammer1@gmail.com>
To:     calcprogrammer1@gmail.com, jdelvare@suse.de,
        linux-i2c@vger.kernel.org, jdelvare@suse.com
Subject: [PATCH v2] i2c: New driver for Nuvoton SMBus adapters
Date:   Wed,  7 Sep 2022 02:06:51 +0000
Message-Id: <20220907020651.2309354-1-calcprogrammer1@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch introduces a new driver for the SMBus adapter that is built in
to most Nuvoton Super-IO chips.  This SMBus adapter is used for RGB
lighting control on some ASUS motherboards with Intel chipsets.

The interface's register description is available in the supported
devices' datasheets.  Operation of this interface has been verified
with OpenRGB on an ASUS PRIME Z270-A motherboard.

Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
---
 drivers/i2c/busses/Kconfig       |   9 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-nct6793.c | 550 +++++++++++++++++++++++++++++++
 3 files changed, 560 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6793.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a1bae59208e3..ef679c5141e5 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -227,6 +227,15 @@ config I2C_CHT_WC
 	  combined with a FUSB302 Type-C port-controller as such it is advised
 	  to also select CONFIG_TYPEC_FUSB302=m.
 
+config I2C_NCT6793
+	tristate "Nuvoton NCT6793D and compatible SMBus controller"
+	help
+		If you say yes to this option, support will be included for the
+		Nuvoton NCT6793D and compatible SMBus controllers.
+
+		This driver can also be built as a module.  If so, the module
+		will be called i2c-nct6793.
+
 config I2C_NFORCE2
 	tristate "Nvidia nForce2, nForce3 and nForce4"
 	depends on PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 479f60e4ee3d..ab3506e40ecf 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_I2C_CHT_WC)	+= i2c-cht-wc.o
 obj-$(CONFIG_I2C_I801)		+= i2c-i801.o
 obj-$(CONFIG_I2C_ISCH)		+= i2c-isch.o
 obj-$(CONFIG_I2C_ISMT)		+= i2c-ismt.o
+obj-$(CONFIG_I2C_NCT6793)	+= i2c-nct6793.o
 obj-$(CONFIG_I2C_NFORCE2)	+= i2c-nforce2.o
 obj-$(CONFIG_I2C_NFORCE2_S4985)	+= i2c-nforce2-s4985.o
 obj-$(CONFIG_I2C_NVIDIA_GPU)	+= i2c-nvidia-gpu.o
diff --git a/drivers/i2c/busses/i2c-nct6793.c b/drivers/i2c/busses/i2c-nct6793.c
new file mode 100644
index 000000000000..dfb2e7748cf9
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6793.c
@@ -0,0 +1,550 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * i2c-nct6793 - Driver for the SMBus master functionality of
+ *	       Nuvoton NCT679x Super-I/O chips
+ *
+ * Copyright (C) 2022  Adam Honse <calcprogrammer1@gmail.com>
+ *
+ * Derived from nct6775 hwmon driver
+ * Copyright (C) 2012  Guenter Roeck <linux@roeck-us.net>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/err.h>
+#include <linux/delay.h>
+#include <linux/ioport.h>
+#include <linux/i2c.h>
+#include <linux/acpi.h>
+#include <linux/io.h>
+
+#define DRVNAME "i2c-nct6793"
+
+/* Nuvoton SMBus address offsets */
+#define SMBHSTDAT       (nuvoton_nct6793_smba + 0x0)
+#define SMBBLKSZ        (nuvoton_nct6793_smba + 0x1)
+#define SMBHSTCMD       (nuvoton_nct6793_smba + 0x2)
+#define SMBHSTIDX       (nuvoton_nct6793_smba + 0x3)
+#define SMBHSTCTL       (nuvoton_nct6793_smba + 0x4)
+#define SMBHSTADD       (nuvoton_nct6793_smba + 0x5)
+#define SMBHSTERR       (nuvoton_nct6793_smba + 0x9)
+#define SMBHSTSTS       (nuvoton_nct6793_smba + 0xE)
+
+/* Command register */
+#define NCT6793_READ_BYTE		0
+#define NCT6793_READ_WORD		1
+#define NCT6793_READ_BLOCK		2
+#define NCT6793D_BLOCK_PROC_CALL	3
+#define NCT6793_PROC_CALL		4
+#define NCT6793_WRITE_BYTE		8
+#define NCT6793_WRITE_WORD		9
+#define NCT6793_WRITE_BLOCK		10
+
+/* Control register */
+#define NCT6793_MANUAL_START		128
+#define NCT6793_SOFT_RESET		64
+
+/* Error register */
+#define NCT6793_NO_ACK			32
+
+/* Status register */
+#define NCT6793_FIFO_EMPTY		BIT(0)
+#define NCT6793_FIFO_FULL		BIT(1)
+#define NCT6793_MANUAL_ACTIVE		BIT(2)
+
+#define NCT6793_LD_SMBUS		0x0B
+
+/* Other settings */
+#define MAX_RETRIES			400
+
+enum kinds { nct6791, nct6792, nct6793, nct6795, nct6796, nct6798 };
+
+struct nct6793_sio_data {
+	int sioreg;
+	enum kinds kind;
+	struct i2c_adapter *adapter;
+};
+
+static const char * const nct6793_sio_names[] = {
+	"NCT6791D",
+	"NCT6792D",
+	"NCT6793D",
+	"NCT6795D",
+	"NCT6796D",
+	"NCT6798D",
+};
+
+#define SIO_REG_LDSEL			0x07	/* Logical device select */
+#define SIO_REG_DEVID			0x20	/* Device ID (2 bytes) */
+#define SIO_REG_SMBA			0x62	/* SMBus base address register */
+
+#define SIO_NCT6791_ID			0xc800
+#define SIO_NCT6792_ID			0xc910
+#define SIO_NCT6793_ID			0xd120
+#define SIO_NCT6795_ID			0xd350
+#define SIO_NCT6796_ID			0xd420
+#define SIO_NCT6798_ID			0xd428
+#define SIO_ID_MASK			0xFFF0
+
+static inline int
+superio_inb(int ioreg, int reg)
+{
+	outb(reg, ioreg);
+	return inb(ioreg + 1);
+}
+
+static inline void
+superio_select(int ioreg, int ld)
+{
+	outb(SIO_REG_LDSEL, ioreg);
+	outb(ld, ioreg + 1);
+}
+
+static inline int
+superio_enter(int ioreg)
+{
+	/*
+	 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
+	 */
+	if (!request_muxed_region(ioreg, 2, DRVNAME))
+		return -EBUSY;
+
+	outb(0x87, ioreg);
+	outb(0x87, ioreg);
+
+	return 0;
+}
+
+static inline void
+superio_exit(int ioreg)
+{
+	outb(0xaa, ioreg);
+	outb(0x02, ioreg);
+	outb(0x02, ioreg + 1);
+	release_region(ioreg, 2);
+}
+
+/*
+ * ISA constants
+ */
+
+#define IOREGION_ALIGNMENT	(~7)
+#define IOREGION_LENGTH		2
+
+struct i2c_nct6793_adapdata {
+	unsigned short smba;
+};
+
+/* Return negative errno on error. */
+static s32 nct6793_access(struct i2c_adapter *adap, u16 addr,
+		 unsigned short flags, char read_write,
+		 u8 command, int size, union i2c_smbus_data *data)
+{
+	struct i2c_nct6793_adapdata *adapdata = i2c_get_adapdata(adap);
+	unsigned short nuvoton_nct6793_smba = adapdata->smba;
+	int i, len, cnt;
+	int timeout = 0;
+
+	outb_p(NCT6793_SOFT_RESET, SMBHSTCTL);
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		outb_p((addr << 1) | read_write,
+				SMBHSTADD);
+		break;
+	case I2C_SMBUS_BYTE_DATA:
+		fallthrough;
+	case I2C_SMBUS_BYTE:
+		outb_p((addr << 1) | read_write,
+				SMBHSTADD);
+		outb_p(command, SMBHSTIDX);
+		if (read_write == I2C_SMBUS_WRITE) {
+			outb_p(data->byte, SMBHSTDAT);
+			outb_p(NCT6793_WRITE_BYTE, SMBHSTCMD);
+		} else {
+			outb_p(NCT6793_READ_BYTE, SMBHSTCMD);
+		}
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		outb_p((addr << 1) | read_write,
+				SMBHSTADD);
+		outb_p(command, SMBHSTIDX);
+		if (read_write == I2C_SMBUS_WRITE) {
+			outb_p(data->word & 0xff, SMBHSTDAT);
+			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT);
+			outb_p(NCT6793_WRITE_WORD, SMBHSTCMD);
+		} else {
+			outb_p(NCT6793_READ_WORD, SMBHSTCMD);
+		}
+		break;
+	case I2C_SMBUS_BLOCK_DATA:
+		outb_p((addr << 1) | read_write,
+				SMBHSTADD);
+		outb_p(command, SMBHSTIDX);
+		if (read_write == I2C_SMBUS_WRITE) {
+			len = data->block[0];
+			if (len == 0 || len > I2C_SMBUS_BLOCK_MAX)
+				return -EINVAL;
+			outb_p(len, SMBBLKSZ);
+
+			cnt = 1;
+			if (len >= 4) {
+				for (i = cnt; i <= 4; i++)
+					outb_p(data->block[i], SMBHSTDAT);
+
+				len -= 4;
+				cnt += 4;
+			} else {
+				for (i = cnt; i <= len; i++)
+					outb_p(data->block[i], SMBHSTDAT);
+
+				len = 0;
+			}
+
+			outb_p(NCT6793_WRITE_BLOCK, SMBHSTCMD);
+		} else {
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		return -EOPNOTSUPP;
+	}
+
+	outb_p(NCT6793_MANUAL_START, SMBHSTCTL);
+
+	while (size == I2C_SMBUS_BLOCK_DATA && len > 0) {
+		if (read_write == I2C_SMBUS_WRITE) {
+			timeout = 0;
+			while ((inb_p(SMBHSTSTS) & NCT6793_FIFO_EMPTY) == 0) {
+				if (timeout > MAX_RETRIES)
+					return -ETIMEDOUT;
+
+				usleep_range(250, 500);
+				timeout++;
+			}
+
+			/* Load more bytes into FIFO */
+			if (len >= 4) {
+				for (i = cnt; i <= (cnt + 4); i++)
+					outb_p(data->block[i], SMBHSTDAT);
+
+				len -= 4;
+				cnt += 4;
+			} else {
+				for (i = cnt; i <= (cnt + len); i++)
+					outb_p(data->block[i], SMBHSTDAT);
+
+				len = 0;
+			}
+		}
+	}
+
+	/* Wait for manual mode to complete */
+	timeout = 0;
+	while ((inb_p(SMBHSTSTS) & NCT6793_MANUAL_ACTIVE) != 0) {
+		if (timeout > MAX_RETRIES)
+			return -ETIMEDOUT;
+
+		usleep_range(250, 500);
+		timeout++;
+	}
+
+	if ((inb_p(SMBHSTERR) & NCT6793_NO_ACK) != 0)
+		return -ENXIO;
+
+	if (read_write == I2C_SMBUS_WRITE || size == I2C_SMBUS_QUICK)
+		return 0;
+
+	switch (size) {
+	case I2C_SMBUS_BYTE_DATA:
+		data->byte = inb_p(SMBHSTDAT);
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		data->word = inb_p(SMBHSTDAT) | (inb_p(SMBHSTDAT) << 8);
+		break;
+	}
+	return 0;
+}
+
+static u32 nct6793_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
+	    I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+	    I2C_FUNC_SMBUS_BLOCK_DATA;
+}
+
+static const struct i2c_algorithm smbus_algorithm = {
+	.smbus_xfer	= nct6793_access,
+	.functionality	= nct6793_func,
+};
+
+static struct i2c_adapter * nct6793_add_adapter(unsigned short smba, const char *name)
+{
+	struct i2c_adapter *adap;
+	struct i2c_nct6793_adapdata *adapdata;
+	int retval;
+
+	adap = kzalloc(sizeof(*adap), GFP_KERNEL);
+	if (adap == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	adap->owner = THIS_MODULE;
+	adap->class = 0;
+	adap->algo = &smbus_algorithm;
+
+	adapdata = kzalloc(sizeof(*adapdata), GFP_KERNEL);
+	if (adapdata == NULL) {
+		kfree(adap);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	adapdata->smba = smba;
+
+	snprintf(adap->name, sizeof(adap->name),
+		"SMBus NCT679x adapter %s at %04x", name, smba);
+
+	i2c_set_adapdata(adap, adapdata);
+
+	retval = i2c_add_adapter(adap);
+	if (retval) {
+		kfree(adapdata);
+		kfree(adap);
+		return ERR_PTR(retval);
+	}
+
+	return adap;
+}
+
+static void nct6793_remove_adapter(struct i2c_adapter *adap)
+{
+	struct i2c_nct6793_adapdata *adapdata = i2c_get_adapdata(adap);
+
+	i2c_del_adapter(adap);
+	kfree(adapdata);
+	kfree(adap);
+}
+
+/*
+ * When Super-I/O functions move to a separate file, the Super-I/O
+ * bus will manage the lifetime of the device and this module will only keep
+ * track of the nct6793 driver. But since we use platform_device_alloc(), we
+ * must keep track of the device.
+ */
+static struct platform_device *pdev[2];
+
+static int nct6793_probe(struct platform_device *pdev)
+{
+	struct i2c_adapter *adap;
+	struct device *dev = &pdev->dev;
+	struct nct6793_sio_data *sio_data = dev_get_platdata(dev);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
+				 DRVNAME))
+		return -EBUSY;
+
+	switch (sio_data->kind) {
+	case nct6791:
+	case nct6792:
+	case nct6793:
+	case nct6795:
+	case nct6796:
+	case nct6798:
+		adap = nct6793_add_adapter(res->start, nct6793_sio_names[sio_data->kind]);
+		
+		if(IS_ERR(sio_data->adapter))
+			return -ENODEV;
+
+		sio_data->adapter = adap;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static struct platform_driver i2c_nct6793_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6793_probe,
+};
+
+static void __exit i2c_nct6793_exit(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
+		if (pdev[i]) {
+			struct device *dev = &pdev[i]->dev;
+			struct nct6793_sio_data *sio_data = dev_get_platdata(dev);
+
+			if (sio_data->adapter)
+				nct6793_remove_adapter(sio_data->adapter);
+
+			platform_device_unregister(pdev[i]);
+		}
+	}
+	platform_driver_unregister(&i2c_nct6793_driver);
+}
+
+/* nct6793_find() looks for a compatible Nuvoton chip in the Super-I/O config space */
+static int __init nct6793_find(int sioaddr, struct nct6793_sio_data *sio_data)
+{
+	u16 val;
+	int err;
+	int addr;
+
+	err = superio_enter(sioaddr);
+	if (err)
+		return err;
+
+	val = (superio_inb(sioaddr, SIO_REG_DEVID) << 8) |
+		superio_inb(sioaddr, SIO_REG_DEVID + 1);
+
+	switch (val & SIO_ID_MASK) {
+	case SIO_NCT6791_ID:
+		sio_data->kind = nct6791;
+		break;
+	case SIO_NCT6792_ID:
+		sio_data->kind = nct6792;
+		break;
+	case SIO_NCT6793_ID:
+		sio_data->kind = nct6793;
+		break;
+	case SIO_NCT6795_ID:
+		sio_data->kind = nct6795;
+		break;
+	case SIO_NCT6796_ID:
+		sio_data->kind = nct6796;
+		break;
+	case SIO_NCT6798_ID:
+		sio_data->kind = nct6798;
+		break;
+	default:
+		if (val != 0xffff)
+			pr_debug("unsupported chip ID: 0x%04x\n", val);
+		superio_exit(sioaddr);
+		return -ENODEV;
+	}
+
+	/* We have a known chip, find the SMBus I/O address */
+	superio_select(sioaddr, NCT6793_LD_SMBUS);
+	val = (superio_inb(sioaddr, SIO_REG_SMBA) << 8)
+	    | superio_inb(sioaddr, SIO_REG_SMBA + 1);
+	addr = val & IOREGION_ALIGNMENT;
+	if (addr == 0) {
+		pr_err("Refusing to enable a Super-I/O device with a base I/O port 0\n");
+		superio_exit(sioaddr);
+		return -ENODEV;
+	}
+
+	superio_exit(sioaddr);
+	pr_info("Found %s or compatible chip at %#x:%#x\n",
+		nct6793_sio_names[sio_data->kind], sioaddr, addr);
+	sio_data->sioreg = sioaddr;
+
+	return addr;
+}
+
+static int __init i2c_nct6793_init(void)
+{
+	int i, err;
+	bool found = false;
+	int address;
+	struct resource res;
+	struct nct6793_sio_data sio_data;
+	int sioaddr[2] = { 0x2e, 0x4e };
+
+	err = platform_driver_register(&i2c_nct6793_driver);
+	if (err)
+		return err;
+
+	/*
+	 * Initialize sio_data->kind and sio_data->sioreg.
+	 *
+	 * When Super-I/O functions move to a separate file, the Super-I/O
+	 * driver will probe 0x2e and 0x4e and auto-detect the presence of a
+	 * nct6775 hardware monitor, and call probe().
+	 */
+	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
+		address = nct6793_find(sioaddr[i], &sio_data);
+		if (address <= 0)
+			continue;
+
+		found = true;
+
+		pdev[i] = platform_device_alloc(DRVNAME, address);
+		if (!pdev[i]) {
+			err = -ENOMEM;
+			goto exit_device_unregister;
+		}
+
+		err = platform_device_add_data(pdev[i], &sio_data,
+					       sizeof(struct nct6793_sio_data));
+		if (err)
+			goto exit_device_put;
+
+		memset(&res, 0, sizeof(res));
+		res.name = DRVNAME;
+		res.start = address;
+		res.end = address + IOREGION_LENGTH - 1;
+		res.flags = IORESOURCE_IO;
+
+		err = acpi_check_resource_conflict(&res);
+		if (err) {
+			platform_device_put(pdev[i]);
+			pdev[i] = NULL;
+			continue;
+		}
+
+		err = platform_device_add_resources(pdev[i], &res, 1);
+		if (err)
+			goto exit_device_put;
+
+		/* platform_device_add calls probe() */
+		err = platform_device_add(pdev[i]);
+		if (err)
+			goto exit_device_put;
+	}
+	if (!found) {
+		err = -ENODEV;
+		goto exit_unregister;
+	}
+
+	return 0;
+
+exit_device_put:
+	platform_device_put(pdev[i]);
+exit_device_unregister:
+	while (--i >= 0) {
+		if (pdev[i])
+			platform_device_unregister(pdev[i]);
+	}
+exit_unregister:
+	platform_driver_unregister(&i2c_nct6793_driver);
+	return err;
+}
+
+MODULE_AUTHOR("Adam Honse <calcprogrammer1@gmail.com>");
+MODULE_DESCRIPTION("SMBus driver for NCT6793D and compatible chips");
+MODULE_LICENSE("GPL");
+
+module_init(i2c_nct6793_init);
+module_exit(i2c_nct6793_exit);
-- 
2.35.1

