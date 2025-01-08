Return-Path: <linux-i2c+bounces-8961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A79A0591F
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 12:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6463165ACE
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 11:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384891F7554;
	Wed,  8 Jan 2025 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kY44xXrF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6609919D06A;
	Wed,  8 Jan 2025 11:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334404; cv=fail; b=mVuGs1mK69mG0coNZps1RxYkW/MvnzA5HpT/7GqKSSQC0gFkvWsG0l7L2hzTPgpuS7Qew16XBE+zvT2aPAiZtkfZ1AFCXYmRxJbVrzmXMFeN726XtAB1yRELceeXD8gBPbwzHoSep2pnWOtNfNreEMoZXxq8epGT1cpoHJxnfFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334404; c=relaxed/simple;
	bh=tALgan/W4PqPxlWILVvCgdQ5RBZpoFsfFA6185ljXH0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tubg4xmXygXWmoB3DZCJfaO5lHfk4CGNGIfx8ff1gcGTZqLdVw9tpv90mr2vAk0efe+5ZAo218AbKvg3KQc60OuU84DiLNLZpwJ9RD/CyYS5exrcr+MsVpJ1sXU47leMJOnRfRv7LRqc3BWPQ7JqJGpd6OOZLCsR+eao935NL8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kY44xXrF; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYo+kY7CvsaFj5nsjIHZqHctPVy8AOPUfCj0t7NTZqYfN5kkB+HJhIYmxAaHlVo7M+nM6xkRKhkA4e/O523nQ3xV4NBdHaNIwZHbmyb4JB+5CVFlm+9EBD0vIwNKaIDGvpd3DUXCp+pawybwc2x3VmYcL+FIlwtJ1wOIPy8OWjISlwI/CNpHofFfJf6ePEDTaB0+EbxTzUMZZD26ybYK/XGW1piA4PkwHIlwCkhHjpd1CVkC6QeENqloa3JclJs7H98qbB9mRZrm2hapGNAJ+klZf4OshiCrz5aH81uycRu+cywYVhFan3pBpYYhwKOmdcyEfwPoHENwger88uaj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=go4/KBVINqh+vMsZfDyMJZdwubrDb5ecuYVUJkasKEY=;
 b=SHLZPfw3MuygyjJWxkYsNPhNRRwHfJ3zGbw4rfWFlir97Mr2oaMb+DJppfDwZBWX83y+LAbTa9ICRsNXn1WDzYfqURz+ALdjaE17zzxpqCnyTAp5OLMGHQPlV9M2DSCR0wri/t3WqvCnzpG42Zjv4Uk2I81/JE/Yv84qCcV36bpTsuPQXIwMKFpr1rcZutTUib4/YzH69RyRka6hOlcGlXiGRquTbX1leT37cinTWgN2EegSk89jkewX0kGpR/u3IbMGYlreD0yVKlI6WIhVVFlcmPFzNweerbCqo/vnXo/3rhfvjgBY26p2bmluvYCHAqtwjnkgBVwet1bRhs7cJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go4/KBVINqh+vMsZfDyMJZdwubrDb5ecuYVUJkasKEY=;
 b=kY44xXrFQsS0BmW2spf9zp6F5EpGh9YL/pk72sdmFj9+jNvSDvpvKUwInpO4LLg+w7pJQNa85huHklHzO8Hw3QKRCi7Wr/miyAHuNoWukCjye08uZnbAKtZye7noXSm1XQd8EQg9/5BirWUI+WRggHqgLJZ/G82RVnzhentIpl0Wi0FxABph22u/iRG5jfioX2YP7t+jNdcycagfsDlR7IBYF2UEmraGuyyer7M4bayXi8LbDBbF/1W2HQ6k2vcZUCMupOh3UP96sCuf/2tIEcVn2z1IqfbjAJD+Fm+MEjBOhVBh0lDnRDgaLoQXxJGE5iTJTb2wyVervC1W2BfXUg==
Received: from CH2PR05CA0049.namprd05.prod.outlook.com (2603:10b6:610:38::26)
 by CH3PR12MB9171.namprd12.prod.outlook.com (2603:10b6:610:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 11:06:37 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::f6) by CH2PR05CA0049.outlook.office365.com
 (2603:10b6:610:38::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Wed,
 8 Jan 2025 11:06:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 11:06:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 03:06:29 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 8 Jan 2025 03:06:29 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 Jan 2025 03:06:26 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] Add I2C support for Tegra264
