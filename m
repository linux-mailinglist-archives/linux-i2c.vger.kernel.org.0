Return-Path: <linux-i2c+bounces-6552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF4975139
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B7C41F282EE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B60C187355;
	Wed, 11 Sep 2024 11:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CF3jrbOR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB8185B48
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055699; cv=fail; b=YP6xT5k83JVNJHO2XG84A0UTwRrzD1vx+crKPd8S4PKBfOq4qX3qMZHnUfveWv+LhImEuVbu5qPadIE2sKsBhUbQa9ZNmhjtMS2mbKMjF4hWpYdclXpw6F2DsH/38aj3om906Kqt1cIwsvpvDnU3RXzbIQzy1VLskSVN2NXxihs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055699; c=relaxed/simple;
	bh=r55c8mg168I325+5HKd4DuZDpSs11FbDqAtT3l6XciY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g+Y9DLvBJpUgv6rtVh/CccznUZ2QBBxf7RTmtx7MtEcWhwenKPsiJO98Y5HdM6N0dVarOTKmOJrl1xgD6yMhB23yNgm2157EDX4OFmivE08hK6RWT/uT64qCUKIXQDQcc0xUYvTi6MCvM8l/7gatGJ+Bo4+sc0ovzjF8t+pTGHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CF3jrbOR; arc=fail smtp.client-ip=40.107.243.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+5tXDpbmJQLOAXQct82a7ZmiyMVwiftweXI/HaRzZ2C19I8wK6G7bE0GG9YAn/oL1YqwpTilqpHVXZEm6CwxTNhtY5ljT36GTR5NVjD/HWbo/giireD/RVx0HMA3SPtuYbAaUCGQRUZgOGEJFkGWnUiMO+o5B0js0mAQP/Ax0QZcfFB6P4iJTdd1t4GhtRI5SN7fX4Q6wRWImsDLODeb18x83wqf1XFxnTjpHLJh/WHov4zQlVQl8c6S+975IxfdASMY8NsrQEnW0/9CisSvbKJa4x/RhJhHFnwaMDb2GSHAJ1QMIb0M+XrCt7zYSWIZEOXcjiQHoTPE3P2qjhuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iacyaay/ubCoHIXZSY4AejTtnmC3ErChEfqhs3BbCk0=;
 b=pIJj9tw+lo2Rizsat6zc/AFMkAt4CEteeQM2PmhFU5gTqJ9iWe3vR3nC7qrIXSbp/45AIPjQsMEEcO7EiTi4iNhidt1ER+SGRT9nWVMZGahqc2CH3s4pycngvRW3P76C61dSF9FmfFE59gPpgoqwT0kJ18k7dske46o1gkidIaL7dzQm/yGDP8VO+FsQE6NSW3CMM2sohQhufCqAE3OEM5EVPHoAejvxBysXsstZpXgs4gnsdIxGXrZUdLRTo7OLku6f3j6PtNiV7SN7ytms9B1SAn94oEwIXzt/Nh0k//5SlwxKhZ5TBtAHh+1WHJnJOxNhymd0bCJysQQGpwNH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iacyaay/ubCoHIXZSY4AejTtnmC3ErChEfqhs3BbCk0=;
 b=CF3jrbORYNOMCyy3AY6Olvd8q3huLwzEfbz7KR/njxN7rkMY1Nyh2LC1TBSKLP+5EZaLzp2sll+sgFgIIjEJFE0FCDxA7dsd9HAYixE5TBkjvmSgJGTUeL7AR8IaUoAif2c1F7nRtKEz7CXwv8L1r4LIcjbK7R9asqaM70HWKT0=
Received: from BY3PR05CA0050.namprd05.prod.outlook.com (2603:10b6:a03:39b::25)
 by SA1PR12MB8988.namprd12.prod.outlook.com (2603:10b6:806:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 11:54:51 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::92) by BY3PR05CA0050.outlook.office365.com
 (2603:10b6:a03:39b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 4/8] i2c: amd-asf: Add ACPI support for AMD ASF Controller
