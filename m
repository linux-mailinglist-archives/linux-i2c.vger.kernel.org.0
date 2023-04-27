Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C9F6F05FD
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 14:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244026AbjD0Mk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 08:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243992AbjD0MkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 08:40:18 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE60DBC;
        Thu, 27 Apr 2023 05:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwREYPkTR1zKqaoe5a+MQ79i9NU+bRHaKWcABez9w4NaU6CrL9VZL61iRJOMyGEO+h604jTHrocim9iZSy+ANkGFaB/i86MjQ4afP2WR2wU6/6lXAzAO4OWrBtS0ZC6C8lIC8ueBKc+yWPnLAgQLtC/5r7eOsI8Uj03XM6GxbD/e1tWf8+PfZ+i+yLOsMDmVCET3k3ZMWFby//yr2XEQYjGYkyXugJ0BRo6yHWSeAUMcaOP2nio50C6rhayYO4Bnov/PN4zhaSCa+qMUczDsRbGhFUQORIOoJgaLaAFL9pMEcUFU7RhHYaD7f4f/EA2hSt1kIzLh+mOW1kquAZZwzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gSgshHwmK5LYZO0ZxkYQiT4AK3G/2v/qGvKzjMm46A=;
 b=ROlqoyndAOV10UYTpH0IAn0iMiQoSMvTiuyKMixF2hro7RUUlqVqSI5gmdobM046oEZL4RAvrbReJDpFmdkIfO7ikXEo9Wy1mqC78S+8DMPrZpnqk/mbKZXT2eMU6B/p9kYZnO5c4Hu4fafg1H4mxZT49oiUvIzj6RnRPWM7Py+qQI03g1SA0BtMIIx2FN/gtbKZWuJK8std/XMWOUrzTCjjsnQuXoH0PUOfWatEnSFLfi4xH4l+60I8aHONLr5aXRHyTW6rEPItK7+iCxYrqgBv4arZd6ElERHwBM9YxTVCMXP5fib5QMGZt9IImjHaiNtMRkmsmymKjoe1D0vTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gSgshHwmK5LYZO0ZxkYQiT4AK3G/2v/qGvKzjMm46A=;
 b=buBJnrWahx997WM1AsRzav01eB2Qj7ZPmwCA/UAJHUX8cHujeJ43ZiOXhdj8IopTfCMZ6ykyQYUEzeY0Sr40FRAXE6GDtFfMtSVFABMpGxr9XthUd8MHCiIG30ftPgdPQbyiEkgjnFPOuUoVso0HfCQr1iE3mQUuF0vWZZaVaLatIWtxUS9Rfnlv5vCvL7fW7PyMNAZB8QOsV/uj/Cbh2lystBQHTG/EsUy9fazo6KOUVPffRoBQW68shQRyrfHf2vhaROpFUHZYl5xHHBhDGv8GZEZHeWsVBiV82YIy1LPilBrYWFg+KaMXoglzWxww3WFjk8TIXT5d8+jlphRkCA==
Received: from DS7PR03CA0149.namprd03.prod.outlook.com (2603:10b6:5:3b4::34)
 by CY8PR12MB7755.namprd12.prod.outlook.com (2603:10b6:930:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 12:40:02 +0000
Received: from CY4PEPF0000B8EE.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::ae) by DS7PR03CA0149.outlook.office365.com
 (2603:10b6:5:3b4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 12:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EE.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.16 via Frontend Transport; Thu, 27 Apr 2023 12:40:00 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 27 Apr 2023
 05:39:46 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 27 Apr
 2023 05:39:45 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 27 Apr 2023 05:39:42 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v6 RESEND 2/2] i2c: tegra: Share same DMA channel for RX and TX
Date:   Thu, 27 Apr 2023 18:09:15 +0530
Message-ID: <20230427123915.38199-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230427123915.38199-1-akhilrajeev@nvidia.com>
References: <20230427123915.38199-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EE:EE_|CY8PR12MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 70985ce1-13d0-4eea-09dd-08db471c8452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ks1fOa3gH5/pTOnBhHjGF/WXSipohVpoarxi3A7VVbzVxYRNGr+EUsYRWwJxV0+GVeemUnw3vLtPnalm+M2JQ1FqQPX8t7jBKcDPyXKTqrCcen+L9Bts8+rPQJ5WdyI8kPxuZDy1g8PvLIbZUEtvwOrxNkR0xwQY9hO+xVWFO9ZM2TqgLGSujgzF/AhM+vAP38hBH1/6T6DgdKL1T1RLI7r2bsj5MMYjwvAqTcasqKMTPA/tc4XnUC9f0r5pDPCFIGW5iSa7RdbFGEPfxtAI+9lGgyP1rA4S3MTjoHANX7rEAeYsvmCtbGhIu34mev1rtXST6u7ePm2D0j9dO23Nmslc5AKRczBcowWwOg+z5+zkZglL+dN8wIldppv8t+rJmAcPx9SZ0eVrnxXoV2CcTpdqdw2uWJ5ckSCRVpkiWIBlw77GvA1t3zvo9khvyrk1UQudjDxgJh/7xSZT+IHxdwg50aDWt5/KtMsivJeysHjv0E1SQCc92567RvXpecqcyflbYTufiyAAw36UF1HUlzPE9nW8jsB75hCkyoeddmi6lxrK7Db40JDs0TwVq/XnhSOm7fOTKbOxy2mnyZ+V+VNy5lkAMgBxDzZhMPA+FludebM8G4HnYPfoBIi3zTxo6fG7LQZ+FexjzKGnKW8hVQuplvYC0m63AFDCd0i3JYZXWX6Z2Kk8FZqdw4z623o9LMIeWp9NDU1TlDnZbB4enX6WC+Wbruvzaa4Kv9tNTzstJUuuyTKW6WeMaq8lohaTVmtZkblxqQWfSTVcJ642vw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(6666004)(478600001)(40480700001)(70206006)(316002)(70586007)(110136005)(4326008)(426003)(107886003)(2616005)(336012)(47076005)(186003)(36756003)(40460700003)(26005)(1076003)(82310400005)(7696005)(2906002)(41300700001)(8936002)(5660300002)(8676002)(7636003)(356005)(921005)(82740400003)(36860700001)(86362001)(83380400001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:40:00.6276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70985ce1-13d0-4eea-09dd-08db471c8452
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7755
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 69 ++++++++++------------------------
 1 file changed, 20 insertions(+), 49 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 157066f06a32..070b2b38d67d 100644
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
 	u8 *msg_buf;
 
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

