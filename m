Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 017BB687936
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbjBBJnA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjBBJm7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:42:59 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13E986E84;
        Thu,  2 Feb 2023 01:42:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcELjFkHJKoDWEitUVjVgBPRlP09WpgGxkIJncpan/s1zbRo1bWcjpNoZT/4FxMm5jtmFtCFZ9uIWkQgrWzSgNsdpwjtWSRw3N3PadFfJ+/sg7MZ5RZbqaGfFfYoKLpSs8d9wleYrTbTjARUYrCiCOD6OzYU9ZjGKvEQzhWBge0UnnY37g1DmGek2u1icOju5R5ZmLu0enFa+RxdT+yz4xSIfGnWOeK0bGYPLRtPmR+57mlqbIaypKvgyGpCBG3r2Io8DA/s3lEUA1YsWae8DjZC6Yub2J/Caw4HtleWhhHESl4L1nX/089WbtE0SOLPAxhLtsoIMcGH7pw9WLV+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CDCtUY/Xlt4AAaJ94S7dea83SzgaWliGOFTqsANIgY=;
 b=edESK0oiZb2dxgyR2/4p10XcpJPXWj0u12g7NMfhwGIDpJqw5A92lHbNsNNeyODuCgXIgmMv42vcBTfgR5hupZdXy+Pxvvd5DEl9NH85M0MiqlQ4id/ExSBa6fIueRN8Mwq0Fe/Oo/a9cbb+pZwj36BPAAKLZCdasxZUzVtrMx7Q674mdRiz7u7XBkAuDzq9yjwMairkXeN5c3qJtrHvBrw9PfDoq5esDvDPrZ9gkD+hvBCOrpbehi/0p//Rk3XySL0gyq4Ow0na6L8WkKGHXeff/izYRHRM1oeVjVNqP3rUTfTt4wAaFXHCSxUk9z74+bl72grMF+sgihE52efZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CDCtUY/Xlt4AAaJ94S7dea83SzgaWliGOFTqsANIgY=;
 b=P67cjxaZ1J3TTNP8//pvUU3rlJvthUF3KBq0gGkv+MCIvpwjaMFc+dp4tABJG6mQIuv+Z3pTmMx1zJCrVxQxW1q4lorMzRqJrOsMMg0SPoaPyL1VzMOGma53tR5oN96jvWQsK97fyDs0Onz9Lc6S9kXytghf3CBhimPI4dXzuMM=
