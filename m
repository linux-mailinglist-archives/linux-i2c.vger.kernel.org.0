Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AF9395BC6
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhEaNYf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:24:35 -0400
Received: from mail-mw2nam10on2061.outbound.protection.outlook.com ([40.107.94.61]:56449
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231936AbhEaNWi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:22:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKK+Jl0txPi8qItH6O3tcjhicbt+exx1L94bscoTXuegjKquQB9aKLN/byYVaGKNrzSTgFiHbMZ3gqFDXyrJWrMQ+7Ayexc8z16J0QZgRbIUpdbgN1SrWN+pgOGqGBRCOsKka9ooOQxuPISiwOsJvxczbv9ogEUCo8z3i092YvACmGy75voLX4k/QXRCFX7pA4H4oWvH6cJcDp6pcj2VckxFPiS1j+hgclZRgVqEVFH0nPmerZ2aS7IjMn+uHM2Yq8cSg+D6GLDwA9U2ZaTsZvR4t144y+PpBvQZ5yTYGw80UMdg+p7PmpZP/Dk45TAFD62ViGnHLOno+1Fnp/NkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=373GpPjz4g+kjhHnXEviX5o+TUs9c11/a2JtL2KfzAo=;
 b=IdkOo/3CySOiS6+/rgvZEXPYPZYPtvvgjjen+mIwORaH0rl/j5OANr/e9CroIZcNAIAN65AyYferaY0qYSSuDzf9pvXJcPmcLvWvbO7RDUqfXuoJGCsLX/vdSrKEqvpRelPQxOZkjcL7elaoiP49fUEPvqkAZnZhP2UABP6YWpAgSfIDjBA+hL05uFSHBQUYOTqHDl4jI1iGDjt18yuHG4pXUpFcW5CVoD/KJ6Ik6ub6gL0t2Mf2WoU1ZaUdFV3LSH5tYVPcv/67Qo1qQykg/lC7fqF7z6duIUveWD6tozVzPxiX2vaWJ/r5kqEUqIykQcsFqQB8LbpTlnYR7IH6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=373GpPjz4g+kjhHnXEviX5o+TUs9c11/a2JtL2KfzAo=;
 b=DD/rZaG2rrEmHSVUPyL0Jbf3J22qE3V9NLLh624waKAx80h6RFrD5y7mUtsNMVJddwWZDMp51XgS+oozpM3F7tjShASmOyQsqxhEGsqFNun5vOmgII7piVJDtfds7q1wvQzbyxKIR+dMdTpIDg0Hlhy+rL+nI0j3p5C04PNzWhg=
Received: from SN6PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:805:106::22) by BN6PR02MB2660.namprd02.prod.outlook.com
 (2603:10b6:404:fd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 13:20:54 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::10) by SN6PR2101CA0012.outlook.office365.com
 (2603:10b6:805:106::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.3 via Frontend
 Transport; Mon, 31 May 2021 13:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:20:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:20:37 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:20:37 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqN-0004GE-C6; Mon, 31 May 2021 06:20:35 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 03/10] i2c: xiic: Fix coding style issues
