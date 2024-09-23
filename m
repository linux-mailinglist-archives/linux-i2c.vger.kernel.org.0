Return-Path: <linux-i2c+bounces-6926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC5297E728
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2942CB2080C
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887624AEEA;
	Mon, 23 Sep 2024 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XqZocTnd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7A9374CB
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078738; cv=fail; b=hXQAz9XKmEFhy9qMjqnBW/UbIEt8hJCmvQlPmq7S4xEyn8cRUrFuhf71f1gqyfaRC5BEIPji0zTcrvAtL2SvCiWaOFruilRVBPJBr3i7a0Y3IPk+sioV1mbJzGnU/5IMs/yQzGGF3l/OK2Hav0IoNWAdXKaixj0K4S6+BVDUQgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078738; c=relaxed/simple;
	bh=0np9Q4YMX9GidrQpmWyAccGDMdiDOgJ7V009nqq0PL0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t7QOgVwOCEToMlCnQ0XgFe5NVyF9k59l5WlDqVtfCGWEEmtiliH4mTHQk6OWzIayZI6dEXrdF4ZcwTgHEzQlpSqENwV1PmUKIx1xflvTp9RaLXQbwKyBeEzqW3PvYGQjMHE0K4KyBDbtz2jVAEBX+khQHhkIHUzsIznreSHPPik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XqZocTnd; arc=fail smtp.client-ip=40.107.223.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCSy5BYIDxKp/OcgmmWtvmIVCkNFpxT+Qt9JtcZk9mv5ilhGAHBHegakfU9u85a9PUNXVj3uCxPKW2uKftQlr5nZruG7+zSgaGcesISga0ohclO8lgcPJD3mMfsIvmwYm/8A+ELjqQeEe2FbfaHj/pt/tfoI3KiJ+xEOiQH/qZjizmXGOR7tt76JTkBQ10jPNWsXqP3CUSr2qihZA1ie2XSmt5IsUICoDYCzAAT/4muVsUT9gJ3qaTmdtxke/d5aEXU+8Ife2VXh/Tr69LuXvT6+zDcpbRNo1QMBSa/qBwbs5hGs10QpsjIVGMLZwSIJPedoRjntnF+tPYL13/ehww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FQ58NbJQnHFYAtd+1lDyy+EpF5JHd3+o+0whg3I6zI=;
 b=wJ9saSz2MGEIn9ZBxXqfLj8B2RX21YgSFp32ZGDxYQ2MuWd+veYkyWVkZqBLcYpeClt4kBy//M7P1iwQuC19XBh7mMUQMvnmBcbnIgwBrkMxA4319P3rdfilFitY//kw69ODrKInLusDoU0tppRRLZZCotXkasTBRt1cV8TU0OcVXcxgfgQyuaR581PbBtiARdmJrJnThWhUKCStHp58lzq18ajV0kbA0COJokB/4+W11QNRljJ6Lbo1wOyLYjKYfy5R7oVoi/UPSuhoAU0hPOewWsk9KvOclHzS52etfMxvIXIp01284nxcOY1jT397s7SJ+vhK8dusFE6KPjHU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FQ58NbJQnHFYAtd+1lDyy+EpF5JHd3+o+0whg3I6zI=;
 b=XqZocTndUjeE69M2500evE6eQ3LLdAamqI0ATUQ7OKSgLv+4UxcsOJ3dzA0bv5IdJz+pwVce/SkGVtcr8be96cJuCSn8oszMJu52KBMUCc/MBfVJosxbBq+L6ZyP9GsDTolrUKTeoxj6MZws0vS3m3QE7gcAPRcgmN4grHi3s1w=
Received: from SJ0PR03CA0376.namprd03.prod.outlook.com (2603:10b6:a03:3a1::21)
 by DS0PR12MB7851.namprd12.prod.outlook.com (2603:10b6:8:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 08:05:33 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::44) by SJ0PR03CA0376.outlook.office365.com
 (2603:10b6:a03:3a1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:22 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 2/8] i2c: piix4: Move i2c_piix4 macros and structures to common header
