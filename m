Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9CC75AEF02
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 17:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbiIFPjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 11:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbiIFPiZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 11:38:25 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47279F18B;
        Tue,  6 Sep 2022 07:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJ1mDa6RfU87XtXORQNtqFRsv7cuIBUNVDa/6un4OoZv3ZJRuIpTB+E+N1mIaopAFiv8gCkGdSBj2C3g04WaXJIPfznc6RLFRNcRKfuRb/JdVFGaalMdSZlc83IcVon4ch5fhCDhAFMZVM6VYJW6fyePDAwMJRwfrOunUkBhIoOhCDZ9Sek+Y6LPHoiwvjuFeEbosNRinD6DTPs37iZLFwqNvv9ZErEhtAtWuBUlDSpqjQzmEsDPkVBzYjTCllHEGelB8X8KAMy6G2ch5DELEjHstbE/gTlQUWKqVlZVs29uWQnXoDpTc1bpdos3dRu0Y7KDi6dWrX/zeVJwFqRdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnNkpqZi1DY29+pfxdJg2gVA6RbrLOvW6jOVAvxgTkw=;
 b=Rp4W/OeDBQpjDVGX3uju4A2zMpIyr6Gv4Q8D3G1sczV6JK/LsCjsAm6sf+JDj2ZD9SaM6WLnrnQbGfWam24taWaeBTRXOlFJ8gXxKyifstPGcfR9BO6AHkLe7Hp7BW+GoOyVSKORemdLDF1kC4u7ivNDw/m/tq09/rdEvsvB1hZCONAKV8Llk++M4ytFpq6jU28tg2iPrni7wmORIa/GhfZ24fH3oR1wlD1+W0nZOCKPj0RV+NASeaOevdJKIi9F817p18SAtePrnxr9dszrRm39zWC3rmzbBhi1tfli+qTZZSkaM6bOXHeFGOFKcYo7QMOTGsXkM0cYTiOiKPh3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnNkpqZi1DY29+pfxdJg2gVA6RbrLOvW6jOVAvxgTkw=;
 b=Aw86s9+90YNHIlEeNhzA5kc6MZSLxN7tMRRQyFcrHluq9JVU2gaEmseD6F6GW810mLWvkShrfoZFcefDYcHQWwQ0M0AdscaYbTPMt2cUKF+bCfD44sxQr4DjrgXBWQSsOq8gg6IMcxAyN7DvhqRbRod4dTJGZgI1qNKGDuOgoVXmzqCjwm+E1nrqyisYjE+dNNgMbIfGf/AX3WEZIWBgyAlUHlfLKEbOQybt0JsosxW3C277vTjxHg4SKnFAtxzQPaEeSJDdqeLmXk/NoYOHtM7QTTEsFbfqgUjSSWd0ge3KD8wWbBBmuzPu31ejbCj/yC57NgKU13C4VK9rYr4DcQ==
Received: from DM6PR14CA0042.namprd14.prod.outlook.com (2603:10b6:5:18f::19)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 14:47:55 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::14) by DM6PR14CA0042.outlook.office365.com
 (2603:10b6:5:18f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Tue, 6 Sep 2022 14:47:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 14:47:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 6 Sep
 2022 14:47:55 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 6 Sep 2022
 07:47:54 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Tue, 6 Sep 2022 07:47:50 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <devicetree@vger.kernel.org>,
        <digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <robh+dt@kernel.org>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 2/3] arm64: tegra: Add GPCDMA support for Tegra I2C
