Return-Path: <linux-i2c+bounces-11205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B6ACCA33
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 17:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32A863A3578
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 15:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08B223BD1A;
	Tue,  3 Jun 2025 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZHjDzU2Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B175165F16;
	Tue,  3 Jun 2025 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964682; cv=fail; b=I00zHPE/pzmSCVK/yUyjKTmaqbSoxM9O32fihy8tPyDVAnxMNEggY0Lxse4ZzO8m8teyKLu30K6WtQLMmsbf128f4HvGeXT3iOUq94T4cJTWXPvhMnSin9A0f37DBlNOoJMjo/PmcTXOspyVfJGB7OOh8GSE4pGFcne3fJDM2+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964682; c=relaxed/simple;
	bh=wKqmMacMJeOEROQIU3sSBwKJwZl11B3qwdM3L0F1yOg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6rHpFeaA6Em39tT8/mkoKJg4ejVrqthiU0ZkoH/pTjaKLPAbxHQ0JYSj+KCYOxsYbZF0P2xzyZKy4SecVPvcnTfh78GUXDM/TSx8u5DyCvk8MoRz/etpRZFbBZwTtPLDt6JGHn5HFxK6wYwdTuDPIyBh6ZZAD8OI5RL941f37E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZHjDzU2Z; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaQLNHjrbBdNltB6pRHsPRGtcpPD785Xhm9mKWyRGD3zQUfT5eYFRtPGY5ICuG9FfVt0yFrx48SJLyyCVT1djbL7ZASPwaSPv0R2C5pjjHYoqPObRfsws+85Itu5lk8NO2gPgMj1Zd2GSBFu2PGt4G8iLY/1B0eb9SbnAxspOj3NCUovMke7pCmX7950KH52gVNexcrailZ4niiBViWHrJMi3ADPqvvIKMpTl5iVO6TM8fTSeUVeLpukNOD6yn6sfdScSnH4p3tOSFtna7fDSOkzMrOwv093drjpexXXTDG5Avw25CcsV5kEcwUfaLHHoMwHWBEq9aYiv1rRPjEoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXf9Ao7D4h3bFw1x5vUWrulMWBWB44HpMpSqdaqtzOw=;
 b=SQovBmwGOzqB3UgkIPkHgQ9SwrddaywbMZ/lXARM0d9VOOkX/EdIFebxZDHtDrqBIUotTefPpQxHSIZoHgFOPUc/o1j9FwZ0XYJyu442eKwePsabQC+hgDQs3wKJpHWFkHYs9ojfwelIQuomf6zlbIkU1neE9Fq9/UzjwgHDxYm3ZrldHpqrXUM6AeVGDVJ4uNPu/AU1oIuZQ9upFCH5NMuA+BiToCON+c13AOdb+QUsXkxZKq/x1860KICEmKTA7WQvRsRyzOqLxNwG4a/7D0Hc3C7XMkFRS21VZnz3U37f26s0bert4mhzG2fBMnPFOAhxRvcYsIXK5M+rBHxJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXf9Ao7D4h3bFw1x5vUWrulMWBWB44HpMpSqdaqtzOw=;
 b=ZHjDzU2ZdxTw32dL9oMbPg8RCLN65wGJZt14t7o+eyPbjrRgpsqb3E48LF0xuOwEy/MtBh6i7ZWyItdvP8/tQewA0BgRw/TzKzv7jbxJ5ewhZ2Cd4Qs55irZhtrqdXF9E+JNoF/41685TPXc2ZF+0IMZPsu/4APCILot79933bnXRr0hofBpastjC26dcHxsNmGdaAjeOlW0vt9BMIhwBxuW2IuirlM1k++wrcOto9gFswaSK1gswfnqjcqdmNXO+ZqOQ5rFKLUJyjq0DJyMOnMEtyXm+vq5paXu0wwiKeUZ5+/xyKFAMvpUZ6ZYdsCiJpzp8aqfGi7Iz4/rZFtFIw==
Received: from CH0PR03CA0318.namprd03.prod.outlook.com (2603:10b6:610:118::26)
 by CH3PR12MB7764.namprd12.prod.outlook.com (2603:10b6:610:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 15:31:16 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::b7) by CH0PR03CA0318.outlook.office365.com
 (2603:10b6:610:118::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 15:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 15:31:16 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Jun 2025
 08:30:59 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 3 Jun 2025 08:30:58 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 3 Jun 2025 08:30:54 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 3/3] i2c: tegra: Remove dma_sync_*() calls
