Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1143D678FA1
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbjAXFGS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:06:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbjAXFGQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:06:16 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C17D3803B;
        Mon, 23 Jan 2023 21:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTaJp0aQzPoitLxVzET4MmzRwTLAqoWuvlkDUR+mOhkhvmIB4w9zlwb/cMt+P2M81H2sBUywFEqm9pXXSXf3F4C+e7/H3p7ZniarZxgAVyVZMJhR0vg2ccEgOg9H8JJqDr1bYoIwVUZeZcWsyiVsrLbU0rf9+GbBroKTE4/y6hOXF0RluTiAOepQqZKumC6d8S60ZorHXDGvnY+DUVsTgpVhILUFdrzOy72DEkPVeIv0gczynZRoC5fqV6vCdiYai/g0t2RNo8S8m61mVliIJfuklETyyPBDHCjfSrb2O/wDVjhaNRn87Zc/gX1FhlIr4GyRBYH2mf8wgL7ZRo168g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCZLKqSFYYHdOKQrTutofbhVjZsqbIE+qYtqLXWGyPo=;
 b=EKL7OiSq1U3+oIe0E0YUirsaeqFavCLjcGPtwd6UQVgxppmMfN9ZR2g5g9maI/GGp6EUExlEAanY8wPqjiyr0Qb8mByWrp8OSyeE0Zv7BYgaxtUqcCFEN/5euPtM6d6wjeEvgDLXUEzE8l1RDEt+KcSvT+FBBfYWjgJHBGp0DVzbqgqruz8McOHA+/yrBHHgxNEdu6E9YbH6Gfm+dtLF1ZdIFOQH7FJ8URWMyYFgfXVaCWUcHNQOK6oPx1EjDkvh/A2ZtH+kvfff3e2wcOjXZdTRQ16kYP/0FLeS5kfpTJgQBRtlC0R9D9mpPEFO3E/xpBu2AJo6P3usAt7xDciziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCZLKqSFYYHdOKQrTutofbhVjZsqbIE+qYtqLXWGyPo=;
 b=WrB9ocl39giUMqLkCPTrhS23d2NepSOXpRxR8FjrBd0SIhK7s9RK6BDcBjt0TBkMyV30QJlB2EoAXgZyr32h4fTOG2n9kkoKXIPT9KPwQkr/v+aig/jymAcLMewGpUspwibeXZzJZZ91uSpu/rNv9z0YSCwfE8QAf2oYyR3JQTU=
Received: from DS7PR03CA0211.namprd03.prod.outlook.com (2603:10b6:5:3ba::6) by
 BY5PR02MB6929.namprd02.prod.outlook.com (2603:10b6:a03:230::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Tue, 24 Jan 2023 05:05:56 +0000
Received: from DM3NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::73) by DS7PR03CA0211.outlook.office365.com
 (2603:10b6:5:3ba::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 05:05:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT053.mail.protection.outlook.com (10.13.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:05:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 21:05:52 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:05:52 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57531 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBVI-0000r8-DB; Mon, 23 Jan 2023 21:05:52 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 20C0B1055B1; Tue, 24 Jan 2023 10:34:51 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V3 5/9] i2c: xiic: Add smbus_block_read functionality
Date:   Tue, 24 Jan 2023 10:34:38 +0530
Message-ID: <1674536682-25278-6-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT053:EE_|BY5PR02MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc327b8-1fc5-48b9-3dba-08dafdc8acdf
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hj7x0FL2K1vgrx4LjnS03ELz4mMK7fQJUcjsKyVMcEo6Tc1khdH8Ni9UMxCxYR4dLVjt0q3IBpCVUSzrR0gJefav7X+iIW+zqSLpA40mGKPplOrq6r/nnAjBVflPsMC3Z2EHPzYoRS4T79f8CKtfk/E/E6qI/9I0cH52JtOdy6AHZsYxY2rB7DYeBax5NGtIg4gDfT0gedEcm9VuzkVJeFn8XwU0l+WdNhzBszQ54SFYevLCiEUbDcy9bEi8hq1Jlwo7Nqs5nKPQRSNi2oNHhQXj6cRO7xDZbr1bmMgP4zz/pcI2vR7+eaqBK8TuL29gHdRc7ZtQ+xcqMnd0Zr0/rDwtk7feUDbVLDNDXEmslBwNYR55iPLdxH8msAO3f+XM7ktLIA0Gr6HJZMAcNYGWC+FdMu7mM6IEhsVXcaSAzIbuU7FXJafAd4YwzZHJNHAfmpA+bIhlDsRs2pIXDLWuFP0YqiC+PMCCjCEVxIxFCIBjnZ3nBs1IqLGs34pUI1swKQ7QHd6hRNEYp46mcmelFudEl0AjuzRKJk7XyQQoWFFt7LMs72NCSCE1FVtZ8uYbx+5Qq5KKkP4ancepq5nduOJ+PnEVQV+HjZa65gw/7QOPvhCY5QSFSfliHD6dxQdrJnJdFMwvaK1Owtjfz24mObYk22U8u9K2cjFNJU99N8lFzZJ1vTDsF/VQOAngbW7YsipzY6/nwSZETDDxeqDkl0KpTtB3AvxnIGriXwMFyXdQGeNb92MFP4ggwpWsFadhYSUpiWfKPS0Q5BM7qEk8eKDxNFkqqPwmOkUqaYUzidE=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(4326008)(83380400001)(41300700001)(5660300002)(82740400003)(8936002)(7636003)(83170400001)(356005)(2906002)(44832011)(82310400005)(40480700001)(40460700003)(6266002)(8676002)(26005)(316002)(6666004)(47076005)(336012)(107886003)(42882007)(70206006)(70586007)(54906003)(2616005)(42186006)(43170500006)(186003)(110136005)(478600001)(36756003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:05:56.1007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc327b8-1fc5-48b9-3dba-08dafdc8acdf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6929
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

