Return-Path: <linux-i2c+bounces-15277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B4D3C37C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2DE92520615
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0203246EC;
	Tue, 20 Jan 2026 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rnGy83ZS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35D258EE0;
	Tue, 20 Jan 2026 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900862; cv=fail; b=WtlajOFNYTPyw28K8z4AQbii0bxjVZ//nkXK/vxcx2KRL5lXz83BY69GkPEPO9epohsCYP5/hvGo4SvJd4Qt+oL4cIhId/s4tyyGRDc8Aa7HYUsYdQ1xllZ+4eJ8dbopJqlbdRHLVMPVLoXqUgF7OBEdR7I4rW52fbTh8WBiqDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900862; c=relaxed/simple;
	bh=1iHGCFUG4wE4EV5VRNHwaiSaQcEeKsHoRMVbdCl0RL8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mcu4U3RmFCTX1X+iDpSuv3w5BafrAu5tOkkuANFre/soi/fnXhdCuPJh6YJRpGKp1t3DVBNJxExow4aPe4NAd0KhjYbl0V2Nvui28NiUCzQBff3E/AHlwXJL2rH9zwNtFxFB3b4u5KRilTWk8RLQUeYSpaS/VDWwyXwgXJP87ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rnGy83ZS; arc=fail smtp.client-ip=52.101.46.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dC1t9HuNRWG6ocKox+maf7e5mSHlgZs53E+XFIxheLDHyp2qjR42PMyjTQnlVYJXj8XMsMv9qRCu+Wap+NTLsX2OfDxUIikXVjp8+/jRtj+vO/062AOSfDVDUpyqzGmJpwjey7STirAjf00ibq6LGHMp2UeZvrtvlz7LDTL0BDyWzrzcbV59LDJkX18/J3qCcrIFCOlwMGBx647arUFiuoD+A6wR2+X6WR4VqzLeNyx2z9ynQXF73gKpnBO3ws2SgvuRU7mPSvqcPpH7v/KEXahvgi3vT1zz1DFFPlmgza5x2JB9rhrAUOFVy0o3BjzOFQoUavV894ceNSbTiC+Uxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DmjldH1wzrzz8c25wtzbc2rN2xRtrUat9+f5TSYs5Y=;
 b=DStQm+0yDJxCjMkkWbiHJndqryNHeXoWH5+7zYpn6wh8NacJJw53/nK3aUk1KO3BiCJqnxUSM8+yRF7SdJE0vQbUUSqPQ7oxt5qAxHRIZ8low0OeK2JPg2H5Gdg13S0sf2mgd7m+e5g2mfWf0eBXQa29+VyDkfShxPT3XQQFjuz5Vx1ncSki+UqID8YiYZAzq3vKZtjfvKXJ02ccBy//47ZSPbewZU9T90Ktc6fU6kWegt9Mg7La1Ncc5QhN6CUBdgqiAZ/6sZiq+7C/N6fAP07bbW/2gzZsyMO3EY1q9Df8oWmFSgUip1y+612EtVb1G9t6glVLlkifW9cWqZ8hSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DmjldH1wzrzz8c25wtzbc2rN2xRtrUat9+f5TSYs5Y=;
 b=rnGy83ZSW1hzQh5zhvTKhCOQNEZyXF39bW617FP0usLqP8AVzFCplGjFDjWifHdiR8Rt18Xxdmwnm1UyB7uHgpAyxIo9SIAU826VR6kWvExIcr3K1FDRG3Z3UGsh4BAagzDcf7trphY8DAg+NGggKcnKyHongLwvLlq3EtDuK5Is7uLiOhLF4Jw/q7qpY1nV0zByH+VUT9aIadE7NtqvSvSHgAKUyse7BoUfHPMOUhSirJkB+pNtn+f8nGBJ9Ug1CnQhYY/EIf52CMSnkKABHQWMLiLFVYOa0Zfu3BcCP0oYtmNq/+/H8cz2/F45SqBZvWFthKKCpf70XT+RtcwdMA==
Received: from CY5PR15CA0020.namprd15.prod.outlook.com (2603:10b6:930:14::27)
 by SJ5PPFEB07C8E34.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 09:20:56 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:14:cafe::7a) by CY5PR15CA0020.outlook.office365.com
 (2603:10b6:930:14::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 09:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:20:56 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:39 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:39 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 01:20:36 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v8 0/4] Add I2C support for Tegra410
