Return-Path: <linux-i2c+bounces-6877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C297CD64
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 20:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A9B41F23D11
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 18:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B39823759;
	Thu, 19 Sep 2024 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1YrSObdF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279E1BC46
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768803; cv=fail; b=Ugoun/Ht0o5SBnVS11cQ4YpsiD5doXIcSbsfZxvU5PpRTaSHO8AAT8XOfkhyDc0KcwHER7EBtji91ANO8QCg7m7FhFSISEWVbm6JX/fVPoY3bWXnClML9r6JVpNjjSJzq6PAJ+uuLEIK/norJEuoB+j9wTK19swLJB9QtTte1i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768803; c=relaxed/simple;
	bh=7ZsQFUNSZZld3raZoEaJHisUp+5c3BnQ69sWU6GgwBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+4h4mUmdOw4004bb38oE229pF29ctatQpH2iUEEm35KGS2T58cTwi9/Q+CLGnIyH/xoQZzhkPRDrTPUcagwtsTbglYFeysxpfnFt22kWVlvy/hlsdBZ/N3SEQB6FRPZuFWJqWVZYH8zahMwXevaudbybuwJqCju7NJYUCVt+8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1YrSObdF; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5XU48xsOMrXumLVyh3V3TRHwCCdAMV0HUCHT8KL1ICQFT6624Av3bD/8aRCWaNwYVbyonJqrARyjpOg1Rm1LTw+3i3G7JyPTFRj5UkHFel2nwV5q+EOdeB1aVbdHp4Q2VmTY8J04lU8fLtSUUv67KJNm8Im7Xf/jRoXxsKUfjUqkqzYf6NDvUg0k1ZhtlHPkrFO+mu843gVof4nlfBzBPl+Yg7xYzdoh5csB5Uk/Sagv1ewmpL+2DdRcdC/eIWQGAWmfxVZe/KiJxSkE4/UGBYRbytmKg1X5qbi5xx2ytguMqFJgLTX+MusbZomSluYRYoAT7o/u221GMd/O/FoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mOOeh/FI/zwUo0wWWXvs+jYIiKQkaXsWwzQokSPtkI=;
 b=FxP4cTc5dizmMpRng+HajjNjj45u53S57crn8ugiGgJa2sK5OhmH99bcjKPv9iZ29W/NT4ei43WZ0XwZARcbBdg1DETi/FG5PqqsZnH8scvXo8ibUAI5RMTSx4dNWoUsEgPkNJirLDlGYKsIka4fl1cjLvrFrr9pQqvooznwp1hhYKMbyoD6Wpncd3N4INHzx9eK78zZ/6zylLGD+X0aM9roWGEWRPx5kJVggukIkeGyE/fRFE4ZifGKsMNSW3OGYo1IzBJcw8zeWAJeHjI0EZmawgwhFk8y1KHoPUyYOcBtyb3CL9ZeocplwbnzAraKTDlo94Q6CwjZjgmrZTVYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mOOeh/FI/zwUo0wWWXvs+jYIiKQkaXsWwzQokSPtkI=;
 b=1YrSObdFZa9fuHJ8QaAZloBv3rZ3MOo6nqlCDDDaECCRUVdvPydoD1VQp52A0V2boqncDWaAm2LNweW5Pn7cmy4h1JuhPX4o48Mcm2Fe5GKvv9HWsno9p4565nojeTYLuqlIu9dLmIfnIy/0VNnz/WkLWPyvUKj04xu1JkHQQuo=
Received: from BYAPR08CA0041.namprd08.prod.outlook.com (2603:10b6:a03:117::18)
 by DS7PR12MB8229.namprd12.prod.outlook.com (2603:10b6:8:ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.29; Thu, 19 Sep
 2024 17:59:57 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::d) by BYAPR08CA0041.outlook.office365.com
 (2603:10b6:a03:117::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Thu, 19 Sep 2024 17:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 17:59:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 12:59:53 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 4/8] i2c: amd-asf: Add ACPI support for AMD ASF Controller
