Return-Path: <linux-i2c+bounces-4551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181091E421
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81755B2B015
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93CD16F8E1;
	Mon,  1 Jul 2024 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nCu9Fefu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B116F274;
	Mon,  1 Jul 2024 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846848; cv=fail; b=HVZ6dPCrarbCTE5vpca7WrFrLouTlwFUuduXxsYbcRHOXeR5J0puDifPEtMoFb06/WahuCxGp9vEHRb8juxyj+fVEZq245qruCZkFSRVcA8NUeZFa/t+XClWaF/if8LJnZyxUxKr4pDE/wMblejb7ahQ9MygjYSNynrK6ZVf004=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846848; c=relaxed/simple;
	bh=w8nOHJEzyzx/rqGB186Rg9RFwoQRrfLzbqfBMd0Rt+E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VFCWiyG0IqanSvqLyM5YmiREcLSORj4X1K1sRwarWVCR5NgpOglfpT3azrQS+20y4IWnPuzAP0ecSqCCQ2wVqde7ubzLORXAjZUrWDzCk9FJYamCoHJvZJimcenJI8KezRrai619SISjfDRMscMhvzDsOFo5fpbHq3lUfYXjdO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nCu9Fefu; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2+eZewIN/alsvEdtVOWpjUubvBdO+PJ/ZO4EMAw8UQcnE/dsFqMVvqdClNEBz6HJdCfGp4Rti56zTIhaXbOe9dutObIFX/oBLDnUloWotzyB91Z2DRBNSq5qP94ENUSQ7KPKJMObyPLcgxxm0DDM4I1K1S+Z1G9jloeMMhvhtnK4Nzzzc0Lswjgh7Z/AaB0Y5hhtuUXjJd/30FD4qqE8L+NJ1WavHsvaND3lyay2QRxrNCD05d2cNiUnU6W4lQBllUlS5zBZ9fKOnGUrYmfUPQRxueCR03b8DxpTQmq8fQdXxW5PIgr2vxt95L2uB8Uxmvi2dAhlb8+IT6RpDFXfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG9bitokcp9htrBGCsfTlwMtj+UydWce9WL2H2+Su2Q=;
 b=h+uHqVSeg/AQda/GQhJPtEaG8pJlAnGvzF9CDIg4dafWtwspGia9ZEd8e3stYqFw3uCLCTctQLWmxYjpltI/YjmBkB+Gq9tV5ACP7lRrs1wimAj8P+ddPSi659P0+Uy85D/CyI+75qx2OKUz+5iZRu5CijPU7C1hW60pBDyjJlojW3lgWFLZrhnXClvsouhtV481hI2FLKCURFuJfhtbBYHRvsJstPJx6vmG1ZcCPs+mfPIvBvabQ7NeRuuB03Koz5HMjTA5UjDAeMTj0H/DV5mrXtSmIXq8xuFZ1Bab+rWiwrKHxZtUYd4ClD+mJGwqZBuHgwwPCf58B0UwV3fysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG9bitokcp9htrBGCsfTlwMtj+UydWce9WL2H2+Su2Q=;
 b=nCu9Feful4So1y3ZnZV91R+3tV2/t+zFht7GsTd8m+1ewDt7PEWXT9vLWhOYKpKPPe35a7JUQx/TulHvm+c+h6eRY8b3KTQvJW7TOYNJSW75pG8aclJ52xmBe+xHWqQzuQ/vYP7yHkIH0ZD6vosOL5SjIlNMgYB6/BaA+GLsUPTOtz9YkyPfcLmPBxsgykrFv0k6n0Oh81b7ELmz4QzWakxwrawrIxqFRu/e1WcPUl+u31wiZmG+rwfn/Jg2wS595LCXBNgaSgeCsD8wf2xYVGBcLWRT0oSremnHfAHitpP1zHmNY/ctSEfoGOA5x+vAL1ANv37ZNIRgvfrdNZK8Mg==
Received: from DM5PR07CA0095.namprd07.prod.outlook.com (2603:10b6:4:ae::24) by
 PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.32; Mon, 1 Jul 2024 15:14:04 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::29) by DM5PR07CA0095.outlook.office365.com
 (2603:10b6:4:ae::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Mon, 1 Jul 2024 15:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:14:04 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:49 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:44 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 12/12] arm64: tegra: SDHCI timing settings
