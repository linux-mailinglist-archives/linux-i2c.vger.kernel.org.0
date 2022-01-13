Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A177B48D8F4
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 14:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbiAMNbY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 08:31:24 -0500
Received: from mail-mw2nam10on2050.outbound.protection.outlook.com ([40.107.94.50]:40545
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235203AbiAMNbY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jan 2022 08:31:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwyKAf6Fhcvsg+aGk9zhFVp0P2EIRCTFjQJV5aasHEm1GxsUj4kll2JHJzNagMjKll0KoIH8RO+GEHc9S9D28fv09K7qZpM/Adkl2LkjP6ZZ2jDWmhr4Cp7wSId25grNNMuViipOJII9lJdmCzvdjKWIeQpPR7NsudhtQP01B6d6m+PggZ0U1YsTim2wpPzxFkbEn1zTDdxIOICgsVc5fe9zV4ZwZnfSFAR2YCx1HMG/O9FEcDzY82k55n9l7LjjV50bydrkwMRA0pSy9bQDWX4mgYcicqjLGb1Z8wBP691v20EdUMAS2BDnv6Rbdb//OqJ3GPHDt/Gj/piFwR0DRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfTyDCeLSGXXa2ITOorJu06nxPtHjPkcnv+kUOEn4rY=;
 b=mizgB3zs+5+KR4vIWvbmbB6B3gRzxM5Amg/6ehvYFo2H4Xcl7zkuVQ3TsKQEQYioN2YMXyIusVJbzTLhAnkHLp0boj+Kx6d0UZ/ErrmXpt7wm8YwLbag9x1KfG99iQJNOQKC8pr6FMVAExPcGJrs2Lm1fvSZRKuCOx8ZKrm+Xz6J7F3MaDwmrFAxi/dlxHfszn9cplQmZyJ7gfbYmWAp+MUWBAOz4ZezlUw3RZXHPIqtRe1avTZFXrDTOLETlVEkrY7VR7A4G5vGHDstglJsAH83NiEHAQ0TdZO7QtmLP+HuP6XBmiIEe8/uITVaB5agy5R0ZQ7G/L/LEIRQjLzCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfTyDCeLSGXXa2ITOorJu06nxPtHjPkcnv+kUOEn4rY=;
 b=cEIkarTTRErJr4drn6sD6jvkFHhFmYqkDHIEJhOkZjtAPd/+lOEfa9Wy3D/vjWA5ATO6CrAtr62Owyt3ILLFJUCHIu7zwpdzsF2Ltm4fWQi/OQfErtD3GFrpZfNBISi5gOmroboEK2UXSSoZ8tTKKb1ItAJnPgs+MNISnjaafM2F+o9fl1tUp/DxQ4c98+pcY6ihD99wJHnvpF6t6SuCMO/JOm8KmJ/op6XefpbQ9arprRstnFzyHeMoCZM28yITP/aUvTRIlOZykJg2zNpwY/oPnW9OWqXQCr6m9CHXUvClkCH85W1wCnfOvveQNLj8DzfMSD0EQ3n/sr1xsHEmoQ==
Received: from DM6PR21CA0026.namprd21.prod.outlook.com (2603:10b6:5:174::36)
 by DM5PR12MB1563.namprd12.prod.outlook.com (2603:10b6:4:a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Thu, 13 Jan 2022 13:31:22 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::f8) by DM6PR21CA0026.outlook.office365.com
 (2603:10b6:5:174::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.3 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 13:31:22 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:21 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:20 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:17 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 4/6] arm64: tegra: Add Tegra234 I2C devicetree nodes
Date:   Thu, 13 Jan 2022 19:00:21 +0530
Message-ID: <1642080623-15980-5-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c67bfa-9a0a-483f-2e91-08d9d698fd55
X-MS-TrafficTypeDiagnostic: DM5PR12MB1563:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1563C505E6F88C031F412945C0539@DM5PR12MB1563.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDZUHlXY7M1x2IWsTWmNa+hxt4Ml68YO845gaFkl+RejtAWkEKFx+NKUvVSHC/KtVsFDrs6EFmrb5Vy4kL7MUJeFJMtlXu7dew+o0ezbCrfJlDTZ0jpBgSkZbtbXNWYseKZHHRV5V/ohlYeS5lv8DS3JF7TFfqz58dFgA0wbJL4wY5f+683cp7Jq22NKBX0Fpw/hsjQrNC3SvxUneXnrvpf6iTyQ77sqRnOge+6mVy6B/eQiqV6++TYFT7vlS//mlFaHNenKk+eEhAwzxLmYABBc3IKGuGHpmHCUB2rYlCxhoBpOcnEfwU9rHbqc9MrtnbTuoRxRu8wryOXdMXYgvJZALhYfVdavPjn2qTNuKVCxVejiMxzwjpGQLGrura2J3kbqkhrd3ox/kdQyszRtGjtvO24tys0RFPF77rpKQ2yrARWq/ohtA7D6f5w3sT9Rfns9eOaq+aOTp2fqk/c4/f80Fm48zdxjERJwnYoeWTiwLMSL2jpNxAEtOiicUjSRZHSrO7WBzQ+lVG95+RUAacDOOFtnwmYh/XAxnVm/PqvUJ4OtNsNioAv82E/he559eC/9GU1WGtCyn8fO05Ac4AyvNSnZ9npzUHW1DWvD0iS2WqwWNNkCQqrqfYGZAHJY2j8JaaVe6ZdAlxkRLQR+ZtjA5lzeXKa8fRgC28o6J16mdFDqnuIC0nPwtIUMoFJjovydIj3XotZbweDV3Q6Ei3bAZ66G6HidYFkS7fmOuEhpjDThuPu34UJqgzSNM2/sUDyZSnf9l5CmOioZl9zD+lAhPNiXgDGtyUmWFnRq59B1gPsm8jOSR4kDZSR1fHPD
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(81166007)(921005)(6666004)(508600001)(36756003)(82310400004)(83380400001)(5660300002)(110136005)(7696005)(356005)(316002)(40460700001)(8936002)(186003)(86362001)(107886003)(4326008)(2616005)(70586007)(8676002)(426003)(70206006)(2906002)(26005)(47076005)(36860700001)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:31:22.1664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c67bfa-9a0a-483f-2e91-08d9d698fd55
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1563
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree nodes for Tegra234 I2C controllers

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 121 +++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 6b6f1580..51aff7d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -144,6 +144,96 @@
 			status = "disabled";
 		};
 
+		gen1_i2c: i2c@3160000 {
+			compatible = "nvidia,tegra234-i2c";
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
+			compatible = "nvidia,tegra234-i2c";
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
+			compatible = "nvidia,tegra234-i2c";
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
+			compatible = "nvidia,tegra234-i2c";
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
+			compatible = "nvidia,tegra234-i2c";
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
+			compatible = "nvidia,tegra234-i2c";
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
+			compatible = "nvidia,tegra234-i2c";
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
+			compatible = "nvidia,tegra234-i2c";
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

