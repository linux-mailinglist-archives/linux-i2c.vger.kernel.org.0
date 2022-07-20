Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673C057B6A5
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jul 2022 14:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240297AbiGTMmx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jul 2022 08:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240949AbiGTMmw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jul 2022 08:42:52 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB316D9ED;
        Wed, 20 Jul 2022 05:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCb2wgviSVEB7a233jcsYvaISbRV1ui13FR/JghVHG5p7hz1Lf4SNiEMUCypIE1urFxQ4byWQuyVp7c6uQ2yoRzBbNnM+h4sJ+w9L0wf9ciZNFJcHupRT4I1Ur1sPW3KTR1W3IqxC8oOXSw/hqmljC4D3ANXF/UyOIHMC0ugcrPUuIWyPpFmF4PGCzUnbGij0QZPzXIGaINAis601TNRGcRwflKD8JjpMnl0jTEMgUY23VklMHfxcLhZFWOTJImf24A1KfBMZHBc4eDYnWmKQ8qnCk9W25BRoKaVOh+EeT/sAgmhb/32MuxplPZAtyVN5+57p84laKQ0ORILdgnCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvOrfIhaDUKKME6o1VCVNW3hllI2jYRoVteHVuisTB8=;
 b=ENkK5jhYIaZR2omFcjYBxSSp95DxpTCHqApHXsjna3hMY9TH52WK5rw5xCHusOmXmwJnzmMnp/b+5iKTgdeybdqE4FGV4mKBDRu+v02Kqpd283ZCDPZclwgLZuGlzPSSGtvPcI5CvI0YGN0BOjtsU6LUZnd5X0H8/FclhNsXk1DjcKZrVRclxw4WB0mra5Z2ZJfKDrOLCWhzecVMwOnXx0ic7K+8tDb5ZheVsn5agMno9dyeP/gTWCwoHpHqnwGot+eD4XnhlRNhU44sIDHZckJ3fK3c3SG7u3ceRWblbkqW+4Q0MD8Y9vQfvfT2JD1i+D+ZWgUToRcollthACbYOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvOrfIhaDUKKME6o1VCVNW3hllI2jYRoVteHVuisTB8=;
 b=YcMoJrpKDMXgpLJ2/gjpCkyPQghBFMdKQyNkc/oqlR1+ggA0gUkgnwibb1kzW7+09onL0k8NI2Q0AC3nZEFnLb3je5wchZnX8Fg0i3RnGEwE0WNQKjjengRcDpX0e444yEmcfJGuWpWD4daeAK+PEjIlnNH7HuW7ptZVfc4+Ge2NTivr5Gf0vXtEfbZi90aRsWFGucvkSfXFfhW+lf28a+nCVQt4reqU+Fhiz9C4GdHWfCvlOkRL/Zj7eBezbECDXyhcUkZLaBSGv5C+zbOC1CiIObvDNJAMCrOSfkEO1dBtprchkidhYK5YxYVwE7xut9/E9Wi8JI0HUCaFNF1SiQ==
