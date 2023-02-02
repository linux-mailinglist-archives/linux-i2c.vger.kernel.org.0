Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3213C687938
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjBBJnS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:43:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbjBBJnO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:43:14 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F118C6B02E;
        Thu,  2 Feb 2023 01:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoRL22VMlFZ3bbXU3UgaVQpSy4yGSFG+qzMe2FhVHNJCoOO8DquQwcVYpiEajeF6SWjzSvwH5wrL2Yg7AOitEonI65kB4UUFlq2Dl0E6Nv5sKPOko3plf+u6fcahnc/ymNOyfDLQkZZF69s6Pvb4MuKp/bxurPYjTRzE71nvTSHsMhqDUK8l6rzdo3rpqQBBT6j1d6mAqlb+IKuWv41VIdU8PDIygcHWpmNHtzb/fdqj8dx+DsB0Lr4CwJ+itDPDaFJ3rXKKDkzN+7Y86+0YlBa24BfNCqzcgC1GxcKLtqF0El0GdeZHUGuYq/9fKKXrCBFPoH1mXN4Vy91ukg722g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgPu9PptTkSQgoFmVCTn+1fmcrugJCaP+yBakgmxo7I=;
 b=PSplxm/HH4JlQktaD3vsdtobkXiBpLloPUnNOKicFi8ZhgATML6M9PT6Gk+xuNef5qJZXmQP8FCilzkmRfVePNBp4H5At1aIHaRkNLrIrDBBJ3G12iM/kNKo/kqUE7NHTqNvNHuHeUwglwHs0k6tkDffpPeO3hWXUPy4vMgWXadYvcbS8SPytKmqhzo0+lW0uHwMkBtVRkLDZqsGUpAmEQwMoygsRaqR1arPgLyswVsxrYQzugxFIFU3d9CZAjeGgVvfSKbsg71YVxifY/UE20rVaP6BSd1/u3rWxLuQfmLc3WCxxMWtMskAbqTgw/iIJZlMiWV5jWYWT/MmtOgjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgPu9PptTkSQgoFmVCTn+1fmcrugJCaP+yBakgmxo7I=;
 b=R/2J82HF1Z4f3ZcNgnfj5IBwUoqIoqWB39RVJ0kzIxNtdyvb7WYNcrVL4fNBou+jxshPeDOFV/4NWSlCngN5vrubxlHPU5W57ySybfgMuYjiAcLOQhCBGeCbCPD+ls18oE4GohGJj3Qj0LdCicR9Zbj+LaTVsSa9ry+DjuGDtbo=
