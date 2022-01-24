Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB41497DCA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 12:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237290AbiAXLTp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 06:19:45 -0500
Received: from mail-dm6nam08on2063.outbound.protection.outlook.com ([40.107.102.63]:43584
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237295AbiAXLTf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 06:19:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aitdtpCABwcwKn/RC7G28L900Tdu/Yh+4Hhe3VRQiJ2WushyyJ/s3j99C2f/Nta6eLTPet8EJQ7k2Nd95TeTNZTuQcSo7KNPTV8re+72r3IwfdmRzkafAAroqpUoJcoDqVVpr0n0efILC5CwQQC8aS/eSKiJVVRhxclbbXDkJsZq2HPp5d+lb1cSFNy6CWifEEPWwxtWPkexTWJkeKFn8GgwH2/0++G6WsTuEJm45kwrUPxlWU51BEvwZYR93kYjv2wMA2YcrvjIfYsT+WJzJZ4hfShgty/l7P6IKVpyfKCoBksk8ERw/cJ8Vy32ilxkBBdF4QjtVFQVcV++pJPZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9gUmGe0z5wMoAeC1F8d3rEE4N836HjO7oZZK2HL3RU=;
 b=m4tZniqxBbxUXN9xvmzbfN9+f7mz2wINIAvd4zVrhV+DV8Rqg+t4JSVxV9tQyqgyTSLRQiyw13GItjIzV298NaOMKx6tITHCD+J7BQ9uZzw8WTKVQHSE7AY8+4OeJAJtRVJPsES4O1Sr6RL6tc76sPcvtv42jGTLFnJgOeJg7W1ZVUvU3knAPeGFESEENhKxrjSAChtQdciKKqiA32JVUYVLc/7k9WLEFPwP8DV8EEA/TC9GRBmNib4IRYy95PdB+FQ9cyrWV290h34CDA3V5QVtQuvtENlYKIdmjL85TRn1Jntd2uGr8gpTraCGSoMGc4pr0KGILcbmbu/eeRZDQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9gUmGe0z5wMoAeC1F8d3rEE4N836HjO7oZZK2HL3RU=;
 b=ExA5z8iHGF8BNkYqYaPOIcIIMU8oW/DTygNi40z1LigKolK5mCyKzauyJDUbJN3aKwsogt2sXkbf8f5hEWNpnqmMv3XAiCfBotfBPyX9TGTTbmmiBac8Ep592kDegELgZuhv8HwmjVCwPCi5U9uEWb9sheYBr4OQD+W2MgGLJIAG18hKZ9tqLINpXKgRu8NERss8t5VtjxRus7HbL8PpJ3t/PfFLpdgp859Os7KeAA54nT+2gZrVllID8SGt9eroIpT6zramNZDc8wyHkS4aZYohUpzsHz92CvIn2dBftPfwywYMbiEUrJLYcgk5ItAveyDUxIE5F7pnw6qoL9tVBQ==
Received: from BN0PR02CA0021.namprd02.prod.outlook.com (2603:10b6:408:e4::26)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 11:19:33 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::ed) by BN0PR02CA0021.outlook.office365.com
 (2603:10b6:408:e4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Mon, 24 Jan 2022 11:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 11:19:32 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 24 Jan 2022 11:19:00 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Mon, 24 Jan 2022 03:19:00 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Mon, 24 Jan 2022 03:18:56 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v3 4/4] arm64: tegra: Add Tegra234 PWM devicetree nodes
Date:   Mon, 24 Jan 2022 16:48:17 +0530
Message-ID: <1643023097-5221-5-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
References: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 521b2fdb-6a2c-417a-61f6-08d9df2b6589
X-MS-TrafficTypeDiagnostic: BY5PR12MB4194:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4194F280E51EEE6C34A291C3C05E9@BY5PR12MB4194.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OMaEryZTNfNRKNYM9QtDdbsv/fDeQ27VGnyPgi3DmLBCRsXoafMpHfd5wmxY032hJAI56NIWyhMD5nnlYGns5ts2HSRNUEH0fJgzhrKP5aGyirNa1Bw6FRYDKda4O48qu41F2T5wntxCivxZwzSJ7CkZ8/t6lppkcym5rcHdaGuuYBQQp6TbDAevDr1moCzyjs8K69aWeBr30kEQQ74pOYzJ8ZTJ7O1IgthwkH0+zEDfnU6A7detvIFZHR71d4oMB/7IH3waM/3AaY0mDfLHmwWQqjPke7P8QrcGAZDSWnR5Kn8pY6AI4nSGPLwGRTXe56tWjYUqlGBjL2zh564pDYc3CdvfBWon1rKRGLuS/9gyjnYX7rW3S877xt32D066QqZtW64r7D/UGcybUT8s5Rq4C8H/31zMgGIMKNqm7sKQ1sTp9gVYgTy+/eLVumjP36U9uYSUqGNHpQTeLV+lauAxolHCIS1hHlzUB1nlM+5l2EdK7y1RmAjfVDIwHeJa8yzemzvqaEYr386PMOvntvfeOP0YnyxpDVMX1XatM2htpDvP+2weCkKqjKh5E8a9qcJ9zUn056iAQgOL6bQ+2X5EHml91q4zlx8JhFeLDLre3YZjkoHXx3ivmMHRve+ui9DtzjUV4f6850U80a46qMyyycdka+bVpZdU0CDW3uK6EGQuk3xffseHUy8Icek8iOogJfXConphPNusshBUlIBiF0ZUG8w+wE8yPOT4ukpw3TgKRuPOrrOyRKhpH360jLuA5z667ikklD9c1sj0+Cwn+ZZz3dL87L1OCYnqW+gNIwYuExQY8HxQ/XZ9GjRh4za7vhKmNjLR4FybCC+Rtn6sTxaW0Jin1k/uwRqujta9/S8Pf3E5FmM1fyQ6CZ3c
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700004)(8676002)(47076005)(4744005)(81166007)(6666004)(508600001)(26005)(107886003)(110136005)(83380400001)(86362001)(356005)(40460700003)(2906002)(7696005)(4326008)(8936002)(70586007)(426003)(2616005)(921005)(36756003)(336012)(186003)(5660300002)(36860700001)(316002)(82310400004)(70206006)(36900700001)(2101003)(83996005)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 11:19:32.8007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 521b2fdb-6a2c-417a-61f6-08d9df2b6589
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree nodes for Tegra234 PWM

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index c686827..cbebf1e 100644
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

