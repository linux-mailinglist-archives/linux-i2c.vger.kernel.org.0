Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989C446ED09
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 17:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhLIQcd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 11:32:33 -0500
Received: from mail-dm6nam12on2084.outbound.protection.outlook.com ([40.107.243.84]:12481
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232040AbhLIQcc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Dec 2021 11:32:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KM6sFUDGZnDgtoDohH+ID6JB3eDBlLMDrjKAj8g/iA0RKrSf31ec7qrlVLHi5DC6F1CTqqUTOM4J9QcB0W/1MNYS/0TUFkREX2zLw0FfnjErJ0jPVIjxZUp2nqIBydGvLDhqnd45S7OoIyCIe+oOWZiKJFc/TfHn7P6yIHoilje58jpmyzaNw6scjbgy4il/itAUrZ6AoUMlk/4m02f6LjYQj36Uj8BHw5jxivSTpdKHKDXgWVW6tD80KQxRHAahzgBGAdnS05IRTtOK2Y0k2k/plPW0e0waTxBdozcaX5ldRaPyiJEgmAEhvqvdXW3pXoFRfAge/cJXy1L2UUq8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQXtpYTz3fHgmzQCUaqieeDXe9NZ/JylikbbBgksVkc=;
 b=XMNMAfXwZoof7vTM+OvwoVwrkqqZX4u1CttJM5BvAqd0dRDEonkPWA8YgugvfdPxAscoMwj0+ttdx+suy2y3H254F+8/V45ZjTJNB8c0fyKES3vfp53Khqj7+vNYuyBmWS3/PcRzU8iRnyzT6tg4OOKvJS5n1LLY7AOqw0oRZxOHk49ugVgBaMuTQZkrqAPhTvOpDyCbUhQ+hhK02er/Un6J4V8Ioq2FtiIsiQnbje89De32of5an7OIEusbBY8R9KpQfl7eDrxNfiK/1i0XvHbrLLrWBqj7O5tAIwtOHf8MjRF01iYKJC1+TKx2oKp4xJ2lsnVh0UWrqbkOmzFUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.13) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQXtpYTz3fHgmzQCUaqieeDXe9NZ/JylikbbBgksVkc=;
 b=Gb+u6d7id6oizkAzbRuS/mCbzeP6EtyqJCm8kFah9TycIvUmamglg0MZliYmEr6ciVeNymOz89pA3CS1PTN7wR/tp1U1DNsIDLamJ/yOUO3KzGe3XY5vAuVAsGBtLbIdAoNIxdI7VzMfAdRmj74CVBvuJdekboUE3aIW6v6hPMcdvuzAPts/hJL8pPoSG9f98cLX7y0exoJivFvTfNWJvcWW4/Q+ZqLGGo0d8NtWkvGQr2HC6F6vKpQmk2rnv3MPm/KwgJtbgBbOXMMtEcFzoVIuwVUERD9GdR/+RzY4In28rAoJ5L4Ler5G701KvJCraYJBQ6qkgLB4ih9ou0Y6GA==
Received: from MW4PR03CA0251.namprd03.prod.outlook.com (2603:10b6:303:b4::16)
 by CH0PR12MB5140.namprd12.prod.outlook.com (2603:10b6:610:bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 16:28:56 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::26) by MW4PR03CA0251.outlook.office365.com
 (2603:10b6:303:b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend
 Transport; Thu, 9 Dec 2021 16:28:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.13)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.13 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.13; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.13) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 16:28:56 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 16:28:54 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 16:28:52 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 9 Dec 2021 16:28:48 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linaro-mm-sig@lists.linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2] i2c: tegra: use i2c_timings for bus clock freq
Date:   Thu, 9 Dec 2021 21:58:38 +0530
Message-ID: <1639067318-29014-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8b3e4d9-cf3d-4d60-18b6-08d9bb30ff30
X-MS-TrafficTypeDiagnostic: CH0PR12MB5140:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB51405EF26321E114AFE9895EC0709@CH0PR12MB5140.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mn/ETjGNYkBtbcb/HJilpXXXI1zIBUX2qh5MjKCesbIZsfL2COg3tLOrLhNTB7dl1KkwAAcC2EyO+fCtX2hSgZ1bPkQ5QIN+GljoIjnFCpMGWo0IYaRhvG04QWdK/G5TnhtEgzWY9Oku6lEH9pR8NPzn2UGPEnF9pri7AtCGfKl88BH47rwJt1iNtfPQ2VFpdx4tAteF44Pp1ROl9AxKY4Qs2HuP14Q6QorC8gohvuYE/Xp+afubMSa5F+7di5aGYWvIL/9GtiFcCZuSAUIQFuUzAti4O/J2urzAYztr3ozNU5HtnYu4yPTyEQbBvYV+p7BLHRykrPjj37vxNdps90MZbTo3yruBrYYAs7UYdyUTqDPqoH8OjzEWuwyJzTTcEvisb2zahKPzSTZBWhHzwQ3SdGotDiW3tZqe0BrrJzwZTJ9o0qC82L+gE1WjQpFXfbBY9Ge3AiqOkHETR0sgfhjefbFi9mVTGW4HgTyxtybOnVgUZnyo6rtbnVCOn2wUQiJ/0cneuenJ4a+S31OKDEz8F6TKKhue5UwKii3A5ya0zsJrpUy1eOxUkPExli0VC9vNBAKniXPiNdQJrvCeNV9T87pIlTOX+r2GOZeuGJ4C+/gTzUSCaQSt6xxmOBUKRayEYBfLT2JtKCnrjG2rLLrpFi3sBQAOVo1SilpKZd/LUu/Ct0nm0QoqoSx1IhkeIB1a/sxK13UeKIr00W0Zt1RqFxI2BF1rFuDCCRkDqSHnSrT26VlqqZ6+G6PP/QS4UqkxDDrNNIY4hCcyImiOETIwABqYaa+TEYnBWgUT6JvUCOlTzfA0atKLlVkiZxtO4M1hsWVofWM3cuhvCMbnz9mdp/BzfnA9MBlI4Mu9UMM=
X-Forefront-Antispam-Report: CIP:203.18.50.13;CTRY:HK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:hkhybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(107886003)(316002)(7416002)(8936002)(26005)(2906002)(82310400004)(110136005)(4326008)(7696005)(36860700001)(34020700004)(83380400001)(36756003)(356005)(40460700001)(47076005)(7636003)(2616005)(5660300002)(86362001)(8676002)(921005)(508600001)(336012)(6666004)(426003)(70206006)(70586007)(186003)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 16:28:56.0365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b3e4d9-cf3d-4d60-18b6-08d9bb30ff30
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[203.18.50.13];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5140
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use i2c_timings struct and corresponding methods to get bus clock frequency

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

v1->v2: Added temp var for i2c_timings struct in function.

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a5be8f0..4cbe89b 100644
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
@@ -1633,10 +1634,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
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

