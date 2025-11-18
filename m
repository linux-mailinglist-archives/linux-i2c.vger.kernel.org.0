Return-Path: <linux-i2c+bounces-14139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DED7C69D1A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 15:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 81D222B8FD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 14:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FC5358D23;
	Tue, 18 Nov 2025 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mzz61Wdd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011008.outbound.protection.outlook.com [40.93.194.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B205434FF78;
	Tue, 18 Nov 2025 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474815; cv=fail; b=B2okHuAw1euev97abqqsAnJ76+rK1jjG9KSUMocTIuZ/sr88fTmKdUXB1bgIpfGc6D531/Lh161BduurJEr7fpXZm+9JPW2r5Nq1TeDcUBsAB0nkfXEmN+/litdg2NOs7AGdmS46RzC2yP/iMYvPI2R5Ix15egIlG0HF8rHty5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474815; c=relaxed/simple;
	bh=A18KPiKJhd6iOZrvs9vwLbLv6zhw30KSSlxBjkfT/Vo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gv6eivX7U39Gs6Tk1NuDK3GVMTyDXXUN3PyTm/f4FBKtGQwcZLygGA/GSna97zEMMA04Rzai7jh3qs3cyjd0cuvkrlPMwkj9BiJDnDagErj11/fbf6QX1ZfAvlEdH6LYoB4/311JDi4486G8nT3Abtdw/O3s99faBwpyBXEpE60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mzz61Wdd; arc=fail smtp.client-ip=40.93.194.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uroDDPlSFqtn6g1c+oFfGAVCcq99XZNI2kblTwY2+0M2ghKVsaNVj2KuyP7Y+qIRcI8wnH3kIlORbdkDknvmykJ3WBOCZMS0ruPWHs4dCNFQaSnkJJIkJyqdi9ZNT95qB1CZioyZseNgNDOu/jAW6cXBU9I+V+EwDuCUCs062xV4TQbGFcH5XD7oBGkt1f/YwrT/LCJ9w7oGZIntRCIFA87JZrTh0ghpPw3oC+DSHy7ZIp5GKU+tmAT4nNJdJniNn5CffahLdZx+eFjC+5erwbwbd/zxRSaQQX4dbsEdXXENn2U67oGYwJfCk/yrafPFsYBFIrsUZ8a63KSs8X7uxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TN3iM1Oh37kyTiK1bxHSOxlJiz0hxUazbCCEyjPqpBg=;
 b=gCas3c7Brsidgdc5FHZYgvi6/bjNQPneIv8eQSFlOBD61XotAM61o4ERARHLkk+Rxl2y+pzirbOppZByqwIzlB1inJW5Q5755V7DS7alww5b2JLhJkt38Wkh8qIK7/08/qDrY2H98SZrQ476rnOuZn5TgXH7C+f3dbd4XxMAHSNir2zIGIqfijJ5KiPxtv16Bkj5wj8Od+CrN+CtzMctdXvWgyD7KWVDm9M8wL2zqx5RWOP70pSpP3vm7VTn4xBtAerrYO4rKGgxT+dH0e5IKowUPnaeWt7mg9oH9kuFuZ5dX+KdjJXela8MpdAfwbHBoRdZDCoHUM1of72EQh6KdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TN3iM1Oh37kyTiK1bxHSOxlJiz0hxUazbCCEyjPqpBg=;
 b=Mzz61Wddi82LMcLsPvS2Im6woPuxEJ+j/dV1MExn55fBhnYthd4pBCYH8a6AIVVO2MYR+wloGu8AkH9UrKur1p8qebg4zjBRz7UwgS1E6m869hVHnG4Rq9VDI4sdTDNg1BUYS7lUwYSjVCZ2RJBe0I4QWOMivjDIf5f6eq4OyZpnj6G7ZjhdY/QHWmFbnY5VocqPRIVUkqUc1GEPg5wM3MMEOfC1BlcQ7owv24JrLlUJ+A/k6oJWuMNQBCgJQodyGAJe3GECbLK1mPCGUurQUp8UY6KmV1utzBd0hjHuvqJ/sJv9L6aFE9Y9auhY72opUW25qkbI6/s/TzutoXjavQ==
Received: from PH0PR07CA0076.namprd07.prod.outlook.com (2603:10b6:510:f::21)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:06:48 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::b) by PH0PR07CA0076.outlook.office365.com
 (2603:10b6:510:f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 14:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 14:06:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:06:28 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:06:28 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 06:06:24 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v13 0/6] Updates for Tegra264 and Tegra256 
