Return-Path: <linux-i2c+bounces-11002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE2CAB9C81
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 14:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72ED93A857A
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 12:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B73224166D;
	Fri, 16 May 2025 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OPkJ+B2s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8180423E354;
	Fri, 16 May 2025 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399496; cv=fail; b=FjaY1/BBLywLmcsqfj75WG28fq/rggjVt6uihVtFTOl53m7Jx7oXL+A2asBNsvz5jeVK1hR1xb+vtfV87n1q1jELKcyGAO98KhjS/l/T0y3duNGxVc/uesFx7UccegpdSpOfIxFZ1tJ2Cw7yx5wtrF+gqLcqj1pD24NYv2KK3rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399496; c=relaxed/simple;
	bh=Wl8ddtkaiF3TZwrGGltnWpCq2jkRIYXweolHlEMReFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJdapsKM9Ttrn4dCnrX1axM9qMVDwiqEN9qNkSWQk9crxn+D27IN8kOlLI+cFaF8s2QydsbVimiYNjt6LJuevWR57u/N2k8fz9dmPk5hQIY68dX9MC6x62ujsEL6oPh/Wjt6WnWkbfEmZRgB/WIS6it9l/iJubP/QC0HYJZuioU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OPkJ+B2s; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YptOymmU1+EVO9FJ238ib00GoBj0/Cfz1xxE9JkaNqp3MDfAcEkIcd4A/mowF4Nc8tRh3Ay9bEvyaiG4E2VgOFfx66GJqCqU9OKbAg/Jw86SEYDmEit9WyzI4Fh1NzJT3EApdeVW9VDFfQIRDky46Jj+IOeGSL65qODDsU+r/oRT6gkGGNKc61781tiUXt3QzWyexpAMFvEtqVqeFout2eQFpPC2wxi5VFZUVgyBD8mQPeVR4BnlzqX/GQbN0o1vvJt575UWuQdWk5Fh7UBcBX0lu6pYX4Z9KuYI/+LZTGf+K38we/BlFCQ8AP7g5F9AIcYnGvuTdq+nv9hA50jGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eC2TfgCWMqZ0Xa/+HnfL5fHJIKJJYTu9zn4awYIqKcQ=;
 b=eWTwxB4MSQSDcW1QyMMLX0wiWVdg7Wxpy9Zi2daRVDXvxEGbgCSI1N17kV90xnUE4N4/TsJBviyIc5WyVG5uMcmWmiTm55CWzkVFgELgjcGgsSVx7QIMmcBfkYgDcrVleqfQuBg9IRwqUOJZQXaVxcVs/kzjRbIb1TR41M7XiAAfIsdaVNqAOo8R5Nz2WlNE+UXhUU+2zulf31z3OfvndNTGA9HpPVmxcQ9VGzH0t3yxfH3yo5Uozjo636BkQEesdCuTJFMzDHUsM/8citKe9D3xMv9iQnxDY3SsXn3vLqkk36itiZ3eiGiFUYaM0ONKbycuOaVmQeXBQr09hGvTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC2TfgCWMqZ0Xa/+HnfL5fHJIKJJYTu9zn4awYIqKcQ=;
 b=OPkJ+B2s55u7UPOU7G4qwLbI+WtDnr0Yi1OhHaFFgoZHya0Vl2woBYwX7/tIezMp7LT9QCjdNRFmMf8lydFWWYLdds1EFrJX0Ps9h/jt0Af1hSGHlW2moONAJbcOzNocD8xiix8e6Z4wd+HfFV6r3tIE4BL6m5Jjdv1RgA9JHUAYCda3qefcaMINST16Aukx7GpSHhNseLo2OyP8t+vRfUJEE8vHCQz+JucrTmxGkWmcCjjmRVpTWCB36nULYu+9fLmdsjpN//mTx09nUEbJc682kKCT3Gwb1sZmmX/m9z+AmYtgyS+uHhsdinfX4pIk21T1WiD0v6wgIFLSRICX1Q==
Received: from CH5PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:1f1::16)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 12:44:49 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::16) by CH5PR03CA0014.outlook.office365.com
 (2603:10b6:610:1f1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 12:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 16 May 2025 12:44:48 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 05:44:36 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 16 May
 2025 05:44:36 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 16 May 2025 05:44:32 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<onor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 3/3] i2c: tegra: Remove dma_sync_*() calls
