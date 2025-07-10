Return-Path: <linux-i2c+bounces-11895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D204B00315
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 15:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6138D17276E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 13:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805272E62D5;
	Thu, 10 Jul 2025 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pXd26WCx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58AB27055C;
	Thu, 10 Jul 2025 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153175; cv=fail; b=AQRZznRSXXocAlN8rAJEt3SbfNrIIUXfnp1zk0WZQfWWchNeZ0Z9PdkxGbKUnU3lJF45dJEL/BmfthWeiYLEx4YFkb0tgKag3Z6Ko1khPdj48dkOCWqk/6nun40Toej38RRAlA9jaVX7RxNyx16RLthFNbg4q4HppYNTBqSyZHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153175; c=relaxed/simple;
	bh=WDS5Y7wQV4WAuUwCL3YWM3YmSC/bkl2PM4GxtW39o1c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P04t7L6DyKNkxH6ocjxFU4R11el+xV5e5W9RSzxBQqt6rz5M7kt08OGcnPDrjFvPrUfu8E7SDlM18TVcOTwDJY7ylVX80tx443WzUmiKm6ZZhRpkf/73DhFmKb+l/3N+wJXpgoC1qkLp1XEntVEAdYUNFwlxjSftDudst+19BU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pXd26WCx; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8QmbP4zKUsZYuatkr8LGAle3Q6fqBnThlS2kW+pzCGF7A7b065qt13EiZeUdLZ4kcTCwkZ8P6UCjgmGXiSGpyyBs/QfFSmaBssMXWKeaCORgg6IOgXIe44TWX7adFuZruRAcYHkp3mezSaRSGXmXOyge7ZBMpw/taZLAmSYndA6W1EVpwIXFhULSkH0Ej8evbCN6WIOF9gHW39aXqQ61bKpJ2Cjuhh7usEn7PD98I7MzB0irFgdd2a1sx8QSwWkmlEDlkm5iRZ7ntLea2qIeUduEJsz1VslYdgbEK2Kl9Ro9vjURga9kLbya6jG2Gj9nh10ode6UZVNeU37koU8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktA3pXVY2EXAiTMJwACe7E06tU4doElreH8XV+GqGxQ=;
 b=TeivbdiPATSCJ3R4Iu+WxxZ9nL0pBHatoBShEGMq6pVGS/+fUGFKoBYoC1hNFsR0saJpRqd5VTAsT0yMPy/nQFVbKNqiWCUHNbe6foDdyb3rs90MOExbLE/FJpBlYTLI7T+XWOLfUbNOa2RiusGWkkOjb0Jf6lvRHT8RJnqMdQaURgiqiZa4tdHoQVAgPXwWGzHxSdJO3s1KnoNlp4KTmvE8MtqGvo/y8uMbZ6mds+H79h3Wqq073sPRJH92sc10Nafr2psp8CBRACB5/2EinfM8KanZmvycjhipgXu2dw5ScGbmqysPWGLufWU7jBX4KWlAm9hlvB9+JWAe8Hkngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktA3pXVY2EXAiTMJwACe7E06tU4doElreH8XV+GqGxQ=;
 b=pXd26WCxz3bb/kblVp4J/OWlMWhaqRVnckbKZxrxckA0vtt003lZqUvDJZSlgL6TI81uCPSKYKbj+Db/DWH2o6d8cldTGt1+5wOdbL0TVUv7u/TsDygfzKEAS3TXsK3xH/KK3Jl+aIDFn3L9Jtjg8sthnoHZil+tBvj91LeJ94lAsk9ye7BYC2MRmrjW7gUV/VbaawPnPkdm5kCU3yUteiqNPEpGm2uU4uZ6v4LPGmO9xxTH8aiBrw+iJO4/EMqne0UGsNe69ZrjF15I33KBUUAuwIkhZSYnUaY1fK9M0Mh1cx2n9jHlirOWDBCVV6W8qbi6xALmXHPDJz143UyNCQ==
