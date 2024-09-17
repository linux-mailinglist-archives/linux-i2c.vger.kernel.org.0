Return-Path: <linux-i2c+bounces-6827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E25DE97B342
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 19:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AABB5284029
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 17:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6610185930;
	Tue, 17 Sep 2024 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="psUqnamy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3BF15B54F;
	Tue, 17 Sep 2024 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726592466; cv=none; b=GOag4orpcPhgj/rPbwA5P4lcewDVQuZdpH8X2byhry/wO+mrurqdK9XI6+Iz1wucXtiiyeKr8y/30kNWuQpI600xvULG7xnBLRsv0VcCNadsfw/etkQPvMVtTl5E/vm4ati8lXxWMC7V4E/mGC7oVOPMMPUFfEPgEYYTZsJDpYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726592466; c=relaxed/simple;
	bh=Qx+S7cPIUMM9E+JGKundoqOSXBtpQXYdLE89kZE28y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GOgBwUqPaAw1Ekkd/Ys1C0u9ygMSW6elBqMdzeVsyaEx2M86YsayWRIDFjLXVccXIwxeXOqcdASF8xKgpP7inH/SApHOa1kEtziYW9LNjZARZVGhR01Qj6kWeOzzE5t9JtNmhuQgI38IMboogG6s1e5jSCq9IKa+yNK+LOuPPwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=psUqnamy; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F784FF808;
	Tue, 17 Sep 2024 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726592456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OiFMsPFy1luhAVMXHet/ZGwFQRNXqJaAsTSKRLQYqBE=;
	b=psUqnamyCfwG7CISTS+/krmK3Iq+zFlVRKsdC85GATXGqJG6KKm8XokBbwJ3MdLicNdvzH
	lDJ7UOg2Yf/xKNsQBosDvD6G4RP7vfbd1/EgBXd2Qj5HSuWv5FL/gyQkfxf7B9CO/LLdTg
	wdgCSjnb4+E0fbC3NLec9edgy6GkA+ASDr1prwAlzgYOi8e8DKofnE+y0VQPiePve6WfB3
	xjOUFZQRLakegxF7s61G2KcqvP3TQO6SVV0sGvYLuqZBxWuBQXAPxbLFBW8emOyCIPvPg/
	lT2OwOgsNfkttNAqXxolBFIohtcbW3FUF9qTM67B94ppElQSjOunPGyU/zejAg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 17 Sep 2024 19:00:47 +0200
Subject: [PATCH v2 1/5] mfd: add Congatec Board Controller mfd driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-congatec-board-controller-v2-1-681511a01c8f@bootlin.com>
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Add core MFD driver for the Board Controller found on some Congatec SMARC
module. This Board Controller provides functions like watchdog, GPIO, and
I2C busses.

This commit adds support only for the conga-SA7 module.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/mfd/Kconfig      |  12 ++
 drivers/mfd/Makefile     |   1 +
 drivers/mfd/cgbc-core.c  | 411 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/cgbc.h |  44 +++++
 4 files changed, 468 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index bc8be2e593b6..3e0530f30267 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -224,6 +224,18 @@ config MFD_AXP20X_RSB
 	  components like regulators or the PEK (Power Enable Key) under the
 	  corresponding menus.
 
+config MFD_CGBC
+	tristate "Congatec Board Controller"
+	select MFD_CORE
+	depends on X86
+	help
+	  This is the core driver of the Board Controller found on some Congatec
+	  SMARC modules. The Board Controller provides functions like watchdog,
+	  I2C busses, and GPIO controller.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called cgbc-core.
+
 config MFD_CROS_EC_DEV
 	tristate "ChromeOS Embedded Controller multifunction device"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 02b651cd7535..d5da3fcd691c 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
 obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
 obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
+obj-$(CONFIG_MFD_CGBC)		+= cgbc-core.o
 obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
 obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
 obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
