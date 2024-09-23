Return-Path: <linux-i2c+bounces-6932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB0697E72D
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87556B203DB
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7197C4F215;
	Mon, 23 Sep 2024 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3haUl3IZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE07C49630
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078746; cv=fail; b=BIIOT4r3iATfPhGSGRUCtuIAV8cwwbU6Tr8xeuAwxqMWUgYNUW+AwLiPbHUC4az+R4IXOlU8LqcTkIOOQi7TNoQThQfL7XNCXvPg7CVZ/Uk9fGEXRk7+/QhdXOr/FbbPvkXFQrt4XvztcZPfSXMatFG2VNvKFYAYXVvoeU/GUFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078746; c=relaxed/simple;
	bh=5Hugl5wpLdyyRGxsQhfI2qbkvTf4hOFMQ6+CBbOCjSs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNe9KKJV1/x0Y2VRkTe3iXLRFBux0wNx43otGMJNaH1nSr3EgsNRyHUYgzmf2hOj7FHJRVPN2jqBfwXvg54p2b1KadOhu22qeJnEkr7O6ahzPmNriI+m263fsrHq7tU+5n0kIC0NP/QV6RtUckp/X4ll+y9zPIyM8qNnKtDnqDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3haUl3IZ; arc=fail smtp.client-ip=40.107.244.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5pAUas4uMBPHl0u3vNs0qdZ9xAQwO/SPt2KL1v5Fj8u8YH532NCASPEH/Nmf3lLw7VnPSGxR28/2LdnJORqIt6SMqgh7vG3kliLrCE8+C58/sb/FBFtlWkU4Aoja2WLLRTjD+XEjbXH3D94GKBwbaQUhlzWd8C3F985LIdWtregtrx/igPFKmQLGgEIN+8P3yqvyu/SBuYTbAE5OUCZCX+zYpLVjKCmeP0S7Tl3kGuRBTkJ/+2lZtahs5elsKHo0x2Z8fHLGN/SsrcpTNZMwy7/Fo2ubwnW8ChuaWNBnsL0oMQJ/3JoJ2JmFCnkZdtpMThFVfw3P+LvHZyeQsJxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coRMp6Uf9IJg9qAgO3Fmn7/PsVS9ybJStmyYhoOmcA4=;
 b=P8vFmZqqdWF0Aoo4myH41pOhLstnZrEAq/Pu1hbp0QsVdHn5c3HEPvsOssPMNosA3Z5j/MTr98Idu31xl54W815M8IXGRXgN90Oz9zWAMfuO5aESQKuJJKiHncA3H9ffFiazKX+mPhzV+UIrA9+iMqcPhfZ5EqbrXuGjOvwLQurm6QxJDGWP0PlcUq74vHJCYj147b9LnBPteobfhohnx2eQ1JJrvxcTCw0pw4aTY4r2v+efOwWPdUQ3enCQGoAPWZaC6ZUM4CQ8q7lRI6EEhKtFSKzn5Qk4oQi2+XPlsPXtr2hKY9XG7RD4GS4jCt3HffflmEvbm28G2ahTABJeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coRMp6Uf9IJg9qAgO3Fmn7/PsVS9ybJStmyYhoOmcA4=;
 b=3haUl3IZ8Q4dhwgrfjVZIrb5SDEivX0tSN+7h/2uddGiqHIn073pBKXTeIBf7CeVMQmzmuXd2xMXtiZR2lGmcdjkkt8fOBrzejQEqjaaiI2IR/PV5xlKUJ5SKt2xo3V4+w184S/gPES9qowEfEBoIE2kRDNgyfYi4bub6nKk4gQ=
Received: from CH2PR03CA0029.namprd03.prod.outlook.com (2603:10b6:610:59::39)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 08:05:40 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::b3) by CH2PR03CA0029.outlook.office365.com
 (2603:10b6:610:59::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:37 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 8/8] MAINTAINERS: Add AMD ASF driver entry
