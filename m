Return-Path: <linux-i2c+bounces-15086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 013FAD17840
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 10:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 277913070FF0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 09:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B20E37FF7D;
	Tue, 13 Jan 2026 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LHw4Ldik"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A0F3815DE;
	Tue, 13 Jan 2026 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295124; cv=fail; b=UlEOwSr1UN7Ymjr6vUX1eYdI8QuLAlkFh9Up1En4v3ra7Bcla2ya7KfHPRcejrFOJAtxIQ0c/DSFaVFCOPE2VK1nGFImko+gCzbxZLcvxA1oxYl8/POqCQIKj30JkzUkn62ZiOeQwxNkJhnP8iHlPLK7WvcpwNeykCJ3nQzrRIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295124; c=relaxed/simple;
	bh=QjOU3xI0guxv20SmttyzJV6FAm4CkH3Y7YO0UkMNQrI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KjIsS1kqxOJHRMuX/e79HPNkekjW69F5gbAqsLbZ/hLtlk80yT0CBtOkCHFvyPxdZmn+NSKicKiAsFpL+kMX91XwLVqT7YKTOPCIzxw+jVWIZ+SoMWX3auyLwTj1TnM0RVsJMKeDrqcNvdUYDBiNUVkoq7gNLK1xrou8vCwLd7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LHw4Ldik; arc=fail smtp.client-ip=40.107.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZeFc0y77GEpV//IMT+FHpT75OHinOAkU4Zge8PnpRP4mHCdrRbXSRFEgg+vP+cbe1cHrw5WqG4RdFeeTHO5sEY8IWnAGuYpGzrkvyZm/DJJLsIaDXzP5gue09lyJouYNg8EeDEPctXOSBVuPFgN6onNSlccbtGz4njm1WkdsfqFYyXqU41A7Uqc3LyFhd2gSqJXiHAv0cz6xkPrRtTwG1G7DS9jqi6YW1uPzUexKlIb4+UVp3ArMRAibhGmMRTYB8uiCoJhJUDDoUeqI3B9DFiZGM9xf0hansCeutkr2xk3QgGFXpfJqR2C+pIyUEQxgwZW1h42v3cBFpM6RnjJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppDCIkDaFkOkiUwjL2IcxCFCagp2wdFMRBkzG4AaPXo=;
 b=cXU9mYxmMwNPmQKhwm5qtGk0kC+ty9Xsw8loAwviYIBvvbf845TwqdTxEd7Vw9mymIodzpXgG5pv99XcpO+KOEMwu+KHbX3FYlgPbSrL1rvbuBcL3Ur7b+2ibKBy6tevjlSK31PCo4OG0UqrWlqOCciMorfr0AQiHg3o92CeM+lZ9gdsW61BWe1UTHkIVdfz6NGevm2tc2vx6oq/gdUJNrmIWJxct0kOjcVHbuw0WTGgQhT0n2gDCfVhVisoVDoM9JTPWI8mMtZECyddudTs81fbwl1I/osONac7dz+TLz22awg+BPv+csnX0fM1o5qvbpPLAiGGERh8O2T1yYEwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppDCIkDaFkOkiUwjL2IcxCFCagp2wdFMRBkzG4AaPXo=;
 b=LHw4LdikwrHMama0wuPnbQw0aaVeiQMWelHBHPwBqQy53xArYfb8fwPi79DWBpFjjR9PFBGLdXyfgkQwmFJdw/jK97nDsMH7DkGfkoumugHiuoHh75CHTu5DcxlBDC2ZBVk7+TMpoi6Lj+qf4bqAn7/hRB2zCetisSlOfyKs2/0l67VuOHvPaUsctziG+VntUHAen+pOlLhjn+5TGvc18/f3HSDjjdOG3XHLjc8Rx9bpsSAT4Ngs//FyefwMM3ZQ9x/dMbp4BFEaIWifuinx/3GSCIABZ6hjtiYWSqRJfwNW308FMA/viUe38KTLRDv4+NfV8p3TQfNm3ddfwl4wSw==
Received: from SJ0PR03CA0191.namprd03.prod.outlook.com (2603:10b6:a03:2ef::16)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:05:15 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::ce) by SJ0PR03CA0191.outlook.office365.com
 (2603:10b6:a03:2ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 09:04:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 09:05:14 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 01:05:07 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 13 Jan 2026 01:05:06 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 01:05:03 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v6 0/4] Add I2C support for Tegra410
