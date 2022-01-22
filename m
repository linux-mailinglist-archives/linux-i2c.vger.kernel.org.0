Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECE4496C1B
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234383AbiAVLYx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:24:53 -0500
Received: from mail-dm6nam10on2066.outbound.protection.outlook.com ([40.107.93.66]:55264
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234372AbiAVLYv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:24:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhvLRjEX9wvjGJ1y8e+nzHh+53giLRsdbTzrRGivFBhF/g7qGfjWgcIJZ97K1O62p1ChGDrOW2ctAK7H08sF8tqrFhlWgfsylUunHnN5xMQLnjt68Q1L/SR8Dc6rI3WpIrgPNSl/JfA7z0x5wxp4MrvegwbhG6vnWjInwiUgMXpXM+chqlbvQk72emmaQzjw+BiEtAH6XYwoIe4Wfj7oZMgn1tlzr3W7TGzcd/5Sp2DhFhrp95+Hh9HyWC7O+r1Y73v84CRuNNWlnspqRVeGe1yZx/v0KsBUFGDwzGywDWBIdrwMGsRRcD+9tWfBdfdFQl2FgThQSo/tmyLOg32Ing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9gUmGe0z5wMoAeC1F8d3rEE4N836HjO7oZZK2HL3RU=;
 b=OGFUU8Lwa8aOgqmedmzc5IzmaToBOUOpdOKprTk5UQ3unoPGzFfRKAm73Ez3J+pcJd7B9+AsEIyv2CdqfdbUWujxgo8mKlADu+gKb0zgOZW+nIiYOLM1rWRQeN2jPENVAnsxAP76AW018StpzzD6/unOHct2CWjxnnvBYOaR0b4xIMHRZcHAYyhqNs0h9ljpX26Yd1c/aqgbk2OmQ4lfXrCWD4FTsqJpWN+DD57U39qtzQ5B6PGCKgnAKFJZejmFU/8x93Gj0xnxENN6hDb032z42h1Pkh/Uu625/j5jP1oZo7iCL6AHGpBfwEKplIanro3SJv9j3boLMnGUmzq1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9gUmGe0z5wMoAeC1F8d3rEE4N836HjO7oZZK2HL3RU=;
 b=tvfTfRJ3gv3gRc0WmtbBduUOD7DaRaPcWdwrbh95NXOnEGbCf1JuiFf6qTvDSN8eS8Mw7mSOR1BD5z34e+s0R/veVWIoU3/RGoakvTqv2jeX9guzA+6TA0Mgea7utfqso/U7epZOHpYLpKwCCmQZ+d+7qU7SEe8Z50+RBMWwQhKsbKG/dN29NweKCK4HCv6VQevfB+fZ1ShsBmiT0wAIoBdp8E7/7TjEdXzLcOmANz874YPMp79Nxo9pxT0l/2y88aJSGs8YAuZoD4bndCTbhxM2t3MSaITQ126vldYbMV6jBoMl2UXJWZREdQh6Diyvm5Sx6t9LOD1iXsFsigQB1w==
Received: from MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::31)
 by DM6PR12MB3227.namprd12.prod.outlook.com (2603:10b6:5:18d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Sat, 22 Jan
 2022 11:24:49 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::38) by MW4P222CA0026.outlook.office365.com
 (2603:10b6:303:114::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Sat, 22 Jan 2022 11:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:24:49 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:24:48 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:24:47 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:24:44 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 4/4] arm64: tegra: Add Tegra234 PWM devicetree nodes
Date:   Sat, 22 Jan 2022 16:53:27 +0530
Message-ID: <1642850607-20664-5-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b94ca34-6cee-4f86-5090-08d9dd99cd56
X-MS-TrafficTypeDiagnostic: DM6PR12MB3227:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3227AD71D2DC509624EC9067C05C9@DM6PR12MB3227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQLhvUA9/Rlzkx48uS+GGnnFG7VB0yL5oeHiw/tu0T18z4CjHH/PeVapMmJ4b1i7dTranqHKZ8A79EXZk7t8VvS93I9jy6zxVZ2p5DLzpatDcBqFmFogAj7xsJv5rqfv5H7lGmioUfkSxw4mJ5cEV4xFx6hdZfydnJuKr55z5IAdKgGptrgadcX9xoa0Atm/O1kobUcICrnCB1TAywADfs8VycmqEfBENR6DVHgowZDn5EfJllW1+ZDejp3tLWEVpGVsqKMAv54S4YLRWlDT4qL+UWH/2AbUQH6WY4hXnYAWECo5qsIAN7kETjuS+p8lObbnWLa+DqzrLW05mRj6mUNeQeVi1NKFzh4pOUr7TpKjN48/82RuH4n4KDL+KB9UiQNxmExp5je534xWsCJLh4uyVfHFz4Zfp3My/5usMCoQiKiFEUvxsZWVYNfEgu+5CLieB0CohfdwKY4I6iOz80fZLpU5RZVEUrg6yX25AIgg+8JAEbXbEovrx77wbo8iZ4oIZvoQ/cJlT7Hs8E61NF3Swll2FZYty23LXxb0YxT+d4gxwc/rnZOYleQYweAd88C0Mn88qtMJFSSHwDOkxZj3v5jgIz0hlIzYqknrMP1+x1W8u23W6ooALDjyUPx+kcAn+e20ztt3zHNnWV9cqWaNQc6VaxrHxdoN4lpr15KGdPm0fezCEK7QChw8FORHopBHZdUIY0PM8FEKpY5OLse4u/ELxm31iTuvC32UvvlIG2AfLVDli/cnaEAZw8jY+/4ieatyXbKAhtlR6IVDoVC4s8+wQvBnZGxqETjgQPSM1kZN8D+7bmtuou6/gQPOGrPXn7u96FKe01AaabLcqDPOODlMFo44o8TiYhJvS3tdX8sgOm74e4hs9bo+WElA
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(4744005)(70206006)(107886003)(5660300002)(81166007)(4326008)(47076005)(7696005)(921005)(70586007)(40460700003)(6666004)(426003)(2906002)(36756003)(508600001)(336012)(8676002)(2616005)(82310400004)(356005)(110136005)(316002)(8936002)(26005)(36860700001)(86362001)(186003)(83380400001)(36900700001)(83996005)(2101003)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:24:49.3106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b94ca34-6cee-4f86-5090-08d9dd99cd56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3227
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

