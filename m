Return-Path: <linux-i2c+bounces-6709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC18977F55
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8D00282487
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607571D9332;
	Fri, 13 Sep 2024 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C/m0ApDj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC461C175F
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229514; cv=fail; b=nGkBQJrm7SK7idHAH6wdelU5QG7fWZSMzPG22ZBG5kbH7vkdnESO+N1L7y6iROU0REpsDHY1+BvBhz6cRNsEoKYuhirawkfhvVGkSr4NlYNX0/sRo3i8tdz7yQ5xyg/SdrfW5OaGVq8CIIm36mOLHhALDbPxRFgAzxP6Nh9ceoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229514; c=relaxed/simple;
	bh=+j32HPHXm4u/A/zLh4xfOQyexC3b5t8F8Li1t8pWwbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LtIx4Mek9lWoZ/ft7ICXYChNoF9ssluyFckaEpXvY8fz5lsMMFkL6q8lJzDVc7AyTZYaR1PKphHCn1oMqWxaotVhZXRUAAZaqdIorSRJd7yMq2Gs8vj4+cnnHuXiosYLqe9gupVAnTDoWbQp4V+81KiITOkwye7NKVdYooUytfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C/m0ApDj; arc=fail smtp.client-ip=40.107.220.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHnFpmURAaMMdobxMGj0Moz7gj/hNT0x2oY/F0RbXtzPHB9obfioKnBcINGafcHin0rK6DtQwFKFpOMfDHuuYP7KlWSRvEZn77MPQjKTrwt10nSrjWrfYbh41SY6F9FR2yGvQScViPRrGLbrFYuxPYR4BTDJNZJXevGpKr+C3vCqbCGCoUxusNgUX7gaZ+6K3D4zKQDTdC+M9fJPrcA0xXSFJGKoFGBTWekG/0v/fPciOk2cH4R7pxPpXLl3IwYoGWZ++nfhSXl4ptSrjCMmN3Gc/8yffc4+8xuobqo5uwWP2xYlOi2IF/rlzq8xhQmM+45qd2UNFTdVQSs58BtG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itvN20R4OIRzIJrt50Bims62xjAbWdCQHMfg222Ablo=;
 b=Ur5Y0xNdWVf5DSY0CIP/cXx6nn7Y+Jgnvq1w19nuAOiAhQcwhEC+jJcepaF2gnU2NjhS7PKg/c9fHlOZQhVeSi5dqQaQ/ezaL+9wIlHtXEB1td0UX/toXyE2eOTcLV5jK+8ZMaDe7fE9QVkzEqJz4VahONOOP528z6IX1J9joZDSqeRh9LRL3CKuzoxN6i6NIJhL6tGaQoxNVI+h7NOTjEb0sFli3F2G/0QDLgfFTZ5BC0FlZUPLA9iVp6JSrC/oaGCUfl63RtrkubvFdehlmImlzrWVT8OlPFLNSBZAQKA535Gw80anz7ovesmYU7P/S6U5cHmMvdYPcAOIzkCj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itvN20R4OIRzIJrt50Bims62xjAbWdCQHMfg222Ablo=;
 b=C/m0ApDj1ta0J9olewrDc3Ce01k+NtG7SFpFkU2jYnEODthNZPEX1XmOgksMlUQwnqNrZV6idrkb7fmGGlhInW31/E6vSelbNeWcTsQTs/Idr12RfkYT8pN2qKTXqm/LV4UDP990kEBOOaXp0NzZunVcSbu1hv2ipknsskV6yJc=
Received: from CH0PR03CA0254.namprd03.prod.outlook.com (2603:10b6:610:e5::19)
 by SJ2PR12MB9006.namprd12.prod.outlook.com (2603:10b6:a03:540::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Fri, 13 Sep
 2024 12:11:49 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::d8) by CH0PR03CA0254.outlook.office365.com
 (2603:10b6:610:e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Fri, 13 Sep 2024 12:11:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:11:49 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:11:46 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 1/8] i2c: piix4: Change the parameter list of piix4_transaction function
