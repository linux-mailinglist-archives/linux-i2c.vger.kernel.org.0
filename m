Return-Path: <linux-i2c+bounces-3448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D48BD7E9
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7914D1C22BCD
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B159E15ECD1;
	Mon,  6 May 2024 22:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A4EhG6pc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141BE15E815;
	Mon,  6 May 2024 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035996; cv=fail; b=OY3GiM+fVgiegupi7mWhAh3jGc73R0xHB/yMuGkSxEBRHHqr2Detm7TJtAF3qKBWvVaq9qhbS3JDmZpfmX6gJlwuWcMG+T16AI/axbKLiXG25eGo9CgMY5l50tExQrHUtMSJ3aJqxExpBqKx1pLaYg3h0RGpi2CcSzzVCcxdFus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035996; c=relaxed/simple;
	bh=iGyO5atBVDla5HR4nmtm3MBM9+vQGyRLH1nVdXhcgi8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wni6kWvb+/c4RiovLVHJxgF46bkUEidEGByd1Bctsrr3MrYJidWO6HRYViGgEiQuQ3863uYhaoYQQNIbSOZCBsGqZU5clfg7ZGx6/w4zTZst0qdpV6TSVYUFr6qqQYcmQbbCw/SvbjE0P0YxG8hjxQjjGvOOfQLXNeGeKROpCr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A4EhG6pc; arc=fail smtp.client-ip=40.107.220.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCORBX1AuEa+B4b5Q7i5k+eyZKVMk/fyNvUE4H8zjmCb0bkfe/bn/Ix1qVXF0dmgAsYQx+10/EYvEtVrRZpSFsZAwa7DGMkO9dIANVQJmSUvHThBMXN5gThEHNu8gOUPutRttxWavTpHys7a4MfHBWY14eHbimp8rxaWHMPA5E9vne6qfTzfxO8snWrnipAd3rjzpR37lRd3IBu8kRL/VxhdIBLZ39XEdS5WSNR8sk1nX6obee0lAOOjB84egG2KQd0OXj8Aeg4WeU1nAaxaISbKgBxWQecjthYmZ47HPqop9W/B6dq3NEe7zQ4Tw7TQvK1Ewv41WRS+j4QFcXQROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iLBU+RqZm3ScG4G6B30z1j9Jl36pZlyxKWA1BOIORA=;
 b=Kn4fkz9K8/qEGDBA2fsjOdzTBO2ujiEj4qEdOqfAJcD5gklafFmZCA3cEA2gfjLwVJJbdwbykHB2KeMC7de6Ki1MpuSlqJ0Ft4nn3UutssRj3O7rSJrgcGLsn7NshSl6K3YhlA/KQjidDCa3YGxxklVyVtFBytsA1CawGdrTaNl0OeU4LvvCry4I0HO2eujLm2MjPZgqC04V7CrKpCVSWHjWwEG/GlHSNypMPToIfnCHu+nI6msiyRy3IO0zZ0ZYiNhWZVKmYFksTFiexwRZV2hKno9IBF3nC3V/a0Y8cr7YFz41C0Ki6+Dkp/u4Zg2xVvDKPfGF335EDbJTkmWInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iLBU+RqZm3ScG4G6B30z1j9Jl36pZlyxKWA1BOIORA=;
 b=A4EhG6pcuFCrpPx2Mt8AjL6+FcOz2ve6RK8vthzGDnj3n7owOG/enIO2T+U7rTEGTJJE6tDgXPZClyx3nwiE5K23o+pc0A7rI4f9998V5GYbYyNpFV0a1boniL74GwBcDM4EWe2uIN3XkjJ04en2xT2pMvSyZ5OJYuO5KOYfC5PGMdi/xCJ5Mr3vMxeRj/IX8tH+ygPlFismRqM6gYHsrkMRvc2Tg75yYN2T/YOz0fc7bHjp+p295rYiySysSyQLELv1tt4/f4mk93HJFkN6TNjvWZwfA20CFcg9MqmOkxx1AflXvBqStd0lkyUqVuthqU4nWFf0j/Md8H4Iys2L9g==