Date: Mon, 23 Sep 2024 13:33:55 +0530
Message-ID: <20240923080401.2167310-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|DS0PR12MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d1a12e-4695-40e4-6875-08dcdba67faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bkK4un69T4saHs9//Jlxm5cer9qHeK3okTdFV8uhpM8+/ocRhM3G59V+5WKi?=
 =?us-ascii?Q?xup+KH+IdKGViPJtqIF7xzF03ydhl3zsAFO3ANJcdeIdLrnOWiGT2TUJucOb?=
 =?us-ascii?Q?5WMxrqWr4Bkf3c4zFVJBdJuhfDDbsVcPV49Nu082Vzsrr3rKFqGapeUecqbR?=
 =?us-ascii?Q?mvrWCJ/DDgrJUBTn/BsxBz0nFvWATuw+OnKBTyj3AZonFqWjItDALJ0iwnxM?=
 =?us-ascii?Q?AaITQ7otteaKXiSjfpxHJd/0I8JWYY/4KMR9Di20svlBdIEs1NRLDTVcjNp8?=
 =?us-ascii?Q?Fa1nP7AafOZ5D1CMI+RW3WykpEUln1lCmp6a6+fbuSRrf2eNKycZgo9rlbUF?=
 =?us-ascii?Q?hzs6lVbnYpK/+JmG1MtHfkgpN7tfYWPv7u9OeG8Ew4GuMBKk/hysCNhe6W8e?=
 =?us-ascii?Q?ewhP8da0uAzajcO0Ju2o4DlQOOx78EP61riMoUsLYz6xre4wSwOZV2IiHTVY?=
 =?us-ascii?Q?6yZBaH6d2SmGoCl08XgkYugAK/r5/0dV4KjNYoCBnPsIv19POcjaso5zexEA?=
 =?us-ascii?Q?dtFQOAS9HH1AsAN0eE/1hxEU10DTlW4/f5+SvblnarCYw5z7wUoJHImytPGs?=
 =?us-ascii?Q?6FweN1vsSzqiJzh02RQsuarHwY5qB114E2f0WDLEqRJdw134XnvDWJ1a5MfP?=
 =?us-ascii?Q?OLFtRWiYsGvzA0WwHVwyDwWx9j6eJ9LWSD/IX3rhNJFemAnYX7xpIlLpXzbu?=
 =?us-ascii?Q?wK33h6qK245bsUnui5kBYtgOQLtMmPVcXLRkfKmYY0B0LY1jnNBj3gdGWpIN?=
 =?us-ascii?Q?AJpWFjPkPlxAf2tJUmog5Sf+8M96YD3MmtCDMMbszGZ9AUzQnl5dunJrr3XO?=
 =?us-ascii?Q?b7LTJ4RA2wBcYWf2sf9GLNP/OqNlWvINzQNfdLg3k09BtUQ10WKiWnac8+u2?=
 =?us-ascii?Q?eTTxkQpb/LUCpikLU0pyIuRJSJg5Q/KPgQsSSvcc3UmIKTgPlPWYpwE2ssV0?=
 =?us-ascii?Q?6lBR5D5zxDqCTLfvGodhQ5ZWgnUFXVekVOltT7vD9VZtzQKxn713GVBplLHT?=
 =?us-ascii?Q?Qli7eYJH85+i8/s3Fwlz+tcv0UAH/1nlX1ng73FuEKJ0Zf3V9809N0YKNY1E?=
 =?us-ascii?Q?DdU+DaBAA19XyubHH150czm1xazW0KNqfZkvkNayLUmUcPW+mqIz7UaWR/wj?=
 =?us-ascii?Q?n6aVt7LDHTt1/ikWP3rCMGT4NJWi+wmS3mw5rfiTyHrA9/8y/0Qlh/BgubBk?=
 =?us-ascii?Q?4B1QNsrmyP22RJj6CaqWOs3d68kT+nECZPh+5BunkxNJ7akHMlLRH5HtNY95?=
 =?us-ascii?Q?9AmJCkCJ191WbbT64SmqezznaW9IFgFm9+0qZ5JAl8/HZzy9v5nM7z4psziD?=
 =?us-ascii?Q?pmdq5ib0laCaBPUhbh9nVT75XGOWIfuUrjafdPD1/w8uBLt9Sy/nr8Ym+ovu?=
 =?us-ascii?Q?pCIBWpfYrjXAvypgCdYeAxL/7nzp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:33.1617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d1a12e-4695-40e4-6875-08dcdba67faf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7851

Add a separate header file to relocate the common code from the i2c_piix4
driver, allowing the AMD ASF driver to utilize the same code.

