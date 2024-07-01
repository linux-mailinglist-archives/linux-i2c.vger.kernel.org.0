Return-Path: <linux-i2c+bounces-4547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A332E91E3B5
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F6121F23154
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACC116E87D;
	Mon,  1 Jul 2024 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qEU3jESp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A819516DEDF;
	Mon,  1 Jul 2024 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846828; cv=fail; b=Y3zqkr32Di0F5EuPgpYNxKAP+ynLYdfgEkdMI2H+IFi/3Apx2rIBIbtm03Uyks9bZ7rq3SBP31/Pwvpz7QfObtubFllXXgFXBBD8wHmWkATTJZOWlJ/90g5L8PEeUMHqM8EtCEOcdnd5Zf3xJDRz1ep1FxA65D4dEl/J0LPQNpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846828; c=relaxed/simple;
	bh=y/wjBm+f6K4y2iGw6Ns26MdfGiap6J9fYJM6YJ+D1bQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWi07w+ksys9wlX/ZXo95loNpWXze1UGF0YRXoP762jw/swIE31qkJkaP1Lm2It2tai8fqOKWAd4/q/+q8TOvzGlj5YpX0ShRIAR65xypEl1DnlW7i9+IQPuDAvBx9fTL2blFkw47rqXPZcBvq9TYDE8oONISoRBdTCCY5FICoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qEU3jESp; arc=fail smtp.client-ip=40.107.237.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWEutwLVt1HA26cbLEHn3Bw6pWboYJYU8FLwbAJ1DEy3wKB6DWCcZB7ZSsWblhRHaop0Thn7iAlGxu8k17Gvxz6qiFDnl+jVaO39NX2M5fVSBLuv3HPDgeekXEKaucxd9NEyVRo7+k2poqd07h8noXU6hUbb7T9aH3vt0qTrflTS3oEYJ+iF2eauTnHrBsIS7Zeztx8iMdugUPJXyOdpvtGbcvhE9sFG2RXeTJyJexwvKJ9RWxw2h76Ry0o6ctd16chc6R7I0hz0oqtqes+gW/sE7NmNSPfxpxMynOwDu2GCGxq9m0EnCKtRALSPPmeSjGe1Kd9k5GGdBpql1dCEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdL9LKNTJ9+ndhYj3bpOj5HTy0Ay9tzm0CUdzbMJwxY=;
 b=R2lfWzqB9EXriUnphMspP7wxjwwAE8bBSIPEgdE5yd6KzAZT+q1QGfrYEzSjnix0mFA5HJqs8YQ6Wb+cegk1h/LtfyoP/NZ5ATPZus/pcT4bjHXB5mgoa5gI3OW4G73mWFRATvsrnWXiJrCuV6oMVZwD5J+UXEu05JlbBbLj3e95JguCfTfXAJujyI1CqDVj+vwraI3J9FfUT3VQ1JQw3mpO7qGNyvziZLDLxz4BbQGdJ83K6dWf/0CUTSMS0a3iVDAF8Z2J+xgnPgytfHEtfvF1cYLyTSVjTsN2MRgcnKHctsHPL9VsUl8kfRcig09qff1C4z67Imm7tT7OMKJCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdL9LKNTJ9+ndhYj3bpOj5HTy0Ay9tzm0CUdzbMJwxY=;
 b=qEU3jESpJ+gjSJMttGENDLH+9gtJCE5vrn4oqLMFU3r9gsj3oXjeQTqDiWMy5n4HHhjAg8sojnD9bjHdiqwiSf+nYdaUeNsLB/wnKnot3pEad8E6HSjYQLzGZzCMYKn56SklSWc/p1Z0jSEnZemhK2bIlWEH4bP/5pjw0N5FKETBSiR/vXq6B70aLNAuEsgaOGOJhjP7K4g0g0mycT/GxCmrR64OqS7pds7yY1AiZHK7AJ3Qy2Prsm3F6nPUXl5TeBMQzYPTZnZjVp1onbAobxHmp461j6V6haO18bri6QhreJ7XdWsWuVcjkXPnOT1YkKp2vhAGOz7GGGlBy8ueuQ==
