Return-Path: <linux-i2c+bounces-13280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B2BAF4AA
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 08:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EAF73B081E
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 06:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFF4271469;
	Wed,  1 Oct 2025 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V/3Zh7tu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199726981E;
	Wed,  1 Oct 2025 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301304; cv=fail; b=tziZkgVvfEoJOojj/h4jZmtcBrcMuEPy7IqJnmF75srylA/25U65MlTSBf7EGB7A1UJN++AcjcmUYNq5AoDT4Lyo09cxmejZOYLNAxVkoa0Mnnfm+EmtKuAFBfjQvGwKWQQ07vM+Ygo9UGhacWRy0p2Crc3ka/Y1aSj/KxZvQrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301304; c=relaxed/simple;
	bh=BGMp4af+sBF6u17MZ7fQVzdSjrQDvf0kilIqxqLiAbo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UewmGgoBgzSIWh8l76Ip6/fvvv2UeP5u0N8SxL2ExkGVHl/PTSu/uv6OTvph7olmnp4foCHqiotoxSBDpJgIf+Gdz6hXFZwiKB6pr2Ki88cX47TMC83Rtl4wHXHPiJJZEalstk0yKPzjJCvFrX/xF0oD7tA4F6x7L+XBMi1j/mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V/3Zh7tu; arc=fail smtp.client-ip=40.107.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sw+Elk86xuGqqVcdAL9G5bkDNBRoCxQaJ7RUrmb0ZNJ92ln0wFI2JiTbL5u2IFGPLJpiJuD444fxMvYCk8mqCN2g7J4CzzDOcUALKFJ01kcJ/qxP9CdJ6p7nChnL08B0QEVNzlum9UaA6xBAwSx5DLOVJS8W9KB+VTuggfUQ9bZFuFpzvOzvG0nnZqp7R6adMf6ICbfjgnrgBM/xnv3d7CCOuQQfNMxhG8JL8FW7II9+xNd0vYs5iudGBqlmK8QAzzdo/eui3SlzHHp/au3VeSNeRiWPxZEVHbI0ZHquP/GPoQqeC5ytfnFSK0+yYxTObMA9rbd7YKAx98SlsyGbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOh3h7o5P2fNyAWQcu3XHfD4XJ5LopcCpOEC1KHR0dM=;
 b=v7jvEbZgNeCtZlK5QAb+vtGVV4ICDyh48lWV1BHnLO/lLOFLqEG3GebzLVH6Tx9d44vnpyUo98Ge419FVlFN8TlsEsCm4PmykXt5hSPEMop3M5XX+Mj1vsHMRyR3uQ+k57W6e2raPyESfAEh1bah375fsGUCGv1MVMVms1jHAxQ3tsY7aJoKa4UrqV8+lS2JuVgRhmlUpZCw2LgmIYMS20e095+Govcb/VXqnQHtjAwAye3LJhjjDxpcoCX5kIBD0IHtrR6dJ0bOsSrZU1Bk/R7PZ4ydmRSNNrfg+LYJrymMGS8AyUhXybxht3TByAXQhEz2gw3r8rGDYrH1B2ph9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOh3h7o5P2fNyAWQcu3XHfD4XJ5LopcCpOEC1KHR0dM=;
 b=V/3Zh7tu6nm0JiDk8YcaqXLeEVxGbbmk5/dTdJnhkBYTExw7x8NPdDMReiQPVXhclbCFV0kORKhy5Zw8uxHfAMJOmWW8390Qn/GTFtB4QcgQD+iyK/n67Zc2KkhFinMb/Z234pR8l4DF1Nzi2URHSR0WmwA7e0VT+l3I/JmPizGPBO4/afxJROfylNf2jSgaxLP/CLOTAWNrdIgIbg/8yU/jmgiTb+ZnDRG9VnX98Jx8CfOZxgVVl5WvPt2JBGXN4BsUxc30r01pVenKOebfHOhJMtIDC1rPOqik3qeUg/PuE6X0/VILWO0Yrz+auPp0e0nfI8L1Y0s5IFBKzo7E5w==
Received: from DS7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::7) by
 CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Wed, 1 Oct 2025 06:48:18 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::f4) by DS7P220CA0005.outlook.office365.com
 (2603:10b6:8:1ca::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Wed,
 1 Oct 2025 06:48:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 1 Oct 2025 06:48:18 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 30 Sep
 2025 23:48:11 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 30 Sep 2025 23:48:10 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 23:48:06 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v9 1/4] i2c: tegra: Do not configure DMA if not supported