new file mode 100644
index 000000000000..93004a6b29c1
--- /dev/null
+++ b/drivers/mfd/cgbc-core.c
@@ -0,0 +1,411 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Congatec Board Controller core driver.
+ *
+ * The x86 Congatec modules have an embedded micro controller named Board
+ * Controller. This Board Controller has a Watchdog timer, some GPIOs, and two
+ * I2C busses.
+ *
+ * Copyright (C) 2024 Bootlin
+ *
+ * Author: Thomas Richard <thomas.richard@bootlin.com>
+ */
+
+#include <linux/dmi.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/cgbc.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+
+#define CGBC_IO_SESSION_BASE	0x0E20
+#define CGBC_IO_SESSION_END	0x0E30
+#define CGBC_IO_CMD_BASE	0x0E00
+#define CGBC_IO_CMD_END		0x0E10
+
+#define CGBC_MASK_STATUS	(BIT(6) | BIT(7))
+#define CGBC_MASK_DATA_COUNT	0x1F
+#define CGBC_MASK_ERROR_CODE	0x1F
+
+#define CGBC_STATUS_DATA_READY	0x00
+#define CGBC_STATUS_CMD_READY	BIT(6)
+#define CGBC_STATUS_ERROR	(BIT(6) | BIT(7))
+
+#define CGBC_SESSION_CMD		0x00
+#define CGBC_SESSION_CMD_IDLE		0x00
+#define CGBC_SESSION_CMD_REQUEST	0x01
+#define CGBC_SESSION_DATA		0x01
+#define CGBC_SESSION_STATUS		0x02
+#define CGBC_SESSION_STATUS_FREE	0x03
+#define CGBC_SESSION_ACCESS		0x04
+#define CGBC_SESSION_ACCESS_GAINED	0x00
+
+#define CGBC_SESSION_VALID_MIN  0x02
+#define CGBC_SESSION_VALID_MAX  0xFE
+
+#define CGBC_CMD_STROBE			0x00
+#define CGBC_CMD_INDEX			0x02
+#define CGBC_CMD_INDEX_CBM_MAN8		0x00
+#define CGBC_CMD_INDEX_CBM_AUTO32	0x03
+#define CGBC_CMD_DATA			0x04
+#define CGBC_CMD_ACCESS			0x0C
+
+#define CGBC_CMD_GET_FW_REV	0x21
+
+static struct platform_device *cgbc_pdev;
+
+/* Wait the Board Controller is ready to receive some session commands */
+static int cgbc_wait_device(struct cgbc_device_data *cgbc)
+{
+	u16 status;
+	int ret;
+
+	ret = readx_poll_timeout(ioread16, cgbc->io_session + CGBC_SESSION_STATUS, status,
+				 status == CGBC_SESSION_STATUS_FREE, 0, 500000);
+
+	if (ret || ioread32(cgbc->io_session + CGBC_SESSION_ACCESS))
+		ret = -ENODEV;
+
+	return ret;
+}
+
+static int cgbc_session_command(struct cgbc_device_data *cgbc, u8 cmd)
+{
+	int ret;
+	u8 val;
+
+	ret = readx_poll_timeout(ioread8, cgbc->io_session + CGBC_SESSION_CMD, val,
+				 val == CGBC_SESSION_CMD_IDLE, 0, 100000);
+	if (ret)
+		return ret;
+
+	iowrite8(cmd, cgbc->io_session + CGBC_SESSION_CMD);
+
+	ret = readx_poll_timeout(ioread8, cgbc->io_session + CGBC_SESSION_CMD, val,
+				 val == CGBC_SESSION_CMD_IDLE, 0, 100000);
+	if (ret)
+		return ret;
+
+	ret = (int)ioread8(cgbc->io_session + CGBC_SESSION_DATA);
+
+	iowrite8(CGBC_SESSION_STATUS_FREE, cgbc->io_session + CGBC_SESSION_STATUS);
+
+	return ret;
+}
+
+static int cgbc_session_request(struct cgbc_device_data *cgbc)
+{
+	unsigned int ret;
+
+	ret = cgbc_wait_device(cgbc);
+
+	if (ret)
+		return dev_err_probe(cgbc->dev, ret, "device not found or not ready\n");
+
+	cgbc->session = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
+
+	/* The Board Controller sent us a wrong session handle, we cannot communicate with it */
+	if (cgbc->session < CGBC_SESSION_VALID_MIN || cgbc->session > CGBC_SESSION_VALID_MAX)
+		return dev_err_probe(cgbc->dev, -ECONNREFUSED,
+				     "failed to get a valid session handle\n");
+
+	return 0;
+}
+
+static void cgbc_session_release(struct cgbc_device_data *cgbc)
+{
+	if (cgbc_session_command(cgbc, cgbc->session) != cgbc->session)
+		dev_warn(cgbc->dev, "failed to release session\n");
+}
+
+static bool cgbc_command_lock(struct cgbc_device_data *cgbc)
+{
+	iowrite8(cgbc->session, cgbc->io_cmd + CGBC_CMD_ACCESS);
+
+	return ioread8(cgbc->io_cmd + CGBC_CMD_ACCESS) == cgbc->session;
+}
+
+static void cgbc_command_unlock(struct cgbc_device_data *cgbc)
+{
+	iowrite8(cgbc->session, cgbc->io_cmd + CGBC_CMD_ACCESS);
+}
+
+int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size, void *data,
+		 unsigned int data_size, u8 *status)
+{
+	u8 checksum = 0, data_checksum = 0, istatus = 0, val;
+	u8 *_data = (u8 *)data;
+	u8 *_cmd = (u8 *)cmd;
+	int mode_change = -1;
+	bool lock;
+	int ret, i;
+
+	mutex_lock(&cgbc->lock);
+
+	/* Request access */
+	ret = readx_poll_timeout(cgbc_command_lock, cgbc, lock, lock, 0, 100000);
+	if (ret)
+		goto out;
+
+	/* Wait board controller is ready */
+	ret = readx_poll_timeout(ioread8, cgbc->io_cmd + CGBC_CMD_STROBE, val,
+				 val == CGBC_CMD_STROBE, 0, 100000);
+	if (ret)
+		goto release;
+
+	/* Write command packet */
+	if (cmd_size <= 2) {
+		iowrite8(CGBC_CMD_INDEX_CBM_MAN8, cgbc->io_cmd + CGBC_CMD_INDEX);
+	} else {
+		iowrite8(CGBC_CMD_INDEX_CBM_AUTO32, cgbc->io_cmd + CGBC_CMD_INDEX);
+		if ((cmd_size % 4) != 0x03)
+			mode_change = (cmd_size & 0xFFFC) - 1;
+	}
+
+	for (i = 0; i < cmd_size; i++) {
+		iowrite8(_cmd[i], cgbc->io_cmd + CGBC_CMD_DATA + (i % 4));
+		checksum ^= _cmd[i];
+		if (mode_change == i)
+			iowrite8((i + 1) | CGBC_CMD_INDEX_CBM_MAN8, cgbc->io_cmd + CGBC_CMD_INDEX);
+	}
+
+	/* Append checksum byte */
+	iowrite8(checksum, cgbc->io_cmd + CGBC_CMD_DATA + (i % 4));
+
+	/* Perform command strobe */
+	iowrite8(cgbc->session, cgbc->io_cmd + CGBC_CMD_STROBE);
+
+	/* Rewind cmd buffer index */
+	iowrite8(CGBC_CMD_INDEX_CBM_AUTO32, cgbc->io_cmd + CGBC_CMD_INDEX);
+
+	/* Wait command completion */
+	ret = read_poll_timeout(ioread8, val, val == CGBC_CMD_STROBE, 0, 100000, false,
+				cgbc->io_cmd + CGBC_CMD_STROBE);
+	if (ret)
+		goto release;
+
+	istatus = ioread8(cgbc->io_cmd + CGBC_CMD_DATA);
+	checksum = istatus;
+
+	/* Check command status */
+	switch (istatus & CGBC_MASK_STATUS) {
+	case CGBC_STATUS_DATA_READY:
+		if (istatus > data_size)
+			istatus = data_size;
+		for (i = 0; i < istatus; i++) {
+			_data[i] = ioread8(cgbc->io_cmd + CGBC_CMD_DATA + ((i + 1) % 4));
+			checksum ^= _data[i];
+		}
+		data_checksum = ioread8(cgbc->io_cmd + CGBC_CMD_DATA + ((i + 1) % 4));
+		istatus &= CGBC_MASK_DATA_COUNT;
+		break;
+	case CGBC_STATUS_ERROR:
+	case CGBC_STATUS_CMD_READY:
+		data_checksum = ioread8(cgbc->io_cmd + CGBC_CMD_DATA + 1);
+		if ((istatus & CGBC_MASK_STATUS) == CGBC_STATUS_ERROR)
+			ret = -EIO;
+		istatus = istatus & CGBC_MASK_ERROR_CODE;
+		break;
+	default:
+		data_checksum = ioread8(cgbc->io_cmd + CGBC_CMD_DATA + 1);
+		istatus &= CGBC_MASK_ERROR_CODE;
+		ret = -EIO;
+		break;
+	}
+
+	/* Checksum verification */
+	if (ret == 0 && data_checksum != checksum)
+		ret = -EIO;
+
+release:
+	cgbc_command_unlock(cgbc);
+
+out:
+	mutex_unlock(&cgbc->lock);
+
+	if (status)
+		*status = istatus;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cgbc_command);
+
+static struct mfd_cell cgbc_devs[] = {
+	{ .name = "cgbc-wdt"	},
+	{ .name = "cgbc-gpio"	},
+	{ .name = "cgbc-i2c", .id = 1 },
+	{ .name = "cgbc-i2c", .id = 2 },
+};
+
+static int cgbc_map(struct cgbc_device_data *cgbc)
+{
+	struct device *dev = cgbc->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *ioport;
+
+	ioport = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!ioport)
+		return -EINVAL;
+
+	cgbc->io_session = devm_ioport_map(dev, ioport->start, resource_size(ioport));
+	if (!cgbc->io_session)
+		return -ENOMEM;
+
+	ioport = platform_get_resource(pdev, IORESOURCE_IO, 1);
+	if (!ioport)
+		return -EINVAL;
+
+	cgbc->io_cmd = devm_ioport_map(dev, ioport->start, resource_size(ioport));
+	if (!cgbc->io_cmd)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static const struct resource cgbc_resources[] = {
+	{
+		.start  = CGBC_IO_SESSION_BASE,
+		.end    = CGBC_IO_SESSION_END,
+		.flags  = IORESOURCE_IO,
+	},
+	{
+		.start  = CGBC_IO_CMD_BASE,
+		.end    = CGBC_IO_CMD_END,
+		.flags  = IORESOURCE_IO,
+	},
+};
+
+static ssize_t cgbc_version_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct cgbc_device_data *cgbc = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "CGBCP%c%c%c\n", cgbc->version.feature, cgbc->version.major,
+			  cgbc->version.minor);
+}
+
+static DEVICE_ATTR_RO(cgbc_version);
+
+static struct attribute *cgbc_attrs[] = {
+	&dev_attr_cgbc_version.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(cgbc);
+
+static int cgbc_get_version(struct cgbc_device_data *cgbc)
+{
+	u8 cmd = CGBC_CMD_GET_FW_REV;
+	u8 data[4];
+	int ret;
+
+	ret = cgbc_command(cgbc, &cmd, 1, &data, sizeof(data), NULL);
+	if (ret)
+		return ret;
+
+	cgbc->version.feature = data[0];
+	cgbc->version.major = data[1];
+	cgbc->version.minor = data[2];
+
+	return 0;
+}
+
+static int cgbc_init_device(struct cgbc_device_data *cgbc)
+{
+	int ret;
+
+	ret = cgbc_session_request(cgbc);
+	if (ret)
+		return ret;
+
+	ret = cgbc_get_version(cgbc);
+	if (ret)
+		return ret;
+
+	return mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs), NULL, 0, NULL);
+}
+
+static int cgbc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cgbc_device_data *cgbc;
+	int ret;
+
+	cgbc = devm_kzalloc(dev, sizeof(*cgbc), GFP_KERNEL);
+	if (!cgbc)
+		return -ENOMEM;
+
+	cgbc->dev = dev;
+
+	ret = cgbc_map(cgbc);
+	if (ret)
+		return ret;
+
+	mutex_init(&cgbc->lock);
+
+	platform_set_drvdata(pdev, cgbc);
+
+	return cgbc_init_device(cgbc);
+}
+
+static void cgbc_remove(struct platform_device *pdev)
+{
+	struct cgbc_device_data *cgbc = platform_get_drvdata(pdev);
+
+	cgbc_session_release(cgbc);
+
+	mfd_remove_devices(&pdev->dev);
+}
+
+static struct platform_driver cgbc_driver = {
+	.driver		= {
+		.name		= "cgbc",
+		.dev_groups	= cgbc_groups,
+	},
+	.probe		= cgbc_probe,
+	.remove_new	= cgbc_remove,
+};
+
+static const struct dmi_system_id cgbc_dmi_table[] __initconst = {
+	{
+		.ident = "SA7",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "congatec"),
+			DMI_MATCH(DMI_BOARD_NAME, "conga-SA7"),
+		},
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, cgbc_dmi_table);
+
+static int __init cgbc_init(void)
+{
+	const struct dmi_system_id *id;
+	int ret = -ENODEV;
+
+	id = dmi_first_match(cgbc_dmi_table);
+	if (IS_ERR_OR_NULL(id))
+		return ret;
+
+	cgbc_pdev = platform_device_register_simple("cgbc", PLATFORM_DEVID_NONE, cgbc_resources,
+						    ARRAY_SIZE(cgbc_resources));
+	if (IS_ERR(cgbc_pdev))
+		return PTR_ERR(cgbc_pdev);
+
+	return platform_driver_register(&cgbc_driver);
+}
+
+static void __exit cgbc_exit(void)
+{
+	platform_device_unregister(cgbc_pdev);
+	platform_driver_unregister(&cgbc_driver);
+}
+
+module_init(cgbc_init);
+module_exit(cgbc_exit);
+
+MODULE_DESCRIPTION("Congatec Board Controller Core Driver");
+MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:cgbc-core");
diff --git a/include/linux/mfd/cgbc.h b/include/linux/mfd/cgbc.h
new file mode 100644
index 000000000000..badbec4c7033
--- /dev/null
+++ b/include/linux/mfd/cgbc.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Congatec Board Controller driver definitions
+ *
+ * Copyright (C) 2024 Bootlin
+ * Author: Thomas Richard <thomas.richard@bootlin.com>
+ */
+
+#ifndef _LINUX_MFD_CGBC_H_
+
+/**
+ * struct cgbc_version - Board Controller device version structure
+ * @feature:	Board Controller feature number
+ * @major:	Board Controller major revision
+ * @minor:	Board Controller minor revision
+ */
+struct cgbc_version {
+	unsigned char feature;
+	unsigned char major;
+	unsigned char minor;
+};
+
+/**
+ * struct cgbc_device_data - Internal representation of the Board Controller device
+ * @io_session:		Pointer to the session IO memory
+ * @io_cmd:		Pointer to the command IO memory
+ * @session:		Session id returned by the Board Controller
+ * @dev:		Pointer to kernel device structure
+ * @cgbc_version:	Board Controller version structure
+ * @mutex:		Board Controller mutex
+ */
+struct cgbc_device_data {
+	void __iomem		*io_session;
+	void __iomem		*io_cmd;
+	u8			session;
+	struct device		*dev;
+	struct cgbc_version	version;
+	struct mutex		lock;
+};
+
+int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size,
+		 void *data, unsigned int data_size, u8 *status);
+
+#endif /*_LINUX_MFD_CGBC_H_*/

-- 
2.39.5


