Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520025E5DDF
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbiIVIrF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiIVIql (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:46:41 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F84BD0784;
        Thu, 22 Sep 2022 01:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYJ0A5O/vRSCXaNHx7jBmeCxxAtTyaHFadaQ9k2hBWJrHB7OffsjFCzVtv45ZZnJdn0+vR8CE4v/fJXDtZy3n4mWOgNNK6xgwcHtxNQnxcs/+dmYRcmcEABrgTJR9LJxot2Zl9CVMBXJnqYecWjd1VoNflwEDTkXjqt/LJTrQqmt3htrPpgArBUiYkuF17nR+UO9EUs1KknpbZS3htsHces2t8Xu466ttQc9+aEIm6wD9z3xf47/Jp45Dc7taTKXlx4cOIu7FDJ/11MNIPBN6vI2o+ftJeQ7M166G7W0FXidTczHEXEPRl+H8TMpA9dj7dqtV47J7145T5FeZw4sLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5EIQEq/Tx7ZHLxSepp76JSAB0cjGhHVe142jzVakJs=;
 b=k+3g/0Cx34SWLYMbVVz2RCJJDpWB8YoRGyJPwuBnyRFnDCOfY0GM5O+FaDdSl7nYldO3TSFtL8KTTeVj3ETtimaOyzzU7eM9eQs4Tv2Y+mgshULvXgQPBuKJlMMxg7UoC2oUyQ7P9YOs4d2U8eylvp6sZ/kipH0/7YeDdi5bJlOfltKsC2d5qVdf4QLDtjYdzptyvdeaslfIzmtEhikGRmfDS2TVNpYT59M+Ep88ZJ9e3GVUcQyBkOhqnXIoFj2po97+GtxoihVepWZH+H+N+HTBo8s7KRs4rdJatsY7tpE9Kw2EAuKaX3P97kbW4WHBjy/0jJuW1QxLXdwDmqSu0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5EIQEq/Tx7ZHLxSepp76JSAB0cjGhHVe142jzVakJs=;
 b=GMqmsliEYxPwx2MnEjZbypSDz4QHc/eEIwwXFkZtSAqrJ72nRVFpo5FlDrDwBTuxg7FaD34dEzmgOn6BGClB5u9rjnYP2Bl8nNVV4Ous+JObSn6Bo4XueElnxZcn9ULVEpymsXw4fUlqHIURTaDrdIrtHQs3tFW5OA2U9JEOr4s=
Received: from BN8PR12CA0002.namprd12.prod.outlook.com (2603:10b6:408:60::15)
 by SA0PR02MB7274.namprd02.prod.outlook.com (2603:10b6:806:e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 08:46:27 +0000
Received: from BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::17) by BN8PR12CA0002.outlook.office365.com
 (2603:10b6:408:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 08:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT033.mail.protection.outlook.com (10.13.3.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:46:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:46:10 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:46:10 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54843 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHqT-0001o1-L9; Thu, 22 Sep 2022 01:46:10 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id 5786761053; Thu, 22 Sep 2022 14:15:12 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 5/9] i2c: xiic: Add smbus_block_read functionality
Date:   Thu, 22 Sep 2022 14:14:50 +0530
Message-ID: <1663836294-5698-6-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT033:EE_|SA0PR02MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6b69e9-ce3e-49cc-5a19-08da9c76efc1
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJGUuYZZ6AKOQwPGPEyKKSWdcrX+82OZc5bMHnQK0T7I2uccO0O+76EInTD8ggVfMebNnKqyXr8S338R/MT/ZxxjYnHyKlca3SwbKxRtEl+o/AhveEG3XefJJbQTpI4gtH6jfPuLJtxC/+xhj3Fth/jg8uSokSI5bxLkiIrfUpymTYHKBvUL70RjF2EBR+VdIOuK81scfEuzMAkrdWS2iTA4RoNM37EgcGAGR7TrNN0wKvUxMEWcAtlAuVyq5d4YGmHUxtYzPvPPutl8rO8G0wNES64eDzQGeskLSSxxbsSVDupIy+fNYlQzE7/OGnsoGbugDFk5dN2U9KsRBfuWJ5vqpNWibSXEUYJpQZNIw5ZfM+EvvlcPQiaYIaIdokDFhiToXIthBCBGt4ToNqHUqmZFkVgtnepyGMMNIqLBMi7vntU5HGLAmMVKTy262+SohJ8H2MYI2M22A+xidP3AAnbsJcOv4uEjzKHFl4emzIKzrQGS/n3R2mwDO/G9oefVuXEd7WVv5bzzEcbY7Mqq+hGAi8XfUB2UfezaHZjXg6mm5epFlnlsOZyUuUIjAYiS8G5ipdIpX2ra8nQ2hcC40ScXWS7vJ2nfaKdPgKyz5ENB+uTYQNXWaUncdCpaSM9QGniti7ko3fbPbPx1qG+akiuc/6wKPoV7g9q+tB+PzHSHg5uJFIOSEzZNAIqVv9QwhZYCKI5cBEr29ry+oMF4WJEgzFYYo12HOUgt+zvqgZjKxCWONsdQ+7N9nAek3LmVVE6nfFbBXjrY2GS/fSPxMhAF3M2XaetJ7At5qyz5ZjVtEsLW7P8Mrj5118h8neDGCXqIRKxFy/ZcztCFTU7lbdlmMDexvw43hNX7mtjEHJc=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(8936002)(5660300002)(44832011)(316002)(70206006)(110136005)(42186006)(54906003)(70586007)(8676002)(336012)(4326008)(82740400003)(83380400001)(426003)(43170500006)(41300700001)(47076005)(6666004)(107886003)(40460700003)(36860700001)(478600001)(40480700001)(2616005)(186003)(7636003)(26005)(6266002)(82310400005)(356005)(36756003)(2906002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:46:26.7284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6b69e9-ce3e-49cc-5a19-08da9c76efc1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7274
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

smbus_block_read is added to xiic driver to read from few sensors
which support this command. Since the number of bytes to read is not
known prior to transfer, xiic standard mode is being used for low level
control of IP.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 82 +++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 1149104074a7..8bd33dfdff91 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -33,6 +33,7 @@
 
 #define DRIVER_NAME "xiic-i2c"
 #define DYNAMIC_MODE_READ_BROKEN_BIT	BIT(0)
+#define SMBUS_BLOCK_READ_MIN_LEN	3
 
 enum xilinx_i2c_state {
 	STATE_DONE,
@@ -64,6 +65,7 @@ enum xiic_endian {
  * @dynamic: Mode of controller
  * @prev_msg_tx: Previous message is Tx
  * @quirks: To hold platform specific bug info
+ * @smbus_block_read: Flag to handle block read
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -83,6 +85,7 @@ struct xiic_i2c {
 	bool dynamic;
 	bool prev_msg_tx;
 	u32 quirks;
+	bool smbus_block_read;
 };
 
 struct xiic_version_data {
@@ -346,6 +349,62 @@ static void xiic_deinit(struct xiic_i2c *i2c)
 	xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr & ~XIIC_CR_ENABLE_DEVICE_MASK);
 }
 
+static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
+{
+	u8 rxmsg_len, rfd_set = 0;
+
+	/*
+	 * Clear the I2C_M_RECV_LEN flag to avoid setting
+	 * message length again
+	 */
+	i2c->rx_msg->flags &= ~I2C_M_RECV_LEN;
+
+	/* Set smbus_block_read flag to identify in isr */
+	i2c->smbus_block_read = true;
+
+	/* Read byte from rx fifo and set message length */
+	rxmsg_len = xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+
+	i2c->rx_msg->buf[i2c->rx_pos++] = rxmsg_len;
+
+	/* Check if received length is valid */
+	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		/* Set Receive fifo depth */
+		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
+			/*
+			 * When Rx msg len greater than or equal to Rx fifo capacity
+			 * Receive fifo depth should set to Rx fifo capacity minus 1
+			 */
+			rfd_set = IIC_RX_FIFO_DEPTH - 1;
+			i2c->rx_msg->len = rxmsg_len + 1;
+		} else if ((rxmsg_len == 1) ||
+			(rxmsg_len == 0)) {
+			/*
+			 * Minimum of 3 bytes required to exit cleanly. 1 byte
+			 * already received, Second byte is being received. Have
+			 * to set NACK in read_rx before receiving the last byte
+			 */
+			rfd_set = 0;
+			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
+		} else {
+			/*
+			 * When Rx msg len less than Rx fifo capacity
+			 * Receive fifo depth should set to Rx msg len minus 2
+			 */
+			rfd_set = rxmsg_len - 2;
+			i2c->rx_msg->len = rxmsg_len + 1;
+		}
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
+
+		return;
+	}
+
+	/* Invalid message length, trigger STATE_ERROR with tx_msg_len in ISR */
+	i2c->tx_msg->len = 3;
+	i2c->smbus_block_read = false;
+	dev_err(i2c->adap.dev.parent, "smbus_block_read Invalid msg length\n");
+}
+
 static void xiic_read_rx(struct xiic_i2c *i2c)
 {
 	u8 bytes_in_fifo, cr = 0, bytes_to_read = 0;
@@ -368,6 +427,12 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
 	if (!i2c->dynamic) {
 		bytes_rem = xiic_rx_space(i2c) - bytes_in_fifo;
 
+		/* Set msg length if smbus_block_read */
+		if (i2c->rx_msg->flags & I2C_M_RECV_LEN) {
+			xiic_smbus_block_read_setup(i2c);
+			return;
+		}
+
 		if (bytes_rem > IIC_RX_FIFO_DEPTH) {
 			bytes_to_read = bytes_in_fifo;
 		} else if (bytes_rem > 1) {
@@ -601,6 +666,12 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
 
+		if (i2c->tx_msg && i2c->smbus_block_read) {
+			i2c->smbus_block_read = false;
+			/* Set requested message len=1 to indicate STATE_DONE */
+			i2c->tx_msg->len = 1;
+		}
+
 		if (!i2c->tx_msg)
 			goto out;
 
@@ -741,11 +812,14 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
 		} else if (rx_watermark == 1) {
 			rfd_set = rx_watermark - 1;
-			/* Handle single byte transfer separately */
-			cr |= XIIC_CR_NO_ACK_MASK;
+
+			/* Set No_ACK, except for smbus_block_read */
+			if (!(i2c->rx_msg->flags & I2C_M_RECV_LEN)) {
+				/* Handle single byte transfer separately */
+				cr |= XIIC_CR_NO_ACK_MASK;
+			}
 		} else if (rx_watermark == 0) {
 			rfd_set = rx_watermark;
-			cr |= XIIC_CR_NO_ACK_MASK;
 		} else {
 			rfd_set = rx_watermark - 2;
 		}
@@ -984,7 +1058,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 static u32 xiic_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
 static const struct i2c_algorithm xiic_algorithm = {
-- 
2.25.1

