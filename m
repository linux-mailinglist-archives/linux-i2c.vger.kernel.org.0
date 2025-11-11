Return-Path: <linux-i2c+bounces-14047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A20ABC4C9C4
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 10:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 642914F690B
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1729A2EDD72;
	Tue, 11 Nov 2025 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OiIRbMKT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4592ECEA7;
	Tue, 11 Nov 2025 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852613; cv=fail; b=o6xzN035spH9vuj/9rAAtk7y4JdHqFIzZKGh0tQppaD+1k1wXVX/vHLIb8sKa968+fwGMT04DIYS16HwJhSIP2YNWx6IFtJ14Rx4LFm155qeRBXVjQ32vCibODKGa0WAU/Ybcu/ID6x/JzB0Ge8HU0BwbDEtlXpxSKTPMyhGpw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852613; c=relaxed/simple;
	bh=97v6IgyF4gXkVVnq0KrqN1+Iv61M9c8YGwRLUOyxX88=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QajhOo/KCbSOWljYENjBoUoURYfb7aefVP0adkaxSafzRvAsjE6ZddkXLCbhtrwRsBcFeJqAmz2L0Cj6qYurtt977j1Abk32B6C2NkRwDaJT0Bwm9ZEIb+tI4bXdmkYflkaIG/PgyG+H+0zWGnNi91HP7PD+Nuim6UuAisDgZgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OiIRbMKT; arc=fail smtp.client-ip=52.101.52.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9jdgTWZHnFN6Elur/yzGRbv8S68BddJpzrjv3j6rFFlzGPA7Xxyw9kWt3UHcc7CWCzAr9fX9jyrY6MzKjwnavI32P4DS5s+KFzi6TuDgvnpis/2DhVbEta5qbZSAw9Bwk7AygPenX0P0IwRK3w/cEMhkJBdT7u5jAQKM0S0+b1JLsxKoj4NZB5Cxl8GF27g+TE9gPgahCVpjgRWx2xPQuGLJyEVR+6lc40+y9UbEhkuaLTpX0Qf+cvmhD8xka0ATPNgQER4JFoSizBaioKnvP+5byCfdwUgxlDGpOtkKppn7Uzr3Qxjg2UmbqSqUcX6HQWUwqk+HNlzu71MJ0//8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHQVXOg2kSAhT8i9Yn23R/7GKhazdRxn+gu385LgLKk=;
 b=Qvf3B2qXl2JQsrrXlnuESv9sATUXwtJ0rnABSD6QJAC3GUx0NI9ErojRo3mKPucObKo9pkjZ6YdtAtpTxWKGDhmq9OlrzXKm0G3HQhKPNnVxdt/Y5QHQ03qa5EWHgcNc5HidL8+1AzczvUB4mTb2ntBcQ8unxrEhvSCFct1oVpdKa3BQgMldW4Ubl/9x/2I8TMja1nz2FvuLc0HhwexvK6gyDZ4QY5u9W/yV0ZbNV/KnCQt2fRg8P5PF7un2kmRitazmp3irLmQxsrmlySgBFfmVGfTMYImtejWn1dKX9G+XfCnapY3SZ31xw6qKCRm+/NzKeO6iuYfmD3JXqXAeEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHQVXOg2kSAhT8i9Yn23R/7GKhazdRxn+gu385LgLKk=;
 b=OiIRbMKTByy5C51CZST+EbVhh/MBa/VAg4e6+WArWmF0bWY9XCU0LTRdaPuWLwsuxHOK8SLqMXHKkgHc1UvMWONzESpIHKptqPGcfTGV7drV9jwBTOUxdy0Nhnzj+F9ujFPekzWz6OV6uMRumWXI9McmvYelL7uMtw+607aycwljV1VcEi6HtA8tHWoLDEW3yxQiR+im5iMZpWAGcGSq/R0QZickF0NZkq11vqs4AmMUcuu7BEV6UadQchMQOA+aaJip9ANeJ5IGb60t7RFabzhH+iAJDO4o67j3io4ZarqpYFms7jkX50XR12t01Ukopl+axap31/MqSJXtokcjLQ==
Received: from MW4PR03CA0133.namprd03.prod.outlook.com (2603:10b6:303:8c::18)
 by MN0PR12MB5884.namprd12.prod.outlook.com (2603:10b6:208:37c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:16:48 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:303:8c:cafe::38) by MW4PR03CA0133.outlook.office365.com
 (2603:10b6:303:8c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 09:16:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:16:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:34 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:34 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 01:16:30 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v11 0/4] Add I2C support for Tegra264
