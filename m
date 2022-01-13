Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D77848D8F5
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 14:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbiAMNbZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 08:31:25 -0500
Received: from mail-bn8nam08on2066.outbound.protection.outlook.com ([40.107.100.66]:11745
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232034AbiAMNbY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jan 2022 08:31:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrAmiJOicW4SLT3ieex7XKDguQRl+R6AXwJxa05etyYuTPAzC6z9LHamZh/EsNmsxnlhk+/a6RkN24GBeHXUdzexCF8m/y0WW6GL9d54H0ObrDx9JdyrbE6I6xeoA275JJjT72+yPXZ9hSG29DVkLw3ZTl75sGgnTWKPJpzJRN3fLRYRyoEeU31DMWZiUYpmY0BVmEnlUa53M8641lFhTo54E+X9PvNYQJjxCHBvPExCuH7JNpocw0T+Fk6yiWtcGIp/H8QBpHsmMXD4tShicHcf2EPAVLnkRvPNtQ5fJRVj+al6pQIt5LV6R630p3fjzOV9faD8MzNN4XUrNf9Yvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgUfEitvKCzsFUM8wwi5b+w2Kr0+yrMvOM5Y/2zF8Po=;
 b=goCmgXAw+r+kyZ0n0cwQCXhZliyqIcTw/0XUqrNJPTAJ3oKTPzteSs/++Bz2/1vG2gpu/piYOeBSOUIEtkagZUFCxKe7/7nIvOtl6h+DCtAXnN7w3vOUXbKNa7SA8DbLLOqmG6nzieiq5LEff0nQjQeFht5RNkibihpCviOyFQercHhRYSA1v7wW9KJ/NCHVubI/T0oeJjCvcN1Kk60a2xMFKLNV8W426JNsTxcHXLSuZqMq80JX3Ruph5BD4kFtKyuKrcexSuB7zinyb59QVbbMPXHHxL2g7EaSaFdEnwpW/kqbkKIuEG0o/2qOxpb++bq2z86mfYavyg7LLN6q0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgUfEitvKCzsFUM8wwi5b+w2Kr0+yrMvOM5Y/2zF8Po=;
 b=XaOP0O1V73+U43ix/c5SRagsJVv8KOViF6PIHPCacKYUiFALo1NrkkoHXtPhRF7Y6vfFBZjVf8HyqCW/LCnisgYnAekYzcL+5LHEH1DLDOjy7ot8uVGHN7sN5KKTa+Y2W9GxwyL7mPa3m6zH6dgscoSGoOZAGD9a2bmKtV+OzI88KHoVTSFJ1IBr0vRkTSPKtCZio1q4g1FJDHjyggk002RyPFKzlNtclxD7v00clexnFu6h/1hngMLbD72WQp0ygHsdp4yKp27yQRV1F/b4FoeOYTbbA0pfvgvQ0qJE08t5KmRfO3OKSHnoACuqpr1a/w7jRbycpRwOZHTDmbSqsw==
Received: from MW4PR04CA0089.namprd04.prod.outlook.com (2603:10b6:303:6b::34)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 13:31:22 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::d) by MW4PR04CA0089.outlook.office365.com
 (2603:10b6:303:6b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 13:31:21 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:30:57 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:30:57 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 13 Jan 2022 13:30:54 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 1/6] i2c: tegra: Add support for Tegra234 I2C
Date:   Thu, 13 Jan 2022 19:00:18 +0530
Message-ID: <1642080623-15980-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d94785b3-2189-4437-8cfe-08d9d698fcf5
X-MS-TrafficTypeDiagnostic: CH2PR12MB4326:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4326BE12144A2F29853B1389C0539@CH2PR12MB4326.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gr4qmN8cAp8NLpSw9hszQ6/hyK8lr+44Svo/1NjZfVMzRGuPCMtcX5aJ/WrMgiO6zRfut2Hz8eV/aSRMt0kUfkSxNGUknkfaBQWWb8pgr2QDhii5/sp41oNEiK2LvN6/la+DT8Ya3/KDKkEJ9efdyIUtKmwCZ0349sUIEOf82sLio4oYGTjp7arFke4ssnjMEZtv/CPM4JSKMjNpMKzgwQNIHvPVRxtiWdhzaN6sksAq9CVSMVKdpRduUXlh31GQJIOWh/BSUjwdms/C0xG7S6QwqLBgn9xB2keePXvGewAYixrwSu5/Tee70q25iNMheKtpJnGMLpIzbI4otkeSDpDZqUq4SzY9VT8DPgAnYS49SEj6nobJz56PF82x/Vg9y2Wm5PRoqqJ7x/8EC6pxz1aX8am8krRKVtxWe1lzoINViPXXupbOcmOogjSfjrTm1qe8avKvOFHRvlhsQtDF7l3a6/3aGwxlZkWjKaTQbfepGXCNWDUZgJJCJvGxcekWIyBjpYuPhOqHYbR7VEHIWdJ3an+EnrD+r0GhhITNPuxZkMg4zs/5b11ngyiwojGNlzwNJRYx+G3r8x2v3O1tIWMhyvvOmxmEWG+snS5cdV2+r13mxGcxCsAetMRCIYlbx/mnI2g36DkZ+k7wH+41lrtf33wTn3t5HMut/hgw0XExbAFacxzGvb4PVS7VFfEwvNjzPPGFijlBfttjKZ8Y7/B4mYZzWgvlYRSdqiLR0hygwY60bN14mBfwOf5QLUNnoL5cfp4vA/Bm7BJ58zSb/2CfRJKlKSZpBg/r4OePUWpzN1hKAxxBT3Yf3ukCgpgo
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(426003)(36756003)(70586007)(107886003)(316002)(110136005)(8936002)(70206006)(47076005)(82310400004)(2616005)(8676002)(36860700001)(336012)(5660300002)(2906002)(26005)(356005)(40460700001)(6666004)(186003)(86362001)(508600001)(4326008)(921005)(7696005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:31:21.5866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d94785b3-2189-4437-8cfe-08d9d698fcf5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add Tegra234 specific hw struct and compatible in i2c-tegra driver

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 03cea10..3e8f3f5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1614,7 +1614,32 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 };
 
+static const struct tegra_i2c_hw_feature tegra234_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 0x2,
+	.clk_divisor_std_mode = 0x4f,
+	.clk_divisor_fast_mode = 0x58,
+	.clk_divisor_fast_plus_mode = 0x24,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = true,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = true,
+	.quirks = &tegra194_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = false,
+	.tlow_std_mode = 0x8,
+	.thigh_std_mode = 0x7,
+	.tlow_fast_fastplus_mode = 0x1,
+	.thigh_fast_fastplus_mode = 0x1,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x090909,
+	.has_interface_timing_reg = true,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
+	{ .compatible = "nvidia,tegra234-i2c", .data = &tegra234_i2c_hw, },
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
-- 
2.7.4

