Return-Path: <linux-i2c+bounces-10816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94EAAC0AF
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1028C5030DE
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 10:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B342797B0;
	Tue,  6 May 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RY3x3RYA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54E26C3B0;
	Tue,  6 May 2025 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525652; cv=fail; b=TtBt4epY7LN9Gf0PT4hn3s2AD5F91twu7wCpHaUmhIwsRsHU6UYIcIJg9ZTEUoPkpvPLLzT5zbHRLTptQKY38yYR6fF99UjpJdb3yBj/CsojyfzvF7qf6AzD/1D5A4mDcn2qZrdG9mV2Tg2Er2Gfz+fxjEwxwwZAGZ4IlfTKdLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525652; c=relaxed/simple;
	bh=0/3pHjKOP0I3W2FbIC9Wh8LBbI2FERLnT6gppPIaGwc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHx/ApvnF78MDQmLSdr6sdrrqRd4kz2TTk9WxAYAOldvDNPBoig+E8uk4EVw76Mx5BA8ZJvlIKrgCvUc+UMig1nJ/Uzck4471UVOCle1XNqeGRp8XOxh7fHLKxuHN2mcKHfAKtGxDVLu778KYVnsrpKbFhU6Mx4ATvbNFKQClts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RY3x3RYA; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYaSvm5m6lUJQH+MiqFOWwCikTA30tA0Thjvg8h3vOb4zqpiXLCBm8j/zQfJx+UJzYnB0csQjc1gzL5gk77S2amOSjCIqTzdljzFOTUg7iMJj++9tY5b7bf0rjNUWq7cv11nD0tLYOCpan+QGEn+BmMp+7PAvWO+/pOL2l75B2tQHeWGK4Jy/0JKbivfKqJT6fV3Vvhr4WIc8P0vjdhC42GAbNYk49K+2fsjhxsv/c0c1+xfRp2J5xuxklbsPwUrt4aqOGQ/YrmwXo1eZPmD0O63tO3SWMIHR0VS9qbCqcT9GCBYz9H5ZC3HKQ//f7sF2UI5wzTH4ttdXO26RRwP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5UW5wUZf8J4XUUzh54fKzQBtFybWYcybATU2Acwb2c=;
 b=cTglMqQD4Kyi6Y1/4jkyHYqmnQ6r+98MpMqafTWIP1OS4XWkSuE/6Rtjj9BqCYnZ9DnL5ABumKJ8km5c4mXDSrck3ZR2J8dcffvUgGpc/pdMOsTFGID84Z3JnMJaNh88gfGAuz/0Ap45+5duM5EamM6KethT3khoXckWDawqZpzoo1nXieKnWo4GI3GuI9Dmtnr04+Cz26ih9pITD9GGM5m/J8Or+JOgrBwh9K5J+3jpqjLngEVmF/6Evu13iWxJDRAXMZPBJFBS7THj66Xey+Lf+9iHni5jfIFCUu9+OzgFZoSGy8R2QwTShxlE29RgiOMPWxcJdR8ZVreV9GQN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5UW5wUZf8J4XUUzh54fKzQBtFybWYcybATU2Acwb2c=;
 b=RY3x3RYAjqBuaCDrXFgsHzqm+RHv9iz8FZvcLF1GG/CCEWq2cwEvTp+0LW6qoSF5YCxz9x74vka+z7kOop0RDkqdVZWxw1JPNz2p8OWF8D44Gh0Y1tmB+SjWMq98TQnTMnO7uYSXDG1a7Zqj3IZ0GffAfpHteOkh3UySp6UCpK9YvoJB8kirIl4YAVUtoJee0XsDKklwCWNc9sLt/iAZdHTa1BVBgKIOWS/jx6Vw1gbm85S6A3QicjBbfqYt4PALs4eppBnr1Tp77L6GaY8lrRlznZoNuhJg7BBrOqUeFH4zo9qyf3r8nD9ZHyhJPtiivrVjt3zajkVh5cJqQymJnA==
Received: from DS7P220CA0048.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::6) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 10:00:41 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:8:224:cafe::e9) by DS7P220CA0048.outlook.office365.com
 (2603:10b6:8:224::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 10:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 10:00:41 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 03:00:32 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 6 May
 2025 03:00:24 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 6 May 2025 03:00:20 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<onor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 4/4] arm64: tegra: Add I2C aliases for Tegra234
