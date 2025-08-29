Return-Path: <linux-i2c+bounces-12508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D09B3B80C
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 12:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FF6B166B26
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 10:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66670305E32;
	Fri, 29 Aug 2025 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tio3ZT4j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A522814EC73;
	Fri, 29 Aug 2025 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756461894; cv=fail; b=P74xCqlTiR0rTq57/qSzNawubTX41TFPjK4EP2VJlXMNGYEs3P7+BL+HlP81dz1Ij6ZXmop5jKoHml18Q55C7OCO7MTA6DnxYOl7gdcqXzlalMTxTEMCbZj5opCubGBOWT1scndn6OR+EgZlEC/d8tK7jEYTT7ddxuSqbr0r8kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756461894; c=relaxed/simple;
	bh=co8mgrqxKzH1xk41aea6XMGCZSOqhbK2pykxzK9DlPo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HFnSY4iNBv58L2WmRo8dfs20dMuGvZHH5zzwVwY02husgeso4ewjPaWOPCl1xNW8vIM5kaTDyGNMuHJw1+L4CkyrkgERNKlraL/p1RBdzf94vf951A4VypXj7K15Mk4d8iuyArZO/VwJN4BqLq8EkCWc9SGDaakDRVNZZfycbKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tio3ZT4j; arc=fail smtp.client-ip=40.107.237.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/DzrgrQxgGLkm6emob4V2vL4IEhFh9/Z6CI4ixz3eUio5WzpAIrYarfW+E7elYE6S6V425e4L5wzGyVfUnQIlNaMV+hVcokzDEjODq6GEJG3n4PGXIPUfRMM24IJ1/fWuGuMvoHqDswu6hS/3Bad2xqwV//3PyCMx5H+EIIWG2ZRakw1wjO4+IPHLTWBx9S5FqadLFOV+p1V6++ZFajUcFHM3olgiCBeeI6fWoFfxVSAwOBEAE76iBKA9Sa4dIOZ0HLKzzmit+NPjImodKN34GiK3lCa/s/hC8RpXXB6g6OpnTP4ARlpo5xO60tWKCxu0g6q6oPyKviGNfjk/E47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHZqMYByb3aAD9mYAwfos6UQlBfUmZyqch+3kwzXDmw=;
 b=tmuSrp+t5Z7AfsROcfXy8xEXb+/hByNM7HzuAyyU1APibRgkmOO/Hu784n5ulBns6DUOapjiBe5zuEXxTsffFqhxalSwDH5frWpXS4HlhWOetQCb6wFBuvkX+2sSr4VtSbRFQ4hKOvjJHQtpSz1e2A+sx3MS5Z9+i6q+WczDX5S501f8uw01wumRAB4/qj9gaoP04g1ytLApOlnRYJ8gBvv2w6/9cfiNaU91urRmi4B/MfeppNghdZT4W4irr7t2anIRlx8FknxLnAoSIOt/119Hl/OzNV0EGMMMiZIVElbKPH2t6WRbiz0EYZn5zXhUojuTmFCouq9hRaAXtwqxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHZqMYByb3aAD9mYAwfos6UQlBfUmZyqch+3kwzXDmw=;
 b=tio3ZT4jwJGRGBKwbWdCnXFXX2OrlNuHgLW7+NM0VEh6V5/QnbJsiUSkOh5iDj6YMvDyuv3uCzZ++fE3zsHcG8RRBqVVtp/E2jfbY0bVnZ6qNpPkxue6VR3iCVQrDDAp0QopmxtMgynyhCNW7+oGkEtnvG1h0LMpIP86MYwQFpRONn99IP9Y4l7FP8xtAnHA4L7gNCV8LFgTaKFfVfy+cZtfc69hM5VpxMzoUAP5PWkdiclO7tyyo3XjbTJNoL3o38yQfuop+nkFI4kZFRZhoSy9Vd7BCjz3nzoYjsaNGkbaL0baCkFj6eRn4V8JGuY+X3s8SboFmnNn4DPLaQqKAA==
