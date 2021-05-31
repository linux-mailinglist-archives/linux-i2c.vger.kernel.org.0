Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CD6395BC3
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbhEaNYb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:24:31 -0400
Received: from mail-co1nam11on2045.outbound.protection.outlook.com ([40.107.220.45]:53825
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232262AbhEaNWd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:22:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/jYxuSIYXfqfSX36YCdmjJPfshOEaaeBiXClrypT2syVRkLjXAh72NIw7i+X9TLmscbYP/4jF4pM/m/bHrPI++qvtQ1lC6hvXllhoPbJr63PlmPneqKEeuSP9r2Es57kuzs3FSGfwYMWbUCPIsUeG1WKrgC/xuNNDGKpH6O1EvzUIs9tVMxwf0CcEPaEgecGspwKes4BTlETM+ApXSvc5uKJuNVMLVP06u0uWoMb/4HcJqkvlSMKswSd30UOR3zg6lSvcUtxRuzKp9JhArSDj9wfKv0QcEfmBSE1Kx93yIP8FuNhZEGlaVko6KkuqH9+aUAiTB8ZdQQxWUdkAddGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxNuL0P9T2L9KMIk59oDrl7+ZpGxbGt8ik5LshPLkpQ=;
 b=DJyUZYGYpBgUFHWXC08fJkOuDnpE+rburRGVoC3Wd9IjNSVQqJGaKa7+L3/bWdRQGiH10xDnOEzDl0GOZWabVlNzkarxV47n1gTJPFTsMKSaBdQEag1U72HRe5s90ESNKe5h18xoWV2J9yLxZ81awzGBXwb/bzSN3Mm+TrEPu5Br5lguGxXLiji3xe/iN7jXY4/oA3fddModtjvCeWno8bvfKLc8AbveaSHJSO+7GPm6VFA+hB12HEM0z4msb4S+aP1OT1/IcjAx5E0u5zorSF0phey3BCiUnWw3ZUOe+PzOEfuLebeEZ/72mNprfeOWj+5fEzrbD3FLekkBPUynug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxNuL0P9T2L9KMIk59oDrl7+ZpGxbGt8ik5LshPLkpQ=;
 b=K6EWCggYiORgwn2oHO+GD78rdtTH+w1+Uu/IPymLeHYzWzjk9uuaD4fXfWZ7wYYPUeJcD9R5mM01jsBVlK90vaulsTjTCtnd1kSHjo9IzOvBJkDlKwuF3iPS/2buvJxoEplcIxTegmD4xWhS7SyLUQO/LyjRnavloKL73k6RiSY=
Received: from SN7PR04CA0193.namprd04.prod.outlook.com (2603:10b6:806:126::18)
 by MWHPR02MB2750.namprd02.prod.outlook.com (2603:10b6:300:110::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 13:20:48 +0000
Received: from SN1NAM02FT0034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:126:cafe::1b) by SN7PR04CA0193.outlook.office365.com
 (2603:10b6:806:126::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22 via Frontend
 Transport; Mon, 31 May 2021 13:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0034.mail.protection.outlook.com (10.97.5.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:20:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:20:30 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:20:30 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqH-0004GE-1S; Mon, 31 May 2021 06:20:29 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 02/10] i2c: xiic: Add standard mode support for > 255 byte read transfers
Date:   Mon, 31 May 2021 07:19:40 -0600
Message-ID: <20210531131948.19477-3-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfc95f72-ce2e-4213-cb95-08d92436e78f
X-MS-TrafficTypeDiagnostic: MWHPR02MB2750:
X-Microsoft-Antispam-PRVS: <MWHPR02MB275069234811EC734F60DD00CA3F9@MWHPR02MB2750.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:232;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VG1ZjKuxTE/IsVzCets9gFp8a9Nl5vKm06R/3+5EvU9vaDVygIAj7AC3cQiGRvag5N7eSMjSRB3U+BGcdUyuBIf8dbArlVSCYwjHGV45WPYCgjDivhUKe11Q1wK18lxmkK3wb9qCwKDMgKTJAdcclSzb650GfPCYZIPMldLgBXniMYy6JeqixZZWUpCPucmoo7JwVvkS90DEyIBmPyOLgnNPOruAJE+nl34g5ANwNgndI7IE/rcSX0vCuJKS/WKY83LlonAgSA46vKjNwl3QkTXFH/XbZREkIisFWtYsXcAhF4ikBz43eEQGLz6hMKqjgovvGm+OVJF8uD71jVCttl1AXsiQAC7SaGsth+JRYDrFNfcAq0p/zHJZKIu2Q4dMGvkcdUxJRxp3GAc6WdQ1pHVtQofsSb3jCncGfJctsCXrg128pF5kb34FVBortfGu1IAryfIDohWQbB5+lGB53CFtSUkG7G7mZxzQeaQU5hhjSx5zcI/VKt+CWkB6Zyzk/BnY+ph7xBq+nB2Tb0+9cwG9GPoSkEfAyl6x7Fo6OVimmoOEl+jC+C1nfSQJiCdQPHh7ZxkN8UBWHFPzAzY6ZjYr14ZkuEhiXuCMI+0qT5ggVoB5+mIoSZRfTlFgTYq09ZJElS6e9hq4liTDbYp3DQZx2P1tRtYaEqNgLMLWD+YcUgZzy3sRnEEsuRZmlZ9I
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(46966006)(1076003)(2616005)(5660300002)(6636002)(478600001)(4326008)(70206006)(7636003)(7696005)(356005)(9786002)(336012)(2906002)(186003)(70586007)(110136005)(107886003)(44832011)(82740400003)(36756003)(8936002)(6666004)(82310400003)(54906003)(26005)(8676002)(426003)(83380400001)(47076005)(30864003)(36860700001)(316002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:20:48.0620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc95f72-ce2e-4213-cb95-08d92436e78f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2750
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the current driver implementation, there is a limit of read
transfer size to 255 bytes as it is using AXI I2C dynamic mode.
But the IP supports this transfer through standard mode.

So added AXI I2C standard mode support to enable read transfers
of size more than 255 bytes. The driver scans through the message
request from user space and selects AXI I2C standard mode if there
is a read request of more than 255 bytes. Then the whole message goes
through standard mode Tx and Rx paths.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 367 +++++++++++++++++++++++++++++-----
 1 file changed, 319 insertions(+), 48 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b0cfd9d15467..004103267e9c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -60,6 +60,8 @@ enum xiic_endian {
  * @clk: Pointer to AXI4-lite input clock
  * @state: See STATE_
  * @singlemaster: Indicates bus is single master
+ * @dynamic: Mode of controller
+ * @prev_msg_tx: Previous message is Tx
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -76,6 +78,8 @@ struct xiic_i2c {
 	struct clk *clk;
 	enum xilinx_i2c_state state;
 	bool singlemaster;
+	bool dynamic;
+	bool prev_msg_tx;
 };
 
 
@@ -144,6 +148,9 @@ struct xiic_i2c {
 #define XIIC_TX_DYN_START_MASK            0x0100 /* 1 = Set dynamic start */
 #define XIIC_TX_DYN_STOP_MASK             0x0200 /* 1 = Set dynamic stop */
 
+/* Dynamic mode constants */
+#define MAX_READ_LENGTH_DYNAMIC		255 /* Max length for dynamic read */
+
 /*
  * The following constants define the register offsets for the Interrupt
  * registers. There are some holes in the memory map for reserved addresses
@@ -270,6 +277,24 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 	return 0;
 }
 
+static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
+{
+	u8 isr;
+	unsigned long timeout;
+
+	timeout = jiffies + XIIC_I2C_TIMEOUT;
+	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
+			!(isr & XIIC_INTR_TX_EMPTY_MASK);
+			isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET)) {
+		if (time_after(jiffies, timeout)) {
+			dev_err(i2c->dev, "Timeout waiting at Tx empty\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
+}
+
 static int xiic_reinit(struct xiic_i2c *i2c)
 {
 	int ret;
@@ -311,13 +336,14 @@ static void xiic_deinit(struct xiic_i2c *i2c)
 
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
@@ -325,13 +351,53 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
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
+				     XIIC_CR_NO_ACK_MASK);
+		} else if (bytes_rem == 0) {
+			bytes_to_read = bytes_in_fifo;
+
+			/* Generate stop on the bus if it is last message */
+			if (i2c->nmsgs == 1) {
+				cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+				xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
+					     ~XIIC_CR_MSMS_MASK);
+			}
+
+			/* Make TXACK=0, clean up for next transaction */
+			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
+				     ~XIIC_CR_NO_ACK_MASK);
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
+
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
+	}
 }
 
 static int xiic_tx_fifo_space(struct xiic_i2c *i2c)
@@ -361,6 +427,62 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 	}
 }
 
