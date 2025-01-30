Return-Path: <linux-i2c+bounces-9232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C5CA23068
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 15:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1C4118888DD
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 14:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FCB1E32C5;
	Thu, 30 Jan 2025 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QwLpt4b/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3CA7482;
	Thu, 30 Jan 2025 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247707; cv=fail; b=SAA0r5FDn5bVY9DAI8+KGFFujLQMybvVKelFDJZrlfZaxWXxSU7hS7RwnCKmfn63NQu28Tc7UnsCF/yW1pRiKhhuoYPT0YOd3Y3cjUVulzt9PS+kIz4XvJKaRkuy+zIGVKCmM+y3JDmV81rJZzIF7j500NIm90vJhxstuJIpHR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247707; c=relaxed/simple;
	bh=o5VUk0pHUedKrGgqVOo9TqED8lXrM87tuU2X+rqzuIw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HP4V2iw0muik77Nr81tJypHqHiSBPVgOg7SV9mXTsseLz/F4+XbXtXgSnw98keioW85odDU3JEwsHA/K+iqjbZ4WzvnXuMqGPR8+PWJyGcNEkqXhncvdue4T4x9l2sVsAinzJyx7eh5l5Sb4MPu5RSNb9uG4Pr5OBuu6/wsfRlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QwLpt4b/; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzVxq2q1KWg4kUifd42hFjwJThXSkfeTC/XBwxsT4mY7K6igelxCQMoUhbemzUtW5bd0inBcAzLWCAGAuH3bXUj9CdVMCf01UQ7wYHtForG2DH8Y3UszNZ7j08SPoFaIvwjCo4FWVQ7s0ZuGGlW3IIPG8dKQAIrbDLFFm8+t7sw/otmDiCwCeitPITYDy3sKl9tfq8Zis1N5wTuNoYVtHAXBEE08TH/SlycY+e7iFNyAl6L6qUOM4hAojmI8mE0b1YXLWpBO63FRt9gi7m77bFTWX2RvMFGKyn9xMwTX2UUbAoxDOhQqaGNHc/vw3UAfqbodcRSHlnyXRXCse1jnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97sxxIaM2BKacRjY2OsNFVLpJlymhG0jA/UriVHY4jo=;
 b=eOi0fFBXeRbRu6F2wo3aljgC/OX1eX8h21Dx5ZD08rbDYUV1nQTMq0/EArnXi0xNqTnO8Po9ZTQ0Ld4AE8nms5/Nzln7tC4ItnAU0rQPOuzYhP862y3zYbELFd86tTKBqVKL947TFSgrKIEzi2Okqq/FsKAb0AqRKHR6Ol7YJleWZaPaDGEmrspannxYFrmg4eFgSjhwNcYYjUFzxWaTEAFd1DxCJuacb8k1awRPxzx60WFjn4jNCvAoppPyzND7/AyJfXt3IOGrSMe55YL7QL4sJdWB9kGnVQf7+3NwQ8HTqTCvPVrUqrvdRHOJglBZFzBEwHzVlqvMR+VJW2+u/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97sxxIaM2BKacRjY2OsNFVLpJlymhG0jA/UriVHY4jo=;
 b=QwLpt4b/Gf/imlsQhY8qtbNbgORjTLhrTD8MFfr+S/BqCYVNf4vnL1ZT2yFabEmnKKvWoxf5fKWieBPs03U3BW3QBH0/Rm/wAYFyncy5XyE7+xgM6bEIIbSCSAFCx7ukiRtGkQWSTwDxsjXuHwkIcx33GT9ZMzvpEGKIY3dzIsPtUnIFgeAfnDGs+oSrYQTGIHXtbZrczpvcQlr8jffmRef8TB/oNuOwtAK2IW1wVPPRzEXUmFTuWdhyzRPjXrS8VG3DOHCpfWU3bWdSq0jfw0fZe2rxvCvCUfcT+AXgit4wfnOfRvpX5DWRHdBgvZ4N+HLU1F5OAUdp7UX9w8QGpg==
Received: from SA0PR11CA0153.namprd11.prod.outlook.com (2603:10b6:806:1bb::8)
 by PH7PR12MB8055.namprd12.prod.outlook.com (2603:10b6:510:268::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 14:35:02 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::ba) by SA0PR11CA0153.outlook.office365.com
 (2603:10b6:806:1bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 14:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 14:35:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 30 Jan
 2025 06:34:41 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 30 Jan
 2025 06:34:41 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 30 Jan 2025 06:34:36 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/5] Add I2C support for Tegra264