Received: from DM5PR07CA0120.namprd07.prod.outlook.com (2603:10b6:4:ae::49) by
 MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.29; Mon, 1 Jul 2024 15:13:40 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::9d) by DM5PR07CA0120.outlook.office365.com
 (2603:10b6:4:ae::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:40 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:28 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:27 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:22 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 08/12] arm64: tegra: I2C interface timings
Date: Mon, 1 Jul 2024 20:42:26 +0530
Message-ID: <20240701151231.29425-9-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e5a22e-7247-4d74-b308-08dc99e063c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FyzICOAn5+jShqQ/mWZcM6lfIGn0+k3HbOtf/O5eOalihLNoz9R466Ja+uxA?=
 =?us-ascii?Q?FPU59TDjaa6gyG5Sb+GvuWg1r+ODR8mZ7M1vMHqcatGrm3zmr/ZqM5Kx/rHE?=
 =?us-ascii?Q?CjmrCXie6G9nsCzIBcwFdvaSR1wvZg6ufcn2ZEBmAAZzjp0J2hIbGVmYfsJD?=
 =?us-ascii?Q?Jk6vO8trxwaq2O8MJuDcVx/FwTJAVrGxOIKz0bFX+XKO+6iVW0voV00cgetR?=
 =?us-ascii?Q?uVP673ztdEktT4uu4MedRmW7+eS+4eUQtZJRLADnltPEUD3N3EnswJjJ+nW0?=
 =?us-ascii?Q?dDBmkny4S8U/XUsOV6H3dKySxrGBKc1AmnmtI3S++OcwJLqESFY2rUSlpd6R?=
 =?us-ascii?Q?mlqLlHhLunUMaFZgI9uJRfM9yMsVcaOnqNJfxTWlbx2Md8qECbw3/1TDbZLf?=
 =?us-ascii?Q?PIF9J8ZzyTuE5wQgT03xU+4T76wTYp/Aggs1VtCh8eiYCAJT1kSKGimeoKyi?=
 =?us-ascii?Q?VEBaVoqLqVidhzpD6dH4fPsAh8Qeb6/RPIw3UnUph1SCkhh2kI48FhX8JwvO?=
 =?us-ascii?Q?PgrSFCphPJb15/8vUW0oZQHZv5XkATAE2KQrJypuJYfnK84s1xnEN9j6KRPX?=
 =?us-ascii?Q?y5oN/yqUPCnF+0T9LBRgBI9xOfJQzZ7zi9qkl1o4YoLnA3i7xz6QJ9OGXi/5?=
 =?us-ascii?Q?C9ad28d4PpkjA4DS9e+mF21y6TeXlVlvgtffts1ILxip+9W98LkSZ5qGBo2G?=
 =?us-ascii?Q?pGRycrjQZ7zOdcooer5sA/t2G4WtNUM+/jSMFnWAhZn26wqu8MUhFEmbMRNk?=
 =?us-ascii?Q?tM8c/lEU1TirVTbBt+tPVOXKs5YYki5ASljJhyp71hQ4VPa+SiJme8aYFVtH?=
 =?us-ascii?Q?GKvsX+df3k52I4RCI5q4aj328Id4RgrbXV9ck3gy6u3+DJ8ptEPcHiBCJu3O?=
 =?us-ascii?Q?tSeXoBxa/94hjQdpVlzvTxa+CJfJECIjIqdYxTb5fgSL5Dp9eUVVZEhx8+cy?=
 =?us-ascii?Q?AO5afqj8jxYp25EMYEPu29g9UVmjfUbvwKAyquOOPbMADjX/3N7ql+Pg/1kF?=
 =?us-ascii?Q?6Wk6NBu5It1kHUVfFiZSy7vesfaqfuo/TrHrJBQ8luYxgPDk0yoBxXqw0nHm?=
 =?us-ascii?Q?9rYWMVcLfyCO8nwWz9P1iUww7qNCzwLAHObnNH8N1vOtQYfmoWVyUTDd4nXZ?=
 =?us-ascii?Q?kWODjE25iZLbsBsSyRUKLXyxG3L51Gorq8PdnpqPllZF2qga5p8JenkrES7f?=
 =?us-ascii?Q?24OThdpzL1LgtSzZWsQkuCGmYC32ags9O4N2rauP8zq6HjvmuTKBGXurUWXL?=
 =?us-ascii?Q?ztRt4kYe/MGCmBHCX0qGiP6LZPAMne5wD7o+cM0e5T8eIZuBBS5UG1Br1Lp5?=
 =?us-ascii?Q?cHTcVdzOsmnuFfBErbpRwLYUnUplL95q2Bo3Pgy66bc7RX+aYHZHiwfgrR2v?=
 =?us-ascii?Q?3/faKC6YSWPOGconxQUW8pmKgP5AkTVxxbp+3VFqJ7pfvVfgJ3dclQQIHrSB?=
 =?us-ascii?Q?st+ALowglL4pxR6D1xnvmtBpV0WQzPX0?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:40.4702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e5a22e-7247-4d74-b308-08dc99e063c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858

