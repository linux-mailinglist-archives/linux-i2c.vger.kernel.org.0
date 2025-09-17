Return-Path: <linux-i2c+bounces-13011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA2FB7DD4B
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2574A4E4C7C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E1F30F92B;
	Wed, 17 Sep 2025 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ft+uKpHF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158F310F1;
	Wed, 17 Sep 2025 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099435; cv=fail; b=msgRuogPMech/T7ZtP6m53T/SjnddtQFipMPjWAnNIvthtlba9r+HyNGG7x2Q0Skqc/HwdovTd2YFXyMOBlwl6XUAJ67gbQaZxAk0/b6HOy0k//RbouObQDr0Jn8oNRnr8HUIcqqrXIf8ZFNZ10DT1h9uKZ4l0fn/hgdrbcHdAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099435; c=relaxed/simple;
	bh=Z8ojFwa2kuk8l9A3Pbt+CKJUYgL4PVTm+K8r5jAXicA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X4WYKxEMJ4pLqHI2PkIC/Kb9RAe0CZpqG+IF3qd22P3z/YZr+EC/w2G/wqkv+SfPnXQCdNCIowAqsCfNeYOzo+3GZ1KhU6KdOQoxzRFa1Plow5PXC+qNdmpdPqw8URKTmIlz0BVN3hpc5q20WW7lxK0A4gISR4jP9H06KX73/nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ft+uKpHF; arc=fail smtp.client-ip=40.107.200.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koKbn3QhtUNBG1gqL6vhfBIum+kBt7zZGKmmzEgJSZk4NqPagJ+B0qoLNbt2pDekk9EqglsdCDsyR28oT9v3LqBj5pdMe7YiQgv+yc7oxwc6pAC1MCviktxQGHG3oQ+SQRhxbdEkr45gRua9Pt7r/YrbmC6Fzr9zeHiJizKrIEuKz6dZXDVl/Zfs0nJI2g/dezLK+YUJNCkObQ1CtyNVWH1XliuyfEPVUTdiki+Uw5Ev3HbCikZk/FxXyHNx/ynAQRxac91SZ0K3ReFJdHCs/41orAYM25QPTDcn/Z4vO6LyubUbWZk6hGN7oACZdGWKTio8jz/GtUlowBuBsYVTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTsOEoFCuh3KPAbMXnlcfWsXYhIDUH7H08zyI1OAzBk=;
 b=yg+8LSScvXZS1nKVffdfB4gc5Aen3F6nwuoqEur5+0WAbU7KtWeN7NJmXuoB6FEPMMr5XKhqMy2bm2o9Svov+sPNETe6DmhJ6jHMFeTsUASgT7GTjCuKcAwtrW2jv7aiLPIoarsGYcmEKVRC0C+/NS3GHdqfbzKcR60zzf3ZrgurGDVEkT0hRfuuwqLYJKq9pXpDuS+v+ua48KnzgvSYKdnkTWOUPhdyvsnWm1+0C+8Y818y2lPLDyv0H3O+H7BHBZcXd0GwYqLScMqfPPKHkJtIS0yzIZ45wN33BH86GF+V6tahGt9XlPOTsk9yKXF7OnjQCl1DtNO1RLdfJsnFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTsOEoFCuh3KPAbMXnlcfWsXYhIDUH7H08zyI1OAzBk=;
 b=Ft+uKpHFLlTqu8c+Q1FcDxPcVyG2VOO4NTjBlBmfNRPQAqeGorNTRNBIadN27Ky5yu/ymcoZzSDxf7c+mjH5UYpN9c9arf3QtfY9iG0dYF+paqYueZMPIFDsFWJnFp1wP8aORknt/hwJQ1ebddezQAZMND9pWXwjT+emN5aloQYTpcMSO/8G7KJ0s+MHZjkVGCnBH5R+YgLwPv9+CYumK2EVdJKWk+skPHIi3MkjSWeRt24B2hvhMn1AdOjqo51VzlXND894eNsOPPUE1Fo1BmV16MxJGLQZGqFL0gYW2jXWvQvZukCSDk3PxKPKReqOyvg8ZmSVNw/q1JqLDIIlDA==
Received: from BN9PR03CA0085.namprd03.prod.outlook.com (2603:10b6:408:fc::30)
 by DM4PR12MB6278.namprd12.prod.outlook.com (2603:10b6:8:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 08:57:11 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::5a) by BN9PR03CA0085.outlook.office365.com
 (2603:10b6:408:fc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 08:57:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.0 via Frontend Transport; Wed, 17 Sep 2025 08:57:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:56:57 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 17 Sep 2025 01:56:56 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:56:52 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v8 0/4] Add I2C support for Tegra264
