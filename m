Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A7247007F
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 13:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhLJMTv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 07:19:51 -0500
Received: from mail-dm6nam10on2048.outbound.protection.outlook.com ([40.107.93.48]:46561
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229483AbhLJMTu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 Dec 2021 07:19:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crY3l2QmIbG5UzpPapu/BVG8+AKuJP3XDqw7LDAz549bD8GuWRppkIjQGZqGDcaYoETxrpnrYWGrrwjG+kui1DER9j1cXu2vZwAXObslxHDiqv+Z2OL+EeazLMOk8WZnQEJESwVUp8UNKU074KleR/NYAWhLGAcB6zeRKO8e8dA+dfxTtOJpjfVeOcLmUnTDKUdEE80lj72t1auPazwtmsEQLiAcJuSOmsHLZGrso+x90vsjnWAHJJljwL32B3YxgTjrILxJB56gGhAPSIDf8FQZNJ/SlK2ypigHF0djRX7KJmSIo/EZRS3wlZWgBRLZ0TOlMJUQ4lhY2pAjZPcMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slt+9fP9OeSpqNTHPmvrHG1E0ydNuIK6LJsqnPx5bv0=;
 b=WbmnUf6jS8kfs5VK7NWpnUIej34JaZTjU/jT7SE0qlnqb3A1EvgJf5oIUr3UVXT8W/5XvgK3bTiHBMw0QlI4JsLgJi6QenWQntmgpYw2u196OZ3X3w6U5LDVkhizwWTvtTCl0Roo7aZk0lnV4J5PAVnvGdUjkRkv1nZ2ieAxgsSTMXaYedYRBmUO1CMbHAp3dgAbNkye/a8/5wq+RvG4nBgwtjZmdi2WfqoDbZw18eDeZI+e+FL2dOK6gH5Xl2Tavj3vVl1fwRQr97dMKB6qEKk5HMakwKmKB0EX96Umfb6O6QyGEYDI8gmpcUdYIdwZ/Oe13f4FsAfHbJXT+2pELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 203.18.50.13) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=temperror action=none header.from=nvidia.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Slt+9fP9OeSpqNTHPmvrHG1E0ydNuIK6LJsqnPx5bv0=;
 b=d1+ewM/qdKg444doSzK1fDWNDDsTNHVt2+4+PIL5YhBszYxRZdnBF2DrQ2yjADwmPwbquNS8I8VQbqCT2M+BPuqQsEDRxp3bWU9JKjkVg+oXNM77o/4u7IBQLsQBJWlaRGN70jE//b4RKZjDFo17UI2L+o9HWxeHn5OJPdvqCUJEHH7sUt8R+U1qHRXmyl0nB5gACN+f5ZcHXeGa61sv69xtD9SW3ZmQIwyGNmnjQ+rn6BuP30E4CzfsCDQUoHc3mLde/7bn3iIKHgZySoP/XV4/qlcTTT8ugcmYpjTPr9nqQqoAW10FqoNBU8+WkcRivP3us/sFFovcfExA9LFXuQ==
Received: from BN6PR21CA0024.namprd21.prod.outlook.com (2603:10b6:404:8e::34)
 by DM5PR12MB1148.namprd12.prod.outlook.com (2603:10b6:3:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 12:16:14 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:8e:cafe::70) by BN6PR21CA0024.outlook.office365.com
 (2603:10b6:404:8e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.7 via Frontend
 Transport; Fri, 10 Dec 2021 12:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 203.18.50.13) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=nvidia.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nvidia.com: DNS Timeout)
Received: from mail.nvidia.com (203.18.50.13) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4778.13 via Frontend Transport; Fri, 10 Dec 2021 12:16:12 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Dec
 2021 12:16:10 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Dec
 2021 12:16:08 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 10 Dec 2021 12:16:05 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v3] i2c: tegra: use i2c_timings for bus clock freq
