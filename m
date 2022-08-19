Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E577C599BE5
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Aug 2022 14:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348481AbiHSMXy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Aug 2022 08:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348377AbiHSMXx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Aug 2022 08:23:53 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2D35C36E;
        Fri, 19 Aug 2022 05:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afh+E/rMP5OSTHCW/pwg8mFd7jb5Jd1THPjWBeQUpC1Jy7w/dkR4ev3PsRiy0OK0z+Wj8KC/oumo14OOuAgHHtrDfKEaxmKyLLir5A0jR5rriU6Nc/dBLWWH4wynUJRZ13i5S8is1koKESME4N4mNWQaxMIVatT1/PdtKsh+i+dEP5RzN/UCC1qLqgYhBeA1qlxytgVZO7fAxNTLMXrSID1ek+h86yFuF/oKjE970jR3IwAEbZgEWlS7dDvkl7yJ92rwnEqvcf39C7VbL1wjO1sIjAi7qIUAyVmawODlzjNrp9bAU6Fdj4apCgfX0jXbfYTrYFqMfUF/nhRaeO0sbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRwu0imLD/9Zok2QsQXCG2Fyszi9xwfnnF2sj9WIbTA=;
 b=VASKQMO6ckf+XxLqSr7B/l+5uVjlLm60bpKUHGLVAW0MGKv9kF0XAozAOgbVJBfty7pebL/zx7o7cnKa/rVK1Ih0+eM0Aj6huKCyoRjRCrKv9A4jPGV/WqwHzH5XqiQAeKvH/VejEGNoxvkykAnUB1x2Fg8oOI3UTEzbnaOfAbNbAdf25RXPHz2IV+HL+KFvgJVE+JKoMbTFjTmVOq7jAwHwFu49vm3LMR0C56UGqC7aM0VKLIwM0zSlG1gnpKKmX+cX9MY0p4sKyeNYm7qX1zkXIFiEcIe6DZpdNPoIrhC+lGfPCKmSCvUWMGrjvkNso1LcCJaLCmmwJ3eO2IIWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRwu0imLD/9Zok2QsQXCG2Fyszi9xwfnnF2sj9WIbTA=;
 b=dNkEJbVhLZEj88xi2HFrr58a4daeHdAnsgp4TgPTuQalXXyyae4rbf+VKkmIMou5ijU/59Wg8NhSZ8SKcmZzSqWDwVd9lCXhme6oY9t0iiiF/u9AZYh4krBLn3LZenKYq8RDQRRwJH/8HvDIn37P8pWeYzAKPthX29XA75Vjrf3nZ6rwaZgzO66cLHbOWHfgCwTwrNicK11MnfCqfenbSVfWrdAp0EGYmaWeYmT3qgO/OYULOCp09Q2uzrhPXOR5is3p31TfDSCQC+ZqnaUh1pZ/Zo9bb1Hx5HYCF/hQezOl5gZXtIpqqhHPf7YfWzzQHC59okZ/Da+qLE//7mwVGw==
Received: from MWH0EPF00056D15.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:1e) by SN7PR12MB6689.namprd12.prod.outlook.com
 (2603:10b6:806:273::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 12:23:49 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::206) by MWH0EPF00056D15.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.10 via Frontend
 Transport; Fri, 19 Aug 2022 12:23:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5546.7 via Frontend Transport; Fri, 19 Aug 2022 12:23:49 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Fri, 19 Aug
 2022 12:23:48 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 19 Aug
 2022 05:23:47 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 19 Aug 2022 05:23:44 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <christian.koenig@amd.com>, <digetx@gmail.com>,
        <=jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Date:   Fri, 19 Aug 2022 17:53:12 +0530
