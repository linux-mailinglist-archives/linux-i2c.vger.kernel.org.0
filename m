Return-Path: <linux-i2c+bounces-11281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF16AD1AA6
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 11:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3CE31889457
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 09:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB5424E4AD;
	Mon,  9 Jun 2025 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ITdMzWdU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFCEC133;
	Mon,  9 Jun 2025 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461685; cv=fail; b=Eq0jvLx/+QsC8vGtcF4eqEbhyTJTLGAprvgxhZ5D2w56tKnKN7lU8phk2mFVyGRuix6lj9aMSqhGPVKdi0Jj529iwW54N4VCFUlCdVNWfFnqKyBJ5hY8CHlLTC8NuwoF/Hzy9OCqlcEB1uep303DqL0E4KWtIS/YRKL3zpROSb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461685; c=relaxed/simple;
	bh=ukIxIBS3VGdcb6jQya/FNLSb51fWo/0B2NRyM2FMXy8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I0psTeFH6C0pbXGPEVTZP5sIK3L4CK7iMzWdZStWabWAXnnGTlSbn32t//TGTtOuGxefFUvZojEcqgs9rnQFx1agCKglTEiE86xM+nIY8ayMQ3bVceHn5S7QbN+z4Txej2HMJ9owjRiOpfGQZ8UQ2mtZS6E5xekpYtPG8qlBzzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ITdMzWdU; arc=fail smtp.client-ip=40.107.94.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRk2p4FjdAVKFips2grKYqUjIcJLZKhloR+J3zF8d8bCzBa1vc6Ac5d9cwfDml5pzyvjrk1oElvT9MeLBklDqJue4aRlGeee29ZzScsJABf8W4j+vywnsMX9i/f3va68YRbuw2JlWgCkCSg0e9fVj73vwn/Nf+jVAsQAT09L5oztEvbtJGMLyVvJstAHSMtuwkgqMbS1WdLe3gKRrjHRxl84d7ln9SRGXaIQ/deYzkBd1x1FYGhogTsKzeVM2p1NftyWAfGMuzzu5RGyRTCORy7s0/lWB0/ltNW3S5Kyl1eZCr+kytoqOY63Z8kUgPeMBjdLMeko4b1RusqeT//d1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrX5x4bHYof0RX14bY6p+GnyQhbv/1OLvmENWWs/JCU=;
 b=tuQp9t4tzxG3M8j2Z7CABLHuUwTZ8BFrhsf+t2khAeGsTcAhJFXDB1u1+bCAhiTqSwVw7W9a1OLZNJwXfhgApKaY8JGFJxcbMDHdohL52jYg9ZN3Q+lDO46PME28p3c7b1+23OEUFfo9uyZuaoesaIjhjh+xg3Drg8dK2QTid6cSLwGP8++xH3JROnTITwYQiGq6+RR8opRcsxW/FAbOl0jrLcdyGMO6KxLrg4zu6cHZPVdrf6+kId2K8cMR5gglRHIAsyf/30VVbX5jndXWJWgU4x6C2m2e+WPdtM0UAKmjzww3l4aLjYqG4RY1fVMbJSdy+JdfJjyvMsAQzoYpNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrX5x4bHYof0RX14bY6p+GnyQhbv/1OLvmENWWs/JCU=;
 b=ITdMzWdUkzH0IN+tIL5VGVd12ChaJbM2+2WMy6drDXgiAEccb504qfDPZ9m3eNx/oXoWihy95Ddqnyr42gIkYvFwu1knCuHFtDibVIBfQq8rptk/DcUuRmf3PDkQ4hbq6YH5YqNZYX/b650SZtNs2gFhJSdDrFiSBRkzX5XFGlM09JmGmRdBls4gyxyTxTn8avjQhgK9ULUjrFRlIbMInAtHIdRy87vGmNh1ELMpj+TtUDNZtq4WYaiW1JhzjVqpmNQGIcT4Kc9n2KVfketgd24lWCZgKJ7iNZJ7GJnQ34+mH85OZFKWPX9mUO9Q8xD+bGq8VAaR32EtedQ+RXAYlg==
Received: from MN2PR10CA0026.namprd10.prod.outlook.com (2603:10b6:208:120::39)
 by PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 09:34:41 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:120:cafe::f3) by MN2PR10CA0026.outlook.office365.com
 (2603:10b6:208:120::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 9 Jun 2025 09:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.2 via Frontend Transport; Mon, 9 Jun 2025 09:34:40 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 02:34:25 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 9 Jun 2025 02:34:25 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 02:34:22 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/5] Add I2C support for Tegra264
