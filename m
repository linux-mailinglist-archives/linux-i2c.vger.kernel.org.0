Return-Path: <linux-i2c+bounces-12324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2222B29DAC
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 11:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8B4F3A9439
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 09:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2434B30E0CF;
	Mon, 18 Aug 2025 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mwpaRqJl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBF7E9;
	Mon, 18 Aug 2025 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509100; cv=fail; b=dUM+f4IMwhwMNA3d1Y9TzdJjURGd/AWgf8wmDpp3DHpWO+gH15DNE/a+haeZ3G0Qs59LWyPoeCQpFyVa3HgoqSgEX0NZx8YibYCPtIC/dDrnHGPdRDNu9ppA2Hq4ig3mmCasr/W8XPJ7fi/2girIGhBYL3FKQ5Tf8DsWbKKswjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509100; c=relaxed/simple;
	bh=dFdpBy806e1fxNZfUxnACskBXaStls6gX1eNuojym2I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=toGZ3anMlKDj9T+sQyNo/vJ2mUYBcAMJwvUnGV/9LlMpuNz/xM3dk+fThEwxQV8C9bModos/gCbkrZdeEnsatabZtxTeqwRNACtlWUVUpQx+lkgPOX9nfGbYKsc6QmwOvJtMhl3Sak/ncZFnr8Hc+GFqGTTPsNixuSXHb/pZ9ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mwpaRqJl; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Av8hOPrNW1JpZ8j1hzRO7rXfPcPUSxV3ZWDj2mqucIC8JkHQ14IMY7MFLSAs6QqB1Zs3+2vPONKP8PBwAFZOhuQadhEHLD81+nj01yV0tT+7mnVJyTeqwe8i8k60wkee2oJSJapleihJVyiUKtKWnr7L3J3meGXbrasd5+kTcF0VXbcl2KsRqi3gCB5QvIsogntgQtXWBAqtPIlcmdZBdfF1PjfWRHTKWMLZziFRILz/2b3pzWPpCmf51C8k7fKPpvuhuSkU0SMjRKhNKgZljT/zy7LQ1oDm0pZiOuf2U+zsaNIIIuV33/y8h5o46xLAokIKkB8hGrzKwRpwPkDmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCYKPCmOmQZ9rtDoq3Ggw9KJvwWQ2OcmrBUpWS9O0VA=;
 b=W7zQ+gVYRF7oWPnj3AgcSmZ833H8Lo5iCGdz2OJ28UmhkQLfc6PSlnkDDdQft8DJl0Qdd/2OREz6QEUwnc2KwNUvp3IuDt1uyRMiEukEkxyLWrsER/JRA6UzyIKAnUc1162p21vm9ZuV7izi5fRmoIMaRlKwHbLjTZD2uvCCMZR2jt5+s5t+JeUs9Dqg2HuHFscLSah14O195ikK+mwCrcGxETamh9XaV8HSSFiFbR/71fJyvkzo1CECnAYuBHm6kh8s8GOunLfbqefXrN90bHuqBENcMD+x8BHjun3gLIcR2iCnJgNZBdSMsQtje9rm2PjNGpOPqf5tudjs2mEMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCYKPCmOmQZ9rtDoq3Ggw9KJvwWQ2OcmrBUpWS9O0VA=;
 b=mwpaRqJlo0UJDrzMpVDzhk2OJSKUj8VsJXJcVlgGLBSnx8pJ2GsBmKdOhYJG2n/lR6R+PurTt/lxj2UZBd61Bv4IvD0mEAGq9he3eNeDRT7dKzsQA3BlAqEt+wRSGjiuU6dG4w5YKEm5ElRIympe7v/eV/uDfkJgAmCsMDnA+I4blNicpveIRJLQ1yMN0Utoe6E3BK+utv4sbJbrOnbW6Mk/qIJ8Tg8NdWhJlo6OBznnZaluPWHEr0CuH3Js54Wc2QRJ9hL4ipAPqb5qnNLtyr6nbRy9RnSh4W1VN25R9T5Ydxgdg4cdthhYZ3hg5nxoqWSFGv9apHUQl7hJXuVDBA==
Received: from SJ0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:a03:3a0::23)
 by LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 09:24:56 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::7e) by SJ0PR03CA0258.outlook.office365.com
 (2603:10b6:a03:3a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.21 via Frontend Transport; Mon,
 18 Aug 2025 09:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 09:24:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:38 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:37 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 18 Aug 2025 02:24:33 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v4 2/5] i2c: tegra: Do not configure DMA if not supported
