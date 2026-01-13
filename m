Return-Path: <linux-i2c+bounces-15127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57CD1A7F8
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC7CC301C90F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2D534F487;
	Tue, 13 Jan 2026 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pmfNZ748"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010065.outbound.protection.outlook.com [52.101.193.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64934EEF1;
	Tue, 13 Jan 2026 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323603; cv=fail; b=M0F0RnDJomn+35EDijfL0x4sb5lzjpmFBtNa5Ah4t4P2C8E0XIYwwszbmbjhBvrxFXP1uiYfN3WiTAal8+7lJ8KDRbVj8BP9nhRtCfmLoW+bccQpZS1E5eNfi3uKKjhCGdHDgS2aq8WlteBoe6SCeGlSrZWSHuWmwohThBVtpZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323603; c=relaxed/simple;
	bh=XvI696KkpqapF62i5vDYn09ZAp3myEw+ndyKBABaqr4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Re30EhlQ/FYkGKQ4T2Y4FEZVTmLWU6EsJVweN6u3+C/csFdNwTyHrNFl3iZTdGnuahj1srpAGMvZAor1Xvm2v+OoPNvx2f7gBwcLG2WLwbZloRXtzjX/qnLaggb9c63gX95q6bdvuq8YeBPnhXZARCk8CsHEYVX0oWjDZ7f8FiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pmfNZ748; arc=fail smtp.client-ip=52.101.193.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9fYgCOz4Yrwx9KorLIM5TIsuTB6LXtr/zOBfpHhFdMmPfAL57h5JHIynj5/nwaJa5hAXkkDzc0f84QGWaUHHER1yYwZnn38qAZnjndFWkyls8thlbTf4PuzlKb5mJRa4tSrnZW5Bbn7CnJ1iWzez95cIdkVgK439D8/kNfBRWfJPRpBJ0f0Y/9xDUMVH4oPlERV5HPjYKI+G8O9wK697vee1i9bZ2w9+lqPi9xPttfvz4B0T5rUAc4t7C+TEFQOMbsblDJcY+IvAHyWiimCPoRrA1I6+8KdcfoRg86TBj+LIlYGMb+ws7v/AdssGwi1KRyS1FmjUPQ5VVNZ31UY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3BSg1quVjiTJ27KK/78isFibPSSNxeIbPXLLpXpA8o=;
 b=IGRN3CS17h8qXS6hn01wZads47Q7OQ74TrPCmsZwcdWGza78rkzEIRZnQ+iWdMainvz98ddNRVC196dpNn1qb3AomLqO61K9f8PMArQlv1HQeuBBW8lLOVOFKHgVpzXuOTX0egae+8kkRzRnMWcH52Z870Or63erX+r/VBNdo9etAcCs6lsXZIkdyaH6XkMilIpzH20ZYK/4bM2Wu3IN9tL5S+Vv5SJAcuhdDogw0rZZE0Z+NvYyuSR49loXhIUyyEZaXHMX/sMlHxlaSXdaEyGwEKTz7OAzhxx4Hm5DbLkLOIJw/IXMeDTFOiTHnb4TBRI6bVLL3TMWZ4YcAt/tIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3BSg1quVjiTJ27KK/78isFibPSSNxeIbPXLLpXpA8o=;
 b=pmfNZ748ilYqqwgbBFtqbLO0FQ9KrGZlOVwbyhNg7tS2HKGpqi3nVaGL5iH9SoOS6CAnA75PFOQSkSaF1hWrS+iie9xDnW+1qZenqAkn6KN0z7GWDyAlK+RqbkXW99yaCeopD67X/+q5r6IWPPVf21feGy8/ALQ+8gbhkxZv1m3JMzp98KxUIn9uhiSVcH5O+LQLLi9af11oPRuQBXbC4x9ustNYrsFfnLykKPOVqtxWgZdJDPMk9LaPS+7LxytPGNovhW1m2cmYWDPu62uz0lXtJNVznRU8fmEL6oTk+z/e5rG9LfSOU+JfMKR5GCS5reCsliDb/fb92aV3/I462g==
Received: from SA1PR04CA0024.namprd04.prod.outlook.com (2603:10b6:806:2ce::28)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:59:55 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::9a) by SA1PR04CA0024.outlook.office365.com
 (2603:10b6:806:2ce::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Tue,
 13 Jan 2026 16:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:59:55 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:36 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:59:35 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:59:32 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v7 0/4] Add I2C support for Tegra410
