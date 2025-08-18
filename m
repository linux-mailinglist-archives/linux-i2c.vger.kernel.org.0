Return-Path: <linux-i2c+bounces-12322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98219B29DA7
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 11:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 135787A3E91
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 09:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9000230DEB9;
	Mon, 18 Aug 2025 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EVsTDAzn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE32D7D42;
	Mon, 18 Aug 2025 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509084; cv=fail; b=o3oyCnJUCOMgmDzhhjsCb92kWBdppb/XExKBFC01FwtgsmQ5rX51PeDUEJkpNawuwPW2kQqJCVOOXB6OMF5zG2gDYFJ7bWE9H3XFkQI+d5vzhrfq1ulHDl2oad7uFRp5kGNWmI+iRjq4QRZeQgtKvks7bBHFiFDqnHA6qSV0Kh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509084; c=relaxed/simple;
	bh=shAc2J8VQ2CZkWjKf+Lnx2b+4M6L6xX7As5dOIafRAk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SR29VYoin25vkBKqmDPAIN9PP00bQOi+ww6V/CKPdsoIA3v3/8+LKGYd4SUj1kQdgBD3ehbXuZ3NcI1tk0CqkI73gOSI0vydvOcHZ0IYul+1ChXdh5Ofm4hsoI2xmhoJC2c4Jud4RXkXh/3fOMkJxsLZ66hHGEfafiUxZLTsjLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EVsTDAzn; arc=fail smtp.client-ip=40.107.223.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTcfEPnh37Y3/SbQCHwsUUhbhELlnEHWPXCoM5VeW5ulyfAebwL3vPKre+bRkX5/wkLCQWKXGB2ZrKaMiDA3Bb7ZyXQWpBl9VniN/F8GxCNdUPMLOFUsfM39iVminPlwAJy9qfWEaXjHOruC+mOkdMr9dhXNc/eT2rkKKEaYrlbqdIT21tiAG8nLnpobfnXquoZufFMDoDMgSBpQoUoQoDUNZyCZ8AxVvd1G++X1t6KQtaa5nG8f8FmoMwHldo9i9jiipHrAm+e7/mxKm+axdDMhUGVz93ntvFPhMQvRbyCi6w8BovqHi8pzOfP1O/09+x/lSoMPDPeO9W2wVgRvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c4HisKqYs6ZjICdz9qnCzDWK/qjy18wIn6b+0V2/LE=;
 b=PPyE72sYGiUm5yxZy/9XVefqU8XT1xb33FS6Pxe52qU9V35WK+SSCTNlc2rmj4ePFnCazTrqnYgRg7embuzAil0qAa2bq+aadaeBsqc3GaR1Ql5SEKIPYEm1Xq3lEMxKDjFd7WVONoo+2RKqiR/Txk6g/l5Fyd6w5eUABS/2dk7GmDFAdkocJgoTkPqwUjREJwIkrOQeM7iyueM5XfhlKXvJwY5m3sc/bdm7OicV/KdHowy+Pob9s4n/Qudh9j+ZEoQiPDk+RXgSyjhc6gfQR6XfyquOB8mOUitenJc80KZYnOdp4QMyiHyit+wvrimDwlvtaGB5BA27m/3E4b/AKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c4HisKqYs6ZjICdz9qnCzDWK/qjy18wIn6b+0V2/LE=;
 b=EVsTDAznh5SKaWwptm1hYJTP8X+kgvOluZS1A0awYXsJyZ9vug4oWF64Y6KCkGCKiE35v9DzSw+7qkUS8DdT3QKujPpmBFB9Wz4AgI0AkDeo/2+uw5t6kdtAJtgyTBtOiYRDiVI0kC5J+NIEuWB7UBb09WgT1GFQtIonLD3cR+Yipw7SM/bPHfXQ3VEsR1MgssjMShFdQPNO67eOBZJUR2F3AQ/kpZW6Ts3yHVTD8oMdg3+FO+pa6oKSY1+S02rzKDjzQj+idlexRPoPZwHkEUhEpkafoH0IcM/+DSyMdwLPURfu7g3sLl5cxpVCNRiZheN0JpuRUDKz3gv+g6CfkA==
Received: from MW4PR04CA0238.namprd04.prod.outlook.com (2603:10b6:303:87::33)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 09:24:39 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::f0) by MW4PR04CA0238.outlook.office365.com
 (2603:10b6:303:87::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Mon,
 18 Aug 2025 09:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 09:24:38 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:28 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:27 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 18 Aug 2025 02:24:23 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v4 0/5] Add I2C support for Tegra264
