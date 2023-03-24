Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 320156C7D96
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 13:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbjCXMAd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 08:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbjCXMA3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 08:00:29 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAA1241D6;
        Fri, 24 Mar 2023 05:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTIGW4IOYG4arlqRwJFYflVH26+PMXFo2REynkQgXOe8rzXCCK+xJEbOxOqRbd7WQdczAhVZ2RqnUgfXBZCN1/RDwxJDvEguU1sTqm3R/2NeSs/F71DQpztwR0TGS1FtCIb/Gnlai305ZNkJ1j/sFPCQ1XTaD3t5MDKaukF3TcMB5J5XAVVUuVlQgJFvsF6thIIUzlHzmufoeFxovUispxTJJea2wM7cQIopAu7/FvdkqVAkEatPhOgVu0xHBAhI66QPYKGV0AxmgFt807jgMKJSc8nfkh2V4vNpj2JOrr1xRDqkm3ewu3zYT0zupr1sL1Wr/C1RnLr2iyMwjHoivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF4SQEQz/WZd3ZRkBQep2iA7f20iXS6mzH8/DLYaOaM=;
 b=iywX5kHbYihtcOS+VuVTiJuv4XAPsIVgbeJwjaY8fVQc4X/lo/ToKli/rabp0PLq2GWnA9KC0FeXZCZe1oYL1lITlcXQulej0NtKo6z5qGtMKfKF6XyQxJzG+DOlxYgozjR7mVdG/TR80W9rK1A2vRUkr1pLILF7wVsn14V+ZWMiNfUuTwmjWiIJt6m2F5G1o0roKrPRVbReucmUhLNaHFeez3qDydenyngB5lMGeZhgYEggpqtG+NC93eSeUaM7SveAeZTZP4MxNvnRErLPr41zUTHUa+MAnfQ/EOkGdPyeNcY3/yfgsuKtRx4uSuJVjkZK9UW/WBLfzBD4+82rJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YF4SQEQz/WZd3ZRkBQep2iA7f20iXS6mzH8/DLYaOaM=;
 b=MHdkFfqy/dvS4rdMe6pu3Sof7KQumZz3AWNGMt/QJ/fqk5Ev3lucEApQaGflogqq+W80G6Gdsf2srgCMdqDoFqVg9GSgHfaJPASpGsQ7qwuKeWfWCssDpeKLBrCHZIvR4gsskH0usp0n+tzkrS0yx35Pt4CCX/W2EkcX6UExMLZJgZjl1NebHxCic+7gRp05QImvghuYxP5oLQ7Sl2/FuIGxgZpxz6yDqb2+zfcqtXUQwwoqZWMICLVXxEz4sqXs0EmqoDCqe6YR9mFdlK54ehmrlhNqdcu3I0f5qCxcBIriW83wxMmySehC849nLvOzBVfAWGUbYpLi+RHMb7hcSw==
Received: from MW4PR04CA0173.namprd04.prod.outlook.com (2603:10b6:303:85::28)
 by SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 12:00:25 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::49) by MW4PR04CA0173.outlook.office365.com
 (2603:10b6:303:85::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Fri, 24 Mar 2023 12:00:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.22 via Frontend Transport; Fri, 24 Mar 2023 12:00:24 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 24 Mar 2023
 05:00:15 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Fri, 24 Mar 2023 05:00:14 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 24 Mar 2023 05:00:11 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v4 2/2] i2c: tegra: Share same DMA channel for RX and TX