Date: Wed, 11 Sep 2024 17:24:03 +0530
Message-ID: <20240911115407.1090046-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|SA1PR12MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a59bc4-e19e-4251-f5b4-08dcd2588b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xRx/s1wDqWjYN9ESW4xux0xz1QLKn8n2YjMozBlwo+Vxos8liRsxS2bAW+Ia?=
 =?us-ascii?Q?0aQt6Mf0yNxNir8DUUGoWOYnoH0rmujMh/6Jr7kjQdW0zJ2y1FMTaWqLKmW3?=
 =?us-ascii?Q?Jl1S2TMOFEFSrlAby6lKA4UVn6kAwo9bjncdP8g+EN0z45CZScxc6WFacYJC?=
 =?us-ascii?Q?vOUN3qjcf7pTboKDXVtM4m12RGJ93puYstlkGNwyDgsYbFXBnoBNNcocRGe8?=
 =?us-ascii?Q?3eLOTemC8tFsrlx0lTm4AHCQaiHgAUBJarDRMCIntUgoe/Zf3c3RcUFMuOHG?=
 =?us-ascii?Q?AjNA8wAlpfnC+jrSwa0k9jjoivjInY9uihHkwwg70HgeuOLdkj46ndDaCtH3?=
 =?us-ascii?Q?pc92SQg8IufrIknrv5n6r737VCN69TKUHdXTKheq65jSTGHPj3QMO6qAdojm?=
 =?us-ascii?Q?YQhDHGC9eItMYivmpeS5y9TKoPZyKgm4i5moLe4fUsXsZkQcVVow7kvjOjz+?=
 =?us-ascii?Q?Mffb+YfHe3kOvuncgd5fiUi8E6SrZan4Ht0w0xpiUkb547NdGuqRpoUQ+Jjt?=
 =?us-ascii?Q?JxKV5Eoimw3LjCUz/qc27QWpiLqFTMzfWSN++FLnvG6NPCDQ5ywvWn3Ed3Qu?=
 =?us-ascii?Q?t4V9zeswsVcbCvAQ/h15WSKixtyhCHG+gksp5uWtmzdmMN646TGcxnLU/R0r?=
 =?us-ascii?Q?7wFe4E2ibgh/vrlSY9CCPvch7wBjwu1WSnaXS8U/VF0Bm/evu7eC2KUBvTpA?=
 =?us-ascii?Q?gURWwgR4SQKmgMQ1D5AMD/Lwiu6z8ZExWlXi+WUQ52UILdTdxShKCHdBPvIw?=
 =?us-ascii?Q?RFcGGGFZipX/GMKxUsXxNW7vhbsJLhPeD+0ipVOxImXteosDgzkFURlp1+Oy?=
 =?us-ascii?Q?sQ22gA2jmhjqeik9J1J8gk7u4MathQRBYwe+0vi/x9tWoE0LK43z54e5T6yI?=
 =?us-ascii?Q?+JtnDZpfahEOi3qFMonT1pqf15FyR4iMhfrMs3/B0fIwzrF1a6+USJLwijf5?=
 =?us-ascii?Q?5St/yDCTXJ9ZTkzK8K+ceLGXkA4PFvlisH+YoV0phupkftYtodcpO/RLY+IN?=
 =?us-ascii?Q?pFsGJEaTu7ppa5zg6Z9t7IuXcuVj+uGl1m2mxVb18gt22SKSzdyMnk4aSf39?=
 =?us-ascii?Q?bPfcV/ekcbRpDp7nKan8DO5jGasGM3Kpl66WDBez8icbXZbJWPgMUHFRYoBW?=
 =?us-ascii?Q?X1SeN9sX4MeqGkqhSWbGv4dGdtIa37i1RV2nIOns+XNCBCBieQyYugpzNOjB?=
 =?us-ascii?Q?Oorxa38AU7LqOtjRUZ2ya9XdWGCOQuIkgwJ5WdKWvlp7T3mNrQueK+8+1qbI?=
 =?us-ascii?Q?F5h4k3FZ82B013vHGWpHeyxKVotNefjuRHOapMj8vx3CXvEWIQoE+xg2SU6i?=
 =?us-ascii?Q?0mskyHc7dYC69j0dTw6zNSDDaq5GpigcSJ6TU8CuTejvcWVfY/doFZtjxsPR?=
 =?us-ascii?Q?H/qu9hPfm/7RNrpKRB+7/GQcc/xjasJAVMYdSdwb+FvJKWSf3c6CaPN6cVId?=
 =?us-ascii?Q?TNhF6tf4D3blRysVdXse2HrdyxXyqlDD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:51.3465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a59bc4-e19e-4251-f5b4-08dcd2588b45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8988

