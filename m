Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21D646E95F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 14:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhLINwZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 08:52:25 -0500
Received: from mail-bn7nam10on2045.outbound.protection.outlook.com ([40.107.92.45]:21985
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230072AbhLINwY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Dec 2021 08:52:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCAIfRDvTY8+JNqIWBAI/gcvWMWtWxS3vH9QbCwFEtWoDL8+F5JtUUzIPkJm6CbpWdRDz4I2xnRxJdNNPuL74YiqClIlOzdqw55WgaLARZ+VoQptrYtFvUyUj78Ee6q+j6yEibN9zdcaouec6I8cG0yxBz8x7OLS6xX7V8F7Vh+Pxpc9Lm+x5wN5zuFw0wP1SVCEb1rN1as5gaQ4y4q60q6X/EFRo5p19E480J3vk0CxogG2KAb3EP36kKIOiWOn5Jdq7mRt5+SMDHcSOC6VUqynLsoFtYLiTaBx3ypJlCITP5oO/ho3SzV2t1/yEbtbrotkDQhygU7LtN4awy4cpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agjWDN8w5YqKO0JMoBb37V5H5doveDmbepbbLdVRE7E=;
 b=TNGZubU1Qdd3iERZzmE/+ARZ1ToWMmfHR1wDYnMzlqJ+CI7wItJ/isDR3wb/5rjmK0w7SOlb8slMlDeA7jtfEVxADZ4SaEGbzm3nl2jCuxHixxenwE+/Rdu+K2pECvJ3Jb4SWZD5guH1HEHoOvaKyoemNdW3WzPASIau4xKIhmDSpMylFLgVWzqPjydlZBUAehUIY2LruaiRKk+rroAq2aOUxiXGtWVAGavFrawmXvjASRcfBN2pm6V5qbjHWHBZzNyLsh51fo3Gj1QE3Njv4sHvPM/J9IlLdKxuUySrzzRV/YDy+rpN9RWN2fz4cv2ghxWBdVyAVTh9mLf5RIdn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.14) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agjWDN8w5YqKO0JMoBb37V5H5doveDmbepbbLdVRE7E=;
 b=KIH6iGgVbFadIk8QY/cd7xhGBR0lxj0x3b6giMpW0JyUaE1ubiugPywM3qMNteO6gn9fE/44LaOGf+qJzagTawwJHkjbeteyTroe+3zJZXP1dwN9pZCIrNoLzAWKSDmiR8BcGmSBAWieiFAEptlCz8tNDe/Q1DZjp2+DkQRCNo/mrEyWiZcmZ5XgsoCXRJ3oP3OW00+OOhXZTpS8uiRYuju0s1/W8xcPQatPmUmn9F47PU0t0622j1eTKw2Uf41lo8IYaYas6VBGx6tiDv8OJmQptLEfNICsKCWllAjSIyaBUxI/Oh1ktllnHVYt2zr0uVeqire+F+Gbdtgd4zo3JQ==