Date:   Fri, 24 Mar 2023 17:29:24 +0530
Message-ID: <20230324115924.64218-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230324115924.64218-1-akhilrajeev@nvidia.com>
References: <20230324115924.64218-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT086:EE_|SJ2PR12MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e90846-8f11-491d-405a-08db2c5f5a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBMVFN/ewWugNmLmsyvVBfR8UZfafDcm9ERWsIwRVrCP9MWvSRnnsydYG9qaWcElaaOZ31Tj2C4jx8l/pQw26l+XYUFMMlR9jjwWsKL/hdEzCgQYEy+bSrTbr6jMD8VAWsjQj26tqA8S08psU4KZIeTH7iy3BFpn+8F6sn1MbDfiiWPodWYiOQRlnt3+m5D8C4e6qCfoFB91XYV/gTKWEj8PfFPiONnpznz2VYiyHXnQXtUgA7H8EKFCaRk4QJ8WPtyyLWwOb2/LcBD6Ipqu602EhFLqY8n58Ypry64bDDhxtJFoES45KCwWPXH5AG1N8B15tygyztKyVlR8fPc9qH6lNouC7QC2F3Ve5kqyA+3jhiR1ehs7xey5D/hLzzuiSKioopezH3P2jW2DL6jVxeOKVF4QamN/Uf3gCdfAZ64pRhKVTOQG6SquSdk/0Z5b90xgqpg6aV5511a00VQJ08jEc34Cv3Ounw6IBNCHQjygFnzlrd7rwwfQ32PRkMGByBQOKs+SVZWselB5JuPNU1v0yRMrKjCkG+kYrtOjNBHBYwWMtG3BlS4VIwhcO+OAI0g7mOTeQCmzuJvK0eQl2c370GRqQYEe+0mR+LRgJr402qgIv4reWQ9WKurfBAZqImL3gEyzwuKmRQ3Oepjl8v7qWRcyxo6HdxZB345iQs7xjXTYQzcu0Sp8KK+nElhcc6+VVmDOKWAxiJ8Kt7YqfKdIbGMwleOu8y2OMONXF1pfv56AOGbbQcOZU5RVxqrxMV0tLjfxQCxps/ugvNQN9MTjWHs0xKVqGUeVUlkbcnawzQ8xoK8qGsBKcBivXbUTA6i18z1remBfZzWvfKUGpm9qPxX5bn1VQ4CrDLhs3Xc=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199018)(46966006)(40470700004)(36840700001)(8936002)(70586007)(426003)(4326008)(8676002)(70206006)(40460700003)(36756003)(41300700001)(186003)(36860700001)(7636003)(86362001)(921005)(40480700001)(356005)(336012)(83380400001)(2616005)(47076005)(82310400005)(107886003)(6666004)(1076003)(26005)(110136005)(7696005)(316002)(478600001)(82740400003)(2906002)(5660300002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 12:00:24.9533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e90846-8f11-491d-405a-08db2c5f5a3c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8847
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allocate only one DMA channel for I2C and share it for both TX and RX
instead of using two different DMA hardware channels with the same
slave ID. Since I2C supports only half duplex, there is no impact on
perf with this.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 69 ++++++++++------------------------
 1 file changed, 20 insertions(+), 49 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 83e74b8baf67..b15829ff2aab 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -249,8 +249,7 @@ struct tegra_i2c_hw_feature {
  * @msg_read: indicates that the transfer is a read access
  * @timings: i2c timings information like bus frequency
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
- * @tx_dma_chan: DMA transmit channel
- * @rx_dma_chan: DMA receive channel
+ * @dma_chan: DMA channel
  * @dma_phys: handle to DMA resources
  * @dma_buf: pointer to allocated DMA buffer
  * @dma_buf_size: DMA buffer size
@@ -283,8 +282,7 @@ struct tegra_i2c_dev {
 	__u16 msg_len;
 
 	struct completion dma_complete;
-	struct dma_chan *tx_dma_chan;
-	struct dma_chan *rx_dma_chan;
+	struct dma_chan *dma_chan;
 	unsigned int dma_buf_size;
 	struct device *dma_dev;
 	dma_addr_t dma_phys;
@@ -393,16 +391,14 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 {
 	struct dma_async_tx_descriptor *dma_desc;
 	enum dma_transfer_direction dir;
-	struct dma_chan *chan;
 
 	dev_dbg(i2c_dev->dev, "starting DMA for length: %zu\n", len);
 
 	reinit_completion(&i2c_dev->dma_complete);
 
 	dir = i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
-	chan = i2c_dev->msg_read ? i2c_dev->rx_dma_chan : i2c_dev->tx_dma_chan;
 
-	dma_desc = dmaengine_prep_slave_single(chan, i2c_dev->dma_phys,
+	dma_desc = dmaengine_prep_slave_single(i2c_dev->dma_chan, i2c_dev->dma_phys,
 					       len, dir, DMA_PREP_INTERRUPT |
 					       DMA_CTRL_ACK);
 	if (!dma_desc) {
@@ -415,7 +411,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	dma_desc->callback_param = i2c_dev;
 
 	dmaengine_submit(dma_desc);
-	dma_async_issue_pending(chan);
+	dma_async_issue_pending(i2c_dev->dma_chan);
 
 	return 0;
 }
@@ -428,20 +424,14 @@ static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->dma_buf = NULL;
 	}
 
-	if (i2c_dev->tx_dma_chan) {
-		dma_release_channel(i2c_dev->tx_dma_chan);
-		i2c_dev->tx_dma_chan = NULL;
-	}
-
-	if (i2c_dev->rx_dma_chan) {
-		dma_release_channel(i2c_dev->rx_dma_chan);
-		i2c_dev->rx_dma_chan = NULL;
+	if (i2c_dev->dma_chan) {
+		dma_release_channel(i2c_dev->dma_chan);
+		i2c_dev->dma_chan = NULL;
 	}
 }
 
 static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 {
-	struct dma_chan *chan;
 	dma_addr_t dma_phys;
 	u32 *dma_buf;
 	int err;
@@ -459,25 +449,18 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 		return 0;
 	}
 
-	chan = dma_request_chan(i2c_dev->dev, "rx");
-	if (IS_ERR(chan)) {
-		err = PTR_ERR(chan);
-		goto err_out;
-	}
-
-	i2c_dev->rx_dma_chan = chan;
-
-	chan = dma_request_chan(i2c_dev->dev, "tx");
-	if (IS_ERR(chan)) {
-		err = PTR_ERR(chan);
+	/*
+	 * The same channel will be used for both RX and TX.
+	 * Keeping the name as "tx" for backward compatibility
+	 * with existing devicetrees.
+	 */
+	i2c_dev->dma_chan = dma_request_chan(i2c_dev->dev, "tx");
+	if (IS_ERR(i2c_dev->dma_chan)) {
+		err = PTR_ERR(i2c_dev->dma_chan);
 		goto err_out;
 	}
 
-	i2c_dev->tx_dma_chan = chan;
-
-	WARN_ON(i2c_dev->tx_dma_chan->device != i2c_dev->rx_dma_chan->device);
-	i2c_dev->dma_dev = chan->device->dev;
-
+	i2c_dev->dma_dev = i2c_dev->dma_chan->device->dev;
 	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
 				I2C_PACKET_HEADER_SIZE;
 
@@ -976,11 +959,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	if (i2c_dev->dma_mode) {
-		if (i2c_dev->msg_read)
-			dmaengine_terminate_async(i2c_dev->rx_dma_chan);
-		else
-			dmaengine_terminate_async(i2c_dev->tx_dma_chan);
-
+		dmaengine_terminate_async(i2c_dev->dma_chan);
 		complete(&i2c_dev->dma_complete);
 	}
 
@@ -994,7 +973,6 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 {
 	struct dma_slave_config slv_config = {0};
 	u32 val, reg, dma_burst, reg_offset;
-	struct dma_chan *chan;
 	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
@@ -1011,7 +989,6 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			dma_burst = 8;
 
 		if (i2c_dev->msg_read) {
-			chan = i2c_dev->rx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
 
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
@@ -1023,7 +1000,6 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			else
 				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
 		} else {
-			chan = i2c_dev->tx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
 
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
@@ -1037,7 +1013,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		}
 
 		slv_config.device_fc = true;
-		err = dmaengine_slave_config(chan, &slv_config);
+		err = dmaengine_slave_config(i2c_dev->dma_chan, &slv_config);
 		if (err) {
 			dev_err(i2c_dev->dev, "DMA config failed: %d\n", err);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
@@ -1347,13 +1323,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		 * performs synchronization after the transfer's termination
 		 * and we want to get a completion if transfer succeeded.
 		 */
-		dmaengine_synchronize(i2c_dev->msg_read ?
-				      i2c_dev->rx_dma_chan :
-				      i2c_dev->tx_dma_chan);
-
-		dmaengine_terminate_sync(i2c_dev->msg_read ?
-					 i2c_dev->rx_dma_chan :
-					 i2c_dev->tx_dma_chan);
+		dmaengine_synchronize(i2c_dev->dma_chan);
+		dmaengine_terminate_sync(i2c_dev->dma_chan);
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timed out\n");
-- 
2.17.1