Date: Fri, 13 Sep 2024 17:41:03 +0530
Message-ID: <20240913121110.1611340-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SJ2PR12MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: d33c1448-ed5f-4dd1-9326-08dcd3ed3ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?skApciLW4xRMh3KLBW/NYRdSg8uQexQg+zBRwRDB8mjSZzAf4AWYt4uNRjHm?=
 =?us-ascii?Q?Tapku3XKMeBvsTyAS/ESnzKeKJPl7hLx41DB4BbHrCZVyQH4ukK3H/8xFA0N?=
 =?us-ascii?Q?9sgJfpfzDigFH/Q13s9P03APQi81brJaEr95ELl5nIFRwogJzeFqnFaMQzul?=
 =?us-ascii?Q?tM5kl0qq3VpPYty+/sB+vbZDhiwkrPKNS8ARb7lz8tJW2zUphUYeFTZszmFm?=
 =?us-ascii?Q?7HjtLvrFIVZyRzX7RIV5oZYT49HPZi3xMQwdRkdja6QP8mmCQ3BiN4zePFbK?=
 =?us-ascii?Q?xAY/kXEHQ4WMpFTjQFxLXaj+25tfwhnoSXGTKGklXMRrvU7Wy7/ZzQgGwrl7?=
 =?us-ascii?Q?g2s2x3EtFG9+6hrHtzxjGvUuwIv+3L2deu55QuqJf3D8Y1XJcR21Ej06ROtu?=
 =?us-ascii?Q?hYZFhJFWQjB+II+ROfI/TVMBqCKsq5+bgSdCKo+mXnkDL/KM8aoxjR47/VZB?=
 =?us-ascii?Q?Cs31kqwApTXsLXm8/veNpmDRxQenh/5EbWmGQeNS55aWLFEZyU2aECIDEXb9?=
 =?us-ascii?Q?u5wNLqr7wg1E1ZR7UloFiCPDlWNpxN/1FBVy4FqAbXzJsQjhpKW/QNl1g4k4?=
 =?us-ascii?Q?p7BgUb12QU51M+72izinbdKIimuBHNK2ZEsI1GJlDuPE00TlWHrBzEwlwvRg?=
 =?us-ascii?Q?4LAHvsAhMFj7v/Ysay+sfYk7RHTVNhiSLKwyyVFQrS+dKV8FDrRVjLCPZbSQ?=
 =?us-ascii?Q?O4hUZyRkHPQAzVBGIKUsu8Wn9n9aXJGpyTOC3kyWJs0SneHsArsB3xwkSwiv?=
 =?us-ascii?Q?xm9AL5wGR105tdcPuZk9++MKHhv4Ww/f/aLj1uK4TnxVaXyK5LlGW53PD7UL?=
 =?us-ascii?Q?Xc81Toqat2cHTo0DSlRgm6oOp/QB2WM8yb4aB6erQJ3DyIDtPvXJDxzRfO2q?=
 =?us-ascii?Q?Fo6xdz7+vE0Vtyz8jHfsy+7FYJQJ1POLk4OACHXRyjmm9xMb/K3DPV3NkAAn?=
 =?us-ascii?Q?alZrSwl1Q2InXBz/vekQUXnb9R/XtLNizwgKTwYRqZpxVS/qQp1gfJKdeIrh?=
 =?us-ascii?Q?0CH8aAZc5TbniID0sYOp2xAJ1XWvnaWfjrGGrFr1Yj4NEFOE4YRNJUPsIoRA?=
 =?us-ascii?Q?C9he0YCRbpZFwkqx2ok+Ef5+0csKUilX2qVl0tjzcAjCOfOrwpzL2h/kp7B4?=
 =?us-ascii?Q?irb8loh7/9Ia4eYlpllYtPQxBxu4tRhMw5wH8UEFaYjxd6+wpSOuoCFUSLYc?=
 =?us-ascii?Q?uKXFVB2aHr8cEbFIXuIw9R7KdQ1Myqs7XDJDWeJSkUNddNgoXCO+Ha+LzfAL?=
 =?us-ascii?Q?0e4tvdaalxyQ9E8x9Bi2ZU1PJiBgfjpf8WYvy9+HSr8KfPhRO8SOuIweeG0p?=
 =?us-ascii?Q?RT81D+COik9JIRTGoBAlzdKIHzQEp0UDoTkOzFxu6w9zsXovU/dv/jxZTkbY?=
 =?us-ascii?Q?K+YVNX+KgT2LF1XZHV4ai+OCbBKE82uK1e3//Rpr0pxTYU+KsQe+049mo26J?=
 =?us-ascii?Q?4c+v+qTkqiRuzy3QIILrG5Qhv3we0+NY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:11:49.2348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d33c1448-ed5f-4dd1-9326-08dcd3ed3ec0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9006

Currently, `piix4_transaction()` accepts only one parameter, which is the
`i2c_adapter` information. This approach works well as long as SB800 SMBus
port accesses are confined to the piix4 driver. However, with the
implementation of a separate ASF driver and the varying address spaces
across drivers, it is necessary to change the function parameter list of
`piix4_transaction()` to include the port address. This modification
allows other drivers that use piix4 to pass the specific port details they
need to operate on.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 4e32d57ae0bf..69b362db6d0c 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -536,10 +536,8 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
 	return piix4_smba;
 }
 
-static int piix4_transaction(struct i2c_adapter *piix4_adapter)
+static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
 {
-	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(piix4_adapter);
-	unsigned short piix4_smba = adapdata->smba;
 	int temp;
 	int result = 0;
 	int timeout = 0;
@@ -675,7 +673,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 
 	outb_p((size & 0x1C) + (ENABLE_INT9 & 1), SMBHSTCNT);
 
-	status = piix4_transaction(adap);
+	status = piix4_transaction(adap, piix4_smba);
 	if (status)
 		return status;
 
-- 
2.25.1


