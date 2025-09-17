Return-Path: <linux-i2c+bounces-13006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D873B7D096
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A487162362
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92418309EE4;
	Wed, 17 Sep 2025 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bZc9SZQT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE2A301703;
	Wed, 17 Sep 2025 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758098176; cv=fail; b=gsoS57jCbGF8XBHtlFNEOZ/ypfai5PEAg2PB1LYK9047UYUEIUc81AsC+H7r+eoMTkKb9E2jYhnQy/yBtDGQdUnsfh71AHqthf32oxzoQJNBL0F9GHtbYz/feiSoRG76SBGwukGSpxAFVtsM34Gou+dmA73G/dB4tBJpuD9Py/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758098176; c=relaxed/simple;
	bh=Z8ojFwa2kuk8l9A3Pbt+CKJUYgL4PVTm+K8r5jAXicA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hKcAWGgB5w8B8uX09YCbsDOPQO4z7xZmNjeW7TlGR8reC1VfxGtfzXhlHJ2kSV0/UdqkeHNpQQYwMCWLQ6E4rnowQ5wznqhyv9yVhNh/p+vyCRJqvQOvmI2tlDL06vhKb4aWxHJab6GVRN8xN2WVf406ftJ3hqOGDeG162HzvWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bZc9SZQT; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paBeY8gZrXzA3ULG/u8MAh2wHyVy2Dd/i3WIVURbz+OPb/ge4nheaLBIiT2i3cDA11YbrRaVQ9QKEF8ju6vq4RiJHEEt3+CgnIzVKKRqKSivnPwIoj9f6Mtj9W3lVj/NwCBBCxCdXmEzlCl9TgGRH0wpqDWd+jTs36XwgitOa8+pUwXXd5Q96dsYdcZbLdrLlazs+h3wLBdfxbyzOme7rhOJFAQDPQyJRqAf+QMzqpzTJqeqoUDHSwE5DIK9vQnhtPIVswyhRQG9dWfGaGexGPs6Gcsff2pD9t3EZGNYBsCQpf2DHTYrK6DRhNfDhkEVsM3pymhC2+R5yqeCDsllFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTsOEoFCuh3KPAbMXnlcfWsXYhIDUH7H08zyI1OAzBk=;
 b=LWhaoMdUWVrylN0L4ADEVki7m9aN8BLpWStZMzoV3X30jUJdY8XA0B1xNsVmfNMb0Y4o8BBE20MjMPhUaW2ri3a4e+5bZSIQpfvRrDlgu6c8MiK2FiulBvAjcONi0kdnZHGvoE74HffYZ7g4Byc/hIUXzoqaaC0jiYXEw8uSlZ8oLP594vD0glORgbfPH6S8U6Dqkb1AWzfUQf1TJKGClRaRd3htBHubBQ932KcmPFmZrcy9tM9OHwSVbtBZxjtep+Or3BR2GDFnAPZGc2fG7c7MsDFyZ1a71ue1msOwrsZIqvhfJn5mGHySKx0q3yihYdTe4cxoDHY+LbE9AF6kpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTsOEoFCuh3KPAbMXnlcfWsXYhIDUH7H08zyI1OAzBk=;
 b=bZc9SZQTs7JD7JobZuocKO64ZkQkFHrfBRsqiaEVfxve/l4t3z0d3iUjUaGnDl17h9tIC7uGQcS3jqI59qIihOTTdNxEwB1JQhrH/UZ90myKpsr3OUZMvvm9cGdLFG1qlNU7P/JQ5AO6ZRnZjCl5j5wO2r1IgynQmtdoBnwQTEZsse5DHKeg3eYUAaNH6uBVkuDN5k3ADfoQhNwLZophqKl23fTWWztG4Ld7apT8rcwYvzxWJVMSzYLN8MaVWhM1zEXaImqdbZRyU0pwL70wxPTpIrpTnjKtGxabYEQLjhYgFjgzWrD9+x4GdBLgbd0rt20UV+T0TITp+7jP2y5T3w==
Received: from MW4PR03CA0208.namprd03.prod.outlook.com (2603:10b6:303:b8::33)
 by PH8PR12MB6866.namprd12.prod.outlook.com (2603:10b6:510:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 08:36:09 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::79) by MW4PR03CA0208.outlook.office365.com
 (2603:10b6:303:b8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 08:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 08:36:09 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:35:53 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:35:52 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:35:48 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v7 0/4] Add I2C support for Tegra264
