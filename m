Return-Path: <linux-i2c+bounces-3442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3848BD7C5
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4995AB21E7A
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0807C15DBBA;
	Mon,  6 May 2024 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oFuaWjfR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC615B969;
	Mon,  6 May 2024 22:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035963; cv=fail; b=DOynsEfToVGyymN+9XfI/v6RdxPBN/ZssbOLJeUYkCsDTmjXPkW8xbIEBCWhpgoeQ+dST++GdMXBvZWM4P7nW9TpgmRg2uh5/zrYGaAmqdpa6b/7vjQp6f0/V9ND2iSDv4yDdfbLKCMNWtfIEY/ZZgnSEBCaEvDq/uppNX1xTjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035963; c=relaxed/simple;
	bh=05ubJ7dlKDQIbOjOvbMb9nSl6zkIEdRfOhaXhajpBV0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uYX8otbZ+55nnV4BmTDEtFiqGhi0USbj3C1qSwtxG0VjYb+yHbms8BzgoWhouZ/Mdyxb1HagoGiEf/wAi+8mtP1t5pcWLK/ekE3orNFhAwklOXuj+DXm4Pq3PnpwPgVXVpaH3NopFBvDJt/mxEuPQd6ETdSin0KbkH0VwFzaAys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oFuaWjfR; arc=fail smtp.client-ip=40.107.102.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RojDqogmI0Wv7UzWpQGQaDPvKc0NKdMuImEKdcZ/nyUBTagqtEDw9+1B2Fchy7se8WMNwjp2XxWQgA25gFbd9R+p6sov47uH1HinSFw/84W50P1HS313AdeRwC05UXqUxHzhHJHSoLpGbxroWD6xNf5gApPiLONY/sUTqLfoU8X0fyYOrVo1akmmq2Eqpe9TRWK+/EzRpvIW8P17rm6ROZX8ulXKh5on0FYBCG31eZLVSwU2xEMX9N3QG057YdEJcT+U7ZJwek8Loq53DEu2GFZkxN4DBxu66Ri95Lavxy7ghkl0NmxU56Wi+Phd5sSXLAGcNsE/SkeZnkHIv0TIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5ZbTM98IAx2QOYl1zjZFYcBMQMZTLMcJdNfTtGKYgI=;
 b=oXinB9y3yt698Ev4ZbUNPAkwF/iS0V0u4grt62fMBgby5Uo6NPYc7UQ1Pj2tzipOeovZKcEPX+bokl/ht2iay0OU354XGWhHNq8+0R1bQ85AJtg3lHS4I1Ht9hMVDLTJq5hX2taUcx44MeI7FItSHwqREgHBqpCd2DbwirmTlZdJHMcDibalcYMyrIplAcqx4Klo472TkaNIbva8dmCtMwqpMbTbGFN67LaC6EvLIBYuvWsU5IK/AeAiYxybEAjaFDPOMbJUfc7yTxwwIHMHRQQ190xAzNl3OIK80yijU+dX81GwBZNXvFEgsL1VAls/LlGxlXGeOGWSzVE7CT+fag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5ZbTM98IAx2QOYl1zjZFYcBMQMZTLMcJdNfTtGKYgI=;
 b=oFuaWjfREJIdHj3qY9b4It6d5jfem/IHSOLZpltbo/megQr+o4wnDcZSF5m0mTVYJjeHpEmcWTB1E5kdG/Q9qKFZujj6bpGvoa5c4YlrgvxgMZDs0ltjy8YE5r6AuEYiASCN8XRsR/zJhcNGBjCk+0y6WKi+HiEgys7RTQi126fga9cMXlAye973x4NptcwaqBZZ2euKa3FObY0f4gBVqXN6OAXDqa8KdCN42cKjn6g1W/sHMZ+YwJECbySMcRG/75ke1DFthUnMTqxf7mXIqjjbkHmSnkU2PyR7vUSVRWp7l/o7yviH9mlKn3/mT4nZzBVAT0bBEHvhlkTOsYghtA==
Received: from SA1P222CA0155.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::25)
 by CH3PR12MB8851.namprd12.prod.outlook.com (2603:10b6:610:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 22:52:38 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:3c3:cafe::20) by SA1P222CA0155.outlook.office365.com
 (2603:10b6:806:3c3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 22:52:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:52:37 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:20 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:20 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:15 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 02/11] soc: tegra: Add config setting framework
