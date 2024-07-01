Return-Path: <linux-i2c+bounces-4542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 778AB91E395
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B62E1C22B79
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221BE16D4FE;
	Mon,  1 Jul 2024 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pB+io2HS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D19D16D4C2;
	Mon,  1 Jul 2024 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846801; cv=fail; b=f8U3AvLokLYGYdSwrAnc0jZMAtr65NtW1FxEDUtGS8yP5Q9HhTUcInGAFm3iiahl+ZgB3A9LCDL43qKhzozOuUPDhk8lbrjGiqatN2HUocUrJgRjLbb6Qs3Lkm038eeU4v+ug0k+G+Qw5s3VYEwWAB6YOMNR3xletV86tIeBcHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846801; c=relaxed/simple;
	bh=+IYrRw+YqBg5BgG5vZRAshq95I6CoCvsbHCqDJLGqYw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPiYIRLFhlZc005drz+PDgmluNg0W73Wchq45p69kh/lTTpHSXHfBBPgD7YFLz7sl8E7f9dJQSI44/jxqwZBzNeUTW3qFrfPT0eDTHOwtN0nQHJj5WqPHYPgT0I3KzbvQ/QXVG6sekXlGPn8alYLmkc2v+nQv25Q60E378apDm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pB+io2HS; arc=fail smtp.client-ip=40.107.220.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Db+6ZyMkZJhBNMUFjFeOAT/rI5kEufzSUV0XfGgErYiQQgjNQ3e9fSBQKPSoLk8suO9+kWnIPJ5OhQo+UXtQpGk4V0Xc+GqTZaQX3RD+ivDcCuh0u0uA+JKrInJ/5lqlkTn8+CyFLmAo8UqK8YkvrwLNDRV4agIm2W84M9/LqudG/FI7+ci4MaBO9vD/jYFa0vNmg6fNWucXYe+KXuCSOgViS2MRsbUc9ntlk+o8z5ZDVdsBmqAbjOVIFYxJ4dRWYCSyC7DiXxvrTslfbvoeUxv/SUjilYpOmXEtyOm4/PDZlmb833xoGm1XXQQTFFfFJGgXdCDo5V5hAqQNRpe0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUNhyDvPk43qI+RxLDVQ57An7jA1i7r3m2m9708bROU=;
 b=a4nt4KV44sJyxxCicoVj/0JDHu8eXHF8nKH+bLULir46zpfPSEc7WeWOW1hduyt9ZetKHBco4XZKYrM09hJ8UZlWct69luDAVsZKQ67AW2pu+oJRlYGQRVDm63l0a9/EGSYhaffCBmPfgqN1/e6JKBPIDdATgFXaA2HjblEZfs82yiwKhrhjG4h1QH4YzlZ02w134VWO05nNLUtdiH7FjVGnFmIE06T4f+VskLsLRzMrSz/k5UrFg7MMPE5s0oanLvFxujIuFTs2jYsqCC6caeZnw0DQ0ZF0UQ0175gz3fthafAP0Pw2JttdvcLiZBbyIg5h1f4GKsJQ7tcnKG9JLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUNhyDvPk43qI+RxLDVQ57An7jA1i7r3m2m9708bROU=;
 b=pB+io2HSubik+JmbH9+Z2em/g7BlRlDw+l7t7uWf8IsUKkg7IyqsjFlOJm90FDiQrZCGtRh5UVckIHEuEeSimFX4PHINCQQTBib973kaWFdmUrXBxsUyy22N3H48RRvpNqzh/o5wsWywM1+E/qgTK68y94aSuFfMXovqvXIDWYNiaOY+U0nmzLjX/uZGp1imaXxZjV9DAdN51a8BTEKtP/fyAbhvEaAH1LF3e8myYCssaJaLgTGTszMqPq5mTW5/vWeQxe3UvuAUIG2tlJrCJflVUsxD62p8u/Y6dZGnqtzs5ROixOmWneQd8Wc7+1Mrs5eZNl3YMc6uxZM63f1O9Q==
Received: from DM5PR07CA0106.namprd07.prod.outlook.com (2603:10b6:4:ae::35) by
 DS0PR12MB9323.namprd12.prod.outlook.com (2603:10b6:8:1b3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.32; Mon, 1 Jul 2024 15:13:12 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::44) by DM5PR07CA0106.outlook.office365.com
 (2603:10b6:4:ae::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:12 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:00 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:00 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:12:55 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 03/12] soc: tegra: Add config setting framework