Date: Thu, 19 Sep 2024 23:29:09 +0530
Message-ID: <20240919175913.1895670-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DS7PR12MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bba6e2a-c88b-4f40-c89a-08dcd8d4df41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c/NG6X/xAWrKrmUElZMNHlL0XaI6v7/bq5gE+ESvjxIrkx9WzvFki/ImLM5L?=
 =?us-ascii?Q?wgjvw91P3jkKjAVSWVUlGsQ/V19LE7BThUY/MWDTgwrb07OKBKIKRzTbDE70?=
 =?us-ascii?Q?dknUQjlWWUOYb6Q7f2fBxigXZWxpXWAtn4goRem3YkM1VHwxoHPC/HvLWUze?=
 =?us-ascii?Q?jx1gFByRpOBelcr8Xoty5EmkTwEgLoWpZHAnL5EOvRIfKEJz9e69I3sWfGl2?=
 =?us-ascii?Q?5rGItZ3uJNW732mVnfKKnMBbzdx6HdTjzOIW4BYJvJzcu/njgLLCMHVmnM8q?=
 =?us-ascii?Q?gTu0RGKoHrDpWxwXyLXWOwGMoEJK/GfQzppm+2oEd/j7b+1MQX9ENZ+B3aCG?=
 =?us-ascii?Q?D4DN/N673CEFzU7wB1fN9D+OIgSvdBPaBNGP/dA4zS78iuO926zVwhIDLnyX?=
 =?us-ascii?Q?ptYb3GQsnrZjy/MIFxI9oNnJRJ13dHX84cFLiD6XSZwKDq7qEZxFZtishn0f?=
 =?us-ascii?Q?tNprCrNKjkKKXY/vMD1oNNOhjqDyPRDVhHw/Q9hm4U5ywOeYliTN7RE3etDo?=
 =?us-ascii?Q?g4lsknbbS1xAfdWBHa7gQcX1FZAgXWX0DaxhKGUx8n8lZIynC0JKyjHW4CBr?=
 =?us-ascii?Q?Fb7Of79gJmgoACDG6iWE4aeRn8l4FAq+frTmY8KtZ1k0t++x4ASBpOyltO6C?=
 =?us-ascii?Q?dpNXeXWx02ZCkcCx+bQK5Hb94M3SqEGfGx6FifZBOPZaL+ttCYh5JGh5OeBO?=
 =?us-ascii?Q?By7voYFdKI4wpy6EvA0rwVrTF6Hp8jCz9J8EQSazqrXuTFnlkspQBNrC2aY7?=
 =?us-ascii?Q?1nHFl+2fYjINzzTGZ1Ci/Mi9lZqj0uVLCUb4gklcwR7aaspCOQrFRhZKikZz?=
 =?us-ascii?Q?zCPtDmyLFDebhtDyjoYu5rWOvqTRFZ52eTpnvRqKnuSEDVOs59uYMP9dRTQr?=
 =?us-ascii?Q?dE9Pa7GLSHTOmIlJdfMRoeKjdNXFNUvwwj3c5+niPoJDPG5GuFrYvwNuZmme?=
 =?us-ascii?Q?mlPvumxDt8yajVP+YM1Ke6M+6S3NJmZ2Q/cT7RGSqt+LI9TSYLUhliw87Unf?=
 =?us-ascii?Q?THiDRGjKW4zVKivCE8+KmtfzXvmRDi8ZN9HHvr5YtCSDesUDa7xnFQnDrCyG?=
 =?us-ascii?Q?vQfxaG4SztWv02SbaQs60464o7UQMtp0EljQvWkS7oFnDg3EWteqaDJHMp6o?=
 =?us-ascii?Q?fPKoAA7cr0EzZgz2haCf5Rl8J+U1GRyacgASBpqdvetzNWjHHbpTMuvAGGg4?=
 =?us-ascii?Q?4mPX1sprClp7sAoqB1+kYPcPsTZy58CW9qzd0z0wLrDedFYRPd10paWbSwcL?=
 =?us-ascii?Q?Vr3O3Hfcuj94ULNHS+IARoeyqHXGgUYmWu2RSRBWgY0jSHkkHBE/Pfw3ALkm?=
 =?us-ascii?Q?mkiVxyUQU3BOzmv/HumbGGQ6OU0b0P6lqYRXlngKG0b8A1962M77IejoQrY+?=
 =?us-ascii?Q?dQO/MSRy48qvLXg8sevTwF1JrgkHl8gBaA4DlV/d+oFm6VF20hwAWge3Mq9P?=
 =?us-ascii?Q?LNdQ0v/N2qkpsdRFFbu2dtYUp87OBV73?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:59:56.8345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bba6e2a-c88b-4f40-c89a-08dcd8d4df41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229

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
 drivers/i2c/busses/Kconfig            | 16 +++++++
 drivers/i2c/busses/Makefile           |  1 +
 drivers/i2c/busses/i2c-amd-asf-plat.c | 69 +++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-piix4.c        | 12 ++++-
 4 files changed, 97 insertions(+), 1 deletion(-)
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
index 000000000000..56e2d9ba6cfa
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -0,0 +1,69 @@
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
+	struct amd_asf_dev *asf_dev;
+
+	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
+	if (!asf_dev)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
+
+	asf_dev->mmio_cfg.use_mmio = true;
+	asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!asf_dev->port_addr)
+		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
+
+	asf_dev->adap.owner = THIS_MODULE;
+	asf_dev->adap.dev.parent = &pdev->dev;
+
+	i2c_set_adapdata(&asf_dev->adap, asf_dev);
+	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name), "AMD ASF adapter");
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
index c289edc0a6fa..f2c16b06393f 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -87,6 +87,7 @@
 
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
+#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
 
 /* insmod parameters */
 
@@ -1026,6 +1027,9 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	bool is_sb800 = false;
+	bool is_asf = false;
+	acpi_status status;
+	acpi_handle handle;
 
 	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
 	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
@@ -1088,10 +1092,16 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
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


