Return-Path: <linux-i2c+bounces-11898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A902AB00323
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 15:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27BC5C221E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 13:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CC72E5B3E;
	Thu, 10 Jul 2025 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mh09fGJ+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FE2E54AD;
	Thu, 10 Jul 2025 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153216; cv=fail; b=sOwNyiJ19srWoeOTgtOfRPJPhdvxj8evrTFFpfkPqpgMEfdp8sUlp09e2y4Y0TcslLlXuHtQfFC4pL5TPO+hS4PTTa7w5cqylYkSN/Hnm3V90qwrb9sST3nNvvjN6+mxGDLHaC+rp8PHR2yHDx/wgnireBz/rXwbCyqdWUDRGM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153216; c=relaxed/simple;
	bh=Qn2Kbkpq059iK01ekUvnwNHG4oybGMd+1w4cjTsUjlM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9Wz2qtdEtTpx2psOx8UFSiNh5X2167d5QRJkucPUUDEXDgcV88Rglf2e5lQUDi2gWtJ3lpzsjiGKcJT7fZR93Zo60PQjpy29PeIg/6CTOVIUrcAAlJoxaml130c4c2l3c541TzgyjK3QxFTQMpWBZ2FUERsmHocJ5B3zXpycRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mh09fGJ+; arc=fail smtp.client-ip=40.107.92.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5w0w9VGctgovPwUkaOlxeLI6Zl7FYC4ggNyQ02UrqQd7Mpr3pLeOP/6sG/LlaYEhGDZOU/Egx/krkTrWERdkdex2FrrJpiPBBGWpyYPpG2WqSo7GcyVVTVEqGQsDRysnPgPMOXPgP3m8sQW8vt8QTkRAlLW6ZbDGb0/8elvygx6wZjltQ1C+qH+qIxoI5QqkxayCNK2GeXUuk8rY/npxd3GdtB1UiTLCWqx/+3uj82UyjA28bejUcF+2A+7r+3o62/XGHi8NSCEjvSePO22A4iiCRzEn2/TeIyLiJQ9IS9ENHDTcOYIPhnJ064jJdPRvfmIM9zLEYQiMBZGw32DoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6y6HkuvpQuQx668VcNgPmOcBAWdGV/Q+XLCLSgRnsg=;
 b=pYXM0GZWhLpHle2W7OkEdE0Tr/W6VsgrJBeuGkmf1mqaCB3SVxpBe8oNbn7n08rYTB5nVbzvqHTNxzdc4mU5frjFLVwDX9B57U5y8Emwv4rLwCywmL9ePiWj7QvQeHI9KFtYVHjukv7dhfhp1VgY3FEpCnVO+Vf444gvbG3WLPmpyVSZR4ceoP6bjcoGktNqWdrXjUn2bpwFi/G7UVivF4lGFgaBHZ3gQlQ8VFMKYkttH4xzTUCJW8N21e++z24JGqouYUHl+UDpx+rSVE5evHuaxE0omDXA7oSwrJu7aQnLAq4UYQLvCBlrjeGx07WjLcSEBYedyPtKfYb5LvZPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6y6HkuvpQuQx668VcNgPmOcBAWdGV/Q+XLCLSgRnsg=;
 b=mh09fGJ+KYDTFYtlsN1QmANagi7XITu8oG+k2GfHOaWQW1c8FL6bYXpyC2GDaqrx7gdQzwg6rUZ0MQmrsvkG3STPY60M9YigJfPsy3ESZShq+cIuDJGRTbrJw1a5ti0uF7W9DVQcUFeRkFPj1vNpuuWs/k8EHI69ncIhUzBjXeKP7wBeOO/lmHolR6jRxDrgJbiMnVQh9uWdXSfDPKGxvb902SFTa4flewV2fuaVF7G1I7zuLsrv01BM7oRh0WWRZ0BqUiuG0UVqcXjByvIe3ERxYgau9njI/GDCux0MjvOSAVHng4sgNxey7W6cyyG8twBjT/x3wOHujaudhEmygQ==
Received: from SJ0PR13CA0222.namprd13.prod.outlook.com (2603:10b6:a03:2c1::17)
 by PH7PR12MB5880.namprd12.prod.outlook.com (2603:10b6:510:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 10 Jul
 2025 13:13:29 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::1) by SJ0PR13CA0222.outlook.office365.com
 (2603:10b6:a03:2c1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Thu,
 10 Jul 2025 13:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 13:13:29 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 10 Jul
 2025 06:13:14 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 10 Jul
 2025 06:13:14 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 10 Jul 2025 06:13:09 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>, <andi.shyti@kernel.org>,
	<digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH v6 3/3] i2c: tegra: Remove dma_sync_*() calls