Date: Mon, 9 Jun 2025 15:04:15 +0530
Message-ID: <20250609093420.3050641-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH7PR12MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e8cc20-5860-41c9-e46d-08dda738dc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uQYswulet4URqIOsghJqGqc8DHjAZabPGAKiaf18EFotsqhtddpLA4pha4fz?=
 =?us-ascii?Q?BAUNIDWcCE4+ppMFaHgG5IXde3hQ/RG0ifEaiBQKC+vNrmXl5x6LYX5Xsjpi?=
 =?us-ascii?Q?rdXTGvH8klz0L0NlWYMUGJg2bxsZP1lBnVFvHXzGYEvPKPGBoYqjBu7lATZj?=
 =?us-ascii?Q?P4936Z2YMaGHR6/3HcA8zMQ1f1BDAvvrAFDexHGAbZ+SxbNqMLPow4Y0/jAc?=
 =?us-ascii?Q?yFsRg01RXnIruQ9JL+Bu+ZsN0STIUBQ+i8d/5VrGjXT/iiKR8rGA50lCaPOO?=
 =?us-ascii?Q?M8yECp8Pu6WIKfi48DNW1q93AGEaXYxfNJMtA+i9ChksIUCYrt1+77EXYHXz?=
 =?us-ascii?Q?/YljLkoTu2WTL2E2P8jV5JxX29WhlyGVAFl18Q7FBAgT8Cmhl9V/ctH92Xi7?=
 =?us-ascii?Q?xbV5hf8WFJ7yyB+dv/dI1E0jQZiDJbglDm2xEMrxSLgKh54gcMLcm3qMvy5M?=
 =?us-ascii?Q?rx1rZpBPhiZLVHK3LZ/RhCNIPedLdK7C1XsAWIaMdeyKdnMxfge1F2sjoHLS?=
 =?us-ascii?Q?sZrk+NHw7SIEvsR1hXK6Ms65pTx5Bn4h8ZDyOzKPlOeBpjkcGZxlI/omS+Kk?=
 =?us-ascii?Q?NjlL/zaUKnbIwKvzgFzy3/3Ro0YXCkb7/wtMK7dayzKIXfAR+UrXv6+58uzS?=
 =?us-ascii?Q?lk3FjeEXQYQFHJ5yG+l/DmwhVbwTEe4hkf9shZl9U4MQR2Ujwdn8jR+sOWqz?=
 =?us-ascii?Q?OzRqgKA3gRV26nC1F/LPl9iWuOXhx0tqY3DYYX3PCPqVoCPAAWjuq5uzlUm2?=
 =?us-ascii?Q?vouWtnRNWQzqtQSbf3KCdnpEqlFMguwVWmVOWJKLJCXIq60vC/RrynKRMRrd?=
 =?us-ascii?Q?hTcWS+2YUOr6Nml0Dj9iF2Xw69TH2aj665UIhO7nNw/kim4Jae85K/J8YJ0R?=
 =?us-ascii?Q?PIiKiqsaoCaHEpsyD6DYg040I5NJ8DH2gH/s9VQ8INTKayKn0jYVO2r4Odn1?=
 =?us-ascii?Q?bHGkvLXSPbSe4/3fSDkn5JZp8r4i494eAQM4upWBhgqvPpTztAlw9eWtW8CV?=
 =?us-ascii?Q?rvxAKXnA1ymYAb7j89aFWJKj5ADTyeOR6iBu1zkSc4INstPHSxYOziisNmUv?=
 =?us-ascii?Q?XuHtg8cT4wlsIdG62wIIj5cO36LWD4/XoXe8GiLo85zSAgLKSVrsbr/M3rN1?=
 =?us-ascii?Q?Doiie4DUGrq+lCbuLfFCNVxEexkmzWx52EJBK3vzRdS/xrAwRhg1asskuYT5?=
 =?us-ascii?Q?IHSXrTeBufFha17rMpk188jEfhlHXncxGu+6bFNl2PgsVI/eb5+YEQ71YYM7?=
 =?us-ascii?Q?DXhKbhWTCF9bGC1vbk493YGHZTA7Lu/ENcQr6sWBKAfZepvSyLjO5VMxw8ex?=
 =?us-ascii?Q?/gqFhEopCnWUDAZXeLKrAmuuKjLm5LGVOBu4Ehhrw2AH1zaFJKsPLOPFo4LI?=
 =?us-ascii?Q?SAYuRhnb+1l2os1YCp6VrtkBFO+PzVoALpg+B9lpJmY/57sPERwUxSL3y1Ix?=
 =?us-ascii?Q?+uPOnaK+NOh+Z6BESDeRjlbc6WRqay+0J7zWtIqAxyuN73itMIxTGfrBPx05?=
 =?us-ascii?Q?YRKsVQK3VvMmxFoiSNAm0YoUqho9YNJN8Asp+UE8gyut0jDPRhbg4Ridag?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:34:40.6305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e8cc20-5860-41c9-e46d-08dda738dc0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7794

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Please note that this series depends on the following series posted by
Akhil for review:
https://lore.kernel.org/linux-tegra/9803c165-fa2f-44ba-a6fb-f11852c319e1@kernel.org/T/#t

Kartik Rajput (5):
  dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add HS mode support
  i2c: tegra: Add support for SW mutex register
  i2c: tegra: Add Tegra264 support

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |   7 +
 drivers/i2c/busses/i2c-tegra.c                | 196 ++++++++++++++++--
 2 files changed, 188 insertions(+), 15 deletions(-)

-- 
2.43.0