Date: Wed, 17 Sep 2025 14:26:46 +0530
Message-ID: <20250917085650.594279-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|DM4PR12MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f8ab67-b9ab-4385-18a2-08ddf5c8303b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pfn0TatoBHncb/rGtkY4QIbS4AvCxkZQD2lhCJpGykdBvnQT9Zksk02QQA2j?=
 =?us-ascii?Q?Uyb6kOx5woWS5Ab81DSAU0Gyl3I4ScYiMB1OY6IlAJAaR3Ybr0lPeb35gcKr?=
 =?us-ascii?Q?7e7/ehr4zz1Vfrg09pFrD+MxAZ8I086dqBdQgX5wzjB2QPj8QRbJ5fhDvHAH?=
 =?us-ascii?Q?KmGQDVXLOspXw4uOEGTAIQW9L0aIvi/oc1BcBHQOMpBGPOT47UhQDRr3Zkhj?=
 =?us-ascii?Q?J0MM7yZl1yVPja3QGY1fBHLZm81XiRk4dFjV/pzPbgHuxT2J5/qVIfjWff1M?=
 =?us-ascii?Q?4hraoqd+C6yZWiniQxVrWYbHq9sRwwrW9MnMATdya6/3p/QTscHUxRhNfsPn?=
 =?us-ascii?Q?DSCkrFEGmUlwvpB2V3jwzKrEHFtWpOlJ1uTqODNVRjT4BIAv6P684i3f2b5e?=
 =?us-ascii?Q?RypnP16LSPOk9mGj/EaTMGbSeaHsvCHiE7/jtaw4rMZdQBYccLSj22NKIomo?=
 =?us-ascii?Q?dgRgjNbYeF16FX2vMVmcZEjiTwOPxxISHKM/JJHDu47eqa0LbcdViFkR5LNV?=
 =?us-ascii?Q?E+MrM/nArjyNIVUceBWBb91dgOvKPuDRxZ6HpR1/4ESdiLTmY6en+v+vFMId?=
 =?us-ascii?Q?ITWduznvu6XdKpM3Zlur+4dIeSzYiJBJTI84jE7wvE33VokD6qK5RZLyVMz8?=
 =?us-ascii?Q?JDOVRVJGCYIZEh4Sj4L6azdxYP+BL6wZ5lcJTFEF83msD9zv9LKiAWgXimb5?=
 =?us-ascii?Q?MSQ7fSjTf5mDaFgNkGQL/EwzudLusuAPNjzcv5ZT8NaInhCt1D1F38bNu4SP?=
 =?us-ascii?Q?1GlRgVA3+nR+qlV5ierc5qRaDMHWhHKh7TGSFhScBaFfMPdRGzuMUsZGN8Ct?=
 =?us-ascii?Q?5O/du17ipIjUIbCfsxX+eLtK5EOMkdoizdgrVViOqdOMFiRzwKtoDnRpCDu0?=
 =?us-ascii?Q?PeL/Gr53msmwGIAKm5XRLAXKNf/W/l/P/U3r2+9jkFBXtIkeH+I4y5uJxJXP?=
 =?us-ascii?Q?VrccWzolbLMkw0tkAEegru4BC3NMwvgApEszuhJ3RAfZJdK1JVP8O6gVGvqc?=
 =?us-ascii?Q?HVTVbuaP0ZwGFBuAnQYCn2duqSWPP+VycOEhdaZa3COPjUBwypuPO97dqJWI?=
 =?us-ascii?Q?F5k5JgnrUhuti5vMj0qaHDab7lqxds76qJJPRVDbB3sG7nudlNYvDCjUmnX5?=
 =?us-ascii?Q?0YCKbe3TfH9NBHCSq3z/eDP3fNtKdKM//dP9pt8EJ0uU1pJXCLeS820G8HMd?=
 =?us-ascii?Q?8fGd9wtGR6Vum8WaEoxoOo3AxsQN2qiRbIFt2FEQp6MeHMzljVd4Gr9yR2F5?=
 =?us-ascii?Q?uzjGlgk40jmy0AhNl0YcBQMxSBJKfwEGH/mPaTUl/NPui3K2MQFP7wUt2PWd?=
 =?us-ascii?Q?OY30pIR4q1Ao6ssu49jheWLdu8gSiTnSbGrcRzOqFFUIdyFPObb5PcIeuEGj?=
 =?us-ascii?Q?H1c+tafVgPvn6k7DTzsEsGJEhlcphz7u4fR3CyRboCiAcnV4qDyEyZUuVG7Z?=
 =?us-ascii?Q?PNuAKyC4Wz3kI6Ow0RM97yKP3C9sfSQwIKl/6BJIy2qwLsvaYdLrltQwV1t5?=
 =?us-ascii?Q?84Iba1eRHjLSvOF5Hj5u72Bp1D6fS1w/6oHim0+12wA8T9FJNNqFAs/xoA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:57:10.6134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f8ab67-b9ab-4385-18a2-08ddf5c8303b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6278

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (2):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (2):
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 drivers/i2c/busses/i2c-tegra.c | 159 +++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

-- 
2.43.0