Date: Tue, 3 Jun 2025 21:00:22 +0530
Message-ID: <20250603153022.39434-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603153022.39434-1-akhilrajeev@nvidia.com>
References: <20250603153022.39434-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|CH3PR12MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db87b90-510c-41a1-4248-08dda2b3ae33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pozaa0MDUJjq8YPLGdkrxlY8mSAlNenGDy6QF+pHCcWNR6vJHEpMdhOQICdA?=
 =?us-ascii?Q?1vKfCySJc+ZqnodeRn5iScciSbzuaWaxiRw4o91Ux773auv+h+yk3t+VMkFN?=
 =?us-ascii?Q?iUy5hS/xSUaJMccr64JaWmNtAXWMpJb5yk2pJen0uvt3phd20tuCJaUqHX3t?=
 =?us-ascii?Q?psZZORdzfskqe53DM/D3j7TwBwME5tKBqoW/gV+HpB9II6yznog/Sldoh73m?=
 =?us-ascii?Q?1kFTZ3sR3cYN/5BcqltyXMkLBRjEoO1F79+KGlGDG0vFO2Va9rKfpMtfZ/us?=
 =?us-ascii?Q?HxJoyjBeEznbrcWn01wISAr7GBw2u/YBtu4ibA58GZT5SS7huZDxoICn4j+6?=
 =?us-ascii?Q?jWObM5Z0O8e0FnOcB1HHqZ5HDfsp4HqRhoNOlCHmGiUXbJjloGangFCrNTar?=
 =?us-ascii?Q?X67G6u2hiZlWTZF1OrLHdc7szim8tvtGSy9q7meKl32TZH8rLS4PNQdUpJ/C?=
 =?us-ascii?Q?gwKdXLE4/u2wgkBgYL8l+CNSuOHaboXndX8E+ZgQ/MGknJMnldPTz5VsCH6F?=
 =?us-ascii?Q?1uEP01QM29l/Ejw93jnclByHPfj3HSkDGQT55zeKAz2/1B9kerDFDKPbDNg8?=
 =?us-ascii?Q?DZrfpNZIcRhDdCvwFT2cnaiA5BkThcxIcvE/zytkh75nv1GitCwX25QxL7CD?=
 =?us-ascii?Q?EaCRBL7Z9ZhuHI/j+qy7BMNq97eIHZpp2pl0w8KxTfta231ffgj3AaAmB5zB?=
 =?us-ascii?Q?EjJDzoverRkR64NVENAhHmvpCQl7LlDMbHky7KwqhMrqvMvwbSrBXSo6gWvt?=
 =?us-ascii?Q?CNj9ex/8TC2AKmkwBaKVEh/P3H+OKIXGmBKGiFB4WvvLHuR0sb75fVQ+O4XD?=
 =?us-ascii?Q?dPGsOHJJUwV8RrxQk6HMIgPvipN3Szro6OpWzsjhXl9s++ZhWJ2VCoLx8ik6?=
 =?us-ascii?Q?PslkbIcqEn6sSq9akxL1wVtMfCfmti5y7Y9aC8uT5lynClFFWekHgrrhRA4S?=
 =?us-ascii?Q?9GcPoUI/meY2XrbYgWI5uJ5Zq8sLRjLqcaY+p9BaxTXYA9cn03oYq675xscR?=
 =?us-ascii?Q?pXj5bq1Jw9LmsKd2DFgrIzCUiinrzcm49lQGOoIhbInwrlqdIcdxXazJfqvW?=
 =?us-ascii?Q?bcFTV92ck4MbPX1fuEK9oR6GBtjxRkaJkMWbJJsgCLi3XvQQV9CnU7qV7OZ9?=
 =?us-ascii?Q?ic+YgKX00YQ1UW7fva9rBt8BFdn7G9Okwy5KFEVfBiur0WxtrnG+Dh0wMRqc?=
 =?us-ascii?Q?iCuFLRSQj5s3x38HK9gsdU9435Q7fkJIVePGx0PCcnL3eouf4KHgfPkthHpJ?=
 =?us-ascii?Q?p5inl7Yx5g450IEpGhnG91rTvZTd6EhdR99F4Wm8ebKu8Ox33T79Foq+jFJu?=
 =?us-ascii?Q?AM9UI6mi8wwrT+Pv8Q8kxWX24lF9BLrxc8Ri/yXUcVzQawOIyrof1pYDuaNx?=
 =?us-ascii?Q?AJyWKi/bkM3P3+LZ3i8U8nXp/Izn4cH0808woYzcBJMi0HdH2Htc54kIhhOm?=
 =?us-ascii?Q?VMWqAwcIBJPidU0kHS7JQLUGWPVoiKL0J5nayd7s3EaBDEHqzyo4TNuV7iOr?=
 =?us-ascii?Q?MeBPp73TdNKoIgFdhS0ZEIvJQIkpu/zG7lfvaMeRdAwzfOECXgvSV/EmPQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:31:16.0456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db87b90-510c-41a1-4248-08dda2b3ae33
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7764

Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
The driver should not be doing its own bounce-buffering if the buffer is
allocated through dma_alloc_coherent()

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v3->v4: No change
v2->v3: No change
v1->v2: No change

 drivers/i2c/busses/i2c-tegra.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 22ddbae9d847..b10a4bc9cb34 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1292,17 +1292,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
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
 
@@ -1312,11 +1304,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1357,13 +1344,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
2.49.0