Received: from DM5PR08CA0047.namprd08.prod.outlook.com (2603:10b6:4:60::36) by
 DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.23; Wed, 20 Jul 2022 12:42:48 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::ba) by DM5PR08CA0047.outlook.office365.com
 (2603:10b6:4:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Wed, 20 Jul 2022 12:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 12:42:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 20 Jul
 2022 12:42:47 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 20 Jul
 2022 05:42:47 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 20 Jul 2022 05:42:43 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Add GPCDMA support for Tegra234 I2C
Date:   Wed, 20 Jul 2022 18:11:48 +0530
Message-ID: <20220720124148.7969-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220720124148.7969-1-akhilrajeev@nvidia.com>
References: <20220720124148.7969-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 775dd079-5458-4979-0081-08da6a4d5a45
X-MS-TrafficTypeDiagnostic: DM4PR12MB5794:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TZ+y9sYLfzQ8psEpiTBdj9xxy8qydW6Lv5xDYJGc6/12CWEtJbvyCL18uSgjZ+GehUXw7XGRMrWmR62ZjDU8EHIV7S9ZaY4O5+dGPpFIFNjA0CXgovh1dGDCsh4gqOnsavjlvegYn8iZF9VI7+JCThx9fl6VBYuZ/NsIBbSWO7R845M2lwmF2M2Er9OJA0NFsQ5y/9N0/XC77pFVct36BvL5AqiMKQw1pfOtyLnkQfXsUzRqnbypBMA26D13Y5TXQs/MCYwfx6u9aOJBXITS/CVO/pEQ3aMbp5ssGfTtVn25K7WCrZv51wUxnaKbbiuuGAvgXL8gqm0h+FTGlHza3Wxw+aF2DLyCbF0hdVErXwnqf35InzCn7FdWHsORMeHtI930msxiWMa/ectupkIxQkApnrpNHp3TtPUbSWlMnj0Dwm8VT1vWPM+7uhIp28PxkjNRyrhiOhYyFk2dsj6qf4yf1pxSf88tbkJKL4A8ExdbgXS9A6yVqVImEbnACkKJQMx13m39+LiLDItOU2S4pfktPVma3ax4D/y47Tnw/cbS/8RIGDgTTK5s2D2UN/+EaAOkC6C9vDt6GQzAXcutn4ji++kQnQoXDSO+jcTxEwG5KCMGk1KsQUfQetPJtkFYvIbCOM1dpi9+V5p7YC5BTd+eaEfu3u37FtRag7axgRRk7fsHcOJ8rTmYbpkJrls4UW7ceM+Gzu+2KQb2szS87L5DDVHxiVGfjyL7qQB+uPaBxaIaFMRCulRdTuUo2ZbFlHYFyseBR9i9thziRWby6miXtJ7j8daG5zs/u3FnjJJyy6uzgk/lzLr0wiaXXh+n2iF3NANIpeTuNyCJXU29q9Pwk7+t/coOQpGAB8vrwZOBwo8NPElc07FdMXtxCLso/3K0k2DkYaCTNa/v2JUIIA==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(40470700004)(36840700001)(81166007)(110136005)(478600001)(2906002)(7696005)(41300700001)(26005)(40480700001)(8936002)(4326008)(316002)(5660300002)(8676002)(82310400005)(7416002)(82740400003)(921005)(36860700001)(1076003)(356005)(2616005)(83380400001)(70206006)(47076005)(40460700003)(86362001)(336012)(70586007)(426003)(36756003)(107886003)(186003)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 12:42:48.4750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 775dd079-5458-4979-0081-08da6a4d5a45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add dma properties to support GPCDMA in Tegra234 I2C

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index c3d2e48994d1..c9eed199d980 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -668,6 +668,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C1>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 21>, <&gpcdma 21>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		cam_i2c: i2c@3180000 {
@@ -683,6 +687,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C3>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 23>, <&gpcdma 23>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		dp_aux_ch1_i2c: i2c@3190000 {
@@ -698,6 +706,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C4>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 26>, <&gpcdma 26>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		dp_aux_ch0_i2c: i2c@31b0000 {
@@ -713,6 +725,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C6>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 30>, <&gpcdma 30>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		dp_aux_ch2_i2c: i2c@31c0000 {
@@ -728,6 +744,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C7>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 27>, <&gpcdma 27>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		dp_aux_ch3_i2c: i2c@31e0000 {
@@ -743,6 +763,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C9>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 31>, <&gpcdma 31>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		spi@3270000 {
@@ -1026,6 +1050,10 @@
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			resets = <&bpmp TEGRA234_RESET_I2C2>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 22>, <&gpcdma 22>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		gen8_i2c: i2c@c250000 {
@@ -1042,6 +1070,10 @@
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			resets = <&bpmp TEGRA234_RESET_I2C8>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 0>, <&gpcdma 0>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		rtc@c2a0000 {
-- 
2.17.1

