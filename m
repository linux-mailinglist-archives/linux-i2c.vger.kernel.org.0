Return-Path: <linux-i2c+bounces-8965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 239F1A0592F
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 12:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A5D1887724
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 11:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFAA1F9418;
	Wed,  8 Jan 2025 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mKuwvJh2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962621F892F;
	Wed,  8 Jan 2025 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334421; cv=fail; b=dDkyMDxxfubUdDfwp69PZ4ibjEkdTrk/9rSyzLz329LlwyuiJLRXr43LgzvN4buSfkmgf9Mqvi8BsZV5ca75TYYYlr/wygk/KVs65BEBHi/Z2bQhT+QrKmHIXKl9SPReQTwqoyauSFCsMr6UBCpFbKgnDqIIDBfhoauuBsiSYfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334421; c=relaxed/simple;
	bh=Ob61tQEgnodv4jim7ASqJlPDOq8BTbhGtY+q0jRfMvU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ciKxl3imQUcpkrUB52htiGLnbJyVuOt0UCT6OHhxcyOEAdakoS3rxrO3fD1j8ZzBXhfESG0CSkthZKPkbYu1ecWtP9usDMjTIcSqCYBB+j6f+eBeIGHwyhga6y2L1nbM3TktD9cbXw4SZfFlvcWh11vp27V7wcirXZDtkRx12U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mKuwvJh2; arc=fail smtp.client-ip=40.107.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUPZ6S/EtV39lEKIueM9Jbh8FZyT88jVmp+WQYl2KpXmZEoM/YuKPTQMbTvPj4lJRAXjnHoF8AyyWeGvT2NJtB2JZRMDe8JbZmfjheyxlJmIBcINdkvEAYILu48DaLKP1HK5W8+ofzteWkR98XMOHapOuiw0FfoGoz8X5nKZjc2y8MOCLKUh91F7iNPO3uSbFptRyEgirGKl6K3NvwhnCqC9NZKgvStPnUKWzyhEqVf6MDpz0f6jDnc/nUCklTJtZ6Ho5vqxrECuD/rwwQtROxzfBJK4O6SkkzC3dD93nXY0yF+tq94bqLVLfiD5w6vWXLZWYesuDkY7TeCGipLIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywO8N9n+e0imsQzgla0liGJyQM3BUhglmjqwd2s+MXo=;
 b=BH7p6q4FCq2Tm6yC5JLYQFgJV9bzeEMhPGr9eP1w5k3dU6/3dfkMcyHHBsbyRdreiO2YsOPa1SD4C2d8RZ5+VfFsJkeihgRN4LmeffvUCtYoMKaW8AN6ZpzI99qcXuiIHCxEFPKZx+ZFo9J7ToB7+69i4BogNRkw3MIcVBTBwd+qzwB5ZJvL1PNOW+wJ1o+eVXYZriUe5PAsT48emKQ05qAoUbGmoMNkiGSM5wHaYQ/eEtnxClVmooZRwtio9YGz+5IcpdXiBVSHEUHE6wk1VMc6Bi8dwdL9ixdQGeZxvE+XVWJ3zV+TC73D3nCk4W/hGQVO1md4FNVfXJPV/pFhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywO8N9n+e0imsQzgla0liGJyQM3BUhglmjqwd2s+MXo=;
 b=mKuwvJh2u30A3Tk2i3OK6blQ0aRb3s6q94mlmwqPf3CUbgj8WChPuPrxw3aIp4RFGvccYSAGJgLzvizQ95xPxvDY+NkblahiW2Haq3juv7IusoLjfVY1nag6tB3Fi1UiSEuh/u/r0CCVtQ91QflU6JZ8QRoo/HxP8x8hTgzbH3qXnolVIu6Ot9g7Xe659CcEXzfIlxXAak3YV7qYeGZLjyGO+yTfp6GM9nhDzRDwxDxh5SBVFtxJLu5dPxhCQfRH15K+GoAAOLGz88Ra9NnlcHaZtP1xCq9hu0vQxUiiMQ/GAbXFO8/6WTeCgW06phH9GfK/dtetkQ1e5o0N/Kf5lQ==
Received: from CH3P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::27)
 by SN7PR12MB8602.namprd12.prod.outlook.com (2603:10b6:806:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 11:06:55 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::cd) by CH3P221CA0026.outlook.office365.com
 (2603:10b6:610:1e7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Wed,
 8 Jan 2025 11:06:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 11:06:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 03:06:49 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 8 Jan 2025 03:06:49 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 Jan 2025 03:06:45 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] i2c: tegra: Do not configure DMA if not supported
