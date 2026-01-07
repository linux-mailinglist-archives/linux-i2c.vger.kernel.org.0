Return-Path: <linux-i2c+bounces-14973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E957CFE56B
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 15:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5122930FE09D
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 14:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3520334C134;
	Wed,  7 Jan 2026 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cK71gWfT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6933834BA46;
	Wed,  7 Jan 2026 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796038; cv=fail; b=l81jtWJG5JI4KeTAdG6zVqjEEW4n9mnuEgsYMZzEh4lFukONjfkgU0dWoBOFEFTQLtAMrwaSn+HQM3/6Su3JkiRApSdz1dXuAyanWCKR47llj1tYo3sOoxefXNPAbQ3HF6+/fZW3XNioxJvfmJJau9v/heylhknm4SGEIfFvHq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796038; c=relaxed/simple;
	bh=NOd2u++a/pPz6QiBeZ2t0W1F3MazajdRBoNKY7rGNzI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dlrKmB5Epda75WQHVRifxDnT/QK0BIlsZUcOFKVpiayGTzXsfXfBOWlhKkXEU2i4xsEc1UT3qZzxzLo8CFCvLeZc3AB35pMm5JO6IYqASNTVgE8soGQoL/ZtvGKCZoeHlYakaFveabCGwo6ctT/taUkAo/UGtSkxGCulIWG6NxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cK71gWfT; arc=fail smtp.client-ip=40.107.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPqVLo1F0WX6FahOLYSZZR3Y/lvhgNFyVLVlpp1fRXGTriIMMdrlZyUAGH1Tt/IyFK98914ythUapqe4OPbKnNIsVYQLMqFZpnGfh2gfGVfFeMO9TUhXDVnYCucOuoROsS+r/x2wUaMIQyhfcbBsyb6TOKF7cuL0g+v8PRndGtOv68SrgTYx2SrEM8RmF0XO76dG6F1QPtz9GpVimCgmquhBf1DGpUe46JCKLJ8HhKovZHvjMA9Zknz5epFAM0O3P2VI0JU9qhyqtjh3JCgJYiLKp59ioeKztrWjOi6ZL5/sU7tr9lThBX4+rBhHSomGspdEXvKhesrW+DANiPQD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGIOnvYPuG8wyHbP89pQeLkh/Enx3/en4BRgbSXNUZc=;
 b=X/rmv8vVPSBzrHiXn1OpU3zvSRXtfwj4w79yFghLvx0xs2BTPG28nZzLsijNSCmdITBiQHimzVb1oNOZ+dIxPp6aNQj1UdH1vfFvV4tGeK6NsGUnwRsc8tvMvuoDEanZIUFrGc8Z4u09hJqW6ybGyV6jyQcN6bK33IKjKgRF5k2ZgY5ynpFU7gHwrIEY9ZlsZ3L0eiaa3YBYYT+v99UwTW/WEIbznc9uh6dJsyQPT74SM4mRA1kbnV0z/idAcS4ZW1PI1AVZb2bvnHnSd5C/YjlxbnBwqw3zyZv35xhmqOIn/z4UACIhoHaMWQfdWnBJypx0SQm280/rINomlAhwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGIOnvYPuG8wyHbP89pQeLkh/Enx3/en4BRgbSXNUZc=;
 b=cK71gWfTKcCIhcLTYzB7OI1zskwxF3BTPv5FNhiTAFTytpecQmwMWRKbj8u+xUotGNA/dwbnpSnGe/hHRCF1KMtw40sc2V5z0JsOyMbOjFeEK5Sn46SiwX/jU9oV5dI/nsrn/7m/GFQKRfQfZS+xxTMuB9VqH0CLE4w7trieOIeW3fP82uxYnqMp+uZIMKv5hC9FUG18bDMGk7ZNtPnfaJjebmgi3GD5ZYiWzsCC0I9VKRyD8f1Km9vEXdlyalonhf50r6IDhwJUzF+aUFaPNo3cK70xtSWR2ncUT16pJ9+NGYIfJh8tQaMEl7HJZTFSxqWzNT9dS4Zs9aa733TykA==
Received: from MN0PR02CA0008.namprd02.prod.outlook.com (2603:10b6:208:530::10)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 14:27:11 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:530:cafe::98) by MN0PR02CA0008.outlook.office365.com
 (2603:10b6:208:530::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:27:10 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:26:56 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 7 Jan 2026 06:26:55 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:26:52 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v5 0/4] Add I2C support for Tegra410
