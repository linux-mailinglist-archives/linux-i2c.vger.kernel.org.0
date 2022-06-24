Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 277E455991E
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiFXMFv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiFXMFu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:05:50 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298347E020;
        Fri, 24 Jun 2022 05:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO3+hKMXD/Y6PRKvjNg/gexhuJhWj5LtQ9FwZHZ20KApNSBhgdw6MElISu+1lNqVUPSuDjIccg6JKF/xsVwmBptmzrH0ybXMWkqrY6enqlox3UoQ4DrPkQfKwLgm4g+ZuBIVRHA32hQe5yE28TyF2rbJEVYFgBKgBHWElF19d4sc/HHzRZQ73kV75ecIWQQJnqiPE0+9EYSyy77211WvTu1LpLX8rAH2gfISyhMJejuylEpWp/Yv9Ea85htmpbLUPb8JUYCblondnrWdml6blj8eLTV6WaKTV9XV9X8z/N+vqb2Fv6iydqSMyrKxytk1cMj3tYGT9lk6Oosr8++Tvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/5lUZm/kw9/+tuWTrViqTho9jF1ruXzIM3SMV1abU8=;
 b=Rpj22lsegs+5t5ipVPLzxE8w3Wsi5PvvTAIZVQ9PlS5472WEch0xqqg/q9DxGLgIltIx2RUbwd2eOF8Yke24fjGlJaXCK0ND79fq/RiDZzyJpO2g9uUh0YRU+hjROeTzVOufxUmaMUFrp1JRPmL36HXgUrNfM6eTboUEl/LIfs7UdKeRT/UvQgQi2Y3ea0bBgxaviVr20oLMmYj+HUnmWUqoLq7vbL90EmZbrM1YDZ1HDmK3DkjyptnhRDHCOoAUxRrySgROSa18AM8Ty+9Q5wldnLPuIPajcyNvph6hd7WjSCfb+h0weUAJJ86OY2PUETNRrLYr6zttwSor2TwAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/5lUZm/kw9/+tuWTrViqTho9jF1ruXzIM3SMV1abU8=;
 b=YL8R2G7dR7gZlKslYGf+/c+aaKolWgKQR4G7eeJYM2hC1EKtHMpD961rpYsz312dZV+jwcUSytIciXZL/9r+tqbHxlZEu3JqLGUDj162woZb67tpYVbep7cJt6lkGfNBACvpTxW9jjJthPoAV1qCqkgq2tgKyXUA8vxa0Fljh3k=
