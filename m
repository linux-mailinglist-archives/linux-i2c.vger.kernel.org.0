Return-Path: <linux-i2c+bounces-6712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80613977F59
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD48AB25C22
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698741D935E;
	Fri, 13 Sep 2024 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="v2b5LT5H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C971C2329
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229523; cv=fail; b=m8gW5m43IAhUPFzS4OriJpf4kXO/Jw8ML5jEmr8FJxLj4bAyY687n2XN7oMF5O7zzNTxMvI6t6fqnlmeUEvFH0kpqEM5fZGfYThaa6OmXh6lCb/3u+WBA1XIEUzm1iHVZtm10nHKpj4nvO1LeA3WmarsBLmsyHvKO6MnoLevlJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229523; c=relaxed/simple;
	bh=TFBJtns56b9foXQXWC3UJMens+lgzzgwxi16HznX0gE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KofcBL/HAVZpcPGLEOGva/1S5kH++t/vX3wufI9nAt3nHVJyWNbN08xcaV4fB71O9tuF0shckn9KQo0NTSDHKVqRBBWxOiZzCPZ2FWPfhdhsANK6D0/ku1wI7UC9eBD0YQDc/LT/SKcKWRxm0mNntcH2p3Jke66Ys+8JA48Iidw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=v2b5LT5H; arc=fail smtp.client-ip=40.107.212.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKmmS35kB9ceipBnqRcDpSv+h4dUiTg3l9aREMJUJfzwMmPSNLUyIMs+2+fUUQ8WeY3ZMFlfTajS0Se/elbNiykdGrbArPDk3REX8JAWQprKBwFTuKAy8JOtTkQbk2oxDGwtttBc/kCiKssMsyvXljCxdQzulGFxS4RXOGodiSDZcCRD5zoxnL0bJEOqDXR6pGkS5KmUbt4ikQ2Pinuie7CQCX/G1JIw7bwOn266CgUyW/R583Qe+7hLBH2hTvTU7EdNvnJho7nhk6cwK66cuA7vuS8a9tvuqgOriawycRDBq3Yi4UavNwJUVBxmezC9MEkw4H7KCgtlFfSdVHyn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJrI6HmnMCvxaVQAbRYqJYwAOTXGR+M798Va5alQjJY=;
 b=IrXVWVjNBs5Y+3lmTjDKWrcGcljyX7rInrTaDpLSjDidCV1cn3qQ6pIk7SwJTOGbCRJw+o+eEynQ0kKZHK7kzX40IBDlJ9jUS1l57bRN/IE3gZhVDwbXvmwuwEoxkJS4fTeQ5trr8KiJuhvRpd00enP3rRNc4Itd1C76JBzuhRYKi40QlWYfmD0bUam6tl5x/zIJxADf9yMWD6O6y5ndzrV+gDGVp585N+Za2uFCTkGSxkNoPOpshbxHn2/U1JUHddj5lyRczn+eDFHmZL0TyHBjF17dhZZmRc0tkPvzkln/qv5cs+0YMmiN2jgCK2michtufS3rUy95N2jAo/ghfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJrI6HmnMCvxaVQAbRYqJYwAOTXGR+M798Va5alQjJY=;
 b=v2b5LT5HMoisp5JlMe0uBZsWNmUa+3KO5k1SqI7rxFsz1x7Qk2KSbmB0Y5WQne4D1+b/4JvUDsAqe6Y8ZOqJ0Ek6jawFQ44zdb0piP8u5ta7FL63QNox17j9se6xBCPCnIQt6asCofb+4H5L0aCB12pTimQyyEoo+FhEKD0UKP4=
Received: from CH5P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::24)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 12:11:57 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::be) by CH5P222CA0003.outlook.office365.com
 (2603:10b6:610:1ee::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Fri, 13 Sep 2024 12:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:11:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:11:54 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 4/8] i2c: amd-asf: Add ACPI support for AMD ASF Controller
