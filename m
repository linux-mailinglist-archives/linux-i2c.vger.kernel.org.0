Return-Path: <linux-i2c+bounces-6710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05A977F56
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F5021F21E1A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0D71D9340;
	Fri, 13 Sep 2024 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3KgtimCT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA91C175F
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229516; cv=fail; b=IIdcvSpk79k9LnTxwqKHa0z8OqOHwF5wZYPK3BYmCd9Hvd1QnlmGJQnSu5eDMNdz64W2RABtHwQYMxBZiuX+sOGNbbs6Q7AJ8wNofo6ZurB8kKamxYFmDMrl6z71VTI3tTSZTOtfTvKOSg0iSAvXBrb4W9UVopjPBNx7lBQKY9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229516; c=relaxed/simple;
	bh=9x4utuipeUMGcGTlkwcNySSCC5wQ19DjSbVrOMWDCm8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGoqxlvnMJnz1m1ZpYn+6U2uuf8/8EqXKNMVnO/kDemMwUupF9rpmeuU5O6M/2tPPF5izXKdP5caBcAuSrSY1lnn4FlypBE/H6YLq2kAJyVgMfdI6GTY83SqwEpPQyS7tkFPNlnvMOlIoDV6aBQYvQtpdskjAYWBC9/OyfZ+RaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3KgtimCT; arc=fail smtp.client-ip=40.107.244.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3exlR9PgEoXhZrz6pq5r5epNtq0vhazwrQQEof7/z8Rex60AoBFTAm3Axei0CyfLLy2IFPZpJvP51lMHdP0ysVUc9jnqpxZyWqk2e2xvo0ov8DDhwSjwUk5GYjbjLPaSZWc6k6YuBeqMv5CehUgZ+rdDjYH1sMhqwBt1HSFSxo/KUk+NrJ20CYhQrZ4eDGEwRFGI0odUHbAj6DaAoe6YpW/Z4pYKOIXtc2a72zSpEPoDmZ6C/4reWENqZZPaSZrqe+uE4cisjIl+Y8xoja5+R//A/A0zuYvR0w0zdBonB8dqccOXsErWINs1tlOOavF2xydFq5wN6CceRSoDK780w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ECkYedZWcbcZtu08q1GD2hXMgqmIYRhGYiQYFuxbkY=;
 b=eoGEy5OOP3+dZZGk3siO7Yfo3ZDXVBCUFE2yZyONckzAnY44W2KSn6KbqpsCaTeb6R8o0ft42zcvOojTJ0uwU5rwFpL51SEYg4UsG2VOoYalx1ZgcEWR/HsJsuPhN/RfdsCMAyWwFqoO+mw37yuTq65BDRacwWTHTttyAHld/MWnJT12Qzz2wJ/9IeqEpHk9wR01ZeFjiwen09ech0F5fLW+ZU/sORUSWKEYSE1wKNMbNiPGWYMXmAvpGItFtq9sLcy07Dq1CxjQII/mzRN5YPZGF+HAOzAohljVrA82mi3lnS2E4dch3jJPciHFY749GFVh4ve4FQJ7G43ho+dkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ECkYedZWcbcZtu08q1GD2hXMgqmIYRhGYiQYFuxbkY=;
 b=3KgtimCT6Dj9PoxufYeM3lEd3QcKKaWq4OLyuzQb7bH0mh3qeRi2y8Dix1RZM0Fz3t7R9SJUg7ZduxcCKh0CJ6XuPwfiwdlCbb8Y89VYjdXItvZBC2SQle0c4FWBo7YhG3YJdvG27yl4Arnv6Z5TOGOK4o+kNEaciVziZzhvSlM=
Received: from CH0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:610:e5::8)
 by MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 12:11:52 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::5c) by CH0PR03CA0243.outlook.office365.com
 (2603:10b6:610:e5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Fri, 13 Sep 2024 12:11:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:11:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:11:49 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 2/8] i2c: piix4: Move i2c_piix4 macros and structures to common header