Date: Wed, 8 Jan 2025 16:36:15 +0530
Message-ID: <20250108110620.86900-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CH3PR12MB9171:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dd7a63-94ff-4517-d00b-08dd2fd48574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9RWYEMuEXMKQXJbog9OEECoVUA6EvvrkPAJxY/2XJPmPETCuIyrB7xdPVnN7?=
 =?us-ascii?Q?3sQruEmPhVPTfyrAu+/r7uEi5OifvFi7zVMRL/boRhCkzgwVnDA1VhB9becQ?=
 =?us-ascii?Q?r5v2EPTLajnnNIsVMPVeRhTRm2ii/3DFzB0UuS3wufG+UE+um076xDTvd3NC?=
 =?us-ascii?Q?RLs3rGbLTmrfv1HL+DQjJjD1FrHXMb48chvmRDCbc0/JLBS3MDkoT4Ojtqro?=
 =?us-ascii?Q?Pq9+HXP99ZBTIS3zjb0fMPuBS2uwzXDJUbjC0lBk+1kd0jdSx6iwtWrYDFJU?=
 =?us-ascii?Q?78k4EVByT+jTYlaH1tpMZPuoo8CQ26SWo15ZHogpF8EKe8tvEcf+yH+FdR/G?=
 =?us-ascii?Q?U9G0Xm2OKM+hhjhL6FWJ8gyowAy+c50F22fNNrK1bExn4CO9K4pOuarbZLys?=
 =?us-ascii?Q?Vbus02ZKcmCP+I+BT+H/RDZQ2bxWXHxOtOu2PxH3uohq9aCIxpqm92UDkEPE?=
 =?us-ascii?Q?huTuw7I0hGdjsTbkB7oTkzr0QOqLE7xhP9XtdmztfWgzxpm08uyKOX6vLyHd?=
 =?us-ascii?Q?6zNjrRnRqqKf9qd9WxB38sVPV0UJyuTQienWFmH8oQuS8EeMpfLRRHNFE5rt?=
 =?us-ascii?Q?POu9tDOQxs+TNZk2h0KfUKNQw7EnG2Pq021scnvfk2BYEBnNIIFdLVh+p4yE?=
 =?us-ascii?Q?b91c+yEyq1O4t7BQgA6dfY+lFqMQro/V196VZavlDNFQ4zfNJRGZb3czKaKL?=
 =?us-ascii?Q?MG8jYN5ZmE/GWA8f/j3d6hiYnjca1v1Fmyx6vGlBX6odrI1iphyC+gz2dSwG?=
 =?us-ascii?Q?PW4Y+LalyOzOLItaniRsdA6sA3PVsKai50xGvimwr180k5hBh5fpoXf5K4IG?=
 =?us-ascii?Q?VhiW0ER/rTqMLluEfMcpnc2zcMfMu2W7ZvGMfgxj1TJMNYgauEhWaE3QOCS2?=
 =?us-ascii?Q?YX96G075VQfEMnKdX1Kqc5ZNkylHlFFZEweayHIofWLb0dL9IYvYY03jq0Rq?=
 =?us-ascii?Q?TgGM3wZd4WYM9EfmVHEWz8ALmaZ6rqrzrUrbS6dy1A0Jr5aWPzArEkT+hXpx?=
 =?us-ascii?Q?Ez+i+0bT7TLVflXzFkQzwLRE6phifhuOFpg+cYp+Ta7ScXqtI/V8vhtBP9xd?=
 =?us-ascii?Q?gfTsEBtCCfWN60TsuYcvLM3boe50Cnue2JNX6nNtkA4xBDD2xdgBddsUXokH?=
 =?us-ascii?Q?ROCbYPbINKKNPgg/mX7lg3bW09lgjFTt0o2H/3Uj+t+0t0MYWN1KY9yNiIuU?=
 =?us-ascii?Q?9JutMv2Utr9r6pz4US7MG0AQM9g9EETk676duWoOJZK3Ob83u9TYipWcF3UU?=
 =?us-ascii?Q?E0APOWDC2j602HCXQ5aoIKN0Ssl57FWGh2VY0kJT7yr3UEuok+U7UU8P46C6?=
 =?us-ascii?Q?t8UmZHjVrqhBJsrCKu3bB+dSilW7MhQz42+/LhJhi+8O8DlTTnVuv8Te3Uyj?=
 =?us-ascii?Q?uP7prSarS/slpqPH4gDYlS8lZPsXlsprQdVhhKN7Rxp+QZcaJeSXCI6CktyP?=
 =?us-ascii?Q?qVw2Q29LwiZLrC/jNmZOtyTCIs/r9YyVNJ6nZalS8OodahoK+PB6eMqhSDoe?=
 =?us-ascii?Q?nVVFeXq9bXDV8tatAkztGghiVnXpUBcMQUEY?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:06:37.3513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dd7a63-94ff-4517-d00b-08dd2fd48574
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9171

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (3):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support
  i2c: tegra: Add support for SW Mutex register

Kartik Rajput (2):
  dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
  i2c: tegra: Do not configure DMA if not supported

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |   6 +
 drivers/i2c/busses/i2c-tegra.c                | 179 ++++++++++++++++--
 2 files changed, 170 insertions(+), 15 deletions(-)

-- 
2.43.0


