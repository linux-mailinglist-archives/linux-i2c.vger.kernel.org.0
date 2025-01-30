Return-Path: <linux-i2c+bounces-9234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F82DA23070
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 15:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651573A27EE
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 14:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17161E9B38;
	Thu, 30 Jan 2025 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qFz3f1l8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9A01E7C1D;
	Thu, 30 Jan 2025 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247717; cv=fail; b=B53y7+LcNKESPsPTVUzRsvJzV08LS+lVj101/x8jn+klV3RKv31fGUozpQtcSIW+m2ZsTbOwrzg0xwiPkDyXGjXI8ZZinjaYzYx01m8KbkdLKiuOMot1Bu/iFJ//myVL04bZc5YfcLVacR12PdqDUo0V02xj+B0TXHEbGEZX28w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247717; c=relaxed/simple;
	bh=sRGacQQkb42NKB5gqQHpXhSVT4XXf3qFTefp/BNBmmA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I0nwARsX9ZLJcVJHAnH8NthKI8D+FqJa0QiwJCW8PRm38A9irCbprAuXp4ieEX97TvZq96Swqr7BkaKGHaCetvvBl23gtRKKAoQC1BAM3SugGkGa1BOVaOqOi5EP4CetYI/ELAI7Ll/rEzEvkwy71ckL5BwkalMeRVBLfTeIzS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qFz3f1l8; arc=fail smtp.client-ip=40.107.93.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaF4/i7SVY24fYXLAxawjR2Zkl5iPxPJ3Ax4ic53c2v8+TDXrvYdTB8FKtT6386XsUUt22rCSXZw/1ksoiF+KZMVcMYNVXfND70EsPfcfBCX8VGObDx6g0NX4hoKqdaUT4rPPCjGLr1GMIGKnTnvzSO6TMOVDo1vYDA6iKjWwKjf8QGKlEBvaQZsaYoyQUzc4D+KfHgpi+SY8V76cE7JaDEFMK+D6Gi/Wg+749P5hO/sqc98uRslaNODTobUMJduQzVE1vbwEDArcV4B8pjxTRg0/mLI44BV+NBe4ZH6hw23gGzomNUbo7CXsm4yrXCvQsqQMU8tGwIs6EINPsuNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2sCDiSm5MVFW8odBTrXW32viN1hyB9pA+xk0hu8Aos=;
 b=dkWciYqulqzWtaI2OTZ1dboMVLWISdfDjgbV1Sic9KN0qAYdjQ+EuBEiILFnmeEq0e8NkFFQxpF7SlATt0KyeFmmsnWxZIpmUh3PuCXXW08h/FhT5YCRgcnptTrX9hP6LsvjFd41/YXpU4iftyoHmrpJpa7u5vOY3HhWe7uzG/nYIj5ljFf7cL67ovqpKwRFqCZqaMw3awudAQ8MXphxrfcyV2HbZYlhjUq4tN6PK103HMWs4boCw6KlWf+KOnPEbDeiApWRk6zCWyNjzdSOoK/DJv76OXja8zzdr8cOe7iWT2OYlsRre0cLDyfysWZ7yT4rVhGqyM2HWJ8Z/n56pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2sCDiSm5MVFW8odBTrXW32viN1hyB9pA+xk0hu8Aos=;
 b=qFz3f1l856lgVAE/1Xbd5f5ZYOpeMlKIUD2auNCC7Ci+UHVuH/WIdtieS5u/kFkkuqZGO1CJKgJCV3nhsaAQxviz7pEOAMDmZEomOP7shy3b6jcm3xj6obFl6MxSnk7/sHAdNL3m4M+e+IjWeEGgpc/MmtC6nGNJ7p86vadgvYzM/eXXKoL6LH5waBziECG3XYmFkyf5aRvZeeHqARsyOyLsof3LifOAnPNssVbssJOL5rqJCDlP8YcOEBYQ1bR8/AMgAA8pSiAZs6khrIhKborsmx5ooiiWNWCF5XxiUZ48Nrnhb7p4Aj3KvbXWGbs5cJVv0K9mAV4+DRaPnMD3vA==
Received: from BL1PR13CA0446.namprd13.prod.outlook.com (2603:10b6:208:2c3::31)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 14:35:10 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::44) by BL1PR13CA0446.outlook.office365.com
 (2603:10b6:208:2c3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 14:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 14:35:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 30 Jan
 2025 06:34:51 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 30 Jan
 2025 06:34:50 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 30 Jan 2025 06:34:46 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/5] i2c: tegra: Do not configure DMA if not supported
