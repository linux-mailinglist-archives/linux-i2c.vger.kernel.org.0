Return-Path: <linux-i2c+bounces-12429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C3B35704
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 10:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4381B64ACD
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 08:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0832FE047;
	Tue, 26 Aug 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mKDQZtTm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1012FD7D2;
	Tue, 26 Aug 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197199; cv=fail; b=T+U1D3V3xN2N6IQB1yhcxq63skiSf/JlvP9vPmdNTQlsoeYEJSWWqHzPkWPnB/Z5cWIgc3I6nQW4JhmGUM8UH+nSSy4L1mZRPw+JVQTjS3UTqjEqe962gnJJc2bnkfGAOGrzYaocWYFgCxCHOMKmGqpnRYtXcF+IEzHineBC46c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197199; c=relaxed/simple;
	bh=dFdpBy806e1fxNZfUxnACskBXaStls6gX1eNuojym2I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2JJifJjL/qY98yDXv8rRW28l8zALrkPZXCFKWlJ4x1HnzA8uw4wbF84duevBbSnRQJDT8CVinB7bB9qzlvwVLga8E6yV9a6GzEFaX9JqzGdQUeBpu2oHPv0XnfmcGYSbya4B7voglo7ujd8P1J8QBX4nyAdKalbxtIsSn/Nd+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mKDQZtTm; arc=fail smtp.client-ip=40.107.100.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNLTzlXq/6jytQXPsXZzE3URHVLCecHAX30U1vwArXcWuh+xsQ0Nw2yz6eerf4PnmguSVpty5hmZWmEWxiiP5Iwwfs+xWd0RBU7/Qe2voxj8A81TgA6egFr1PrwSwqCV8q91ul5IfoSTzRV+ZiBFI9+pD5k+arKUAmfDwFTp+Iir5L/eAIdkJd/5spQQ6jE6AZCXU579gh8nLcH8RGapUZkWWwvRo5JlUmoPFr+8sxuBeCv8Z2pDcDA5j5SN2TjpfyYRD5U9wJCIyQpVe7SxStjheC6B18DIfflzbL+bohSuxw7kxgJmxMfgwoIRr51Mzzpt153ilt0TJW18zGryZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCYKPCmOmQZ9rtDoq3Ggw9KJvwWQ2OcmrBUpWS9O0VA=;
 b=lcPQJyab8OK97/zM0fr4zvgMYvoLTyHXIcEPfkg3BvVYvp9Gjk8gTloFrHnLc+v5zFJTEKg7HnVB+P2tk8p7HGYvyRdVNu0dhNqoBYamsEuvKXbEUyWRb8GsXAS+wHpxTy1As/969TBe/Hcj+rbTsLLzlrbbnaaX5emALMFVScm49+5/XJ/i+4hxoECEyFCw5EEmTmcF2kw0oAYNrn76VUPoRHGjOhLm9eCHvWtA6DkyhAX9Fa+UUcGDLAWYgKl3qIYFQ7Ci/PWd9TQahgA+VzyhnCIf9g3XM8xt/uHhCUlE9oytRRYSftGhHaNfcvgRPxes1Dcz59MMx6F6D7Sp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCYKPCmOmQZ9rtDoq3Ggw9KJvwWQ2OcmrBUpWS9O0VA=;
 b=mKDQZtTmPx4b2qTj+ag+2slwXSMQay14a2uQX4pDDkgmw/h92E7esfJXQxloQD6RMZN6iEEos4Vje8CwhKxZAz7spKfmFlio6+Hj1wTCKWIQDyX6WkHI+SLjNf35gSllu/v35ib/R2afgSFSdSjTGAV5TnWvXVbgy/QkzHGXkl1t9nczt1HB36lf9q6n0k5ONQhxyXF1MMwsik4GuEmaBLVLG5hYSTdZMLqdaQJqlqkEYuXMf4s9QHA3qhgyt9DdBCMth1dbIMXOA1p93SBnmmn5M8qvvf1CWuXTajRZeU40Otit8rgYcqi6L1xcwYeUOXD3Qw/zjLt0hFExhLkBZQ==
Received: from BY5PR17CA0028.namprd17.prod.outlook.com (2603:10b6:a03:1b8::41)
 by DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 08:33:13 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::86) by BY5PR17CA0028.outlook.office365.com
 (2603:10b6:a03:1b8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 08:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 08:33:13 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 26 Aug
 2025 01:33:01 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 26 Aug 2025 01:33:00 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 26 Aug 2025 01:32:57 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v5 2/5] i2c: tegra: Do not configure DMA if not supported
