Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E59648D8FF
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 14:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235307AbiAMNbp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 08:31:45 -0500
Received: from mail-sn1anam02on2081.outbound.protection.outlook.com ([40.107.96.81]:2382
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235256AbiAMNbh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jan 2022 08:31:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZ+hsSPqQYOPug0MQLlWPYw4sM7Q9Ctu5iw7gmn7ICQo20gsokJCAkwIQ6F5e0djqCQJqkJk1XdjXJXZVeeh9VMeLYUsZ+7uEy/VuYqY9uU2WrJLDhgjeVuP9/Y/SyVGu+gBXFn9eXIbXPnDfudG1Xb8tuZbq8zvpl/jVA2O8zVWeTFMro9hlcc4uWAbfivMhItCDt1Zt+uykjXQeSaoFKsXdrQ4ol9RG+0LuoPWyzdalkI8BP1YgMADw1Iv3RlFzbWuP7umdkC4/FTsuwYstNImsaVZAhpg9bWN/ZbRDfDypQD2eRwsKeBsgXn8czQIl4/hNcn2ExYH24Hju3azkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHuIrPSvJ4+5J00B2CJ0CvQxaFTcdUCv0fV7VpP5wf0=;
 b=SS7/m6EkeuM/Q3/o/ug5wXVnFIS1ZTzT/rTV/2arZdME5hkUn19L9rkCr0J6SSO75/I1hnSbzknvflAclwq/FlPwjDHjBlbZkKGtk5aeWbD9PXIixex63ZY72I/xVg3EZUXk7HnXlFUaWIZRGNevEoEqjNumN5vwaHvScwhCyljF1+warxna39Vh/AnbFC/99i2OQZUwhocngfzKJS2wD95hFZx46vd7zSau+00+phv7elnu+sYNM+/qZT6VHxL57BtHb8O5ErmAaTZNn9JV8pF7cZAKfdnEcDiHZkxXGaaGyf39ZO/xf/nQI3dkeDSBIUEdkSzXu5Hl2y/hipP/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHuIrPSvJ4+5J00B2CJ0CvQxaFTcdUCv0fV7VpP5wf0=;
 b=KYaoIecU5xfQ9bJXCe1NK3MDiL2po4AgJw1pgTnk8tDu/Lu1Z3t40AV/aUOAOheeCoV9AasUgurpqvqWtSMTysIvxAXTgpmL8bYqQBMdTOLApYcoGuSUhjEtnY0yAnr0HpixKUYc9qz8tF4tIxehD1pteSNaX0Jg+iiv4S0F5ubEKUmZAS/Qn5HyVSisZ40lMP+3rXMXd0Z7PkxFkcoNFsvxoHussHmN2bZ/ZBdaUThTnz1RZacmRilHMPGKPDx28JpUaqxgIS+5zXx9fUpJfkyYg6escifK5J24+GY6Z7hyqY7G7ud+BHzpHhqJzxwNMWBwIE0fK7wrucoOaSeyYw==
Received: from DS7PR07CA0024.namprd07.prod.outlook.com (2603:10b6:5:3af::6) by
 MWHPR12MB1261.namprd12.prod.outlook.com (2603:10b6:300:10::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Thu, 13 Jan 2022 13:31:34 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::6b) by DS7PR07CA0024.outlook.office365.com
 (2603:10b6:5:3af::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 13:31:33 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:33 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 05:31:32 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:29 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 6/6] arm64: tegra: Add Tegra234 PWM devicetree nodes
Date:   Thu, 13 Jan 2022 19:00:23 +0530
Message-ID: <1642080623-15980-7-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 193263b6-1446-4061-30cb-08d9d6990441
X-MS-TrafficTypeDiagnostic: MWHPR12MB1261:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB12615F50C811CF92C5AB096CC0539@MWHPR12MB1261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ynKkWv6ZQlYc0PFNlKcd100bAwXrLQzwViKKQrD5oH8lFdfQJ4PAtC5IamsI2QhLElWyW79wMUouUhR8BzNfGbzNWpHYhf2ygJZc9xZmDtksmERRAflTeHm2NqW/Tq7wIVp/QEtD1Si6BXnvU/90koK4TqTYkdepj2g0Dt6Eai9Z7E00pnAikjHe7TQlpIkhEpO6zYSJsGd8PSvUzauIy0dMPpeBDUY/BZJ455ifk9NaicEpRQhKNb1p2a+49WZE56P2IEGwjBwFT0EVpqdtqqC3E14vhJERaV5f3TbKtakvD8xCcOIN8AdmHwFOlFREEBRcXwAQUkcpoNiShmLZFoYTGSW6+ggy71V4pnrmhXry6h2VVhjaqk4SWFUW4Tav7rpHVlDx1aqx+CalC3tdIYUuGR+2TNFHT1yipwZRUOp/FaGg9gbI1XITTI6Rn5/UUOC88tvCZOIjj9AK+cYLIxhzn2EkJj15ih8kHtJD4LX5dgdqTKJwsxO79g3yqfxdVLPeHpo4pKch6BYhgvKf/KlV5rWzwW7Nw7xnyLHI/7FLmO/Ob3fyvyROJGH/VTchmzTaKr8L0Rdd9mtWQ142+XsMwQRv6Hc4o7Ul23+i5eH3UCA8Q2QlbnEDkmGh6hAxFEg1AIF2lCnBLSMIhisAQQP3ACnHLK/N/o+p9zCG0RfHF7gWPNSarhH62IA9EFFJuB+qW6JnCec4hTga6dT0IVZocobB1I93/IvdEiUJ/uERdirH2McgN0JWj//Ij2KlMhw99AdQE0/eNe4mbKe67QjlcdBk7c57uoEIOka4qhcgu2U3US/co+EVncnmda/
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(336012)(36860700001)(6666004)(107886003)(70586007)(70206006)(36756003)(4744005)(186003)(426003)(2616005)(86362001)(26005)(508600001)(7696005)(356005)(8936002)(2906002)(8676002)(40460700001)(110136005)(4326008)(921005)(316002)(82310400004)(47076005)(5660300002)(83380400001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:31:33.8107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 193263b6-1446-4061-30cb-08d9d6990441
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1261
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree nodes for Tegra234 PWM

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 51aff7d..53a5475 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -234,6 +234,18 @@
 			reset-names = "i2c";
 		};
 
+		pwm1: pwm@3280000 {
+			compatible = "nvidia,tegra194-pwm",
+				     "nvidia,tegra186-pwm";
+			reg = <0x3280000 0x10000>;
+			clocks = <&bpmp TEGRA234_CLK_PWM1>;
+			clock-names = "pwm";
+			resets = <&bpmp TEGRA234_RESET_PWM1>;
+			reset-names = "pwm";
+			status = "disabled";
+			#pwm-cells = <2>;
+		};
+
 		mmc@3460000 {
 			compatible = "nvidia,tegra234-sdhci", "nvidia,tegra186-sdhci";
 			reg = <0x03460000 0x20000>;
-- 
2.7.4