Received: from BN9PR03CA0160.namprd03.prod.outlook.com (2603:10b6:408:f4::15)
 by DM6PR02MB6923.namprd02.prod.outlook.com (2603:10b6:5:25e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Thu, 2 Feb
 2023 09:42:44 +0000
Received: from BN1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::4a) by BN9PR03CA0160.outlook.office365.com
 (2603:10b6:408:f4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 09:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT009.mail.protection.outlook.com (10.13.2.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.25 via Frontend Transport; Thu, 2 Feb 2023 09:42:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 01:42:33 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 01:42:33 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 andrew@lunn.ch,
 devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=36992 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pNW6y-0003IP-PV; Thu, 02 Feb 2023 01:42:33 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id AC1581055BA; Thu,  2 Feb 2023 15:12:21 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <devicetree@vger.kernel.org>, <andrew@lunn.ch>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V4 1/9] i2c: xiic: Add standard mode support for > 255 byte
Date:   Thu, 2 Feb 2023 15:11:30 +0530
Message-ID: <1675330898-563-2-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT009:EE_|DM6PR02MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: a47abc7e-9097-475f-c729-08db0501d5ab
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I5c1Nu/j+JsFQF2F6nFSqrPNEyplXo0XNvqsr0NQpzjmAHBlks0gdfji+jYr3Cqdo4F7ro9XD0zhRLH+ujXZl9v8mkMK5ItgyoNvrZfD7n0Mxd5Xn6avEWD+7NMOqoXFMndhphGbgS4qx+h2Ql4CONdmQ/xkGCcKSIWYQBk9q82fN/U3DdL3d+92rVQRPpJdpHEtqD5naGj+Mw31r9PeifT6U9P4xoZ58yaNocVAgX7A4QAKxpv0c9DHFx2oQRfdNBYDwqPuQtSFw6AzSPIH2wSbMeB8FNln3Slanj0tVVhXOd6nkbVHJ7GiUjg1qreuDo2VdjYo0KY4mm5uCBmB6XFuT7PQ2thMwpm78laMa50noa5t1mo3V9hOEgGCrCCh5rjpL6vnldzo29RkKQWl1taOvpK1eNRqSg/bj7/PNWoUsALmt3piP8AG45RFXTfZ0vwM7Z9QGqnqp5tNC4ZGQeuNFNkiowyZdfaJthbN1etUHE7O6gA0nRRBwo3617OGoYRC1YigSjZJxnyfU9uxpuXeDlMjv81jCiuXTMDl3rOJKD7oby1FIJDG7DwUJUe8QIgrJeNpSFr/IR1JJUM9RJRkdRJs18TCa/GgWVh19HvU12RVL9md/VNX2mTCL4wxFa+smpws8kIBGtNhApPj6kEwB9ghOocbcPbTpkQbNjyjzFyw15BTrnmBcqchcPRg7OIzxQAUECDYznG+kVvRJaZoAtamJS4wA+VIfdxI5o0Mk90vU3XzvsKofqGhvgme
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(396003)(39860400002)(376002)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(7416002)(5660300002)(6266002)(36756003)(40460700003)(30864003)(356005)(44832011)(26005)(186003)(83170400001)(82740400003)(107886003)(6666004)(2616005)(82310400005)(42186006)(316002)(54906003)(110136005)(7636003)(40480700001)(478600001)(70206006)(336012)(83380400001)(2906002)(42882007)(4326008)(8936002)(8676002)(36860700001)(70586007)(47076005)(41300700001)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:42:43.9405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a47abc7e-9097-475f-c729-08db0501d5ab
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6923
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

read transfers

Added standard mode for AXI I2C controller to enable read transfers
of size more than 255 bytes. The driver selects standard mode in the
following scenarios.

1. If a single message request comes from user space, requesting a
read of more than 255 bytes

2. If a message set request comes from user space consisting of many
messages and if any one of them is a read operation, irrespective
of the size of transfer. (This is done because it is observed that
repeated start operation is not happening in dynamic mode read as
expected in a message set request from user space.)

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
Changes for v2:
Merged the logic of xiic_std_fill_tx_fifo into xiic_fill_tx_fifo to remove
duplicate code.
Handled i2c msg->len == 0 case.
Squashed "Use 'nmsgs' variable instead of repeated_start" patch.
Squashed "Correct the BNB interrupt enable sequence" patch.
Squashed "remove unsupported flag I2C_M_NOSTART code" patch.
---
 drivers/i2c/busses/i2c-xiic.c | 266 ++++++++++++++++++++++++++++------
 1 file changed, 225 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index bee5a2ef1f22..839564054501 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -60,6 +60,7 @@ enum xiic_endian {
  * @clk: Pointer to AXI4-lite input clock
  * @state: See STATE_
  * @singlemaster: Indicates bus is single master
+ * @dynamic: Mode of controller
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -76,6 +77,7 @@ struct xiic_i2c {
 	struct clk *clk;
 	enum xilinx_i2c_state state;
 	bool singlemaster;
+	bool dynamic;
 };
 
 #define XIIC_MSB_OFFSET 0
@@ -143,6 +145,9 @@ struct xiic_i2c {
 #define XIIC_TX_DYN_START_MASK            0x0100 /* 1 = Set dynamic start */
 #define XIIC_TX_DYN_STOP_MASK             0x0200 /* 1 = Set dynamic stop */
 
+/* Dynamic mode constants */
+#define MAX_READ_LENGTH_DYNAMIC                255 /* Max length for dynamic read */
+
 /*
  * The following constants define the register offsets for the Interrupt
  * registers. There are some holes in the memory map for reserved addresses
@@ -316,13 +321,14 @@ static void xiic_deinit(struct xiic_i2c *i2c)
 
 static void xiic_read_rx(struct xiic_i2c *i2c)
 {
-	u8 bytes_in_fifo;
+	u8 bytes_in_fifo, cr = 0, bytes_to_read = 0;
+	u32 bytes_rem = 0;
 	int i;
 
 	bytes_in_fifo = xiic_getreg8(i2c, XIIC_RFO_REG_OFFSET) + 1;
 
 	dev_dbg(i2c->adap.dev.parent,
-		"%s entry, bytes in fifo: %d, msg: %d, SR: 0x%x, CR: 0x%x\n",
+		"%s entry, bytes in fifo: %d, rem: %d, SR: 0x%x, CR: 0x%x\n",
 		__func__, bytes_in_fifo, xiic_rx_space(i2c),
 		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
 		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
@@ -330,13 +336,52 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
 	if (bytes_in_fifo > xiic_rx_space(i2c))
 		bytes_in_fifo = xiic_rx_space(i2c);
 
-	for (i = 0; i < bytes_in_fifo; i++)
+	bytes_to_read = bytes_in_fifo;
+
+	if (!i2c->dynamic) {
+		bytes_rem = xiic_rx_space(i2c) - bytes_in_fifo;
+
+		if (bytes_rem > IIC_RX_FIFO_DEPTH) {
+			bytes_to_read = bytes_in_fifo;
+		} else if (bytes_rem > 1) {
+			bytes_to_read = bytes_rem - 1;
+		} else if (bytes_rem == 1) {
+			bytes_to_read = 1;
+			/* Set NACK in CR to indicate slave transmitter */
+			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr |
+					XIIC_CR_NO_ACK_MASK);
+		} else if (bytes_rem == 0) {
+			bytes_to_read = bytes_in_fifo;
+
+			/* Generate stop on the bus if it is last message */
+			if (i2c->nmsgs == 1) {
+				cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+				xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
+						~XIIC_CR_MSMS_MASK);
+			}
+
+			/* Make TXACK=0, clean up for next transaction */
+			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
+					~XIIC_CR_NO_ACK_MASK);
+		}
+	}
+
+	/* Read the fifo */
+	for (i = 0; i < bytes_to_read; i++) {
 		i2c->rx_msg->buf[i2c->rx_pos++] =
 			xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	}
 