Date: Fri, 13 Sep 2024 17:41:04 +0530
Message-ID: <20240913121110.1611340-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 2649b059-5b97-47cf-ba5d-08dcd3ed403d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ytXyNAKlxtx9hl3aAhtWexjhthlmew7EBZSLwvgZrK/HzE4zWzeoOhZEwRnk?=
 =?us-ascii?Q?1/o4939tO0dqnNySZHZuS42cxCtgmyZOuzjvW+2OF4y5Z5eAYq33ySEVEGdW?=
 =?us-ascii?Q?8wpkSdY7DEEoM8EYg3BOBoE1aZfiti4l7X/mv+AaYLbpqSadZys8clOGS7oS?=
 =?us-ascii?Q?WSm31EahIYPoUnGEA8Qixebz2UlV9zZjKgmxs3S+R3u4Bp9QW+ClH/16dhSe?=
 =?us-ascii?Q?o7Xy5oq8HZjdNepRccQ1U5apv2r7xX1YNTnw/bOm5mJjLcddh/uPvBNw666q?=
 =?us-ascii?Q?skhiFzzul74F1P8vzLia5ksDx4jDqY87qgWJKwF3I1akp6nD3rFM60XualZY?=
 =?us-ascii?Q?Uob6f7iP4dQn95XOrvUM45N8VJ2jH0xnibFiT8+iofKAYiYLkZUps+sJFdC5?=
 =?us-ascii?Q?h7GYHJroudDeif7eJVwCLXDWVMEkgzc8Fy+BNWKqMi7hlXTTBDEuIZJG8cx4?=
 =?us-ascii?Q?qVSVC4yJsK0Y2APsE3rJN4av1wvdkEHK0HHXkZpvbitRrU/X9yQxvrNpSM/8?=
 =?us-ascii?Q?MEcJIJKXRqkqzcGIe80fc06a2Xj4P82QvkKipCwIzXKG3IvKCcVBKi0cnjUU?=
 =?us-ascii?Q?/uAr5bjekMQ3TBoKIxU7Uk4vd/Pj1SJztSBwFaTtvGnAwwAOgmiPqLJR4KRm?=
 =?us-ascii?Q?a9kWko/QzoNTPtnLJDtCVchoiteZJ/rUBloC5Myy/3t0KJjN43EYZVoKd5MP?=
 =?us-ascii?Q?3H2dNmgFv6PA3ZwQSmt2dgrQ9V6gqOt0LEHGtpGJbBFAXVoaELtFsD+laeGm?=
 =?us-ascii?Q?v0YrwQ1HSHhol13Oi+by5yb8kYvuKSclB4BTBHucKbfkOhCSr/krFbDJM9xW?=
 =?us-ascii?Q?w/YGzq3dkXryH9GsYxw8lv6Pzk/evqNw2IAVs9pNYYWK0dBLfbHv09JJMkpK?=
 =?us-ascii?Q?DuredjkNuYJaNLPunM/Ym0hu5r2+jCPN/O2mxW2Ntot/xzHi9VMSWaOj+PpV?=
 =?us-ascii?Q?vzTlSKt8zWA+FWxDRXznEndNmo2nNLA7AqD8/D4LlF3QqiQW0t7N4jGjQDQC?=
 =?us-ascii?Q?9Tefv1JoZhAP/Xs+E/BxM0HxgedKEW16P4T/af9bERxWN3xF9bQsIildilh5?=
 =?us-ascii?Q?nFxaiM79ZklHgvUhDZgoE9kGuc8nmA6oe/JamujCBg6Zn6cmNN5CF13wd+Si?=
 =?us-ascii?Q?5XCeSEhsNUlBZequ4ucglbxIZAhrb4U/Nw1Ivh0alQjxDSJhxCYEa4BMn3Yy?=
 =?us-ascii?Q?BLypBvq37PsdqqHPthZsjsz7GZddJVK46lJOzPN2tziMBT1ixRfP6bJ/6Muj?=
 =?us-ascii?Q?DGwC/TBloeYuwfHA3KrsyFUs95L1r1Vltoadotpr9Xc4bFMfuW3NOKP3E+Tc?=
 =?us-ascii?Q?Z0dRO2B0Ze1lram9rnh9jJBXz45bKmWemboSlk/tukmvpXOtGicos6n5mg4J?=
 =?us-ascii?Q?7U/7+Rr/hoRVKt1hJMKcuSXIRDYqBk1dSW4UpRZUI8kC2TZWofxUZykmGjjk?=
 =?us-ascii?Q?l2r9Z+xeaIVzVqHUnGD7gy2dxKCVoO5S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:11:51.7483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2649b059-5b97-47cf-ba5d-08dcd3ed403d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086

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


