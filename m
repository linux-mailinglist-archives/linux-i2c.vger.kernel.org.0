Return-Path: <linux-i2c+bounces-6550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8E975137
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CB6F1F282E9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75DD187553;
	Wed, 11 Sep 2024 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XATN2jo+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD22918785C
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055692; cv=fail; b=bChv8ArPoMktra9j7jACDB8HN1eDu17TpOFG0prcNeyhw2POMZjkHecygfmdL7Sc9qz15cbn3F2GZbPdukkIqoUXObxP2zn5AwRNCO7LQ5EmxnuVh+fGCJ4TH3JXiRNCvwM6GLiNVtgAiJc7XBJl2IaoWU7TuJOi7SmOoCuNLAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055692; c=relaxed/simple;
	bh=9x4utuipeUMGcGTlkwcNySSCC5wQ19DjSbVrOMWDCm8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pskhXs17aV2VTqJEeJa9ZQDH7sP44BK/wlCxu428FqTMVkVIQyfghgMl23PLnbJXTlARS27P3RH+A3EgBI8t4SC9iq/QZCgnGyYxuCCdoZlFGp1NcXTYhPkzTy0PV6bSGmJaFBwc9s1VeWwaOHEeWBvuqO+tdnKsZeIFfpqqLXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XATN2jo+; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2lDK0aOE3NEDlRplwiZoGCb4w4CvlSFY5VKVOZIqxTmjl9jpv8sgOO1vPucJcyDC5xCE0e3HmG6UP5lfCslGjTTbod3jCOschoTUX3ha0lzhA1DlLdDfI67ibRWfJc8d9lYICe6lb8sSU2pm6HvdmlhpjUuhMoU5mfXF7zeNPcnm+Ert82SG5oF9CWOTG6SZmnSkIgBH+8pfjYR8HfxferS0EAXCKFc4qv4ta+QdiIIGXy09XJKsvy3GS5qenSsDs4lAisRz+yzqMCHaqX2KUIODvrvrNuiVuWuacg5l/dIIbd1822u4/3gbMNm8eAIXQW8AjRkwWrT+3t5ZKglLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ECkYedZWcbcZtu08q1GD2hXMgqmIYRhGYiQYFuxbkY=;
 b=xwsQn5ewTl4SJoNErx0RUW5gbOF4ZE3uKizw/begIYmj4GOQ6hu5KsXRepJ3DC4mp9WpTHCBR71PuE6NPhEaYra5jX2wpF0MVHcZEBZ3uWYOOlWnv9B3blxp0HTnFayFwV7gedjBbkzCJw2xOGEayL/fxHeo5dGSAH/4ef6ThftUhThB9mazuQfsOCZWXwELRLdMzf0hSKEFx26Ck3cgawtR5VW7KR6gS51GfusJST0FtSnl1kbJ+IcuxQH0NpDlbmkLyJnbpi+3lOOX6lJiTpMFNsHIkeDFiQJN+08G2T5pECvNHAjkEGSinnoeF+kcvb/ZKdFfrvIqJp7/c27vXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ECkYedZWcbcZtu08q1GD2hXMgqmIYRhGYiQYFuxbkY=;
 b=XATN2jo+26WluIJXozb35MpzDoUVgOuOJqB5s2FyDS61hItCxJvgQDSE99dz3T4yhk2TTSFimynpvsEX2D7CbRRgvn1IQASBu6qiYzNh7eA3ZUpy349raBwKoZxv4XnX1YUk/fPsPzTj0RzJg0L5Z7ew/r4biMRMdaYOEBGbauw=
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by DS0PR12MB6653.namprd12.prod.outlook.com (2603:10b6:8:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 11:54:47 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::e5) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:44 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 2/8] i2c: piix4: Move i2c_piix4 macros and structures to common header
Date: Wed, 11 Sep 2024 17:24:01 +0530
Message-ID: <20240911115407.1090046-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DS0PR12MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: eacb59a8-0081-43ea-b044-08dcd2588899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ixEnqu52rtRoDiqMayJPta1doBRN74HEn9MTYOcO356BPJkxLYkua4MrdchB?=
 =?us-ascii?Q?YaIqHpC00OTCWOnHvMOEmtQpOtE4pxUX1tzphCP51TAfy1lmXww3zsa2kiz/?=
 =?us-ascii?Q?Ts/VmNfpPwVLfQuA+W77oFOUV8EchhKHPnqOBEGusdo8IW3AXPkuIUXwLR1U?=
 =?us-ascii?Q?bokSKo9sidWCQbMbkIgl18IPGFtcRDLVer4HV/AmDgbs+araTju77n3cqjJ+?=
 =?us-ascii?Q?r68kgZsy2nOrshIcxYgeWWC5Y/m3ZLf+BtDpHziscQZj562kzXImRwzr8pxD?=
 =?us-ascii?Q?CNEWpvXQAo6q0sCJF8LiZtYhi3CjPB45VQ+JE9wnBXQby4iU/xm9y9NH/n0b?=
 =?us-ascii?Q?wqOhnXyt2BCQQxDGmLoyaqnD+wCphsudQmCUnZCgizU3lW6hivCQ+RbjPt1y?=
 =?us-ascii?Q?zxBQtCauBh90xDLAR+uuG4kBVEaLF66vSm3xw6iL1uqveq/BlSV471YCDt1/?=
 =?us-ascii?Q?Y5yN4vBF4c4NFlzSfh3XHELF/2/eGRnJUwfN4VjTqK8ZoZ6COmypQBmWR3LI?=
 =?us-ascii?Q?FN6diJseGc9mZA//CxhgXnmb+AKsHP1ylp7GL5RulxA8yC7IgkntmD0fPV1g?=
 =?us-ascii?Q?RzOYLxJLVkYfDFkCp5YE84Zx5N6p1PDGTh1bx18dB0USs1R5o0lh8hkYdqZs?=
 =?us-ascii?Q?KbHOJT95UVwsvATFp7vYQebzzsHM6ejZVfuylI5K1dfSPjrnT1KTEgNL8OBc?=
 =?us-ascii?Q?H7bSvgz+8eyMex/M2xKy1enJor9Voq1Idzm/uCYCtibQ8doruXmJOBg6jjRQ?=
 =?us-ascii?Q?D4v+Ef35EPgkxURVNt3hl4OmN09pSAs7b2BEkay5mr/maqOQQ9BXboxokOHc?=
 =?us-ascii?Q?0z58Zhz1lVSUABQoLdUMnHMMMe5RBuIf70lTxf+n+Fb+XVeBZlHep8ja+dVk?=
 =?us-ascii?Q?j+zV/RlbmX2l88/Fixqpx8AcCIbjDX9anPYwPnZQcgYkO30mvntYAu+GOV+Q?=
 =?us-ascii?Q?iOh+ODqzxNPfr1r+gz44hGjiCUD53jYdJrlzp744P54e0qewG+B1Zbre0ePK?=
 =?us-ascii?Q?+Nk29OJKYsCZoXdoGOf8XebujoYbIkMzSBvQn7ZIdaJhwdGakSJL9EHEmyUl?=
 =?us-ascii?Q?wbHnLV3B/ihwhepkvXFKRIkj9EU5qOO0/jLCUJS72BGYVPzbQy0gnA30Wpjn?=
 =?us-ascii?Q?oSbhA132NU4l2L2fFstftjM3BWL1zvyeeowFo9tm48uTL1EQMJN3d7CuVpOr?=
 =?us-ascii?Q?s1yazF2oefjtuPlul+D9qtM+R0NNnbwSURGSl0K/Q5suEEcvDpoXzBT/5rC0?=
 =?us-ascii?Q?RxLCC+QOTx8kT7hmZL+dkjmpeot4qPRpvdLPqn0SiClJp4rrdS+ClISOB43m?=
 =?us-ascii?Q?IJATl/e9XJKayVoBEAf7u8kBKcI7UmaHDWG7EcKt8cV5HfV90RGlBym09rVE?=
 =?us-ascii?Q?VMjX0b5oPo4lbpr8Gd4xL6Nhw7/C7xGlqA/JUcz8+lJbLJ/L8aQZp6nNFU6A?=
 =?us-ascii?Q?UwTE7l7BbJIMr0mIgTIGaGTg6CvJX/2f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:46.8621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eacb59a8-0081-43ea-b044-08dcd2588899
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6653

