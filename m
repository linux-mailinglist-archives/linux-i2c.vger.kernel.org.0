Return-Path: <linux-i2c+bounces-3451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E28BD801
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD3E1F2297B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DEC15F408;
	Mon,  6 May 2024 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iPcmLS2w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDE015F30D;
	Mon,  6 May 2024 22:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715036013; cv=fail; b=E3SEDRvISe3Tq6TmLyDMQzNQ62qBp+N+85rz1frjhfQkktH0ZsccWyh7She4KgXACjd6ByxKTmMyZxQBq+gB4ErraJ88ZVgoJfx4KQCJ73A3cUkJzJoUetWKzlZhkSGV+oKYyOT0mMaeEdfaXOxzqerxLemxUSC8KECh3Uu20jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715036013; c=relaxed/simple;
	bh=FurZBtDayT8KVOQWb5a+JH0WSk8OR04OieKsW5FTv0Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Omhp5/ATSP+nAYNarI91xh6u0zpEa8gqSm5plC/6hvUt/C+SCf29EGhXSUNWmPdHllWF+JdjSLG7jsYhtQPDE8gfiWjC0l3jK7Z3LoqwJNL83/Iuj/voyx3TNpJtdK/wmxCIVjYglkuSf71vPcLOxf7U94/q7tIJRfFAh5gGz00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iPcmLS2w; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPq41I1IF8+FRX3Al+xQ6Azw2ZJc75Dx3xCzBBPCL0LSjleMwbrpSOgGKZfB/ZygbiiK1FkvFsSRiVINP9p4uO12Wq6H639B6R5n9m5/NfqLCSo9RyaagPziJoNcbmRpHKKof0nofX/pynM0IQXCqjn4P7apONeVcG4znuqLvDHa/E99sj6B++32/8jh+nL0YiadgqQIbTpzs4JwVuEy8OkgE28N3SbIvkSJae9QZp73SNDODnI1zzRNi/QR59VFEgjxtpPg6XO94td7BkysmvT23YzSKYx5APtxhjK2SF+M7puLsfQi9fVbUnft9odnfqMTogzLXj+rqgMY5NJF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqoTQh6sZkzbBLNA3XYso3LxgeNyoG5U9zc5JxmSyLI=;
 b=k+0DrmMKuwDtECF7QTUvDLDfga7sa8zHj7tq/pf8Nz5wTaJlcGdf6ZL0jbXV4ilqxsKtE2/OLTEGx5ro6bxXba3nEdAAN1CoSWBeH8rXXKbQ/2Xbcx5OEFNBxlwVU77dS2OzCbei1BwKV2+FrJwjDXkohKnLQZggWo3ms3GgU89ZFAs9thW73zNnYwC0kr8Cdq5SyRN8m9fCrytQRhtU8FTGXoAkaKkt7z3vRZHDHr0Set549a/gX2gTqnedfgm7z/UPr+rnHJ9/yG84gI8MGd2KMgrSXzmumrdxQHN6BioC4ED6qDTFzntOglLXnWPFsG+I0Pk5CcmrHNNUWGJi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqoTQh6sZkzbBLNA3XYso3LxgeNyoG5U9zc5JxmSyLI=;
 b=iPcmLS2w+Z/j0u421WKtM+WAROWBKjVqW3QCl5czruKuYvKb3n9CC5BIThwdJoUWbe7sSbM9cP+wHGXRGQ9Qkz9EcUsgKbjXKl1a+91pU17UZula5q78Kybrb1QWBf2dbn4P5lfZvNcAy9omavwkVBtOIPPC9/A5au2Sv4cDCMuBVBDZgDHEyPktvKOuMmJxTtnAOa8obId4h79WuYTc9dj2vuDpYTpWlr9076bwecE9rvPb/3sDfj2OKhHZk28Zjk9xN6msMFywtGYYjeWdXJmvl7aiveIFlg6m1fYw541nO6xDIGRnPgGPrYtOw2eX0bMJqzw3eyiAU2srM/F87w==
Received: from SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::24)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 22:53:23 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::43) by SA9P223CA0019.outlook.office365.com
 (2603:10b6:806:26::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 22:53:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:53:23 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:53:11 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:53:10 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:53:05 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 11/11] arm64: tegra: SDHCI timing settings