Date:   Tue, 6 Sep 2022 20:17:15 +0530
Message-ID: <20220906144716.16274-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220906144716.16274-1-akhilrajeev@nvidia.com>
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18263499-89f0-4be1-1d24-08da9016c8c1
X-MS-TrafficTypeDiagnostic: IA1PR12MB6601:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGLvSLbc3p0+Dxm8PO6VuKPy3ec2wAWOqEunxhx5fK1nc9p8p8cdi6i7nOKEKF7R/zWYxHoft5Jj0zytGOJc8k8pGF2lM87N8ME2qhfXWCFYDfjtzCvntLP5EkmnfBYYWuNs4UEphQt22QvFibcDGIT6mJ9LOcoIbP7WxEivtuvdUKT21WTSmy5DhXSXjIlOwBLlNgEuULFm6uK2D8yXISQ9dcnDeiA59dgfti1bkP6KzwwJz00xsV29EYT8XSDRN5IAxojdzzGMc2oom7RqJCDS0Nmi0UNq6SopRok45+VEsIokoTgCn7VUfbUJOLgXg8LpNhZel2TGXjdSJa5UsEmSdVeKNOfHLLh8rRSqjjikSfAHdEOpAc5nyy1tRsjBDwnLH0IQ1nxTNLXQeX0gAIqg8+dS0J3eF9CMwxQJEcV6cMNXZAcMYNfqx2NIj0F9WE0lgavD1MLohSf1BZKlnSKbLv7eUCvsMw0Bvqe7VGH23ay9GbCxrhopt04rAuXBrrbtYxjaonAkT7JeYw1T8P8Q7Y5cnlkAnROTV4nua+A2IIbuc6OYOcYwYjn8n72UblxloHT23Pker0nSMTITtZpCzgZbLREqQg+450dqSI4FY+LqJIgF8MUs4RIl6vhf7x4VYnyarLn3hg0MPF6KH5T2a+jWDisX06ELkbcoYHscXAfmpjLTzejtD7BiiMfBwn0ex+Wg465P3mnWQhx953yAGlnF24n4vewefHgjxXY6KkIT1v1kVPAl4duMU/7l7D1rbb7Lw1WP3Yc7jJtYs6S4qhEfiPmlKP/l+UqRJUu1ocOwTgijaDAz0cqbFpvSibiAYl1r6fvFmYS7LIjRRzU5+dpNRJQXKYA/vre4xyRp1eCluRsTbLKtlaDRBReR
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(40470700004)(36840700001)(8676002)(356005)(921005)(41300700001)(2906002)(36860700001)(1076003)(36756003)(7696005)(81166007)(2616005)(336012)(316002)(110136005)(82310400005)(186003)(82740400003)(83380400001)(107886003)(8936002)(5660300002)(47076005)(70586007)(40460700003)(426003)(70206006)(86362001)(26005)(4326008)(7416002)(6666004)(478600001)(40480700001)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:47:55.6875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18263499-89f0-4be1-1d24-08da9016c8c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add dma properties to support GPCDMA for I2C in Tegra 186 and later
chips

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 32 ++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 32 ++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 ++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 59a10fb184f8..3580fbf99091 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -672,6 +672,10 @@
 		clock-names = "div-clk";
 		resets = <&bpmp TEGRA186_RESET_I2C1>;
 		reset-names = "i2c";
+		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+		dma-coherent;
+		dmas = <&gpcdma 21>, <&gpcdma 21>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -685,6 +689,10 @@
 		clock-names = "div-clk";
 		resets = <&bpmp TEGRA186_RESET_I2C3>;
 		reset-names = "i2c";
+		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+		dma-coherent;
+		dmas = <&gpcdma 23>, <&gpcdma 23>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -702,6 +710,10 @@
 		pinctrl-names = "default", "idle";
 		pinctrl-0 = <&state_dpaux1_i2c>;
 		pinctrl-1 = <&state_dpaux1_off>;
+		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+		dma-coherent;
+		dmas = <&gpcdma 26>, <&gpcdma 26>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -733,6 +745,10 @@
 		pinctrl-names = "default", "idle";
 		pinctrl-0 = <&state_dpaux_i2c>;
 		pinctrl-1 = <&state_dpaux_off>;
+		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+		dma-coherent;
+		dmas = <&gpcdma 30>, <&gpcdma 30>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -746,6 +762,10 @@
 		clock-names = "div-clk";
 		resets = <&bpmp TEGRA186_RESET_I2C7>;
 		reset-names = "i2c";
+		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+		dma-coherent;
+		dmas = <&gpcdma 27>, <&gpcdma 27>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -759,6 +779,10 @@
 		clock-names = "div-clk";
 		resets = <&bpmp TEGRA186_RESET_I2C9>;
 		reset-names = "i2c";
+		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+		dma-coherent;
+		dmas = <&gpcdma 31>, <&gpcdma 31>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -1176,6 +1200,10 @@
 		clock-names = "div-clk";
 		resets = <&bpmp TEGRA186_RESET_I2C2>;
 		reset-names = "i2c";
+		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+		dma-coherent;
+		dmas = <&gpcdma 22>, <&gpcdma 22>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -1189,6 +1217,10 @@
 		clock-names = "div-clk";
 		resets = <&bpmp TEGRA186_RESET_I2C8>;
 		reset-names = "i2c";
+		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+		dma-coherent;
+		dmas = <&gpcdma 0>, <&gpcdma 0>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index d0ed55e5c860..9176c4b27133 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -805,6 +805,10 @@
 			clock-names = "div-clk";
 			resets = <&bpmp TEGRA194_RESET_I2C1>;
 			reset-names = "i2c";
