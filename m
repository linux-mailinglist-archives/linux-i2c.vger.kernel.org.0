Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 534A16E1AFC
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 06:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjDNEIb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 00:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjDNEIO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 00:08:14 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11hn2200.outbound.protection.outlook.com [52.100.171.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2875271;
        Thu, 13 Apr 2023 21:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR/gSuajK2LUbVUxZQc70glN5jmmI4cW+WZitmpz+UHcYTgk/STAHGhwYmaGxjrEtQlzYpzmMOmSNQMjI+gbB9rU5SCGIOd24wBh0dTxu1bJm+spo7Ube1zEzpkgAD4EcYm/OgeJVDtCB7himx1qgXdlGjyAE3+s8dg+ZQOFhg3+p0ZKwAgE9AYIaK4tb3Qq1xNPgcon5Qb9R5Hj6ngp7mORIsFB67IZk3zL/pwddOFPQ/w0fya46LgV3YDjPv7KYsXbWsp2Nn/OfSqKwGpeq0PKWm/HFYM8pR3JLBEFToTaUl2hpX5NjLW50tYW3QOAdgvScewiu6ZwWbiFHJE96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gSgshHwmK5LYZO0ZxkYQiT4AK3G/2v/qGvKzjMm46A=;
 b=EgdDy4uWGkuytk9etk7RwBYtMnXzWTBTz2pEXhdjiDsnf3EFH7w6gB4+Yx8d03fbG26kZlgIRfH0xBXAoK/n98pHC2qRja/HCRgHaVJ0dVGv0TCOFzGn0jUzb9+mxUDy57JvvF3n82iYuj72K+OCuQQlWAr/Q5eDxqoI3iA+rL9pYmmWu2YYNMF0X6Y6co+83MZiKphDK6FsrVV+XVlkzpO5Wj0eyuWKACmWpVyMr0S6cRqoeQldHF0LBfx7uYSXfuFly+3XUL9GmEhBAxALlfx6v/+OJuO9f4sjI93/fYkRUcrEeXdeLkXW2dhelpPqNaot6i9ALkTM8ivLSxuyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gSgshHwmK5LYZO0ZxkYQiT4AK3G/2v/qGvKzjMm46A=;
 b=sqlCZxaec1nTvy6/C/v9ZSENTF9YDTTkDjg50po8kW5hbOtdbRWqh7/eBQqQ3h2j2PdZJ/25fgLR4IC7GG66H3OoCi5VKqCC4UaVtJM1pEV/CqMZs1dmsy3mtUjpsooH70ThIYog1mVmp7moHUy0KhU5i3sRuS/S96zOA5uAPcW/dDEJAuowlj/I5N5ZMaeT9qWHi3lPpjmelZV/ZQ7tYkbXTy2n6zs/KEVUawhkg7Y8DhfMVUBn8/KHbcP/hUNHwvwd4cD0qpR2F/vj+Wdy5EEYKyVV+ZIO71uUsvJHbkzpzkl1q5fCgZR2Uhixx0mdJwM54xxu7J1QE8cEz4orXA==
Received: from MW4PR03CA0038.namprd03.prod.outlook.com (2603:10b6:303:8e::13)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 04:08:09 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::ac) by MW4PR03CA0038.outlook.office365.com
 (2603:10b6:303:8e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.34 via Frontend
 Transport; Fri, 14 Apr 2023 04:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.33 via Frontend Transport; Fri, 14 Apr 2023 04:08:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 13 Apr 2023
 21:08:02 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 13 Apr
 2023 21:08:01 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 13 Apr 2023 21:07:58 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v6 2/2] i2c: tegra: Share same DMA channel for RX and TX
Date:   Fri, 14 Apr 2023 09:37:11 +0530
Message-ID: <20230414040711.19370-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414040711.19370-1-akhilrajeev@nvidia.com>
References: <20230414040711.19370-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT005:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bd5b6c-f219-4d6c-d0bd-08db3c9ddb54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0BqTJo+T9zgN++l//iabIeJqBH4xHSiff2wnkeGpkQ1sv0FCfybcnkjX46gOfZ/JSYarnoZzHiFoM5L0W9jDHky0PktsODFL7Oq1jiDvk8Z/kzXNsK6qSTM0pZ+mB5pWtFIDyHAJvZs7vl6l4D4iI3tvqAyxQQjVZLS6pBtzOjqy1+l/tKkz9PkfOLpWRE4iVIvuzhsAfZvYdJWRIK4DhZj8pISUvVpmGQNjAg+SJFICkYu0XDUEwIUWhWMVW+JQqKruoUPwHEwutwggLvgJ1uKTNgWYrEvvVdq26AAjJs5hOLxi/xWsZ9I1mUkgm3da9+hCn7LJK5VLhJzuGmcghkYS+cv0gL0QLMwNLHUYjEWXSEwCjlezDN0p0BzYscsBDnOClNNgBFvsw0NbWyYcl4C2jGWcHzk0XXPNeipk5ekegltb/IkAfH1X0+Zm6hGdZqh6v3l3cdL+ioG5nv4CuwsL4U/gOY1l7Msd1VBDuU2k3+XPAph89WxCXieUujW5xIoPTC+0vqXAkHXn3fdOBL3+GOo/zMrAIswnWGjYNtL9+I9+KdJjA8xoppwPoCJqgFaTqYA6RP1wii8DHF1M8Wbudrd4fsAv7I0gUdtmmjcgucme23y1500wuVcZKsLuo2GDvvnHQJMjphY685IARw0BsVkFIRWFDGGdDf3xQC6aN5XpbYBJbsOlbMY8gx40FvVH8sVv/eIMwWiy3hC2YaKZvEWdNMilULBVd6qYc2GiDXiBSVLpLiK0xs/pQG5745c5Qn0V9GZjC1V8o5vqbLy99+4E69A9L/htHI/S/hzPUfCxp66dTMAloUAEEJmJTGqEzagIykyRhW3ucH5Kf+vncui7A2uwfEJMKiBxnmzsfSKFCvELPzsei0Nbhom
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(5400799015)(40470700004)(46966006)(36840700001)(107886003)(40460700003)(26005)(186003)(1076003)(40480700001)(478600001)(110136005)(7636003)(921005)(356005)(2906002)(8676002)(8936002)(36860700001)(83380400001)(41300700001)(336012)(426003)(5660300002)(34020700004)(47076005)(2616005)(82310400005)(316002)(4326008)(70206006)(70586007)(82740400003)(86362001)(6666004)(7696005)(36756003)(83996005)(2101003)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 04:08:08.9420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bd5b6c-f219-4d6c-d0bd-08db3c9ddb54
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
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