Date: Mon, 1 Jul 2024 20:42:30 +0530
Message-ID: <20240701151231.29425-13-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240701151231.29425-1-kyarlagadda@nvidia.com>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 36177853-95f8-4dfe-fc22-08dc99e071db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dx8vdj0yP66t3L7F+Xsdt6AId6IUZxUh5+0knHHMMIc7pbjTsmMkyUuJGZXG?=
 =?us-ascii?Q?CfAvNul+U4ix6+4yBlL3hh3ZFpF6kkVv4CmvrcCpe7QdOel2hAeGNMlBw0KN?=
 =?us-ascii?Q?WrAuQn1DJph04+xYPdzMZg3NEIZX+GwAJKZOpP5jjwzQD4zVbrfKM6hpltS7?=
 =?us-ascii?Q?RhpftnMfrbL9ECgpVFKD7QCuNgTYkEkZn46Au5qY4iCmF/J85gR+nr9bSI4k?=
 =?us-ascii?Q?2dSjXawTWXOW/fD4o7iAQg+WtOsekGjIpAb1IV5qjO/mgEFPkuM5e4wYwBVI?=
 =?us-ascii?Q?sIhD5scfxFigxrgrTQkCs1WkXKphetwmJ2WcXlUKw0y0JZBt4h0WWtHRd0OD?=
 =?us-ascii?Q?0AariNLBotL8woyfr+TajEy4+fACZsmFf7tsbeaYxU930amV7PoBG4rUcqLQ?=
 =?us-ascii?Q?uM5Lw1KETWSAp1qaEuYCfpJUhDJTgC56WULG4QM2JWxgvsIxnafDT6LW3m00?=
 =?us-ascii?Q?uHDyLCbELLxu5aAI93xlRlSdY3E4ZnxKVVDaUD8/lBP5pIJtMmm/lMsj5BRS?=
 =?us-ascii?Q?lMTyKIOjeYisrt6hK47D/dytyTo3MMDkRtLfF8/E+84LvKvUi/R/Tade0EaJ?=
 =?us-ascii?Q?Od5OHLCcdM7APpubzaUtR01qtaQwggasIRyCtF7hShhLX6A0yFMDfws9WKBI?=
 =?us-ascii?Q?kaijsj2vdFd+tcoPBmMC5BqZwzGsoRr+8dcfJYEHUZF+T2z4Nsrr8fXns4GE?=
 =?us-ascii?Q?wL2Icos3CDaQmHiTd33QdISXXlJZrGDT6O1s4MlPcL8XuM71ddnR93+BeqDf?=
 =?us-ascii?Q?mpkCDi5FyWrZgLwJ29DW8lxsNMdx+x6hBYEl7yNoZuTkPNUhETr2drLkId5i?=
 =?us-ascii?Q?oBTs7l5O03NBH1wNvh86fIdqSY2DKqyu6WFqGGiPmRlOi/q2IYntKQ/kQobN?=
 =?us-ascii?Q?segPo7UAaHpV/YPzXfGTN6rM7OiLBKB8ta/nvVYoj3e3Su2tjHxA5/8EDtIy?=
 =?us-ascii?Q?iYlXqj9GxR6F8Z2M3WrTiId1YNwecdNf3j8pVUIHKnQoywMGtcvUPXg4NOX+?=
 =?us-ascii?Q?HsBUIKw8tFp8Ka5SVua2HXKJXKH19Xwy9krQayjuBNBTa8QSiHVIrazgfOGi?=
 =?us-ascii?Q?gk2DM32Q3TGys7kVVR38qAR1jvA9gOJuKjFqLu30pkj1I/0SgAmRml9HZdBL?=
 =?us-ascii?Q?hQfrWVbxbG3M4zPJBhW52sBweRlZ2Aq2m503EtpcrbCUmX1ot6g2ZcNztOwC?=
 =?us-ascii?Q?+2HYMqsc87S5mf2nh+i2jxZUEgMGX9MnvEFHdes+xm8BrTHFcStBRzzKUsDZ?=
 =?us-ascii?Q?9BLSk4WaRQNBbEQVOnZp4YW9co+utWzPfzsU0uk7aprQJbrPRs6p0RG+H2HQ?=
 =?us-ascii?Q?C41kA0m6zMLQ8FinM9+c9wbwbOIWt3YdWsSsnnW1nQ0wEu3Wp4APQN0Qlj9+?=
 =?us-ascii?Q?sty8JDhJYzXpMXbVlPNZXWDJSgHrBrPBIpLON4R49yfS+hxiJgQE8ImOZQ+E?=
 =?us-ascii?Q?a4hzTTRUPMtXfGHj+bZjM0mmBzKwOdnX?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:14:04.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36177853-95f8-4dfe-fc22-08dc99e071db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174

Set SDHCI timing registers through config settings for
Tegra234 chip and P3701 board.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi | 36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
index 7e5b9c10c617..30c125636123 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
@@ -426,6 +426,34 @@ i2c-standard-cfg {
 
 		};
 
+		configmmc1: config-mmc3400000 {
+
+			sdhci-mmc-hs200-cfg {
+				nvidia,num-tuning-iter = <0x2>;
+			};
+
+			sdhci-uhs-sdr104-cfg {
+				nvidia,num-tuning-iter = <0x2>;
+			};
+
+			sdhci-uhs-sdr50-cfg {
+				nvidia,num-tuning-iter = <0x4>;
+			};
+
+		};
+
+		configmmc2: config-mmc3460000 {
+
+			sdhci-mmc-hs200-cfg {
+				nvidia,num-tuning-iter = <0x2>;
+			};
+
+			sdhci-mmc-hs400-cfg {
+				nvidia,num-tuning-iter = <0x2>;
+			};
+
+		};
+
 	};
 
 	bus@0 {
@@ -461,5 +489,13 @@ i2c@c250000 {
 			config-settings = <&configi2c8>;
 		};
 
+		mmc@3400000 {
+			config-settings = <&configmmc1>;
+		};
+
+		mmc@3460000 {
+			config-settings = <&configmmc2>;
+		};
+
 	};
 };
-- 
2.43.2


