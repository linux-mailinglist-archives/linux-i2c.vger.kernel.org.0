Return-Path: <linux-i2c+bounces-12452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B405B39379
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 08:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA976173E99
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 06:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0512777F7;
	Thu, 28 Aug 2025 05:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d5j0cjjO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68EB4A02;
	Thu, 28 Aug 2025 05:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756360798; cv=fail; b=tJ0Ix7IxIzbhoI3PARtIWX2AcMWMmNGIlN8lK/UXNWXmIKsSIb4pR6QGdxvPaIbectJywM1Yr5ChotQkflyuwSsN37x16oo3BXrMNWnGJbAQNGbsCxNAg/P7mSm9qy63J+cOPNqfN16968yUyWzE/gSrq7qzwOESCQXBzzxxlGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756360798; c=relaxed/simple;
	bh=BZYgaRrhVj/VGnS1DeLiJ0e0LG2LNT0X8pA+082f5K8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z/eszMgu6QWm+MYUoUmoRbB1BM/EpCTLPUEHYGI7jCjHvopupRxz5wmpjoADvLryQZrivkooTS8Jc4rM/tWoDSZ7dz0i55LOnBBSfW1AVUqFgp6R96VI08LI9SjOUKRF/YubN8c2tVT1zGC9AjYsSMWrm75JLdW7MG6Prj/6fSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d5j0cjjO; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rh/Q9EHg7k8uBO0ArGsxBf7i8rVL9KxlDB0bfYepzx2Am08iqub0WjS1Xz3M0acf4lbJEaxzMtPpKUuyyBPS3WpfhPVlJXmX117033IMHCyFEZHRnxl7ehspGFCw5kqYiYdX+zEB9dvY7GqhlxgtgXjhMJzTmNWxGyx7AnvCBhsulvm+rVG5KurtU5XQTeGaThlxQFvV4cY1RS6x56fBmCP3VjpGQzdortNU+JzqrDIzXXSe0ErxeNHFVz9ZF8AuSSXbB4nttcMiFHlLu+K6OZsCAJFVbyTk9L6chE/BymWqTT0SYGrBOSu+ciRTcBBUQJGpJ9eKmNkNaHeE1XiurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtoKqKQjFjVouSFg1+p8zHKYxI7/tNM7n0/w37BQRMk=;
 b=uGUtfj+L2D7GGGGV3mSSe/DVTwxsm+IAbmKuci3iKnH//rS9xIr5xHjX2kPRT63kLSm49jTrfzB0USncoMR02S+UfDvN9vR6cimX5KyaqavpyQCcknLtMuiOeoU3YjShWm2GkHvKo3mPowIYFezby6+RVzAaXI4q8/ygiFpnTavEBxbl7p4jwXLpnpPkYRzhlYsdGKE+453tgiUWo7xqRoY1LUwdQ21MoKHp7yPuYp5ybQHWh+erEmNq2y51wwy0GRIxsmNysntlH8i1UyvlLz7RHyIrHD9AmUSAFrpog7cIj7RyHmnabxXVF9tij434zSjKj7eBoaN3nt4OaCJcRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtoKqKQjFjVouSFg1+p8zHKYxI7/tNM7n0/w37BQRMk=;
 b=d5j0cjjOJATAkFzzuxPHVN2bC0fDfF79hm52nLChdUEaM/pU3JG+qWh7lZOZ3fKEsKBuuTY4VFOVmiFXfRtF0yrQv8vU4/OikL+8cahQYut32n+ri5TjXuq8kxnr/YMSbxv5cxMoQ2/PqX35IyYsLxNPkskQvFU5V/8az2Z9JLevdBjM5fp+xhCccWM1dUOjE8tZHXheLqCHTlwst7y9zbo0p58il29O/BXZsvIh72qqO75XiDxJBy0S6eyooSh4hkkiMhTUyVfV2NsK4zMYn8cBWuzrVMTFf7bkH0fwhoRsq/oSMf7vaAVt0rX82fxkhSSv/E1MDdmQPnoW7bOn1w==
Received: from SJ0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:a03:33a::9)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 05:59:52 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::ae) by SJ0PR03CA0004.outlook.office365.com
 (2603:10b6:a03:33a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.14 via Frontend Transport; Thu,
 28 Aug 2025 05:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 05:59:51 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 27 Aug
 2025 22:59:41 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 27 Aug 2025 22:59:40 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 27 Aug 2025 22:59:36 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v6 0/5] Add I2C support for Tegra264