Date: Wed, 8 Jan 2025 16:36:20 +0530
Message-ID: <20250108110620.86900-6-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108110620.86900-1-kkartik@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SN7PR12MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: dab58ac4-73ca-40a8-c7b4-08dd2fd49059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fdGsDtbQGwvdZroC+cubv4ye7CcXI7u2Nv1MJ2IAz1p/bAB9l3QYHVXYXQz2?=
 =?us-ascii?Q?FPkgYk5ua90hmorSahD0RNvHEqTOQEia8R6qPtbD61dNI4kmkXpwtebrLAcv?=
 =?us-ascii?Q?6ZBF1hGVxqzQAOnLOohp9kGXDJfQvmAD3y7PD0qPJBDp2vdCZ0X+8QdAIsR9?=
 =?us-ascii?Q?HnPi+qdOa1r4ngyl5QKCJKljmLtc/k3+PNQ1rd66il1uCo8wGrSfGXJ0nbcr?=
 =?us-ascii?Q?Y+07LORHtMnrzrOgZTcTEAzeFH2F81GBuAe5t9QgyUmjglDLUcoULH8FT923?=
 =?us-ascii?Q?Bi7rHZ9AwYIIpqLWY4l1eMqgMyxBLix3VnjW6YLSquEPkASggCxvHTmDL5Q1?=
 =?us-ascii?Q?dZD8b2YwoqjE8wpVg+9RrTgHwABynVVF1P5t16/pZB52M1yvXj8FQzOcp3tY?=
 =?us-ascii?Q?FVq70yVEFSyimVE08yYg2k/Ub844bnp2AouiM06u74yf8c9pxZ1XLSR3dCkk?=
 =?us-ascii?Q?WcAXlDiZi/a8T4/nxAUaAqsLpc+4AGbF8WqvIJKdXuftrvCAM0LZ6/qLN2B3?=
 =?us-ascii?Q?xd7+m3jxkEPU71v954HnRfeJVG6Kpsknb2Ibno76X/PB7QrIqrechlbZGruZ?=
 =?us-ascii?Q?MjTvNDiFlOOF1fkIafBbihs0+2YzPvgHfqoV3bgEwD8NVEatqfbEi/o/cfgU?=
 =?us-ascii?Q?kxfSQfnW+AUwD95cHbDrVlCmy5t1GbXnfAe3TYldDM1enq21bctvJDo/wLMU?=
 =?us-ascii?Q?I3tdTjUmUik1vJrXNP6nsZpvLL2f8UqjVQ53M97zWjWUMZtZfKjCOCg+PtNS?=
 =?us-ascii?Q?2RrPYHWANOhCfbbyR7M64blJIxOibINL3yiwGnMYKQUUebGwKASj1oHnkOS0?=
 =?us-ascii?Q?EDodMFGtAGYiOO7pJ8/c/eMOQTNfN24jl667QUPuWs4WFyiphoKKf3OStsY9?=
 =?us-ascii?Q?hWBMZVzM6MxL7F9fcIyE6uMbPU3CvUV7gIOgJVuWm57HbyrdN6mY5VB7mTpP?=
 =?us-ascii?Q?9mNnZTDDetT6jHxUpxMOdtZtQTsj+iVqaXpb3IVZdqjoQVOn2H1Oz2AKdx09?=
 =?us-ascii?Q?fT3b0+pWWkqZbdaRrCvLDueWk5m1XJIOK6lLgSTykeRAMWemJBIF6a6cq3yM?=
 =?us-ascii?Q?UiBPd1bWV2ddxAmf/BZXpGgmaZRykLXPW5spfIckkv2IysTKGIzRmTWh1zyh?=
 =?us-ascii?Q?t60Fh6NnUUZPX2yxIQD4wHo1vYaLcr0XKk1UVeVCYefg4la97/POeGgZKbqV?=
 =?us-ascii?Q?zR5+fS7I1N92s8UvDEkRSna5AtmwAvluXBsftJTQO+DQeRLNnia3wnfjEIGO?=
 =?us-ascii?Q?r2yVQ8fdciW2nfeXWzUH1W6akHwZwZhfXNaEFfTHpTZ/iNwZggqeTJ1zxldF?=
 =?us-ascii?Q?b/4oOHb36RD7tlasXYV8nyn8+UhjnEHpZ325wvXHfEEzrtinqzEL+4GJ5S5X?=
 =?us-ascii?Q?s7aK84hlUpqUIH7le9my9KSIt35nkTAK4qwXxiQyvuZAvSt2KxrlG09U1xAz?=
 =?us-ascii?Q?0hz3XwLmw88dkPPTGeFpl4XKUmpbDyIfQQVf5PYCjs383ITNj15DsIEWS+xF?=
 =?us-ascii?Q?lelcsRgEmbCi5Y4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:06:55.6291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab58ac4-73ca-40a8-c7b4-08dd2fd49059
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602

On Tegra264, not all I2C controllers support DMA, this causes failures
when function tegra_i2c_init_dma() is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a5974af5b1af..9957802fa4ed 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -546,6 +546,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		return 0;
 
+	if (!device_property_present(i2c_dev->dev, "dmas"))
+		return 0;
+
 	if (i2c_dev->hw->has_apb_dma) {
 		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
 			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
-- 
2.43.0