Date: Tue, 7 May 2024 04:21:39 +0530
Message-ID: <20240506225139.57647-12-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506225139.57647-1-kyarlagadda@nvidia.com>
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: 76aa8b6a-121d-4f50-fb05-08dc6e1f5589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015|7416005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KiGl4lLu4VdN5Uvz7h02jlXCfwl1Aoo/nrdBoedEgDdEUh1IAX0moAMYBask?=
 =?us-ascii?Q?3n/DzBliXFc3c/IsDDO0bhHoekrHT31HkFQ07IQXq6M+/blPWURl5z5E52d8?=
 =?us-ascii?Q?RWLjui5VAN6vnStEmFk37u7XWiGbSkMFl1FJMk0/Lht/icPJ8cF0r4mpjBSk?=
 =?us-ascii?Q?9EFovQ5XEv0gzLhrd9zLfOJ15Iygul4yjI9IL96ZyzmiCtquQqAHuO/Z6oNQ?=
 =?us-ascii?Q?o0z+8KyQXWQ3hPhsrFACw2YXT2PTsDtdq4gCHi1KdDVSo24Dn9fLseiZcGMZ?=
 =?us-ascii?Q?Kd5JqlYwUEyfWglg6Rf9tLnnhvuC3F4ADISZX4xl4Flp9sE6sHhnoPpJLCO2?=
 =?us-ascii?Q?wzC4rumqt7NVa0ZcQ6DEit1rx/Rh8hmURKiU1iqu0mB/BqCDxbY7FgA1Hd8B?=
 =?us-ascii?Q?bxvrmQgf8ZQqM/osUO/Fy9oRN8MAoOOOMrMULw1vtIrYD2p+ftGu4+gyEO/v?=
 =?us-ascii?Q?Xr+j/vze2SlmuRGP/rZkNApBKhGGojM8Ij0id2n+1VKanOSfULClV1AXST8j?=
 =?us-ascii?Q?SdWpS7XfFH1oodHyM1S0BU0TZfDSQXw99jdRpkm8KTOfbBWI5UR0mNDXb0dv?=
 =?us-ascii?Q?7XjRPz0wCvvlrs+hV5t4UAPma1L0vgOermSbWMTWcnVgJ67Aw+O976AcpGGt?=
 =?us-ascii?Q?7aBwrYwhv96266tXIOhIkoWeIlrhKokCWV3770HvtkSBzXAx2RdKoZWGY4m4?=
 =?us-ascii?Q?G1TcSjzMEaz4UfM2hFGtQIv9Jhw6Z4H9ouTaiHsp3nfl/Fd+snOrNk1hkZzZ?=
 =?us-ascii?Q?q+tmOYA3FFZhWQavSDpEAhUt6hkiODKD+ZxGzjLv651e+r1nConb7MuG08oZ?=
 =?us-ascii?Q?ie6Kpqh/PCaQN0RBAlABVuA+qGYE7sK9saosjvkcWU8Hgn/0/n42U4QZ+WIe?=
 =?us-ascii?Q?ol3tcO4n+3vY36pegA8CEE57zybBXy1P86cPl4f02Pm3gFQyu+PuDWdaLHvO?=
 =?us-ascii?Q?zGtJSsnG5csehRUV0uM2WN29ol0KL9CvJthenuw1nIzc0ZzbJYnOsFEv8OXv?=
 =?us-ascii?Q?yKTXNp3wiZCrOCkHKaahWfhDIh6vPGg+QUlhDF1ZxYjfZcEyB1hBswJ8f/Mh?=
 =?us-ascii?Q?7kmvCFfObzP10H7qLAZ4XIb7C56veRYtnY4jXDUAo+xVVjuEi42ZlfW2IBDy?=
 =?us-ascii?Q?kvTveZyPCF7hynAIGxE+EhNewuKUd2tNz0tGc0g9CekPVqWrwLjQwrOrL6ys?=
 =?us-ascii?Q?NqS1Q5k1DVl7KbOHBLpiI50hobzhOTut9RaSdpyk59EKEkm6md+k5pT3U5K1?=
 =?us-ascii?Q?DEEoWGlMRFDjQBL2o3xR9VvF0KC8X9B7LHIe1KmCT3tu4GWvYimeKmHFEfRs?=
 =?us-ascii?Q?PJEt/bUi3AB23M5sRZ5qRFGoSygTD8mlZ5mu+e3M08MZW4WWgjPiyUavK3oy?=
 =?us-ascii?Q?Bo2orpXRb0YIpOdvELolNfxUyXLN?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:53:23.6665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76aa8b6a-121d-4f50-fb05-08dc6e1f5589
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987

Set SDHCI timing registers through config settings for
Tegra234 chip and P3701 board.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
index 832538e45797..f9a92853b04a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
@@ -442,5 +442,37 @@ standard {
 			};
 		};
 
+		mmc@3400000 {
+			config {
+
+				mmc-hs200 {
+					nvidia,num-tuning-iter = <0x2>;
+				};
+
+				uhs-sdr104 {
+					nvidia,num-tuning-iter = <0x2>;
+				};
+
+				uhs-sdr50 {
+					nvidia,num-tuning-iter = <0x4>;
+				};
+
+			};
+		};
+
+		mmc@3460000 {
+			config {
+
+				mmc-hs200 {
+					nvidia,num-tuning-iter = <0x2>;
+				};
+
+				mmc-hs400 {
+					nvidia,num-tuning-iter = <0x2>;
+				};
+
+			};
+		};
+
 	};
 };
-- 
2.43.2