Date: Thu, 30 Jan 2025 20:04:19 +0530
Message-ID: <20250130143424.52389-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|PH7PR12MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bbc810-412e-4642-64b8-08dd413b47cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VvglGx9U4fohc/OFniReNUYHkhznIMqBKS4RPVxM6ZghY26ywqn033EMRbY3?=
 =?us-ascii?Q?c6PaOLlU0Hbfd+OaReBOHNgNpxL/QjjQdQjoXdKZ74Pns2bnqUuYBKyeRF+f?=
 =?us-ascii?Q?x2Eem6/52WqrvaSAa/AwexWwNvW/ryCWMTbhHKO3RkLC8VhS3jgon8rXuiId?=
 =?us-ascii?Q?JtsqKwg+SHNqWcm7NIJ7Uvflixf4hYXWm3H3FRJoyL3dVN88nfcPRHai6wt0?=
 =?us-ascii?Q?uCYznq2Yqo/cRrIQ6ler9Y76uiAbda6BCt5GJSRCkUH1eGPn9+7yDZVqPUSG?=
 =?us-ascii?Q?u1+VM1hwR4H6kMln/AabamQUUdzQBuODK8iSePntsU59z4bs/YF031bSjs9Q?=
 =?us-ascii?Q?G/+rSoXtX+nr50Iy80iO7E5I4sKBuTnxghhMcrFb10VTS3O4XpI2TVEQj+FS?=
 =?us-ascii?Q?ebpLgtD7YxQg48wyUeCtOyqyTl6IFbv7XuJLZbgfyGf5f+HGr2fjj9kQWnjp?=
 =?us-ascii?Q?olzgKmIg7GjfzZJIuEyclJYikmHWyfCAK4opjKKHNAL/IzM4P4JJ5aLXv7Gw?=
 =?us-ascii?Q?qbTzRSY76mxjZSE/wh1JC+R804ZaJwoRy5iHabIEDCIoZQUPbD7n84L35apB?=
 =?us-ascii?Q?hXZ/VKd5fF03H5J/2ce9DZv8sUeEBZ7EUVNcXY/zz8jxfeDigMw2FtQ/EN6W?=
 =?us-ascii?Q?8uw10g9jcm9CUW9GiMrA2ZqmPnKCshSRcOy/4FXVKZTpEuLrb97Lek/Z6BG9?=
 =?us-ascii?Q?5HQlrcAjGr8WebRC3N/pfsGvYFkuYsn8VQEeIFeeqw466bHmafuxIq4TEKG1?=
 =?us-ascii?Q?U6vKtWjMcvbZLiwnf9HfVWnXkXqlYeMv684vEkc29hjzIANduW/Icky71Bi/?=
 =?us-ascii?Q?7W/8Udjx2OlPea3D7bxhWEZTGZXEp74i+cM2/ALXsuUPJreCVzk4ph5dIZOW?=
 =?us-ascii?Q?MFDpg7IPVbrbliw2PKwsZulX7z57x72NiMqBTOcIXsai8boHc7/2DgB5uOmY?=
 =?us-ascii?Q?SgCq3I/DqJyq0dACDODY7/G/EV33e4Uj3nzV2lkiAXTcIOoL4RiZEv4mi/vA?=
 =?us-ascii?Q?ucrSnu/z7SVTWO/gGi9dXPUo9P3w1IOgdJ9KSd6GcgUbuYz006q33Qw7xbCw?=
 =?us-ascii?Q?2G7nSzuurzZgfO5XMJ+2grcqfJNYv7sbptdaukYTEXWsBF4LU3WAWY8EYV/C?=
 =?us-ascii?Q?IlyzSfO68ain+0NqfwQPjfTr5RXNOZcXnkiPXalIXexPbfVLCimMBYS4Mjb3?=
 =?us-ascii?Q?0jkhQCh48rOxcoJgDylcEDjOA+xOiaj4Mq5VWI62mAEYQf614gB2LO93s44T?=
 =?us-ascii?Q?Fs0nHUD8hIwBHdm6VmTZOQkPvB/s356+gom2A13E9gyO2KJR9okKqLeTtAJ5?=
 =?us-ascii?Q?WCIazFgkr3W7AtJE3Xm5wgP8Lk2tzIwY/36mDnM/KDow4Zd+FufDyLH6cGBn?=
 =?us-ascii?Q?zvYnIQ9f+112Hu6tXFNd7f8VgrlI4jG7HRfkKFYNYuX1xNbgPRYMuxJQ3lhp?=
 =?us-ascii?Q?jKXW8w7E1N4kFBC7UvVH28NOIXiFtTLszdcGYMQpryiG6Rx7VAp/J/G/0uZR?=
 =?us-ascii?Q?X/iupc2XSrKUd9FBEGRERxsBg/ONbMy6NS5W?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:35:01.8591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bbc810-412e-4642-64b8-08dd413b47cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8055

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (3):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add support for SW mutex register
  i2c: tegra: Add Tegra264 support

Kartik Rajput (2):
  dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
  i2c: tegra: Do not configure DMA if not supported

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |   6 +
 drivers/i2c/busses/i2c-tegra.c                | 189 ++++++++++++++++--
 2 files changed, 180 insertions(+), 15 deletions(-)

---
v1 -> v2:
	* Rearranged the series.
---

-- 
2.43.0