Date: Thu, 30 Jan 2025 20:04:21 +0530
Message-ID: <20250130143424.52389-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130143424.52389-1-kkartik@nvidia.com>
References: <20250130143424.52389-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 93380b55-b7b6-4629-b709-08dd413b4d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0C82xKHSJIUZx0jRRY6hQmrvrnnSExPhPcpvke+W4HHHWDgINH/ULj1tp/SQ?=
 =?us-ascii?Q?cw0j7XwjlR6SFsM0SrpknhPJVrpqTlMMHiQGrhhasM6tDZ6dRAAJh0agqKXm?=
 =?us-ascii?Q?z+rcb3U4cRtn0rn3L8HRdc5ffJxD6uo6u87zZfQcllqn1v48rmKjn2+x2bvm?=
 =?us-ascii?Q?gEojQ7Hp5o9Qu+9tB9d+otD7eH3ZNk+G89b6Sw4sM4rUrWhXMbH/ZQJp/mqI?=
 =?us-ascii?Q?Mn0+Gy2DloGDQP6B9gGDx/3A8/eG/7iZaceVAh8rWH9euqPXetCtggOb0gX6?=
 =?us-ascii?Q?yg3LrHS8Qx+RF0+mDD8ENl4qvyrrz4f2+Vh8RH6PJXGLGX1WeonCoYAFGyvL?=
 =?us-ascii?Q?Ha14drBKlhBX3B+AmpYA7mevsRfrzgqIpYxSKz5fvdo8+8Wet3wZPPzTuDX0?=
 =?us-ascii?Q?BTPTjxDxzECV1a5GV1x/UiqjxP4Ic13uZJ+FhA43CJBoJ3o2opbdvME1jKGd?=
 =?us-ascii?Q?8hSdk7Cs42zr8rCk0kKLRHwEgIQj3lgTtJpzsgCrjnP8im/3kCbQVzzPFEO6?=
 =?us-ascii?Q?sabZIrSFeXfLoA92w1GVajV5Q+uNbKj95/49R3Kx3PRgoolUbQYDLfEqZ8CM?=
 =?us-ascii?Q?MRwGuVXoflUdUOiX623dvWGpE/JDrrO4tec5s1Qse7STG5m1SnQX8vBp8t19?=
 =?us-ascii?Q?Y3Yn7HlQlBSNLN559RIOck6ZqYSkHDn8HHod4eOFCUojzJbpi73Dsc4mCwNf?=
 =?us-ascii?Q?17pbf4bGUV5RpRUIBxkL9QwcGQpN/d/aoN92c65TPU6bTofO6eDxyGjrvAAt?=
 =?us-ascii?Q?Gx8Y/DTVHjOjIPc2lF9PRRSm1llU/Fqf3wxMQzo4WCuuaK9MarXeaLXyyJb/?=
 =?us-ascii?Q?z4krgxMmEddCwf9xFP1kj/Vp/VmLP+BTq2OnwsV4LYiF5aNp1vKnI6FsxHov?=
 =?us-ascii?Q?NVIPkex6VKZ0n1D+bv/EH+cB5Xu9UjD1Urq6EL4HvXvw+/bu5h44do1t3BDC?=
 =?us-ascii?Q?kAMRGGLF24ADn7ZAsIIqqJVb5VYb4f4sS50978QWlhKY40bjh/p+xKDVj85P?=
 =?us-ascii?Q?I9522GTgFSWyPxoLJKTrk/1gAi48kVtbLXNrv4CLSZiy+pyViHIgPjiqQuzc?=
 =?us-ascii?Q?IPMRrC2fZqV4RLkFHamvBoGORv8IOMmXkPkeJ/GN+hxX20RL+HhyQH2e8gcW?=
 =?us-ascii?Q?RkGeVlQsD7iTtZIg+FGEDHxOFdXq2e7uFsEf4J1muBxLfrSuP9rwV4Qsen1w?=
 =?us-ascii?Q?eLGKnLTy/1FRHXIMW6L21QLW1RbqUR3uQ0MDXBxZlwj/pfxAZfDnR/1lQ0tk?=
 =?us-ascii?Q?3jkfoQ7DD5gXJT1JIPhgrovMv2hra3Hf+hRLhe1zoewR9a2itsNKZyY+1atY?=
 =?us-ascii?Q?WtO5p/dhosB0a6TDho3y9BNNIIYeushr2H7t4SiEwzeBJBzW80kfuw8MqUbd?=
 =?us-ascii?Q?FDPVLZkTkVD6AZQ++1+QPYjwPkVh7yh/T5w4Wy4AV8lCNYthOQ5lPxzmDCtM?=
 =?us-ascii?Q?ePB/D9XQ1bL1OavlTwljvJpQfmXIHvrBeFuxhileWgM1CUGENb35iiXByTHQ?=
 =?us-ascii?Q?qfRsVAgGmIx56vM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:35:10.6042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93380b55-b7b6-4629-b709-08dd413b4d0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v2:
	* Update commit message to clarify that some I2C controllers may
	  not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..b0dd129714a2 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -442,6 +442,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		return 0;
 
+	if (!device_property_present(i2c_dev->dev, "dmas"))
+		return 0;
+
 	if (i2c_dev->hw->has_apb_dma) {
 		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
 			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
-- 
2.43.0


