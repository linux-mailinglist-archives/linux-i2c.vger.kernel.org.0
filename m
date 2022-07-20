Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3871C57B6A0
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jul 2022 14:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240183AbiGTMmp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jul 2022 08:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239902AbiGTMmn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jul 2022 08:42:43 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE5268DCB;
        Wed, 20 Jul 2022 05:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbcvZSaJNblrhP+GtYUQPX46UmxxUNiyc06TCPWBOsS7V/3hG66KMw0/mtrQ+ZX+kdU+12SrdnraBZ5Kw8gZPEZ8u0fvZfb2Rwc2s0Czhy9L5W38ChyesJj4UciiVUWEr2K30mcI8mF6W07OQaKFHXBRg6kpGqLQp5Zt4OQG7uJEIwMo1SUc8QdRGv/8F41zMFOdC27UtaTSC1LFnsWYFu+sti7xiXnXd/Pn6cmfx0/GB9Wojo+Qvt3fAK2bq76rD37r+OSb5KSK91+gY35prfRE+JBs/c95ykOtp6mHqSaoRJOZlj5F9ob2pheAEjY0hyV7wgB/VThDARHIfG78kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+kpL6EQ5XwykNxL8yaokTO8uGIIyDsPkbKSXwt7GB4=;
 b=nWT64A96iTlGfG5PFfkZw6vfqwvZUAV+fF1iR9uKJxy5GnbRP6XDdLyNKS1RFpS9/MU/hObxbDYucHDHtrUp80EMcAUJ9AHj8UIf+8Nq17Q/ILcPYw1OO7lEow1/7KyATFf1K8QrD8h8nlKr1wnNW0tq+udEgAmDYAoQbz75uMxaVIGa7Huvg+aDENmbDB+Pdo/D7O9N8UJmBhJfklHrRV8aV4ZisIm/sB1Ix7Wb3ihv7T3YJ1s/siWbE3vO2OB6QqnKS/aWbGB1HQC9E1BAOTvW8yflwIvkxE3r0qBJpwJWk12Za3fo1V/2ya5Wn3+jBLZ+7XoRVH00tf1v8N6hZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+kpL6EQ5XwykNxL8yaokTO8uGIIyDsPkbKSXwt7GB4=;
 b=ikHyhQStIfsv6fqxEB5nvNHy4BqEGVxRBxcFZfVhe2ijxYSJlXFryIrgf8IrduKeMpcd+LTigyakaXFBhMod9FIEcFVsiF0IOjT2W2iErSzKzSur+VbIwQwJOoKM8sSjBop1qSTVZYIn2shEqaj2ksIK1y4cC2MN0WbM+KoTbaHkwfisQXd4o20SP8GV+ryRzi7Rq5VHQV/ctRapAzhgVnFhqSjDPo9UyM9inAx3Oebr+UPzMcFXQ28jlXBuO7zGFYpSda6JgzAyC9CwhR3f3ktUVS5KSZhsEmBzoE52Ko4OLel1T+OEj9zBH1GK0BCNdAgSFcYyY/i7+KA/itC8Jg==
Received: from DS7PR03CA0266.namprd03.prod.outlook.com (2603:10b6:5:3b3::31)
 by BY5PR12MB3683.namprd12.prod.outlook.com (2603:10b6:a03:1a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Wed, 20 Jul
 2022 12:42:38 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::4f) by DS7PR03CA0266.outlook.office365.com
 (2603:10b6:5:3b3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Wed, 20 Jul 2022 12:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 12:42:37 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 20 Jul
 2022 12:42:36 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 20 Jul
 2022 05:42:36 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 20 Jul 2022 05:42:32 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 1/2] i2c: tegra: Add GPCDMA support
Date:   Wed, 20 Jul 2022 18:11:47 +0530
Message-ID: <20220720124148.7969-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220720124148.7969-1-akhilrajeev@nvidia.com>
References: <20220720124148.7969-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc6a40d0-5b4f-47b5-4e41-08da6a4d53da
X-MS-TrafficTypeDiagnostic: BY5PR12MB3683:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H+fpLBZBQYAppTsgowh+ulf/NnaAZg18WucBBVPaNP/QXCuTH8JwXfyx1yCa7HjFJ8Ii0VRWBfD4IgZTBRfohva3CP93N3TQ0gKXrIdJ7WdR2fuId2l8gtQJenKjOjOMUN6AkWdHrs2Sqidy61hLgicZ/PNalFvNLtJP521ErxoOBUoU57CF65YvrgVHhBNzGlkbYyUalbqn0AfL3esbDPehuqB2MfczNr0c4pDI4nyTYIRiv+0VYowrfih0EKLri56lu59zvimUacnKGZGjK9ZXvju52P1RagIE1/uQDxJyVgxezDd2y7YKNcgLp5/9I0Zf+cpQOcGVqBj6B1sGwDOUoBEB0Irp/XrYnCAqLfMtvsUtmZQJTtwhPGHTzamZYrnUmGrOOViBCWOEj3D+RgovL80Pclmdu4GqfuwEjnEcvSO/w2VPkSfpHUo/f3Myrk02WqdoKSWZiwICrLzRfvVSpC69TbhgVA0YrvjvM2J9P79H4sDggTeLVzEkUZAWukhq5GcNRMf6cWI2L+PYMbALW28eIMXU8AQUf9YxIER+xDlkj1F6HLTggnk63jgrZ9/9w7MNjgqbwWfa5rcGUG+atJtPX33HCD3ibi9lIAJqx5mIZMyhS3ItzyoSyrHgoy9dAZBCtZmREuAiNcYE/HrWZeSZelOF2qewkS1duMPN4+Zz1Dt+qoHoheSm39CLI0qHkqvdpYLuXR14phgzcF//qfmUpd55tErXJqKR6Z4pmuhDl6ahAolvtey1Jr9n7c8rgbRokuuEUdJEQJMzgUz6EZzsqqIG2MmxoxT+QPEv6giw1NpKkau0AYNl5Uqg66UtOCHzJZnZIsuGQRP1OYN6Ztp9gSnRXmI+sxpm2tMcJqcTqA0zvinn6ng8GmnMznqY5Nzj7pJMFMbGkn6dw5UCVoytnjNw2ztfVnwpinA7ZJJcrC47TAyq3/8b2eft
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(40470700004)(46966006)(36840700001)(6666004)(2616005)(47076005)(316002)(336012)(186003)(2906002)(86362001)(36756003)(81166007)(7416002)(82310400005)(426003)(40460700003)(41300700001)(8936002)(1076003)(26005)(107886003)(36860700001)(83380400001)(478600001)(5660300002)(70586007)(356005)(921005)(70206006)(7696005)(82740400003)(110136005)(40480700001)(4326008)(8676002)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 12:42:37.6782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6a40d0-5b4f-47b5-4e41-08da6a4d53da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3683
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
index 2941e42aa6a0..26a3d5805a9e 100644
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

