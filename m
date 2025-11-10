Return-Path: <linux-i2c+bounces-14023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED43C454D4
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 09:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBD87188F6FB
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 08:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5515A2E92B4;
	Mon, 10 Nov 2025 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SVK8ZefK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AE2212560;
	Mon, 10 Nov 2025 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761930; cv=fail; b=GCTFwDjsQgW4P/kC+aJUopwR85YaDasRQaw/rclp2EmtyJsfJ12z3Timqu/USoywnoDHgrbw2UebfjTlA6orH5NuCXKPoQOC3bC852SmyzY8nI0ddAXaQ6VrwjvCk+EhFi0a71RECEhkros5w0nUEhrQrSkBYnozj49UG1sJUzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761930; c=relaxed/simple;
	bh=DR7PqukhiLh6kHZ4X5uiHr7WsZGiSHvl4xph18plp/0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N3qDHKY86FBvHdgxjDLLCds7FpyU97cqWqWdi+vSzOyrMmTcVkhoZgL4Tjo9U60+EYJQxJWpqXqQBqAgNAqYoTA8HDLu7XYfNPdMYmRKaTSjwBnSw8HQ/YU9X75DQC40H3mANKSMYNheJTIwGiel27jAFGj4IvSIQLT5E+m/jQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SVK8ZefK; arc=fail smtp.client-ip=52.101.85.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeFOxh+tCK7/EGnVaRVuT9E5RxMBR2OI7pajqKfP/CZ00aY+pq9Zsq2LXaLzFRBAYWg8DI7erhvn3KfumRfieP6QYHEV6TPrQ0ugbyd1t+AEfcx/0ruM8SSSHkYZQ/22ad5n63cWBXEKTemWEg8qsd5O//VIBI0UyCbtlIC5fkWxlxaaq19Rb1q16QQpXMbj0l8+xC7AJHCtLpTCNzNyd4fgjY3wGvbmG/IUmkY66HqxjvBTOqz9YuBn5ZcJCtA34n+CHnDUBAfTOcQuUu4P+l/7aePHWAtX0nsaYlJJUUAidpO+HqqEXqmJkbywJ/iEfEryOkIuikwx6ZyWWvZ6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKpwOCid6E5DB1+dizY0nWpZV+8HfeG3jdpMKWQl0qQ=;
 b=jSjlf4L3Dp93HQPg2ehBQRRCTBO2v0oM9j99dzK9ZWpu3yXHuKjxk8WjO7LUDo5XtgjO3Z3vv2afUkYDFYGy81VEuTjj0eLFPZiwapESsvu6aPWSqTJB0NEsFinkiugGUAhK36zREemXkdGZMt/6P53o8RJC4RUejpEvJWdP0zeX4Cl3UoeVcyJQc6xJrV9tm/0kxL7W2qS0IIwAjN+QrpjS45Vgvg+HWd7Ywh31Z3l/wfeNUSAy0ITy+VHfRbrYPz48rVHo4SCQ6p6v2cVFfWcUWoTMJsXwWlIKVFrrj1dywjZAkjQYy8nC6sY3w8hD21G7ebZBd/D5kiD7iGdVcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKpwOCid6E5DB1+dizY0nWpZV+8HfeG3jdpMKWQl0qQ=;
 b=SVK8ZefKd5c7/ElE6SgK+PxWiB3IPUhNw2wrD0/0RhqkEBlJSHTLAhtrHfh3R0J2xjOB/5cxDsaC5XAZhgVJkYOavNUlAqra6ap2cjIFsc2g3r2iX7u8lET9BB/+cMbcAwONQ96VPaWA0DFkj+d2mE5BeJy1ThHjwF7fXNEt6vtN5EERkUmv6c77H0QegZ/Ehe/OZNRVz6+BFL+toHxyojGhVtR9Lmo7eEJKu6Nuak7MjqtRSo1aE6yegVmgVShfnUuxZ7kHGeqL1s2393NDcgPKVR67AsnGY1xOqBWEtRUhqA8JasO9RBO6+ilkKAKTh5Ex1zfrY+iw4YgzUvgimA==
Received: from BYAPR02CA0064.namprd02.prod.outlook.com (2603:10b6:a03:54::41)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:05:26 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::d8) by BYAPR02CA0064.outlook.office365.com
 (2603:10b6:a03:54::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 08:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 08:05:25 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 00:05:10 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 00:05:09 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 00:05:04 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v10 0/4] Add I2C support for Tegra264
