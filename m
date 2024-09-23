Return-Path: <linux-i2c+bounces-6929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD85897E72A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C987C1C2110B
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBBD61FFC;
	Mon, 23 Sep 2024 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P85P1iXO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57238328B6
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078743; cv=fail; b=VXhEQqOHbB7bh4wEYhjYQug668dGmMX1nIfvDyt/tWaGAv+VgXs9bej/aUiBPL+QnhDtyq8eV2D41bA0vse3dir4lbL9jF2JI+D8zgS61icCeiYH2sNsTKFTi9erM/oEh6usLGdsGkhJDXKCAB+bgU3Cnw728dCiD24x4JJJKIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078743; c=relaxed/simple;
	bh=agyOK0F9jhLaqeFF8f5C8L+v/Vjazf+Gh8fZNC+6A6E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YI5cxPVor2w8zUEMhdoikBYVjLMkktUJjI36M2wMnRGp5SVqJKStqHJA5hL+aJVW2/0QNYSMKSMfPP62/yIPpYb7emdm1V0mZustjXywsKSD/ClH1Qwdc8wWuiDX5HwHLP1juxNCirzEZXqi28Bp1RI7hgglDroCg0/+RAHnldk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P85P1iXO; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAEeih1YCAgqB4Z1hG48fpq1dUAcHug+CQTc0d/9br4hnFWqy0gjTY9kTom6G5lKAXGIxmZ2rA//E+u+lAvFirWWhA96fP/YQ/7N+tjYn4oaxnf0wm9oEVN2MB4MhJJsDEf5uo3aSps7sWeC6KEnRYwZ9DqvdaVxcDp7641eHEkupKTn7XHEx6bWgTVlIUtXBgiUhpHP2Pi9GGYYiZrR07bZ+H03zMibYzUFr60osiY/y0Ccb3t+Ie19VuI+hO/bQISGFA93x6OAt8Sx03XQO//bQVWXtbmpMZu+WBEsUrfhgQcgJFSNso5st4dDYWyAMxTiOBDFCMObHP/kaXdawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mQotfSMU0EaK8KeGJK4J36wVdjIQ2hazDI4N6lDH+U=;
 b=jMLi3M8RYUDiYJhKD/+eCHXoKZSPeJAErD7YcBigq0UEl5Gaz5W5ewapMeEbeHVliHNkyGjpw/IzoB6oOITa7pRmYCEz580lcR6JMn5bn6Q8XXJKUIk92WpkqRTRFVjvBYYNcVFSBkBPe9bl6AOdD5RFVU1S081axigoze8O/M1fH+O9w6/3euU6ujRQaQQwiGB8pyOB7SoIBb6ozcKXsUo+ivbmzvKffg4mvtP3teYQbVRtEL6xW8CcJD2+8Gkppe+QB5dZtRAKzkRxNaZHeoy/n03qy3DtVJkvYjxUQvFA+Or0aX+8shO1dE6Z8rMzoADwylgJ7dch5s2oXdYBOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mQotfSMU0EaK8KeGJK4J36wVdjIQ2hazDI4N6lDH+U=;
 b=P85P1iXO4AiEsIuAxcz8nVYhKvEo9AdHuRRRV9WWdygUKymdQ70wnYRaXUmt7ImMXvVtJ05CuvB9ojYn3OIBE507HZ0m8Vm7C9WEnD1PjK2nt8YZ1iKb68sKdNCSQumI+gUV+cCkNB54uGjoWPKHFTe7m+t4HrOuuWW7oFVqsxg=
Received: from SJ0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:a03:3a1::13)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Mon, 23 Sep
 2024 08:05:35 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::74) by SJ0PR03CA0368.outlook.office365.com
 (2603:10b6:a03:3a1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.27 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:27 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 4/8] i2c: amd-asf: Add ACPI support for AMD ASF Controller