Date:   Mon, 31 May 2021 07:19:41 -0600
Message-ID: <20210531131948.19477-4-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a7227ed-ec0a-480d-cd18-08d92436eb0d
X-MS-TrafficTypeDiagnostic: BN6PR02MB2660:
X-Microsoft-Antispam-PRVS: <BN6PR02MB266089D1086702B9D9015C33CA3F9@BN6PR02MB2660.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1XjK7SsJX1edCaSwYHGoWLk9aG+B1l/DQ7kxjmPyRFTwzU3O+zSFZglFeI2MsuguK5UoZ1UE4iipUiD4qNxjM5cswqXzCfWu3oyDDCqg6PyJFfOb/kYEv94JYiUmwsXTNgr15bixx5rL0txZFUbzhgUzwavV4rL/R+dEKJ3fFrqjRWw0+bfbsyZ0F9eGWjiGuKDwXhbaDRMTJB5O6uoyqyhT47iGljrRgiRmu5ncAL9QhZ6dt/xXh03tfTeGj5lF3FiLVLH6gQhcRoXZIcRO0e0Bm0NHQqymW1J5odE1MCyxsVZ9ljUNsgBFmlEeYVbRMm0jqcO1v782+Se4iYhJd0afYmY/0aV97eyIf6iAf9B7tLVxSssdE3NY3jj0eRE/7DLUJd/uP/Ip2YnYAkjgkszS9lnixB1PviEs4L4mEpEbpGMbuTWibIflbpKr6W12XbZ4x3QDqPYXxZUzKTRRoR5hDSh/HNV9LItYdmYHMp92e83v/YGBbWfkx0UmhuzXFJ7jIg5kzze99yGQEianZsdkJwW0TZQ7ln76ZNYkNKpfRuFfxXpF3EKdND/3dHb/rXbyC1jmj58OJYpqfe6WcpQRLI/zIbqsBnkFN6m5oNkgQLUttozs8GuaeSNunThLbcxekoVpJfC6ULgbK1EjnH1ZpXnvqrsslV+ONs7cmx6cEBygddNN5iCQA1JLxvY
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(46966006)(4326008)(186003)(44832011)(1076003)(6636002)(2906002)(47076005)(36756003)(478600001)(82310400003)(36860700001)(5660300002)(107886003)(2616005)(426003)(336012)(83380400001)(7696005)(110136005)(356005)(316002)(7636003)(9786002)(26005)(70206006)(8676002)(8936002)(82740400003)(70586007)(6666004)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:20:53.9220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7227ed-ec0a-480d-cd18-08d92436eb0d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2660
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
 drivers/i2c/busses/i2c-xiic.c | 69 +++++++++++++++++------------------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 004103267e9c..fa2eef9e622f 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -69,7 +69,7 @@ struct xiic_i2c {
 	wait_queue_head_t wait;
 	struct i2c_adapter adap;
 	struct i2c_msg *tx_msg;
-	struct mutex lock;
+	struct mutex lock; /* Locking between isr and new xfer */
 	unsigned int tx_pos;
 	unsigned int nmsgs;
 	struct i2c_msg *rx_msg;
@@ -82,24 +82,23 @@ struct xiic_i2c {
 	bool prev_msg_tx;
 };
 
-
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
@@ -237,18 +236,21 @@ static inline int xiic_getreg32(struct xiic_i2c *i2c, int reg)
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
 
@@ -418,7 +420,8 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 
 	while (len--) {
 		u16 data = i2c->tx_msg->buf[i2c->tx_pos++];
-		if ((xiic_tx_space(i2c) == 0) && (i2c->nmsgs == 1)) {
+
+		if (!xiic_tx_space(i2c) && i2c->nmsgs == 1) {
 			/* last message in transfer -> STOP */
 			data |= XIIC_TX_DYN_STOP_MASK;
 			dev_dbg(i2c->adap.dev.parent, "%s TX STOP\n", __func__);
@@ -519,8 +522,8 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 	/* Service requesting interrupt */
 	if ((pend & XIIC_INTR_ARB_LOST_MASK) ||
-		((pend & XIIC_INTR_TX_ERROR_MASK) &&
-		!(pend & XIIC_INTR_RX_FULL_MASK))) {
+	    ((pend & XIIC_INTR_TX_ERROR_MASK) &&
+	    !(pend & XIIC_INTR_RX_FULL_MASK))) {
 		/* bus arbritration lost, or...
 		 * Transmit error _OR_ RX completed
 		 * if this happens when RX_FULL is not set
@@ -662,9 +665,8 @@ static int xiic_busy(struct xiic_i2c *i2c)
 	 * should ignore it, since bus will never be released and i2c will be
 	 * stuck forever.
 	 */
-	if (i2c->singlemaster) {
+	if (i2c->singlemaster)
 		return 0;
-	}
 
 	/* for instance if previous transfer was terminated due to TX error
 	 * it might be that the bus is on it's way to become available
@@ -672,7 +674,7 @@ static int xiic_busy(struct xiic_i2c *i2c)
 	 */
 	err = xiic_bus_busy(i2c);
 	while (err && tries--) {
-		msleep(1);
+		usleep_range(1000, 2000);
 		err = xiic_bus_busy(i2c);
 	}
 
@@ -867,7 +869,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		xiic_std_fill_tx_fifo(i2c);
 
 		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
-
 			/* Start Tx by writing to CR */
 			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
 			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr |
@@ -891,9 +892,6 @@ static irqreturn_t xiic_isr(int irq, void *dev_id)
 	/* Do not processes a devices interrupts if the device has no
 	 * interrupts pending
 	 */
-
-	dev_dbg(i2c->adap.dev.parent, "%s entry\n", __func__);
-
 	isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
 	ier = xiic_getreg32(i2c, XIIC_IIER_OFFSET);
 	pend = isr & ier;
@@ -907,6 +905,7 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 {
 	int first = 1;
 	int fifo_space = xiic_tx_fifo_space(i2c);
+
 	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, fifos space: %d\n",
 		__func__, i2c->tx_msg, fifo_space);
 
@@ -921,19 +920,20 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
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
@@ -944,12 +944,12 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
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
@@ -1001,8 +1001,8 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		goto out;
 	}
 
-	if (wait_event_timeout(i2c->wait, (i2c->state == STATE_ERROR) ||
-		(i2c->state == STATE_DONE), HZ)) {
+	if (wait_event_timeout(i2c->wait, i2c->state == STATE_ERROR ||
+			       i2c->state == STATE_DONE, HZ)) {
 		err = (i2c->state == STATE_DONE) ? num : -EIO;
 		goto out;
 	} else {
@@ -1035,7 +1035,6 @@ static const struct i2c_adapter xiic_adapter = {
 	.algo = &xiic_algorithm,
 };
 
-
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c;
@@ -1195,6 +1194,7 @@ static const struct dev_pm_ops xiic_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(xiic_i2c_runtime_suspend,
 			   xiic_i2c_runtime_resume, NULL)
 };
+
 static struct platform_driver xiic_i2c_driver = {
 	.probe   = xiic_i2c_probe,
 	.remove  = xiic_i2c_remove,
@@ -1210,4 +1210,3 @@ module_platform_driver(xiic_i2c_driver);
 MODULE_AUTHOR("info@mocean-labs.com");
 MODULE_DESCRIPTION("Xilinx I2C bus driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:"DRIVER_NAME);
-- 
2.17.1