Date: Tue, 6 May 2025 15:29:36 +0530
Message-ID: <20250506095936.10687-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250506095936.10687-1-akhilrajeev@nvidia.com>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea11408-ad40-48b9-eaae-08dd8c84dc30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G/WX1zECWGPZxrBDrpZkY+Z4vkR3k1c3i2bFVrUr1dAindT0z52jwBvPq8G4?=
 =?us-ascii?Q?A9qMSykzbYg4WcawrJxbOg7o2MzKqRro3WR4gFOyQou73Xo/yCjGy2cEqmn2?=
 =?us-ascii?Q?5pOPfLSu565h4kw5KdJTapfRzlIviT+5y3Aoj+W30t4UBk1hpV9QHVJl0PhJ?=
 =?us-ascii?Q?x+Gk13yrgU3lj058ZJwpPz0dVftjNK29xs22zU7KPNizlDfjhlVQNsQqgIet?=
 =?us-ascii?Q?YQ6avSuGiBOjfgA11jUhRfKWQSuv+c+9sRPYqoPVsgN5eXJTV6qe/WGQ0Bjr?=
 =?us-ascii?Q?dO2Cb+pIkXLvZU5v/ONRICaNx0uN27TpZFsETgAFQI1/2dGZDETst80swgeY?=
 =?us-ascii?Q?KH2E2abq1AefXFsREKKe90p/FkoxJhzwoBMLf8Fs8zjE1SCUnlF2pQrW7N9a?=
 =?us-ascii?Q?fLcHiaCe6zOBi/gDyLMyg/oKKxJRwJhhc7Vlieq2hyEbuKgiq6DAwZmTpsKW?=
 =?us-ascii?Q?ze1Deh/2BsSeBclFVSFd8ejbNKvoIfoOnY7vQGwaQ/fex2giP8/TAAmkcWSP?=
 =?us-ascii?Q?j5uV1TTnsrP5uU7qAjD96LVGvCy3t7SY5OlqeizeV+zsXaly0PKlGQ0qu5gE?=
 =?us-ascii?Q?AWgwZNWBL+Q1VtDXD465Pg+jC5uT01nK4xUMuegzaAS4pLMV3I6TcGzn3PiY?=
 =?us-ascii?Q?pDmP2XI8ag5tompWodnTiMSkkJMCnowDqalA+u8e75GPx0gFYoEEIFDNPjYG?=
 =?us-ascii?Q?aGkj6gL0uIw7nG7/rOXV5v/WSqznd7P0G5tXcEc/x1F991gqs7RBL7AXaUm5?=
 =?us-ascii?Q?FCCxyjyx1Cs4A7bqnfq37ceEhc9QIap6Ah+brSYtfhiIh9SNodWS5AblWLcD?=
 =?us-ascii?Q?AOT2fZgMoPEkHjJcRFJd2C+Yt62GsdO0AhYdGzPM4svoXb027gpkmRRnZya6?=
 =?us-ascii?Q?vHzX7FPPlvLP8v9h3d9SwbtVwxEVyrFRzk0b2uYNmXt4W7gK+qmqds33KIH7?=
 =?us-ascii?Q?YVihImk4DG9TC/asQLbmdopcUHwkOlKjvfshQ38zuN/CsW9LSJkDDLmyDWc2?=
 =?us-ascii?Q?rb1OMO2nFsA4UoUsbwu4Qg1stFOUPiQJJBPxFCc6o2xw9W6ARE9Q4MoourJ/?=
 =?us-ascii?Q?TBVoU/x8wHfIE3GVvET46QiybA8hJMzuanjKRp5gHSFSMgY81TKSKHeDdEaz?=
 =?us-ascii?Q?mX6NjK8YuJmUYSHcwojAlCzbqNEZZEywvFvn6lrBY85E1fzFxd1fR630xk/M?=
 =?us-ascii?Q?UgeFLcaKWSZnEGCUG334kFkl1oUGupiXk7AvqMQNnTtAqZWe01r8jozMOYD9?=
 =?us-ascii?Q?O7fTfWONhul+N6y5rs8tKbXTAuKRF1lj1vw2OlXcC0MEQPP5j8BmvAq1EJYK?=
 =?us-ascii?Q?OVxduR9MrRgZj+zdJye8jNtUrEBxSKm9cE9yCRRe544cwdo18GZkEtPuMwf7?=
 =?us-ascii?Q?nlxzF0lUhmnBZ/TbLxG9Ao4qeTlqv/JJb8cBXzzNkxNtD05oiY1NBdfank9e?=
 =?us-ascii?Q?y1nMNUnt0VoGWfTYz6HWw9r2J/TO2Sey2xUA4wy0YXRD1lAxTAaxUUmTYd67?=
 =?us-ascii?Q?UE4Zv577UN0gp7rrOrPMGsZyKX0znWa0Cn9LbjZrS2TPsbARrMUdCCFmOA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:00:41.2707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea11408-ad40-48b9-eaae-08dd8c84dc30
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

Add aliases for all I2C nodes so that the I2C devnode numbers align with
hardware bus number.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 2601b43b2d8c..c9f3724d2418 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -16,6 +16,18 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &gen1_i2c;
+		i2c1 = &gen2_i2c;
+		i2c2 = &cam_i2c;
+		i2c3 = &dp_aux_ch1_i2c;
+		i2c4 = &bpmp_i2c;
+		i2c5 = &dp_aux_ch0_i2c;
+		i2c6 = &dp_aux_ch2_i2c;
+		i2c7 = &gen8_i2c;
+		i2c8 = &dp_aux_ch3_i2c;
+	};
+
 	bus@0 {
 		compatible = "simple-bus";
 
-- 
2.43.2