Date:   Fri, 10 Dec 2021 17:45:57 +0530
Message-ID: <1639138557-1709-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a635cb6e-7b4a-4af8-e99d-08d9bbd6db91
X-MS-TrafficTypeDiagnostic: DM5PR12MB1148:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1148388F61484F277C4B8913C0719@DM5PR12MB1148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBhzIT/rx9RhDhdTBc32frW6bIga/9kHrlH1ztWplmWkvPPGI/OaMFob5EgyHj86d/5kQCqe9ZIeJ2ZHdDwJ6PutO5LMoctOHLyOtcnJf9dkBeAqHc5yVujx6H/fWENKkxU6gJA2BBfDSGi3z7Xq83bLfcoZrf2yxh2jxPRbTLxn3oW4my/0qE/iE9tP9aiNcPm5AUBUvVtiFHaEOi445BhsPc+N706NEqWpblbBHG32pgRfOVoNAAVE2FUL7H/e8t9Coph0pQk3bND2QeDlGBrPBeHW0FKdZ1A12hdJefMixc5D0n9h4JCsLSt/7KLqwQv9tG8byefoQjRbVS79xs23EtK8tYrwIEXCLDUxG3jtVKx7USAXS80ljO6ugFHHsDOxRGYvcaO3+R7HquAL6YPERtfmMcySQDDkbw1+YFeaeViqtFceddCoQY6yOVGZJ32qPqVFDmBWxicCw8n64Sp5X4WeoR5KPqHGhaaLAqAMnzX06MgBjOAlz8ruLEqYBmy/+wIRsbO703sF6ZNbY/+RFwaDlt4REmotls0z1rEPR2boc7auGSbiU7pH6KU2TFEtRmh3/odKvFFIo3cOXlPQL0dkZar0ThBItPV9PND1f/GK6j/hF2PAJlwuNnDqheV5ASJJ1glvMwsJIReC7p7rI0RC+QSt+zEDdySyYYzhcXhgc/VyWR3UEzSgvaCSX5S0hgmX5mBzKNwa+Rr7rj0HmrSIovKS7BFxaWB1McaXr3DeKYgKSXmPagoKHTbpvKNbi3FqQPSLLW1umd+FqDj8BRVAreqAra6KZksn8AtqT5k1lnJtzohPL1kXSnBvEO/Pd7H2pmCgSTZRHhUrGGJd8wwmE5vs4frgI/vohHc=
X-Forefront-Antispam-Report: CIP:203.18.50.13;CTRY:HK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:hkhybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(40460700001)(7416002)(356005)(6666004)(316002)(110136005)(34020700004)(63350400001)(7636003)(186003)(36756003)(2906002)(336012)(508600001)(70586007)(8936002)(86362001)(70206006)(7696005)(26005)(8676002)(82310400004)(83380400001)(921005)(5660300002)(2616005)(4326008)(47076005)(107886003)(426003)(36860700001)(63370400001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 12:16:12.5804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a635cb6e-7b4a-4af8-e99d-08d9bbd6db91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[203.18.50.13];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1148
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use i2c_timings struct and corresponding methods to get bus clock frequency

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

v2->v3: Removed unused variable 'err'.
v1->v2: Added temp var for i2c_timings struct in function.

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a5be8f0..93b61c4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -246,7 +246,7 @@ struct tegra_i2c_hw_feature {
  * @msg_buf: pointer to current message data
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_read: indicates that the transfer is a read access
- * @bus_clk_rate: current I2C bus clock rate
+ * @timings: i2c timings information like bus frequency
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
  * @tx_dma_chan: DMA transmit channel
  * @rx_dma_chan: DMA receive channel
@@ -273,7 +273,7 @@ struct tegra_i2c_dev {
 	unsigned int nclocks;
 
 	struct clk *div_clk;
-	u32 bus_clk_rate;
+	struct i2c_timings timings;
 
 	struct completion msg_complete;
 	size_t msg_buf_remaining;
@@ -610,6 +610,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
 	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
+	struct i2c_timings *t = &i2c_dev->timings;
 	int err;
 
 	/*
@@ -642,14 +643,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->is_vi)
 		tegra_i2c_vi_init(i2c_dev);
 
-	switch (i2c_dev->bus_clk_rate) {
+	switch (t->bus_freq_hz) {
 	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
 	default:
 		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
 
-		if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ)
+		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
 			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
 		else
 			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
@@ -685,7 +686,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
-			   i2c_dev->bus_clk_rate * clk_multiplier);
+			   t->bus_freq_hz * clk_multiplier);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
 		return err;
@@ -724,7 +725,7 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 	 * before disabling the controller so that the STOP condition has
 	 * been delivered properly.
 	 */
-	udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
+	udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->timings.bus_freq_hz));
 
 	cnfg = i2c_readl(i2c_dev, I2C_CNFG);
 	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
@@ -1254,7 +1255,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
 	 */
 	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
-				       i2c_dev->bus_clk_rate);
+				       i2c_dev->timings.bus_freq_hz);
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
@@ -1631,12 +1632,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
-	int err;
 
-	err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
-				       &i2c_dev->bus_clk_rate);
-	if (err)
-		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
+	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
-- 
2.7.4

