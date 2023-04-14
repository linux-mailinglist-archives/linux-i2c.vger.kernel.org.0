Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E36C6E1AF9
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 06:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjDNEIO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 00:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjDNEIG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 00:08:06 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2218.outbound.protection.outlook.com [52.100.166.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40A6D7;
        Thu, 13 Apr 2023 21:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/jWBAyLX6rlOsx7+7OsaWtkc70m6EQMTSSpIIwx+XRFgKQQiX5G/Mezl8YVQ0ssIuY6oVW7k2bDAG9rk8ZY630b3I7wamVrKxaUO3303fEbkEqT5ukuhyzlQsV3w8yFp6s24xriszc0d7gff1EDzVyLmeYuUa7xgqqOJhapZkqbwrhFM74ezhrFK6yLZAROJSGYbUpkUSi7lgeD6FHvm8asm6uM4Ku4FgDa8mxSkWbrYdg5eyYbb4TSUg96qK3SM82wyJwOu5sohqtLXRY8sVnzU/lwrPDaH2iinRMse6WLHb6rnBYEN2enINhqkZKC33t2r0b7YefReYgUlCTwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpYEGtwQDDYJiOsncTk+df3Oh+ydk+jCBnxFDmtMXZk=;
 b=AUJImp7/lKWbQBSGnhGstTXKy7KabtuEBgKhOpJ6YDTq9MNAPRFkOp/C5pPMOG2iiESJI4nnoz1vMicX7KrnOnHCT7/4X8hMoSUhOCN6Pl5GzIukO6+mm6Bu+K8+Lm/tjIMEgWnxodU72HJ9wKAzdO7fPZKlUuNVu8BIiuyVavhy8iiBZ9LuMYPlnMTjZzJHj9Tcce1tGYdli77GzWp2iK9ClcR/lklRsbf1lXyLrVp4MN2WQOPERVAZu72vm2xSJB1/ACz9/no49f3zNxw9aMPDsiuTMbvUCHDkBYNeGk0c/ob3+K6ZkItLY7CMQhphRdgXIAnkDnwPZG7aC6ZHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpYEGtwQDDYJiOsncTk+df3Oh+ydk+jCBnxFDmtMXZk=;
 b=VRbq/ZJcy4bI/LdGIUy8veU2wKjuzwJXrUH+cUhzctzTVeT2daWchaZQf5cUjEzmed3nI3ndjEVptsjBSCWzfVEZzZ8LvjJi4bKKAWVZYV35460I55UGhlge2sl91tgahnP27U3Gd3J4A/4f2Z0TvJk5BIGlQfC4TBBhj3ahmKoJcW52RFbcDB3d4O8SmCZYe3XBowt/xjlxy7gWRxPkBGa4HXV0B1LPVJZ5txmkrqoqveHykZvuV9eSlRYb4NZ097Yl1+OHdnK3Xcu7DdXnkze4qbeVuMMLkxEsxC8QLEYLWyLmJ9tEEUWu0woeVVXkHR7YgWkY0WWa6gsC7m89hQ==
Received: from MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::20)
 by PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Fri, 14 Apr
 2023 04:07:56 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::6d) by MW4P223CA0015.outlook.office365.com
 (2603:10b6:303:80::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Fri, 14 Apr 2023 04:07:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Fri, 14 Apr 2023 04:07:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 13 Apr 2023
 21:07:45 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 13 Apr
 2023 21:07:44 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 13 Apr 2023 21:07:41 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v6 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Date:   Fri, 14 Apr 2023 09:37:10 +0530
Message-ID: <20230414040711.19370-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414040711.19370-1-akhilrajeev@nvidia.com>
References: <20230414040711.19370-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c919992-75c0-479b-2d56-08db3c9dd40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzWmJSONBiVyrNzzTQ0t+30nq8hWH/sKguZzWFZYnD2UNORAm1+kC6ZjYK1Zh+GR/2LVkG9YEyQ3ee5AEzs4h89iPCNTZdVk/Ang9oHPyhfiwctV9ZcEjqK3PLVVybhhUFys4RpeEfr6tn0gRc93aKeZw+uddmelzvAp0yfPksYLmjVawrlvQBUSQ9XBuEIp7jvlSAWAurWumS8/T1Frybf0qlO2u50QSkUYfi61Y5AXJ8AXcmN1PdYpoVMyTcrRh5jo3OGRECUsF7G7kxgeKG3rJ7SwTwJs4l7lGo7/1G44FFKp36V/idyksMYx8+NZmdHI+bJIspGWwAENvSySwrAza72hJS8lArSo8whwasRPPOAFAXpWiSOO1sGg19/MPSupsYr1Sdl53YIeJRUKX9YqhNURhRt+ZfC47DK+r9DQ0c/AAa0v9H+FqaKqswI4WUzKR8FE7IwCtX+n742suecFkjzezRgtrOlil+kGPV67U8DbQYNpjJ7/CNgtPUVhuRLneIyU10IM7pRMcAk/gP4Mfj09+CWNSM5uip7gT7U+we/ShSp9wTqJLEzi3DquVu0YJVyH5+3WNuB74xQlRjxzTsJkxBlvUZ7mMpvjP5Jh5jno8g6utZQXYbUTwfh1O6v2hL5xXOSM2z2AMuA9NAVnfbpUWDMoyP+lmQGvdVr3LUSlRg+eGxwy4Z0MRLRpmZ9Fn23e/eycJkDtxypEia7U0yws9xvb+7L058SQFeJVBM0TLZ6bumlUCwFxWZVaeULMqMKUOJsFpnDj6NrN8MtJNI3txdvQNUyu5RltlNygTFZO7FEjR/rMmeIatJjV8garTw59X5x3jkR0LRJt0L/najUEv/gej6Ijdq6H/JAfW6Cr5u5fuZcUL1lCQMhK
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(5400799015)(46966006)(36840700001)(40470700004)(478600001)(34020700004)(6666004)(8676002)(8936002)(316002)(40480700001)(41300700001)(4326008)(82740400003)(70206006)(70586007)(110136005)(7636003)(356005)(921005)(40460700003)(36756003)(2906002)(36860700001)(107886003)(186003)(47076005)(26005)(426003)(86362001)(336012)(1076003)(82310400005)(2616005)(83380400001)(5660300002)(7696005)(83996005)(2101003)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 04:07:56.7350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c919992-75c0-479b-2d56-08db3c9dd40e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update the msg->len value correctly for SMBUS block read. The discrepancy
went unnoticed as msg->len is used in SMBUS transfers only when a PEC
byte is added.

Fixes: d7583c8a5748 ("i2c: tegra: Add SMBus block read function")
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 40 +++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6aab84c8d22b..157066f06a32 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -242,9 +242,10 @@ struct tegra_i2c_hw_feature {
  * @is_dvc: identifies the DVC I2C controller, has a different register layout
  * @is_vi: identifies the VI I2C controller, has a different register layout
  * @msg_complete: transfer completion notifier
+ * @msg_buf_remaining: size of unsent data in the message buffer
+ * @msg_len: length of message in current transfer
  * @msg_err: error code for completed message
  * @msg_buf: pointer to current message data
- * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_read: indicates that the transfer is a read access
  * @timings: i2c timings information like bus frequency
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
@@ -277,6 +278,7 @@ struct tegra_i2c_dev {
 
 	struct completion msg_complete;
 	size_t msg_buf_remaining;
+	unsigned int msg_len;
 	int msg_err;
 	u8 *msg_buf;
 
@@ -1169,7 +1171,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
 
-	packet_header = msg->len - 1;
+	packet_header = i2c_dev->msg_len - 1;
 
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
@@ -1242,20 +1244,32 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		return err;
 
 	i2c_dev->msg_buf = msg->buf;
+	i2c_dev->msg_len = msg->len;
 
-	/* The condition true implies smbus block read and len is already read */
-	if (msg->flags & I2C_M_RECV_LEN && end_state != MSG_END_CONTINUE)
-		i2c_dev->msg_buf = msg->buf + 1;
-
-	i2c_dev->msg_buf_remaining = msg->len;
 	i2c_dev->msg_err = I2C_ERR_NONE;
 	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
 	reinit_completion(&i2c_dev->msg_complete);
 
+	/*
+	 * For SMBUS block read command, read only 1 byte in the first transfer.
+	 * Adjust that 1 byte for the next transfer in the msg buffer and msg
+	 * length.
+	 */
+	if (msg->flags & I2C_M_RECV_LEN) {
+		if (end_state == MSG_END_CONTINUE) {
+			i2c_dev->msg_len = 1;
+		} else {
+			i2c_dev->msg_buf += 1;
+			i2c_dev->msg_len -= 1;
+		}
+	}
+
+	i2c_dev->msg_buf_remaining = i2c_dev->msg_len;
+
 	if (i2c_dev->msg_read)
-		xfer_size = msg->len;
+		xfer_size = i2c_dev->msg_len;
 	else
-		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
+		xfer_size = i2c_dev->msg_len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
 
@@ -1295,7 +1309,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (!i2c_dev->msg_read) {
 		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
-			       msg->buf, msg->len);
+			       msg->buf, i2c_dev->msg_len);
 
 			dma_sync_single_for_device(i2c_dev->dma_dev,
 						   i2c_dev->dma_phys,
@@ -1352,7 +1366,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						i2c_dev->dma_phys,
 						xfer_size, DMA_FROM_DEVICE);
 
-			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg->len);
+			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, i2c_dev->msg_len);
 		}
 	}
 
@@ -1408,8 +1422,8 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
 			if (ret)
 				break;
-			/* Set the read byte as msg len */
-			msgs[i].len = msgs[i].buf[0];
+			/* Set the msg length from first byte */
+			msgs[i].len += msgs[i].buf[0];
 			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
 		}
 		ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], end_type);
-- 
2.17.1