+static void xiic_std_fill_tx_fifo(struct xiic_i2c *i2c)
+{
+	u8 fifo_space = xiic_tx_fifo_space(i2c);
+	u16 data = 0;
+	int len = xiic_tx_space(i2c);
+
+	dev_dbg(i2c->adap.dev.parent, "%s entry, len: %d, fifo space: %d\n",
+		__func__, len, fifo_space);
+
+	if (len > fifo_space)
+		len = fifo_space;
+	else if (len && !(i2c->nmsgs > 1))
+		len--;
+
+	while (len--) {
+		data = i2c->tx_msg->buf[i2c->tx_pos++];
+		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
+	}
+}
+
+static void xiic_send_tx(struct xiic_i2c *i2c)
+{
+	dev_dbg(i2c->adap.dev.parent,
+		"%s entry, rem: %d, SR: 0x%x, CR: 0x%x\n",
+		__func__, xiic_tx_space(i2c),
+		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
+		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+
+	if (xiic_tx_space(i2c) > 1) {
+		xiic_std_fill_tx_fifo(i2c);
+		return;
+	}
+
+	if ((xiic_tx_space(i2c) == 1)) {
+		u16 data;
+
+		if (i2c->nmsgs == 1) {
+			u8 cr;
+			int status;
+
+			/* Wait till FIFO is empty so STOP is sent last */
+			status = xiic_wait_tx_empty(i2c);
+			if (status)
+				return;
+
+			/* Write to CR to stop */
+			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
+				     ~XIIC_CR_MSMS_MASK);
+		}
+		/* Send last byte */
+		data = i2c->tx_msg->buf[i2c->tx_pos++];
+		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
+	}
+}
+
 static void xiic_wakeup(struct xiic_i2c *i2c, int code)
 {
 	i2c->tx_msg = NULL;
@@ -391,7 +513,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	dev_dbg(i2c->adap.dev.parent, "%s: SR: 0x%x, msg: %p, nmsgs: %d\n",
 		__func__, xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
 		i2c->tx_msg, i2c->nmsgs);
-
+	dev_dbg(i2c->adap.dev.parent, "%s, ISR: 0x%x, CR: 0x%x\n",
+		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 
 	/* Service requesting interrupt */
 	if ((pend & XIIC_INTR_ARB_LOST_MASK) ||
@@ -465,7 +589,10 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 			goto out;
 		}
 
-		xiic_fill_tx_fifo(i2c);
+		if (i2c->dynamic)
+			xiic_fill_tx_fifo(i2c);
+		else
+			xiic_send_tx(i2c);
 
 		/* current message sent and there is space in the fifo */
 		if (!xiic_tx_space(i2c) && xiic_tx_fifo_space(i2c) >= 2) {
@@ -554,35 +681,113 @@ static int xiic_busy(struct xiic_i2c *i2c)
 
 static void xiic_start_recv(struct xiic_i2c *i2c)
 {
-	u8 rx_watermark;
+	u16 rx_watermark;
+	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
 	unsigned long flags;
 
-	/* Clear and enable Rx full interrupt. */
-	xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK | XIIC_INTR_TX_ERROR_MASK);
+	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
+		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+
+	/* Disable Tx interrupts */
+	xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK | XIIC_INTR_TX_EMPTY_MASK);
 
-	/* we want to get all but last byte, because the TX_ERROR IRQ is used
-	 * to inidicate error ACK on the address, and negative ack on the last
-	 * received byte, so to not mix them receive all but last.
-	 * In the case where there is only one byte to receive
-	 * we can check if ERROR and RX full is set at the same time
-	 */
-	rx_watermark = msg->len;
-	if (rx_watermark > IIC_RX_FIFO_DEPTH)
-		rx_watermark = IIC_RX_FIFO_DEPTH;
-	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rx_watermark - 1);
-
-	local_irq_save(flags);
-	if (!(msg->flags & I2C_M_NOSTART))
-		/* write the address */
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
+		bytes--;
+
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
+
+		local_irq_save(flags);
+		if (!(msg->flags & I2C_M_NOSTART))
+			/* write the address */
+			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
+				      i2c_8bit_addr_from_msg(msg) |
+				      XIIC_TX_DYN_START_MASK);
+
+		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+
+		/* If last message, include dynamic stop bit with length */
+		val = (i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0;
+		val |= msg->len;
+
+		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
+		local_irq_restore(flags);
+	} else {
+		/*
+		 * If previous message is Tx, make sure that Tx FIFO is empty
+		 * before starting a new transfer as the repeated start in
+		 * standard mode can corrupt the transaction if there are
+		 * still bytes to be transmitted in FIFO
+		 */
+		if (i2c->prev_msg_tx) {
+			int status;
+
+			status = xiic_wait_tx_empty(i2c);
+			if (status)
+				return;
+		}
+
+		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+
+		/* Set Receive fifo depth */
+		rx_watermark = msg->len;
+		if (rx_watermark > IIC_RX_FIFO_DEPTH) {
+			rfd_set = IIC_RX_FIFO_DEPTH - 1;
+		} else if ((rx_watermark == 1) || (rx_watermark == 0)) {
+			rfd_set = rx_watermark - 1;
+			/* Handle single byte transfer separately */
+			cr |= XIIC_CR_NO_ACK_MASK;
+		} else {
+			rfd_set = rx_watermark - 2;
+		}
+
+		/* Check if RSTA should be set */
+		if (cr & XIIC_CR_MSMS_MASK) {
+			/* Already a master, RSTA should be set */
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
+				     XIIC_CR_REPEATED_START_MASK) &
+				     ~(XIIC_CR_DIR_IS_TX_MASK));
+		}
+
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
+
+		/* Clear and enable Rx full and transmit complete interrupts */
+		xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
+				XIIC_INTR_TX_ERROR_MASK);
+
+		/* Write the address */
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
-			i2c_8bit_addr_from_msg(msg) | XIIC_TX_DYN_START_MASK);
+			      i2c_8bit_addr_from_msg(msg));
 
