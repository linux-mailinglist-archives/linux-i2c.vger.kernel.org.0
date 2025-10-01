Return-Path: <linux-i2c+bounces-13279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E28DBAF498
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 08:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4385D3AAA3B
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 06:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246C0238D32;
	Wed,  1 Oct 2025 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P9gMD8PQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783221E51D;
	Wed,  1 Oct 2025 06:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301299; cv=fail; b=JkNQJgnIseiQ2Spaa+iBkyhZGLlruOipFBQz7JofNG/obg4Dw/Hy5P3/4BsJstdKfjSz983QtqUXuEgbB4g2ilnM0pU7IbQBaACOE/rnWGAB46oCx0ajYw2DSUKiDnBr47qfnX4h9NTB40nEe3J93fFT0xuafNKSGplFJSZmOMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301299; c=relaxed/simple;
	bh=iglYydHfxuYTASN5awCFBcgA9iJHJpf9Yw82T33q6y4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gc9DXKiSQkGqFLIbIgC2xpELiWNYJnrjvTTFlX72Nq4lz28ajTvl7wIWnWKZaFvJzcHrZcPIZsThn7MHqZI/v3Nonyir92PunpbTvmeElTEqzeQ2js0HrNkN1ZuI+NRXDQEZq8SvloKjRFmm1/lAUuMG86s5J298iCBkAyVr594=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P9gMD8PQ; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XelI9tZhUuRFaZIYbW7n3ZAPlcYBUbPOleBzgnkv2PrADLwEeHsWuDbaeRWstOcl3mgqFrJXRKrGGDeUU2bWulBQ4+pFdB1Thw93NNjVfODndg2MPafAWZrnoIb8/wSzTgkBqvpRFGiUAKfAYMbI54lNtSBX6Vtp+eRocNyn+rTHPaNRsFVwFbn55AecuhX/vJda6Y2pG0wRKG4GEa+7p021KBDw4veV4ACBPJiajA8cjcdxQfcTH2F7MfwtB9+59fXhH9XObxT59fI+jTHFpBMJEgUTXp9CHwJlvF4iL1OcviFIH8VKETNTFRQJtlyxvGroJySM2vVdE3QimGmD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wscfSAdQPPABEyjFRxZPHrhaUDi4ZlSWm3qGCOM6VuY=;
 b=pEUvDyDtaA4PE2Com/HVErPYe5Iyj3nteVk6sZw4D32PwRQAfDBZnGLelSGljU2TWKQ6zG/gnb0KRCxr0UhO9nG1QQVfomItJZDgUR4B/WhXX2JlHOQkbtCbRq4JyqmJ8iv/hGtATN9cFe5ylxJNoC75SYCYB6My1Ma3MKEckYlV4Yd0URnhOyx46pV2tV3yxn8iKTkr4V2xOPX5XvrseqN8KC8oWoIep7owB0DVX/MOky7Zw7TRQQ2bHsA04K33eHnyaeoRXs+uN4XKlXHZa0To0pcgxs+vXRvML2CvyQR/m0mj6xX+s6avarOsDrGFtjTTEAzwZNdwSnR8aEVjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wscfSAdQPPABEyjFRxZPHrhaUDi4ZlSWm3qGCOM6VuY=;
 b=P9gMD8PQjxYRvpw9YopZ2uWewt9qOEMqxABh0hbIO2PGWBhRoAAjmVJp9SUOHPGUFOkOdJeRCMG2/u8oxT8F6fW8dvuW+20aNES9iK6VxCDmfoYxPtempMq/JDwemDsS+h4fwczptfR5ViSPiB2GQbp6HpAp+mnSaKKN7tTOMJmgvstyCEhAxWhLk2h6/VhOsX/r3TkWBnYyYBsGACfzIQKfZXz50JeyLUGUrz+Rh4xKpyKaokMmu1ywCR3ehJ+PAVdInjLNjOjebrCzl/7zpLcAuIltJzCCtguboruRWIwOWgidlYX+6+E29do99v3XcHgdmR2y7NKA5e5ajgUsbA==
Received: from DS7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::7) by
 CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Wed, 1 Oct 2025 06:48:15 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::f4) by DS7P220CA0005.outlook.office365.com
 (2603:10b6:8:1ca::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Wed,
 1 Oct 2025 06:48:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 1 Oct 2025 06:48:14 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 30 Sep
 2025 23:48:06 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 30 Sep 2025 23:48:05 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 23:48:02 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v9 0/4] Add I2C support for Tegra264