Date: Thu, 10 Jul 2025 18:42:06 +0530
Message-ID: <20250710131206.2316-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710131206.2316-1-akhilrajeev@nvidia.com>
References: <20250710131206.2316-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|PH7PR12MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa7bf31-432e-4a70-0ed9-08ddbfb3902c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PSDKRO5jThFSZSkHNLxulR+3bT9xTs5UFq0JTXaHRJs/cQOEJ+7ty3GEO1+O?=
 =?us-ascii?Q?CR2S1HXmi5O/ZFmcd/9xjVTilOSPJ4AouTPsMRLH8SSb8PPwdF7SBWO1R3i1?=
 =?us-ascii?Q?C2D0I7db94AZ+h9xXkbana6vMJNuoyTm7DDNtkTDk69mSjW+//SKfZRv0zFs?=
 =?us-ascii?Q?/V3qdf4yGNJTEEnYth2qU0tcTyhZlKJWpaoggEl7wRJZOqWj8yM027urwtfi?=
 =?us-ascii?Q?krv8s9SaR5b74dTWqMjOB+hWHdzpz46Kcf6UfdyS1MsunMT4x+6K5ymXSt8v?=
 =?us-ascii?Q?xzq7A8hsNurFhHG9MfyysHNp1j0+QVE5+fgXiaXIf/6QSpAX0sJSeutj6xOC?=
 =?us-ascii?Q?ANUi+DIIpbYyF7Tw/aL9VJyc/p5VPwWjds/JwA6uchJR0U3GmtK3Nqi7xLDt?=
 =?us-ascii?Q?c5C7peDriohIp/OsCcGBCn2wh2YrUUDSt6KbfffQLXxBe5PvIkEFAjA0SrcG?=
 =?us-ascii?Q?U8ywhVkpQhNHrTHY0Djmjv743kl7bcbPYmVPJ+vgcWDO4lARzVsPvYnL9kN+?=
 =?us-ascii?Q?qDI55uvzS7uV+u13kMuxomE6CwnrQl+OIR1WLu9p748fbpNVTNo/+/DEwZHw?=
 =?us-ascii?Q?Hidp8wjRMwGnzt3rsxgC+ktrcOa5X5s1qQQ8h0APrPgVQTl8FbsD7XwAXWb7?=
 =?us-ascii?Q?SHAYFuQRsyK51t8+7K8IzoyNuVr0nAemB2qWAVMRKsJDfr5eHrleSwUHyV/f?=
 =?us-ascii?Q?H+k5D73QIEtavXfqQqcNnATXyLq//pZ6iuVAReBHkbbCB+UzeU46e6VlAYaZ?=
 =?us-ascii?Q?BXmxyzxamcIbeVdZO4VHH3IPLxtSW2kaDKT5H23dPwPdMr1ljsBozsyAtTSW?=
 =?us-ascii?Q?t9B1ZKF/glmv/APtY2lpp36HXXqxwk2YgUGZke5PFjcI9VFsFKlmVISpG5SF?=
 =?us-ascii?Q?TqEQSNwoevwyHbu7y1Esu+i09XDqijesggOd361AcrlIu8+oNh6iY2ozdf+Q?=
 =?us-ascii?Q?zhLN2Uoi6BuOS5tpbO4LeuVbePciJ6kSew67rKrf5kcsHEXw63kMKDMVG59J?=
 =?us-ascii?Q?DHEFfcHOHoeRWBGwLzsFskqoKpSJjfGlkbi8jhegjGlJ4ZJ66SUthsLL553C?=
 =?us-ascii?Q?Uubk1F5Pryglua54xrrRbDIJPKgbYINcQ71sgTPbU1va3jUtc7ST5BJZ37/F?=
 =?us-ascii?Q?tc1DYDzacf5SUHqWzZ+jiMilDNVzQQVOC8uJvmuFDOppYPeTuj3IjTRv13UC?=
 =?us-ascii?Q?X8vwBTkiKo6GEZHIRVUub56nUIeoftqtcdZOfcIPmF34GCMQiwUJ7/q4nsya?=
 =?us-ascii?Q?s59DMg2SZoObv5wKou4OvyECgUvxx5wxVOmakSbYjx9eo3JU4e64+lG61gyM?=
 =?us-ascii?Q?YAv6Ce3zxoFEfHYMcApK01UfV3/fJvaQMrIpQwoEB+X/bsmZj56SCAXb9elW?=
 =?us-ascii?Q?3Zk3OtBEJjT1XPCnxQwhE2WwnE2ulAGmtGUfNPbHtHfb7Vnf6gGKkMmnn3w+?=
 =?us-ascii?Q?eELGaJ9u2X1hmfkOxtL2a6Kkj3F9sGWmZbcpd8akuPYacPQ27v3qfsaF6xVh?=
 =?us-ascii?Q?kDAgb017X7VALKhoHhJVA8np1Mo9KzYRSvS+4ji62NY71ZdSEOpuHkiKYQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:13:29.4016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa7bf31-432e-4a70-0ed9-08ddbfb3902c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5880

Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
The driver should not be doing its own bounce-buffering if the buffer is
allocated through dma_alloc_coherent().

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-tegra.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e291b8586214..04a9610c0736 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1293,17 +1293,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read) {
-			dma_sync_single_for_device(i2c_dev->dma_dev,
-						   i2c_dev->dma_phys,
-						   xfer_size, DMA_FROM_DEVICE);
-
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err)
 				return err;
-		} else {
-			dma_sync_single_for_cpu(i2c_dev->dma_dev,
-						i2c_dev->dma_phys,
-						xfer_size, DMA_TO_DEVICE);
 		}
 	}
 
@@ -1313,11 +1305,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
 			       msg->buf, i2c_dev->msg_len);
-
-			dma_sync_single_for_device(i2c_dev->dma_dev,
-						   i2c_dev->dma_phys,
-						   xfer_size, DMA_TO_DEVICE);
-
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err)
 				return err;
@@ -1358,13 +1345,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			return -ETIMEDOUT;
 		}
 
-		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE) {
-			dma_sync_single_for_cpu(i2c_dev->dma_dev,
-						i2c_dev->dma_phys,
-						xfer_size, DMA_FROM_DEVICE);
-
+		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE)
 			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, i2c_dev->msg_len);
-		}
 	}
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
-- 
2.50.1