Date: Tue, 26 Aug 2025 14:02:41 +0530
Message-ID: <20250826083244.487610-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826083244.487610-1-kkartik@nvidia.com>
References: <20250826083244.487610-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|DS7PR12MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 16785308-717c-4459-545c-08dde47b3246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H3L/Zdu5BEI6PDxfYg3Agl8MPVF+e7DWBePkalmsEMF4Uv349L45MEgPRXNM?=
 =?us-ascii?Q?JofG81nHdfrQ3+meGUVEquSexgCfc5MYnBex73yOacl52K3BufVA+LHvQ6lg?=
 =?us-ascii?Q?jd8S1G4y1YIxhEBklFJ3csZxSHauYrUNMpVOyqCa+BG8y5/Nvq8LsmxKoiEm?=
 =?us-ascii?Q?yA8FWK1Wz65YNRlpz7QuS54IXoFnY/hHHgDpZZCuR6Dc6dLtK0V3S/dNx0Sy?=
 =?us-ascii?Q?MGLTRKd3UEuXHlL8fYmNoMC7Rl+RLdlHTVcFTgvJXFT7zzmf7Tt2qPJu5+cI?=
 =?us-ascii?Q?tHK8rYzBFOBYpu2tR5+SDb0q7wT4bMm21UkFQpy/BEKpe5Msoj4UB0vAjFzN?=
 =?us-ascii?Q?0oKQYJv42U2ZqdwBBqIcn6bES0rHtEYUTyjmDpYr68/TWNhT+jqPrONJwfhI?=
 =?us-ascii?Q?vD8wBx4wXnhD1tsjgUFBgwtBHgJ/lYmBhXq59EcCQ0StXFLlUnvDTQ4hJOsw?=
 =?us-ascii?Q?aUoEjw4tsUqDvnXt43J53smemvlJPaC240lFC7QeYIdwLI7LjpueKwd9Btko?=
 =?us-ascii?Q?4Y/cIR4DrjaB6i/iXFCtAgDcitKqOk3HMo5YAfB47nWkqI6cDo4jggdbS2ni?=
 =?us-ascii?Q?yr8QVlo76o7DHwZJSD4GHrB84j20JN9zzeMCxHTPbg1n1YKIxT+8s0iO/71f?=
 =?us-ascii?Q?nAv3B5kABf/Os2vGr4WLiSmr2a3qDbr/odyk72StGE4B3jjRDbuMOARmpVMw?=
 =?us-ascii?Q?NGNRghG9hcfCFr3ZVY77PtMhCKL6B+A8hCsHEu0/gH2W/Ko2zdXPLUt85hBG?=
 =?us-ascii?Q?m5HcoAHJnNrCbF7rEG+X/g9pEBCq6eMGbxhmqmaUiY31wwCwZKZXD1ZvltHA?=
 =?us-ascii?Q?sescFlP5RyNmw3d0YjzBARt5YoJhVjvPG33/UnPLFjsG1R0GNLaZ8a1FC/et?=
 =?us-ascii?Q?PTw8+qz1yyFROayq9KZHONVo4O9aPXNBEa6r95I/Jx6iC95SonlAz8EVGdL0?=
 =?us-ascii?Q?1M8+0hsrhire2kkbZrEcq2+DP6Rl90FDq/i44tVv5P3Dtkt3NBKgSQrH2Jlm?=
 =?us-ascii?Q?K7N238hDXbquR4IF2ybUZktG3Y4kqnMzxrzGks3OEBULi2gQoki4IHmiPCvU?=
 =?us-ascii?Q?UP27TPQ6gJCdKwKGl6wsQuaE3ndZTY9jMS3s0Ke+rrc2ZdyW6YxKP5fQqWGF?=
 =?us-ascii?Q?5O04uHNg0KkrtbzXLCyqaqBUoqD2ojpZ4QcjJ81oFD6sqUYojAzjWSjDK0W7?=
 =?us-ascii?Q?h7ge3dx+fYKXzNv/aivV996+fwI0SrvzRY0pD0kqAWczvehIXqLZn/LpEcDb?=
 =?us-ascii?Q?sCOVNEAYpXYZJBBJ0dIjV9atB/piOl+6xertu2OtaO6FGM0XYpZyBRFl5hOB?=
 =?us-ascii?Q?M1L22+InkuF1mOYQoQPgThHrNdiUqUbv4wR3C62FJCCp0MtELLj7g6AC3sQp?=
 =?us-ascii?Q?3+dFRfQsT/N3bWlYEN6lJRF7ocyechHtbTlpeQjhlvs/fb53utMvHoDUPCwd?=
 =?us-ascii?Q?n0gTqrxnD60lkZgM2cUens8yKWbwyac3BuJQlVxoXZE/MT78UL/QX6+rFMlF?=
 =?us-ascii?Q?ivTdrbg3yBXea6Q7KuBWJet4d34XZNK87mb62Cxc2GtsaIcIWwzm+qHJKQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:33:13.1877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16785308-717c-4459-545c-08dde47b3246
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

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