Date: Fri, 13 Sep 2024 17:41:06 +0530
Message-ID: <20240913121110.1611340-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c6f139-e697-45c3-9342-08dcd3ed4320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lO/5L1Yk5wohNVy6FbxSELYBnS0/p4VOA31RLGTahvbBwu/kFgEuv6EF/Iku?=
 =?us-ascii?Q?5YvEK05qeRrH2KblwPb9Lwc+kEsb8ve0QYfoFGeN4OvRiFcSFzZmLib83/mg?=
 =?us-ascii?Q?6LwzX+JGsac0WqE2GuPI+c8+Fbv7nA560wsMsUcbpM52xZZ+FIZsyhCsZNL2?=
 =?us-ascii?Q?2EpQdiUnpqCVfLkG1IuhDTwlkS0X+wpuuYHwhOFyFBpqm4DXa4AAEaEG8n1P?=
 =?us-ascii?Q?wpDOy1UxHjoKzRjqsTlv+xrGWfFJiQGtbworKNsqflfyzi2uALs/7UCUsNAx?=
 =?us-ascii?Q?5Ln0JKORpCgrUSiwABdG0X4t8oQHEHbHNY12LnHS3mok6fnSOv0UEnWmVJne?=
 =?us-ascii?Q?8OznzHr/T+SWGmsWXjhMDxyVEOzwFKvEcfy0NoXHPPDIvqPvjTbeFSiRkwg8?=
 =?us-ascii?Q?2O89xxR0D3OySrXWgCdryQHIsB5Y6vknyCF3KGYic4a+tim7L6q/RaywILSf?=
 =?us-ascii?Q?Czm31nQu7g7Hcmt1u9covHQhfghVs+vUDkVOEVBAj2UZCakRMZ2SdRZmAF1s?=
 =?us-ascii?Q?eHvKgoNBvyLqqKqH5OeDjPPLG4pLNNHGoBqZarUeOgjx+htsIO3jOlMPTKFN?=
 =?us-ascii?Q?f288us6q3exVySM+ht4tVdn6WmPHgePzgZfcBtwVczW4mGSZBF7797tkA59h?=
 =?us-ascii?Q?WqFzf9gtDi5UwwR4xA09dDvzbPKCGOn0fJIuzq49wPn+MQcZjBKORg6ixW10?=
 =?us-ascii?Q?+xJM8yRnv/xFAgB4Z7RT/Huob0cysG5Jf1glHF6VxmoZOBRC9Un3gaVulHTb?=
 =?us-ascii?Q?Y8dDJ6mM1b0ZXfS6XisAITCda7IcdIOlWy5dBpq5JngBEuuQ2JnzeYsK9PJ4?=
 =?us-ascii?Q?TNA8l0QytFWjVoF+Qum/Sa/4pP0qucRZaAED7Wl/WjSXhtNVlxtDHHhdSWh6?=
 =?us-ascii?Q?H3nQMVZBpSPZMZe4cubhTwdqhCOVomz97QokfIAgv3lm2W5GEc2IO5pKaImX?=
 =?us-ascii?Q?qjcOebaUxKCtpZLRpdvjDRqg78bp6hua2x7bm55dRvkyMGa5qpTSlW4WkyWm?=
 =?us-ascii?Q?+KbgtLABVxSBp4joHMfHy1wMgBFi0SAiWT36ztxrkvYvAUizTaawaiSwLeEn?=
 =?us-ascii?Q?C31bQ1th29s2uoppHlL5EO6b8CfojsblFDgfdSB8SHG1tBXNffWZjBJCbRB5?=
 =?us-ascii?Q?Fq9tVTDn17SPpoOPffO/JkKIa26SZPz5fGKuSXdl4biqAQsqC5HcD8k0tE3b?=
 =?us-ascii?Q?620VwkmMA06qpUoJvo/WfotdvUrBhOioYQH1ApCo60N67Gt6zuipeckaUflw?=
 =?us-ascii?Q?066LQ35Vy8Sq0CaRtylPlVMo3bYQOemZhG7qAt+X1PrVJ+Kz5s8RDw6OcIEp?=
 =?us-ascii?Q?ojnoHHGVwzRT7l0TFRh9NSJxsl26jTCF1TL55PW8sJYcpHH1Ivahcr/sTouA?=
 =?us-ascii?Q?4GlTFy+bIHLivDNwVDY1ZMVuk88iUYvaLzOGl98FcbHebvX+ugDKCQdax8i7?=
 =?us-ascii?Q?PxbumE4QlEEcXPxpyLsbl8O06Vzliv/S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:11:56.5748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c6f139-e697-45c3-9342-08dcd3ed4320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913

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
 drivers/i2c/busses/Kconfig            | 16 ++++++
 drivers/i2c/busses/Makefile           |  1 +
 drivers/i2c/busses/i2c-amd-asf-plat.c | 73 +++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-piix4.c        | 12 ++++-
 4 files changed, 101 insertions(+), 1 deletion(-)
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
index 000000000000..3d80805a7a3e
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -0,0 +1,73 @@
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
+#include <linux/io.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/sprintf.h>
+#include "i2c-piix4.h"
+
+static const char *amd_asf_port_name = " port 1";
+
+struct amd_asf_dev {
+	struct i2c_adapter adap;
+	struct device *dev;
+	struct sb800_mmio_cfg mmio_cfg;
+	struct resource *port_addr;
+};
+
+static int amd_asf_probe(struct platform_device *pdev)
+{
+	struct amd_asf_dev *asf_dev;
+
+	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
+	if (!asf_dev)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
+
+	asf_dev->dev = &pdev->dev;
+	asf_dev->mmio_cfg.use_mmio = true;
+	platform_set_drvdata(pdev, asf_dev);
+
+	asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!asf_dev->port_addr)
+		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
+
+	asf_dev->adap.owner = THIS_MODULE;
+	asf_dev->adap.dev.parent = &pdev->dev;
+
+	i2c_set_adapdata(&asf_dev->adap, asf_dev);
+	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
+		 "SMBus ASF adapter%s at 0x%llx", amd_asf_port_name, asf_dev->port_addr->start);
+
+	return devm_i2c_add_adapter(&pdev->dev, &asf_dev->adap);
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
index 7e0fb51ce532..f4a65344b481 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -84,6 +84,7 @@
 
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
+#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
 
 /* insmod parameters */
 
@@ -1023,6 +1024,9 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	bool is_sb800 = false;
+	bool is_asf = false;
+	acpi_status status;
+	acpi_handle handle;
 
 	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
 	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
@@ -1085,10 +1089,16 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
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