Date: Tue, 13 Jan 2026 14:34:53 +0530
Message-ID: <20260113090457.41689-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a10eb7-56cf-4236-bcc9-08de5282de05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7sswWoEK5g32oTkB+/3z4wyhOj1T+0L+rpohrGDMocWDeQtxQ0am6Xn7OBZO?=
 =?us-ascii?Q?t4Lm9ydj2AZaZBJACXfXdTQFooSZLTFYgo6ZxN7I8sxvXtqhzObeVZIp8cpW?=
 =?us-ascii?Q?5ZhrTv71bUasdnf4QheeX5drIV6HMSlKOz4AdDek6vJnPoj/wv3s7s6EIYQd?=
 =?us-ascii?Q?Z4V/aueFdpY/jZ7BWhL8ztn6S+4VFaT5GX1mOAfvQpNrO/A++ueagytX6Ya+?=
 =?us-ascii?Q?s8STpSX70/rBH427hFgDjfx5L1f+A1CULrE9kHoBDiRCqifRL2P/xUlmGOkY?=
 =?us-ascii?Q?57MpvmJfG6PWUyx2y3cfCJRmSU0OZoX4cN56rTx3ay/hrR8yKEpt7ZEcmur9?=
 =?us-ascii?Q?7PeBYVnGANIAw/FRQR80Qr/tKZrybqwXOmsjFIKFI5GPDxHsNp7CtTVNDAYH?=
 =?us-ascii?Q?qQWhPOT8N1dYIpMHx8uWOmXFIG9oebF1zAAhC3cNa1ILFSxf9Ox94jplMQOP?=
 =?us-ascii?Q?/Y3LVJhbm4gR6wlJGHWZ8KBmU2p/S8jQR8kT31PAqt1KfjocqVDpEgjTZ5nl?=
 =?us-ascii?Q?+DeN/sMB2SPQHfAjyQewseRUR1z1CxYutZGQiA6xsoegvf2MTgc7dYu1V4/G?=
 =?us-ascii?Q?ED6pnWkd65VJ7F3MHnrm/VNhHN5R82Wge6c7NF4ie057rPk6Li9jcUNx8msq?=
 =?us-ascii?Q?60PlDcz54zGqb3tWob7iQ5niy+NdsKJKKfBUs9yFqf10PDna8H8bUfAg0EqS?=
 =?us-ascii?Q?5Hjgj66+sDdNlbHxo4Y07r0mdQIFzBX+i9PqGm9hqVZc2tV7FGBl2akDR++4?=
 =?us-ascii?Q?aq8j1sald+ynBYl3uzvH7H4Lb5M2c09kwk9hcY6ZQqGQzSy0lWMPU/WLoZS+?=
 =?us-ascii?Q?IfkRwx4gc0iGRgTRGxiFtXPPtfkHHszXRqRfEqXixNTqYbfC7FIE4MzYF6OC?=
 =?us-ascii?Q?Qv0Wk4odRTl1As22wmuU7BlOFPpBBg5sax9VjOI69h99mBRNA/dcgie+xXzQ?=
 =?us-ascii?Q?33jTx7UPkh7v9LwI3STiCArkhwvcOW2NyF5bWz7BJHyO+yYjLubPBNldZFjm?=
 =?us-ascii?Q?1gHXYRE9hjuk22OtZFAj407gUsVvwbIM17AXH0ZtcWm6AIg5taQ2jGHIP/RY?=
 =?us-ascii?Q?gjF4Jze5WxTMXSqfVDACcc6Yu/3zVBGmXmo+kVcP5OcmQ/Y+auNggZ5IQ647?=
 =?us-ascii?Q?63Aj0EH9FK3TE8GXAHQ74thgazyaHx19kDWSd/jvaNzEyGoNuDsOx2hiGno7?=
 =?us-ascii?Q?11kyzdGloET4scgp9nfclXw6RvNZWU/N9qjmgh4nJYENUD96iFE5oYjVFZFD?=
 =?us-ascii?Q?R5/lVTVLGS2Sz3bjRh2Zl0BMKMDXKM8oU6V6kxkZzySPOCLDQ/qUxV7++uYs?=
 =?us-ascii?Q?jiNMwgQtaMhWH5ynqMVjvKalNAg+Hy/KT5u2cnPUbNtYYQTOnZvp8F/Q6z05?=
 =?us-ascii?Q?KZKaJm3HftwdciTGmAxVV1IzhMfliEf88JZJh7XFyO3Wv4dO/xJS3EBnkXBU?=
 =?us-ascii?Q?5zZ1Cr6VPc0rqyDUulSDx6Ebe82ieJbalUBrRYcjRJTVb3N31K+TzKgYW1Oz?=
 =?us-ascii?Q?YrlsgZZhRqKc/D1bYFXmzfEFLM0zRBuzKsaExgATUavsO6Gd7qgAL6Jn3oEC?=
 =?us-ascii?Q?Y5Y+W+yNJMq6cLKc8UnN0ZKeg0BJ5YbPAdVDOcpF?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:05:14.7480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a10eb7-56cf-4236-bcc9-08de5282de05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760

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

 drivers/i2c/busses/i2c-tegra.c | 543 ++++++++++++++++++++++++---------
 1 file changed, 397 insertions(+), 146 deletions(-)

-- 
2.43.0