Received: from BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7)
 by MN2PR12MB4584.namprd12.prod.outlook.com (2603:10b6:208:24e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 9 Dec
 2021 13:48:48 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::1) by BN9PR03CA0362.outlook.office365.com
 (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 13:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.14)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.14 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.14; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.14) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 13:48:48 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 13:48:32 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 05:48:29 -0800
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 9 Dec 2021 05:48:23 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linaro-mm-sig@lists.linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH] i2c: tegra: use i2c_timings for bus clock freq
Date:   Thu, 9 Dec 2021 19:17:48 +0530
Message-ID: <1639057668-14377-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cde6373-903f-402b-c6ee-08d9bb1aa077
X-MS-TrafficTypeDiagnostic: MN2PR12MB4584:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4584DBCED9BA721CCD9C6126C0709@MN2PR12MB4584.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LeagAhG65+sliZ2LEnvznZxN78F3X758ZFHqL/ovQCg28EysL/ZWA4jysYhTdl04rCyEeIevxWetQZIZ/g/VZdPDwSEVd/Jemb4lBolyq6rh32yjWR6Fdasrdnq2hXHlOVrXmOHLc8GzJ3gr8xk/qv/VzVdcdBze0HNofKcS6LgbFXkGSilkTYBwgCEeUh38thpQTJB4/ZwZ9ZE5Xj13SislUIpgI0Cfpae2fU5utuS1s8o9slaBh4wzwOg4lXS3OIEibWeE914sg03gxAobDIZyPrY25Ii4hxIEH2muBJ+IO8koav4fJ4JgSxISSm+LMo4hcejs90tQ4IocBTF4c43N8P6rWST+EWXBH/01H1VQUvDKHLMNQdacOGeF1XX+FXCY8dqWUVuhaAa4vRV3jCazXseM7jpSKnqPMRk97SoBSVrcyzXl83jIDYhjgbzwMfRHJ+J6iAH9JaWIBshaf8zJpS6Cjw2J8VkWX2GoleJusQ1cQmj9gQjpUoytd0/cE5XMFl/UJmxiUaAMqs74nAmE5nZw7simzJ+VvIjNF/hEC27tPXVFUPvyAq+foxhJVyzArnePjswvDj8VXq9QS69I710gM9JBga1JtOPE/UQa/rcaJEVP0UchJGierR45i0aXMt0XA8YCcJdXJe8IEk1W8rSYt1kEg8l0HpKSB/eKlWRsJ6kIqd7tjVwksavjM7eiBDznHX3UDc310ntbaIac5AXlcDIHU6wEHKO9vd6F+Eiohj83IzqNZhYvcq7Owouso78x93BOHRTeaPsfwVAcvEBQfSpAADvf9FL917knVEpd3Wx+DnWpnAqFNR8S88BinE417KmTLiskbKvW/prvMEKD+ng40SO6kM84BIylvUThXLD5+HoVrPbiRM6YCVO5MoBFkFaGDVVAtobMOkQd7P/SNfrMawKaQFrG8DAqsPG7i7DmCUdJRZ3P9WTB
X-Forefront-Antispam-Report: CIP:203.18.50.14;CTRY:HK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:hkhybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(316002)(186003)(426003)(508600001)(7696005)(921005)(47076005)(70206006)(36756003)(36860700001)(34020700004)(26005)(110136005)(356005)(8676002)(83380400001)(4326008)(70586007)(2906002)(40460700001)(2616005)(5660300002)(86362001)(82310400004)(6666004)(966005)(107886003)(8936002)(7416002)(7636003)(336012)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 13:48:48.0540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cde6373-903f-402b-c6ee-08d9bb1aa077
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[203.18.50.14];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4584
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use i2c_timings struct and corresponding methods to get bus clock frequency

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

The patch is in response to the discussion in a previous patch to use
i2c_timings struct for bus freq.
ref. https://lkml.org/lkml/2021/11/25/767

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a5be8f0..ffd2ad2 100644
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
@@ -642,14 +642,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->is_vi)
 		tegra_i2c_vi_init(i2c_dev);
 
-	switch (i2c_dev->bus_clk_rate) {
+	switch (i2c_dev->timings.bus_freq_hz) {
 	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
 	default:
 		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
 
-		if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ)
+		if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
 			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
 		else
 			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
@@ -685,7 +685,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
-			   i2c_dev->bus_clk_rate * clk_multiplier);
+			   i2c_dev->timings.bus_freq_hz * clk_multiplier);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
 		return err;
@@ -724,7 +724,7 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 	 * before disabling the controller so that the STOP condition has
 	 * been delivered properly.
 	 */
-	udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
+	udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->timings.bus_freq_hz));
 
 	cnfg = i2c_readl(i2c_dev, I2C_CNFG);
 	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
@@ -1254,7 +1254,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
 	 */
 	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
-				       i2c_dev->bus_clk_rate);
+				       i2c_dev->timings.bus_freq_hz);
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
@@ -1633,10 +1633,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	bool multi_mode;
 	int err;
 
-	err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
-				       &i2c_dev->bus_clk_rate);
-	if (err)
-		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
+	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
-- 
2.7.4