Date: Tue, 18 Nov 2025 19:36:14 +0530
Message-ID: <20251118140620.549-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: 83bdd477-3fa8-47dd-00ba-08de26abb684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nhn48wFlD1zq+DQdt8oSLpAL88QWjwwzYN9AFFF5vDt8xza1ExS7og/prWMK?=
 =?us-ascii?Q?tWNTavE+RBpA3mQwfXeu4wAFDHms3gbLs9J0Gf0ZyIhkA0C4LASewf1N3o5W?=
 =?us-ascii?Q?rb5yGzI29VWCEKxZ9PNa7KLVxD5c1pX8mX3ReUER36zeDMcEZ9UoA5ThKclC?=
 =?us-ascii?Q?2cE3trpIcOGtG0J/71jgYKIsEC7z2ieFsC4PVFcCgfJ264N8RtDMXxMmuA9e?=
 =?us-ascii?Q?h+hL5Cq0PrGUxa0fjJgXHSpqeZ+/kFy3Snyk43aGCXqoDCmADnzvDcYHDKsu?=
 =?us-ascii?Q?QWgz3fg0DbIDwAJv2lvLZbT/8m+odh1qwgPQOFHZM1BO3XDoCmD7UQMMDdB7?=
 =?us-ascii?Q?gsJLFTslLax8aJXLkf7eU1Zm4/XWs1zIpJwxA6RVD2VrvnbFLPzAsGcftCYQ?=
 =?us-ascii?Q?41RFg2uKqvekAoyFxBXkWQZX8O9U0O9Xrfts8JJx7RevNXmiQJd/jHeS8yXO?=
 =?us-ascii?Q?PKc9gtPfHEKv4zTMA4MvglIpZNwHTdSRIHpSh2Iy/lwWVkL2edpWC16/OILC?=
 =?us-ascii?Q?8RnuVtDOzxXGjBb1iznacolF+AlHwgy8ZRbeuNO0OTwO6vI0NT0FmblgTBXU?=
 =?us-ascii?Q?p6tM8MFq6yZzkucMB+k4+C75RaVvX2+lh4ILbOs7XduwgZYkUJtaUT9LU+NT?=
 =?us-ascii?Q?J1CeFU53lZ9GfpXn1IlpVjoolVkKH11wW+wfhuPvxA60qMp+JMBrqBxMGfVO?=
 =?us-ascii?Q?HoZMDTlJMs4tXdiPAJRGTnibUMFTYNf8AXT6fPLLqdxfm/3nIGclHErGZZRl?=
 =?us-ascii?Q?TnjcLWe1cFPpy96L0mXkvH1p/1reuL/3v+uSIYAAZRFHvyu2yeyGizUZ6sJ+?=
 =?us-ascii?Q?a6a38PVG8VJQZNm9PYMQSG4fgBdQmbaV+AAbOuJNeCN/Vc4V+R7xJ+pZgywM?=
 =?us-ascii?Q?QqT+3L/dg/oW2HpEc1ll6rAYLEkHHnNLAaBPg1JOffoQHgWXZgCI7UkmsvM8?=
 =?us-ascii?Q?dy/uUjsnTaYIvZUEeKD5NMk1J0oipdpmTLT5YtiZa3lW0q/Rw8FfZ85f+zXO?=
 =?us-ascii?Q?RGxQL5oFxTz7bHYxNMl8X0WlmcX1rWX7jZ4xT4ZGmt3/pOL95pQQr1Hj/XHj?=
 =?us-ascii?Q?S2GxV+0PsjUDDCn8lP0HYplroZrcJRjGeQtdVMldyDL5vfcbrCx2JqEkGR5v?=
 =?us-ascii?Q?7syoWGvRELOiRCihs0FBgrkeSGLGIFH+wV6xCXYfeBNTrvQZ4fo5lHn5tIgd?=
 =?us-ascii?Q?VEMUk6N2VijauE6DpDDvF+LvIBoOLUXtzv3F7vedJWVXJI0m7edeVRQW1Nuz?=
 =?us-ascii?Q?IHAwg1x2z0iXSUZtkUEsEtCqPYHTF37qJ1+lZ7hjjqdazfeAtrbBltz8ps0d?=
 =?us-ascii?Q?7dH3A+y9DCsqYJ0849Vbu9JkCVsCUbczIdF9+0JfaGWooR3JLskKzAGtlmfk?=
 =?us-ascii?Q?cUVTTdGDXC7BTxoCxMOC7yXYWJHRGwJZB3plfHPv1Z3zjews8q1dA/gMg2UN?=
 =?us-ascii?Q?fNGJumwxJ/WMbDO5IVvAF+eDFHGVIYEo0JhehOizEBWJUy2V6D5uDyBy2zAm?=
 =?us-ascii?Q?REiF6yM/NgmHn8YA+6k68Rv0rm40TfWc3EhvCTBa3mY1EaRsdnzeUkD5Ma35?=
 =?us-ascii?Q?y8qoeLleu7IvxiKPOElPma0i+PXIGJ4IdL6uP53g?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:06:47.5256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bdd477-3fa8-47dd-00ba-08de26abb684
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395

Following series of patches consist of updates for Tegra264 and Tegra256
along with adding support for High Speed (HS) Mode in i2c-tegra.c driver.

v12->v13: Update has_hs_mode_support to enable_hs_mode_support
v11->v12:
  * Added two more patches to the series which are needed for Tegra256 and
    also cleans up the timing settings configuration.
v1->v11: Changelogs are in respective patches.
v[11] https://lore.kernel.org/linux-tegra/20251111091627.870613-1-kkartik@nvidia.com/T/#t

Akhil R (4):
  i2c: tegra: Use separate variables for fast and fastplus
  i2c: tegra: Update Tegra256 timing parameters
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (2):
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 drivers/i2c/busses/i2c-tegra.c | 304 ++++++++++++++++++++++++++++-----
 1 file changed, 258 insertions(+), 46 deletions(-)

-- 
2.50.1