Received: from CH0PR04CA0029.namprd04.prod.outlook.com (2603:10b6:610:76::34)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 22:53:10 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::c0) by CH0PR04CA0029.outlook.office365.com
 (2603:10b6:610:76::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 22:53:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:53:09 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:53 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:48 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 08/11] arm64: tegra: I2C interface timings
Date: Tue, 7 May 2024 04:21:36 +0530
Message-ID: <20240506225139.57647-9-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 810dbd44-cb4f-43a3-9473-08dc6e1f4d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|7416005|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ikgjApASfBcBS7f1XtiKuAEY4NGogdzQXrLpfvkiQoJ44vBARBp3jjb06yAk?=
 =?us-ascii?Q?hi+tg0x8/xphOCbtas8SJp3RzB6t/m8jhIz81ykByeUT/6R1iO3zuB3fuvLY?=
 =?us-ascii?Q?q6YJsqcrvg4MSeHHq8Ogfsae6QKu7NBDEyi/c7QrNfVHgsj0TAR3taV8xP7f?=
 =?us-ascii?Q?1UsAs502eScqTYd7CT6q1u5azdgtHhdBnmYQzkG17epZS7NZoXmxt2tt+G2k?=
 =?us-ascii?Q?5mye4z2OdGQxDzWd0Q8V4Mslb7Pg0U4VLtcBRiz25lJf5AF7i9/GdZP7j68T?=
 =?us-ascii?Q?jdi4tYLMoJ16e3jbmWwdkLVkDCeni2R2T34Ilrhz2VBvNUZu9lLBDUraQYTJ?=
 =?us-ascii?Q?ow22EErJF5SO9uplDibpN8qaFvXsJNL6ZuaTzDvSLJ63l1HiYNIx1S2wVvjY?=
 =?us-ascii?Q?YVSPJbyLVu2/9tsX4hcpo4S8kUX825e9cEWw0zn83sSe/kmKhOo7KVKprETd?=
 =?us-ascii?Q?u+SihKrMiR3+AZWk23/4CHwxN5QcTlMoUXjKC/WadBBU93jUaRNR2G3Ro4sS?=
 =?us-ascii?Q?vjLpZXrrQdWvf0bD7wSCbGsxuhMIJvifpIHVcA+5m/XZ8BZYExkDlf6/yvhr?=
 =?us-ascii?Q?OntHtxMgnmGsPn5GZXkhzKISJaS9ChEyCd/P2gEy7fq8huL8IQBEprVTZ9HH?=
 =?us-ascii?Q?EpCaNmGRwIThWE64a3E4zkPJxCo3o8xC5gFHefTFTOuH6mqG41zVYNawxENJ?=
 =?us-ascii?Q?xwYEAv1XNOnGFmbUKhN8SxLIdm8h4iTuc7ssHq9HZR/9mF7L6GQIGG6cKxMM?=
 =?us-ascii?Q?bMqTldlDnk4jHqLh9khQlnJERQKvp1FlegSlXzobPO2BmjU8g/RMpJxFQ2jq?=
 =?us-ascii?Q?lEMWP/VqeftUcsxA5ybHT+KlWUV1GuHL9Un3r8xXouYKwPqmL64fYgCIdvYy?=
 =?us-ascii?Q?NmIwVUSK6JDPF1mgALftBSIUgvqc0RRkwqUnRvg3wfohob3vxtQoHzdsBAmJ?=
 =?us-ascii?Q?VzfRVnwBsCdB9mOQUnyJ4YQCO7y5YdhWY4foaWRDdkkur5KOlSoCy0eqRu63?=
 =?us-ascii?Q?P1ErmAIMVRCZ/9Qq4QgqHcyQ2UndZpOkV0fyx7iqGhUiW4SoIDEvXdIMM+Qc?=
 =?us-ascii?Q?bLMMGah9lZGfcjDqS7TR9q89vUNccZrqoD0ei5KoaRwnExl8reAp/ANPkxTe?=
 =?us-ascii?Q?fzEq6LrGu5gEnTemlELK9Bk0lH5pi3ssbcxsNodOaEQAadGsDpy4ajNci1fr?=
 =?us-ascii?Q?sz0ZKBUelQEoq4+G8VdYvuI7KTyD5fpVi6hFKVQEKeEoql9HSMqRPwrVgBe9?=
 =?us-ascii?Q?D6FDmoz7qahYtnzUoGAQp272g2/KWWScoHFUJk79WeiSz/xhFceco79/Y3G9?=
 =?us-ascii?Q?xPEG0TK2cOUMnc9wvaqpvYYm/LrBm2VjDijnzlHT5anNUN/jGJZ7ffsWzXBW?=
 =?us-ascii?Q?RBTuX4Ibmxq2lixf8M2tF2dsuJVO?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(7416005)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:53:09.9996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 810dbd44-cb4f-43a3-9473-08dc6e1f4d64
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168

