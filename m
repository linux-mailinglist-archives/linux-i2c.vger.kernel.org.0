Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641A5559923
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiFXMGR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbiFXMGR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:06:17 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFC17E039;
        Fri, 24 Jun 2022 05:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co6TJtLMagPhM+e8rngYE+/hi4OdwRT/B2hY0P6rlDCK4rVq98s9PrnHUzd+7jBBlmgoYB4ipycYEDJugLZohsYvKkUY7BwNL/b6Ny13Y+0OvmQ91HNtJAzp0u8a1U38C0cHAd6BI853MooVuwAGzkS4kqm7CiBUe4kBFHLyICceaDK+p/nqZ4QsLuMdOa41qISiINvIksxnp0NvBkbiSNkXHWk/sk9Aon51j6CVXQBpSsPQdwAsLvRhCsH20s5pzS71JhUzTMdcdpQIErlvVKXEJlTvhdba8oJHG+ZCaQLR5NepkrM3SDm0O3kLWJRIMQ8bkpcbxv5bdnIEJG1y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmAirJbQixEAzRHhtueUD2aTAo2hECopPY8LPrRKv9U=;
 b=Z7qS39wQkCeRJHWpuwfwQCvbB0t35WcHalhN3j2A4kTj1Ei+0tjtDM5QBpfBp35wWTCRvd4fexe5rfsUEHx507qmks5KXLM+ACSue9RyThRBmaQzNapd5f/MlICJkkoRZ65fgm3zqGoJB09kWUAPWSM8ABlP99MAJpr7kUWd1qYnMhdWsO4vd1Lc31se7NPH6P87kA6S+7T0NC+sYaybG1VgqQW2ZbXxLnJET5P5gResIkwqqJiQDjZKwtwSfBhrVxJyr4S9LALiejFExUZgojUl9VAU5MWOZS7wALxk+2FvNXZ3WUtUyNGwWe4qpaNQztFxum9CzY7Mc06zr/evug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmAirJbQixEAzRHhtueUD2aTAo2hECopPY8LPrRKv9U=;
 b=c8ksJjWhYsR7uhCvrHlcR7173l5iWSqIP7mLJDexMXLqu2Mbubk3c4PEgq8LfivHU7TiiS7Qk0yWlbS8R45R4vdHrTZ9uo4ZKrTBhM52RCQJFIOdkSJbTIe1Xr9Ls8MM8BmcQ9twCZpytoO9KtvTHN40NDUmiQAtuBD2FFMu0oU=
