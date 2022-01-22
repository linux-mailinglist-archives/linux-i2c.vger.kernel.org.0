Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DC6496C13
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234341AbiAVLYh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:24:37 -0500
Received: from mail-bn8nam08on2081.outbound.protection.outlook.com ([40.107.100.81]:34209
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234370AbiAVLYg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:24:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpxR/+5OJCalu44bqtCAJDOM2bqIal6MCJiCVAcgdUbAhI+g0Fj6hN62iTKZ8hVLd6AlnekWHHOUagd1RhNEsPNaoqHckHO1gEvBwshXR+FVGF5Zl70k/qXHvFxfC9RQNysIm7mHzFj98K4m8Jm3nzE65kKlD23dmntWyFzpsns+XASdMDKShofCTtLpoKkHQgMD2e1Eau0utjASgTZC5wzn34gDm7qqhJeM3rfzYDlHk2unful3vFQlLNFU/awuNd5RoU0nj5RAYwWT2L7G1bC3xWeHj9yW1HgqwhkzE+0aNwFPJ5qoowGWNXF4/dhUoiFyI+zuteQ88si2OFMkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfLzBJR+bPCYLCR+uxiqXm97mJwgQ9Cs3lk45SdpzPc=;
 b=aHnbgJTp6wNWSaC2MdAecXOpnyVdeZt9RbNlxuKM8qpj1pBd+1boEx9D0I4qvN3EXk0v8y6wMvF6T5Hjbn/jFNzKUMCikFDO6B3nVxEldIgagolRNH9/O4ap5Me6mZ9MKbfPiyN9NiZSgf7iIaQnEyXJWTQty2P0qZ6b01v9xgYSJbWcktA3B/tGX0lvOpf8a+GIf6szLfnYRxG+lH0YPq/EewCT/gPAqserf0DPpJCTY2yV/jJbvKT9vlJ12rsW7ssiR7Tupf664CSWhKdnLJZrTcvnb49QJl9CkHf6qakGwTrrwfIHvwBr44aITGJUWiog+TyY5wn4Dj2sinqBrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfLzBJR+bPCYLCR+uxiqXm97mJwgQ9Cs3lk45SdpzPc=;
 b=fJWpU/EWlKNEOwwPkYjOHGjsLPqrA/dDANwnKHAxhoJbsTLkclakiVDs0gzwqjQQJRRi3kMXG8cw3fwwdS+yiDDWGK3qfAw1Q1Rcp5OloJRGsbTiFCQEmvdjAwnA9FDT8W6AaKTdwMRQQNyzVoRx+uIVQivKOCIoCaA0pNfz0QNfZy91o3WZNBT5co9xu3rm4Dym8bA7GIIrfLJJ6X7mOts7CRHaL/dwOQD6saNwSogGhZUyDk3CVHEoKD6PIw02c4xJbZV23hjWHODhsD/Qnh+W1PbhxG1grvBTSQeX4p+euYEKOzzb8q1wETeYt7fonbFrGAqHV7cuO1cksTK+zg==
Received: from MW2PR16CA0040.namprd16.prod.outlook.com (2603:10b6:907:1::17)
 by DM6PR12MB5022.namprd12.prod.outlook.com (2603:10b6:5:20e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Sat, 22 Jan
 2022 11:24:34 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::be) by MW2PR16CA0040.outlook.office365.com
 (2603:10b6:907:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12 via Frontend
 Transport; Sat, 22 Jan 2022 11:24:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:24:34 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:24:33 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:24:32 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:24:29 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 2/4] arm64: tegra: Add Tegra234 I2C devicetree nodes
Date:   Sat, 22 Jan 2022 16:53:25 +0530
Message-ID: <1642850607-20664-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 559eeb59-d76d-42e3-1540-08d9dd99c43a
X-MS-TrafficTypeDiagnostic: DM6PR12MB5022:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB50226FDDC8BE367DA1DA9504C05C9@DM6PR12MB5022.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZDyJPmlX95md9OwBtC0dBNFMuzDaMqtKLEzEAaQOickuWmvn+cADzu6x9oR6u31Wy/JpCrnvy0kAvY3AcGwGUBC8NMhq69iXSt3FVbyYx3jknVGe/l9mbXuyxAB/3SMjTkEC3s5e85coKAQHSQ5bGsdWH54188QTcqmNwLSoVlbQBTh2SbXpIfzA6MhYnK0GAabs6SsFTExIi4xZQFfDeKrM8V4nyxJCF9ua46duGWVBr5pmJrVxrAzjPBRzyP3/thC1T3uGUsImsC2xcSzetPaZ5ijfJu+gMadt7HHNS77FRg+xc2vgsUKrJncZFQgm63+j8YfJOwMahQ9zaHX1ElH91+nK5KDh8zhFAsCu79fmQFOmA1FUu7G3cPhUJL/d71g6UnFHzlmT5ER7T4hcDNog+Yb871LI0psYwzY6NLQCNaR6yN1AoNw1FILFzsD6Uz0sYrKbkWz1uq5nchMCjwmWAmdes94LWwGpmrJt3agl8x9bWuOi9W9oa39KBpu8Qx3CR3aEwATma90QSPZG9lIoQHwA6cawlyq7JgJPQLN78eNw8iu02l5PB9Je0RpXo5jHF3fj4vmNvwBYWUEOwCvk22X0YWzQezKgHer0s3SxiJZDX3TwAVH2GTL4xBuk1X6jMV1JHP4ZOnlD2+lGNGPCz0piLz3EJwo42bhbe9/e6p6u7CRmAwdQMmgxGRP6NS9oOeGMl9jAJjoI8JhPPj1a+UkrhTu77T44m9Irch0h53CAaz7Mtge8S11jB7ODxe2iu0l9SrLYmJFrppvb+bpxYXLhVArbGuzEbWeFaAhaAa+VVHJQa7IIXLdpoY/qVul/VJgZEgEqOs0QxEpXGgXUte4V7ApxwraofpZObzE=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700004)(46966006)(36840700001)(316002)(8936002)(508600001)(81166007)(336012)(70206006)(26005)(86362001)(6666004)(186003)(36756003)(426003)(40460700003)(110136005)(5660300002)(83380400001)(47076005)(36860700001)(921005)(82310400004)(4326008)(8676002)(7696005)(2616005)(356005)(70586007)(107886003)(2906002)(83996005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:24:34.0574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 559eeb59-d76d-42e3-1540-08d9dd99c43a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5022
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree nodes for Tegra234 I2C controllers

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 121 +++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 6b6f1580..c686827 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -144,6 +144,96 @@
 			status = "disabled";
 		};
 
