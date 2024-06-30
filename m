Return-Path: <linux-i2c+bounces-4509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4A91D3C7
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jun 2024 22:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 683581C20941
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jun 2024 20:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC4F4502B;
	Sun, 30 Jun 2024 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="T3FuVU2+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx18lb.world4you.com (mx18lb.world4you.com [81.19.149.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970B3200C1
	for <linux-i2c@vger.kernel.org>; Sun, 30 Jun 2024 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719778593; cv=none; b=cZoN2UQxCAi05fcvhwQSezH5aeTwDS0PZ5c00LuML9umIG6icxOvRLsU7PUL01Vneeap9GnLFTq7Kq4MTblZY5zmS31zGmFfH8Iu+wWI3hDcdBuuROWIe+rIis1X/pliQkbuUJDi271kN798N108BIeOqm0b3iNe73QU8+3YfRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719778593; c=relaxed/simple;
	bh=42jng3RuSmD0D8JGf7YMMAOCW6YIP5iy+knh7hoSxTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WA2BbkWs5FtJdITKmLQesELdHjYoztVKGVuK23n+L74OkaWSh3rFOHgZ4UykRYFaqEayWefT5a8nMc8vKt/6zMq/qCLCudiSNaKq63QGaeTkJkaIrfDg+2yJ+ouxXCRw9QlnW0dv0jIlrogTOsyKXnFhu0pc6xH1Ssu9P+VBcAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=T3FuVU2+; arc=none smtp.client-ip=81.19.149.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GP8bgRvtVXL7sZ2Xg4he0VT5zFrPQIlIa7/rROvBzFU=; b=T3FuVU2+L5RgYxRREfogiqCDYS
	Z184VmNm64y7ZLgnumZ0WbbJuBF2umw/VcqMvx7r/gj7r1hER/rtQRAJV/XVDXWd2yI2ASUbQp/CK
	JaGeTh9LElqtnvvtUZfI2xBZeIUhY6oabwh0qvd5yMjv04rp2BaBdhwkbzYS3IAYcFSU=;
Received: from 88-117-61-57.adsl.highway.telekom.at ([88.117.61.57] helo=hornet.engleder.at)
	by mx18lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sO0Wb-0004cO-2x;
	Sun, 30 Jun 2024 21:47:50 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Gerhard Engleder <eg@keba.com>
Subject: [PATCH v2 1/2] misc: keba: Add basic KEBA CP500 system FPGA support
Date: Sun, 30 Jun 2024 21:47:39 +0200
Message-Id: <20240630194740.7137-2-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240630194740.7137-1-gerhard@engleder-embedded.com>
References: <20240630194740.7137-1-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes
X-ACL-Warn: X-W4Y-Internal

From: Gerhard Engleder <eg@keba.com>

The KEBA CP500 system FPGA is a PCIe device, which consists of multiple
IP cores. Every IP core has its own auxiliary driver. The cp500 driver
registers an auxiliary device for each device and the corresponding
drivers are loaded by the Linux driver infrastructure.

Currently 3 variants of this device exists. Every variant has its own
PCI device ID, which is used to determine the list of available IP
cores. In this first version only the auxiliary device for the I2C
controller is registered.

Besides the auxiliary device registration some other basic functions of
the FPGA are implemented; e.g, FPGA version sysfs file, keep FPGA
configuration on reset sysfs file, error message for errors on the
internal AXI bus of the FPGA.

Signed-off-by: Gerhard Engleder <eg@keba.com>
---
 .../ABI/stable/sysfs-driver-misc-cp500        |  25 +
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/keba/Kconfig                     |  12 +
 drivers/misc/keba/Makefile                    |   3 +
 drivers/misc/keba/cp500.c                     | 458 ++++++++++++++++++
 include/linux/misc/keba.h                     |  25 +
 7 files changed, 525 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-misc-cp500
 create mode 100644 drivers/misc/keba/Kconfig
 create mode 100644 drivers/misc/keba/Makefile
 create mode 100644 drivers/misc/keba/cp500.c
 create mode 100644 include/linux/misc/keba.h