Received: from BN6PR16CA0019.namprd16.prod.outlook.com (2603:10b6:404:f5::29)
 by IA1PR02MB8876.namprd02.prod.outlook.com (2603:10b6:208:388::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Fri, 24 Jun
 2022 12:06:13 +0000
Received: from BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::2d) by BN6PR16CA0019.outlook.office365.com
 (2603:10b6:404:f5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Fri, 24 Jun 2022 12:06:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT053.mail.protection.outlook.com (10.13.2.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:06:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:06:12 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:06:12 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47732 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i4i-000BOG-8b; Fri, 24 Jun 2022 05:06:12 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id D6615104547; Fri, 24 Jun 2022 17:35:36 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 03/12] i2c: xiic: Fix Rx and Tx paths in standard mode repeated start
Date:   Fri, 24 Jun 2022 17:35:18 +0530
Message-ID: <1656072327-13628-4-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fef2375c-ccc5-4728-bcbe-08da55d9ef45
X-MS-TrafficTypeDiagnostic: IA1PR02MB8876:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: roj8qB86Brcc/PXeiuIWtlbaAmCsW82iuciGxr/SikXNw/E5pkxnxb3BXewkf1Kjwr6PS6kz02EivprSUmTz+JRXTt+PywGl6HLnBs36MbZaHIFsrp5ux5ZceDc0s1iTLZ81rmwKrlJADu9aDNNh9TY9bE6Aqq/GDhBXhbJL/51HR3lDLnQDEIyF9Drtf8hbru/Kh4+nNDJaSpx1wCr6JRPHmsH6zqEvCcdxIk4MFCu1MG+BE3L/i/HZFZRSxEY8fDMNCRZhz9gwROsXj/nyzBZPOa/E4Zf4Dt+AB/UyUb+5iZJATXF+bHcRvOuh6hVUIAesi5ssPQAvHvffNTuAJE3yB4RH/Jr8wKPi9hLg6xf1tSG2p1IXrJBxj4jXZ9x62ok/voIBVNB9WcQOJXLt6rKG67+zWcAJDzki9paSdar1hm/1u2jNeEc43rHkWQOhJeRXKZHseC3l3GcYcSL9kpGlBv+SMdOq+SHiKDeCSP1xQGGqBsq2Wg7TWkZ5bxy/8LDnL4Ytc4R2AkD9+CjdJKog0ubtn5MEX14eIueE9ukFpQG9qvo9HVzz3fJlo7tLpzePlOPr9ATW90kg2OlkRbMgTBOxouRgqhWJPTNJz0oFv9eDx8JiOfGKf9jhkN6WhLCQbm1yZ2G2UHCFFMtJUZj7ryUf1Ggd9t5WzqJ5Lrtk67ijo/zLi1jQ9+9HJQCeSbAMl+9BBjo5eQ5qB9AHGe35QfosTaRdsiD8X0S0udRF5ToyOQNTUQ6HcdTtzRm8gUCxj5RFYQc94+LGqiApXcm08AR8LNZMczVgFcV00TcdQmJbNilzmA0yW2RXnj//3BGqQzN9TrnJxqdloXghRiWEtAmH2Ve2NNz0jNaFL9Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(36840700001)(40470700004)(82310400005)(40480700001)(7636003)(110136005)(83380400001)(8676002)(107886003)(82740400003)(36860700001)(2616005)(42186006)(336012)(6666004)(186003)(478600001)(356005)(47076005)(70206006)(2906002)(6266002)(8936002)(54906003)(5660300002)(44832011)(316002)(426003)(70586007)(36756003)(41300700001)(40460700003)(4326008)(26005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:06:13.4592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fef2375c-ccc5-4728-bcbe-08da55d9ef45
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB8876
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

When a combined message request comes from user space, the
controller has to initiate repeated start sequence. In standard
mode, this repeated start sequence is corrupted if there is still
data in the Tx FIFO.

So, always make sure that all the bytes are completely transmitted
out of the FIFO by waiting for TXEMPTY, if the previous message is
of Tx type.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 54 +++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index c8b68176427c..2d5214f1ba03 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -62,6 +62,7 @@ enum xiic_endian {
  * @singlemaster: Indicates bus is single master
  * @dynamic: Mode of controller
  * @repeated_start: Repeated start operation
+ * @prev_msg_tx: Previous message is Tx
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -80,6 +81,7 @@ struct xiic_i2c {
 	bool singlemaster;
 	bool dynamic;
 	bool repeated_start;
+	bool prev_msg_tx;
 };
 
 #define XIIC_MSB_OFFSET 0
@@ -282,6 +284,24 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
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
@@ -731,6 +751,20 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
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
@@ -784,6 +818,8 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	/* Enable interrupts */
 	xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
+
+	i2c->prev_msg_tx = false;
 }
 
 static void xiic_start_send(struct xiic_i2c *i2c)
@@ -820,6 +856,20 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 
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
+
 		/* Check if RSTA should be set */
 		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
 		if (cr & XIIC_CR_MSMS_MASK) {
@@ -853,6 +903,7 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 				XIIC_INTR_TX_ERROR_MASK |
 				XIIC_INTR_BNB_MASK);
 	}
+	i2c->prev_msg_tx = true;
 }
 
 static void __xiic_start_xfer(struct xiic_i2c *i2c)
@@ -916,6 +967,9 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	/* Decide standard mode or Dynamic mode */
 	i2c->dynamic = true;
 
+	/* Initialize prev message type */
+	i2c->prev_msg_tx = false;
+
 	/* Enter standard mode only when read length is > 255 bytes */
 	for (count = 0; count < i2c->nmsgs; count++) {
 		if ((i2c->tx_msg[count].flags & I2C_M_RD) &&
-- 
2.25.1

