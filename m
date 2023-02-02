Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3565B687948
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbjBBJol (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjBBJoj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:44:39 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C2A241E6;
        Thu,  2 Feb 2023 01:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWrHMKk34GfECyHv3FK7hUHgYe8ByL5a17RX2Hue/NZ6JLzb4xhCXRjYVR/U0p+kwm1zs7tQaRXr41JKotPXFqF5uw5s2G531bwUO8Flp2a9nSjn+SPCt7y5jrCiYMtTrRqAzuLuF537yiNtXQyEZOWJI1PVkK3xPukW5hzpz6EAgtRb6+JCO61zn9b/vaaCi8e/70huudF6psqpjaOI8WoVFaKf0ACgmrg1NBJLAwVrd8xziIRuB+FreWhMeybDtMctD550Vqfswd2+qLTNjcVzgwWR/xabamI/YJfXKS4Dp/8IFMKfS2ZZe4oOz5zjToJfv+vef7BfWQVrBm97yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCZLKqSFYYHdOKQrTutofbhVjZsqbIE+qYtqLXWGyPo=;
 b=hRdH1Ick+aSADzUD5yaPDGy7+yfhWhbTo5I+AuFsMMbWUi0RYVL6y60qxGR2kNCYK+tQ5+q59iantC3Fjor64ZYrWHcsJUmwubde47H1P20TzBBTi0+cAqcxS87pR1qwtOtOtz41sbbMCTMhbdZqfRwFPGc9tvYp3b5XzMab4czat9qfBgMCMJ5pCbi9z+DaCHLfVSF3fGCoQuxuadeF11RK3ypyQAPWy3G6A4+Yq1RkMBFhdix0SHY6xPP4cocb/t4US9+xojBrAM4vQ7GGDgGrz5r3r52z7abTblDanqLyoLDHgaBf7c0jUgzxwpuxWKi21AoZo3gZfe7/jHaW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCZLKqSFYYHdOKQrTutofbhVjZsqbIE+qYtqLXWGyPo=;
 b=nR1UHb26uF9M5ePStiofOG8WiTO8usrH9a7mpXd5sNkdI487qQgtyMNpWulh6vM22kZFsryedOmEzCh5XyTq+W/Ys9yZtfn+LH1uyR8nw3z5pROQU8vs45rZm3znqugFrprme6EHLXJuLUobi3N2PeTwOS6Ek33NxnOP5v72Nec=
Received: from SN7PR04CA0167.namprd04.prod.outlook.com (2603:10b6:806:125::22)
 by DM4PR02MB9240.namprd02.prod.outlook.com (2603:10b6:8:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 09:43:29 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::1c) by SN7PR04CA0167.outlook.office365.com
 (2603:10b6:806:125::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 09:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 09:43:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 2 Feb 2023 01:43:26 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 01:43:26 -0800
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
Received: from [172.23.64.3] (port=37000 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pNW7q-0003Sh-4J; Thu, 02 Feb 2023 01:43:26 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 3FFE91055BE; Thu,  2 Feb 2023 15:12:25 +0530 (IST)
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
Subject: [PATCH V4 5/9] i2c: xiic: Add smbus_block_read functionality
Date:   Thu, 2 Feb 2023 15:11:34 +0530
Message-ID: <1675330898-563-6-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0060:EE_|DM4PR02MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 67da98fd-bebb-4043-b7bb-08db0501f0b2
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EgFCxRhLh+htVKAWIjvjP8pJys9Wd+4R0QoHxzazBTqSIBgdnwApLwBE2Jb79Fph3xMTFj44OD07h5Qc/Yf086hZu8BbJFLuRoBEpWctEZCGzgrBaK/cQRFis9nwm8k2Qv9Ssl1WWnlw2X2Rz3Ao3eHYPIoxduSQFiUom7duYw+2C2OUz2hEmxcj0Jsy3Xv2IXHTavTKbHy2XDqApmO/Fv+SsYoF89LQF90bRROBo9pqVFV917TqC0/Z+CKMHhZRX42EZvo3Cn2Jjekn2O1MXUuredlpXcCRJEyZh1xZ9ST04B7ATC5Y6N6egXvA9qlqEb57+t+PChtuW+6VVz2BOz1ksEGh960nG5iRAmqeRnnbG2hefW7Z8mknG3LaI/a5+wFTp8yIqPjLBtF/U8CGosFkqQrzbSTAhz2W0hQQDsaXwXfacD11QzDjNTy/6VxYtE1KJ+IxUWqZbFQtQXk2Xow1yAHwmP/cNeIOuEtS4fIQE2oe2yRc3nb6JrYrHVHhDuC/5m6J7F4s0gqQIasqtMAwytuq4QkS0PvHJAjM6alXCH05VveSPhd1FRzcD//QwCwFGjSaC0aO5gAQb6YpFjeJbHUsTevIgXPZ4CkuPN/QkCK+cyQ967ZZ3SAD+3VNymCVbkBOe+CqbCSfO2Gu1CUU+qzcV7qAD0X/qbeqv7cYSuC+Do9ZRSypUqj5IxjMvx+yXZaaTeRtcoxSVuHvT6ZClcJeceGvox6U18+TAShQSz5L2nvUdTMcGB+dH+MualrkGaYPnzkwF+MzcUAICd2ofO+MtP3FkYzw5ttKobc=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(136003)(376002)(451199018)(36840700001)(40470700004)(46966006)(36756003)(70586007)(47076005)(70206006)(83170400001)(4326008)(82310400005)(83380400001)(8676002)(36860700001)(110136005)(54906003)(7636003)(42186006)(316002)(82740400003)(478600001)(26005)(186003)(6266002)(107886003)(40460700003)(44832011)(6666004)(7416002)(5660300002)(41300700001)(356005)(40480700001)(2616005)(8936002)(336012)(43170500006)(42882007)(2906002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:43:29.3470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67da98fd-bebb-4043-b7bb-08db0501f0b2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR02MB9240
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

smbus_block_read is added to xiic driver to read from few sensors
which support this command. Since the number of bytes to read is not
known prior to transfer, xiic standard mode is being used for low level
control of IP.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 82 +++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 57084696429c..554f83e34a2a 100644
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