-	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET,
-		(xiic_rx_space(i2c) > IIC_RX_FIFO_DEPTH) ?
-		IIC_RX_FIFO_DEPTH - 1 :  xiic_rx_space(i2c) - 1);
+	if (i2c->dynamic) {
+		u8 bytes;
+
+		/* Receive remaining bytes if less than fifo depth */
+		bytes = min_t(u8, xiic_rx_space(i2c), IIC_RX_FIFO_DEPTH);
+		bytes--;
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
+	}
 }
 
 static int xiic_tx_fifo_space(struct xiic_i2c *i2c)
@@ -360,7 +405,15 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 
 		if (!xiic_tx_space(i2c) && i2c->nmsgs == 1) {
 			/* last message in transfer -> STOP */
-			data |= XIIC_TX_DYN_STOP_MASK;
+			if (i2c->dynamic) {
+				data |= XIIC_TX_DYN_STOP_MASK;
+			} else {
+				u8 cr;
+				/* Write to CR to stop */
+				cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+				xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
+					     ~XIIC_CR_MSMS_MASK);
+			}
 			dev_dbg(i2c->adap.dev.parent, "%s TX STOP\n", __func__);
 		}
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
@@ -401,7 +454,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	dev_dbg(i2c->adap.dev.parent, "%s: SR: 0x%x, msg: %p, nmsgs: %d\n",
 		__func__, xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
 		i2c->tx_msg, i2c->nmsgs);
