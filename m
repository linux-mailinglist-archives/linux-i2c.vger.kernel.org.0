Return-Path: <linux-i2c+bounces-6875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0839397CD61
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 20:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D4A41C224CF
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 18:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1101A2841;
	Thu, 19 Sep 2024 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Uj/6abpf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16601A256B
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768796; cv=fail; b=K+VngT42LBsq7vZ6QCmTSlhJpN/yS/q1nr2wgEMkRvod8Wn/H5IWggP4tulA2GfDzroJcTVrpMJUYtabYd3NlrtOKBaMlqLDNFoynVQmd3eKyWzap/ttOIa0q6YyqDiWidSO0o7gn8Eqa8D200QbP9rl2RlaBy9L071RRp9tlkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768796; c=relaxed/simple;
	bh=AbqbGHTxBBWPb45coJ21VgZHzHvv1NXcCxC4h4NcSlE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAae+H17aa/bOOQFNifkDSCnVKb2c0XBvG7F+AGV/8gi4XGLfY4Lo78L94xyJqkFc51VSN676kLxsUzwcwBVbASdHKQOFOkurBdcxi2Gx1bM+dkRZnR7yS0PrP/jS3AktWATPvd/n5Gw11qRS6mKWiDCEWuvzhB/rqvSB2TLZ/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Uj/6abpf; arc=fail smtp.client-ip=40.107.95.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPrk/iwTZNvEUlzZqCWyfrbeQfgS0ICDUl7OISsA4vA+ds2YxvSlgm1hIXrLkD7PSx3WPCFeJzdChgVQsTsprUcHZgpgZzLZLYKmllAmxGDEujUGyxeks/pmOcgchAgiAmCe97UDYwMetZcMbXyt0hxRBj1/xBjZXmBA5lbiLvP2e3u2DZUVSG4OcdhAUVVJbAkwVfm5awksaMobP81EfcPsWADTehRZRvAvWW5j25VWDuz23P1AIK44l5A5jc4xJOh18wL+k6dGZ8fwRgivRKlL1EuT0OnnpViQyuLwHvZgFDaETbUh3+/iFjGZi4jGWHaVcgEFUkswThWTAug2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfVfsrSwyNCDxBQBPfZFmSrYrSPlZ9X6QPum9UGnWIA=;
 b=S/grxhLwFofi5oHfqm8BtIh9DEiZ+CeJBl9o5r4B3gvTFSX1AkK3ug4upZlEYPHuA3zqEIwxwQfZud66/opDaPr5H/+2gDPR5tBB5r9GdTVsdmRc/jTmpgRaKID6WDB/3c6hqrcP3v7WHUyLtPOpjBYEx+ljgYBUPBKQne/JHtqn6L+ZaFkNBQTiN8wibXBAcky0QK2mHc9jkAkHSRYq+dLRI6ZFwGuk2Eazs+dl0AQc//SzJ+GB3DF4DIxNIlsFJCDMoy0Dv8gAzT7m1JqHen5CwUezWN+KFzQ1+z28AV0fOXi6ru8fxwrKn8eJR9fwO0XFKrCOKvodQFlqEH4Vdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfVfsrSwyNCDxBQBPfZFmSrYrSPlZ9X6QPum9UGnWIA=;
 b=Uj/6abpfXO/Pyu5V6k6TCXofy7FN/WPiLhMFv4UC9sklKK4FXCeMxdma7aTm9ngyyXcTo8sbJ1SZvXkLdxk57OngIsUKj3FvTp201n9OmTfCJsTyZYFj6YpV3zX2kipYH6SIlGQuwHA4lq+DbCsaDrfSR7BkDZzSnDxknRnD/sw=
Received: from SJ0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:a03:39e::11)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 17:59:51 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::75) by SJ0PR03CA0276.outlook.office365.com
 (2603:10b6:a03:39e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Thu, 19 Sep 2024 17:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 17:59:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 12:59:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 2/8] i2c: piix4: Move i2c_piix4 macros and structures to common header
