Return-Path: <linux-i2c+bounces-14941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A59CFBEEC
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 05:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7D4F30262B8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 04:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0850D22FDE6;
	Wed,  7 Jan 2026 04:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fg7bBiJM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9131F3FEC;
	Wed,  7 Jan 2026 04:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767759895; cv=fail; b=p9rTB4V/N7o2DrcYuJdMhSz3xxq2Ylyo7EJJn7QAihBby3TOjY9AHHRhBZ1epE1S07ut/JT2frZ6/5prxXjJAdeI1qDaxL70md5FJaQ6m2viQbd8q7jrtn2MMl0XPTG9CJLiCfJtTjrc1pPBsA8ssUmM05hMqPce7OOVPOsO6DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767759895; c=relaxed/simple;
	bh=NOd2u++a/pPz6QiBeZ2t0W1F3MazajdRBoNKY7rGNzI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QaxTmYyMdiBW+c13N3nO8H9BcmWg8bhquAghXHmBYc6t0//DxpJW1SJH902fj98bnBBjOcvt8YHi716LFGR+3P4zT358BLarFMMpul3cW3kKNBNEKltdEb5qecn2m/9cSBOn1OzO+U0GX7y5uVs6sZD/c7G+IrKuDTc4UBE4PjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fg7bBiJM; arc=fail smtp.client-ip=52.101.62.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYpErApW1zj9gk25tXPDL6Wc+wUGTT6fxc5PLvcOhPuCWD1BWgcE3ztl7QLPvUw6VocQYmKOW63bsMQ7+Xz5Z165ymZRSaU68g+xtTZmh0Jh08CYtae3ASzS8px+sczQn7lYdJZEb6zfZjGcyUB9u5fhgq18qRu2ZLgyZ26QZwJlZihiCdhMJtzb9aWLbApCb2Se4kF+gGGaONVgflekxfxPyyikwuC4gy7OtwGdaKHacfu7PlOzYBfGApgTf7QnmrdgT34ENcXvVWrkgwObnA6gyA7gG9BmY4VoVlmXP+ESRw+Mwt0Ru/5iYrASL5hMY4RMPQtJGLC6nl1mrFQczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGIOnvYPuG8wyHbP89pQeLkh/Enx3/en4BRgbSXNUZc=;
 b=vV3r+GDtc0/xKv7TGSAPGoy15rwG9lOCcwKiYw24koyA4jlF+b2NlgH935LUleE2TrQuFQqSRzgpakWdrGK5SPdfBj9WdsScVnZUdCJ78Dz64PPT54Q0Gc6+0Y0dgphpHDr+cjz75B7PCsFsMN0IYA1NPcVMixDQD7186H3Tsyh+66XsKW1uvbArsW2MxbOghmcrVQX1rIsv3daxlxMsvcMoj5EI9cbON9MPwTm60BdIf3dbg/laTjmiPotf4ZEtec1k+onb680x/7t2aur2RRQ1WJqiv4YxW+m+FCXCsOYco8xVj1DBDmyMTW8kyO4UN1NEAmAo/omniqsdeyVDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGIOnvYPuG8wyHbP89pQeLkh/Enx3/en4BRgbSXNUZc=;
 b=Fg7bBiJMe18JyG6jDNqVSN5nenVoTdbowQIkxv6nRCC7tYM0ZqvI+khJIVmICWBsnd7aV7nJUsYX9jekdFxHzMn4fZUJRTnLKwF3rgGmt7r9vcyV+SBid1HlMBLH6Vxh/ZlKXfCzsZ8OW5pPrAmeWaDNbLDghGSz7peaf/mFEKCW1nL9u3/8iIEwJZqJbfOyEzsVgZmPlCj2awhvcEwOHYwkFQZCvzGmNAvBggRTJJKVIDI3HvVzMnGD/OFNjJyMd+SMA/sKa/kTCKkVo9ZEsiJCmqDBQAF/Se7y7gEvysUs3lkchvzDdPOX9xmvWvjKLcWGUhvCXWrKLyyJY3rSJg==
Received: from BL1PR13CA0025.namprd13.prod.outlook.com (2603:10b6:208:256::30)
 by SJ5PPF8AECCE022.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 04:24:50 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:256:cafe::de) by BL1PR13CA0025.outlook.office365.com
 (2603:10b6:208:256::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 04:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Wed, 7 Jan 2026 04:24:49 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 20:24:41 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 6 Jan 2026 20:24:40 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 20:24:37 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 0/4] Add I2C support for Tegra410