Date: Wed, 7 Jan 2026 19:56:45 +0530
Message-ID: <20260107142649.14917-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: d33fee22-dcb3-409a-f632-08de4df8d85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dtBuN/k41fyqkB7olCKfjzHMjRAlDGozZxJveHmASrgfyHVxC9SGt2iqozrY?=
 =?us-ascii?Q?qWgCSV11cL+mdLJd3HtAKOYWyCrH/E1tB9VbPXy4qV/adMKZRbP3MjhE6OcU?=
 =?us-ascii?Q?n/m3SPlua4OzZQGfhprMT//WNNBs9FK724T8PqfUokv2rQ6M9K4txXzGYp8C?=
 =?us-ascii?Q?NXN0t6bl6CyeKBzc7DTxbVYesK1PyeSgX0pOaUzONGe5MVb/nM/Frw6olJaG?=
 =?us-ascii?Q?7qzXTlc0sKyf7iCoraDyNiR3kuc0N8DobQxt/7QXVEFxgw77YHfbf2BcR8Kh?=
 =?us-ascii?Q?JMyLuZiJ551YcT7FiDlnfup6oBiT9xQtmM7B9+LE/DSIwEMZNX5TOX5Zd/s/?=
 =?us-ascii?Q?6ie/iNY150rW/KCgXC8BrvTDlw6oMNxNEGVlzVkaJnw5SEsUuAXwVbK5ChmG?=
 =?us-ascii?Q?h7I/W9euomE87FU5kDLknbTj2hHYdAWv4c3ixCg7rIafYu8aEvC4QgGH2FpO?=
 =?us-ascii?Q?GCv2E5Vh+ZH1b5kKSbOkv37sUiYf1XMhHskJCW+oP98js/XCv63tpTypz1nC?=
 =?us-ascii?Q?nZERBFVDB52Moqiy7bBM2gCio8oQCyzf7Z2RpDqlUDjOGXOUE7sJu3WnF4P/?=
 =?us-ascii?Q?gC9vr0gEDofjp+JX/ELntqOENpaX6QYbds5saTYzVWEY/zRi9O0wO3NEPuvG?=
 =?us-ascii?Q?6vX0YfXUPqkM1Wl6UYLOq93/CUCK/9IRBHQWfTF+keUKP9Wzv+hU/EOpgaAJ?=
 =?us-ascii?Q?/jtxWpkjFb7DYjOz/b2WNo2D3Job9/OrxODleYhh6lcX407xKFQa0N8+kVsB?=
 =?us-ascii?Q?WQPI6KnOUL+Bq8KxtRTmM8fauU68bkZa/anPt9BpyhquJdfosk65fRfwsz7I?=
 =?us-ascii?Q?tH5jdsWlQjSgOc9cJnP1TFTf6iTtfMBzFbxUyAPeVcHvTta22XQSIwLAdEOQ?=
 =?us-ascii?Q?6L7QeeMaetPCCFSliUZupWLukEwVbJtp+HGFvcBQjWUZHr9X55cxxbtBszlv?=
 =?us-ascii?Q?ElPoJMc0DxMwg7rjjx29LSMFSk7n4drQeNmjVWetz1ZxwMqGpRkbkaFLtP26?=
 =?us-ascii?Q?Rv2Oe+i+PvRPFe1YjWeH8I8POYwTGZSRklps9F/KpIEegopTWy/4shwd7EK2?=
 =?us-ascii?Q?4XK5e2txfiOpAo6pY6iqyuLsYfqy4rpQJhEAAEPA0GAg91iUlBpjnx/Xqplp?=
 =?us-ascii?Q?iT9tMbpTY5WNWz6EQjKB5JTy9XUOyHtk6RRnO4OWinyR6HnRJZsmV5SRfoe2?=
 =?us-ascii?Q?PDLMhqyiU1FCWgtvXtogQh2ANo29eoQfLPtdRKCimfwMhpq6z68RvsNMlOG1?=
 =?us-ascii?Q?5on1vA8G9GEA77eAgxb1qrI2t7YTQh4zjmungENvsC4QalP9DO1iQFMzkbJu?=
 =?us-ascii?Q?t5sNO94V+0jbx2jr3ATHok9Ml9IN4XYdWsAEWEt/efQM4eTzx9m0uVOvmM3C?=
 =?us-ascii?Q?b18vfSI0NMSZggtK+dhoKmcx+eIORGhuwTXSmxOXTrwkhtd3E9HfUvuRZmQY?=
 =?us-ascii?Q?DfsLwPAIemsixsI9a0Bqu9bROa0dgWfSFZ9ztr1J4Y8i/hDt5cUfzEZGyvDO?=
 =?us-ascii?Q?tqNDVhwIgcqkOPaHYeojgjMSAJeCja6zm+97OP0aUhPTzDTPY1Qk4uufQe9f?=
 =?us-ascii?Q?8QgMSJa3m7nChnMxYmxq2rjSepsOhndPLx10UXRU?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:27:10.8463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d33fee22-dcb3-409a-f632-08de4df8d85a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

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


