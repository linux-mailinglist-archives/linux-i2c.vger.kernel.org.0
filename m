Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80BA69E1D0
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 14:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbjBUN6T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 08:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234167AbjBUN6M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 08:58:12 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04hn2032a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8281E9E8;
        Tue, 21 Feb 2023 05:57:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRUiwnzxdaOt7kdz0mcfaq3ND/0z82c0EerIGPz++nBquRwu141Jbsn7V1sLMR5uLj/d8lm47bPDb7I24kyIxj6AWcnTdCTmynhauOCn5Oo+6bHGSvM/SWty473LfOp62dzbWtJekskGJxmhOuUkf5GG4cFVwqIQx0NAqIjCU3DtcnHCwCM3F3Xy17Nl8HoT7ua2vI8Bk7ilpQBrQXaNtKMhrgrqxXR4gctcRQzOH/5DDWMU968XplDb2b+b25VarL2KJsRy1ZkFrl++s5Q3i+VkpoIfltbs+HXQ7Du/DNQqXov2hpWRIwuM+Obkz9UXUKMv7T1j2mx1Yuy5ctR6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZlHYuze7mMYAIhN8+82W6GWGsZ3Ot99Joa1ab+RqWE=;
 b=Vo49HPG2BcpR/iMUvHPl2AtnvSum/sMNevJHfAvUoGtMXIGVFuJxSPHMjy7649n0jpZL0kGGXBVdC1vmA8s/GPJMEB08OjyisfvefKOUbuDeB1duHRZfz7ZOJt82e6Xaj8yANV1uKpZriqmD5hnf6XfmVkHM76wrDGrpc/CyigW7+VIgqQ4AUQCNypIny3fjSZdWe580CxdLRwQJbCAaqMpuqeVdwXmcVp0MU80VuOvzeQMwC39/nDKJT38wWXyrMScI7dYubSm3fKThe7v1KU7zYmcmwQ7Ko7KjspeDvhJrvwf9MbSEDlMEEq104HX20myLJDVIRJjClJr0gvjVIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZlHYuze7mMYAIhN8+82W6GWGsZ3Ot99Joa1ab+RqWE=;
 b=HdlvpxOQGdIUVpSymU9ca8HiYBNcV/yIIhULFIsqe/XDHqXLWHMln32aGGRXjuKsojyMCjmC8q/kQBqj/pViHjEJ3W4qmhUr+j8G0jap0UVIytBdHhhBVGJzSj1ZMlmD2YwltTD86gQXYmM5N42v4nwb99x8I5w/6KAaN5LIQnsfvT8SfW3sETl6+g2Jk3U8R7MV5MnuCNTLLDXqjRwsi5S9JYpYf6ZnL0t+J6Qe+CFi22bFUclT5a9u0jMISZ9mMj1dRq5y+2itMh5gJJBw8yx3zIMmJTFAbAgGHn2myuY671Gjm8A8U6uU2j8aI0krQeOhwaq0ez2C/gc1UUPUJg==
Received: from MWH0EPF000554DF.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:4) by PH8PR12MB7350.namprd12.prod.outlook.com
 (2603:10b6:510:216::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 13:57:55 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by MWH0EPF000554DF.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5 via Frontend
 Transport; Tue, 21 Feb 2023 13:57:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.18 via Frontend Transport; Tue, 21 Feb 2023 13:57:55 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 21 Feb
 2023 05:57:47 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 21 Feb
 2023 05:57:46 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 21 Feb 2023 05:57:42 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH] i2c: tegra: Share same DMA channel for Rx and Tx