Date: Wed, 7 Jan 2026 09:54:30 +0530
Message-ID: <20260107042434.10587-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|SJ5PPF8AECCE022:EE_
X-MS-Office365-Filtering-Correlation-Id: 25961ec4-dac3-471c-94f2-08de4da4b28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AsNA0AqSQxy1mRnWXV2ob0HWcOUDfaPNNFOhTBfbK95Ae38xQv4q8pxPxtRs?=
 =?us-ascii?Q?LP8kr6W9xS5FJ0t3/i+sKRMh1Rd7XhkF8Wa4gTH/I6QQO6M0yADYbVy46C9j?=
 =?us-ascii?Q?QV9YmUK6aisyT8ODjzxhhQmb+eGqMcJCOrnEBIrq8UurmdLCFAZTkrINuU+w?=
 =?us-ascii?Q?6rh2nMsvLvY8XY1XGXBwkGwhQ2FIQmAh8RFvVWGT4RSNeCun6NOepJMI+rGc?=
 =?us-ascii?Q?jZS9m619QRCkW7mzumy1NQJWfRG6Q/j0F3I5BGmQwBswPerHCug2VxuK40E9?=
 =?us-ascii?Q?gdieyKiXCPcHXKv9Zx33KVgaZCqR/8clGDRiHlAyL6XkYbJcswNrAJBKZ+DT?=
 =?us-ascii?Q?uUbLnwErtffWuSYBJ6D1daN2Xpy3SepT7dnznEY+wBiJ560+Qo3rKgIAjlnL?=
 =?us-ascii?Q?tdyzxSKcWYLfCU7xcRDYiT346a8vWCC7iqqvYs0QoYwMrnReNBUf9lfvFMjx?=
 =?us-ascii?Q?gK8od+h4q7DjQSZN+cC+/HOPxuSEvgfKjjh4BXQW1dcrLNvG993BepyltNIG?=
 =?us-ascii?Q?0oVdzf/XuhlaMq3pqUUv3IVxHTit9B4cdUoNT9oWaNj6uIWcisvQ7lbUMDdG?=
 =?us-ascii?Q?99oQKOEgv0+41IyDrmONXi9semwmLqmGhT4gj0GRlAkK6iADXR7vO3rfUTfg?=
 =?us-ascii?Q?HFnrZbS9Lfc1kCAm75Cb4GJmnudHgZSRhkGfMxyKwMbAs2LLjGUePmVkfnxT?=
 =?us-ascii?Q?BxbR4/DkToKtQJNBmJTL5BmRUD3YEm9V0BgC69kZm5n54qrS57TnQLtc6pPH?=
 =?us-ascii?Q?PJ8BpwCbIgI5VD4FW6G8OyxXqPmsjECiwMqtowJkvW02KgeoMnWHSihUySKR?=
 =?us-ascii?Q?FANz8ObVVnZvilWsGpKOeKK1Kz9qZWtPF64a8KO3OJS3XZKCo4ifSy9A278K?=
 =?us-ascii?Q?G/7EFmNJrOWedYns4w/ezJJyExtFzn3aHQqmScuFius6qF2nfNSiWIw/pVLW?=
 =?us-ascii?Q?KTdBzSqKcOVzL9SF7qNL3Uq89JfyPxYJdKe6Ro/idGzHa1v4p+o8vIYix006?=
 =?us-ascii?Q?fAvVfMMFkQNFDhtkILqyRW/eycRAeFSba9baFXqoAyeQS6/P0ObKWb3xNGxE?=
 =?us-ascii?Q?Kd1HpCx6PiU5k9wY4XMoJV93TuMqmxCpjobIScwrUoWnWoE3MiPPubcjqJps?=
 =?us-ascii?Q?G67bmPwrQXwe0oCl9xfVDVJ5L9lSSd7aGOQt53EtHTvbqD6oOiZg2xoecZxA?=
 =?us-ascii?Q?BqtCLf743eVdvWlnwpzkHcT4PGNNK2sO0Y8sYbhNGTf/bEjQZJo0Rns57YY9?=
 =?us-ascii?Q?+uJwFwR1Kpf+vLRACAehI9YrrlNKqXYhPBOV7xI+8elNXGmo0MV5AisfoVFi?=
 =?us-ascii?Q?aNzSDKqCcA7A5I3GH6yp0MT8tVH8mnADxS3mA57IqwgSD5BB5YAcHIcaEbDW?=
 =?us-ascii?Q?aL5JWmWpMZh317w/uqqrFFJNClTxZkzgkankhEYToUf5t/m5IVZTcmsEnnal?=
 =?us-ascii?Q?D0MD/UUDz6kPxqNQ+cZ9xpXyWiT5dVfgNmqoOtfbGuOm+0fLEvqxekK9uLs7?=
 =?us-ascii?Q?SR8aJzClnWCZgReHv2fIYWiv9A5d66JtF3mFqNJaa08cfhmGtRYO0NWcyBls?=
 =?us-ascii?Q?hXwbd4m6+uPrrgoUOUJc+SsU8465RGLUL12T4cdV?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 04:24:49.7196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25961ec4-dac3-471c-94f2-08de4da4b28e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8AECCE022

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Please note that this series is rebased on:
https://lore.kernel.org/linux-tegra/20260106062811.894-1-akhilrajeev@nvidia.com

Kartik Rajput (4):
  i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
  i2c: tegra: Move variant to tegra_i2c_hw_feature
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 569 ++++++++++++++++++++++++---------
 1 file changed, 410 insertions(+), 159 deletions(-)

-- 
2.43.0