Date: Mon, 23 Sep 2024 13:33:57 +0530
Message-ID: <20240923080401.2167310-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 0243ace6-f3c1-43bb-acc7-08dcdba68096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IK2BMejVGmHk7L4ss2z244z2sjzswvmbBVS0vbatONkAcnBm1FaEdJe80vAO?=
 =?us-ascii?Q?HQsYfac3U9BJYKy+FhqSpKJwJcBoT1ITJt7M9vxF9imjQNGTMWvygRmcSil0?=
 =?us-ascii?Q?DyNKX+fSQ/6Po1LpYUiwjN3eCuDo24NSCLhb2T9Q1dm3sTUQdvBtm0o2NM5b?=
 =?us-ascii?Q?OyAk7UDY8MBcpEYz5Ovq/fMMuXLYP4TNgDD3BM+KHt/ujNYjmGJBPk9viw9s?=
 =?us-ascii?Q?2OXs+GwlrR7FQCO2A7omQpszUDp9eMEs4clwZeCa0woWnHOTlKvLXJpMhA5F?=
 =?us-ascii?Q?DA4gMU6UET/B83XHSZc5s5/lhljLHYU9/L99nzKpsCjkqmCem/s7bgkVoii0?=
 =?us-ascii?Q?qrBiDrdDJcxxf7vMIzLOIsdKoa0r+uOTEiHFSXGAYHxo3eJrCR6c27aBzSJ9?=
 =?us-ascii?Q?bxKnouejLeJvGHgIVwL5cr09I2tWJ5gJKfzOzj0E6obLcjGnlHwdy40HOwxg?=
 =?us-ascii?Q?T0LI4Psby2lQjznCFK1VgkkUqpvZbe6hvEz2LhWSP9h+j9BoSl1wTz+gR3sq?=
 =?us-ascii?Q?rk1Br7t1BZFl5D8TPSLCgG43HWqtHSIoY0BM8+r3ZiMMD9bxD5tZ69Qto8Jp?=
 =?us-ascii?Q?vV9rz1QNHwdY2kQnrHI5Q1mg/CYRcjrYLaTci0NOfZCbK+GafB6rzu79+vFI?=
 =?us-ascii?Q?U0j/5Xvv/RnSHslj/ds1g6RYvztgSLUqQW0GSYJNPY5FUTA7v/JgwJb3mNp7?=
 =?us-ascii?Q?KVSenWCmn90ZFBlVuM22oOn0KIXO2aDKKbGhja9PheqVYx9fxq0OT95qr9z6?=
 =?us-ascii?Q?y+cG/64FSC4vSmbphgzLVnFLUhvnzA6zlt2OjVLpt61k/i6UrhXBT30ovJNo?=
 =?us-ascii?Q?aaFytZExJiZMTTTkRzQn/E2LlPB5z0WmYRxf4m1V1pi+rCmFydgWh/fw/8mj?=
 =?us-ascii?Q?EwzGz78wF5l9sDGXi5luOHjcSEOIhYOHYZ4eQf0T/QJDO50TN0iDJkDSyJQF?=
 =?us-ascii?Q?zGM6FuXgJpBMTJluKa3dQMERzYKUxWV3xzDr60BTxVRDKjVz6Udpe7lgcuOD?=
 =?us-ascii?Q?JtwrqHq5MXEURPlMwLf2A8Wcm/B0JVLAph1DHAf+LnHajgTmNbpMAvpw6T9q?=
 =?us-ascii?Q?Y6k9h26vEH6EIC3/4t5W0ZoTc1B2pJWIavxbITTGc4QsOIuh0Qt6kWore0kh?=
 =?us-ascii?Q?dHrfekk1L6eZuJ1PQb23GxlA3/EZpak6zZaQ9lnm/YJqzVbRMWCX5n9T28NN?=
 =?us-ascii?Q?uNisx9z5+Hbr/fxJlwAtNn7S0YIyz8sN3lO37s8foCBo0d7fP2XqQ18P13gK?=
 =?us-ascii?Q?SB0u6/PY3i/c4W7I8FR3pT/g6QYVZDvhjSnB94xFdnrbAhTQ0rrCnoKYQ/Mc?=
 =?us-ascii?Q?w7wtW2O9my3yJWPTSDHurjqjlFdTpiWn8kKfI72YNcg37Kwg09Qf2qB3FMqM?=
 =?us-ascii?Q?gkH28JQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:34.6773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0243ace6-f3c1-43bb-acc7-08dcdba68096
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620

The AMD ASF controller is presented to the operating system as an ACPI
device. The AMD ASF driver can use ACPI to obtain information about the
ASF controller's attributes, such as the ASF address space and interrupt
number, and to handle ASF interrupts.

Currently, the piix4 driver assumes that a specific port address is
designated for AUX operations. However, with the introduction of ASF, the
same port address may also be used by the ASF controller. Therefore, a
check needs to be added to ensure that if ASF is advertised and enabled in
ACPI, the AUX port should not be configured.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/Kconfig            | 16 ++++++
 drivers/i2c/busses/Makefile           |  1 +
 drivers/i2c/busses/i2c-amd-asf-plat.c | 70 +++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-piix4.c        | 12 ++++-
 4 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-amd-asf-plat.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a22f9125322a..03afcdbff209 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -95,6 +95,22 @@ config I2C_AMD_MP2
 	  This driver can also be built as modules.  If so, the modules will
 	  be called i2c-amd-mp2-pci and i2c-amd-mp2-plat.
 