diff --git a/Documentation/ABI/stable/sysfs-driver-misc-cp500 b/Documentation/ABI/stable/sysfs-driver-misc-cp500
new file mode 100644
index 000000000000..525bd18a2db4
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-misc-cp500
@@ -0,0 +1,25 @@
+What:		/sys/devices/pciXXXX:XX/0000:XX:XX.X/0000:XX:XX.X/version
+Date:		June 2024
+KernelVersion:	6.11
+Contact:	Gerhard Engleder <eg@keba.com>
+Description:	Version of the FPGA configuration bitstream as printable string.
+		This file is read only.
+Users:		KEBA
+
+What:		/sys/devices/pciXXXX:XX/0000:XX:XX.X/0000:XX:XX.X/keep_cfg
+Date:		June 2024
+KernelVersion:	6.11
+Contact:	Gerhard Engleder <eg@keba.com>
+Description:	Flag which signals if FPGA shall keep or reload configuration
+		bitstream on reset. Normal FPGA behavior and default is to keep
+		configuration bitstream and to only reset the configured logic.
+
+		Reloading configuration on reset enables an update of the
+		configuration bitstream with a simple reboot. Otherwise it is
+		necessary to power cycle the device to reload the new
+		configuration bitstream.
+
+		This file is read/write. The values are as follows:
+		1 = keep configuration bitstream on reset, default
+		0 = reload configuration bitstream on reset
+Users:		KEBA
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index faf983680040..ca0c6a728a00 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -602,4 +602,5 @@ source "drivers/misc/cardreader/Kconfig"
 source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
+source "drivers/misc/keba/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 153a3f4837e8..af125aa25a50 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -69,3 +69,4 @@ obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
 obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
 obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