-
+	dev_dbg(i2c->adap.dev.parent, "%s, ISR: 0x%x, CR: 0x%x\n",
+		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 
 	/* Service requesting interrupt */
 	if ((pend & XIIC_INTR_ARB_LOST_MASK) ||
@@ -579,31 +634,101 @@ static int xiic_busy(struct xiic_i2c *i2c)
 static void xiic_start_recv(struct xiic_i2c *i2c)
 {
 	u16 rx_watermark;
+	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
+	unsigned long flags;
 
-	/* Clear and enable Rx full interrupt. */
-	xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK | XIIC_INTR_TX_ERROR_MASK);
+	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
+		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 
-	/* we want to get all but last byte, because the TX_ERROR IRQ is used
-	 * to inidicate error ACK on the address, and negative ack on the last
-	 * received byte, so to not mix them receive all but last.
-	 * In the case where there is only one byte to receive
-	 * we can check if ERROR and RX full is set at the same time
-	 */
-	rx_watermark = msg->len;
-	if (rx_watermark > IIC_RX_FIFO_DEPTH)
-		rx_watermark = IIC_RX_FIFO_DEPTH;
-	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, (u8)(rx_watermark - 1));
+	/* Disable Tx interrupts */
+	xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK | XIIC_INTR_TX_EMPTY_MASK);
+
+	if (i2c->dynamic) {
+		u8 bytes;
+		u16 val;
+
+		/* Clear and enable Rx full interrupt. */
+		xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
+				XIIC_INTR_TX_ERROR_MASK);
+
+		/*
+		 * We want to get all but last byte, because the TX_ERROR IRQ
+		 * is used to indicate error ACK on the address, and
+		 * negative ack on the last received byte, so to not mix
+		 * them receive all but last.
+		 * In the case where there is only one byte to receive
+		 * we can check if ERROR and RX full is set at the same time
+		 */
+		rx_watermark = msg->len;
+		bytes = min_t(u8, rx_watermark, IIC_RX_FIFO_DEPTH);
+
+		if (rx_watermark > 0)
+			bytes--;
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
+
+		local_irq_save(flags);
 
-	if (!(msg->flags & I2C_M_NOSTART))
 		/* write the address */
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
-			i2c_8bit_addr_from_msg(msg) | XIIC_TX_DYN_START_MASK);
+			      i2c_8bit_addr_from_msg(msg) |
+			      XIIC_TX_DYN_START_MASK);
+
+		/* If last message, include dynamic stop bit with length */
+		val = (i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0;
+		val |= msg->len;
+
+		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
+
+		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+
+		local_irq_restore(flags);
+	} else {
+		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+
+		/* Set Receive fifo depth */
+		rx_watermark = msg->len;
+		if (rx_watermark > IIC_RX_FIFO_DEPTH) {
+			rfd_set = IIC_RX_FIFO_DEPTH - 1;
+		} else if (rx_watermark == 1) {
+			rfd_set = rx_watermark - 1;
+			/* Handle single byte transfer separately */
+			cr |= XIIC_CR_NO_ACK_MASK;
+		} else if (rx_watermark == 0) {
+			rfd_set = rx_watermark;
+			cr |= XIIC_CR_NO_ACK_MASK;
+		} else {
+			rfd_set = rx_watermark - 2;
+		}
+		/* Check if RSTA should be set */
+		if (cr & XIIC_CR_MSMS_MASK) {
+			/* Already a master, RSTA should be set */
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
+					XIIC_CR_REPEATED_START_MASK) &
+					~(XIIC_CR_DIR_IS_TX_MASK));
+		}
 
-	xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
 