Date: Tue, 11 Nov 2025 14:46:23 +0530
Message-ID: <20251111091627.870613-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|MN0PR12MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3566ac-979f-40d7-05d2-08de21030ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lnZQGD+MsKlficRjezHo1FWK75TFaKYgvk7zwize5ozhqw9ZfwbgFY7gZ1wZ?=
 =?us-ascii?Q?CSB3oBqjyTMrOZmhHwgNk1d58euYciOBUy4+XEPWX9DKUY+Dru4L6SiHq0ec?=
 =?us-ascii?Q?/svwp5tWaK66SmEa3CMUmsXIdi4VPQJEU1RXlJwEVU0ovukPP2GgkXO41fRF?=
 =?us-ascii?Q?X/HAjT+IFLjSEoBukzBGgQf49bm14d2nvZMZ4DW5iQ78aAvadsZ9PB+WpyGP?=
 =?us-ascii?Q?2dj2BHGMDBMdt98i32/i6+ogfrFewbyUZAph1fcWPAoVVDF+fcGKOYcgEmLk?=
 =?us-ascii?Q?judpeGgD5GMvWYH3h4vFK4h+I2FLmYtmV6XxRpSSP/c9aIA0+rgnlT/9r1hy?=
 =?us-ascii?Q?r9Q4JaVcfn6FkUaBHov/U75KPGZZL9x5MdfVDjsClMqApY9avZDZvAoF494c?=
 =?us-ascii?Q?hs4+WUQUDbmt8+IzJoftujYlqsGz9eFtzdYd8kmnYA1bnDNe5sA4AJHSoRfc?=
 =?us-ascii?Q?xFbi/fwiJGQrOrJ7mAHv8ouAntGPwGARgmMyhCG1eBHHz+fByZaqKFPdN030?=
 =?us-ascii?Q?wvem4JDLZp62rdjUflSadq87iyJWhN6kZk7oER7w94ltLRQqNdpzC0z2WOaG?=
 =?us-ascii?Q?6KaG1rbI6Ubf4LCj3jMQupW0nvZ4HcfHJqednonuAlSop2+l6YT9u4Zcfioo?=
 =?us-ascii?Q?X4Yim3e5bHGZ705lGnfm9WbJc+9RfY5WBHD+eRvDXvBGoHkzqgTmKiyJEzZk?=
 =?us-ascii?Q?qH2OOMHLh4toY5V//Onb9LiPTxtUFv7qRUpiinfNRjlr+x7JmdhfPPqJXlML?=
 =?us-ascii?Q?F8qUTY9r3ebWB0X2CzwO/JTVAEwRTNPBoO+5ZUjcOtnlUIvfKHg+TxEcUotD?=
 =?us-ascii?Q?V4BFTXxgIJkmgKvOyDYVF7KiazAGj0/oJr/bcDn4+g51n9wjc4eb5xdiv1tP?=
 =?us-ascii?Q?ocNeH75O34laYVFvRn0j0K97vzq+yzYQtvTC1tjpvimZyroTUigi/mmhWtAv?=
 =?us-ascii?Q?ZErWej823CfH/O0T6IOxh4Xz0CQYciXlz3DJfl9IhbDIGFkpxU8PPNhLi/zY?=
 =?us-ascii?Q?X85cG4auxDEsIkdVfHwiZUijguopAbwz/hKEZ2GZE7CNNIT19drv2RV4yXSi?=
 =?us-ascii?Q?QcpSku20WucWeOS8E/ULdOK3iHgnI5MmKdfYdQ2dP++GtQ6o+d/hZb8KWZq6?=
 =?us-ascii?Q?CjEtzJJ6OpbNz/eENxwypeoQG+vpiYK8DwsqIFGIcBK45q116Ct8hDPIh82l?=
 =?us-ascii?Q?HBoAylF1nPJQDLaKChN/WxXCivYsDBoROz9u4kbo9ozZ0UL8tRgaRi6PRErc?=
 =?us-ascii?Q?0hr5oWjPHcoQtzxM0M3VDZ6Pisw0B4mHaA3sPqV89u2VV2n2WyNGGxXrGfsR?=
 =?us-ascii?Q?rcKPLPj0rMGgWxzrxhXMxndaPC5NZSoXPZKqsoVS/exSRf+xqduYphftILhd?=
 =?us-ascii?Q?4BGEASEHFZ5zhU3goK0ajhfgF0eWAXwZpEttb/ts9/8Iv34Da3NOiQcmyM4q?=
 =?us-ascii?Q?Z42lhAqBytscGyjXLx1y1tIhVIxxZJVKB30tGgBkSFmhIQx9wR+Ear7oNpZx?=
 =?us-ascii?Q?N0lLMW860LeQ1Gsc9N7zZJJ4XKcby1vsRNOnrzCM79qusaGBJM428MHh8Ys8?=
 =?us-ascii?Q?xQ8inrRC+SuPByPFJDtRSjbIo3RRv7+qPFwcbtvL?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:16:48.4110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3566ac-979f-40d7-05d2-08de21030ae2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5884

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (2):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (2):
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 drivers/i2c/busses/i2c-tegra.c | 189 ++++++++++++++++++++++++++++++---
 1 file changed, 175 insertions(+), 14 deletions(-)

-- 
2.43.0