Date: Thu, 28 Aug 2025 11:29:28 +0530
Message-ID: <20250828055933.496548-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|MW3PR12MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ceebfbd-04fa-4bf1-e13b-08dde5f81aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0gOgUnS3RGJ3+BEde5ecVYLzOdItgf9MR6qG6y/qIXGKy8tKcXTAg49KxfeA?=
 =?us-ascii?Q?FPiOdopIzp6Y6HDloMh0dldOwe1MMVUZO6/7CzLR08huGvPy9Axi62yz1Psf?=
 =?us-ascii?Q?minVKcqfN4Zy5d3APGPw2eiGJHLJoMY1V2kX+vzo5f5wxt0QU6uoTlmMf702?=
 =?us-ascii?Q?TuPSrogKKQIBHr6zkC1bdFbAFVEv2ZMResCm1G0w3PBMAZtm5bRgmsUTzoEU?=
 =?us-ascii?Q?LpenT0loBZ4M/rNrrJRsDon3WQ1gCzzgu6ziDLCN+nZnb8JKHu+kX+zHpXEu?=
 =?us-ascii?Q?bHWRbCoWRpfyKBlinais1Pm4VbnKc8PdBdO1tz0YFT3XqruczwQuJnwVCiy9?=
 =?us-ascii?Q?kXjEWkHSm4N0q6pp48nx6PwRJAOUy73GWc+J1f1RiX7UBdCxDaVkLyedW/rB?=
 =?us-ascii?Q?lwym3obDO1Ndpf6hDB+H7AfZAv/ibTP1n2mx6VfKKRGIjHkWzXTqUGYPG8BG?=
 =?us-ascii?Q?erurc0ytQDPf51dc37mr5NGZitX7CokKcsYBFMT+g+DiqnjK2yIVE7D5MUpU?=
 =?us-ascii?Q?s7HF8olyvNzSvT3BKGeSfdtwgLq038p1uUt5hHaSXmO/VHIcce2q8HQhQUGy?=
 =?us-ascii?Q?6qKjNJX/+AR3Wzm9JcXX6zOcV0uPawvnMXzt38s/gxKfc9+M5zjBE8r00yyT?=
 =?us-ascii?Q?mir9rKfvBmRponr411vmEZblNcIv8QKaCvFAWaGMX85Tw7UNMJ8USm+BODtE?=
 =?us-ascii?Q?zdpdX9j402TUOWJtqfiP4PrUArMBB/Oy4pTDgEA1diN25ezQaccj1VazMdDl?=
 =?us-ascii?Q?if5vN15h9nj8EY6U6uKDa4ZkGZP4LpnI7syX3MGNak7U5DlCs01rZGSi4Qwl?=
 =?us-ascii?Q?i7jVDcR55KvRs9/YHNAvUe3+yd8WN86VOLqGDV2VMtrcsx3jB6L2p5n16M8K?=
 =?us-ascii?Q?Hx78XIthzmW3lUsGVWlSXgUDm++rY+I+qh4M7LtWhJLfwY2POLerwjY/nb0p?=
 =?us-ascii?Q?l7fsrarljeMcOqUolJ42y/hFkRARRqMry3y2LEYH5e5aS+dJhRxsHd/UH4sd?=
 =?us-ascii?Q?57157RwWT24zU4w48mYxE8yE7Lyoqeze9YLD+RPInvy2tvRBqhmhJkPtgdue?=
 =?us-ascii?Q?tJVMT9VeVNoqzeL6vQZ21krlvUsqQpLRgOuudEXGGmE95wfiaPk2GzUvyZ0z?=
 =?us-ascii?Q?JrtGJ71du3Z2Kel5aeTWQ8/D30NKsIfgPnVJKPLu7Mzb7Vegz+RKtUlNAjkE?=
 =?us-ascii?Q?K6TJk2dked8LFMSs7h/PjfWJx1pF8rbTOccdougiR7a8CwRL8Dsq7Ouw5yKu?=
 =?us-ascii?Q?HUlQVC0yqZrPprWL9h1QOuUOLK/EdVLs9pL78qlBME4ZwkwjBlnHYV/CfKWi?=
 =?us-ascii?Q?aL75nvOuNyaPiPXeE0ytqTLU1Tddp6EUAzHog6w+Nub/22DcEtVzYutUDT+i?=
 =?us-ascii?Q?mVRKIPDKk1H57in81bNbfNmMGrrA1msDCWdkkbl87mXDPCSWvsTdTrta+W+4?=
 =?us-ascii?Q?dVIqknpRj3hyF5ioP/nhgMdMTaDZ7C9DRWFtFtyl2Fmn54m54xDBNDzJ6hqa?=
 =?us-ascii?Q?2cofKiK0UFrQ6H/4gH2NKBeJQoaFpj02AcECskEg9EDEUBvJv4xc5Q4auw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 05:59:51.4579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ceebfbd-04fa-4bf1-e13b-08dde5f81aa0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (2):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (3):
  dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |   7 +
 drivers/i2c/busses/i2c-tegra.c                | 164 ++++++++++++++++++
 2 files changed, 171 insertions(+)

-- 
2.43.0