Received: from SJ0PR03CA0348.namprd03.prod.outlook.com (2603:10b6:a03:39c::23)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 13:12:50 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::5d) by SJ0PR03CA0348.outlook.office365.com
 (2603:10b6:a03:39c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 13:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 13:12:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 10 Jul
 2025 06:12:37 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 10 Jul
 2025 06:12:36 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 10 Jul 2025 06:12:32 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>, <andi.shyti@kernel.org>,
	<digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>
Subject: [PATCH v6 0/3] i2c: tegra: Improve reset and DMA operations
Date: Thu, 10 Jul 2025 18:42:03 +0530
Message-ID: <20250710131206.2316-1-akhilrajeev@nvidia.com>
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
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ff7b61-0cfa-4ba0-15f6-08ddbfb3789b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uRMgjhDeD9sivV1V/l2x5tt9xCIXfuiK8b57k4k8qy2rECZdF4NSJv0cxNjG?=
 =?us-ascii?Q?S5GgyU7BG9aViGyb6Z2QptSxitwCf45QzyO17X28gSpGtYyRPxOJ3LytXKlu?=
 =?us-ascii?Q?2KrLPN9+Zc6Hyf++/yLFHnMNPUSVf3fFGFk2xYouLfRDTYcHbcSucXu24KUV?=
 =?us-ascii?Q?cl56T6CCNS+T93CiqLEI14QRg9QQ9tCTGcbGzekI3Yq7QBQKYusj45QgQNLJ?=
 =?us-ascii?Q?90sVJJaV3GHBKthyFEC4su8eX/Cj4XQfPONtC59VZ67sKzKzWbQdgjhPIJEi?=
 =?us-ascii?Q?HIvAaw3Jjh1sIFNOSfOYctdfNXDlLf46U6wyPsgdNFyeo3KPeNq5o0bUmGbS?=
 =?us-ascii?Q?UXXQlSXYDARCtQXcvV7qqW1cQ3L/LrFrHeeMbgobjTG5rLvTXUQG28AGa8iY?=
 =?us-ascii?Q?mtjlCe4k1Y/VSf6DsU45zfVTJHaIPdLGhEuCRtt0rcpGLbg/ArNnH11XSdZy?=
 =?us-ascii?Q?/MBqKSgL8LngvWXTEHwHOmXdMZk1j9DfuLipY5/yOTAuhuJ6j8mQSxR3gcaK?=
 =?us-ascii?Q?saXqhDtHoyRDCVCiwwrjJErcK+f7WxX9avsVDiyks8DD8dfcPE6BtsUD7GHb?=
 =?us-ascii?Q?rUR8UPlW2xP6qN4xoXjzCCK3O098DLOrQcwBqQ1FuHytQURKLYww43k2paZt?=
 =?us-ascii?Q?rClsxnPFZ7Q6Vo3so8KL5MWzsUocawRO/iPtr+MlrDNko3XJ/vCO3r8b/9IV?=
 =?us-ascii?Q?CaP2WMvwpU0cqbkAfVoxPf/j+V+0xpGocCt44VDXnGK3+o0XzF8hC6LrNs1R?=
 =?us-ascii?Q?VDc9YW3lE/R4govsFb/9F89U9kK0u3jXWtQAl8xU3ckkaKb6RUy8iZYcZWgX?=
 =?us-ascii?Q?hvUwsFE8qcrx6gNw3eHKWp9vz8ssvw0YWu41wmSylgbc4Ze5/Qu+04QL+ILX?=
 =?us-ascii?Q?fBpQpCECsakHImlAMoOm8fPyLLBhBIE622zcrI0nrIozvt/EfKQeKj63lXuB?=
 =?us-ascii?Q?q8aNLPp+4J/gbenRbfVMEpC1WeVNVEasFlWMp5yV8rtI2Rh0F/fnwDh1nOOA?=
 =?us-ascii?Q?pky17xCbDPMuhb7fH184JKqmeBPlBzsuE1geUoT1ClawhrnVtXkVssbpeb+6?=
 =?us-ascii?Q?QGT6AGpxZG8k3IHWcCsczvBT1eOlKPOsnKG/ok3+zwcE4qXD763CQSyPLp3N?=
 =?us-ascii?Q?MvI5v1YvIRjQoP4A1POnK1Dne2FfJ1UZdJIM0FcV9nXLKp67sBggn9OmIwUA?=
 =?us-ascii?Q?dUNRfU0zajGOAyx/2H7Zi1WlHYeNvRlwTWHMXaOlWICWGBLYwgiYz5SBtA9Y?=
 =?us-ascii?Q?ojZpQP5YBcamOwLShsFNX9LwKhcmm4BT7pNfTsDLzmoHiXZGH9qSMLINcZbL?=
 =?us-ascii?Q?19jz+l3xgVdY22YBqEHPKZJ4zoapOAe64+hvf5MAEQfMboglGiO3OSzGKtrJ?=
 =?us-ascii?Q?lldvEJO+7LyN3fxNkwi2fRDJmvqbWReDEfxvx0jRbH9XtN/uUFF3DQhoPMC7?=
 =?us-ascii?Q?FQ5Rs1GcVuSmtDdfLfTMw1IgmJ7GKZPkxYMXxV+a5OE5f5eUWh9pRlhNPM0K?=
 =?us-ascii?Q?dC+Ub/bx9re8mRan8A3RVzLEAJAiSAlfNKc+7nB+OI/ahY5drCtiUkgl4eIg?=
 =?us-ascii?Q?QGW+1VOHTfPncm8hv44=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:12:49.8572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ff7b61-0cfa-4ba0-15f6-08ddbfb3789b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451

This patch series contains the following changes:

1. Fix ACPI reset error handling by using device_reset() instead of
   acpi_evaluate_object() directly, which properly handles ACPI error codes.

2. Add support for internal software reset as a fallback when external
   reset control is not available, particularly useful for platforms that
   restrict reset control from Linux or don't implement ACPI _RST method.

3. Remove unnecessary dma_sync_*() calls on dma_alloc_coherent() buffers,
   which were redundant and could cause issues.

v5->v6:
- Use device_reset() instead of acpi_evaluate_object() directly
- Added a brief description for internal reset.
- Added a cover letter.

v5: https://lore.kernel.org/linux-tegra/20250704064704.23003-1-akhilrajeev@nvidia.com/T/#m21ab8542cf92d6daafb6db9dc90b03eb63de8bbc

Akhil R (3):
  i2c: tegra: Fix reset error handling with ACPI
  i2c: tegra: Use internal reset when reset property is not available
  i2c: tegra: Remove dma_sync_*() calls

 drivers/i2c/busses/i2c-tegra.c | 77 ++++++++++++++++------------------
 1 file changed, 36 insertions(+), 41 deletions(-)

-- 
2.50.1


