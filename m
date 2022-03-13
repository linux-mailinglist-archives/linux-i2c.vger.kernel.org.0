Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844734D789B
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Mar 2022 23:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234124AbiCMWmM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Mar 2022 18:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiCMWmM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Mar 2022 18:42:12 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFC274DCB
        for <linux-i2c@vger.kernel.org>; Sun, 13 Mar 2022 15:41:03 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id n7so15581772oif.5
        for <linux-i2c@vger.kernel.org>; Sun, 13 Mar 2022 15:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=258e7MbgyS0PSxUvN3Hpqr3jCnF1s8R3WPxIWt8fmh0=;
        b=S4Bd9TBNE4eKN1KTAXlEEPNSRapA3dMsS82nQ9BbyalGx5zIVLRU2aMi1caIYZor5R
         q5O81X/lIQ/Vqp+baLyhHZiSyxfY33StQx4Ujs9LywlqmAWt8Xfe0T26ZYRSiLgHTD/V
         yA/95qJ4MYfnRAI0hkBxOE0ahcr1tUOhneCCNNBcDNCA1Z5Ej+FyyvSjCc5MiBCELx1V
         Amqmc8Rle2GZ8frqUPHDb2INPbWfN9rt9E8uEiPScKEiwzCAU2rDV5zxmGZrk4eb2Ux8
         jfWv/pD2aSjRxbC2dwKEJ8Uc521/fGeRRJNNVqqA0Ol9FypadoTCTDkKeDqE3TSohI11
         Ochg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=258e7MbgyS0PSxUvN3Hpqr3jCnF1s8R3WPxIWt8fmh0=;
        b=taURKxTKbivDFRola9lEIO1EPzz5fbQ9KES59BJbPpoqS5AJTnZw55phPFuub7tKf1
         N223qH18ZP7OgUZ7apeNk8TnWpQzc7gZuSNyKl8xTRKKJAxiq3rcwzyAmvQbMGometa4
         EJhwASq/coJJje2VkQV+kgOMlKdztQRb0i3wogCPuUiKZstZ/BsUoT3xd2CV2kSqf16b
         3A4nEC+z056IrAb+jbuI1AFeo6mzP8tJiSSynsXjtwyC0idDQhhARSQj4f5xA/83nXga
         /IrWiS9q23BcVMPxphY/GGdmR7rvTZqctvPBdy+RLUIScW5M0WYTVCQCAxdAi/s94NQC
         DL1w==
X-Gm-Message-State: AOAM530IYOtnMeV/7e9cAS3jTssYWOSp3GVFmWoZyHmDePGZpTl63UKZ
        05KBLe6LNhFVWMNM5M1ZYAg=
X-Google-Smtp-Source: ABdhPJw8ONrzhPC8PMAArk51MPEc5cOIwsDgIGvbL1onEj5d2rCqZdlYHI0/496vGEM8GcB8Fie9DQ==
X-Received: by 2002:aca:1a14:0:b0:2ec:97c0:a2c with SMTP id a20-20020aca1a14000000b002ec97c00a2cmr7480871oia.149.1647211262525;
        Sun, 13 Mar 2022 15:41:02 -0700 (PDT)
Received: from Adam-Desktop.lan ([2600:6c42:683f:b692:f5d5:e535:bb2b:b030])
        by smtp.googlemail.com with ESMTPSA id du43-20020a0568703a2b00b000d9b66f57besm5891136oab.32.2022.03.13.15.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 15:41:02 -0700 (PDT)
From:   Adam Honse <calcprogrammer1@gmail.com>
To:     jdelvare@suse.de, linux-i2c@vger.kernel.org,
        calcprogrammer1@gmail.com, jdelvare@suse.com
Subject: [PATCH] i2c: New driver for Nuvoton SMBus adapters
Date:   Sun, 13 Mar 2022 17:40:20 -0500
Message-Id: <20220313224020.9005-1-calcprogrammer1@gmail.com>
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
 drivers/i2c/busses/i2c-nct6775.c | 608 +++++++++++++++++++++++++++++++
 3 files changed, 618 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-nct6775.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 8a6c6ee28556..cf4c5e92738b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -219,6 +219,15 @@ config I2C_CHT_WC
 	  combined with a FUSB302 Type-C port-controller as such it is advised
 	  to also select CONFIG_TYPEC_FUSB302=m.
 