Set I2C interface timing registers through config settings for
Tegra234 chip and P3701 board.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi  | 465 ++++++++++++++++++
 .../dts/nvidia/tegra234-p3701-0000-cfg.dtsi   | 107 ++++
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |   1 +
 4 files changed, 574 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 23e79a878f2a..99495e159e70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22260,6 +22260,7 @@ M:	Thierry Reding <thierry.reding@gmail.com>
 R:	Laxman Dewangan <ldewangan@nvidia.com>
 R:	Krishna Yarlagadda <kyarlagadda@nvidia.com>
 S:	Supported
+F:	arch/arm64/boot/dts/nvidia/tegra234*cfg.dtsi
 F:	Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
 F:	Documentation/misc-devices/tegra-cfg.rst
 F:	drivers/soc/tegra/tegra-cfg.c
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
new file mode 100644
index 000000000000..7e5b9c10c617
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/ {
+	configsettings {
+		configi2c1: config-i2c3160000 {
+
+			i2c-common-cfg {
+				nvidia,i2c-hs-sclk-high-period = <0x03>;
+				nvidia,i2c-hs-sclk-low-period = <0x08>;
+			};
+
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-high-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+				nvidia,i2c-hs-stop-setup-time = <0x09>;
+				nvidia,i2c-hs-start-hold-time = <0x09>;
+				nvidia,i2c-hs-start-setup-time = <0x09>;
+			};
+
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+
+		};
+
+		configi2c2: config-i2c3180000 {
+
+			i2c-common-cfg {
+				nvidia,i2c-hs-sclk-high-period = <0x03>;
+				nvidia,i2c-hs-sclk-low-period = <0x08>;
+			};
+
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-high-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+				nvidia,i2c-hs-stop-setup-time = <0x09>;
+				nvidia,i2c-hs-start-hold-time = <0x09>;
+				nvidia,i2c-hs-start-setup-time = <0x09>;
+			};
+
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+
+		};
+
+		configi2c3: config-i2c3190000 {
+
+			i2c-common-cfg {
+				nvidia,i2c-hs-sclk-high-period = <0x03>;
+				nvidia,i2c-hs-sclk-low-period = <0x08>;
+			};
+
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-high-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+				nvidia,i2c-hs-stop-setup-time = <0x09>;
+				nvidia,i2c-hs-start-hold-time = <0x09>;
+				nvidia,i2c-hs-start-setup-time = <0x09>;
+			};
+
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+
+		};
+
+		configi2c4: config-i2c31b0000 {
+
+			i2c-common-cfg {
+				nvidia,i2c-hs-sclk-high-period = <0x03>;
+				nvidia,i2c-hs-sclk-low-period = <0x08>;
+			};
+
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-high-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+				nvidia,i2c-hs-stop-setup-time = <0x09>;
+				nvidia,i2c-hs-start-hold-time = <0x09>;
+				nvidia,i2c-hs-start-setup-time = <0x09>;
+			};
+
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+
+		};
+
+		configi2c5: config-i2c31c0000 {
+
+			i2c-common-cfg {
+				nvidia,i2c-hs-sclk-high-period = <0x03>;
+				nvidia,i2c-hs-sclk-low-period = <0x08>;
+			};
+
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-high-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+				nvidia,i2c-hs-stop-setup-time = <0x09>;
+				nvidia,i2c-hs-start-hold-time = <0x09>;
+				nvidia,i2c-hs-start-setup-time = <0x09>;
+			};
+
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+
+		};
+
+		configi2c6: config-i2c31e0000 {
+
+			i2c-common-cfg {
+				nvidia,i2c-hs-sclk-high-period = <0x03>;
+				nvidia,i2c-hs-sclk-low-period = <0x08>;
+			};
+
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-high-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+				nvidia,i2c-hs-stop-setup-time = <0x09>;
+				nvidia,i2c-hs-start-hold-time = <0x09>;
+				nvidia,i2c-hs-start-setup-time = <0x09>;
+			};
+
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+
+		};
+
+		configi2c7: config-i2cc240000 {
+
+			i2c-common-cfg {
+				nvidia,i2c-hs-sclk-high-period = <0x03>;
+				nvidia,i2c-hs-sclk-low-period = <0x08>;
+			};
+
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-high-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+				nvidia,i2c-hs-stop-setup-time = <0x09>;
+				nvidia,i2c-hs-start-hold-time = <0x09>;
+				nvidia,i2c-hs-start-setup-time = <0x09>;
+			};
+
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+
+		};
+
+		configi2c8: config-i2cc250000 {
+
+			i2c-common-cfg {
+				nvidia,i2c-hs-sclk-high-period = <0x03>;
+				nvidia,i2c-hs-sclk-low-period = <0x08>;
+			};
+
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+
+			i2c-high-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+				nvidia,i2c-hs-stop-setup-time = <0x09>;
+				nvidia,i2c-hs-start-hold-time = <0x09>;
+				nvidia,i2c-hs-start-setup-time = <0x09>;
+			};
+
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+
+		};
+
+	};
+
+	bus@0 {
+		i2c@3160000 {
+			config-settings = <&configi2c1>;
+		};
+
+		i2c@3180000 {
+			config-settings = <&configi2c2>;
+		};
+
+		i2c@3190000 {
+			config-settings = <&configi2c3>;
+		};
+
+		i2c@31b0000 {
+			config-settings = <&configi2c4>;
+		};
+
+		i2c@31c0000 {
+			config-settings = <&configi2c5>;
+		};
+
+		i2c@31e0000 {
+			config-settings = <&configi2c6>;
+		};
+
+		i2c@c240000 {
+			config-settings = <&configi2c7>;
+		};
+
+		i2c@c250000 {
+			config-settings = <&configi2c8>;
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi
new file mode 100644
index 000000000000..72ce8ee5a57f
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "tegra234-cfg.dtsi"
+
+/ {
+	config-i2c3160000 {
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+	};
+
+	config-i2c3180000 {
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+			i2c-standard-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+				nvidia,i2c-sclk-high-period = <0x07>;
+				nvidia,i2c-sclk-low-period = <0x08>;
+				nvidia,i2c-bus-free-time = <0x08>;
+				nvidia,i2c-stop-setup-time = <0x08>;
+				nvidia,i2c-start-hold-time = <0x08>;
+				nvidia,i2c-start-setup-time = <0x08>;
+			};
+	};
+
+	config-i2c3190000 {
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+	};
+
+	config-i2c31c0000 {
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+	};
+
+	config-i2c31e0000 {
+			i2c-fast-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+	};
+
+	config-i2cc240000 {
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+	};
+
+	config-i2cc250000 {
+			i2c-fastplus-cfg {
+				nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+				nvidia,i2c-sclk-high-period = <0x02>;
+				nvidia,i2c-sclk-low-period = <0x02>;
+				nvidia,i2c-bus-free-time = <0x02>;
+				nvidia,i2c-stop-setup-time = <0x02>;
+				nvidia,i2c-start-hold-time = <0x02>;
+				nvidia,i2c-start-setup-time = <0x02>;
+			};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index cb792041fc62..71506c51a5ea 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -2,6 +2,7 @@
 
 #include "tegra234.dtsi"
 #include "tegra234-p3701.dtsi"
+#include "tegra234-p3701-0000-cfg.dtsi"
 
 / {
 	model = "NVIDIA Jetson AGX Orin";
-- 
2.43.2