The AMD ASF controller is presented to the operating system as an ACPI
device. The AMD ASF driver can use ACPI to obtain information about the
ASF controller's attributes, such as the ASF address space and interrupt
number, and to handle ASF interrupts.

Currently, the piix4 driver assumes that a specific port address is
designated for AUX operations. However, with the introduction of ASF, the
same port address may also be used by the ASF controller. Therefore, a
check needs to be added to ensure that if ASF is advertised and enabled in
ACPI, the AUX port should not be configured.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

 drivers/i2c/busses/Kconfig            |  16 ++++
 drivers/i2c/busses/Makefile           |   1 +
 drivers/i2c/busses/i2c-amd-asf-plat.c | 109 ++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-piix4.c        |  12 ++-
 4 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-amd-asf-plat.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a22f9125322a..262a8193c0bc 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -95,6 +95,22 @@ config I2C_AMD_MP2
 	  This driver can also be built as modules.  If so, the modules will
 	  be called i2c-amd-mp2-pci and i2c-amd-mp2-plat.
 
+config I2C_AMD_ASF
+	tristate "AMD ASF I2C Controller Support"
+	depends on ACPI && I2C_PIIX4
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
index 000000000000..eb3cd166850c
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -0,0 +1,109 @@
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
+#include <linux/acpi.h>
+#include <linux/i2c-smbus.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include "i2c-piix4.h"
+
+static const char *sb800_asf_port_name = " port 1";
+
+struct amd_asf_dev {
+	struct device *dev;
+	struct i2c_adapter adap;
+	struct sb800_mmio_cfg mmio_cfg;
+	unsigned short port_addr;
+};
+
+static int amd_asf_probe(struct platform_device *pdev)
+{
+	struct resource_entry *rentry;
+	struct amd_asf_dev *asf_dev;
+	struct acpi_device *adev;
+	LIST_HEAD(res_list);
+	int ret;
+
+	adev = ACPI_COMPANION(&pdev->dev);
+	if (!adev)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to get ASF device\n");
+
+	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
+	if (!asf_dev)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
+
+	asf_dev->dev = &pdev->dev;
+	platform_set_drvdata(pdev, asf_dev);
+
+	asf_dev->adap.owner = THIS_MODULE;
+	asf_dev->mmio_cfg.use_mmio = true;
+	asf_dev->adap.class = I2C_CLASS_HWMON;
+
+	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Error getting ASF ACPI resource: %d\n", ret);
+
+	list_for_each_entry(rentry, &res_list, node) {
+		switch (resource_type(rentry->res)) {
+		case IORESOURCE_IO:
+			asf_dev->port_addr = rentry->res->start;
+			break;
+		default:
+			dev_warn(&adev->dev, "Invalid ASF resource\n");
+			break;
+		}
+	}
+
+	acpi_dev_free_resource_list(&res_list);
+	/* Set up the sysfs linkage to our parent device */
+	asf_dev->adap.dev.parent = &pdev->dev;
+
+	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
+		 "SMBus ASF adapter%s at %04x", sb800_asf_port_name, asf_dev->port_addr);
+
+	i2c_set_adapdata(&asf_dev->adap, asf_dev);
+	ret = i2c_add_adapter(&asf_dev->adap);
+	if (ret) {
+		release_region(asf_dev->port_addr, SMBIOSIZE);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void amd_asf_remove(struct platform_device *pdev)
+{
+	struct amd_asf_dev *dev = platform_get_drvdata(pdev);
+
+	if (dev->port_addr) {
+		i2c_del_adapter(&dev->adap);
+		release_region(dev->port_addr, SMBIOSIZE);
+	}
+}
+
+static const struct acpi_device_id amd_asf_acpi_ids[] = {
+	{"AMDI001A", 0},
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
+	.remove_new = amd_asf_remove,
+};
+module_platform_driver(amd_asf_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("AMD Alert Standard Format Driver");
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 174cce254e96..ff1e378a7198 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -84,6 +84,7 @@
 
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
+#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
 
 /* insmod parameters */
 
@@ -1021,6 +1022,9 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	bool is_sb800 = false;
+	bool is_asf = false;
+	acpi_status status;
+	acpi_handle handle;
 
 	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
 	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
@@ -1083,10 +1087,16 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
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