+config I2C_NCT6775
+	tristate "Nuvoton NCT6775 and compatible SMBus controller"
+	help
+		If you say yes to this option, support will be included for the
+		Nuvoton NCT6775 and compatible SMBus controllers.
+
+		This driver can also be built as a module.  If so, the module
+		will be called i2c-nct6775.
+
 config I2C_NFORCE2
 	tristate "Nvidia nForce2, nForce3 and nForce4"
 	depends on PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1d00dce77098..450cde39c7d5 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_I2C_CHT_WC)	+= i2c-cht-wc.o
 obj-$(CONFIG_I2C_I801)		+= i2c-i801.o
 obj-$(CONFIG_I2C_ISCH)		+= i2c-isch.o
 obj-$(CONFIG_I2C_ISMT)		+= i2c-ismt.o
+obj-$(CONFIG_I2C_NCT6775)	+= i2c-nct6775.o
 obj-$(CONFIG_I2C_NFORCE2)	+= i2c-nforce2.o
 obj-$(CONFIG_I2C_NFORCE2_S4985)	+= i2c-nforce2-s4985.o
 obj-$(CONFIG_I2C_NVIDIA_GPU)	+= i2c-nvidia-gpu.o
diff --git a/drivers/i2c/busses/i2c-nct6775.c b/drivers/i2c/busses/i2c-nct6775.c
new file mode 100644
index 000000000000..fdffe30f595b
--- /dev/null
+++ b/drivers/i2c/busses/i2c-nct6775.c
@@ -0,0 +1,608 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * i2c-nct6775 - Driver for the SMBus master functionality of
+ *	       Nuvoton NCT677x Super-I/O chips
+ *
+ * Copyright (C) 2019  Adam Honse <calcprogrammer1@gmail.com>
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
+#include <linux/jiffies.h>
+#include <linux/platform_device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon-vid.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/delay.h>
+#include <linux/ioport.h>
+#include <linux/i2c.h>
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/dmi.h>
+#include <linux/io.h>
+#include <linux/nospec.h>
+
+#define DRVNAME "i2c-nct6775"
+
+/* Nuvoton SMBus address offsets */
+#define SMBHSTDAT       (0 + nuvoton_nct6793d_smba)
+#define SMBBLKSZ        (1 + nuvoton_nct6793d_smba)
+#define SMBHSTCMD       (2 + nuvoton_nct6793d_smba)
+#define SMBHSTIDX       (3 + nuvoton_nct6793d_smba)
+#define SMBHSTCTL       (4 + nuvoton_nct6793d_smba)
+#define SMBHSTADD       (5 + nuvoton_nct6793d_smba)
+#define SMBHSTERR       (9 + nuvoton_nct6793d_smba)
+#define SMBHSTSTS       (0xE + nuvoton_nct6793d_smba)
+
+/* Command register */
+#define NCT6793D_READ_BYTE      0
+#define NCT6793D_READ_WORD      1
+#define NCT6793D_READ_BLOCK     2
+#define NCT6793D_BLOCK_WRITE_READ_PROC_CALL 3
+#define NCT6793D_PROC_CALL      4
+#define NCT6793D_WRITE_BYTE     8
+#define NCT6793D_WRITE_WORD     9
+#define NCT6793D_WRITE_BLOCK    10
+
+/* Control register */
+#define NCT6793D_MANUAL_START   128
+#define NCT6793D_SOFT_RESET     64
+
+/* Error register */
+#define NCT6793D_NO_ACK         32
+
+/* Status register */
+#define NCT6793D_FIFO_EMPTY     1
+#define NCT6793D_FIFO_FULL      2
+#define NCT6793D_MANUAL_ACTIVE  4
+
+#define NCT6775_LD_SMBUS		0x0B
+
+/* Other settings */
+#define MAX_RETRIES		400
+
+enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
+	     nct6795, nct6796, nct6798 };
+
+struct nct6775_sio_data {
+	int sioreg;
+	enum kinds kind;
+};
+
+/* used to set data->name = nct6775_device_names[data->sio_kind] */
+static const char * const nct6775_device_names[] = {
+	"nct6106",
+	"nct6775",
+	"nct6776",
+	"nct6779",
+	"nct6791",
+	"nct6792",
+	"nct6793",
+	"nct6795",
+	"nct6796",
+	"nct6798",
+};
+
+static const char * const nct6775_sio_names[] __initconst = {
+	"NCT6106D",
+	"NCT6775F",
+	"NCT6776D/F",
+	"NCT6779D",
+	"NCT6791D",
+	"NCT6792D",
+	"NCT6793D",
+	"NCT6795D",
+	"NCT6796D",
+	"NCT6798D",
+};
+
+#define SIO_REG_LDSEL		0x07	/* Logical device select */
+#define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
+#define SIO_REG_SMBA		0x62	/* SMBus base address register */
+
+#define SIO_NCT6106_ID		0xc450
+#define SIO_NCT6775_ID		0xb470
+#define SIO_NCT6776_ID		0xc330
+#define SIO_NCT6779_ID		0xc560
+#define SIO_NCT6791_ID		0xc800
+#define SIO_NCT6792_ID		0xc910
+#define SIO_NCT6793_ID		0xd120
+#define SIO_NCT6795_ID		0xd350
+#define SIO_NCT6796_ID		0xd420
+#define SIO_NCT6798_ID		0xd428
+#define SIO_ID_MASK			0xFFF0
+
+static inline void
+superio_outb(int ioreg, int reg, int val)
+{
+	outb(reg, ioreg);
+	outb(val, ioreg + 1);
+}
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
+#define ADDR_REG_OFFSET		0
+#define DATA_REG_OFFSET		1
+
+#define NCT6775_REG_BANK	0x4E
+#define NCT6775_REG_CONFIG	0x40
+
+static struct i2c_adapter *nct6775_adapter;
+
+struct i2c_nct6775_adapdata {
+	unsigned short smba;
+};
+
+/* Return negative errno on error. */
+static s32 nct6775_access(struct i2c_adapter *adap, u16 addr,
+		 unsigned short flags, char read_write,
+		 u8 command, int size, union i2c_smbus_data *data)
+{
+	struct i2c_nct6775_adapdata *adapdata = i2c_get_adapdata(adap);
+	unsigned short nuvoton_nct6793d_smba = adapdata->smba;
+	int i, len, cnt;
+	union i2c_smbus_data tmp_data;
+	int timeout = 0;
+
+	tmp_data.word = 0;
+	cnt = 0;
+	len = 0;
+
+	outb_p(NCT6793D_SOFT_RESET, SMBHSTCTL);
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		outb_p((addr << 1) | read_write,
+				SMBHSTADD);
+		break;
+	case I2C_SMBUS_BYTE_DATA:
+		tmp_data.byte = data->byte;
+	case I2C_SMBUS_BYTE:
+		outb_p((addr << 1) | read_write,
+				SMBHSTADD);
+		outb_p(command, SMBHSTIDX);
+		if (read_write == I2C_SMBUS_WRITE) {
+			outb_p(tmp_data.byte, SMBHSTDAT);
+			outb_p(NCT6793D_WRITE_BYTE, SMBHSTCMD);
+		} else {
+			outb_p(NCT6793D_READ_BYTE, SMBHSTCMD);
+		}
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		outb_p((addr << 1) | read_write,
+				SMBHSTADD);
+		outb_p(command, SMBHSTIDX);
+		if (read_write == I2C_SMBUS_WRITE) {
+			outb_p(data->word & 0xff, SMBHSTDAT);
+			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT);
+			outb_p(NCT6793D_WRITE_WORD, SMBHSTCMD);
+		} else {
+			outb_p(NCT6793D_READ_WORD, SMBHSTCMD);
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
+			outb_p(NCT6793D_WRITE_BLOCK, SMBHSTCMD);
+		} else {
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		return -EOPNOTSUPP;
+	}
+
+	outb_p(NCT6793D_MANUAL_START, SMBHSTCTL);
+
+	while ((size == I2C_SMBUS_BLOCK_DATA) && (len > 0)) {
+		if (read_write == I2C_SMBUS_WRITE) {
+			timeout = 0;
+			while ((inb_p(SMBHSTSTS) & NCT6793D_FIFO_EMPTY) == 0) {
+				if (timeout > MAX_RETRIES)
+					return -ETIMEDOUT;
+
+				usleep_range(250, 500);
+				timeout++;
+			}
+
+			//Load more bytes into FIFO
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
+		} else {
+			return -EOPNOTSUPP;
+		}
+
+	}
+
+	//wait for manual mode to complete
+	timeout = 0;
+	while ((inb_p(SMBHSTSTS) & NCT6793D_MANUAL_ACTIVE) != 0) {
+		if (timeout > MAX_RETRIES)
+			return -ETIMEDOUT;
+
+		usleep_range(250, 500);
+		timeout++;
+	}
+
+	if ((inb_p(SMBHSTERR) & NCT6793D_NO_ACK) != 0)
+		return -ENXIO;
+
+	else if ((read_write == I2C_SMBUS_WRITE) || (size == I2C_SMBUS_QUICK))
+		return 0;
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+	case I2C_SMBUS_BYTE_DATA:
+		data->byte = inb_p(SMBHSTDAT);
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		data->word = inb_p(SMBHSTDAT) + (inb_p(SMBHSTDAT) << 8);
+		break;
+	}
+	return 0;
+}
+
+static u32 nct6775_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
+	    I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+	    I2C_FUNC_SMBUS_BLOCK_DATA;
+}
+
+static const struct i2c_algorithm smbus_algorithm = {
+	.smbus_xfer	= nct6775_access,
+	.functionality	= nct6775_func,
+};
+
+static int nct6775_add_adapter(unsigned short smba, const char *name, struct i2c_adapter **padap)
+{
+	struct i2c_adapter *adap;
+	struct i2c_nct6775_adapdata *adapdata;
+	int retval;
+
+	adap = kzalloc(sizeof(*adap), GFP_KERNEL);
+	if (adap == NULL)
+		return -ENOMEM;
+
+	adap->owner = THIS_MODULE;
+	adap->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adap->algo = &smbus_algorithm;
+
+	adapdata = kzalloc(sizeof(*adapdata), GFP_KERNEL);
+	if (adapdata == NULL) {
+		kfree(adap);
+		return -ENOMEM;
+	}
+
+	adapdata->smba = smba;
+
+	snprintf(adap->name, sizeof(adap->name),
+		"SMBus NCT67xx adapter%s at %04x", name, smba);
+
+	i2c_set_adapdata(adap, adapdata);
+
+	retval = i2c_add_adapter(adap);
+	if (retval) {
+		kfree(adapdata);
+		kfree(adap);
+		return retval;
+	}
+
+	*padap = adap;
+	return 0;
+}
+
+static void nct6775_remove_adapter(struct i2c_adapter *adap)
+{
+	struct i2c_nct6775_adapdata *adapdata = i2c_get_adapdata(adap);
+
+	if (adapdata->smba) {
+		i2c_del_adapter(adap);
+		kfree(adapdata);
+		kfree(adap);
+	}
+}
+
+/*
+ * when Super-I/O functions move to a separate file, the Super-I/O
+ * bus will manage the lifetime of the device and this module will only keep
+ * track of the nct6775 driver. But since we use platform_device_alloc(), we
+ * must keep track of the device
+ */
+static struct platform_device *pdev[2];
+
+static int nct6775_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
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
+		nct6775_add_adapter(res->start, "", &nct6775_adapter);
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static struct platform_driver i2c_nct6775_driver = {
+	.driver = {
+		.name	= DRVNAME,
+	},
+	.probe		= nct6775_probe,
+};
+
+static void __exit i2c_nct6775_exit(void)
+{
+	int i;
+
+	if (nct6775_adapter)
+		nct6775_remove_adapter(nct6775_adapter);
+
+	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
+		if (pdev[i])
+			platform_device_unregister(pdev[i]);
+	}
+	platform_driver_unregister(&i2c_nct6775_driver);
+}
+
+/* nct6775_find() looks for a '627 in the Super-I/O config space */
+static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
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
+	case SIO_NCT6106_ID:
+		sio_data->kind = nct6106;
+		break;
+	case SIO_NCT6775_ID:
+		sio_data->kind = nct6775;
+		break;
+	case SIO_NCT6776_ID:
+		sio_data->kind = nct6776;
+		break;
+	case SIO_NCT6779_ID:
+		sio_data->kind = nct6779;
+		break;
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
+	superio_select(sioaddr, NCT6775_LD_SMBUS);
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
+		nct6775_sio_names[sio_data->kind], sioaddr, addr);
+	sio_data->sioreg = sioaddr;
+
+	return addr;
+}
+
+static int __init i2c_nct6775_init(void)
+{
+	int i, err;
+	bool found = false;
+	int address;
+	struct resource res;
+	struct nct6775_sio_data sio_data;
+	int sioaddr[2] = { 0x2e, 0x4e };
+
+	err = platform_driver_register(&i2c_nct6775_driver);
+	if (err)
+		return err;
+
+	/*
+	 * initialize sio_data->kind and sio_data->sioreg.
+	 *
+	 * when Super-I/O functions move to a separate file, the Super-I/O
+	 * driver will probe 0x2e and 0x4e and auto-detect the presence of a
+	 * nct6775 hardware monitor, and call probe()
+	 */
+	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
+		address = nct6775_find(sioaddr[i], &sio_data);
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
+					       sizeof(struct nct6775_sio_data));
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
+	platform_driver_unregister(&i2c_nct6775_driver);
+	return err;
+}
+
+MODULE_AUTHOR("Adam Honse <calcprogrammer1@gmail.com>");
+MODULE_DESCRIPTION("SMBus driver for NCT6775F and compatible chips");
+MODULE_LICENSE("GPL");
+
+module_init(i2c_nct6775_init);
+module_exit(i2c_nct6775_exit);
-- 
2.35.1