Date: Tue, 7 May 2024 04:21:30 +0530
Message-ID: <20240506225139.57647-3-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506225139.57647-1-kyarlagadda@nvidia.com>
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|CH3PR12MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 36dc76b2-7935-48d5-4753-08dc6e1f3a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|376005|1800799015|7416005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vkE0jJFIM4gUbp6cLM7Fkz2z646ZQK3rkvF0ah/ZuFt/UUaFaviL/pjQIz/C?=
 =?us-ascii?Q?aO1v37CcRhdkT+xZq59086ZupJcvuR5Z2KwRwpDKfpbml0K+tYs3lkAoSCww?=
 =?us-ascii?Q?BhFoq8lhI5allQs7VfwNFnewXz6WKYoQoTcPFq03YdgY9UqdHNJ0LmQ8NOvA?=
 =?us-ascii?Q?8iWERP/ca7jnFlmJLLgs+tykl3bo69Hp8sdrnEfn1YD9tqcaC6d/xDryO6OT?=
 =?us-ascii?Q?86j64BBS3Jpmj8QjlZnJ3HuimSxyaqCuPVINqbxbXhKwoFeFWHKFzpc7QQND?=
 =?us-ascii?Q?CJkbv/M6QYSSq25GSRq5lWWGQanViZesnZm0Mrf9t5iycPk2sv5Vg683PRZX?=
 =?us-ascii?Q?f7slU+Ai+4v4caWw6Om8CQfT6Stc4g9hfCVWojrdzNwnNa5xz3dmFM2WrUrm?=
 =?us-ascii?Q?mV0UcBf/0MjAaFaWMUr4fkrqo1Wrh3vn20H960LsOe+ceDq8jPHSMAfxfNfp?=
 =?us-ascii?Q?+f3GzpQqVwifPcUeolYBOAvvooxlYG6hPO4/v3sPtLGNfrz8y7vWKo/5h29d?=
 =?us-ascii?Q?yJtYhLpb2sJpfGXxmUOrACbmv/5PsYWIQIZJbITyHQMzHfnZhLsiWf8pNiOd?=
 =?us-ascii?Q?s65vr8sLIvBW9vfOi7zor0+QPjJJ06LAl8zwMv3yUm5T3TPcbxl/BnnXFExq?=
 =?us-ascii?Q?iwibqdnL5rJj15b1ghFDreIwB1C9jhQvn+9fgUan3nzHrCekxjCgIr1qj33O?=
 =?us-ascii?Q?5nOFtjfWfYcTcwVpq2cKMbPL9VRzQjaacAcZzak07szYCa4KuuidjtuSnQDX?=
 =?us-ascii?Q?NRKNs6yx4fYs7giFQpQDmSN6IGK+VmFjIAwg3xaD+7iM164kJCxTafEORZCS?=
 =?us-ascii?Q?QsbV9BALVG1ryGvYA06Ef1iORGF2lqF8Gavgb2Rb+z7yxt88GcavFG0DSbtg?=
 =?us-ascii?Q?qvkwYw+wO+Qrsc0ElNmToTnAhIm/iJHVlc70RLyL4/Sh8yGRk3RdJY7Dguuh?=
 =?us-ascii?Q?KNWO9BS1mKhNSg6R+DXKC5njo5UZH+tlmhVqA6O6cD6jiiRYSR502iZT9wNG?=
 =?us-ascii?Q?UZ8n3QptQP6kWbpg73l5oC9drLp8lPIQtDwf46GfXA0we4XpEo/5JQY8ygh4?=
 =?us-ascii?Q?kNjd5dkAFVQoyzwxMToz8A5wPq+ATvM4xSshvxQmIX9vXCIWx/XMnmPv3wA4?=
 =?us-ascii?Q?P889OLwiXFEp+5mH3S8coVaiNwFS6pGvdb6+OjCItH9KmbHfOYowKqkb6sAC?=
 =?us-ascii?Q?wxOQedwBKVgxWzoGEWHnrFADLsHcsaksnr5X3kJfrMnlEXOVEXkRK8G9dYir?=
 =?us-ascii?Q?x71kPc7WR12fp3mkibytRZWLvMkCeA3L5gZfKKgr2QDbgDFDavgBxXqa+nCc?=
 =?us-ascii?Q?+S9xTAAizywcEM2O0V7kct9Q5bfzRrG0uGv31DfiwrNyKJTIXL2/zfx/g8od?=
 =?us-ascii?Q?Atu3+UA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:52:37.7670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dc76b2-7935-48d5-4753-08dc6e1f3a2e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8851

