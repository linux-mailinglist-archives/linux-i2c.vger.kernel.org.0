Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2F76C4789
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 11:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjCVKZH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 06:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjCVKZF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 06:25:05 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59274A1ED;
        Wed, 22 Mar 2023 03:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMwVWaexgh10itnurduubCmdYANJN+af7oEtcKrTOfwvI3OvXKfLX3Z0GuXjOKsN2kOr47DmYbz8SHNt62T78TBIAd35k28pz9UWzBtaS9qoKhrgDcosDW0xSlYobbNUMZTGKwPDnfsOvplcYZIbm4yTSRWdJbDzZ+b7TTyOkWDEt2yBHBn9qaLByR44B+/IB1Z4vnm6DDJWj5ZDTQbKb8cKH6X1sJrK5tZ/igYoPNgUGonatw/q4lsA8ivjTlSPddn11Lopx9T0O+SW4VZJIyUFUyV1RIV65E66/m6e/3fGnowmaBCzUlD+tK6/wloeD1oWnRu05aBq4pMDaE/0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vppl4VWiPwMtAN65MQAcZf0sxXhvmu0sDAmq8CfM/2Q=;
 b=hb9SgL7ZskaBo+5xGwDFeBTU/LBlMR7akSzD9mRFGIk16BVeSoXodfjrz2bO2mGKKSKpHU5Cc4qtmXymkTt6RNFF17Lnn6QrKM5GRU8mO4PQuPlF/KYtjQx0kELfjQXGErZUSxM0uFECHLjTzOX2yE+6Z/+FvTo2Hhl/5kj89l1jnmSxARxwr4ilwaHYrjVqWZ9GlpozjHVk2Md/MWEvBO3iPgoTE2uMARz0RBK9mEOnX0Vt1qTnpqFRDwsFYhd2KTK6ozfMRWu3Svw/57sJC8BHxGlKseepm8DGQDTtQmEwVkYR+UVJuBI3RWLTnNUGotdTQGc1+8pCBWchS8g6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vppl4VWiPwMtAN65MQAcZf0sxXhvmu0sDAmq8CfM/2Q=;
 b=n+2NJTiiB7cAFrBEXj9671Bu97GxtwhbaAZ7wypVcuj1d0zUnGGQjVRLJ1cNdIcXZmDbycE86eXNTEcNFWMGZXyPODRc6hlzuBGR9f5PyWoHCmryBoqSDRKXqFod0qMoMW94i+Wg1Ee8a2ssrp5YNc/2r6UU7tLZqXSYTa47Hf+iFE2qa9lhtQ1ZeXIvfuN8P43H2g4txPZkBmgPVsP7CikrmXh/xeJpc9dmGkS2f94y00LODhV1nfLhqltN6dPDV1nWKAwKsnxpjS6GxDTDPNFZAOEXOtJj0HPEligir3YYgL9MetKCVzFzLY7s92u7C1Hzp1sOkeXDTVkFCGnHSw==