Received: from BN0PR07CA0003.namprd07.prod.outlook.com (2603:10b6:408:141::15)
 by DS0PR02MB9430.namprd02.prod.outlook.com (2603:10b6:8:dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 09:42:49 +0000
Received: from BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::be) by BN0PR07CA0003.outlook.office365.com
 (2603:10b6:408:141::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 09:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT062.mail.protection.outlook.com (10.13.2.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 09:42:49 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 01:42:46 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 01:42:46 -0800
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
Received: from [172.23.64.3] (port=36995 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pNW7C-000CLP-BR; Thu, 02 Feb 2023 01:42:46 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id A27021055BB; Thu,  2 Feb 2023 15:12:22 +0530 (IST)
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
Subject: [PATCH V4 2/9] i2c: xiic: Fix Rx and Tx paths in standard mode
Date:   Thu, 2 Feb 2023 15:11:31 +0530
Message-ID: <1675330898-563-3-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT062:EE_|DS0PR02MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ce2310-a55e-4d69-106a-08db0501d8b2
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDi9+tndEMdaQ1b5xwcq6N/CBBzyLCJ3OdprsjfOSgAia4L7zTq2igOzv0RYpAIHtOQ2EKu1sJJnKmQvy3zCYwN3EFleJnEIUFClEtpPg5e1jpg9DelVq4jslbUtLvPmfMFclIlGgUBp/0UOmlk6kxoWjwL2Y/ZbFasi7hNQPnIBnSwETRkeX0bMjjlxrUBwCn8U8asyHcRt/Uv7rxlgm0DSZcprWGMCo6hvoMyy0Tc4cOkflIprJQ4MzMc4y/Zi33S9atWH1UG61X+Rp5DcC/kXOybOlvw6/TJuub8Lpc7NysUzTONLwKDmdvPotV8gn0EQSFaPTZx0aZKR01Rzya4INY/ZWS5prGTjF0QQ/txAW5IqfF1JHqpAnowmqlQ0VvVCXeFnl8nnRom7WeHDUo0sKGkxDVWDnVBDdvjFnOIdUNJBoDTfsF068FIG4tc1pQmFSu1tYNrSDbqZ82GS+7RARl9wc1XA8q/K/KUUTeaoJYPabXK9nZCSYEqHNU3UBEXd5x6iygbqnD/WBQi80o3bCAUii3PEACuMUG4NgmnN0iiXqvahGyyly8HdWDjNXTlaSr3qd5LB4elugw9h/9w91+MGISEfSOy8xEdXhBPaXEjKFw2aAPkWb0Pjolp0LkPDsbqcxA4DXRxhTWe1NyP7IjntXdiZxybyzsqqKfb7y6MPVy7XMp0ZVB1kF5070HaEvXmKXhDLLzhaAoxzkLDZG0Xv0uINuaVB/kruVQWn2Wk7jIOBZnYkIkj5kXWE
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(346002)(39860400002)(376002)(396003)(136003)(451199018)(36840700001)(46966006)(40470700004)(82740400003)(356005)(7636003)(36860700001)(83170400001)(40480700001)(70586007)(70206006)(4326008)(41300700001)(8936002)(6266002)(6666004)(40460700003)(83380400001)(2616005)(107886003)(186003)(478600001)(47076005)(82310400005)(36756003)(316002)(42186006)(54906003)(8676002)(110136005)(26005)(42882007)(336012)(2906002)(44832011)(5660300002)(7416002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:42:49.0305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ce2310-a55e-4d69-106a-08db0501d8b2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9430
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

repeated start

When a combined message request comes from user space, the
controller has to initiate repeated start sequence. In standard
mode, this repeated start sequence is corrupted if there is still
data in the Tx FIFO.

So, always make sure that all the bytes are completely transmitted
out of the FIFO by waiting for TXEMPTY, if the previous message is
of Tx type.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 53 +++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 839564054501..86da622e060c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -61,6 +61,7 @@ enum xiic_endian {
  * @state: See STATE_
  * @singlemaster: Indicates bus is single master
  * @dynamic: Mode of controller
+ * @prev_msg_tx: Previous message is Tx
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -78,6 +79,7 @@ struct xiic_i2c {
 	enum xilinx_i2c_state state;
 	bool singlemaster;
 	bool dynamic;
+	bool prev_msg_tx;
 };
 
 #define XIIC_MSB_OFFSET 0
@@ -280,6 +282,24 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 	return 0;
 }
 
+static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
+{
+	u8 isr;
+	unsigned long timeout;
+
+	timeout = jiffies + XIIC_I2C_TIMEOUT;
+	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
+		!(isr & XIIC_INTR_TX_EMPTY_MASK);
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
@@ -685,6 +705,20 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		local_irq_restore(flags);
 	} else {
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
 		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
 
 		/* Set Receive fifo depth */
@@ -739,6 +773,8 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	/* Enable interrupts */
 	xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
+
+	i2c->prev_msg_tx = false;
 }
 
 static void xiic_start_send(struct xiic_i2c *i2c)
@@ -773,6 +809,19 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 
 		xiic_fill_tx_fifo(i2c);
 	} else {
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
 		/* Check if RSTA should be set */
 		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
 		if (cr & XIIC_CR_MSMS_MASK) {
@@ -803,6 +852,7 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 				XIIC_INTR_TX_ERROR_MASK |
 				XIIC_INTR_BNB_MASK);
 	}
+	i2c->prev_msg_tx = true;
 }
 
 static void __xiic_start_xfer(struct xiic_i2c *i2c)
@@ -866,6 +916,9 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	/* Decide standard mode or Dynamic mode */
 	i2c->dynamic = true;
 
+	/* Initialize prev message type */
+	i2c->prev_msg_tx = false;
+
 	/*
 	 * If number of messages is 1 and read length is > 255 bytes,
 	 * enter standard mode
-- 
2.25.1