Add a separate header file to relocate the common code from the i2c_piix4
driver, allowing the AMD ASF driver to utilize the same code.

Update the MAINTAINERS file to include information about the new common
header file.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS                    |  2 +-
 drivers/i2c/busses/i2c-piix4.c | 24 +-------------------
 drivers/i2c/busses/i2c-piix4.h | 40 ++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 24 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-piix4.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 10430778c998..3f348b71b9c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10611,7 +10611,7 @@ F:	drivers/i2c/busses/i2c-i801.c
 F:	drivers/i2c/busses/i2c-isch.c
 F:	drivers/i2c/busses/i2c-nforce2-s4985.c
 F:	drivers/i2c/busses/i2c-nforce2.c
-F:	drivers/i2c/busses/i2c-piix4.c
+F:	drivers/i2c/busses/i2c-piix4.*
 F:	drivers/i2c/busses/i2c-sis5595.c
 F:	drivers/i2c/busses/i2c-sis630.c
 F:	drivers/i2c/busses/i2c-sis96x.c
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 69b362db6d0c..2c2a466e2f85 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -35,23 +35,7 @@
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
-
-/* count for request_region */
-#define SMBIOSIZE	9
+#include "i2c-piix4.h"
 
 /* PCI Address Constants */
 #define SMBBA		0x090
@@ -70,7 +54,6 @@
 #define PIIX4_BYTE		0x04
 #define PIIX4_BYTE_DATA		0x08
 #define PIIX4_WORD_DATA		0x0C
-#define PIIX4_BLOCK_DATA	0x14
 
 /* Multi-port constants */
 #define PIIX4_MAX_ADAPTERS	4
@@ -160,11 +143,6 @@ static const char *piix4_main_port_names_sb800[PIIX4_MAX_ADAPTERS] = {
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
index 000000000000..c4c20edacb00
--- /dev/null
+++ b/drivers/i2c/busses/i2c-piix4.h
@@ -0,0 +1,40 @@
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
+/* PIIX4 SMBus address offsets */
+#define SMBHSTSTS	(0 + piix4_smba)
+#define SMBHSLVSTS	(1 + piix4_smba)
+#define SMBHSTCNT	(2 + piix4_smba)
+#define SMBHSTCMD	(3 + piix4_smba)
+#define SMBHSTADD	(4 + piix4_smba)
+#define SMBHSTDAT0	(5 + piix4_smba)
+#define SMBHSTDAT1	(6 + piix4_smba)
+#define SMBBLKDAT	(7 + piix4_smba)
+#define SMBSLVCNT	(8 + piix4_smba)
+#define SMBSHDWCMD	(9 + piix4_smba)
+#define SMBSLVEVT	(0xA + piix4_smba)
+#define SMBSLVDAT	(0xC + piix4_smba)
+
+/* Count for request_region */
+#define SMBIOSIZE	9
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