Date: Thu, 19 Sep 2024 23:29:07 +0530
Message-ID: <20240919175913.1895670-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f97281-850c-40cf-cf09-08dcd8d4dbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GjsG51RYdEwh77RZ3SZbBh2TmnMPX+n0cbKw5C+HMjJzu+h6t93REDIWrz9T?=
 =?us-ascii?Q?TCVcypoC/pZtmc3pJwoqzJxhuJF9EH/hDqd+fj82yxA6Hq1gl3qxnLDkQtik?=
 =?us-ascii?Q?7AUiAK8lj0UXjxpzEl4GPINAIUCQsH3kb2a9F3zRyjboitGKJQ26gckw3vCi?=
 =?us-ascii?Q?fG59f7UIaoyvHbohQURfmOHPw3onwIRtp4YZkhHWTAnuevGVn5SImuwPU5My?=
 =?us-ascii?Q?CUDSW4oAJzT/69cwBbM0qQ1rLVgRPkTsG/ZgZrPKhTU0Q3kuxoLYDfjWe+G8?=
 =?us-ascii?Q?WkH0yOfKscDCeJ5nHyfch3lyrhgDX04LBG5b2Z4SN8D8ovaQ+GHn72R1Gq4X?=
 =?us-ascii?Q?Ncw+qPp/knkWF1iD3gWSVvA4l7JhhOa/apCCManIFazfSuwkfKTBk7Z5BlFc?=
 =?us-ascii?Q?o82wx4E71YfK+aR0Wsx84I/oH7LBzkEwIAfFDE2BFLtJBrsMhaKn+oqYidez?=
 =?us-ascii?Q?tQ7Zj6IbgeCQrqJJUeFp5D6efigVxVkHOmPr9QP9Ece3kV8a046VRlX8BSWi?=
 =?us-ascii?Q?evyLLYvrvXNWMIenG9x5hGUxyhTNe0HVAyzVWNWN8asVgxXI/scjK452pX2r?=
 =?us-ascii?Q?WybuNtrF6LRx5TzQicJoyg4JcLHebIMO6tTqEtxMrEmoXWasZPdqkJRWSvIY?=
 =?us-ascii?Q?Nebp7d8mkmp7LeJebnA/tLjkLFXrDhXMPywpQ6eaiTjdSfIqKa0B1USXlRcn?=
 =?us-ascii?Q?32R1aMsVBdiBDpgDurmiROZ5JnNtIgxWRG/PjbVKAThPI+5K6hoZrHBNbaJ1?=
 =?us-ascii?Q?adhh75qkfp0fiiy4TSSD7G637Qn6PAtyY4GqMgYxY6eHCUPVVD+yC7m8jdH9?=
 =?us-ascii?Q?996fY9wa1IyaBduugvbOXn6xy1xZ3K29EEMWJrbLhcsZwP3nR/Zpr/vdz4aY?=
 =?us-ascii?Q?E6UGEUJrouDTfyLLu58xKTYBax8/N4KXn67jIZUjb9z99a0DC2y+PYaCD2cC?=
 =?us-ascii?Q?MlMhqgdDgG3JM44qBPLuGChi+18oXNtItTVhcQd6UmYVw7PXBVCdtM7L6BnG?=
 =?us-ascii?Q?anSmJWsuWtHyg2N1cG9eUJWCzvR9/XYBgIt4iIrXyRc890zg1lfVcekf8Uab?=
 =?us-ascii?Q?vks5q+wTo1ZKgwc7mF+kl7ttpFerWZ3uHTJDtA8r5cyxkW5XTW0kWvEgrimw?=
 =?us-ascii?Q?RvsLiAfstOqoGpiU+4ca+2HO7K/HR23TGTJkicIcGKUJ+dobbDrVaZswqYga?=
 =?us-ascii?Q?TfhZWsoUirYfE0LAYO/EtjU2i8JqmFdZ4qFegRp5cyS7390rW4Bahbie8KLA?=
 =?us-ascii?Q?TMAvQiJBS4KZVGVS0+a7K+Bo9D+hkH/7goikZl638u6StePAn1bDol9+hFHH?=
 =?us-ascii?Q?BqOXW40hImIoNQPk0t9BAMytWa+bnuSygAreoKu3AuDMTo5yhgFVNfLnwaT2?=
 =?us-ascii?Q?29E1lUswhRxBNPmI/9ieu5cEOVyW4klEJJKHVb27EOqab2HOcQ2o1ZauLCPZ?=
 =?us-ascii?Q?ZlWaHvmoAA4IALRQRs0bGK1qKkefh6kS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:59:51.2077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f97281-850c-40cf-cf09-08dcd8d4dbe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263

Add a separate header file to relocate the common code from the i2c_piix4
driver, allowing the AMD ASF driver to utilize the same code.

Update the MAINTAINERS file to include information about the new common
header file.

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
index 9278c30ef1d5..815f46948c1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10684,7 +10684,7 @@ F:	drivers/i2c/busses/i2c-i801.c
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