-	xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		/* Write to Control Register,to start transaction in Rx mode */
+		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
+				     XIIC_CR_MSMS_MASK)
+				     & ~(XIIC_CR_DIR_IS_TX_MASK));
+		}
 
-	xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
-		msg->len | ((i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0));
-	local_irq_restore(flags);
+		dev_dbg(i2c->adap.dev.parent, "%s end, ISR: 0x%x, CR: 0x%x\n",
+			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+			xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+	}
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
@@ -590,10 +795,17 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
+
+	/* Enable interrupts */
+	xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
+
+	i2c->prev_msg_tx = false;
 }
 
 static void xiic_start_send(struct xiic_i2c *i2c)
 {
+	u8 cr = 0;
+	u16 data;
 	struct i2c_msg *msg = i2c->tx_msg;
 
 	xiic_irq_clr(i2c, XIIC_INTR_TX_ERROR_MASK);
@@ -604,22 +816,71 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
 		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 
-	if (!(msg->flags & I2C_M_NOSTART)) {
-		/* write the address */
-		u16 data = i2c_8bit_addr_from_msg(msg) |
-			XIIC_TX_DYN_START_MASK;
-		if ((i2c->nmsgs == 1) && msg->len == 0)
-			/* no data and last message -> add STOP */
-			data |= XIIC_TX_DYN_STOP_MASK;
+	if (i2c->dynamic) {
+		if (!(msg->flags & I2C_M_NOSTART)) {
+			/* write the address */
+			data = i2c_8bit_addr_from_msg(msg) |
+				XIIC_TX_DYN_START_MASK;
+
+			if (i2c->nmsgs == 1 && msg->len == 0)
+				/* no data and last message -> add STOP */
+				data |= XIIC_TX_DYN_STOP_MASK;
+
+			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
+		}
+
+		xiic_fill_tx_fifo(i2c);
+
+		/* Clear any pending Tx empty, Tx Error and then enable them */
+		xiic_irq_clr_en(i2c, (XIIC_INTR_TX_EMPTY_MASK |
+				      XIIC_INTR_TX_ERROR_MASK |
+				      XIIC_INTR_BNB_MASK));
+	} else {
+		/*
+		 * If previous message is Tx, make sure that Tx FIFO is empty
+		 * before starting a new transfer as the repeated start in
+		 * standard mode can corrupt the transaction if there are
+		 * still bytes to be transmitted in FIFO
+		 */
+		if (i2c->prev_msg_tx) {
+			int status;
+
+			status = xiic_wait_tx_empty(i2c);
+			if (status)
+				return;
+		}
 
+		/* Check if RSTA should be set */
+		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+		if (cr & XIIC_CR_MSMS_MASK) {
+			/* Already a master, RSTA should be set */
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
+				     XIIC_CR_REPEATED_START_MASK |
+				     XIIC_CR_DIR_IS_TX_MASK) &
+				     ~(XIIC_CR_NO_ACK_MASK));
+		}
+
+		/* Write address to FIFO */
+		data = i2c_8bit_addr_from_msg(msg);
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
-	}
+		/* Fill fifo */
+		xiic_std_fill_tx_fifo(i2c);
 