Config settings are defined as a property per field and have different
modes per device. Each mode contains multiple properties and a device
can have multiple modes.
Config framework parses device tree and provides a list of register
settings with mask per mode to be applied by the controller.
Add APIs to parse list of register config settings and to get config
from the list by name to be applied.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 MAINTAINERS                   |   1 +
 drivers/soc/tegra/Makefile    |   1 +
 drivers/soc/tegra/tegra-cfg.c | 147 ++++++++++++++++++++++++++++++++++
 include/soc/tegra/tegra-cfg.h |  87 ++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 drivers/soc/tegra/tegra-cfg.c
 create mode 100644 include/soc/tegra/tegra-cfg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c788ff0506c3..9eeb749ef234 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21997,6 +21997,7 @@ R:	Laxman Dewangan <ldewangan@nvidia.com>
 R:	Krishna Yarlagadda <kyarlagadda@nvidia.com>
 S:	Supported
 F:	Documentation/misc-devices/tegra-cfg.rst
+F:	drivers/soc/tegra/tegra-cfg.c
 
 TEGRA PWM DRIVER
 M:	Thierry Reding <thierry.reding@gmail.com>
diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
index 01059619e764..8d0c8dc62c8c 100644
--- a/drivers/soc/tegra/Makefile
+++ b/drivers/soc/tegra/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_SOC_TEGRA_PMC) += pmc.o
 obj-$(CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER) += regulators-tegra20.o
 obj-$(CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER) += regulators-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_186_SOC) += ari-tegra186.o
