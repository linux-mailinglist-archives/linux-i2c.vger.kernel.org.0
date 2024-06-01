Return-Path: <linux-i2c+bounces-3737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F168D71BF
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 22:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFB282824B9
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 20:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5994618AEA;
	Sat,  1 Jun 2024 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="eSubRvU2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx02lb.world4you.com (mx02lb.world4you.com [81.19.149.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38BA12B89
	for <linux-i2c@vger.kernel.org>; Sat,  1 Jun 2024 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717272227; cv=none; b=kBt/oNIvt1kQoxKDaLBSCFiAUY3t8Pglz8jhEH4ewdQJVWlRrDlfLdEw3APZt5unj/c7+QlS/r7ZtJc79VwM0AFJzRYUQtmIhEMNavtf5oPgXVqUE3Ccd2LR4VhrmeLPQdQJIJwXzG1i8BGpybxcvjBFK90JZGpwzf8GRzqyqSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717272227; c=relaxed/simple;
	bh=5c3+e4FcJ5193c+9GUGRscr6rnvWQVvbymjmq+s9pGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ouVIcqKOtK836QEQ609WF3rUVmfG79XvX/Js7rVOLEBLt3OMpEEylw/YV5Wbwp7+9vs1df2gycoIH5xO/vbzbVIc7PsT7Ln92QSMT2mopx4AqyYRa9sFmT0Z1aJYa4fxBaHBAYUoCyGQUTcDCYZjbWclu12D3zUDkMvlCAfrees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=eSubRvU2; arc=none smtp.client-ip=81.19.149.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=shp0wF5VkQLvKCO0dNkTIqNkxZOFvfCWbRRJ7rEdsZA=; b=eSubRvU2gluXEYsA2rXKmqfjiM
	Qd2bS5rT15F5QogImyD/AyEcnANBbCpbLb+tCi72w0asyjW31h7K0kZ+MHyZR3y3L4Mi2O4KgyfPC
	ky05K9jRLvozz5GiMVc8g5cktg78EVaGMo5xxt/H7CjPT0U7AayrYo+oZDDvQ85G/2Do=;
Received: from 88-117-63-44.adsl.highway.telekom.at ([88.117.63.44] helo=hornet.engleder.at)
	by mx02lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sDUPY-0002J3-2t;
	Sat, 01 Jun 2024 21:29:05 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Gerhard Engleder <eg@keba.com>
Subject: [PATCH 2/2] misc: keba: Add basic KEBA CP500 system FPGA support
Date: Sat,  1 Jun 2024 21:28:46 +0200
Message-Id: <20240601192846.68146-3-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240601192846.68146-1-gerhard@engleder-embedded.com>
References: <20240601192846.68146-1-gerhard@engleder-embedded.com>
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
IP cores. Every IP core has its own platform driver. The cp500 driver
registers a platform device for each device and the corresponding
drivers are loaded by the Linux driver infrastructure.

Currently 3 variants of this device exists. Every variant has its own
PCI device ID, which is used to determine the list of available IP
cores. In this first version only the platform device for the I2C
controller is registered.

Besides the platform device registration some other basic functions of
the FPGA are implemented; e.g, FPGA version sysfs file, keep FPGA
configuration on reset sysfs file, error message for errors on the
internal AXI bus of the FPGA.

Signed-off-by: Gerhard Engleder <eg@keba.com>
---
 drivers/misc/Kconfig       |   1 +
 drivers/misc/Makefile      |   1 +
 drivers/misc/keba/Kconfig  |  12 +
 drivers/misc/keba/Makefile |   3 +
 drivers/misc/keba/cp500.c  | 433 +++++++++++++++++++++++++++++++++++++
 5 files changed, 450 insertions(+)
 create mode 100644 drivers/misc/keba/Kconfig
 create mode 100644 drivers/misc/keba/Makefile
 create mode 100644 drivers/misc/keba/cp500.c

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
index 000000000000..f80f10488b3e
--- /dev/null
+++ b/drivers/misc/keba/cp500.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) KEBA AG 2012
+ * Copyright (C) KEBA Industrial Automation Gmbh 2024
+ *
+ * Driver for KEBA system FPGA
+ *
+ * The KEBA system FPGA implements various devices. This driver registers
+ * platform devices for every device within the FPGA.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/i2c.h>
+#include <linux/platform_data/i2c-keba.h>
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
+struct cp500_devs cp035_devices = {
+	.startup   = { 0x0000, SZ_4K },
+	.i2c       = { 0x4000, SZ_4K },
+};
+
+/* list of devices within FPGA of CP505 family (CP503, CP505, CP507) */
+struct cp500_devs cp505_devices = {
+	.startup   = { 0x0000, SZ_4K },
+	.i2c       = { 0x5000, SZ_4K },
+};
+
+/* list of devices within FPGA of CP520 family (CP520, CP530) */
+struct cp500_devs cp520_devices = {
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
+	struct platform_device *i2c;
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
+	{	/* CPU EEPROM
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
+	{	/* EEPROM (optional)
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
+	/* FPGA configuration stream is kept during reset when RECONFIG bit is
+	 * zero
+	 */
+	if (ioread8(cp500->system_startup_addr + CP500_RECONFIG_REG) &
+		CP500_RECFG_REQ)
+		keep_cfg = 0;
+
+	return sprintf(buf, "%lu\n", keep_cfg);
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
+	/* In normal operation "keep_cfg" is "1". This means that the FPGA keeps
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
+static int cp500_register_i2c(struct cp500 *cp500)
+{
+	struct i2c_keba_platform_data data;
+	struct platform_device *pdev;
+	struct resource res[] = {
+		{
+		 /* I2C register area */
+		 .start = (resource_size_t) cp500->sys_hwbase +
+			  cp500->devs->i2c.offset,
+		 .end   = (resource_size_t) cp500->sys_hwbase +
+			  cp500->devs->i2c.offset +
+			  cp500->devs->i2c.size - 1,
+		 .flags = IORESOURCE_MEM,
+		 },
+	};
+
+	data.info = cp500_i2c_info;
+	data.info_size = ARRAY_SIZE(cp500_i2c_info);
+
+	pdev = platform_device_register_resndata(&cp500->pci_dev->dev,
+						 "i2c-keba", 0, res,
+						 ARRAY_SIZE(res), &data,
+						 sizeof(data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+	cp500->i2c = pdev;
+
+	return 0;
+}
+
+static void cp500_register_platform_devs(struct cp500 *cp500)
+{
+	struct device *dev = &cp500->pci_dev->dev;
+
+	if (cp500_register_i2c(cp500))
+		dev_warn(dev, "Failed to register i2c-keba!\n");
+}
+
+static void cp500_unregister_dev(struct platform_device **ppdev)
+{
+	if (*ppdev) {
+		platform_device_unregister(*ppdev);
+		*ppdev = 0;
+	}
+}
+
+static void cp500_unregister_platform_devs(struct cp500 *cp500)
+{
+	cp500_unregister_dev(&cp500->i2c);
+}
+
+static irqreturn_t cp500_axi_handler(int irq, void *dev)
+{
+	struct cp500 *cp500 = dev;
+	u32 axi_address = ioread32(cp500->system_startup_addr + CP500_AXI_REG);
+
+	/* FPGA signals AXI response error, print AXI address to indicate which
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
+	if (cp500 == 0)
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
+	cp500_register_platform_devs(cp500);
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
+	cp500_unregister_platform_devs(cp500);
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
-- 
2.39.2


