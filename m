Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB447599BD2
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Aug 2022 14:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348790AbiHSMYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Aug 2022 08:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348377AbiHSMYA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Aug 2022 08:24:00 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BE130F4A;
        Fri, 19 Aug 2022 05:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVKke0qfwjVZ2WOPAbgvApFwmXbAT5UmctAVUIMLRPc7s9gMiKJLl2/f51oJIpwtYaTofp3FDCkv7gJpED4xnYzK4ToAqMTwjFpvPuiDqiJ/BEcoc7QJk4KPLqbtaseLkVE42Je9dHwvRa3pkoTCv+5hxTYEmZeL12dL8GH/ukis6yzV63rcbDb6YFmOsMEgaSLd6mJTV/ta8jyZBPtpRAT9P8DobhqIW9uZJ5PI/7FO8rXnR19zqVaV8NTjx5ww4hNjh2iP6V8iOO4faroi8tRZr5SADV4SffexqEtu/SD7RbALhH/0Yo+KnysSLLWJkaNa3P7Y7EPe2GfJOeeLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfuYLY2gnED6lo+Ow1QvINe/DPJNBA1M7YJ5VWl22nI=;
 b=MSAC92Z3BwMqDbfuH56XX1M2aujeRZaxXPUV4MLSrnpwiATT/QlQ5Q3zokqKP6PapbTYb4nLDdG49vCa8XbkVRu11TDRlQYHZxDHn/XHJOz7fQiqllh2/1aAjhMxAXgcZaspAm8glnq10DYKNKkkv6SlI7XpyBPq1TWFn6qFoHq1mAi22EbEiJ3yLFDtg5ZHbjNbw25qELq8ilt5mGfJtzCsy9iznHRYh+HzHqxuqtTRGh5fazwMCBZUfDEqLMm3oFEo6Bymz4rfsTjSgbfy8JZkru91N7YtqvhtDBFFbwEjDUeO0MoP6XEHKP+tw2R1NpohEX+n/I2AFGeOsrLgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfuYLY2gnED6lo+Ow1QvINe/DPJNBA1M7YJ5VWl22nI=;
 b=RygAXDr39ApGScJ1ubE0yMKSSUykJTkdpnfMrKJcVVuhfaJcM4gBjur2BXR7JTmcsFUni9OZwJBiwdwC1ISee0u++xWALcxiaDlF1ZR12dmJiBdmp8VSif6CvMVghjpZvLDEyeRYG34hueS0NTVTCPKtI/MO2qpjbXL4qGxqZFT+ICfIwVDAsZiEoMN4agd0FuOY8BJNTWXSt/DC4anhlHyx3WfKg/9/4vTOJsDUuRMOuCaeNAyinmwraDdugYsOH8sx5vxnWYO198zMQOHHytO1VTqQs2/URw7eGRHq1rHbQJ64omBf7OEWLTbbV/Q0UVn0wLAihuI3mh0+Qz06ew==
Received: from MW4PR03CA0148.namprd03.prod.outlook.com (2603:10b6:303:8c::33)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 12:23:57 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::c4) by MW4PR03CA0148.outlook.office365.com
 (2603:10b6:303:8c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19 via Frontend
 Transport; Fri, 19 Aug 2022 12:23:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5546.7 via Frontend Transport; Fri, 19 Aug 2022 12:23:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Fri, 19 Aug
 2022 12:23:56 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 19 Aug
 2022 05:23:56 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 19 Aug 2022 05:23:52 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <christian.koenig@amd.com>, <digetx@gmail.com>,
        <=jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH RESEND 2/2] arm64: tegra: Add GPCDMA support for Tegra234 I2C