+obj-y				+= keba/
diff --git a/drivers/misc/keba/Kconfig b/drivers/misc/keba/Kconfig
new file mode 100644
index 000000000000..0ebca1d07ef4
--- /dev/null
+++ b/drivers/misc/keba/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+config KEBA_CP500
+	tristate "KEBA CP500 system FPGA support"
+	depends on PCI
+	help
+	  This driver supports the KEBA CP500 system FPGA, which is used in
+	  KEBA CP500 devices. It registers all sub devices present on the CP500
+	  system FPGA as separate devices. A driver is needed for each sub
+	  device.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called cp500.
diff --git a/drivers/misc/keba/Makefile b/drivers/misc/keba/Makefile
new file mode 100644
index 000000000000..0a8b846cda7d
--- /dev/null
+++ b/drivers/misc/keba/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_KEBA_CP500)	+= cp500.o
diff --git a/drivers/misc/keba/cp500.c b/drivers/misc/keba/cp500.c
new file mode 100644
index 000000000000..9ba46f0f9392
--- /dev/null
+++ b/drivers/misc/keba/cp500.c
@@ -0,0 +1,458 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) KEBA Industrial Automation Gmbh 2024
+ *
+ * Driver for KEBA system FPGA
+ *
+ * The KEBA system FPGA implements various devices. This driver registers
+ * auxiliary devices for every device within the FPGA.
+ */
+
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/misc/keba.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#define CP500 "cp500"
+
+#define PCI_VENDOR_ID_KEBA		0xCEBA
+#define PCI_DEVICE_ID_KEBA_CP035	0x2706
+#define PCI_DEVICE_ID_KEBA_CP505	0x2703
+#define PCI_DEVICE_ID_KEBA_CP520	0x2696
+
+#define CP500_SYS_BAR		0
+#define CP500_ECM_BAR		1
+
+/* BAR 0 registers */
+#define CP500_VERSION_REG	0x00
+#define CP500_RECONFIG_REG	0x11	/* upper 8-bits of STARTUP register */
+#define CP500_AXI_REG		0x40
+
+/* Bits in BUILD_REG */
+#define CP500_BUILD_TEST        0x8000	/* FPGA test version */
+
+/* Bits in RECONFIG_REG */
+#define CP500_RECFG_REQ		0x01	/* reconfigure FPGA on next reset */
+
+/* MSIX */
+#define CP500_AXI_MSIX		3
+#define CP500_NUM_MSIX		8
+#define CP500_NUM_MSIX_NO_MMI	2
+#define CP500_NUM_MSIX_NO_AXI	3
+
+/* EEPROM */
+#define CP500_HW_CPU_EEPROM_NAME	"cp500_cpu_eeprom"
+
+#define CP500_IS_CP035(dev)	((dev)->pci_dev->device == PCI_DEVICE_ID_KEBA_CP035)
+#define CP500_IS_CP505(dev)	((dev)->pci_dev->device == PCI_DEVICE_ID_KEBA_CP505)
+#define CP500_IS_CP520(dev)	((dev)->pci_dev->device == PCI_DEVICE_ID_KEBA_CP520)
+
+struct cp500_dev_info {
+	off_t offset;
+	size_t size;
+};
+
+struct cp500_devs {
+	struct cp500_dev_info startup;
+	struct cp500_dev_info i2c;
+};
+
+/* list of devices within FPGA of CP035 family (CP035, CP056, CP057) */
+static struct cp500_devs cp035_devices = {
+	.startup   = { 0x0000, SZ_4K },
+	.i2c       = { 0x4000, SZ_4K },
+};
+
+/* list of devices within FPGA of CP505 family (CP503, CP505, CP507) */
+static struct cp500_devs cp505_devices = {
+	.startup   = { 0x0000, SZ_4K },
+	.i2c       = { 0x5000, SZ_4K },
+};
+
+/* list of devices within FPGA of CP520 family (CP520, CP530) */
+static struct cp500_devs cp520_devices = {
+	.startup     = { 0x0000, SZ_4K },
+	.i2c         = { 0x5000, SZ_4K },
+};
+
+struct cp500 {
+	struct pci_dev *pci_dev;
+	struct cp500_devs *devs;
+	int msix_num;
+	struct {
+		int major;
+		int minor;
+		int build;
+	} version;
+
+	/* system FPGA BAR */
+	resource_size_t sys_hwbase;
+	struct keba_i2c_auxdev *i2c;
+
+	/* ECM EtherCAT BAR */
+	resource_size_t ecm_hwbase;
+
+	void __iomem *system_startup_addr;
+};
+
+/* I2C devices */
+static struct i2c_board_info cp500_i2c_info[] = {
+	{	/* temperature sensor */
+		I2C_BOARD_INFO("emc1403", 0x4c),
+	},
+	{	/*
+		 * CPU EEPROM
+		 * CP035 family: CPU board
+		 * CP505 family: bridge board
+		 * CP520 family: carrier board
+		 */
+		I2C_BOARD_INFO("24c32", 0x50),
+		.dev_name = CP500_HW_CPU_EEPROM_NAME,
+	},
+	{	/* interface board EEPROM */
+		I2C_BOARD_INFO("24c32", 0x51),
+	},
+	{	/*
+		 * EEPROM (optional)
+		 * CP505 family: CPU board
+		 * CP520 family: MMI board
+		 */
+		I2C_BOARD_INFO("24c32", 0x52),
+	},
+	{	/* extension module 0 EEPROM (optional) */
+		I2C_BOARD_INFO("24c32", 0x53),
+	},
+	{	/* extension module 1 EEPROM (optional) */
+		I2C_BOARD_INFO("24c32", 0x54),
+	},
+	{	/* extension module 2 EEPROM (optional) */
+		I2C_BOARD_INFO("24c32", 0x55),
+	},
+	{	/* extension module 3 EEPROM (optional) */
+		I2C_BOARD_INFO("24c32", 0x56),
+	}
+};
+
+static ssize_t cp500_get_fpga_version(struct cp500 *cp500, char *buf,
+				      size_t max_len)
+{
+	int n;
+
+	if (CP500_IS_CP035(cp500))
+		n = scnprintf(buf, max_len, "CP035");
+	else if (CP500_IS_CP505(cp500))
+		n = scnprintf(buf, max_len, "CP505");
+	else
+		n = scnprintf(buf, max_len, "CP500");
+
+	n += scnprintf(buf + n, max_len - n, "_FPGA_%d.%02d",
+		       cp500->version.major, cp500->version.minor);
+
+	/* test versions have test bit set */
+	if (cp500->version.build & CP500_BUILD_TEST)
+		n += scnprintf(buf + n, max_len - n, "Test%d",
+			       cp500->version.build & ~CP500_BUILD_TEST);
+
+	n += scnprintf(buf + n, max_len - n, "\n");
+
+	return n;
+}
+
+static ssize_t version_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct cp500 *cp500 = dev_get_drvdata(dev);
+
+	return cp500_get_fpga_version(cp500, buf, PAGE_SIZE);
+}
+static DEVICE_ATTR_RO(version);
+
+static ssize_t keep_cfg_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct cp500 *cp500 = dev_get_drvdata(dev);
+	unsigned long keep_cfg = 1;
+
+	/*
+	 * FPGA configuration stream is kept during reset when RECONFIG bit is
+	 * zero
+	 */
+	if (ioread8(cp500->system_startup_addr + CP500_RECONFIG_REG) &
+		CP500_RECFG_REQ)
+		keep_cfg = 0;
+
+	return sysfs_emit(buf, "%lu\n", keep_cfg);
+}
+
+static ssize_t keep_cfg_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct cp500 *cp500 = dev_get_drvdata(dev);
+	unsigned long keep_cfg;
+
+	if (kstrtoul(buf, 10, &keep_cfg) < 0)
+		return -EINVAL;
+
+	/*
+	 * In normal operation "keep_cfg" is "1". This means that the FPGA keeps
+	 * its configuration stream during a reset.
+	 * In case of a firmware update of the FPGA, the configuration stream
+	 * needs to be reloaded. This can be done without a powercycle by
+	 * writing a "0" into the "keep_cfg" attribute. After a reset/reboot th
+	 * new configuration stream will be loaded.
+	 */
+	if (keep_cfg)
+		iowrite8(0, cp500->system_startup_addr + CP500_RECONFIG_REG);
+	else
+		iowrite8(CP500_RECFG_REQ,
+			 cp500->system_startup_addr + CP500_RECONFIG_REG);
+
+	return count;
+}
+static DEVICE_ATTR_RW(keep_cfg);
+
+static struct attribute *attrs[] = {
+	&dev_attr_version.attr,
+	&dev_attr_keep_cfg.attr,
+	NULL
+};
+static const struct attribute_group attrs_group = { .attrs = attrs };
+
+static void cp500_i2c_release(struct device *dev)
+{
+	struct keba_i2c_auxdev *i2c =
+		container_of(dev, struct keba_i2c_auxdev, auxdev.dev);
+
+	kfree(i2c);
+}
+
+static int cp500_register_i2c(struct cp500 *cp500)
+{
+	int retval;
+
+	cp500->i2c = kzalloc(sizeof(*cp500->i2c), GFP_KERNEL);
+	if (!cp500->i2c)
+		return -ENOMEM;
+
+	cp500->i2c->auxdev.name = "i2c";
+	cp500->i2c->auxdev.id = 0;
+	cp500->i2c->auxdev.dev.release = cp500_i2c_release;
+	cp500->i2c->auxdev.dev.parent = &cp500->pci_dev->dev;
+	cp500->i2c->io = (struct resource) {
+		 /* I2C register area */
+		 .start = (resource_size_t) cp500->sys_hwbase +
+			  cp500->devs->i2c.offset,
+		 .end   = (resource_size_t) cp500->sys_hwbase +
+			  cp500->devs->i2c.offset +
+			  cp500->devs->i2c.size - 1,
+		 .flags = IORESOURCE_MEM,
+	};
+	cp500->i2c->info_size = ARRAY_SIZE(cp500_i2c_info);
+	cp500->i2c->info = cp500_i2c_info;
+
+	retval = auxiliary_device_init(&cp500->i2c->auxdev);
+	if (retval) {
+		kfree(cp500->i2c);
+		cp500->i2c = NULL;
+
+		return retval;
+	}
+	retval = __auxiliary_device_add(&cp500->i2c->auxdev, "keba");
+	if (retval) {
+		auxiliary_device_uninit(&cp500->i2c->auxdev);
+		cp500->i2c = NULL;
+
+		return retval;
+	}
+
+	return 0;
+}
+
+static void cp500_register_auxiliary_devs(struct cp500 *cp500)
+{
+	struct device *dev = &cp500->pci_dev->dev;
+
+	if (cp500_register_i2c(cp500))
+		dev_warn(dev, "Failed to register i2c!\n");
+}
+
+static void cp500_unregister_dev(struct auxiliary_device *auxdev)
+{
+	auxiliary_device_delete(auxdev);
+	auxiliary_device_uninit(auxdev);
+}
+
+static void cp500_unregister_auxiliary_devs(struct cp500 *cp500)
+{
+
+	if (cp500->i2c) {
+		cp500_unregister_dev(&cp500->i2c->auxdev);
+		cp500->i2c = NULL;
+	}
+}
+
+static irqreturn_t cp500_axi_handler(int irq, void *dev)
+{
+	struct cp500 *cp500 = dev;
+	u32 axi_address = ioread32(cp500->system_startup_addr + CP500_AXI_REG);
+
+	/*
+	 * FPGA signals AXI response error, print AXI address to indicate which
+	 * IP core was affected
+	 */
+	dev_err(&cp500->pci_dev->dev, "AXI response error at 0x%08x\n",
+		axi_address);
+
+	return IRQ_HANDLED;
+}
+
+static int cp500_enable(struct cp500 *cp500)
+{
+	int axi_irq = -1;
+	int ret;
+
+	if (cp500->msix_num > CP500_NUM_MSIX_NO_AXI) {
+		axi_irq = pci_irq_vector(cp500->pci_dev, CP500_AXI_MSIX);
+		ret = request_irq(axi_irq, cp500_axi_handler, 0,
+				  CP500, cp500);
+		if (ret != 0) {
+			dev_err(&cp500->pci_dev->dev,
+				"Failed to register AXI response error!\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void cp500_disable(struct cp500 *cp500)
+{
+	int axi_irq;
+
+	if (cp500->msix_num > CP500_NUM_MSIX_NO_AXI) {
+		axi_irq = pci_irq_vector(cp500->pci_dev, CP500_AXI_MSIX);
+		free_irq(axi_irq, cp500);
+	}
+}
+
+static int cp500_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
+{
+	struct device *dev = &pci_dev->dev;
+	struct resource startup;
+	struct cp500 *cp500;
+	u32 cp500_vers;
+	char buf[64];
+	int ret;
+
+	cp500 = devm_kzalloc(dev, sizeof(*cp500), GFP_KERNEL);
+	if (!cp500)
+		return -ENOMEM;
+	cp500->pci_dev = pci_dev;
+	cp500->sys_hwbase = pci_resource_start(pci_dev, CP500_SYS_BAR);
+	cp500->ecm_hwbase = pci_resource_start(pci_dev, CP500_ECM_BAR);
+	if (!cp500->sys_hwbase || !cp500->ecm_hwbase)
+		return -ENODEV;
+
+	if (CP500_IS_CP035(cp500))
+		cp500->devs = &cp035_devices;
+	else if (CP500_IS_CP505(cp500))
+		cp500->devs = &cp505_devices;
+	else if (CP500_IS_CP520(cp500))
+		cp500->devs = &cp520_devices;
+	else
+		return -ENODEV;
+
+	ret = pci_enable_device(pci_dev);
+	if (ret)
+		return ret;
+	pci_set_master(pci_dev);
+
+	startup = *pci_resource_n(pci_dev, CP500_SYS_BAR);
+	startup.end = startup.start + cp500->devs->startup.size - 1;
+	cp500->system_startup_addr = devm_ioremap_resource(&pci_dev->dev,
+							   &startup);
+	if (IS_ERR(cp500->system_startup_addr)) {
+		ret = PTR_ERR(cp500->system_startup_addr);
+		goto out_disable;
+	}
+
+	cp500->msix_num = pci_alloc_irq_vectors(pci_dev, CP500_NUM_MSIX_NO_MMI,
+						CP500_NUM_MSIX, PCI_IRQ_MSIX);
+	if (cp500->msix_num < CP500_NUM_MSIX_NO_MMI) {
+		dev_err(&pci_dev->dev,
+			"Hardware does not support enough MSI-X interrupts\n");
+		ret = -ENODEV;
+		goto out_disable;
+	}
+
+	cp500_vers = ioread32(cp500->system_startup_addr + CP500_VERSION_REG);
+	cp500->version.major = (cp500_vers & 0xff);
+	cp500->version.minor = (cp500_vers >> 8) & 0xff;
+	cp500->version.build = (cp500_vers >> 16) & 0xffff;
+	cp500_get_fpga_version(cp500, buf, sizeof(buf));
+
+	dev_info(&pci_dev->dev, "FPGA version %s", buf);
+
+	pci_set_drvdata(pci_dev, cp500);
+
+	ret = sysfs_create_group(&pci_dev->dev.kobj, &attrs_group);
+	if (ret != 0)
+		goto out_free_irq;
+
+	ret = cp500_enable(cp500);
+	if (ret != 0)
+		goto out_remove_group;
+
+	cp500_register_auxiliary_devs(cp500);
+
+	return 0;
+
+out_remove_group:
+	sysfs_remove_group(&pci_dev->dev.kobj, &attrs_group);
+out_free_irq:
+	pci_free_irq_vectors(pci_dev);
+out_disable:
+	pci_clear_master(pci_dev);
+	pci_disable_device(pci_dev);
+
+	return ret;
+}
+
+static void cp500_remove(struct pci_dev *pci_dev)
+{
+	struct cp500 *cp500 = pci_get_drvdata(pci_dev);
+
+	cp500_unregister_auxiliary_devs(cp500);
+
+	cp500_disable(cp500);
+
+	sysfs_remove_group(&pci_dev->dev.kobj, &attrs_group);
+
+	pci_set_drvdata(pci_dev, 0);
+
+	pci_free_irq_vectors(pci_dev);
+
+	pci_clear_master(pci_dev);
+	pci_disable_device(pci_dev);
+}
+
+static struct pci_device_id cp500_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_KEBA, PCI_DEVICE_ID_KEBA_CP035) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_KEBA, PCI_DEVICE_ID_KEBA_CP505) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_KEBA, PCI_DEVICE_ID_KEBA_CP520) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, cp500_ids);
+
+static struct pci_driver cp500_driver = {
+	.name = CP500,
+	.id_table = cp500_ids,
+	.probe = cp500_probe,
+	.remove = cp500_remove,
+};
+module_pci_driver(cp500_driver);
+
+MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
+MODULE_DESCRIPTION("KEBA CP500 system FPGA driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/misc/keba.h b/include/linux/misc/keba.h
new file mode 100644
index 000000000000..323b31a847c5
--- /dev/null
+++ b/include/linux/misc/keba.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2024, KEBA Industrial Automation Gmbh */
+
+#ifndef _LINUX_MISC_KEBA_H
+#define _LINUX_MISC_KEBA_H
+
+#include <linux/auxiliary_bus.h>
+
+struct i2c_board_info;
+
+/**
+ * struct keba_i2c_auxdev - KEBA I2C auxiliary device
+ * @auxdev: auxiliary device object
+ * @io: address range of I2C controller IO memory
+ * @info_size: number of I2C devices to be probed
+ * @info: I2C devices to be probed
+ */
+struct keba_i2c_auxdev {
+	struct auxiliary_device auxdev;
+	struct resource io;
+	int info_size;
+	struct i2c_board_info *info;
+};
+
+#endif /* _LINUX_MISC_KEBA_H */
-- 
2.39.2


