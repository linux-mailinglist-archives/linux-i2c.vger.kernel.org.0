Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D2B69F2B5
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 11:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjBVK2d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 05:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjBVK2c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 05:28:32 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12hn2209.outbound.protection.outlook.com [52.100.165.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21A523103;
        Wed, 22 Feb 2023 02:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxMdYeok+pVoNyaoXIjkX6CclGnZrtNG1Hx948CuW+vfheWCyn3TYpKenYI6El8wD40mO7j0UtHlq7IEQrs/VMIRuAvmPg6M0bBbQPHaoJm9YSzFO0mUD2uRxCOJgFpfBOSD3mYKkglrCywTKsqE5R1vXyrjTY5IfQLng2JVSQykgem/JjqtdtM8/y773agrUbY8zOE5ajo6qkwx3vAOL4QHj/YbM31ALVW9fqczVofP3h6UbdYceqwbYXEKF4SPoK0L7arXn7vCoGHY8X6RBhau8Q0xCtGTm7HPOq/9b4YvrM1BuPdn6T89PdTvYJ3h194jJVEhsR8++efjs9seIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZjTnzrZlrX4SmwaYmaVWhQ4djchXDV/lZdFvY0teE8=;
 b=RAWIGZdPuuDNwFUeqUCEAQvWpO5Hqq9jTC0OLWi0xgKp4nRtbaNPAYnA8f2PV1iLUh4zEtMpHSP6t9rMB+5N+f05D6uUYH+uPHPhRjrfDWbO4ullFz319MGD3mBOkBkuBZUFEhKPnZ4Y7aIx2RTrH8WueegHYztiIJXz1foG1Rmokx9gmi9VQQ2FppD3lWk+aqlMMV9pei+r4EbyezSo4/WDz6txdFAHOboHySJWydeu1dVvEFHOwFgC72TnNz/qa6DgoLug8IkQNUY+xxDaTMI7J5EreT8r2U9BXB42xPGW37zUGy1xAkbBEptq0A/XRLOWDU5m5SRY3IjXu9ib5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZjTnzrZlrX4SmwaYmaVWhQ4djchXDV/lZdFvY0teE8=;
 b=kWh5Ty2WznX7vG9bvPllMoARXNL4JWjwYP3EKOhwngrGIoCjcBp9lIhWTUp9jrynMdBDp3SKsXveRKs3q2v+vt7Ftbmu9cBKaWm/4lgLN69RAWoHHJ03Ort/6d16vZJy5NiZlFNNzz5ruLKrEDIe7RmA/Kkjen2iCq/chQp4Xb8+2Op/Hp4Ul2HAn9vNJwdWGXlItS27LBTF4i+Zqaz786AXhXnHPtzmT3fqLpEQWVh3thU50baqsm1Cltgq+odCvLDUC4h4xEh+j/Kjg1lv2UbXt3SsPiB6liKpjl77NKyIc5yJZATYQ43EVrkD35S3scUfzJvqDydPrm+zcbueQQ==
Received: from MW4PR04CA0323.namprd04.prod.outlook.com (2603:10b6:303:82::28)
 by DS0PR12MB7656.namprd12.prod.outlook.com (2603:10b6:8:11f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 10:28:28 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::46) by MW4PR04CA0323.outlook.office365.com
 (2603:10b6:303:82::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 10:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.18 via Frontend Transport; Wed, 22 Feb 2023 10:28:28 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 02:28:15 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 22 Feb 2023 02:28:15 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 22 Feb 2023 02:28:10 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2] i2c: tegra: Share same DMA channel for Rx and Tx
Date:   Wed, 22 Feb 2023 15:57:59 +0530
Message-ID: <20230222102759.23165-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT059:EE_|DS0PR12MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: afc0dddd-2589-4c52-9a83-08db14bf8985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAhd8l0ifot4yl4gDiOLu+WUEDK3J9yVpIMefyUV8XWcCgOfMmalHcC1+tCX+Pk6NqQSBcCGBGQTxh4iMRugF74Z6p7Bk6+8ts7+hDHb6Bla6ExcsAGZxb486ObhCewL2sOkc19RNN6RJ+LDFvKbWPwcOmR9aS62zpB4YQW2kPUUgavXN9qAqbz0yVqPHfpqoSA2gtSvtyF82ZRwoYIvGYBUu4RBAfJzOBmGptcbyT/S9tySbBzDOJufi1jLRdSHYlXozbVwKKc7Fdmol7Yz33P3VALv9YNB9uoM6nc8FRONVbYfNoCcMu5Veg7/SzPVjQjwLIA2mqtDlCxnTLbozwsvuOKJQSSJPRV2qOAoQ+D3P429V+hGj++Xe7brbU8tdpWuyGm66rlyfIB23YQQkSIO+bz+ZucwzyktCPDkycze40ryYDLhJM8wnqYV0VA8gqO9SlgddOHKS1P/M5vGpbtevGAhqVhUfYxRXqYiC34nRcz0ZYEaTXGhFYTpsebNBmeyk0FEfLj8a44GrXs+0FbJen/9muV0nl54A7EsRyCj55Q6eJ0LIvXhi/I5gWybz+uKPfIAZXkzv6YajoNp3lS+wow4D8HMS34a3KZuv8PYLDUh0P157JGfCTBL77WnmNuSlOgv7UEdIQ7iVWJhcvTefZ4890u0Kmo+iXKg8/UOlqp69ygRN6qpu/nBdmwCXSuelAI8/eEMBYYlSd0TNnSzFB1adwCFNqO/odQ9RRAeJy4DJsLL6IZKOd3OJXbBaBwS8h9uynrQ3q0i25h7jkAIDwUfqoHf56jPeY3MSJ6FhhoRgAkpRXoNRjwzdT+PgzKQijPkaUh395PX0SBtZQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(346002)(5400799012)(451199018)(36840700001)(46966006)(40470700004)(2906002)(921005)(356005)(82740400003)(40460700003)(1076003)(26005)(186003)(107886003)(7636003)(6666004)(36860700001)(34020700004)(7416002)(5660300002)(8936002)(40480700001)(41300700001)(7696005)(2616005)(83380400001)(86362001)(70206006)(70586007)(4326008)(336012)(82310400005)(8676002)(36756003)(110136005)(426003)(478600001)(47076005)(316002)(2101003)(83996005)(12100799015);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:28:28.0663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc0dddd-2589-4c52-9a83-08db14bf8985
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7656
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
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
v1->v2: Remove WARN_ON for DMA channel mismatch. There is only one
channel in use with this change.

 drivers/i2c/busses/i2c-tegra.c | 54 ++++++++++------------------------
 1 file changed, 15 insertions(+), 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6aab84c8d22b..f52b835f1700 100644
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
 
@@ -457,25 +450,18 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
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
-
-	WARN_ON(i2c_dev->tx_dma_chan->device != i2c_dev->rx_dma_chan->device);
+	i2c_dev->dma_chan = chan;
 	i2c_dev->dma_dev = chan->device->dev;
-
 	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
 				I2C_PACKET_HEADER_SIZE;
 
@@ -974,11 +960,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
 
@@ -1008,8 +990,8 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		else
 			dma_burst = 8;
 
+		chan = i2c_dev->dma_chan;
 		if (i2c_dev->msg_read) {
-			chan = i2c_dev->rx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
 
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
@@ -1021,7 +1003,6 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			else
 				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
 		} else {
-			chan = i2c_dev->tx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
 
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
@@ -1333,13 +1314,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

