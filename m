Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD5F497DBC
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 12:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237269AbiAXLSx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 06:18:53 -0500
Received: from mail-mw2nam12on2078.outbound.protection.outlook.com ([40.107.244.78]:12417
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237227AbiAXLSw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 06:18:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S92Z2oqpcEKtXahDxbjFsD77cBjDCTA2rq+W8h0nbBkiIBdk9hCg0A4MYqCgTDVYiHI7AAOq2NWoJm5gkEsKHDVIEQJ9lIEYTDQyl0536YN+1HbXyfL6MATprmaHcc/iXu/a+qSeQlXU8wrEOTq3Yl15GJCfR9UuHler1TQm5XdR5gr/Sj+vk4x0+0AaS9/VvHYqBcoPotzUGcuAFAWrRk/xhZNU/xGSLIkoV/y84sHUZ5Plp4NX1aC6OgFacOGsI04aXDEwbaSpXVZdlFZdPEVCUBV2mjoS5Maunux3IcdXU0aKauWZoTVd0JzD1qMcV5ReCTFR6hCEU/uvf/W5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfLzBJR+bPCYLCR+uxiqXm97mJwgQ9Cs3lk45SdpzPc=;
 b=I2KSv/pSeAsN8Cu7xW2t1+ztJMsIF+6bwgw80qeYQVzdW5+rqB3Q3v5WUQN5eL4KQqmhVB5sidOtnIr2ig7Fuibjaam3zXfRaMtvz3ZYz3UYhz1KTq+qxvPtHpRfGnXCbvMUre5Lsg0Ag0AOYrGpj3E+nSHsoyssWHHUecaqMFcHDcLBKZiHzchHkpZxmDBkNXc5U/a2ESRkHFte6jDgivwtSnHMjcdg+KDmaElO8OMziHW8fUgO3mrlu2sSGOvS34M60LPFI1By+xzo8N40G/Brl4bkA2u1l1+1pwm8CZOauIu9oWigrIRpeiyFPjlyUpvKWD1MkOzhwt+y4qeo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfLzBJR+bPCYLCR+uxiqXm97mJwgQ9Cs3lk45SdpzPc=;
 b=I07ohjL0uzBPr+8hooVF2mbnCcyc4WsC1VFojvH7DEUWuM/Iw6ERTUsXHRSLt46KZQwATP9wikcm59Xkk14/peOvwRNSExjSIkEytd3vk0CxF0142BH1IYEZFHmPAD5L1hzT6ioL0ioiSOXhTE1qJv7nFZ73LDsADZjE2W4ABZADlmgJ1zn7cgwe4EDawXpAJZqwYDtJXlbSOyTcPlNk1fDq2U44WbP+RaK0Y1NrV2NgHHuKYm86OIf10nGSqzWEyfYyoOPdPtjn3qeFyXISmg2Xr6qzmj94owJupCpmHEWokc66hVZQIvBaXuU9JiPo0eQwTgMEMvzHJKZheseSSQ==
Received: from MWHPR13CA0024.namprd13.prod.outlook.com (2603:10b6:300:16::34)
 by BN6PR12MB1554.namprd12.prod.outlook.com (2603:10b6:405:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Mon, 24 Jan
 2022 11:18:49 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:16:cafe::3a) by MWHPR13CA0024.outlook.office365.com
 (2603:10b6:300:16::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.4 via Frontend
 Transport; Mon, 24 Jan 2022 11:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 11:18:48 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 24 Jan 2022 11:18:48 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Mon, 24 Jan 2022 03:18:47 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Mon, 24 Jan 2022 03:18:44 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v3 2/4] arm64: tegra: Add Tegra234 I2C devicetree nodes
Date:   Mon, 24 Jan 2022 16:48:15 +0530
Message-ID: <1643023097-5221-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
References: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a19edffa-137e-46a6-a4c3-08d9df2b4b28
X-MS-TrafficTypeDiagnostic: BN6PR12MB1554:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB15542B656E680BB76EEE9418C05E9@BN6PR12MB1554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Ya0mquiiiRhgAnFHdvUzJqAvNLYWNRxmnM48nTa9PF2G0JbRSChA/dm7sd0paAjA49r4+rDgaLXmHGVyw2AgybsmHuZZtFlvtqKKrjWy26X3shp0MgA5+kk8iXjON9SXsFka3mYDFkoJIj/nK49G3ZgHF2VabsPvdNBME61wspLcx54Wb15eNuufP4FCFM2p3tvMr+ZrQi/zBI+2eELUKmnpuwE/3eVKSOv8Wf+a1n2hsixj00ez2yEBdrp5DALFex2iZFS8Jt03z6D8yR5bsjekX9HYZIeJeaIw2jLOIkP6p/LKN8tcI6FLAuuTsIccJ37tntGnfHjYFADBAGzJzKPomvQCtbiHjfB3MI+XQBumPnOy0GYphFhjf3EFqVxap4HqB9QKCqEg2u/ZUv21xuHk1J6JB6UUWqrvocKSmXDuOpm5gpnqHIv+qzYIqY1Hm3XosbIJffifRw1yluM5HIR6OXY42pg1gi3SBq4N0XKp9HkndOcu1X87z3IigolrMDkpI4X7t2v47zEChFdiRESwTAeCM21ceIVLo6N3tFdXt9PNkaLzCwa0PV1HZtnKkNndO1t4/O15jfA9JSGIIZ0ZQ270S8/EfZ+DcLHNA6hyEAx8ZtTb3rXqxtEdcXdJwmp0E6c1+lMK36nbQVXF+KuDg3l1yRVeRn8/I9ZugjNhUeO+SR5syScm+iUGb4pDUIaY0cWxFhUEuqsYemi+tu55JJQ9SkiquhZNhFuQb6890bVIN3s0mRrBF8sG5Mq1RxI9Bjc1k20JUIAkd7s0tnc0IYzf38AEpWKzaGUJZZ4jJbn+FAaqHUPBgFweguIKZpIkmFoMmBKtDU9JEIXxhIJX3CcsD6YvtjXP08fXTs=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(8936002)(70206006)(921005)(47076005)(8676002)(70586007)(6666004)(356005)(107886003)(83380400001)(5660300002)(36860700001)(316002)(7696005)(36756003)(86362001)(4326008)(110136005)(186003)(508600001)(336012)(40460700003)(26005)(82310400004)(426003)(81166007)(2906002)(2616005)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 11:18:48.5928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a19edffa-137e-46a6-a4c3-08d9df2b4b28
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1554
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