Date: Wed, 1 Oct 2025 12:17:56 +0530
Message-ID: <20251001064759.664630-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001064759.664630-1-kkartik@nvidia.com>
References: <20251001064759.664630-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 465a5d8c-4c32-4202-d059-08de00b680fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|82310400026|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7ejPirNeX1ZrWcbkvhKAogmrD3wnr6JMB5b/tDJj4Y1F9lD6pWx6+CZr6FRE?=
 =?us-ascii?Q?uobB2si+C1RN6LONoYc5RbO6P5378/LNfvIQh7gOriFhimD+LcJQSOUoO5Sw?=
 =?us-ascii?Q?YNHuoH3RR5HkR2yFLXlwgbCRczXHEhEPDPATtMh7Y0nFe7YHBWvC2ORbTADl?=
 =?us-ascii?Q?gWV122edKMlZ3fRJhZPWw0oefZf0YdBoyJpD/yt5FVPB+PA8i56lfHgThqKq?=
 =?us-ascii?Q?HWOUsObWviHpnA0C7/uh+u9T4vbYuESF3QP5Pmczpe35UMDdZk4+QAPzCfW3?=
 =?us-ascii?Q?QRbECUEeAUFlVcq5I8wVCIb8ehbu2706tMYHYtFn2jKsXBoEPPtfZxjpgiZJ?=
 =?us-ascii?Q?0P2C5l7Cnzt0TCLKDgw4fK3U7fnec7Avgkj+B5UEOs82dQoxSYs+0ak988kY?=
 =?us-ascii?Q?6UVvZP2H2sv0T77R//Dx9Py88KgYe5BIa73qVADFb1V67kqmld3eGnRbMZmW?=
 =?us-ascii?Q?i6t0TKxUlzsGLI8iKZaPb2o6spydRn9P3pW2hmQB2Zg942RZIVXPdRL4jyZQ?=
 =?us-ascii?Q?XK4ZcAvCIELtYlvgdNVUrp8fK4fS4JJaFDszEK9vWv+P9lOcXx03ZG/+AZw1?=
 =?us-ascii?Q?oAxllnW2nKHL/cECju3bs/hETiAfOO9kgnI6aGVT+KdvSIn2Buh5s/b3TXzk?=
 =?us-ascii?Q?qbK0SvqROeXNFsGVeEwxB8jcHmjbneJATwdKU8VQLq8gWY2MkKXBQxIHUi5S?=
 =?us-ascii?Q?TGFNyuujkv68DuXL5ZAT9QCm26xMlImciwCVwYsFHOs8tEnfmQtIwpQfx7sq?=
 =?us-ascii?Q?87uAAyh5/uujJbNoi72x42j1jvE4jerBIdf88jZ22Y0hG2gbMWhaCycHy49j?=
 =?us-ascii?Q?wdeisG1AVLHHyX095VGFLhijrMkTqsiZtep1N7q7JLyRu7KhA29a1nsOZqfM?=
 =?us-ascii?Q?My5xeTpbRjqs0RMYVhgxMi2WXO86j9nqb+bpGev/Bk2fk1JfRy8aaYhzNkpZ?=
 =?us-ascii?Q?soHQoEXqywBNNpBUFZx7LEiSGJNJKRwjmw6F4h60NBM0M1iEM96PukOVBG8o?=
 =?us-ascii?Q?pfmB805K0TZmTe7yXL4jhMGba39Xnyhzl9zzvbpaCHzhndj6qAu/S8kjPSl/?=
 =?us-ascii?Q?UxjW9Jn1G5VVgCHN72uwzcBXXJkdfmQILwhx/mC+xIFJDTAHNFYiLV3ww+T1?=
 =?us-ascii?Q?f3wMvOPo8DuMfEnBAUECa2lAGlKEqEWgNVfsIWaRQ+P9WMaaK0JEvfT5NOFv?=
 =?us-ascii?Q?HWEAzg0Tnh47YHTUCdYfcXlGLPchkVTtRtDIca7f4Jp5DLi6nsF5IoMD/O/l?=
 =?us-ascii?Q?ygxRI3qKWqzQlFmbaYuMbkDtueR3rrOKTjefk5skzo7nD9mfZzgwL0UjpJ5l?=
 =?us-ascii?Q?9mc0Nw0CyIQjNpI2faup7o3uKsbg5JzAO9Q5K+g6zHZMK96r7aVyQN1PVucV?=
 =?us-ascii?Q?cAGKA7xh2qiMoGaRrrz5ZbIT/iLCQFNX/RWWJ+x/w9gHZoycKCwnmMknZmq7?=
 =?us-ascii?Q?TBAEyRAHfEx2ZkST7FPV+4dOXVu2JGE2Y1/d6SFyeN2zvV8vK3hpKJ6Q4F16?=
 =?us-ascii?Q?IKRIhx1K6mequNNTuJHySN+bczxOHaaCfxbHtiMG3+gEx2Yf67HX9j/Akvuy?=
 =?us-ascii?Q?IjK8qpG6k+QZCQEw2Dg54fi87suoSh+5dGeGhI7H?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:48:18.0442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 465a5d8c-4c32-4202-d059-08de00b680fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v4 -> v9: Moved the condition down to have all dma checks together.
v2 -> v4:
        * Add debug print if DMA is not supported by the I2C controller.
v1 -> v2:
        * Update commit message to clarify that some I2C controllers may
          not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e533460bccc3..aa7c0d8c0941 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		return 0;
 
+	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
+		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
+		return 0;
+	}
+
 	if (i2c_dev->hw->has_apb_dma) {
 		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
 			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
-- 
2.50.1