Received: from SA1PR02CA0018.namprd02.prod.outlook.com (2603:10b6:806:2cf::26)
 by DM5PR02MB3292.namprd02.prod.outlook.com (2603:10b6:4:64::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 24 Jun
 2022 12:05:46 +0000
Received: from SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:2cf:cafe::4) by SA1PR02CA0018.outlook.office365.com
 (2603:10b6:806:2cf::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 12:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0056.mail.protection.outlook.com (10.97.4.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:05:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:05:46 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:05:46 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47730 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i4H-00056G-EJ; Fri, 24 Jun 2022 05:05:46 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 62D65104545; Fri, 24 Jun 2022 17:35:33 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 01/12] i2c: xiic: Add standard mode support for > 255 byte read transfers
Date:   Fri, 24 Jun 2022 17:35:16 +0530
Message-ID: <1656072327-13628-2-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 243351e8-3dd0-43a9-c5ec-08da55d9df23
X-MS-TrafficTypeDiagnostic: DM5PR02MB3292:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5JzoU8KWLuGhftzqz0AO+COyQQCr1ulFGPccyOrVhxV8uYVJuyIbW8pC+02Q1y8Ohr6qE7i+g4FL6qg4G7gx8sOuP6mKmS+zYsLLsAC91cNBm8/ssvKik2T+dbmQvHFzwtIseanB4j7bG4UcATBNAA4N7w/mSy88QQ1UjCUQAmUBco3CDKpgbnvobTn7NXP05oIKZwAlMJrjme3omTX5Za+e/h9+zi9cicbq6RZhQ1hWBsVMJosGCr98+QcjrPW3gdtZdSD3x8BruMVHzyNh25lvFnOIvQOYU/8ClSpVijdO0u6sv6pUIbzy0Ch+Vh6+F8XVVhS8AVucOY52JlVfEPiVt/MBIDERhYLh0mq4/wL3eV9zeq8OhXm8owagPeieOUgUSgKJgMqNubK1up4CSGtVq54D4MbQcuBm2LCRV5BCD3ab70H6K3uBfmC/uM6U9bc9WKfQenB/GBO1KOzqHN5evnC5Y837BGSS8jNrdYN9F8m8s75H7xsjGI2UIIT9HS3cKL9N5znTNkf/DrjBkexWckKHGVgaxuQ4vp1l3n+7shgMwU8HwKKPzIWeeR53FZ6BMJggM/CuQIKwaABNsDtNk1K3bqsei9VqXrPLlXpyUbp6TcccxteFg7rboV6HGImqrw4+pzZU/wDpt5whHR5JPV8BmF1ft30DJILEDRYxQmH5l5WciA+oyPOPDXQ1JjHLW+cifed2n0TuCDUZgCbwlXlvuwVNU7bcwzCujfQrgXTiW9WIrO5820AM7opRDEcC1wMzGxeFbTJR4Y6duLZvyeT583GHNnjdWTmBpJBX8CDhnjgDUIFZshWyX/kqRqNAiNsu6DdYDcMTihjAb3T6p4pb5vAht3Xr3O4Ynh4=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(40470700004)(36840700001)(46966006)(110136005)(316002)(42186006)(54906003)(47076005)(70206006)(6266002)(70586007)(8676002)(41300700001)(336012)(2616005)(107886003)(6666004)(426003)(186003)(4326008)(478600001)(26005)(83380400001)(40460700003)(8936002)(7636003)(82740400003)(356005)(40480700001)(5660300002)(82310400005)(2906002)(30864003)(36756003)(44832011)(36860700001)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:05:46.5335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 243351e8-3dd0-43a9-c5ec-08da55d9df23
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3292
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-xiic.c | 326 +++++++++++++++++++++++++++++-----
 1 file changed, 280 insertions(+), 46 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 9a1c3f8b7048..fb2443623844 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -60,6 +60,8 @@ enum xiic_endian {
  * @clk: Pointer to AXI4-lite input clock
  * @state: See STATE_
  * @singlemaster: Indicates bus is single master
+ * @dynamic: Mode of controller
+ * @repeated_start: Repeated start operation
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -76,6 +78,8 @@ struct xiic_i2c {
 	struct clk *clk;
 	enum xilinx_i2c_state state;
 	bool singlemaster;
+	bool dynamic;
+	bool repeated_start;
 };
 
 #define XIIC_MSB_OFFSET 0
@@ -143,6 +147,9 @@ struct xiic_i2c {
 #define XIIC_TX_DYN_START_MASK            0x0100 /* 1 = Set dynamic start */
 #define XIIC_TX_DYN_STOP_MASK             0x0200 /* 1 = Set dynamic stop */
 
+/* Dynamic mode constants */
+#define MAX_READ_LENGTH_DYNAMIC                255 /* Max length for dynamic read */
+
 /*
  * The following constants define the register offsets for the Interrupt
  * registers. There are some holes in the memory map for reserved addresses
@@ -316,13 +323,14 @@ static void xiic_deinit(struct xiic_i2c *i2c)
 
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
@@ -330,13 +338,52 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
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
+
+	if (i2c->dynamic) {
+		u8 bytes;
 
-	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET,
-		(xiic_rx_space(i2c) > IIC_RX_FIFO_DEPTH) ?
-		IIC_RX_FIFO_DEPTH - 1 :  xiic_rx_space(i2c) - 1);
+		/* Receive remaining bytes if less than fifo depth */
+		bytes = min_t(u8, xiic_rx_space(i2c), IIC_RX_FIFO_DEPTH);
+		bytes--;
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
+	}
 }
 
 static int xiic_tx_fifo_space(struct xiic_i2c *i2c)
@@ -367,6 +414,56 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
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
+	else if (len && !(i2c->repeated_start))
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
+
+			/* Write to CR to stop */
+			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
+					~XIIC_CR_MSMS_MASK);
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
@@ -401,7 +498,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	dev_dbg(i2c->adap.dev.parent, "%s: SR: 0x%x, msg: %p, nmsgs: %d\n",
 		__func__, xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
 		i2c->tx_msg, i2c->nmsgs);