Date:   Tue, 21 Feb 2023 19:27:26 +0530
Message-ID: <20230221135726.40720-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|PH8PR12MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: f373f086-bd11-481a-5b0d-08db1413a201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQlCRU4hBb/cpjNhDbSeIrbjNRoCGwcLUwbOEE5gxtiAbkRRnTcShzUNs2OfvhUyQ4KZ6De/VBeni9p4D5uSmCt5AwFxsX5XA8QVriFYP3/QbZ4Js2hZLd3KA2RwvYp+/90w6oCyLYdvfYlFpI0Na5wrD9jlt0Izu8tIWN0e/947au0c5r4FIDrcWwtHbzTbnk4i0FTG8S+QXveh8hW3WU920pAwv3jNqOOIuQK+/YmmmC10TowsiC+Km/4MNZh71edhVXZONTDgnyszBZtRa6cuZmb8VZTLROVqOYUUd0y7MUI23y6yFvP6Hcs3lsU7l6boK/LkRMgFMz0738h1YbAIHLYk5m8oKe+GCFn8bGRPxzq0TrRHsZ+1CORYNqyaVj9VWTgD++Fv1Bi/fSl8tOLhJ7hfMzb2+luM4v9q49MTP7qaq8JMusmkLCLTfoZwwo2hYBaMMXrTRHGbQUXN/eAWiKJawc3eK55wxHE+vM9Yg1T8V2YrvNTAr8MtK2rMyjEtILC8vf8aAaRCA9JgEfAlya6kmqXddQbQAq7wi2NWtrVyj1YVOaiGnTTe/p8i5K3sqiRhaROwRyv+WKffZ2axL5M0nPyqOekj2fwFVJKwwh2+BUxMx7vzFWZT/7qMpQYUEdaycnqfmIApz18jcWVDeI+dI1PIU91lYJOke6oCfE7S3hJ+YLmwey+IRvwusPuqTaO20D44oVR7K5ysv3A85E8n5D7wnEaav1hlyz/Xqj3zWk48JIKrnG+R9CmHhFhccBu7IxqCnA9N6ss1g5JPGNXrOY2HuWmxNmiI8ObszeWZ/o2o6W2HR8ztoh9SRblAzvE4KxSTX+0EQvsKtA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(346002)(5400799012)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(316002)(83380400001)(5660300002)(8936002)(107886003)(7416002)(70206006)(2616005)(6666004)(41300700001)(4326008)(1076003)(8676002)(70586007)(82310400005)(186003)(26005)(426003)(478600001)(47076005)(110136005)(336012)(921005)(7696005)(40480700001)(356005)(36756003)(2906002)(34070700002)(36860700001)(82740400003)(7636003)(86362001)(2101003)(83996005)(12100799015);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:57:55.6426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f373f086-bd11-481a-5b0d-08db1413a201
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7350
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allocate only one DMA channel for I2C and share it for both Tx and Rx.
Since I2C supports only half duplex, there is no impact on perf with
this.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 51 ++++++++++------------------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6aab84c8d22b..c0a7057d4f0a 100644
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
@@ -281,8 +280,7 @@ struct tegra_i2c_dev {
 	u8 *msg_buf;
 
 	struct completion dma_complete;
-	struct dma_chan *tx_dma_chan;
-	struct dma_chan *rx_dma_chan;
+	struct dma_chan *dma_chan;
 	unsigned int dma_buf_size;
 	struct device *dma_dev;
 	dma_addr_t dma_phys;
@@ -398,7 +396,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	reinit_completion(&i2c_dev->dma_complete);
 
 	dir = i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
-	chan = i2c_dev->msg_read ? i2c_dev->rx_dma_chan : i2c_dev->tx_dma_chan;
+	chan = i2c_dev->dma_chan;
 
 	dma_desc = dmaengine_prep_slave_single(chan, i2c_dev->dma_phys,
 					       len, dir, DMA_PREP_INTERRUPT |
@@ -426,14 +424,9 @@ static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
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
 
@@ -457,21 +450,17 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
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
+	/* The same channel will be used for both Rx and Tx.
+	 * Keeping the name as tx for backward compatibility with
+	 * existing devicetrees.
+	 */
 	chan = dma_request_chan(i2c_dev->dev, "tx");
 	if (IS_ERR(chan)) {
 		err = PTR_ERR(chan);
 		goto err_out;
 	}
 
-	i2c_dev->tx_dma_chan = chan;
+	i2c_dev->dma_chan = chan;
 
 	WARN_ON(i2c_dev->tx_dma_chan->device != i2c_dev->rx_dma_chan->device);
 	i2c_dev->dma_dev = chan->device->dev;
@@ -974,11 +963,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
 
@@ -1008,8 +993,8 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		else
 			dma_burst = 8;
 
+		chan = i2c_dev->dma_chan;
 		if (i2c_dev->msg_read) {
-			chan = i2c_dev->rx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
 
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
@@ -1021,7 +1006,6 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			else
 				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
 		} else {
-			chan = i2c_dev->tx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
 
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
@@ -1333,13 +1317,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

