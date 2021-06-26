Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF663B4E10
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhFZKbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:31:50 -0400
Received: from mail-co1nam11on2073.outbound.protection.outlook.com ([40.107.220.73]:16992
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230131AbhFZKbl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:31:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcFyRGN1nwFINh4//s5OEAkbdkA7UOiroW4qbveBQorcCojMNZPE8eMWMFWGKX/ZHRII0YW4e6mF5kfceYSMQVU0x6mbc/yIGNLkFQT+XGVvaFyYr9zQ5+uQVrI4P/us4SEC5qg/3JD5sDh9fPl046eadQDCtXvox4lruDekIuTxrVhdcUpV4rknbrDbxb9ZHBYZ4muG6A3fKh0MAYqvNWsvmJ2G/XTcsH3p/vipUFzqMB0Db+PHXQrmfuroE2/OLSRNBaSUpLWihba8TtUE7ysRmlDSvbnjkLJvZcASWZkaCyx0Dg9joly0QIVQzU27n+GoWisdlz7UqCZG7Lptvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjEPQ2Fq7OhyHg8b53LBLrS6j03OCLqfx/yZrG7v5EY=;
 b=NJz2LgZSqBbhEU1NBIeD8um+wLSBL6dsQYllrhTJkEvditxexMAvQ1PLJ8o2gd4eumyjlkC2Jgs6gnevjPxolbN/iZLmdW2rwETpykzsd71cBpgVIUtcc0GO+J5KcGUQbZO7rZ/yaFeIQRAyWTv95Bgdn89m9ASyauaMSbLLXnqL1kM5z87cy63fxuMGlV0aTTCpqBWIoBm1OBKtY6dvkadIYXrSaz0DjTFw0hxdyuOTsoEgqDx/s5Qhuw8cBPqgf4qgXOIGe/o4iFLt35wq4tinuu7zo0Ui/vFIQ9vd0Zzlh1IdVmFgEZaL1uL3EIs6BCaM2FIE7jLBzWDQ8hG0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjEPQ2Fq7OhyHg8b53LBLrS6j03OCLqfx/yZrG7v5EY=;
 b=JRtXoawPFgbz80dI5Wqrl+3r/kosfdwv/rwPTpb0vKAcDKGE44QqK4dz99GgaXxr3cjR2T4V8ywms5VfE5oETd8ErWpeQKZCxMT7Ij6oHjNAep9ufSYyrV8A/Q5fb4tPhPf81hvlU7r2u7cBJJ94O2ThV7z+gDdEp8TJXl0S6CI=
Received: from SN6PR01CA0015.prod.exchangelabs.com (2603:10b6:805:b6::28) by
 DM6PR02MB7098.namprd02.prod.outlook.com (2603:10b6:5:251::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.23; Sat, 26 Jun 2021 10:29:18 +0000
Received: from SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:b6:cafe::3d) by SN6PR01CA0015.outlook.office365.com
 (2603:10b6:805:b6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Sat, 26 Jun 2021 10:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0033.mail.protection.outlook.com (10.97.5.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:29:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:29:03 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:29:03 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5Yb-000AWJ-TD; Sat, 26 Jun 2021 03:29:02 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 10/10] i2c: xiic: Add smbus_block_read functionality
Date:   Sat, 26 Jun 2021 15:58:06 +0530
Message-ID: <20210626102806.15402-11-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccc7fc19-5a25-4549-e0fe-08d9388d40d6
X-MS-TrafficTypeDiagnostic: DM6PR02MB7098:
X-Microsoft-Antispam-PRVS: <DM6PR02MB7098E874CD9173273D780972CA059@DM6PR02MB7098.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t95PndNEtNYswBD17tlWxm5K2WuK05Q4VzQbB89f0Wgu3nxdYeTPADMKWuLnJ31g/vL5BH+ybXNFmb+IlGOk7QjytA9K07fshcTssccCkeXRc9StconoofI2/GlNapi5xDKq9uwbOztB/dscWn6shkfC9qqEk9LJhsScM5lFt48/4/7YH96jT+ZCQ4Hfdlkq6g6Kb4cIQxrnVHRQUO+Yi8IUJcaP4XcpQT672eIA6KBw5yzmI5zjfRbP4hDaPBlCcGBtXgUryfJVZYKrM4OdX4xFCIvq6HxEpOV6chs/OFzdFtjvFkutZWKfNoo150CoKxH4UMQyU/w1vH1s0jixW8B8Ja3y+SQfT6fCLJQujoLSLU/9RBjdUBUCcw2RrJPG2CS3OmeQEmAUtgoyedExcbfuMIWONqYB8QYyy3y0mn6bzizWOvyfrXHWQhhI7poWeDrcKixiYKPCgtc7CwBu2ziyFy7pxLmfayUNVLoeJ45tVZ2+7lHk4GN4KYyfITJyNtY1fN3hGpyBuDGaK2DwPMAInq8lLBGknhT7/1oOUt8qx/YgOEXdY6s3/6yIHPylPW165YuU3abm8a3ATvOVAVPkSEuTOXc6e1mVH5zid4arjoy2RhOgzmnBsvd3BrX4mbJiGqi67npZJWbXApnIozBeIjXjjMbS39VNk5EGV4zfyAgYrSUW0BlRBU+G5vTTXvdNuvGdiJui25wA37SdQA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(36840700001)(70206006)(8676002)(70586007)(44832011)(26005)(82740400003)(43170500006)(83380400001)(7636003)(356005)(186003)(7696005)(107886003)(1076003)(4326008)(2906002)(36906005)(36756003)(336012)(316002)(8936002)(2616005)(426003)(110136005)(54906003)(9786002)(5660300002)(6636002)(47076005)(478600001)(36860700001)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:29:17.8204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc7fc19-5a25-4549-e0fe-08d9388d40d6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7098
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

smbus_block_read is added to xiic driver to read from few sensors
which support this command. Since the number of bytes to read is not
known prior to transfer, we are using xiic standard mode for low level
control of IP.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 80 ++++++++++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 26fc174b8e95..931b9bce87fe 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -65,6 +65,7 @@ enum xiic_endian {
  * @dynamic: Mode of controller
  * @prev_msg_tx: Previous message is Tx
  * @quirks: To hold platform specific bug info
+ * @smbus_block_read: Flag to handle block read
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -84,6 +85,7 @@ struct xiic_i2c {
 	bool dynamic;
 	bool prev_msg_tx;
 	u32 quirks;
+	bool smbus_block_read;
 };
 
 struct xiic_version_data {
@@ -344,6 +346,54 @@ static void xiic_deinit(struct xiic_i2c *i2c)
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
+			   (rxmsg_len == 0)) {
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
@@ -366,6 +416,12 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
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
 
@@ -763,8 +825,12 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
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
@@ -971,7 +1037,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c)
 
 static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
-	bool broken_read, max_read_len;
+	bool broken_read, max_read_len, smbus_blk_read;
 	struct xiic_i2c *i2c = i2c_get_adapdata(adap);
 	int err, count;
 
@@ -996,20 +1062,22 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	i2c->prev_msg_tx = false;
 
 	/*
-	 * Scan through nmsgs, use dynamic mode when none of the below two
+	 * Scan through nmsgs, use dynamic mode when none of the below three
 	 * conditions occur. We need standard mode even if one condition holds
 	 * true in the entire array of messages in a single transfer.
 	 * If read transaction as dynamic mode is broken for delayed reads
 	 * in xlnx,axi-iic-2.0 / xlnx,xps-iic-2.00.a IP versions.
 	 * If read length is > 255 bytes.
+	 * If smbus_block_read transaction.
 	 */
 	for (count = 0; count < i2c->nmsgs; count++) {
 		broken_read = (i2c->quirks & DYNAMIC_MODE_READ_BROKEN_BIT) &&
 			       (i2c->tx_msg[count].flags & I2C_M_RD);
 		max_read_len = (i2c->tx_msg[count].flags & I2C_M_RD) &&
 				(i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC);
+		smbus_blk_read = (i2c->tx_msg[count].flags & I2C_M_RECV_LEN);
 
-		if (broken_read || max_read_len) {
+		if (broken_read || max_read_len || smbus_blk_read) {
 			i2c->dynamic = false;
 			break;
 		}
@@ -1040,7 +1108,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 static u32 xiic_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
 static const struct i2c_algorithm xiic_algorithm = {
-- 
2.25.1