Date: Mon, 23 Sep 2024 13:34:01 +0530
Message-ID: <20240923080401.2167310-9-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 485150e7-2546-4a9d-8097-08dcdba683ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nxEzpJJ0F7UnlfP3SrJnC0OyRcuP83P4qgX0Rz2uCNcTifLMa0af/rF/kmCc?=
 =?us-ascii?Q?Xcq3rUh6tELD/7b2EzRU2BnT5etRdU+L79sree4YHsA2USvQf3WM6Pj1K7En?=
 =?us-ascii?Q?iqza+pyedfX13jF9V+fz9CBk7GCFOgPpLPUpwBSGNZuB4t+Y9C6IUEGDvqhi?=
 =?us-ascii?Q?2dPYBkPVcs50TNb/ZjJMi2kc7lEt6KBBFQPozFWfNEAlYGDj7f+eOrv8tyx3?=
 =?us-ascii?Q?gelt718ixFcwbpHa0cm47pok73/B2pNlrzjQUihDTi0W2enoG/PvqqZlrCiu?=
 =?us-ascii?Q?wUhk32JM9w2ckXiI5lz3uWHNBZYS6Wn1lBzr/rJJW+j/J1/53yiP1MR6Q+L/?=
 =?us-ascii?Q?3YxLxpChbPU4QEaiVRGQ5SSN1Q8MTBfv+qyyRHSeu7S1jW9G68eWCmt4UGPs?=
 =?us-ascii?Q?Ix5QsPqcZ9Gl9QKCJyzmqJRzfVni7jTdTJhqzKLeErD2lElcQGqr1jgGJ0wo?=
 =?us-ascii?Q?lxc/PrHs9wjrizHwf2He5FcGypLp3dU31/S7lYTyodARjjnQrxGNBnuMIRJX?=
 =?us-ascii?Q?YHgvabCfdosZj7d9eaHZSbikUtAKu60ORXQJCGe0uvQ1zqHMO6eVCNgkD5y2?=
 =?us-ascii?Q?V9NZijFGyDL0OvDKYlNHfz9IzposEgRjNL5tl4CKEKyWg21UVmN1LHnrO9Cc?=
 =?us-ascii?Q?XEGgfbaz1gyxw3CuEU4Z6rArLQmUTSBruY5Kr3CxQdzvUOKmH89vw/tuTtsp?=
 =?us-ascii?Q?fridaxcRifc4EKuT9hQmmOYXMpiDbDkm5jC25+uh/KKUX4zXE7pZFGVQNCyt?=
 =?us-ascii?Q?02skwx49WbWSTPvVf5sltYgaG0+cySlW9vfdBGSOuqKB0ShJtia0Qf1y+i37?=
 =?us-ascii?Q?Qljf9hz3qA6l9l5DSl5NdQaZb8uY5eC8a3yg0f7cm02ENycJvRLQuI5S3vIU?=
 =?us-ascii?Q?bJCppq4bo1oAePPLOaufD9eC3VsYJDDUNte2iWDisz6/NjteEwpVjx561Cc3?=
 =?us-ascii?Q?8UOsvPrH4GL6IWphUJuNMYwQP9bCb7C2BpSihjQIEi/gUwuomQeyPD3SRJVP?=
 =?us-ascii?Q?MEoh4IIDVVuP0ApJ03uIYNn/vtyvlUEa3qnP5LYKchSNFL6FLSA8IJvhuqs3?=
 =?us-ascii?Q?lvH1A3JdkOyyyBLDBw2Bp318hIUSLXHtIFPqEhfrFE/X4gtVwPHYKZX5Fg6Z?=
 =?us-ascii?Q?xysHpZzTRKLGTloujNq0GepHMifGK0ZqGER77HD4hbspaH7Y3MDqx4h83UfX?=
 =?us-ascii?Q?3yW+Vd3K/en7Iyz3L8EWWqD2SIV2rEaSFZWH9Otn56rN5nGvfCKqHSRdivUR?=
 =?us-ascii?Q?a3BEuPeN/wJsttWkNX1bAXUknFbiN3clMhSqrtymaI2rOLMUVmofEDB9hUK4?=
 =?us-ascii?Q?uVI0IxhEfdDA81H4CPyPC/IctVQoE/io3WLcR3mom3kk/KCPYI3C4xQ4kjU6?=
 =?us-ascii?Q?YyoaeiVxu7g8/PmNKGDO6XMhLCPJl4wR/xYP321MJT7lXDqt4NSFtXndUBLr?=
 =?us-ascii?Q?rNVgliwkteLXSoHD1s42jZQbcQ9x5GBd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:40.3420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 485150e7-2546-4a9d-8097-08dcdba683ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831

Update the MAINTAINERS file with AMD ASF driver details.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1765d39ae75..69bc0bea0527 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1101,6 +1101,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-amd-mp2*
 
+AMD ASF I2C DRIVER
+M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
+L:	linux-i2c@vger.kernel.org
+S:	Supported
+F:	drivers/i2c/busses/i2c-amd-asf-plat.c
+
 AMD PDS CORE DRIVER
 M:	Shannon Nelson <shannon.nelson@amd.com>
 M:	Brett Creeley <brett.creeley@amd.com>
-- 
2.25.1