Date: Wed, 1 Oct 2025 12:17:55 +0530
Message-ID: <20251001064759.664630-1-kkartik@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 05036720-d565-4517-4e9b-08de00b67ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3mbsgrBfZLrrK389ds0HSl5eXo/TdREqQh6+XfdkO/Ay7nQKiONsbhzVXUch?=
 =?us-ascii?Q?astEuFRIVZlGiDFnc3FF65j9uzAy1ClD7cQrgZ2ZJyt5wr626zuKspCoKgYw?=
 =?us-ascii?Q?1FTQEkaS20i86u58AAEsMKqs5e4uDF4pzH09v7AcK9t1UT7KoT6COxHs7Eu/?=
 =?us-ascii?Q?SZqmv/QYPSHJOyq/hsSzto/aVMRQCWPCizrJU8BYGnNRYywsHFDD0SxNjCnY?=
 =?us-ascii?Q?UKNKK7uT59qwGHens+loJBHshuPdGhc2qKw+GQ1jgGV54gFxRaA+ssQjtypH?=
 =?us-ascii?Q?9rjL5/2ODN9YsX7Ku4xztjvWbyAT8qst1lLSOoOsPzj4jmEy2rZoboixcqB8?=
 =?us-ascii?Q?MY48j83o73HvpLERW2XSuULnwSt4WHjqRuz1VYYCHiStBQw6pGpzy3jxxLgh?=
 =?us-ascii?Q?hgmM3G0TsLrrG1VMrofnqzgKamA9vSocsrmLVRjWdmViqG9mq8bW+GCBcUkY?=
 =?us-ascii?Q?RlmuG03cVEIxyaGwYohjeCRcHfLCSj8ibHrZ5RN3CJtXGtTbMEyXEUW+Ezbi?=
 =?us-ascii?Q?NXPGVVmb0V+CVnpFKODrr/vIs9bIaFG3rpU/etBEP0veHQiL/NXdIZ3xhSkt?=
 =?us-ascii?Q?UT9zzzr1mTZjwTNphLH5xEWCT7iAiQ4zuYDfYgMGNythmTNrLzGRHkunIPuk?=
 =?us-ascii?Q?qOlFKyOrMf/wvd/B/UhOhKFsaGnTz/BNNZc5z0RjH7PRUFCt4X1EfqYYBc+A?=
 =?us-ascii?Q?mEa4dZHKdglqaYm3ePE4EeIuEZ3/t4eH8xIF2Qq7xsk/L35EdAivGnsnI4+z?=
 =?us-ascii?Q?wCAeQIKVfXJF4OvFUYUKKY1gx5DBSCF5VSsijyXgfeHpwQeQ9dx+Pw68a8dq?=
 =?us-ascii?Q?28qKGBm763HsVRrh4z02xSjmS7T+NRMyk5RG0vEIODv291k0Dsk+QJu5Y9M4?=
 =?us-ascii?Q?bDNF8eHrIGjEHzf04qvX4tI6jpIFfJ+Q5W+Zlt3Pn3W0U00sJ4wTadGnEoJT?=
 =?us-ascii?Q?N+5pg1M5OQrKUHjYntVN59WgE+gjw1Xr9UI7txDjgBOGRQq+fV+NatIApxHT?=
 =?us-ascii?Q?VzLMX4OATOOJTcaYTjRrAXvdIPiSLXsLVK2w1L/FIkygYLYDCVRK6kvT0ftI?=
 =?us-ascii?Q?u8dxp1dSEc+/87kefHZ7ty7ffkfPcmz5d/MhEsKvtt0Z2ZCtDD/jvf25+3d5?=
 =?us-ascii?Q?XZ9Vy/iFt4uBahImtFu/CoaAwlYWLQAxymvQHgR+BU04F70ZT0WM94Z3LWUn?=
 =?us-ascii?Q?vZGvNvEdUHcWF+ujt5NtqVv9zsbAA7p4nsaM05LNS6qE+6UveQuX3I3tCtIo?=
 =?us-ascii?Q?FJnsHBf17CTQOPHDFColEZl+roAtuaXrx9CvmwO3sOBZzq8z9H775Ajt1Aq/?=
 =?us-ascii?Q?JnG6JJOyWdubM2iM5h8FKxZIgZxLdNxPGLkUzP2+b2arzhnyFgnR0L3gAYQf?=
 =?us-ascii?Q?Pv89sPUgiCkJAyXFl2TZCqYXsaQafBWIT9fqwzWpq0fHorunf9aSlfZGfx9r?=
 =?us-ascii?Q?lVzgWYRzZqT2w6sbgY5FvRbxQ6Tm2EQqywp3QcSVwlbcfNMNSsZptodVtY/c?=
 =?us-ascii?Q?7c9U5YdilQp7tD9LoZrEPlXNywcDNhBmoKWwT3K2B2/VPRol2vTv+gdh2F1R?=
 =?us-ascii?Q?bUpkbIGvXJ/AzPwfR5dCceUzQwin4VVxsPJ3Q4g1?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:48:14.5985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05036720-d565-4517-4e9b-08de00b67ef8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527

From: Kartik Rajput <akhilrajeev@nvidia.com>

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (2):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (2):
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 drivers/i2c/busses/i2c-tegra.c | 175 ++++++++++++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 3 deletions(-)

-- 
2.50.1