Message-ID: <20220819122313.40445-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220819122313.40445-1-akhilrajeev@nvidia.com>
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bcdf1ea-9cd0-4f01-e9e7-08da81ddab8e
X-MS-TrafficTypeDiagnostic: SN7PR12MB6689:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MCUs/lDBOfVsC7iy9DWcNUZm931QWIpWi3QFDGE9wBdblmF47TG1JOU+/FKxdfFuX05iY81IvOyh31lmOV8KYO5UdxgSCj8u0vq7n/677zP5egBk8ufq13a/P2zIBUjCDmbQamL4RnXN6F160c/NUy3LbB8ZGJ3RvQV0y5ihQEBhfg5GD8V+WHi0BwDuA8sRj9Cn0IS0L0NkdikksOsg9mb9pEE9sHE1NubhCTPVT9/+ijfJ6M/pxSOHnSAs73RDU3ew4NBVk+iyWVipVK+6o+W0XjFk3I5ZzMmh72wXzFc15y48teJBosCe1Y44LovKqU1tPMQYktX8kNT4kHwZIci/f3lW5lHhUgwWHX1J/DdEY2pN8TgbqGsetkHw/NeKp5K6hXQKnCYeTPdRDCjKN9DjkBAa8JyuEFW4dMMdgQsN18nQG0KfrP9SjEJEicKSS/Zyr3NDLNltyM0xhyk+WGTWw94UFuMxP4ZqnpkqPeqtdNEPx6jhI6nJnpkFJxK0oLSwjeey/tnjnRPsva5WJUo+zpdMXjkKPAfP3ExMqHIXgvGsl5VLL1iMHhTa1srOOJw7EY6jgGyN5Iygd4vGapb5KI3Io1fSiFmd+Jta64ye+injyZ84Ls2pEQObvGay9P1uot+6ENO7EyDECvmkAhPDnYTGptDyZGO2wT06V/P8fNUcpZ0LKbZKB2PZNlYmJDFWchll+hSsGi++xyPFfTJN0O4i9WmmnSzPQNlhIilXDy6xNLxUXRS538DfBItTVl1PVOAvtd1qppBAm0txVd+N5OJyL9DHEtHWDFTyReilszbzh+kP4hcpWTibWbgLzHrLtDsfkPuU+dbkIXWCW1XkkhA2ytWEvrX7sA5qQto=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(40470700004)(186003)(36756003)(36860700001)(316002)(86362001)(81166007)(47076005)(336012)(426003)(2906002)(107886003)(2616005)(5660300002)(1076003)(8936002)(7416002)(83380400001)(26005)(4326008)(7696005)(82740400003)(8676002)(70586007)(82310400005)(921005)(41300700001)(6666004)(356005)(40480700001)(40460700003)(110136005)(478600001)(70206006)(83996005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:23:49.1278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcdf1ea-9cd0-4f01-e9e7-08da81ddab8e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update the DMA initialization and checks to support GPCDMA.
Also add a mechanism to fall back to PIO mode, if DMA is
not available or if initialization returns error.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 39 ++++++++++++++++------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 031c78ac42e6..8c4610c78b54 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -188,7 +188,6 @@ enum msg_end_type {
  *		allowing 0 length transfers.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
  *		SDA stuck low from device for some unknown reasons.
- * @has_apb_dma: Support of APBDMA on corresponding Tegra chip.
  * @tlow_std_mode: Low period of the clock in standard mode.
  * @thigh_std_mode: High period of the clock in standard mode.
  * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
@@ -215,7 +214,6 @@ struct tegra_i2c_hw_feature {
 	bool has_mst_fifo;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
-	bool has_apb_dma;
 	u32 tlow_std_mode;
 	u32 thigh_std_mode;
 	u32 tlow_fast_fastplus_mode;
@@ -253,6 +251,7 @@ struct tegra_i2c_hw_feature {
  * @dma_phys: handle to DMA resources
  * @dma_buf: pointer to allocated DMA buffer
  * @dma_buf_size: DMA buffer size
+ * @dma_support: indicates if DMA can be enabled
  * @dma_mode: indicates active DMA transfer
  * @dma_complete: DMA completion notifier
  * @atomic_mode: indicates active atomic transfer
@@ -289,6 +288,7 @@ struct tegra_i2c_dev {
 
 	bool multimaster_mode;
 	bool atomic_mode;
+	bool dma_support;
 	bool dma_mode;
 	bool msg_read;
 	bool is_dvc;
@@ -443,13 +443,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	u32 *dma_buf;
 	int err;
 
-	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
-		return 0;
-
-	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
-		return 0;
-	}
+	if (!i2c_dev->dma_support)
+		return -EOPNOTSUPP;
 
 	chan = dma_request_chan(i2c_dev->dev, "rx");
 	if (IS_ERR(chan)) {
@@ -486,6 +481,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 err_out:
 	tegra_i2c_release_dma(i2c_dev);
 	if (err != -EPROBE_DEFER) {
+		i2c_dev->dma_support = false;
 		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
 		dev_err(i2c_dev->dev, "falling back to PIO\n");
 		return 0;
@@ -1251,7 +1247,16 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
 
 	i2c_dev->dma_mode = xfer_size > I2C_PIO_MODE_PREFERRED_LEN &&
-			    i2c_dev->dma_buf && !i2c_dev->atomic_mode;
+			   i2c_dev->dma_support && !i2c_dev->atomic_mode;
+
+	/* If DMA is not initialized, initialize it now.
+	 * Fall back to PIO mode, if it fails.
+	 */
+	if (i2c_dev->dma_mode && !i2c_dev->dma_buf) {
+		err = tegra_i2c_init_dma(i2c_dev);
+		if (err)
+			i2c_dev->dma_mode = false;
+	}
 
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 
@@ -1473,7 +1478,6 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
-	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
 	.tlow_fast_fastplus_mode = 0x4,
@@ -1497,7 +1501,6 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
-	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
 	.tlow_fast_fastplus_mode = 0x4,
@@ -1521,7 +1524,6 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
-	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
 	.tlow_fast_fastplus_mode = 0x4,
@@ -1545,7 +1547,6 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
-	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
 	.tlow_fast_fastplus_mode = 0x4,
@@ -1569,7 +1570,6 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
-	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
 	.tlow_fast_fastplus_mode = 0x4,
@@ -1593,7 +1593,6 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
-	.has_apb_dma = false,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x3,
 	.tlow_fast_fastplus_mode = 0x4,
@@ -1617,7 +1616,6 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_mst_fifo = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
-	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
 	.tlow_fast_fastplus_mode = 0x2,
@@ -1657,6 +1655,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 
 	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
 		i2c_dev->is_vi = true;
+	else
+		i2c_dev->dma_support = !!(of_find_property(np, "dmas", NULL));
 }
 
 static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
@@ -1789,9 +1789,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = tegra_i2c_init_dma(i2c_dev);
-	if (err)
-		goto release_clocks;
+	tegra_i2c_init_dma(i2c_dev);
 
 	/*
 	 * VI I2C is in VE power domain which is not always ON and not
@@ -1838,7 +1836,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	pm_runtime_disable(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
-release_clocks:
 	tegra_i2c_release_clocks(i2c_dev);
 
 	return err;
-- 
2.17.1

