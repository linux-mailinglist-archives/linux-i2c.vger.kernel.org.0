Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4983B3B4E0E
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhFZKbk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:31:40 -0400
Received: from mail-bn8nam11on2085.outbound.protection.outlook.com ([40.107.236.85]:3809
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230082AbhFZKbb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:31:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=god8aBFgqZyioBFWdu/z2VutagkENELOF1Ur0MQqIPrWqvwSYJyxLIRN99AHChWk1kUhX0nU/htA1IHX+tZrLE6xEY5Z3mCVUQun48+NL9ytl5CI9f1xSU7xDs9EwpYycE9XdtXk4irZVmrwTz1E/kUkuZIxUJgwVpwTB4p7qWNk4GV0PtTUdwfiXn5H3Df5Jif0xOHNFUZCG9QV8VZIEEg1f8/sLb3uSIz8V079XMh+0tKwDjaVQ6IbsxX9uN4lpYcbroUfZvfUK63ZUqZmtATwj8epTF5cp8r7HQEJZ8lY7/9vIFBGcyA61Gxasn0zBbaH1vzaIwEHAlAQl10smQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWIWQMx/9dXKPsHESnWuJyYm0GIbs6zDaBAuzOfttlk=;
 b=dztD4RZbjwNzO9aNcgnKDpkSy9wNtnoB5GA7MCePb9TsL8GP0fJVjuIjkB9SQOCWEPIMg0m/IQsMPEG2ylpYjwCjXhsuNilLTXXWWoNAvWWPwrl+V1gI28Iq0CQnkN7cC7BItvq6KQacILzkaC85barwLxIjPk3/7th9RSwWn5yZzUoufCZHLGFko5tTNT9/jyz4MsBFsjwUwvkA9DRxPy43Zf0V5+y8L5NA79e7FDQ1l3aWTSyHo5S2cTsHnZgTsNcnzBIlOJ832hc3EK2uRnUFKqrSDZZdnDSoPDzTX6Q9yA15oH1C1iWujtcxgzBwqg3jkBD85P7AkclF7j+Z8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWIWQMx/9dXKPsHESnWuJyYm0GIbs6zDaBAuzOfttlk=;
 b=fs7rzCoo7fh+tLBTSXfonR6xnGNprUgvZGaXQgwm8GN79hR5IGHOYV1OI5qA+ztG3ilFX9jFqtCa/H3jeeS/FyAXIt6hR4IfR+k/rz8/Tk69M1e1z9JUUvgqpj+GdFa9kldpJiQWqj3dAlbZVdUmc+Hs7EG4g/VghJW4wiI+Sgc=
Received: from SN6PR04CA0087.namprd04.prod.outlook.com (2603:10b6:805:f2::28)
 by DM6PR02MB6042.namprd02.prod.outlook.com (2603:10b6:5:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Sat, 26 Jun
 2021 10:29:06 +0000
Received: from SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::8a) by SN6PR04CA0087.outlook.office365.com
 (2603:10b6:805:f2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Sat, 26 Jun 2021 10:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0039.mail.protection.outlook.com (10.97.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:29:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:50 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:50 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5YP-000AWJ-3t; Sat, 26 Jun 2021 03:28:49 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 09/10] i2c: xiic: Fix coding style issues
Date:   Sat, 26 Jun 2021 15:58:05 +0530
Message-ID: <20210626102806.15402-10-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9277c7f3-e31d-4209-6181-08d9388d39bb
X-MS-TrafficTypeDiagnostic: DM6PR02MB6042:
X-Microsoft-Antispam-PRVS: <DM6PR02MB60423F3DA668D4BD1628D79FCA059@DM6PR02MB6042.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+trAFJZZPMIVP8SRpfh1zUolrcNdmCwdoqFHqvtFT13D8iasI6iz6jBkijDryeyjcpoxDg1AH4rt5cWtOv38xV7Q/QAOGkYZmIsvEtIfQIbHt0qJn4k5vnPAvrY2h/OdV7D67TL0gT7fQH0mCpuxaudLmkDi8fELtcOskyoE4mNOUqUQimE/cXHagEbhg+mSCDy/lFrhY0jWZ7StDCzJs8+Sc8csPF02w39MOO8N0Q+Jk6O0vyuqy4AESA/t9TS9AcGz2tIGKxtPSL8AsF8spAH1NVI/MIs6vCcp4XOLTV9zStVNbFxaDbOX0/eNXFfmMo85NI47y7HSC14QCpBKiFp5Mih/9hMY0zgFwwA6JKjEqPQTDdQKwBzgeW8EGcD8rG2TUTnxebadDJc+YTK/WRdHe8oJqurLHr5FPBiq2a4bokV8YX4+yViJCEz1azjMv/FnSVtXF+veUvX55ZewSyqlZsvcYsPckrRtt8C0rcHbwthScC3bh74d9w4vklOFoRWeqV5ZgDLTpFEkOi4tCa9//nhcavCDlpPrsG1S0ooDz8Iod5tWgtPxi0WhMDmK/nHqZJDNHULxBqhdov1YhjpgB0VBLaF0Z5Sh4wyZYE8Mc6lZBuLKNu6WzD5M3opqIUqIbRnY724EnivlXZVzainA0CqxeuUFW2eqtv/tUXZcv9ivv4o4nT1HZfN3qTlkN0c6+EaPDrJjFXUlU3yMhm7pbdROjoAUj9CKFPSa70=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(36840700001)(46966006)(36860700001)(2906002)(6636002)(70586007)(186003)(336012)(26005)(82310400003)(36906005)(316002)(5660300002)(2616005)(47076005)(44832011)(70206006)(7696005)(82740400003)(36756003)(9786002)(426003)(356005)(83380400001)(8676002)(1076003)(7636003)(8936002)(110136005)(107886003)(54906003)(6666004)(4326008)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:29:05.8971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9277c7f3-e31d-4209-6181-08d9388d39bb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6042
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Michal Simek <michal.simek@xilinx.com>

Most of these stuff are reported by checkpatch.
But fixes are:
- Incorrect indetation
- Missing blank line after variable declaration
- Additional ()
- Missing spaces around +
- Else after if with return
- Missing parenthesis when if has them
- Newlines
- Remove MODULE_ALIAS - none is really using it
- Changing msleep to usleep_range
- Other trivial fixes

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 67 ++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e81ec08b001..26fc174b8e95 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -72,7 +72,7 @@ struct xiic_i2c {
 	wait_queue_head_t wait;
 	struct i2c_adapter adap;
 	struct i2c_msg *tx_msg;
-	struct mutex lock;
+	struct mutex lock; /* Locking between isr and new xfer */
 	unsigned int tx_pos;
 	unsigned int nmsgs;
 	struct i2c_msg *rx_msg;
@@ -91,22 +91,22 @@ struct xiic_version_data {
 };
 
 #define XIIC_MSB_OFFSET 0
-#define XIIC_REG_OFFSET (0x100+XIIC_MSB_OFFSET)
+#define XIIC_REG_OFFSET (0x100 + XIIC_MSB_OFFSET)
 
 /*
  * Register offsets in bytes from RegisterBase. Three is added to the
  * base offset to access LSB (IBM style) of the word
  */
-#define XIIC_CR_REG_OFFSET   (0x00+XIIC_REG_OFFSET)	/* Control Register   */
-#define XIIC_SR_REG_OFFSET   (0x04+XIIC_REG_OFFSET)	/* Status Register    */
-#define XIIC_DTR_REG_OFFSET  (0x08+XIIC_REG_OFFSET)	/* Data Tx Register   */
-#define XIIC_DRR_REG_OFFSET  (0x0C+XIIC_REG_OFFSET)	/* Data Rx Register   */
-#define XIIC_ADR_REG_OFFSET  (0x10+XIIC_REG_OFFSET)	/* Address Register   */
-#define XIIC_TFO_REG_OFFSET  (0x14+XIIC_REG_OFFSET)	/* Tx FIFO Occupancy  */
-#define XIIC_RFO_REG_OFFSET  (0x18+XIIC_REG_OFFSET)	/* Rx FIFO Occupancy  */
-#define XIIC_TBA_REG_OFFSET  (0x1C+XIIC_REG_OFFSET)	/* 10 Bit Address reg */
-#define XIIC_RFD_REG_OFFSET  (0x20+XIIC_REG_OFFSET)	/* Rx FIFO Depth reg  */
-#define XIIC_GPO_REG_OFFSET  (0x24+XIIC_REG_OFFSET)	/* Output Register    */
+#define XIIC_CR_REG_OFFSET   (0x00 + XIIC_REG_OFFSET)	/* Control Register   */
+#define XIIC_SR_REG_OFFSET   (0x04 + XIIC_REG_OFFSET)	/* Status Register    */
+#define XIIC_DTR_REG_OFFSET  (0x08 + XIIC_REG_OFFSET)	/* Data Tx Register   */
+#define XIIC_DRR_REG_OFFSET  (0x0C + XIIC_REG_OFFSET)	/* Data Rx Register   */
+#define XIIC_ADR_REG_OFFSET  (0x10 + XIIC_REG_OFFSET)	/* Address Register   */
+#define XIIC_TFO_REG_OFFSET  (0x14 + XIIC_REG_OFFSET)	/* Tx FIFO Occupancy  */
+#define XIIC_RFO_REG_OFFSET  (0x18 + XIIC_REG_OFFSET)	/* Rx FIFO Occupancy  */
+#define XIIC_TBA_REG_OFFSET  (0x1C + XIIC_REG_OFFSET)	/* 10 Bit Address reg */
+#define XIIC_RFD_REG_OFFSET  (0x20 + XIIC_REG_OFFSET)	/* Rx FIFO Depth reg  */
+#define XIIC_GPO_REG_OFFSET  (0x24 + XIIC_REG_OFFSET)	/* Output Register    */
 
 /* Control Register masks */
 #define XIIC_CR_ENABLE_DEVICE_MASK        0x01	/* Device enable = 1      */
@@ -244,18 +244,21 @@ static inline int xiic_getreg32(struct xiic_i2c *i2c, int reg)
 static inline void xiic_irq_dis(struct xiic_i2c *i2c, u32 mask)
 {
 	u32 ier = xiic_getreg32(i2c, XIIC_IIER_OFFSET);
+
 	xiic_setreg32(i2c, XIIC_IIER_OFFSET, ier & ~mask);
 }
 
 static inline void xiic_irq_en(struct xiic_i2c *i2c, u32 mask)
 {
 	u32 ier = xiic_getreg32(i2c, XIIC_IIER_OFFSET);
+
 	xiic_setreg32(i2c, XIIC_IIER_OFFSET, ier | mask);
 }
 
 static inline void xiic_irq_clr(struct xiic_i2c *i2c, u32 mask)
 {
 	u32 isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
+
 	xiic_setreg32(i2c, XIIC_IISR_OFFSET, isr & mask);
 }
 
@@ -425,7 +428,8 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 
 	while (len--) {
 		u16 data = i2c->tx_msg->buf[i2c->tx_pos++];
-		if ((xiic_tx_space(i2c) == 0) && (i2c->nmsgs == 1)) {
+
+		if (!xiic_tx_space(i2c) && i2c->nmsgs == 1) {
 			/* last message in transfer -> STOP */
 			data |= XIIC_TX_DYN_STOP_MASK;
 			dev_dbg(i2c->adap.dev.parent, "%s TX STOP\n", __func__);
@@ -527,8 +531,8 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 	/* Service requesting interrupt */
 	if ((pend & XIIC_INTR_ARB_LOST_MASK) ||
-		((pend & XIIC_INTR_TX_ERROR_MASK) &&
-		!(pend & XIIC_INTR_RX_FULL_MASK))) {
+	    ((pend & XIIC_INTR_TX_ERROR_MASK) &&
+	     !(pend & XIIC_INTR_RX_FULL_MASK))) {
 		/* bus arbritration lost, or...
 		 * Transmit error _OR_ RX completed
 		 * if this happens when RX_FULL is not set
@@ -672,9 +676,8 @@ static int xiic_busy(struct xiic_i2c *i2c)
 	 * should ignore it, since bus will never be released and i2c will be
 	 * stuck forever.
 	 */
-	if (i2c->singlemaster) {
+	if (i2c->singlemaster)
 		return 0;
-	}
 
 	/* for instance if previous transfer was terminated due to TX error
 	 * it might be that the bus is on it's way to become available
@@ -682,7 +685,7 @@ static int xiic_busy(struct xiic_i2c *i2c)
 	 */
 	err = xiic_bus_busy(i2c);
 	while (err && tries--) {
-		msleep(1);
+		usleep_range(1000, 2000);
 		err = xiic_bus_busy(i2c);
 	}
 
@@ -874,7 +877,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		xiic_std_fill_tx_fifo(i2c);
 
 		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
-
 			/* Start Tx by writing to CR */
 			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
 			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr |
@@ -898,9 +900,6 @@ static irqreturn_t xiic_isr(int irq, void *dev_id)
 	/* Do not processes a devices interrupts if the device has no
 	 * interrupts pending
 	 */
-
-	dev_dbg(i2c->adap.dev.parent, "%s entry\n", __func__);
-
 	isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
 	ier = xiic_getreg32(i2c, XIIC_IIER_OFFSET);
 	pend = isr & ier;
@@ -914,6 +913,7 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 {
 	int first = 1;
 	int fifo_space = xiic_tx_fifo_space(i2c);
+
 	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, fifos space: %d\n",
 		__func__, i2c->tx_msg, fifo_space);
 
@@ -928,19 +928,20 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 			i2c->nmsgs--;
 			i2c->tx_msg++;
 			i2c->tx_pos = 0;
-		} else
+		} else {
 			first = 0;
+		}
 
 		if (i2c->tx_msg->flags & I2C_M_RD) {
 			/* we dont date putting several reads in the FIFO */
 			xiic_start_recv(i2c);
 			return;
-		} else {
-			xiic_start_send(i2c);
-			if (xiic_tx_space(i2c) != 0) {
-				/* the message could not be completely sent */
-				break;
-			}
+		}
+
+		xiic_start_send(i2c);
+		if (xiic_tx_space(i2c) != 0) {
+			/* the message could not be completely sent */
+			break;
 		}
 
 		fifo_space = xiic_tx_fifo_space(i2c);
@@ -951,12 +952,12 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 	 */
 	if (i2c->nmsgs > 1 || xiic_tx_space(i2c))
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_HALF_MASK);
-
 }
 
 static int xiic_start_xfer(struct xiic_i2c *i2c)
 {
 	int ret;
+
 	mutex_lock(&i2c->lock);
 
 	ret = xiic_reinit(i2c);
@@ -1020,8 +1021,8 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		goto out;
 	}
 
-	if (wait_event_timeout(i2c->wait, (i2c->state == STATE_ERROR) ||
-		(i2c->state == STATE_DONE), HZ)) {
+	if (wait_event_timeout(i2c->wait, i2c->state == STATE_ERROR ||
+			       i2c->state == STATE_DONE, HZ)) {
 		err = (i2c->state == STATE_DONE) ? num : -EIO;
 		goto out;
 	} else {
@@ -1228,6 +1229,7 @@ static const struct dev_pm_ops xiic_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(xiic_i2c_runtime_suspend,
 			   xiic_i2c_runtime_resume, NULL)
 };
+
 static struct platform_driver xiic_i2c_driver = {
 	.probe   = xiic_i2c_probe,
 	.remove  = xiic_i2c_remove,
@@ -1243,4 +1245,3 @@ module_platform_driver(xiic_i2c_driver);
 MODULE_AUTHOR("info@mocean-labs.com");
 MODULE_DESCRIPTION("Xilinx I2C bus driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:"DRIVER_NAME);
-- 
2.25.1

