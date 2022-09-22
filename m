Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB4C5E5DCF
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbiIVIqC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbiIVIpW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:45:22 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5203491F9;
        Thu, 22 Sep 2022 01:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJQj+Hb5u38Dwl0NKZBBBG5AjsG2f6N8Y8g89HPHaB61e+5QhQCoJ2f2yYBlq24bD9V4xiwDdJlrT4u4RwRtagaTve8GweGxfbAmdpwryajoJc+4ZYWpPbbxzWWFsWhfdaCoty8yZMuODfhUcppPXZw788P6frswRX7sKKpujiPW+278CkIWnqNRIZDPrEg6j0CM0eciM9SPcjlTChmChVJ9YA49opUYGnGIt2bW3jnKiA0VtUPE7Etoq3hMPI+su76/GNx93zvGxP/vSwtDqbSR0nJQ0RpyGSAPfrzwkfH2UpKxUCJ4A1D86txu574wXo/FscYPHxCYVZ7ww8FbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Twx+yANZBCAUgMAHomeKX+mS0EE/ZsMCfq5NwTQOBcg=;
 b=MG1ARI7eo9R1hqYKmqI/hQTCtGYPFcKg78POieBm0EjFn+dr50ppC5lsjHxVzhDSZlhii++i1UCKyyPOLVl/zrn6Dbo4k78wNU2YqujIwerIGu8FqamQGJ0eSlwp4MnZ04G8O3x5UHkIERsfTwsxtPDuEmXxinIu25WEwIl+040WdwYt1Ch+ZpJknNZPLEafyevGVGg61bwX3YG5TyOtA9mr+QnuJ9OUCGSWncsXfDHroxY2CgI405PHpqcp47NJRUQruuwVU/EsjvIuS/BEmRrJb4neVikjjb8fK5YfSqiWnRb4yMRClUlSQ0tWf4N4XFnrNq1v4fXrrawcttrqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Twx+yANZBCAUgMAHomeKX+mS0EE/ZsMCfq5NwTQOBcg=;
 b=i+0Zoi42K7ftMvSL/sgVhSPUEeVOYX2AsWTgAyr+HT41V2s763834P3bKW3Y8bPsMEBw5hFUbMThN1VgXqjWf/jhdC07qv0EoZqwAITZXbHVHJ7Br69OhMYhKioYxrOz85JEQkg45OxpJZwHZzYBZIytZqWbgolJ0HReBEmjh6w=
Received: from BN9PR03CA0083.namprd03.prod.outlook.com (2603:10b6:408:fc::28)
 by CH3PR02MB9066.namprd02.prod.outlook.com (2603:10b6:610:143::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 08:45:17 +0000
Received: from BN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::8f) by BN9PR03CA0083.outlook.office365.com
 (2603:10b6:408:fc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 08:45:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT060.mail.protection.outlook.com (10.13.3.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:45:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:45:17 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:45:17 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54839 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHpc-00016A-Ds; Thu, 22 Sep 2022 01:45:17 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id A689B6102B; Thu, 22 Sep 2022 14:15:03 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 1/9] i2c: xiic: Add standard mode support for > 255 byte
Date:   Thu, 22 Sep 2022 14:14:46 +0530
Message-ID: <1663836294-5698-2-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT060:EE_|CH3PR02MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: f52aaafa-f116-4c67-fe93-08da9c76c67a
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tybJIGVGwzufNyqEBWnGCOQ7piXzlO4qtdgliS6tU7bX24pFzNDuAUdf8IUb4duLMQKdIO+dMEeBMIPgKGEVXn06BGmIQVecuszxUVSz5PqwFb0Ma0NNnEN9J9NjS7XD/XhLiL5gJlgneaTFmd9BREvJsxpHFgSXqJ0ZD7mpXlFD5fSm3I5pbcCuxbeYFJ33EhPAn9VQuGc0AWXhVzMfbgbMBL20HzMRxIkgjhL9F3ZB9nX9ePke23ObifwqbVwDRUXuHC3MrmTZAPBnqIDDEgh/U2ehfV9SufSyt0o00oU+RLMfKXeVlsTUaIzoI02GqAwzrZXz080dkQcXwm1ZxnqZst1W5NZTb+iParTEEtD9dWPgp/zXZUXoBPsX6Cc34jcQ0B8PclYBj+zAJMnEgG9/+e1wL2vdzV8R8yjITdNY/TaifAddk8z6aJ0OFAhrbcRSzMNMHHVpsMx6jnjICiygsGszUsy6gzdQJ0aC6IGuhogPAMhjF/Z3B2m3RjPPN5tkHxLGPa6FrqompZhigJjmPTqa4ZyBGaEV07TLzlb0Np6cAJNGxXhDfbJg/FI9TJE2U3mOq7HIaxnSE8ClNJPRbITbZFeZSjajVjyDSYV28Kz02++Ks08Vt0gcDXGCM/leLhXdBBjzOnKFGZReXgB+zQlx3JLjOn5pskYCGuHVazaEtn2RZ62F6diAuTtRgrQqWE7VDSFV/d9wMhCPgY4tu5f2thruA1o0B2ECqsuEn2L9mB4fzjiy9C21tWE0HUfcHPfjYyEWgSKIxy+oLnCfZAYMxJ0jBcYO3GiYsYrRkwI1N5n+JP17SboJ1Jyp
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(2616005)(426003)(336012)(83380400001)(6266002)(107886003)(47076005)(6666004)(44832011)(41300700001)(70586007)(36860700001)(26005)(70206006)(7636003)(2906002)(30864003)(4326008)(82310400005)(5660300002)(316002)(36756003)(54906003)(42186006)(356005)(40460700003)(82740400003)(186003)(478600001)(110136005)(40480700001)(8936002)(8676002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:45:17.4963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f52aaafa-f116-4c67-fe93-08da9c76c67a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9066
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

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
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
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
index b3fe6b2aa3ca..2aa43e067fee 100644
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