Update the MAINTAINERS file to include information about the new common
header file.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS                    |  2 +-
 drivers/i2c/busses/i2c-piix4.c | 21 +-----------------
 drivers/i2c/busses/i2c-piix4.h | 39 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 21 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-piix4.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7387afe8f7ea..e1765d39ae75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10687,7 +10687,7 @@ F:	drivers/i2c/busses/i2c-i801.c
 F:	drivers/i2c/busses/i2c-isch.c
 F:	drivers/i2c/busses/i2c-nforce2-s4985.c
 F:	drivers/i2c/busses/i2c-nforce2.c
-F:	drivers/i2c/busses/i2c-piix4.c
+F:	drivers/i2c/busses/i2c-piix4.*
 F:	drivers/i2c/busses/i2c-sis5595.c
 F:	drivers/i2c/busses/i2c-sis630.c
 F:	drivers/i2c/busses/i2c-sis96x.c
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 69b362db6d0c..4f070863a2cc 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -35,20 +35,7 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 
-
-/* PIIX4 SMBus address offsets */
-#define SMBHSTSTS	(0 + piix4_smba)
-#define SMBHSLVSTS	(1 + piix4_smba)
-#define SMBHSTCNT	(2 + piix4_smba)
-#define SMBHSTCMD	(3 + piix4_smba)
-#define SMBHSTADD	(4 + piix4_smba)
-#define SMBHSTDAT0	(5 + piix4_smba)
-#define SMBHSTDAT1	(6 + piix4_smba)
-#define SMBBLKDAT	(7 + piix4_smba)
-#define SMBSLVCNT	(8 + piix4_smba)
-#define SMBSHDWCMD	(9 + piix4_smba)
-#define SMBSLVEVT	(0xA + piix4_smba)
-#define SMBSLVDAT	(0xC + piix4_smba)
+#include "i2c-piix4.h"
 
 /* count for request_region */
 #define SMBIOSIZE	9
@@ -70,7 +57,6 @@
 #define PIIX4_BYTE		0x04
 #define PIIX4_BYTE_DATA		0x08
 #define PIIX4_WORD_DATA		0x0C
-#define PIIX4_BLOCK_DATA	0x14
 
 /* Multi-port constants */
 #define PIIX4_MAX_ADAPTERS	4
@@ -160,11 +146,6 @@ static const char *piix4_main_port_names_sb800[PIIX4_MAX_ADAPTERS] = {
 };
 static const char *piix4_aux_port_name_sb800 = " port 1";
 
-struct sb800_mmio_cfg {
-	void __iomem *addr;
-	bool use_mmio;
-};
-
 struct i2c_piix4_adapdata {
 	unsigned short smba;
 
diff --git a/drivers/i2c/busses/i2c-piix4.h b/drivers/i2c/busses/i2c-piix4.h
new file mode 100644
index 000000000000..32da914109ba
--- /dev/null
+++ b/drivers/i2c/busses/i2c-piix4.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * PIIX4/SB800 SMBus Interfaces
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *	    Sanket Goswami <Sanket.Goswami@amd.com>
+ */
+
+#ifndef I2C_PIIX4_H
+#define I2C_PIIX4_H
+
+#include <linux/types.h>
+
+/* PIIX4 SMBus address offsets */
+#define SMBHSTSTS	(0x00 + piix4_smba)
+#define SMBHSLVSTS	(0x01 + piix4_smba)
+#define SMBHSTCNT	(0x02 + piix4_smba)
+#define SMBHSTCMD	(0x03 + piix4_smba)
+#define SMBHSTADD	(0x04 + piix4_smba)
+#define SMBHSTDAT0	(0x05 + piix4_smba)
+#define SMBHSTDAT1	(0x06 + piix4_smba)
+#define SMBBLKDAT	(0x07 + piix4_smba)
+#define SMBSLVCNT	(0x08 + piix4_smba)
+#define SMBSHDWCMD	(0x09 + piix4_smba)
+#define SMBSLVEVT	(0x0A + piix4_smba)
+#define SMBSLVDAT	(0x0C + piix4_smba)
+
+/* PIIX4 constants */
+#define PIIX4_BLOCK_DATA	0x14
+
+struct sb800_mmio_cfg {
+	void __iomem *addr;
+	bool use_mmio;
+};
+
+#endif /* I2C_PIIX4_H */
-- 
2.25.1