-
+	dev_dbg(i2c->adap.dev.parent, "%s, ISR: 0x%x, CR: 0x%x\n",
+		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 
 	/* Service requesting interrupt */
 	if ((pend & XIIC_INTR_ARB_LOST_MASK) ||
@@ -480,7 +579,10 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 			goto out;
 		}
 
-		xiic_fill_tx_fifo(i2c);
+		if (i2c->dynamic)
+			xiic_fill_tx_fifo(i2c);
+		else
+			xiic_send_tx(i2c);
 
 		/* current message sent and there is space in the fifo */
 		if (!xiic_tx_space(i2c) && xiic_tx_fifo_space(i2c) >= 2) {
@@ -579,31 +681,99 @@ static int xiic_busy(struct xiic_i2c *i2c)
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
 
-	if (!(msg->flags & I2C_M_NOSTART))
-		/* write the address */
-		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
-			i2c_8bit_addr_from_msg(msg) | XIIC_TX_DYN_START_MASK);
 
-	xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+	if (i2c->dynamic) {
+		u8 bytes;
+		u16 val;
 
-	xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
-		msg->len | ((i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0));
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
+		/* Check if RSTA should be set */
+		if (cr & XIIC_CR_MSMS_MASK) {
+			i2c->repeated_start = true;
+			/* Already a master, RSTA should be set */
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
+					XIIC_CR_REPEATED_START_MASK) &
+					~(XIIC_CR_DIR_IS_TX_MASK));
+		}
+
+		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
+
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
+			i2c->repeated_start = false;
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
@@ -611,10 +781,15 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
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
@@ -623,24 +798,61 @@ static void xiic_start_send(struct xiic_i2c *i2c)
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
+					XIIC_TX_DYN_START_MASK;
+
+			if (i2c->nmsgs == 1 && msg->len == 0)
+				/* no data and last message -> add STOP */
+				data |= XIIC_TX_DYN_STOP_MASK;
+
+			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
+		}
+
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
+			i2c->repeated_start = true;
+			/* Already a master, RSTA should be set */
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
+					XIIC_CR_REPEATED_START_MASK |
+					XIIC_CR_DIR_IS_TX_MASK) &
+					~(XIIC_CR_NO_ACK_MASK));
+		}
 
+		/* Write address to FIFO */
+		data = i2c_8bit_addr_from_msg(msg);
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
-	}
 
-	/* Clear any pending Tx empty, Tx Error and then enable them. */
-	xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_ERROR_MASK |
-		XIIC_INTR_BNB_MASK |
-		((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
-			XIIC_INTR_TX_HALF_MASK : 0));
+		/* Fill fifo */
+		xiic_std_fill_tx_fifo(i2c);
+
+		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
+			i2c->repeated_start = false;
+
+			/* Start Tx by writing to CR */
+			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr |
+					XIIC_CR_MSMS_MASK |
+					XIIC_CR_DIR_IS_TX_MASK);
+		}
 
-	xiic_fill_tx_fifo(i2c);
+		/* Clear any pending Tx empty, Tx Error and then enable them */
+		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
+				XIIC_INTR_TX_ERROR_MASK |
+				XIIC_INTR_BNB_MASK);
+	}
 }
 
 static void __xiic_start_xfer(struct xiic_i2c *i2c)
@@ -701,6 +913,33 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
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
@@ -737,15 +976,10 @@ static const struct i2c_algorithm xiic_algorithm = {
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

