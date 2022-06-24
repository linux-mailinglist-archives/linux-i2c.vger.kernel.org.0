Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F24559929
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbiFXMG5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbiFXMG4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:06:56 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F117FD0B;
        Fri, 24 Jun 2022 05:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0ibyOyrXbPFSUh6mYyKzU2HhMvY5RCFxKS39b5W1+WB0ZKaJC00xuoXJUBVWWhchp4E6XQKBfDHZdXwI8yJSqkCkBQYOJ6lUMrti854BMJZ8+wKEJ4Mr14mfhgpZOcshgzxYj8t9XcHYTxq1wpBmz+EbW1ixxpLqd11vrSnxZkKsxjEIu/oqFcfGe2LoYppWt/F+SMtTR0DoF7HJBYJNiF3NxRLroEPFg2bys7Ql1OkWvMfcbhbjOIHNt3AAvqacNs8uzM16ZXmYyETZqzxg1XZ6xU+Pt51RvortPTxuXSFwbWcDhv04zlnHCG3ILS7MYTbGkrHxRbKOD70w+pYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2AKS8s6dnWrCDGJXZ6uq+SKqvilRAa8SP3IfLFzYZ8=;
 b=QmiiJ0A9sl7H0neb49mEmm/88bUGTPtPB4ZltDcvxLnuMuZlH5wN7I/a8Qfg2GpZ6YQ5+s+//ZUhWGXI7tFPgJYSvEGtaLwUqP4G+aHm3Y9J3Uc0Ko8c+nK3DWxIKJjQ5Jr+a7SIQZjv65JENuHu8SrcU1x/B57Dbr0pKA3YAj6DwHkichcZ9npu4rBDWMCAEq351hhzLrr/ZBZtDCovyAeOjPw4PCd7U/HWxRNDYWxZd7Hvhprh4Z3CYbYv8n866neK5xJY7UzAMJYZo/kUmL07SjhXto0HSs2yEdZqSfynAbL8+XPe9cZ7/nNeDREqYJ587kdMsytGQNt0Arjf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2AKS8s6dnWrCDGJXZ6uq+SKqvilRAa8SP3IfLFzYZ8=;
 b=Oe6RO5tS0ez2fmdTv+PpH92Nt0xqJKfQjc2cwWHDzCEXB2uUCoCtVjDhAjHLw/82sCVVOwLFC/IzFiyFZ+4FSmfG4i8K36CDV+f1ekb/H+IuU41IZEe+WxFxEODa3LBETJ2/d3iMuzPp+2V7EOLpM9hh74iZ5dJUMKcttBxP2jY=
