Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DC9395BCF
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhEaNY7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:24:59 -0400
Received: from mail-bn8nam12on2088.outbound.protection.outlook.com ([40.107.237.88]:47584
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231975AbhEaNW5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:22:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ko4BbthXis4HWXsTW2mvkWFZGoQBp0P2aAseMPfEXTHcdvr/eheGxKD7emD5RjBHZ8T9gQEtm4aNLw/U4ge9jXivEu+p/7znFNhZQ2NuxuG+8XqatWTa0ZgGnOlFZcv+27gAPbEMuHVZ99gu8kAv2ZdPA5IZarzKz6wNkC3S8B5zWhiCy7dRtDMGNjyCcw7AGOwUuQY9Zd320xA37RBGzHVIP/N8WOWAfoLHriRECqMpbzgJSy5gWcx6WdQuEueWL7nCfB/Uw6wgwguofsL5XpmCDa2IsK+/BfFNTAMCggQ0KJ0rHJJZLjqGTBErjBJe4vDgtcDDVgIslg0cXf0AjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iumiq/0C8WuU8ugMFid/jCCxE70N8/gFak5ZMoT9yNM=;
 b=nBbapYqiYohd3LXh020cxPftfMSkjyVX8DOBWjxkPsB2eEcwi7/nJ1xkZsYcPedZpGTNZgJmexI8TltgvfDSiU+VxjLZPqO7iqndu3MBNDEyi4Y5VlLoVZHRszA+ZR+oQ+63/WRx4Wc1R2E+TNpxA8HzGHM0UIvDSfidhazg+uUlRuKFixY0tONEAVWrJ6jrscUSOCi60vcHcssqjH0ZLm80Zw4MvxXgr+aGichxDx2Q3ufZo+JphBGV15ON/UFe/x8D27TfcMsdOw+OWPgTOHEJ6n+N6UT/mtB+b3gdtmbLnQWG17cQpjPY4sRpvOZaAhO6H5RHRLGIwj6VX/R/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iumiq/0C8WuU8ugMFid/jCCxE70N8/gFak5ZMoT9yNM=;
 b=K6FI9Qxg3o/x9CjJfCjlcz6Ms+VxsMyHctqAkWnwyhqWDM6ywulVEvtcMtyRDcHOUwEL+ys526YaMXgSLZOtxTKlFDYYorVN6z5r9K+6q61FLkW5UctNLaZhQCmgVs1Y5dZZYstHPcXtCkBlEkYN+LJNJrmshUCKfrUBr9pU1G4=
Received: from SN2PR01CA0067.prod.exchangelabs.com (2603:10b6:800::35) by
 BN8PR02MB5730.namprd02.prod.outlook.com (2603:10b6:408:ae::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21; Mon, 31 May 2021 13:21:16 +0000
Received: from SN1NAM02FT0013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::91) by SN2PR01CA0067.outlook.office365.com
 (2603:10b6:800::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21 via Frontend
 Transport; Mon, 31 May 2021 13:21:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0013.mail.protection.outlook.com (10.97.4.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:21:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:20:42 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:20:42 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqS-0004GE-MU; Mon, 31 May 2021 06:20:41 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 04/10] i2c: xiic: Add smbus_block_read functionality
Date:   Mon, 31 May 2021 07:19:42 -0600
Message-ID: <20210531131948.19477-5-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7d5f4b0-0d31-4f2e-a3cd-08d92436f7e7
X-MS-TrafficTypeDiagnostic: BN8PR02MB5730:
X-Microsoft-Antispam-PRVS: <BN8PR02MB57304F7A3144E5147FEA1A7DCA3F9@BN8PR02MB5730.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZG8lS9U15VKQOyn8HcOouHdDg0LQE51APXRUGz7vy3toitYSKELMsUNBvE/9AIWFJpBKos2CjbJvf9rtBHWkMfxwGkVaunDU4k/g9lBLGIkCWJwwgN1q5Uta75NjzqMd2uX/hiGVsIGdd+LektqWafEwzi1KTNLpZt27aKJ7t0pDA9RSZ5tm08KP21g+ehqhOo09soC6+/E+QYyxqUJKTpNvyJRQ6Rv+Y5yVgMdbXlv0EUKOjHvTgPWprDzUYiyzqwEMAEY6uTQYSAKuZ41qbkdcUca++QJN/JsRqciNxjKFdKkDR5fLi4Jag4JkUljX1L+9C12w7YvbMS8lQrAjZFEm+BAi6N7k5qMwdvBiFAwMTJ4dP5631yA5WEBQEErwS6T0gJ0ExBR/1VG5r/oH/4ajmPafJPJTtfWR2jr22jg72Pea/NXkcz+2cr2pf8hDWnoWeSM9WHhHGtNTCkBVEHXHQDH0m8YSQTQ3dS67kqsCMLkD0u5jrQg5/IOOfFNEc5P2gHHSkqHRFUbrb23aSnUqFrJZtRgT9ImxluaoDm9ucFtbRZkrHQjPw7HPICtXVBdk+l/D/GqxB43zJX31yM9G5W57D/zaIy1aFFrtyGT4W4StMZAGyWjUfkf8I7QAGLNqt3nXUMp/ucgAL+wK1P1IKB7w3Pv4jNxRTCKhXlzWw6UDEpfXeGESsdrB+I9hyIv8XYEhE2GB1NBlntsg6A==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(46966006)(7696005)(5660300002)(36860700001)(26005)(426003)(110136005)(186003)(1076003)(2906002)(316002)(8676002)(478600001)(47076005)(8936002)(82310400003)(70206006)(4326008)(6636002)(2616005)(70586007)(43170500006)(82740400003)(7636003)(44832011)(36756003)(83380400001)(356005)(336012)(54906003)(107886003)(9786002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:21:15.4823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d5f4b0-0d31-4f2e-a3cd-08d92436f7e7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5730
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

smbus_block_read is added to xiic driver to read from few sensors
which support this command. Since the number of bytes to read is not
known prior to transfer, we are using xiic standard mode for low level
control of IP.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 82 ++++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index fa2eef9e622f..51b5fd5768db 100644
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
@@ -336,6 +338,54 @@ static void xiic_deinit(struct xiic_i2c *i2c)
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
@@ -358,6 +408,12 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
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
@@ -627,6 +683,12 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
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
 
@@ -755,8 +817,12 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
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
@@ -986,10 +1052,14 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
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
@@ -1020,7 +1090,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 static u32 xiic_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
 static const struct i2c_algorithm xiic_algorithm = {
-- 
2.17.1