Date: Mon, 18 Aug 2025 14:54:08 +0530
Message-ID: <20250818092412.444755-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818092412.444755-1-kkartik@nvidia.com>
References: <20250818092412.444755-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|LV2PR12MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6f57f8-8c90-4110-b06c-08ddde39183e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P9KkyREDTdYHqaF6qHWuOEihdbrkcN1OJ6K/IxuyA3z7pz8eFeJ5+1O3W8hl?=
 =?us-ascii?Q?vAxjj6bY3Qzjh7BWrniTmpe2K3IgE0cnbn1nhmItqWGt5a+boCIOE8RylrpI?=
 =?us-ascii?Q?rJJfwVj4MaFhaG+WA0cws3fxS833ID3B6eWUyBmT75krCcE8mBeQYInrRPYc?=
 =?us-ascii?Q?vKsEUx6mfbhdXfgD6caDpMLKaSjLOGBW5ikAV6iNWbsex6MRiJ/Ec2Mai07S?=
 =?us-ascii?Q?JqR7vA44cIKcemBKzC+24E9l0yLlV7HzYyeq8WHGq+x8Vg1puz/YmXelgyvZ?=
 =?us-ascii?Q?mO+s7IjCiE46ebNW0Ti4ihovYZvRQuzeOensdCFNdrtejTK041+XBBIBry2H?=
 =?us-ascii?Q?GMjpO5V+8U8Yym8C98fGWNBQsWKS/Tt7GCcCMbJMSCy8o79RnWpZZAdK8hE7?=
 =?us-ascii?Q?qm/sPOpb7ok27MEK8A/KVJN6gCK/ddejbhrIbx94zJmIaeP0F2UboCOnB9yr?=
 =?us-ascii?Q?QaxAYxDd4RxtFT57XIKC6aQ8kKiKr+fjMVnreyCQlc6LptDdAaZCMjHSUbjX?=
 =?us-ascii?Q?e1GKOwDVoB/Wq9kf0ahxZf5oAKaBDNU1VijXFUhqWbhkxwcGiw34jvdWUCG5?=
 =?us-ascii?Q?CUQqhXXiMrepcAWXM1U6dQxg1LFX45i+VfcZdAa8DgNNeLgJEWuSziBqzAOb?=
 =?us-ascii?Q?GkwwhVFFC01a3mCndq1b54s8w12XKRvDQgkHCKxLcvofkTouqpK6+XAJTL41?=
 =?us-ascii?Q?hLGN2Yl2q7P/cO2nfmgxZkAuTJVb7lEwdRjXrspEx7dLPDEln+GiNa7G2MNp?=
 =?us-ascii?Q?icDcNJlobXlcXbudC4jQDF9bcE9yU/MXivW25wEaQXvWz6Plbui4NodvN/S6?=
 =?us-ascii?Q?YMKS6JTDeEDkfbkd5M4HikZ7Ab87rHBHDLegOZ8KzdXhPJu3HNZCfOhf1APb?=
 =?us-ascii?Q?i7M2ChhII9vZKZPsskkhsBCbEfsmZ64RNw12m8NxyBTrRqPsU6ptRfkM6gUs?=
 =?us-ascii?Q?0Qe63bT2hshJ38HbTGMKPrw1RYvttNFQgla/zbEhpWlqBTAikSrsxgDHx+6V?=
 =?us-ascii?Q?Lr43gC9pjV4AtdDa+w9ZwDvB89PJEKqpdt8CeirEbm9FhHdsdpl6f1bPg7W+?=
 =?us-ascii?Q?gjPTlSHm2VxtGYCSiFQg3W2jCFXoIOiCMdqsrYbJfrYEQovZnpiEQbaQ0VOi?=
 =?us-ascii?Q?gxmYEef+4oBkH2HWAUqptLfHJ2266shKEoB09ynCF/UFKnUwqUv8bhUXT1Qf?=
 =?us-ascii?Q?wO+NyaE15bK8ibd30Zb09r71F5z+4MGyx9duXhlScIL2gW2TlnDq5dg7eOct?=
 =?us-ascii?Q?hOymiRl5NEjaQqbqKF1hh9A21Hnfp7B0o+4o1owbDJQY0dSyEftB7MvzrR4H?=
 =?us-ascii?Q?V8GLtgxweQEx1rij3sFKtVKEHp7zyj+TdTdOBFd41EcJGNbAU0fRA/9SHa9H?=
 =?us-ascii?Q?weFWvTmVHjX2P24JPNqZZbV2Wsghs4n4wA24iHwbX7A116jyvbOZtX83zQAz?=
 =?us-ascii?Q?y9BGliIKBhwzgCKGdlKIo1tnBKzBzaCiWcp84Zln8tl3nNDWIYeDL/UP0Uju?=
 =?us-ascii?Q?Kct+3+oHdvMwiadcucBQNcYARUy2TkgSbelOZ3GNGeEIx7uNRzJMIcLPrA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 09:24:55.6650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6f57f8-8c90-4110-b06c-08ddde39183e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v2 -> v4:
	* Add debug print if DMA is not supported by the I2C controller.
v1 -> v2:
	* Update commit message to clarify that some I2C controllers may
	  not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4eb31b913c1a..0c428cba4df3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -446,6 +446,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	u32 *dma_buf;
 	int err;
 
+	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
+		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
+		return 0;
+	}
+
 	if (IS_VI(i2c_dev))
 		return 0;
 
-- 
2.43.0