Date: Mon, 1 Jul 2024 20:42:21 +0530
Message-ID: <20240701151231.29425-4-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240701151231.29425-1-kyarlagadda@nvidia.com>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DS0PR12MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: b0055b53-059a-4a5c-2513-08dc99e05320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ek/9y06E/oLh31+2Kye68yqr1yJoVojNUEYu2U5f7TKto8pIc6sYO1KAroqO?=
 =?us-ascii?Q?LZkzFhEr2ZIsKc+sf59ZrMNMxroQjL0vDV/Olf0plveBYhizWzAJ1+40+Koh?=
 =?us-ascii?Q?FDWRsjIVi6oTSSkt7f/oFHPaFO0blWUoguHsqEtikJxkLt1P9F05okMKwyfe?=
 =?us-ascii?Q?49CFJgVroE4xsUnUUMWJITZKnLvCixD1Jz1EuzpSsUWCmDQ89JafWfJbHqYU?=
 =?us-ascii?Q?pd6gmF/mDooigaWPiuXEVhPXLtY+29rZYOqblrCUnTX53Tn2tZs6P4SrUl6D?=
 =?us-ascii?Q?4IaV46I29VrMvw/kAz65rKjkEu+OYHrxKRLOtD3IvncPhbGKhIQMBhZwZk3K?=
 =?us-ascii?Q?netORCRPYETD5dNF/XZ3J3SdibITchdeiCT+DJ00FdwNYqDXSE54Qm/wLRPU?=
 =?us-ascii?Q?xvWD9oQIz1J/h+73O0SlJQqdXMYyYWiLedbWH0Ei02pNNYA/tH18unCK8uc8?=
 =?us-ascii?Q?+nb5GZ98jUI3BeLi4bvDNSKwwNg4aP5k7+b61Oj4+caXGgfMRCDRVeughV2M?=
 =?us-ascii?Q?lq2KDmykoKvkm1BfA/iab8ExDpLERhc4CjuWPFxlCMSle9mn+wVtC0A0BlFh?=
 =?us-ascii?Q?f4bxeL8mYPIVSzZngm6zDSdoU7tKN0sXLZ/Kgz16rdkqqAOzIQtocDoUvsfa?=
 =?us-ascii?Q?qUjNs/WS8vxfkaqU0BgTrGWRIF3ahsZ9Ou2b92EU7qVeYWrETQSxn9QVY+gJ?=
 =?us-ascii?Q?3kFVpDP9WxzuDfws7W+OLqEsDDZevfIWnqBcJ/p7taeAVluld1PpoWoLOCkO?=
 =?us-ascii?Q?XNFW/Fbk0ft/nOe8d8Y4PnR5Fu+TIkOJ52g1eU8g36GQosiTAwouJhnssA3O?=
 =?us-ascii?Q?/RhGycl1wVXJ1fBAbRNoMv3EA9x5Jj3sRu1SfWp32Pwe69rDAuevfWHX69IC?=
 =?us-ascii?Q?c6EQouVlJVC8x/8Ik/CeofR0kZ3HYb5BMAtZhk/7Vv9FPlDnxRQ63McG6BA4?=
 =?us-ascii?Q?d8w4IiTY/ytKA8sUTdeZdu7xTmf8dYdbUQN2C+FWIICwbA8SFzcyV0SrJgr3?=
 =?us-ascii?Q?/mon0mLbnZXnwbs2RXa7Fs5s37qpbEAwH4J6A6oG5SPwWfq3b6aKpfvZkfnn?=
 =?us-ascii?Q?v2DSIjHUkf4tQ9OOdp+MlcjS6swEf0214glGbhjcJ5iILTfFGedVBmxrivf8?=
 =?us-ascii?Q?pUX1XpLzXl0BbyjWo52z/OsMsddRD1yrojj4KqnhiPQnqmS4BMDEuTsHWIiC?=
 =?us-ascii?Q?cYbsxBTUddLF3tHlVAnLggbu5+YBM5Rn82a2HZ36M2Td9NWou7dp7fRuhYFG?=
 =?us-ascii?Q?Iiyt6T+n41ATG1rsJO1iFgdCTLLOl+nfmTN22saQ+5Kedh4W5NbeqflpRPq5?=
 =?us-ascii?Q?ctAMWC/7jHRPozoh9DSg7zyEx79Q8nWoG2eKhfMddHacpqdlw+XkhqnYeJ6K?=
 =?us-ascii?Q?m3xRongl6mZs4DrI4DDI6+jZK42zoqik3DoNG42Jaap8C4TOTCdsQc2I4fwu?=
 =?us-ascii?Q?Am2sjzOrQEdJUuSaKrH/EsGYn+4K27i4?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:12.5013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0055b53-059a-4a5c-2513-08dc99e05320
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9323

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
index ac8410ed421f..23e79a878f2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22262,6 +22262,7 @@ R:	Krishna Yarlagadda <kyarlagadda@nvidia.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
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
index 000000000000..50a15651aaa1
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
+		np_cfg = of_parse_phandle(np, "config-settings", 0);
+	if (!np_cfg)
+		return ERR_PTR(-ENODEV);
+
+	count = of_get_child_count(np_cfg);
+	if (count <= 0) {
+		dev_dbg(dev, "Node %s: No config settings\n",
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