-	xiic_fill_tx_fifo(i2c);
+		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
 
-	/* Clear any pending Tx empty, Tx Error and then enable them. */
-	xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_ERROR_MASK |
-		XIIC_INTR_BNB_MASK);
+			/* Start Tx by writing to CR */
+			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr |
+				     XIIC_CR_MSMS_MASK |
+				     XIIC_CR_DIR_IS_TX_MASK);
+		}
+
+		/* Clear any pending Tx empty, Tx Error and then enable them */
+		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
+				XIIC_INTR_TX_ERROR_MASK |
+				XIIC_INTR_BNB_MASK);
+	}
+	i2c->prev_msg_tx = true;
 }
 
 static irqreturn_t xiic_isr(int irq, void *dev_id)
@@ -703,7 +964,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c)
 static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct xiic_i2c *i2c = i2c_get_adapdata(adap);
-	int err;
+	int err, count;
 
 	dev_dbg(adap->dev.parent, "%s entry SR: 0x%x\n", __func__,
 		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET));
@@ -719,6 +980,21 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	i2c->tx_msg = msgs;
 	i2c->nmsgs = num;
 
+	/* Decide standard mode or Dynamic mode */
+	i2c->dynamic = true;
+
+	/* Initialize prev message type */
+	i2c->prev_msg_tx = false;
+
+	/* Enter standard mode only when read length is > 255 bytes */
+	for (count = 0; count < i2c->nmsgs; count++) {
+		if ((i2c->tx_msg[count].flags & I2C_M_RD) &&
+		    i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC) {
+			i2c->dynamic = false;
+			break;
+		}
+	}
+
 	err = xiic_start_xfer(i2c);
 	if (err < 0) {
 		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
@@ -752,16 +1028,11 @@ static const struct i2c_algorithm xiic_algorithm = {
 	.functionality = xiic_func,
 };
 
-static const struct i2c_adapter_quirks xiic_quirks = {
-	.max_read_len = 255,
-};
-
 static const struct i2c_adapter xiic_adapter = {
 	.owner = THIS_MODULE,
 	.name = DRIVER_NAME,
 	.class = I2C_CLASS_DEPRECATED,
 	.algo = &xiic_algorithm,
-	.quirks = &xiic_quirks,
 };
 
 
-- 
2.17.1