Date: Mon, 18 Aug 2025 14:54:06 +0530
Message-ID: <20250818092412.444755-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d66247-e9f9-4b37-b93f-08ddde390e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fkrdZ0uvWWUE/t/AjVlmnHMf0uK6k9OpuYQ7zMhHbUP5Qmc55gQUELlVn0zs?=
 =?us-ascii?Q?IWbENoQs5gZW6jZtk1g6698CR2oTkxRZsugJvQYwLO7QJqsaVyBxlV3kHe3x?=
 =?us-ascii?Q?Cf3ESw0x06JlpgGtjNuc1yI848USOVHDpTlCFXw9OkP7ltJcCqNKqKxd4T78?=
 =?us-ascii?Q?Ku6ayH1DR7Vv2GSEZ3P/n+2JbHgOKRS0peHgMM4LrXNKzgmNyr2BnuaYFpTe?=
 =?us-ascii?Q?3sxa8YhM98F2rdOqkTH1e3im9ygg3tp0ts9wDh/w799F54QTZTJQ9GEVXLrz?=
 =?us-ascii?Q?6zFTRs2/ypYck5Jfh9ja65mV0mc0cfAGxVSw3JtrC36kZ4VxxZRpgwnhj1Zb?=
 =?us-ascii?Q?vmhkeS8cwpcTIUw3DEytkqsSqKc/iQ4hqLNa9WKsR6HiYHgxhSH7DOSADa9q?=
 =?us-ascii?Q?5v9FXj9XIxzfGspQCjQUvy0mqVANqNpA+f2Lh2uRsZrl6pzFmr6VVsX/wS7N?=
 =?us-ascii?Q?xv7q3aKFoDBAt8S9bDLUkcXKpGGY8RDxrDKRK/xwa61569zHelyIPYlwEnIh?=
 =?us-ascii?Q?Hp+bYLpF1ZiJRafvqUkA6t67cDPHHw7pG5szgO6Tsv8e168pLLoa1k24ZSFK?=
 =?us-ascii?Q?lFIi3r6lvo9pX8mb8ORDH7hNeNUY/qH1hjjvJoGb/KyqEP7V8K03SeeqrnWn?=
 =?us-ascii?Q?lj4fW5LURgD7BA4R+0ytHDlB+1tnQ7PvggON4nikTOnjTrmFfV1hIrNCkiMh?=
 =?us-ascii?Q?6kQCN1WnlTdXDMIEEp4h0YnswKivdsFc7WQhTot10Afho0akGVuADksg51OS?=
 =?us-ascii?Q?OKsmvHbej7b3j0LRSrj2jw0qnUGgIHc81J0UO8zBQ9XllhfR8s2xd/42VudT?=
 =?us-ascii?Q?Z4QfyLnLbvI2+Duf2x6Ttx0+X0NvQi2n47pegrasFjvA8+Gucq1uOEP8fJt2?=
 =?us-ascii?Q?ujGnWikWmH6uZk5o4DdkhacgRpjUofpOWw5ueZiPxwGKQiGKQVrhr/TBM1PB?=
 =?us-ascii?Q?2xOQDrNNeSG7ttWCAOEmt3ocHQ9eSFib7kxppNZWoSNI5cTQnLTbGiM1DOAU?=
 =?us-ascii?Q?qwF0YChs9/MhIuuPYNrKOpy4QodZ5TmYmP3934NWXzj2TdEBBqluZmxChYrU?=
 =?us-ascii?Q?qL3Ozwfd1BkOVxFoqDHrh3I1ffMdZq947hnAULLn9cTk/t64e7Q8s7SoZnJF?=
 =?us-ascii?Q?6P0ZArtJIn9foEflwNdN+y0iO1LINSW+G07LguZYNEKg+EE4Bawl0hkRJysK?=
 =?us-ascii?Q?f9KL24HEghnZLFNm/yOnMSYdvI4n7O9Pymks/jjIFMyt2y4g8J3VNsfrG9WN?=
 =?us-ascii?Q?+hzKAZjLwtdmuSNP8cawb5k3HV8J8jh1aeYuJKgMJFWUtDgPCXlpXD0mAEiB?=
 =?us-ascii?Q?n90xDAoSHZWpmKqBhA3VbzNY3s3VGGYKQyBYWyokbSGqQ/f7CMxT51ihCyzb?=
 =?us-ascii?Q?ufUrxF28u6fFr8aAMZbXIOcxIYOap18OgfEWUhpZug2xT58lSZKhy/P2z3Fq?=
 =?us-ascii?Q?bIOIoJw168QeT07I8kmxcfUA96LVdc4G19dZagllwl4oMgDVKrCheb56Vf+v?=
 =?us-ascii?Q?Fi5B1qaCZHKSWD/GhtsoL2DTfASUiVdeKFm0H2+s2RDx+uA5rRHLb0bh6A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 09:24:38.7261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d66247-e9f9-4b37-b93f-08ddde390e23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (2):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (3):
  dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |   7 +
 drivers/i2c/busses/i2c-tegra.c                | 153 ++++++++++++++++++
 2 files changed, 160 insertions(+)

-- 
2.43.0