Date: Wed, 17 Sep 2025 14:05:41 +0530
Message-ID: <20250917083545.594081-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|PH8PR12MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aec9f00-4ee6-4d37-78dd-08ddf5c5404f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YUGW3bedCnxZiZGuU0Iiw6RediCvG10qaFTF44JpjWF954bxZjqEeKU48BmC?=
 =?us-ascii?Q?A4+zCQtuHY3TnZNrwJYJEYdk9pVIyKR5I2wPjkRgp7T6aodmOzfaWo6WMHQ9?=
 =?us-ascii?Q?NjPkoICyjXtmUZNWRCERSe5OUHVY0qMRz2ywVv5zgchWJdkUisJMv8Mh+v2W?=
 =?us-ascii?Q?H414MImPLvGL/YGF/rfPNUeqOuKLKHed8vkyamxO8mXFv+j87pA4g34s52zm?=
 =?us-ascii?Q?CgE65FAawWO0eiT4/ARbROHeQrBwu9ASCMh9spb1uVpwrqTyeOYpb9yqw2S6?=
 =?us-ascii?Q?EgR9GDx8KDGDe6tuYSK9lUYgF5wreVWcCPk9twolFnWJbhzM9K8sZMO3t4Zo?=
 =?us-ascii?Q?kjqsazYhOi5N904LjYxJyblq5RCkNJJ1+Mg+2rDIHhdb8uGpL//MdCmldvCw?=
 =?us-ascii?Q?iBfsJibbosWUUeguZJ+Z6ChODz5+099BbH7A8Yw+/l68CnqzhFVr+hwmtspm?=
 =?us-ascii?Q?5oxSvn4MOlUmI2qFnzOuBjnvkzYXQO0FKJ5DLCxTIFaxsXFHeKozaSA/En9E?=
 =?us-ascii?Q?/6ibMNlSgmQ4a/AtEl6B0hCNxSiJ+2gfTXTeQxuAXTqpXREx2P6+pu12uYpk?=
 =?us-ascii?Q?jP+GxVZqz6L04cmPl5xZxBi10hhC0hTN+LK6airh/DJ/nA7VFm3FbwLcgxf8?=
 =?us-ascii?Q?yVLnv8pBrn6lBjq8AhVCuMur8RFsb7zCVXC/uUYp7g4IhgJa/rSbB4oBxk2f?=
 =?us-ascii?Q?aCJuY5iXhDD1wy4BngO37yJmxymWArFPuZyrJmfvm904dI3htSotf3z3CgOl?=
 =?us-ascii?Q?NwG6XqF0U/a2jqsPAgxmFqSQyHesGjIfGGrUhOvuuZyxTSU6yLRMdjAh0VUn?=
 =?us-ascii?Q?B3nQzHDY2Ikpba1jQ7E85feuq4iIDf/C+T4fYsz0oQMg+REBgS7i9d052NVE?=
 =?us-ascii?Q?BTZ5gnxMWsEbKzH/3qUAAHWjhWdCCLoII8yJULti3bpoPrneIZ23p1TXr/6N?=
 =?us-ascii?Q?lRYos+kzYctlbCe0rXV5x/4PPVNUpm059Sja7USUngOYkqmByz9WNs6DIP1t?=
 =?us-ascii?Q?xoHgIUkB1NBrCsCzgAco+zK4mnFkJOS3G3ko8zLkqQGmEMYmCEl7Ef1iJGQo?=
 =?us-ascii?Q?4AF00Ct9n1fsMk3eYCWnT6FO8q5GsYC9y0qdXfGwG+PEOvpMQy4MjSGOT3fT?=
 =?us-ascii?Q?H6U+6OXy4m4SMoxSnl2c4Lm9oARC7lSN0vkMOn44XxxvcJGZHFkv6oIXv6UE?=
 =?us-ascii?Q?0WMqdVLyMnSRrnq5/NMegYYYqB0BlcpdJKPfx7KqtLsA3npjhpku66pxsy48?=
 =?us-ascii?Q?docpc52f/ACH7I49hLDKcruYHZRPz2TWiItRkyFzwJMPbtE4H9TG5Fl0l4e7?=
 =?us-ascii?Q?naWnvAGrvCdhsjOxN3l4tR/7i9Y9wo08OWh4hW7lk27mCkuV0IXA2tavnx5x?=
 =?us-ascii?Q?Mozj+xEoz8mKgzY2dT6/VztZZNMvsSN+Mo8Y0/tMgL2OPhuZcuuxqs5G7fMA?=
 =?us-ascii?Q?4+CM66+955xKQJH0bnUZaWdatxA4ootCR+3s8YbfuxQXQCwHfunaPlqUo0AM?=
 =?us-ascii?Q?jgILVFVT+H7Of4LE1d1xv5H7Uzrhp4+I8ZNGCtZmMWyFNPCcoGNArpdT9A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:36:09.1369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aec9f00-4ee6-4d37-78dd-08ddf5c5404f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6866

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (2):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (2):
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 drivers/i2c/busses/i2c-tegra.c | 159 +++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

-- 
2.43.0