+		gen1_i2c: i2c@3160000 {
+			compatible = "nvidia,tegra194-i2c";
+			reg = <0x3160000 0x100>;
+			status = "disabled";
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA234_CLK_I2C1
+				  &bpmp TEGRA234_CLK_PLLP_OUT0>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_I2C1>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			resets = <&bpmp TEGRA234_RESET_I2C1>;
+			reset-names = "i2c";
+		};
+
+		cam_i2c: i2c@3180000 {
+			compatible = "nvidia,tegra194-i2c";
+			reg = <0x3180000 0x100>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA234_CLK_I2C3
+				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_I2C3>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			resets = <&bpmp TEGRA234_RESET_I2C3>;
+			reset-names = "i2c";
+		};
+
+		dp_aux_ch1_i2c: i2c@3190000 {
+			compatible = "nvidia,tegra194-i2c";
+			reg = <0x3190000 0x100>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-frequency = <100000>;
+			clocks = <&bpmp TEGRA234_CLK_I2C4
+				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_I2C4>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			resets = <&bpmp TEGRA234_RESET_I2C4>;
+			reset-names = "i2c";
+		};
+
+		dp_aux_ch0_i2c: i2c@31b0000 {
+			compatible = "nvidia,tegra194-i2c";
+			reg = <0x31b0000 0x100>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-frequency = <100000>;
+			clocks = <&bpmp TEGRA234_CLK_I2C6
+				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_I2C6>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			resets = <&bpmp TEGRA234_RESET_I2C6>;
+			reset-names = "i2c";
+		};
+
+		dp_aux_ch2_i2c: i2c@31c0000 {
+			compatible = "nvidia,tegra194-i2c";
+			reg = <0x31c0000 0x100>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-frequency = <100000>;
+			clocks = <&bpmp TEGRA234_CLK_I2C7
+				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_I2C7>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			resets = <&bpmp TEGRA234_RESET_I2C7>;
+			reset-names = "i2c";
+		};
+
+		dp_aux_ch3_i2c: i2c@31e0000 {
+			compatible = "nvidia,tegra194-i2c";
+			reg = <0x31e0000 0x100>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-frequency = <100000>;
+			clocks = <&bpmp TEGRA234_CLK_I2C9
+				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_I2C9>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			resets = <&bpmp TEGRA234_RESET_I2C9>;
+			reset-names = "i2c";
+		};
+
 		mmc@3460000 {
 			compatible = "nvidia,tegra234-sdhci", "nvidia,tegra186-sdhci";
 			reg = <0x03460000 0x20000>;
@@ -212,6 +302,37 @@
 			#mbox-cells = <2>;
 		};
 
+		gen2_i2c: i2c@c240000 {
+			compatible = "nvidia,tegra194-i2c";
+			reg = <0xc240000 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-frequency = <100000>;
+			clocks = <&bpmp TEGRA234_CLK_I2C2
+				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA234_CLK_I2C2>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA234_RESET_I2C2>;
+			reset-names = "i2c";
+		};
+
+		gen8_i2c: i2c@c250000 {
+			compatible = "nvidia,tegra194-i2c";
+			reg = <0xc250000 0x100>;
+			nvidia,hw-instance-id = <0x7>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA234_CLK_I2C8
+				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA234_CLK_I2C8>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA234_RESET_I2C8>;
+			reset-names = "i2c";
+		};
+
 		rtc@c2a0000 {
 			compatible = "nvidia,tegra234-rtc", "nvidia,tegra20-rtc";
 			reg = <0x0c2a0000 0x10000>;
-- 
2.7.4