Date:   Fri, 19 Aug 2022 17:53:13 +0530
Message-ID: <20220819122313.40445-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220819122313.40445-1-akhilrajeev@nvidia.com>
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d233c41-09fe-41f4-717e-08da81ddb05a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4202:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 988jLl7Owjk1fppV4SuW2jt3v6mCc6X0C+NSY9FITTtOa98rPhL5+nPLKoB4pjyo62Cj+v1da4d6vaRfkM9tMtJ25lX5Nu4Mc2XO3D8xDZHQALUKFrX9pYxE0KsPoXuoAp7OqT0lT9viSo3oVCr+gKR7pVXuvpnjag+FNxFy/TkRB5XVziQQZH6SyaD7hti5tHWi/iR8FS/JD/9ZNCvKhGBvF2j6ei3P59gcZh3QuLw+KD4r2LDJdcSHIDhbT9UkgpYI5I0M7+yCqFEakAj6YrnBAvWWkfP9QMbybuCpO6dGe+Pl3ov6sEUnQhmyRpN/DJLVU+v+DWxHzB6Fr/YJWV9rJYs/38GaDGGap6AM1cdGD4A0bJBxcXzm65ZvmhP76sKsGQxJjxWnZVEfK4G8TFEy1u3WnLp1qzGC+AsFqJ21J6HbBPCC+GctcWOouonJrWmnW+iuARBKp9GPb1Cs2tCwmjDcFQ90IXSyptuztRSH7JNSit5xN9ZVnwLGlMcmEtQz7UZNPq8OuHPz4LK6enoxBYJp5+xYBnRRCmTXEAG7q5frRRASK6OFQbia+USRqRvcPOPfynngpklFqWNdXeKPYp20BVf7XlwAjoVoU6bIxjkQxRsgRTac6ai8FH2IGU4RVtL3P3pJvgO/JaKO8vt48HY5wK3X+NZmbq23f2rummykQAV2Ra6e+rZ85XVnRq4e9zdlArWXd982wtqeJF/EmObKP/cajmeK1LHJk52/khYMhJ0vQbLDA7YwkJQwjFRt3wzipuqko539/MFjVsl7aIolrlaLj3TqZFAr1g6A3yzXD2VEe8QjjDcpTpGvV0axvqTc9fTZ+oEyBv6xPQoEOmOvanxxWM8lKMl4wtM=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(40470700004)(426003)(336012)(47076005)(356005)(7696005)(921005)(26005)(2616005)(1076003)(186003)(81166007)(36860700001)(83380400001)(82740400003)(8936002)(5660300002)(7416002)(70586007)(70206006)(8676002)(4326008)(40480700001)(82310400005)(2906002)(107886003)(6666004)(478600001)(41300700001)(40460700003)(316002)(110136005)(36756003)(86362001)(2101003)(83996005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:23:57.1569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d233c41-09fe-41f4-717e-08da81ddb05a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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
index 81a0f599685f..34026ca80b36 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -737,6 +737,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C1>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 21>, <&gpcdma 21>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		cam_i2c: i2c@3180000 {
@@ -752,6 +756,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C3>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 23>, <&gpcdma 23>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		dp_aux_ch1_i2c: i2c@3190000 {
@@ -767,6 +775,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C4>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 26>, <&gpcdma 26>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		dp_aux_ch0_i2c: i2c@31b0000 {
@@ -782,6 +794,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C6>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 30>, <&gpcdma 30>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		dp_aux_ch2_i2c: i2c@31c0000 {
@@ -797,6 +813,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C7>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 27>, <&gpcdma 27>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		dp_aux_ch3_i2c: i2c@31e0000 {
@@ -812,6 +832,10 @@
 			clock-names = "div-clk", "parent";
 			resets = <&bpmp TEGRA234_RESET_I2C9>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 31>, <&gpcdma 31>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		spi@3270000 {
@@ -1109,6 +1133,10 @@
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			resets = <&bpmp TEGRA234_RESET_I2C2>;
 			reset-names = "i2c";
+			dmas = <&gpcdma 22>, <&gpcdma 22>;
+			dma-names = "rx", "tx";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			dma-coherent;
 		};
 
 		gen8_i2c: i2c@c250000 {
@@ -1125,6 +1153,10 @@
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

