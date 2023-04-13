Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A896E0E23
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 15:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjDMNKl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 09:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjDMNKk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 09:10:40 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2202.outbound.protection.outlook.com [52.100.166.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C5EAD27;
        Thu, 13 Apr 2023 06:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJQUqu80zwUKeans5WKSt0cnj0ih0SMylXXLulXfoySm5O0yQYMN5321IpmmoVOD4KAnADRv1DaryOXKsZCiFFsrK3nfE+/oklYAJnu7G/pMSgRU61QXm28rfybvK5hYHYBB3sdF1RaWwnnc3ts1EQklK+F3C1R9COJQ1TE2annjxGC7d+ll4sp5JmuY1kGLOOmZ+TGWDLT2fPUyEHIfrsUePCX+V8sDBgJQQSr5Zlxc75WulzrUXrGnXdsX6cm6LWJKa18SrMHexpBhzhgol2tpns/NOwUHPW8zJqMyR01Z3V3YbDIsYs9UyCDLw+BA6iHd6h7E+vzoHUq7wMZZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIWltOX4IXcpnP9ozTTuPJak+/dBTJ+dbTx2FTEnDVw=;
 b=dyJEuJpKgdUH0dGqxIABieqaErzSyokQMLYKq5D0sLfkxYJOwvoq6GMFRPQG12L0GcA3niRbdUbdXs7eAHVNyjN4l75wSjyuJVXqon8v8NpnJxqxjYJLg74LrzHpbG2teGYnvyD3BupydcnTXaCgLLWa0ghCtEoGzjAnC7AdfY/int+sgzwuk3io1ZEbNaHgivn59SE0SXtn1ebxj9JKoWAXgExRdW8As52L8mHrOXbxhrurqgaRyKOB1Lhr2+UkN2dt8F9cs8MF/6Y9rJEJzdW2yg44ZCkldZQ9kXKlot701/wTuUwgkykikRN+TJgDlrJyj8gB57oizk7XJ0E2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIWltOX4IXcpnP9ozTTuPJak+/dBTJ+dbTx2FTEnDVw=;
 b=R9Tr1jdPKMk6fxwSYgBPQT5rEGXukURKLMxCW8QCjaKkkJb8ZsbiUXoHweB4uQcmtWqByW52King3NL2glyLrBOAqx0M484as8OCcO1L2apMGW5s8POKOecupeL6vjqddmcfsKrWWjTyc+onTbaYSTT+SusnkMXJC7LybFHr/R77cjr9Fo7bwPI7LOzxH7G0BeazFR7UDCIA6itKNzkNYDUFh6FGlR6UixwgaPWPX1q/TuRNmFi3hQe038w0/SAhE5+To11YTiGG7k6akSPvIiOUR45JzdtK9mmv/KBmgLZqXS19xBMkpbcOtSqd+UPel9YFOVXhD5TW6DWl90asjA==
Received: from MW4PR04CA0066.namprd04.prod.outlook.com (2603:10b6:303:6b::11)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:10:15 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::14) by MW4PR04CA0066.outlook.office365.com
 (2603:10b6:303:6b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 13:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 13:10:15 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 13 Apr 2023
 06:10:07 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Thu, 13 Apr 2023 06:10:07 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 13 Apr 2023 06:10:03 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v5 2/2] i2c: tegra: Share same DMA channel for RX and TX
Date:   Thu, 13 Apr 2023 18:38:49 +0530
Message-ID: <20230413130849.2894-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413130849.2894-1-akhilrajeev@nvidia.com>
References: <20230413130849.2894-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 150d02f4-a9ec-46fd-8482-08db3c206c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5fLejcj6KwEnPonSiqbkYqPdYoiqiOVtmxca55AJiHXjJN+5dADhOWv5PloRnCLyyWjsjseEFTyj7kwyd3CFT2eUpuKD7E9TXcL3vO9EXmfXKKiMW64Zc5BqTiLvbdtMd6z/hXdKEx3+o5wuxR5HsN9qrov63L+whVw6keW3kGHjIMdmVVWESWTYJ+QwEciIqDn87qXWo+e2v0yPQjZFGGiOutz+LZGdRZaWu8LjsPzl+4ZRueim75Nfl86rApEoLri0TvOWVyprBzSYMNgdfn5mlAmZIfE8Etzy6g459U6ljRm05iaFrKDfmmkYXXyzo/c7/SIVNbCaqyHH+gG29moWkJZke9hQGFndgEYzvme6bD11ghBopIF16rk01V4a+EqSRtXdNSMP8moXin05M0VsO1fSpSYAhwFKLQ8g5HWIGpN8ga05jd5r/TxLiJn7GWwCeFc9Iu5o2kncIchgzb3rQ6TCZ+pMFseTAb8KmmrwdAJaLsWEFzVn0F2LpVt0snc+n/tNb4RG9c3agvh/Fp3uxS6IE1TJdPgg8lkk5jfqSBqdvnaKzyRaNwmQo0kp2tdJa3kSVIwv/8M4eqEuGOg9s5hGlVlAGRExAedtt5GEU8Kc6QtK93aMJBzw+e1A4jtG2MPjx4Nqm7UZve+U7OFax6RMo10UyXLJNRE1j6psK06+E3ozR7m3y+rPVU5IFaH7Tyl5naGNgthNTxu+Onzb1sxY3fdKF07kMMrEQYQVaf8B8GKQcW8qrXu8i6NwRmDYv7t6r38DZLnGPEdZyKr0osFvCkX9yAP/ih4D0xgopie5dbgaLN1OpUUSAUBfD/MVUYcNSIupxfFl3/Vy1mKoNddkKqFXndS/nYenXKcNRhqeJbsMavy8FQ+eNGhZ
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(5400799015)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(40460700003)(7636003)(36756003)(5660300002)(2906002)(86362001)(316002)(8936002)(8676002)(40480700001)(82740400003)(41300700001)(921005)(356005)(82310400005)(4326008)(426003)(83380400001)(2616005)(47076005)(70586007)(70206006)(34020700004)(186003)(478600001)(110136005)(107886003)(26005)(1076003)(7696005)(336012)(6666004)(2101003)(83996005)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:10:15.4972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 150d02f4-a9ec-46fd-8482-08db3c206c41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
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
index c1e1e1c2b8d9..fe042232a181 100644
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