Received: from IA4P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::10)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 10:04:45 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::6c) by IA4P220CA0009.outlook.office365.com
 (2603:10b6:208:558::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.20 via Frontend Transport; Fri,
 29 Aug 2025 10:04:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Fri, 29 Aug 2025 10:04:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 29 Aug
 2025 03:04:29 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 29 Aug
 2025 03:04:28 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 29 Aug 2025 03:04:25 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>
CC: <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>
Subject: [PATCH RESEND 0/2] i2c: tegra: Add Tegra256 I2C controller support
Date: Fri, 29 Aug 2025 15:34:24 +0530
Message-ID: <20250829100424.65518-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818043345.65899-1-akhilrajeev@nvidia.com>
References: <20250818043345.65899-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b67d31-753b-4750-124c-08dde6e37aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|30052699003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c42qPDKGBR7JWrQXwswH1g/HBzZVk++m/uzKYDoQ9zO8hZUIweUXvyHpCqvU?=
 =?us-ascii?Q?0o8PfTv89VYm82NBLp05UE8GKymcjwT24Lff89/DGQ9G8ojLWDTB2RRpQ5hP?=
 =?us-ascii?Q?tLuCjF9WB0KQddEDzXT+eP8pduY0sznDHyEJOo86OrYImRhVcpIQOKqHmIt0?=
 =?us-ascii?Q?e1HKU+aL3dF+BdDCP0tAAh0/3mrHVTW6OPW4wucywyw5EiriEl6vLrIDH5/1?=
 =?us-ascii?Q?WMozVW8+66wyGAgTAackGxraylWqpXmZEKRd+LM3AE399OqY3UhZG8/cjARe?=
 =?us-ascii?Q?D6KK0uBZ9tSqBs7R7SMJE6JaWmJlUC3/2LwcnCM6mWKRzeg7kdrLz1WRKPkF?=
 =?us-ascii?Q?aqzbQrbDOjnO1SW28uv6kRzhv0yCkWtPfIQ44mp40yckMYdu66YKk9w/tOd+?=
 =?us-ascii?Q?myLv1OtZvurmdNph0MhRr7CMvrBZnqwmYg3hF3cHEdqMVPhZ+X9cfCkjr/zw?=
 =?us-ascii?Q?LjRt+pai4ErWf+UJs7Ykg/05GpaOGaqoGwjk201Jvt06DNBjEE/OdVfBLFKp?=
 =?us-ascii?Q?8vdW8Hi8aPUagdZWyAPkr8yaFdv5uAxW6u38kuOukg1UHsFnbNLeWTCWQdXq?=
 =?us-ascii?Q?Rj14pdZC77zZWeYGPRvQ816rF9imCNal2XzwpKws0N3UqjbE7c9R/A/slm7N?=
 =?us-ascii?Q?27RjqHy8wiBIXLIW759WpPXEOmZVWrr2k2V1cn2bf8BLWS6z8EhSDORpNMjR?=
 =?us-ascii?Q?n5qySPVSJu8NNbinCoVr3tAVfWXsXZh3fVFGFpgDz5irxx4YyWcQ3VCaamXL?=
 =?us-ascii?Q?ampC3zw8kcy31bzD958/xVxlQ8DxosHTG5OizEymjCoMrj8m6LbDwVhqHWy4?=
 =?us-ascii?Q?u/sMMnQ3vkK+9GBuPOLM+b1TE3UqmFpB2Qg46n9T7kvmY4857AKa2lghwq7s?=
 =?us-ascii?Q?7KUdn6HYiTEj5n6SyWXOgwr/mvHbEBSPcBRlVSXXsUM81u3cnAxxsynjoRPf?=
 =?us-ascii?Q?G6fZ6KQ+1LdWTtzQBRVsIKg8xyO1B3FXxpCIapN6HEC0MqKbBQQk2M7UmTSp?=
 =?us-ascii?Q?KtD/Ih08KiX5I8aoHCh/iyLQvQMhPU1lWIz0ZK//SaODKpq0ycMOvo5LGmVo?=
 =?us-ascii?Q?lK+pyb2ifjO6jw5oWdm2V4vbnwlzRFPbbCSGOGJh0mqwesembh/w/JoDR4dt?=
 =?us-ascii?Q?bNvqiClLeQb/LpOu6URxR7mPD5p0OGIOd9bVmGETwks3fwrrTMioLEL7mowB?=
 =?us-ascii?Q?1MQR26982Qw4tqFA+h2Q/XDi/dY50SX084UyhqVz/9Saa68CsGjGWSqSrfSX?=
 =?us-ascii?Q?1FooG5om2G+KrgYFwuaRFiQdvUVtkMQtkGK8HAojsDTeRQE6er7WMBJzjwYK?=
 =?us-ascii?Q?koFkc1nGEfld/DHPzsaeCzA4SLQ96SrKofCeVZpw8IgMcudefiiQKi8kcOp4?=
 =?us-ascii?Q?BrjRfXWFTipGUtKqA6Dx18OOaaax5igOm94P7pr0ElwlD3P2fACcJAHGV5JW?=
 =?us-ascii?Q?B3FYdHTCE16WaFcGZONc4CSYnhpK16VSamjQqUIRXPbaVS/Vp1fBQBVyGWBt?=
 =?us-ascii?Q?yNCYAi5zBTxSA6fFNce/0OziseoQaJJotHd0?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(30052699003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 10:04:44.4508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b67d31-753b-4750-124c-08dde6e37aaa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

On Mon, 18 Aug 2025 10:03:43 +0530, Akhil R wrote:

> This series adds support for Tegra256 I2C controllers to the Tegra I2C driver.
>
> Tegra256 consists of 8 generic I2C controllers similar to previous Tegra generations,
> but with a different parent clock frequency requiring adjusted timing parameters.
>
> The changes add the "nvidia,tegra256-i2c" compatible string to device tree bindings
> and implement the corresponding hardware feature structure with appropriate timing
> parameters and clock divisors.
>
> Akhil R (2):
>   dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256 I2C
>   i2c: tegra: Add Tegra256 support
>
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml      |  6 +++++
>  drivers/i2c/busses/i2c-tegra.c                | 26 +++++++++++++++++++
>  2 files changed, 32 insertions(+)

Hi Andi,

Did you get a chance to check this patchset, do you see any concerns?

Thanks & Regards,
Akhil