+			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
+			dma-coherent;
+			dmas = <&gpcdma 21>, <&gpcdma 21>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -830,6 +834,10 @@
 			clock-names = "div-clk";
 			resets = <&bpmp TEGRA194_RESET_I2C3>;
 			reset-names = "i2c";
+			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
+			dma-coherent;
+			dmas = <&gpcdma 23>, <&gpcdma 23>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -847,6 +855,10 @@
 			pinctrl-0 = <&state_dpaux1_i2c>;
 			pinctrl-1 = <&state_dpaux1_off>;
 			pinctrl-names = "default", "idle";
+			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
+			dma-coherent;
+			dmas = <&gpcdma 26>, <&gpcdma 26>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -864,6 +876,10 @@
 			pinctrl-0 = <&state_dpaux0_i2c>;
 			pinctrl-1 = <&state_dpaux0_off>;
 			pinctrl-names = "default", "idle";
+			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
+			dma-coherent;
+			dmas = <&gpcdma 30>, <&gpcdma 30>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -881,6 +897,10 @@
 			pinctrl-0 = <&state_dpaux2_i2c>;
 			pinctrl-1 = <&state_dpaux2_off>;
 			pinctrl-names = "default", "idle";
+			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
+			dma-coherent;
+			dmas = <&gpcdma 27>, <&gpcdma 27>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -898,6 +918,10 @@
 			pinctrl-0 = <&state_dpaux3_i2c>;
 			pinctrl-1 = <&state_dpaux3_off>;
 			pinctrl-names = "default", "idle";
+			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
+			dma-coherent;
+			dmas = <&gpcdma 31>, <&gpcdma 31>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -1565,6 +1589,10 @@
 			clock-names = "div-clk";
 			resets = <&bpmp TEGRA194_RESET_I2C2>;
 			reset-names = "i2c";
+			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
+			dma-coherent;
+			dmas = <&gpcdma 22>, <&gpcdma 22>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -1578,6 +1606,10 @@
 			clock-names = "div-clk";
 			resets = <&bpmp TEGRA194_RESET_I2C8>;
 			reset-names = "i2c";
+			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
+			dma-coherent;
+			dmas = <&gpcdma 0>, <&gpcdma 0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 81a0f599685f..5852e765ad90 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -737,6 +737,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C1>;
 			reset-names = "i2c";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
+			dmas = <&gpcdma 21>, <&gpcdma 21>;
+			dma-names = "rx", "tx";
 		};
 
 		cam_i2c: i2c@3180000 {
@@ -752,6 +756,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C3>;
 			reset-names = "i2c";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
+			dmas = <&gpcdma 23>, <&gpcdma 23>;
+			dma-names = "rx", "tx";
 		};
 
 		dp_aux_ch1_i2c: i2c@3190000 {
@@ -767,6 +775,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C4>;
 			reset-names = "i2c";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
+			dmas = <&gpcdma 26>, <&gpcdma 26>;
+			dma-names = "rx", "tx";
 		};
 
 		dp_aux_ch0_i2c: i2c@31b0000 {
@@ -782,6 +794,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C6>;
 			reset-names = "i2c";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
+			dmas = <&gpcdma 30>, <&gpcdma 30>;
+			dma-names = "rx", "tx";
 		};
 
 		dp_aux_ch2_i2c: i2c@31c0000 {
@@ -797,6 +813,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C7>;
 			reset-names = "i2c";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
+			dmas = <&gpcdma 27>, <&gpcdma 27>;
+			dma-names = "rx", "tx";
 		};
 
 		dp_aux_ch3_i2c: i2c@31e0000 {
@@ -812,6 +832,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C9>;
 			reset-names = "i2c";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
+			dmas = <&gpcdma 31>, <&gpcdma 31>;
+			dma-names = "rx", "tx";
 		};
 
 		spi@3270000 {
@@ -1109,6 +1133,10 @@
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			resets = <&bpmp TEGRA234_RESET_I2C2>;
 			reset-names = "i2c";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
+			dmas = <&gpcdma 22>, <&gpcdma 22>;
+			dma-names = "rx", "tx";
 		};
 
 		gen8_i2c: i2c@c250000 {
@@ -1125,6 +1153,10 @@
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			resets = <&bpmp TEGRA234_RESET_I2C8>;
 			reset-names = "i2c";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
+			dmas = <&gpcdma 0>, <&gpcdma 0>;
+			dma-names = "rx", "tx";
 		};
 
 		rtc@c2a0000 {
-- 
2.17.1