+config I2C_AMD_ASF
+	tristate "AMD ASF I2C Controller Support"
+	depends on I2C_PIIX4
+	help
+	  This option enables support for the AMD ASF (Alert Standard Format)
+	  I2C controller. The AMD ASF controller is an SMBus controller with
+	  built-in ASF functionality, allowing it to issue generic SMBus
+	  packets and communicate with the DASH controller using MCTP over
+	  ASF.
+
+	  If you have an AMD system with ASF support and want to enable this
+	  functionality, say Y or M here. If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called i2c_amd_asf_plat.
+
 config I2C_HIX5HD2
 	tristate "Hix5hd2 high-speed I2C driver"
 	depends on ARCH_HISI || ARCH_HIX5HD2 || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 78d0561339e5..74920380a337 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_I2C_POWERMAC)	+= i2c-powermac.o
 # Embedded system I2C/SMBus host controller drivers
 obj-$(CONFIG_I2C_ALTERA)	+= i2c-altera.o
 obj-$(CONFIG_I2C_AMD_MP2)	+= i2c-amd-mp2-pci.o i2c-amd-mp2-plat.o
+obj-$(CONFIG_I2C_AMD_ASF)	+= i2c-amd-asf-plat.o
 obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
 obj-$(CONFIG_I2C_AT91)		+= i2c-at91.o
 i2c-at91-objs			:= i2c-at91-core.o i2c-at91-master.o
diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
new file mode 100644
index 000000000000..ccb547e14414
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Alert Standard Format Platform Driver
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *	    Sanket Goswami <Sanket.Goswami@amd.com>
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/sprintf.h>
+
+#include "i2c-piix4.h"
+
+struct amd_asf_dev {
+	struct i2c_adapter adap;
+	struct sb800_mmio_cfg mmio_cfg;
+	struct resource *port_addr;
+};
+
+static int amd_asf_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct amd_asf_dev *asf_dev;
+
+	asf_dev = devm_kzalloc(dev, sizeof(*asf_dev), GFP_KERNEL);
+	if (!asf_dev)
+		return dev_err_probe(dev, -ENOMEM, "Failed to allocate memory\n");
+
+	asf_dev->mmio_cfg.use_mmio = true;
+	asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!asf_dev->port_addr)
+		return dev_err_probe(dev, -EINVAL, "missing IO resources\n");
+
+	asf_dev->adap.owner = THIS_MODULE;
+	asf_dev->adap.dev.parent = &pdev->dev;
+
+	i2c_set_adapdata(&asf_dev->adap, asf_dev);
+	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name), "AMD ASF adapter");
+
+	return devm_i2c_add_adapter(dev, &asf_dev->adap);
+}
+
+static const struct acpi_device_id amd_asf_acpi_ids[] = {
+	{ "AMDI001A" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amd_asf_acpi_ids);
+
+static struct platform_driver amd_asf_driver = {
+	.driver = {
+		.name = "i2c-amd-asf",
+		.acpi_match_table = amd_asf_acpi_ids,
+	},
+	.probe = amd_asf_probe,
+};
+module_platform_driver(amd_asf_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("AMD Alert Standard Format Driver");
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index ee76ccc71697..59b99081938d 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -87,6 +87,7 @@
 
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
+#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
 
 /* insmod parameters */
 
@@ -1024,6 +1025,9 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	bool is_sb800 = false;
+	bool is_asf = false;
+	acpi_status status;
+	acpi_handle handle;
 
 	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
 	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
@@ -1086,10 +1090,16 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		}
 	}
 
+	status = acpi_get_handle(NULL, (acpi_string)SB800_ASF_ACPI_PATH, &handle);
+	if (ACPI_SUCCESS(status))
+		is_asf = true;
+
 	if (dev->vendor == PCI_VENDOR_ID_AMD &&
 	    (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
 	     dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)) {
-		retval = piix4_setup_sb800(dev, id, 1);
+		/* Do not setup AUX port if ASF is enabled */
+		if (!is_asf)
+			retval = piix4_setup_sb800(dev, id, 1);
 	}
 
 	if (retval > 0) {
-- 
2.25.1