Received: from CY5PR15CA0133.namprd15.prod.outlook.com (2603:10b6:930:68::19)
 by CH0PR12MB5220.namprd12.prod.outlook.com (2603:10b6:610:d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 10:24:58 +0000
Received: from CY4PEPF0000C96F.namprd02.prod.outlook.com
 (2603:10b6:930:68:cafe::a5) by CY5PR15CA0133.outlook.office365.com
 (2603:10b6:930:68::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 10:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000C96F.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.30 via Frontend Transport; Wed, 22 Mar 2023 10:24:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 22 Mar 2023
 03:24:44 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 22 Mar
 2023 03:24:43 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Wed, 22 Mar 2023 03:24:40 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Date:   Wed, 22 Mar 2023 15:54:13 +0530
Message-ID: <20230322102413.52886-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96F:EE_|CH0PR12MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 4020832e-b481-4563-12c4-08db2abfafaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6o4Hm1KCe8dWkK3wqx52aVK2ro8EHeQqXbh7fcB+C92MYL4qh2ZOiU7UquvjIzlBt6KjL4e4jYfkKCpmDKoDhEM9ph+PI10cGrGUnq47yXY4rmBb21vwzsVb9KtcXUjoR15Ol000gdBEGb2af9svQoKloVcbyOVCkh9mJDACBkroyAk3zXNGvgUTF4f0JLmws4d8zpSuMed3E5dMlkrWW/WqxN7wUP5JOn13Gr/2o2ApYYOJ8KYxakEhzkjNQb/jQSydooxQtcX6GwUcsWIdmoACGCgp30Ke0txObrdYA9cjr0OQLYgT3ntYVLYmVKBzowCjMkJidDYfbo1BhHbS/ZQ7hrcLRdws9NPGGV2HdwP7l2kLI72dWFhw8J0h7nV/0L8PSlcMVQXQB6uIM9Bk7KCe+AyMkvR1D9CICkOKwqCH9jAjdcOmtLgBvncaoCTi3XiaWNkM+hYkk/TNQInmLWHWmjjCjZ3zlmEkxtZv1w1TraPcOVxeFuJWYeBvfLX3fUDqB4DJiWN77aUoI+OexguFC9fEiCzM+UvdhFriUT0klFo4hFndxm8VOy3x+RsC6lrcdvZSmNQ47S+WZgHsnx7PnWRx4H/IhJki6cJ3/YnyP4mDzTTMQE0sp6Z3f4TWpzC3QPl/DYq98ZNEYlI1NJN7ReY3IVsw20ktMq39M4zv1AA3PpiDmFYCm4f78wFhKppumVyeusfFzuT3bHs9XC3BFF2/i8ti+21AekHUIwWGy57BdCFV1Y3olRrQYTSm+9IAnmCl5OGT1bRo6Wvrdg/COhkDRosJqJt45egtzzP85JFHQ75nF0pA+fkAN5Oq
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199018)(40470700004)(46966006)(36840700001)(7696005)(41300700001)(5660300002)(8936002)(2906002)(921005)(36756003)(86362001)(356005)(7636003)(82740400003)(36860700001)(110136005)(40460700003)(8676002)(316002)(4326008)(70206006)(478600001)(40480700001)(70586007)(83380400001)(47076005)(426003)(336012)(82310400005)(2616005)(6666004)(1076003)(107886003)(26005)(186003)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 10:24:57.6413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4020832e-b481-4563-12c4-08db2abfafaf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5220
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
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
v2->v3: Updated commit message and comment. Removed local variable for
DMA channel.
v1->v2: Remove WARN_ON for DMA channel mismatch. There is only one
channel in use with this change.

 drivers/i2c/busses/i2c-tegra.c | 69 ++++++++++------------------------
 1 file changed, 20 insertions(+), 49 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 75250a46cf71..a4fc6b6ae24c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -248,8 +248,7 @@ struct tegra_i2c_hw_feature {
  * @msg_read: indicates that the transfer is a read access
  * @timings: i2c timings information like bus frequency
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
- * @tx_dma_chan: DMA transmit channel
- * @rx_dma_chan: DMA receive channel
+ * @dma_chan: DMA channel
  * @dma_phys: handle to DMA resources
  * @dma_buf: pointer to allocated DMA buffer
  * @dma_buf_size: DMA buffer size
@@ -282,8 +281,7 @@ struct tegra_i2c_dev {
 	__u16 msg_len;
 
 	struct completion dma_complete;
-	struct dma_chan *tx_dma_chan;
-	struct dma_chan *rx_dma_chan;
+	struct dma_chan *dma_chan;
 	unsigned int dma_buf_size;
 	struct device *dma_dev;
 	dma_addr_t dma_phys;
@@ -392,16 +390,14 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
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
@@ -414,7 +410,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	dma_desc->callback_param = i2c_dev;
 
 	dmaengine_submit(dma_desc);
-	dma_async_issue_pending(chan);
+	dma_async_issue_pending(i2c_dev->dma_chan);
 
 	return 0;
 }
@@ -427,20 +423,14 @@ static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
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
@@ -458,25 +448,18 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
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
 
@@ -975,11 +958,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
 
@@ -993,7 +972,6 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 {
 	struct dma_slave_config slv_config = {0};
 	u32 val, reg, dma_burst, reg_offset;
-	struct dma_chan *chan;
 	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
@@ -1010,7 +988,6 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			dma_burst = 8;
 
 		if (i2c_dev->msg_read) {
-			chan = i2c_dev->rx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
 
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
@@ -1022,7 +999,6 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			else
 				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
 		} else {
-			chan = i2c_dev->tx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
 
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
@@ -1036,7 +1012,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		}
 
 		slv_config.device_fc = true;
-		err = dmaengine_slave_config(chan, &slv_config);
+		err = dmaengine_slave_config(i2c_dev->dma_chan, &slv_config);
 		if (err) {
 			dev_err(i2c_dev->dev, "DMA config failed: %d\n", err);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
@@ -1346,13 +1322,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