Received: from SN7PR04CA0236.namprd04.prod.outlook.com (2603:10b6:806:127::31)
 by BL0PR02MB4963.namprd02.prod.outlook.com (2603:10b6:208:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 12:06:53 +0000
Received: from SN1NAM02FT0049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:127:cafe::99) by SN7PR04CA0236.outlook.office365.com
 (2603:10b6:806:127::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 12:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0049.mail.protection.outlook.com (10.97.5.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:06:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:06:52 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:06:52 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47735 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i5L-0005Mt-OS; Fri, 24 Jun 2022 05:06:52 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 53B9E104545; Fri, 24 Jun 2022 17:35:48 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 06/12] i2c: xiic: Add smbus_block_read functionality
Date:   Fri, 24 Jun 2022 17:35:21 +0530
Message-ID: <1656072327-13628-7-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e0ad034-d185-405d-1831-08da55da0696
X-MS-TrafficTypeDiagnostic: BL0PR02MB4963:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQ6r0vxNkZQbdKrasBfTQ33FT+aqIY4mNyyZxDa5wkmKQ+UaWuc4Oq7laPKPpaIoaq/0p4tJ7UN2M0J6sPO9qCREyfwNBqgjey+vvShiVR0d2NlB3ZLjLtuKnUdjzxlapCcNWaGxisfGkF+1Ub5GBL9ltJ7r+kikLVyBbyWHxpbjgQKw2v6HOxTX2Qk3B1ZdLXeAPnaMINwyv7qJ1rhnFryFcCNxyC7+7b4llq7wUIv0p7gQO1t+KHsBD5O7idqRC5i+rNimascH4rMaiVRc3t6zP3xYCbq6Fa9Zg5iwFmT51qEDKwicoXRsxv6Ojwx6ZsL9gG+iH24mx+4Y5iSntmyS1MKUEI/G/Oqzk4kzJ+H9RIyZI1PC94xhFf8Eay8nnCDCCNDooVqrLuOT3Y9ZNT7EywctD65vtBsfM4pC1I+gm0g4oVrRoKUBJ7SSMu8r2laheMZSdKk2n3h4kOvap2C6CWMsSLe751NYsHmAP2R1g64wIiplG+0fN8cNtbN4H8aGM2eaQ/CyP4ZzbyGu2Hk6uRtTixUN5bzlzA44m3XzT6Ge6WCe/RN4yH8JGuwZ06pwdlxO8mIip4MBGKZ3XwNcGDBd+iboWkwniskECq/8ZwvwYXT/GSjhrBLZIaJ8Snrt1aq+vmQN9So3SYePsamT5/E3NIZBsbpstq4+9bJkxwyCRPp3SeUsOwTQOxG3khSbUagVwU+62L0IsUJKlBynIoIt9XoO7AUC1+2D5k8qPnBGmy2oBCoCVWfS2brFkntZoxtIt+j2rPKHPUy6C008fo/jhPKhRGPSX0znp7Phq/avQds4xsPhwhnu5wTKq+5KBJM67hPODnvUN663FSSXQa6hXE4adIxdayKfL2BKtdcFZfj8aPvzrnvVnDuf
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(36840700001)(46966006)(40470700004)(40480700001)(36756003)(2906002)(41300700001)(70206006)(83380400001)(40460700003)(44832011)(8936002)(316002)(70586007)(54906003)(42186006)(110136005)(5660300002)(478600001)(2616005)(47076005)(4326008)(336012)(26005)(107886003)(8676002)(82310400005)(6666004)(82740400003)(7636003)(36860700001)(356005)(43170500006)(6266002)(186003)(426003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:06:52.7296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0ad034-d185-405d-1831-08da55da0696
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4963
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

smbus_block_read is added to xiic driver to read from few sensors
which support this command. Since the number of bytes to read is not
known prior to transfer, we are using xiic standard mode for low level
control of IP.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 82 ++++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3debb44608cf..57ede62de67d 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -62,6 +62,7 @@ enum xiic_endian {
  * @singlemaster: Indicates bus is single master
  * @dynamic: Mode of controller
  * @prev_msg_tx: Previous message is Tx
+ * @smbus_block_read: Flag to handle block read
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -80,6 +81,7 @@ struct xiic_i2c {
 	bool singlemaster;
 	bool dynamic;
 	bool prev_msg_tx;
+	bool smbus_block_read;
 };
 
 #define XIIC_MSB_OFFSET 0
@@ -339,6 +341,54 @@ static void xiic_deinit(struct xiic_i2c *i2c)
 	xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr & ~XIIC_CR_ENABLE_DEVICE_MASK);
 }
 
+static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
+{
+	u8 rxmsg_len;
+	u8 rfd_set = 0;
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
+	rxmsg_len  = xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+
+	i2c->rx_msg->buf[i2c->rx_pos++] = rxmsg_len;
+
+	/* Check if received length is valid */
+	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		/* Set Receive fifo depth */
+		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
+			rfd_set = IIC_RX_FIFO_DEPTH - 1;
+			i2c->rx_msg->len = rxmsg_len + 1;
+		} else if ((rxmsg_len == 1) ||
+			(rxmsg_len == 0)) {
+			/*
+			 * Minimum of 3 bytes required to exit cleanly. 1 byte
+			 * already received, Second byte is being received. Have
+			 * to set NACK in read_rx before receiving the last byte
+			 */
+			i2c->rx_msg->len = 3;
+		} else {
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
@@ -361,6 +411,12 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
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
@@ -638,6 +694,12 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
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
 
@@ -777,8 +839,12 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
 		} else if ((rx_watermark == 1) || (rx_watermark == 0)) {
 			rfd_set = rx_watermark - 1;
-			/* Handle single byte transfer separately */
-			cr |= XIIC_CR_NO_ACK_MASK;
+
+			/* Set No_ACK, except for smbus_block_read */
+			if (!(i2c->rx_msg->flags & I2C_M_RECV_LEN)) {
+				/* Handle single byte transfer separately */
+				cr |= XIIC_CR_NO_ACK_MASK;
+			}
 		} else {
 			rfd_set = rx_watermark - 2;
 		}
@@ -970,10 +1036,14 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	/* Initialize prev message type */
 	i2c->prev_msg_tx = false;
 
-	/* Enter standard mode only when read length is > 255 bytes */
+	/*
+	 * Enter standard mode only when read length is > 255 bytes or
+	 * for smbus_block_read transaction
+	 */
 	for (count = 0; count < i2c->nmsgs; count++) {
-		if ((i2c->tx_msg[count].flags & I2C_M_RD) &&
-		    i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC) {
+		if (((i2c->tx_msg[count].flags & I2C_M_RD) &&
+		     i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC) ||
+		    (i2c->tx_msg[count].flags & I2C_M_RECV_LEN)) {
 			i2c->dynamic = false;
 			break;
 		}
@@ -1007,7 +1077,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 static u32 xiic_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
 static const struct i2c_algorithm xiic_algorithm = {
-- 
2.25.1