Date: Tue, 20 Jan 2026 14:50:28 +0530
Message-ID: <20260120092032.83100-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|SJ5PPFEB07C8E34:EE_
X-MS-Office365-Filtering-Correlation-Id: a93a03a3-9b17-48a9-1813-08de58053784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?82ltcTjG1z+r7OYjv7D7zxeOUZatmBB02Jd0951bafywmE9iCpG/x1L4vs1T?=
 =?us-ascii?Q?KLzvB4wUj6V/apaz6MTzBz9u+grTq2Ev9aF9lLqoSZ58pXC0KPhNranpENNb?=
 =?us-ascii?Q?ARbKyFdJilKwTS5z5zdzPLAz9vkhw0IPlj2+GfC0Ukc52mGiS4UgZ+kS36XJ?=
 =?us-ascii?Q?jPkBL0twpoxhhZd27crOeqkmKeoI/4PLnlJQODvLKLb2aS2cdO+REZeyrx96?=
 =?us-ascii?Q?guEzOK8JJvjQ5O4QKxKlWovasHNA9B7Gi9l/cGqtc3iBWRb4O2/jUZN5LIEN?=
 =?us-ascii?Q?O2RTq277zeg+eJhMPjs/BLczxcAmdB3CHUog5elcsJbhbDuW643hzes7CGRL?=
 =?us-ascii?Q?MGAagX4fJC1qKdoOl+xEHaqntg4qe2THG8U9XuvSUzb1GT5ciCB6a37wm3rx?=
 =?us-ascii?Q?pB9tz2fC/YOt+7XHK6nBNmPZEDLj8Y5zlsEGcFeWm7tl9DaJGF7OekP05y4y?=
 =?us-ascii?Q?T0jD6JWlt88Yr1uybNhIv4d+DqnYGPyjvETADy6AvpM+o2WFZBR/9hy8gkpb?=
 =?us-ascii?Q?yDGfnMOmnY0FphxYdnspdHrsj9EwYQJ+gO2GxYKNuM4HdxXHSBRO94tX1NC4?=
 =?us-ascii?Q?/elULrGqarpPffyWxVYM+igD1RtiCVxDrV7mh+YbNmZCwuoTr4vrtH7m/OpF?=
 =?us-ascii?Q?2O0GSjcIjA1U6gbC12CJgMpF6tZ4USroSXUS57LgGn61I1wzXzfOPwUZizks?=
 =?us-ascii?Q?LHejGpLNSj9edPAzxfhjQ66iDfgT6arlP/sC2Y//pwdFImTUj3s2PMg/BZVv?=
 =?us-ascii?Q?eyz6nSBvZGnhS34/T7X7/z48snnK8uUb/YMjseQoCvv6RMr65uB4QuOrQuwQ?=
 =?us-ascii?Q?nUCDC/ko9gvZgJuYsdUS5o4lJIDS6xgxq0cuotWuFkAHOBS4ZuU6lXQIO2iA?=
 =?us-ascii?Q?zfcmAiKYY8HusW++LPZ0uoAdzra+hsT0cx3fuGvdyNuHGMhoxTgh/T/dDFhQ?=
 =?us-ascii?Q?IQUbRBbDGyJXZz23YL+nFcIhT+AB1D7/jFpfvCK8infvpyLIt4YbHiWTlR/p?=
 =?us-ascii?Q?Qy4UEDdUaeQL4SokpfNLH9aMkXQ/23PdpTo+O8nbUSr02Dzh/4nabliVqPNO?=
 =?us-ascii?Q?IJA2rcZwYa3v5xJ+j6qxcbAHx+dT45rOCaxfBVw7U895y3yMANdIdaBkG77z?=
 =?us-ascii?Q?cBgUpE8GGx1Atbd3TRyt2Rt4LbB9uUa9/yowWlDMaHSmVU0et5EXz+UC72DY?=
 =?us-ascii?Q?I3t8ECw5QJqy1HffZp9by6yHdZ/L/vuwvKwkbIDx3zPi4x6K2l482uCcDyLJ?=
 =?us-ascii?Q?b0LsCJdpxJMu4MYIQzYCgV8bDX8kZ1KG66xiOXGbr9q66RCzV/VYeAWbZ0iP?=
 =?us-ascii?Q?K8g07gsaI5kfJlqXEqQxtFDpIy431Z+LSkv0u/ItOoyjCVhMalqff91gdRVl?=
 =?us-ascii?Q?w4zizC7hIrg1O9d3eriyGaPCKbONU0QTY9+LY+iBAqr+1cLMKt7nN/7Rsj10?=
 =?us-ascii?Q?/vFPlXupehz/TLEsL6tHtIiK7QZGL8R1ucvVHYUik6LRRAPjvofg6lNIr69a?=
 =?us-ascii?Q?m6fHQ2oV1V7hlXRPtIUh2uAp6L8iJBjRcWQr3wYaTsI3OA8bqKeQcMxt5R0O?=
 =?us-ascii?Q?JtLWDOvfFYD7zNJsAeQdxlhBDS/ZL0pw+zFveZhr9vA0ycIeE1Y4Oy5iTVKk?=
 =?us-ascii?Q?50Mth91fRfu/LqmhxedNW11Sw4EN5oh+5tGeJHUcdOr7smh2anT2MJVngrT+?=
 =?us-ascii?Q?Z3Du3+wLXuFbv7cG5Udk6yhFHjc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:20:56.2041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93a03a3-9b17-48a9-1813-08de58053784
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEB07C8E34

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Kartik Rajput (4):
  i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
  i2c: tegra: Move variant to tegra_i2c_hw_feature
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 557 ++++++++++++++++++++++++---------
 1 file changed, 401 insertions(+), 156 deletions(-)

-- 
2.43.0