Date: Fri, 16 May 2025 18:13:49 +0530
Message-ID: <20250516124349.58318-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250516124349.58318-1-akhilrajeev@nvidia.com>
References: <20250516124349.58318-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 45107a37-b72c-42e5-ba91-08dd947771d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tzGaO8MoJONFL89xS0iezLLGfx0r+sbDTQ4LxVAYXLmCv0q8oB6DPaIUizod?=
 =?us-ascii?Q?5ekUM1G4FuWGEuv8qkLv8Lcw7JmrITi1+ViLFm1numhQKHkL/C3DAFVPHLgY?=
 =?us-ascii?Q?DXdTDRM3J/Sf+hbdbZcditN4rsoDcBOQuO9jBuv+3OqHknYzW4kf1cJDrBux?=
 =?us-ascii?Q?SHmbc3xv6L1E6eaSf2BsepEinmR214QmR59XcminiR2k07IwkV02agOx5bFc?=
 =?us-ascii?Q?Ha5JnkzvIN+xyfjeDRQFjKpIxH7uBLufhcaWKd3vcUPlxYJHSPFZtDoFRX+o?=
 =?us-ascii?Q?kmL7CJVqdHiguIDcryN8Zplbxldju6SxQQWYtSjsLjqoH1IqzBg8LuYC9KFT?=
 =?us-ascii?Q?d9EYfSQ/buT0N1Nfeifpc0ftn8W6PccglYi1IVpOoe8ACvacViYgMX5kc3ro?=
 =?us-ascii?Q?FZxeiFJa9OD3Plkvq/5FdrmeKQjrzANeMTsBlSP1Q7AFr5A6vUDLIIUquhSe?=
 =?us-ascii?Q?JEwgmYmh8zuMS5Iicw9qsZAkVbDTPasH5zbvuz5hlvEUI1i4Py8XXw2eYLYm?=
 =?us-ascii?Q?+tRPv6cRkPk8hXk4zkbboR9L7TY9qX/Nzz/KqKvF01UqfbZQqIqILHLkLgq1?=
 =?us-ascii?Q?fL7L3GuRDM/zTl0U8F9VmbwzCB+5bkYZQmiw2Qnkt+G3w5N36puzJQcrNlLQ?=
 =?us-ascii?Q?LLVewTpXULmJz5aLjAPZwu2P9gtK5qHgv2+Su/UhvVih11wi6nF9V6n19Cdg?=
 =?us-ascii?Q?vvmOBbpbZBRcgcrmvY48h/csnptvH/l271VdpFpBzWGzOeh3h2KpXSoFQ+Qp?=
 =?us-ascii?Q?C+4gBQaduKKuFkW/uso4bI85cYnWlE8IXr9CmF67B0ZQ3nD5hD9DyG1uMX4u?=
 =?us-ascii?Q?PO+SypBp95SCmBL3XI8f2JSdkDxiY6zbiZvc9a60jcS27ZzCczOsbc9CjZeT?=
 =?us-ascii?Q?mgVDIlveyuUoRyfB8Hzh7yZAyLVubl1fyQdvrW7CIHrX6BR2c2/utgVTKmM3?=
 =?us-ascii?Q?kwDwDDEx5I9sJAFKFk9VQJHGdLuICBYnuI9CrpIHmy4C0FzwDLSb3zt6tcUL?=
 =?us-ascii?Q?UZpepwle3jD6ORzoIy5W//R18JLY8JYzhQi1VuswBp8tcKJhk7KfImtO2n3d?=
 =?us-ascii?Q?xiErl+tRxHcoL7GZCNAF03afyx+MLGatuxZWFmkQ/lHCxHBS3SZzeqbiOH7D?=
 =?us-ascii?Q?3V3sn7Xqi+kqCSuyobO3deJODdIZnuTJboED4NGvL+4KLh6kh79F2n+6Fulg?=
 =?us-ascii?Q?wbVpQ1x4N+tKQK5y77ornCYCX6C28IBUlpCsfpcy1tpYivgZPGphXUs5DSrG?=
 =?us-ascii?Q?E8q84VrDNZheSraUAu7jL37V9ZbbXB7uiMDZfvmWctBvX91dpO57KEmlk9Pq?=
 =?us-ascii?Q?kLFmu2jX093DgYBoUEJmTRfqifHgSJ1DA/eZYHSN7m2do/YuHKlYsvWlfNo1?=
 =?us-ascii?Q?a2P9vv1csC0VE6HasKSZcIyuZqOTmZipdf/r3lMtX3o2jwtthPbpNYwFFnsk?=
 =?us-ascii?Q?kBONWpOdRP8HqarIMph4vzS+gy1sv09vFQooGmYa3PtLt8TjBHZEfBhh8RKJ?=
 =?us-ascii?Q?/mYQzbVI6wRFOQbZrcGR6l+7mzUm9k4so2nmsgSePolweMA4eO6zSU/M2Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:44:48.7410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45107a37-b72c-42e5-ba91-08dd947771d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091

Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
The driver should not be doing its own bounce-buffering if the buffer is
allocated through dma_alloc_coherent()

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v1->v2: No changes

Related thread - https://lore.kernel.org/all/acdbf49c-1a73-a0b9-a10d-42d544be3117@arm.com/

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
2.43.2