Set I2C interface timing registers through config settings for
Tegra234 chip and P3701 board.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi  | 446 ++++++++++++++++++
 .../dts/nvidia/tegra234-p3701-0000-cfg.dtsi   | 123 +++++
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |   1 +
 4 files changed, 571 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index a8c0cfd1d5a6..27ca5bd9203e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21996,6 +21996,7 @@ M:	Thierry Reding <thierry.reding@gmail.com>
 R:	Laxman Dewangan <ldewangan@nvidia.com>
 R:	Krishna Yarlagadda <kyarlagadda@nvidia.com>
 S:	Supported
+F:	arch/arm64/boot/dts/nvidia/tegra234*cfg.dtsi
 F:	Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
 F:	Documentation/misc-devices/tegra-cfg.rst
 F:	drivers/soc/tegra/tegra-cfg.c
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
new file mode 100644
index 000000000000..832538e45797
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
@@ -0,0 +1,446 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/ {
+	bus@0 {
+		i2c@3160000 {
+			config {
+
+				common {
+					nvidia,i2c-hs-sclk-high-period = <0x03>;
+					nvidia,i2c-hs-sclk-low-period = <0x08>;
+				};
+
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				high {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+					nvidia,i2c-hs-stop-setup-time = <0x09>;
+					nvidia,i2c-hs-start-hold-time = <0x09>;
+					nvidia,i2c-hs-start-setup-time = <0x09>;
+				};
+
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+
+			};
+		};
+
+		i2c@3180000 {
+			config {
+
+				common {
+					nvidia,i2c-hs-sclk-high-period = <0x03>;
+					nvidia,i2c-hs-sclk-low-period = <0x08>;
+				};
+
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				high {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+					nvidia,i2c-hs-stop-setup-time = <0x09>;
+					nvidia,i2c-hs-start-hold-time = <0x09>;
+					nvidia,i2c-hs-start-setup-time = <0x09>;
+				};
+
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+
+			};
+		};
+
+		i2c@3190000 {
+			config {
+
+				common {
+					nvidia,i2c-hs-sclk-high-period = <0x03>;
+					nvidia,i2c-hs-sclk-low-period = <0x08>;
+				};
+
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				high {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+					nvidia,i2c-hs-stop-setup-time = <0x09>;
+					nvidia,i2c-hs-start-hold-time = <0x09>;
+					nvidia,i2c-hs-start-setup-time = <0x09>;
+				};
+
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+
+			};
+		};
+
+		i2c@31b0000 {
+			config {
+
+				common {
+					nvidia,i2c-hs-sclk-high-period = <0x03>;
+					nvidia,i2c-hs-sclk-low-period = <0x08>;
+				};
+
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				high {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+					nvidia,i2c-hs-stop-setup-time = <0x09>;
+					nvidia,i2c-hs-start-hold-time = <0x09>;
+					nvidia,i2c-hs-start-setup-time = <0x09>;
+				};
+
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+
+			};
+		};
+
+		i2c@31c0000 {
+			config {
+
+				common {
+					nvidia,i2c-hs-sclk-high-period = <0x03>;
+					nvidia,i2c-hs-sclk-low-period = <0x08>;
+				};
+
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				high {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+					nvidia,i2c-hs-stop-setup-time = <0x09>;
+					nvidia,i2c-hs-start-hold-time = <0x09>;
+					nvidia,i2c-hs-start-setup-time = <0x09>;
+				};
+
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+
+			};
+		};
+
+		i2c@31e0000 {
+			config {
+
+				common {
+					nvidia,i2c-hs-sclk-high-period = <0x03>;
+					nvidia,i2c-hs-sclk-low-period = <0x08>;
+				};
+
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				high {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+					nvidia,i2c-hs-stop-setup-time = <0x09>;
+					nvidia,i2c-hs-start-hold-time = <0x09>;
+					nvidia,i2c-hs-start-setup-time = <0x09>;
+				};
+
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+
+			};
+		};
+
+		i2c@c240000 {
+			config {
+
+				common {
+					nvidia,i2c-hs-sclk-high-period = <0x03>;
+					nvidia,i2c-hs-sclk-low-period = <0x08>;
+				};
+
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				high {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+					nvidia,i2c-hs-stop-setup-time = <0x09>;
+					nvidia,i2c-hs-start-hold-time = <0x09>;
+					nvidia,i2c-hs-start-setup-time = <0x09>;
+				};
+
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+
+			};
+		};
+
+		i2c@c250000 {
+			config {
+
+				common {
+					nvidia,i2c-hs-sclk-high-period = <0x03>;
+					nvidia,i2c-hs-sclk-low-period = <0x08>;
+				};
+
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+
+				high {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-clk-divisor-hs-mode = <0x02>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+					nvidia,i2c-hs-stop-setup-time = <0x09>;
+					nvidia,i2c-hs-start-hold-time = <0x09>;
+					nvidia,i2c-hs-start-setup-time = <0x09>;
+				};
+
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+
+			};
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi
new file mode 100644
index 000000000000..3eb13c06d34d
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "tegra234-cfg.dtsi"
+
+/ {
+	bus@0 {
+		i2c@3160000 {
+			config {
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+			};
+		};
+
+		i2c@3180000 {
+			config {
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+				standard {
+					nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+					nvidia,i2c-sclk-high-period = <0x07>;
+					nvidia,i2c-sclk-low-period = <0x08>;
+					nvidia,i2c-bus-free-time = <0x08>;
+					nvidia,i2c-stop-setup-time = <0x08>;
+					nvidia,i2c-start-hold-time = <0x08>;
+					nvidia,i2c-start-setup-time = <0x08>;
+				};
+			};
+		};
+
+		i2c@3190000 {
+			config {
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+			};
+		};
+
+		i2c@31c0000 {
+			config {
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+			};
+		};
+
+		i2c@31e0000 {
+			config {
+				fast {
+					nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+			};
+		};
+
+		i2c@c240000 {
+			config {
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+			};
+		};
+
+		i2c@c250000 {
+			config {
+				fastplus {
+					nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+					nvidia,i2c-sclk-high-period = <0x02>;
+					nvidia,i2c-sclk-low-period = <0x02>;
+					nvidia,i2c-bus-free-time = <0x02>;
+					nvidia,i2c-stop-setup-time = <0x02>;
+					nvidia,i2c-start-hold-time = <0x02>;
+					nvidia,i2c-start-setup-time = <0x02>;
+				};
+			};
+		};
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