Date: Mon, 10 Nov 2025 13:34:58 +0530
Message-ID: <20251110080502.865953-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a1062f-9b77-477c-6164-08de202fe7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T9ZVenfae5QlkSygKlFANvsZSXw1yPfqKsgZoWFhb5yKePCoPpyN1Uw6vUV4?=
 =?us-ascii?Q?CtVRHQSFQ9527aL5hJp/MKvpTXW050gOGym8gV62KOsftlKxR/pO0ucIuRPV?=
 =?us-ascii?Q?HnwThUqk+rmga/nqBAPAdMjbAWFTFGLnU6VngX3W7fyPDzSafw+WW2/Vdkyu?=
 =?us-ascii?Q?gK+KTmXqJqd8U90WIBOP8Q5wDbWbSFjg0DvtmZ9ssJiKdlS95GpCaxLkdpq4?=
 =?us-ascii?Q?D5SBCGWg+tiOBapkj6AMdA8Rd5FWlhlUgv7TcgkBtV8q60kMHCQWVzFlhlzW?=
 =?us-ascii?Q?hn9y7dIzNnpF3Jqo4xNcuTn1Vl5Jg6LSFAqWUsDD+I3+EYOJlfIo+XONE76c?=
 =?us-ascii?Q?KhhFIS1ITp4qiAOolPY+5HbIdTSeJyT/obG7QdfUW7o9jqMtN78lvrrpZKsz?=
 =?us-ascii?Q?NyoIRq3v9ekoOKoxRIDRmBzICwWolxOSSMCTg4NNw3nw9CsZgHekKliVDPU8?=
 =?us-ascii?Q?JDUPEGhPn4ttWNZ4GzDCle6KIhT3+WPQ0fRVxL2hmkGvOcJ5nytNyjB3JtKX?=
 =?us-ascii?Q?HnNFT7NQ4PC7AaNNDvZDJQ8+Uzob9wZa+Rtvk5pMP7o7Ed1P+VPaoXzvjROA?=
 =?us-ascii?Q?Yzz6e1faYBPQ7diLd5XhMjxgXVtr2HfU9XilBfqPThnVyp81OThK+mfd49qk?=
 =?us-ascii?Q?LWAO1JYlZkVUBOu4DbYJpLKWnk/ZkTMq0tXl2/OpuNCac80gohU3Y1yuCWGx?=
 =?us-ascii?Q?JpUW8MjA+vi/ZcDcHAqZsZ7Ecv7FMo29CKdCQ49LF5JfQkZs3U2qaJrNfT66?=
 =?us-ascii?Q?IGv0ffPDZEnkQOA2Ej18f9Wufhrcl61+0/gdPnGO/UyNMxgHs3ynQHC8c8Pn?=
 =?us-ascii?Q?/yYQbbq+ISDbcEAr5WPIMUSLOQJ0P8v11wJWzCWwPIw6Y9iZ2gGOtQhgS0uz?=
 =?us-ascii?Q?frdt8l7L8K+2Fr6yWNZLkpd5QlmxSAX90glafzlNufAW6vLASjRoQ6GbosP8?=
 =?us-ascii?Q?iSF/SIW8wl77Ir5lAjQdame6ClvbQuBNkoxb5F5SwPDPVs3PfLbShwFwrSgM?=
 =?us-ascii?Q?si2CtvrK3rndRC4IfWFFObA0BPfmN1OWgZFvun2NtQu/Z4ZbQu2pAME4FTWU?=
 =?us-ascii?Q?iNdfXezPHZ9uudpc8MeicMPlyxAs6IghkpLktGFbvjnBFRIhjJ2nEHm80YLy?=
 =?us-ascii?Q?uuwNdKXNWmfhBeUbJ9dsAbypT09KyhMwBc290VTpLfBenHrQZs1ud965cWHH?=
 =?us-ascii?Q?iOhuvPhHE/6XRoyPD6BF9lvC11P5Cruxz23LAi3+RJ4bT340NEZiXeiyHnJE?=
 =?us-ascii?Q?/Zzh8pF6L2iicPJgRzPLuzymYV6TIP6u/VJm0/Kg+w0g835Vos3shmp2s90H?=
 =?us-ascii?Q?vz7jJjwP0KA1t2r2KktxgOia3tGkd3l3R1bri9tvgG078H3ZD6xuRCWQ8F6c?=
 =?us-ascii?Q?lJup5hp05nAjPM0n88BwJcW/Mwk/sz6fDoKkF5EOsl7wq0kHoBygF0y6y1IC?=
 =?us-ascii?Q?SnyI6VDl2FqI4hbD2Z3j9RDUz+RHhU+zAlStqEMlWsR/mpCDXp9TByRM3ykN?=
 =?us-ascii?Q?NuJUN10U3NyC5pArYpzeLLs1Qm1T2sXqpi5DJqznNB0CDRf2JBe2SmuPNims?=
 =?us-ascii?Q?8w3x/VXAyi5Cbo1qKyyRFqmdxpq90GFQVsjgoR1J?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:05:25.6818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a1062f-9b77-477c-6164-08de202fe7c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (2):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (2):
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 drivers/i2c/busses/i2c-tegra.c | 192 ++++++++++++++++++++++++++++++---
 1 file changed, 178 insertions(+), 14 deletions(-)

-- 
2.43.0