-	xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
-		msg->len | ((i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0));
+		/* Clear and enable Rx full and transmit complete interrupts */
+		xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
+				XIIC_INTR_TX_ERROR_MASK);
+
+		/* Write the address */
+		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
+			      i2c_8bit_addr_from_msg(msg));
+
+		/* Write to Control Register,to start transaction in Rx mode */
+		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
+					XIIC_CR_MSMS_MASK)
+					& ~(XIIC_CR_DIR_IS_TX_MASK));
+		}
+		dev_dbg(i2c->adap.dev.parent, "%s end, ISR: 0x%x, CR: 0x%x\n",
+			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+			xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+	}
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
@@ -611,10 +736,15 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
+
+	/* Enable interrupts */
+	xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
 }
 
 static void xiic_start_send(struct xiic_i2c *i2c)
 {
+	u8 cr = 0;
+	u16 data;
 	struct i2c_msg *msg = i2c->tx_msg;
 
 	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, len: %d",
@@ -623,24 +753,56 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
 		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 
-	if (!(msg->flags & I2C_M_NOSTART)) {
+	if (i2c->dynamic) {
 		/* write the address */
-		u16 data = i2c_8bit_addr_from_msg(msg) |
-			XIIC_TX_DYN_START_MASK;
-		if ((i2c->nmsgs == 1) && msg->len == 0)
+		data = i2c_8bit_addr_from_msg(msg) |
+				XIIC_TX_DYN_START_MASK;
+
+		if (i2c->nmsgs == 1 && msg->len == 0)
 			/* no data and last message -> add STOP */
 			data |= XIIC_TX_DYN_STOP_MASK;
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
-	}
 
-	/* Clear any pending Tx empty, Tx Error and then enable them. */
-	xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_ERROR_MASK |
-		XIIC_INTR_BNB_MASK |
-		((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
-			XIIC_INTR_TX_HALF_MASK : 0));
+		/* Clear any pending Tx empty, Tx Error and then enable them */
+		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
+				XIIC_INTR_TX_ERROR_MASK |
+				XIIC_INTR_BNB_MASK |
+				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
+				XIIC_INTR_TX_HALF_MASK : 0));
+
+		xiic_fill_tx_fifo(i2c);
+	} else {
+		/* Check if RSTA should be set */
+		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+		if (cr & XIIC_CR_MSMS_MASK) {
+			/* Already a master, RSTA should be set */
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
+					XIIC_CR_REPEATED_START_MASK |
+					XIIC_CR_DIR_IS_TX_MASK) &
+					~(XIIC_CR_NO_ACK_MASK));
+		}
+
+		/* Write address to FIFO */
+		data = i2c_8bit_addr_from_msg(msg);
+		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
 
-	xiic_fill_tx_fifo(i2c);
+		/* Fill fifo */
+		xiic_fill_tx_fifo(i2c);
+
+		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
+			/* Start Tx by writing to CR */
+			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr |
+					XIIC_CR_MSMS_MASK |
+					XIIC_CR_DIR_IS_TX_MASK);
+		}
+
+		/* Clear any pending Tx empty, Tx Error and then enable them */
+		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
+				XIIC_INTR_TX_ERROR_MASK |
+				XIIC_INTR_BNB_MASK);
+	}
 }
 
 static void __xiic_start_xfer(struct xiic_i2c *i2c)
@@ -701,6 +863,33 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	if (err < 0)
 		return err;
 
+	/* Decide standard mode or Dynamic mode */
+	i2c->dynamic = true;
+
+	/*
+	 * If number of messages is 1 and read length is > 255 bytes,
+	 * enter standard mode
+	 */
+
+	if (i2c->nmsgs == 1 && (i2c->tx_msg->flags & I2C_M_RD) &&
+	    i2c->tx_msg->len > MAX_READ_LENGTH_DYNAMIC) {
+		i2c->dynamic = false;
+	} else if (i2c->nmsgs > 1) {
+		int count;
+
+		/*
+		 * If number of messages is more than 1 and one of them is
+		 * a read message, enter standard mode. Since repeated start
+		 * operation in dynamic mode read is not happenning
+		 */
+		for (count = 0; count < i2c->nmsgs; count++) {
+			if (i2c->tx_msg[count].flags & I2C_M_RD) {
+				i2c->dynamic = false;
+				break;
+			}
+		}
+	}
+
 	err = xiic_start_xfer(i2c, msgs, num);
 	if (err < 0) {
 		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
@@ -737,15 +926,10 @@ static const struct i2c_algorithm xiic_algorithm = {
 	.functionality = xiic_func,
 };
 
-static const struct i2c_adapter_quirks xiic_quirks = {
-	.max_read_len = 255,
-};
-
 static const struct i2c_adapter xiic_adapter = {
 	.owner = THIS_MODULE,
 	.class = I2C_CLASS_DEPRECATED,
 	.algo = &xiic_algorithm,
-	.quirks = &xiic_quirks,
 };
 
 static int xiic_i2c_probe(struct platform_device *pdev)
-- 
2.25.1