Date: Tue, 13 Jan 2026 22:29:25 +0530
Message-ID: <20260113165929.43888-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b18b7db-2f02-4d79-bdca-08de52c52d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dx42GTlnsNVmo6Y5M0PtRL+ssanpPOuHK8BBIxxDTdkon0UJpInyblUm97wZ?=
 =?us-ascii?Q?ZZHHgizcttcOqabYdfuBDi7BacvHZfg674844c0krsSSckK7/CFX/aMlFgFP?=
 =?us-ascii?Q?9BoJxDXRpFxXJExq0jYjvXiLHwh6qsYVfPy22tgf8pI/r46QsI88CF4gH2Vz?=
 =?us-ascii?Q?H/aUUg1LKFnk9dFGBJdJIJ2WMIu/0J1ok/o9c7mLggMars2rAQwsRvMAIvek?=
 =?us-ascii?Q?Cxt3e5wm1/lA1iBU5qhbLp1fwE5OphFCKEmJ27dI2q1mZ9jwQQRHtvz+sGLd?=
 =?us-ascii?Q?KVMNPoFlQFDpwdtbVCVLeb6RGPX4F6/qYgd4RM+p1eM7q1rir5ClK4rHT4yn?=
 =?us-ascii?Q?AB8JiQk3BHSuXNcr3NmxKSHjmhS1FprKz+lEHWcg2hNcS3MIsD2bVXlQkE29?=
 =?us-ascii?Q?hoArAQaykH+xi1bMOt5icQKjY+Ik9u4cXat+sZrsXZJRBFVHKQO9J4MhmJYd?=
 =?us-ascii?Q?ewiST+tesEXh+dUWnA2hllh1iNHmKLxQ/jW17sUS9EtF9BqyvGyzaaOA9YhC?=
 =?us-ascii?Q?i58wVWjuahYdF0SCGeqMG+D17/aKb5lbISVqeiPLOBNIkg+ktdfgCPi27O+N?=
 =?us-ascii?Q?ujPB9kZPAJRgP0gbHiuGj0cx92xHj9+WNkFO0sKczoIAY9pKv4nlogLVlE1V?=
 =?us-ascii?Q?WJnqfBeoBNIpqSV4cTi9u1/FCT+GGTor2qDiAcirlG6MTipxh6mY9hE0NUwJ?=
 =?us-ascii?Q?6xsssOKEyiv/n4qwvHtFz6K+8s2Rc8DJTpvFvorZ2ZRVMXMnOrSS62hk6Kuz?=
 =?us-ascii?Q?+kXXyYvManczBHWFrtkPVxgk93qNZwH7qXMHEVDxYANxnt0P/2k6HJSjl0K/?=
 =?us-ascii?Q?G3HHV2gSX7nz7OB3n80G+/0YJeqpiYn6mA+gcGCe8vRUMbPzEBGfFiNVsE9o?=
 =?us-ascii?Q?NuwyMqCj1HOTHHP+4NBGTJi4/2sfUiTHYSOQjtSz74KXpTofOHGfopR//yoZ?=
 =?us-ascii?Q?Tnx5RG67QHLJD3YL6JvTG5V9cD7Vm19CoRt3gVPymb/EWuMhPpR6YzpW8is3?=
 =?us-ascii?Q?i0+FK5G09ejVa4ovcU2khzFMr4InVy9GZ5igGrPOlgM1nYQxf9n35+pskPa+?=
 =?us-ascii?Q?BpnGW938b1mWcLZa0sodhaoddLzt7YXn5CgvrirrXktmEHNIdR1xHeUDZDs1?=
 =?us-ascii?Q?1NezFlVyy9IuIQujd592XmYk3HIcqMTyf8x8REVrWXlmZkGjo9j+ImAZQFiH?=
 =?us-ascii?Q?99hzmbvyfU6AmrjsOxggcT7kJaGLgx14S6GF+QR07MRfbK9At6VZKuW+8C7w?=
 =?us-ascii?Q?CrU3Lm/M9yfpK/1m6O36K7S80P1OpF/P86ki72CN5YiXq/0sNOQkfHKkrREG?=
 =?us-ascii?Q?9zM57TEnDZpqRGJLgA6PbwndvwFvAQoBEfJehBCyezRaxP1GGYBd0tG31nB2?=
 =?us-ascii?Q?v5uiUGzERGAdjyv5V0Gvh4GqdGw6Zgv5YYJpFIn7sSACPQ+tJDCGlnTAaKuz?=
 =?us-ascii?Q?Z8loznkaPA8OAYhy9UgO8lhYCUO5ZBzHKYybXvQPGaIAf/F1S1psbW5FyA/r?=
 =?us-ascii?Q?vrslzgx/XqVMPXk9lLvx04KOkIFWZyrm+y5sqwJafSrm0Muikk97ryGWeIml?=
 =?us-ascii?Q?Wbm0xxV/vnXSb9rIcjgNbkfDPESQ+1SKOdo5B0Xm?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:59:55.3773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b18b7db-2f02-4d79-bdca-08de52c52d4e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Kartik Rajput (4):
  i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
  i2c: tegra: Move variant to tegra_i2c_hw_feature
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 543 ++++++++++++++++++++++++---------
 1 file changed, 397 insertions(+), 146 deletions(-)

-- 
2.43.0