+obj-y += tegra-cfg.o
diff --git a/drivers/soc/tegra/tegra-cfg.c b/drivers/soc/tegra/tegra-cfg.c
new file mode 100644
index 000000000000..53d181bff40a
--- /dev/null
+++ b/drivers/soc/tegra/tegra-cfg.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+#include <soc/tegra/tegra-cfg.h>
+
+static int tegra_cfg_update_reg_info(struct device_node *cfg_node,
+				     const struct tegra_cfg_field_desc *field,
+				     struct tegra_cfg_reg *regs,
+				     struct tegra_cfg *cfg)
+{
+	int ret;
+	unsigned int k, value = 0;
+
+	ret = of_property_read_u32(cfg_node, field->name, &value);
+	if (ret)
+		return ret;
+
+	/*
+	 * Find matching register for this field in register info. Field info
+	 * has details of register offset.
+	 */
+	for (k = 0; k < cfg->num_regs; ++k) {
+		if (regs[k].offset == field->offset)
+			break;
+	}
+
+	/* If register not found, add new at end of list */
+	if (k == cfg->num_regs) {
+		cfg->num_regs++;
+		regs[k].offset = field->offset;
+	}
+
+	/* add field value to register */
+	value = value << __ffs(field->mask);
+	regs[k].value |= value & field->mask;
+	regs[k].mask |= field->mask;
+
+	return 0;
+}
+
+/*
+ * Initialize config list. Parse config node for properties (register fields).
+ * Get list of configs and value of fields populated in tegra_cfg_desc.
+ * Consolidate field data in reg offset, mask & value format in tegra_cfg.
+ * Repeat for each config and store in tegra_cfg_list.
+ */
+static struct tegra_cfg_list *tegra_cfg_init(struct device *dev,
+					     const struct device_node *np,
+					     const struct tegra_cfg_desc *cfg_desc)
+{
+	struct device_node *np_cfg = NULL, *child;
+	struct tegra_cfg_reg *regs;
+	struct tegra_cfg_list *list;
+	struct tegra_cfg *cfg;
+	const struct tegra_cfg_field_desc *fields;
+	unsigned int count, i;
+	int ret;
+
+	if (np)
+		np_cfg = of_get_child_by_name(np, "config");
+	if (!np_cfg)
+		return ERR_PTR(-ENODEV);
+
+	count = of_get_child_count(np_cfg);
+	if (count <= 0) {
+		dev_dbg(dev, "Node %s: No child node for config settings\n",
+			np->name);
+		return ERR_PTR(-ENODEV);
+	}
+
+	list = devm_kzalloc(dev, sizeof(*list), GFP_KERNEL);
+	if (!list)
+		return ERR_PTR(-ENOMEM);
+	list->num_cfg = 0;
+	list->cfg = NULL;
+
+	/* allocate mem for all configurations */
+	list->cfg = devm_kcalloc(dev, count, sizeof(*list->cfg),
+				 GFP_KERNEL);
+	if (!list->cfg)
+		return ERR_PTR(-ENOMEM);
+
+	fields = cfg_desc->fields;
+	count = 0;
+	/*
+	 * Iterate through all configurations.
+	 */
+	for_each_available_child_of_node(np_cfg, child) {
+		cfg = &list->cfg[count];
+
+		regs = devm_kcalloc(dev, cfg_desc->num_regs,
+				    sizeof(*regs), GFP_KERNEL);
+		if (!regs)
+			return ERR_PTR(-ENOMEM);
+
+		cfg->name = child->name;
+		cfg->regs = regs;
+		cfg->num_regs = 0;
+
+		/* Look for all fields in 'child' config */
+		for (i = 0; i < cfg_desc->num_fields; i++) {
+			ret = tegra_cfg_update_reg_info(child, &fields[i],
+							regs, cfg);
+			if (ret < 0)
+				continue;
+		}
+		count++;
+	}
+
+	list->num_cfg = count;
+
+	return list;
+}
+
+struct tegra_cfg *
+tegra_cfg_get_by_name(struct device *dev,
+		      const struct tegra_cfg_list *list,
+		      const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < list->num_cfg; ++i) {
+		if (!strcmp(list->cfg[i].name, name))
+			return &list->cfg[i];
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(tegra_cfg_get_by_name);
+
+struct tegra_cfg_list *tegra_cfg_get(struct device *dev,
+				     const struct device_node *np,
+				     const struct tegra_cfg_desc *cfg_desc)
+{
+	return tegra_cfg_init(dev, np, cfg_desc);
+}
+EXPORT_SYMBOL(tegra_cfg_get);
diff --git a/include/soc/tegra/tegra-cfg.h b/include/soc/tegra/tegra-cfg.h
new file mode 100644
index 000000000000..ece6f63a83c1
--- /dev/null
+++ b/include/soc/tegra/tegra-cfg.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef __SOC_TEGRA_CFG_H__
+#define __SOC_TEGRA_CFG_H__
+
+#include <linux/types.h>
+
+/**
+ * Config settings are a list of DT properties holding each field's recommended
+ * value. Field info is held in tegra_cfg_field and tegra_cfg_desc.
+ * Data of all fields in a single register are parsed and stored in
+ * tegra_cfg_reg. Struct tegra_cfg_list contains list of configurations
+ * and each config tegra_cfg contains register list.
+ * Client drivers provide field and register data through tegra_cfg_desc.
+ */
+
+/**
+ * Register field and DT property mapping.
+ * @name: device property name of the field.
+ * @offset: offset of register from base.
+ * @mask: mask of field within register.
+ */
+struct tegra_cfg_field_desc {
+	const char *name;
+	u32 offset;
+	u32 mask;
+};
+
+#define TEGRA_CFG_FIELD(fname, roffset, fmask)	\
+{						\
+	.name = fname,				\
+	.offset = roffset,			\
+	.mask = fmask,				\
+}
+
+/**
+ * Configuration setting from controller where it passes the total number of
+ * registers having config, and their register field names.
+ */
+struct tegra_cfg_desc {
+	unsigned int num_regs;
+	unsigned int num_fields;
+	const struct tegra_cfg_field_desc *fields;
+};
+
+/**
+ * Configuration register info generated by combining all field config settings
+ * in device tree of a register.
+ * @offset: offset of register from base.
+ * @mask: generated mask from aggregate of all field settings read from dt.
+ * @value: generated value by combining all field properties read from dt.
+ */
+struct tegra_cfg_reg {
+	u32 offset;
+	u32 mask;
+	u32 value;
+};
+
+/**
+ * Per config info of all registers.
+ */
+struct tegra_cfg {
+	const char *name;
+	unsigned int num_regs;
+	struct tegra_cfg_reg *regs;
+};
+
+/**
+ * Config settings list.
+ */
+struct tegra_cfg_list {
+	unsigned int num_cfg;
+	struct tegra_cfg *cfg;
+};
+
+struct tegra_cfg *
+tegra_cfg_get_by_name(struct device *dev,
+		      const struct tegra_cfg_list *list,
+		      const char *cfg_name);
+
+struct tegra_cfg_list *tegra_cfg_get(struct device *dev,
+				     const struct device_node *np,
+				     const struct tegra_cfg_desc *cfg_dev);
+#endif /* __SOC_TEGRA_CFG_H__ */
-- 
2.43.2


