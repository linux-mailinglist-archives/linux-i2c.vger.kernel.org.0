Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5495E5DD4
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiIVIqW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiIVIp4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:45:56 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805C8D01CF;
        Thu, 22 Sep 2022 01:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlefxGqz/cBe7SNntuxXqjnwdTXVkwXd0YrmCNEhsO9+l/4kl9lp8//8eTxHz23+3Azt2qvMF23kP/OKQeEPhY+BbimtgK7PMDobYvA/RqKzqe1QKk7jiBIbw0EZ60fgQVAVGHQrtm04F4K7/UNmyro73Z6dtXuN1MYh+xT8jsZtvX9M9Tf8b7jxqOr+myh5jHK3x0SlRoW9uI4zUjZ3qAegfIzdvuGzoN29KHAbYeSA1HbjyejsvpGl4iEhA4lQ6KpKehx5S3gg3Pg3BIBjWKeMMxwfgI1CqHr33ecI7PPAjS3c7XiQVt8F2rvBtnZrj8B7dFXKMhpWZdZXu/Gx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZPuqdLeH6l6xiuJnevEqGvcSJhif0VPJcF9aXANIx4=;
 b=PdSHXBMvpeTqWIgQOWQy7exp4/oiBh6B7UnjX+xLcz3aLEz8IQ6qLe3VXdG5YU1UehtRW0ZgWhHRZVDLYCpbx0KAiDHhyCYl7Ypyg212cfexP4CjOIPFzIL7Kolb44UdijuEJIHmlLsImcrsYXBxWs60nExT53VgEL0dbZjMyDxxbh4FjAAf26xO0zWLuzejpJ4Aurdw+VLZqxAkLsDQkRfuN1ldetmlcvJcuACb9CjBaCFZMG5WfhOkLUb4z9VLQNpTBaBvMrxrwclRNKkwPX7d0slIQ2b1omX6K3sef98qJMVrcCZjZIRyc3aZ5cpSp53Oh3xJiQ9W6ytHdBv1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZPuqdLeH6l6xiuJnevEqGvcSJhif0VPJcF9aXANIx4=;
 b=qgm0n53KSfLmwZpw/N4rvDdajrX2Eig6D30nFlow/Pdj1bB54PQUqh3bu9QJAP5+Pij44Ank/p/q9T/lHqXluznyNBazqf9e6wyPYuMNjkVzWB2vC/MRa/sHdIRHkc2NjY6GMU2AgoFPiRdt42XWX6MEV03RNCglgvGfXjCNKRw=
Received: from BN9PR03CA0951.namprd03.prod.outlook.com (2603:10b6:408:108::26)
 by BL3PR02MB7906.namprd02.prod.outlook.com (2603:10b6:208:351::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 08:45:51 +0000
Received: from BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::38) by BN9PR03CA0951.outlook.office365.com
 (2603:10b6:408:108::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Thu, 22 Sep 2022 08:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT050.mail.protection.outlook.com (10.13.2.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:45:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:45:30 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:45:30 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54840 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHpp-0005X3-TM; Thu, 22 Sep 2022 01:45:30 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id EA82D610BE; Thu, 22 Sep 2022 14:15:05 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 2/9] i2c: xiic: Fix Rx and Tx paths in standard mode
Date:   Thu, 22 Sep 2022 14:14:47 +0530
Message-ID: <1663836294-5698-3-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT050:EE_|BL3PR02MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d69a598-3254-4a9b-461f-08da9c76dab5
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uMw2VZjg9V0YOfhdRnnPgwuGhorI5lSyStnW4o3xArVSr1RUHlBdw0N2f2OzVSqAFKtVtw7EPTdLrLO3oAhYgjD+0dHmMKaNWeRLqXU83KQzfmVs7udhXe4b/mVlPD2LTA9BJNIVPtEyjvHpeDtPvGfBQ9Ic/CQTadve15IEsodSKPDlPzvNCnI2Tp9JsD/eWzJ0NEDw9U11tmb3DXf53uHOdPcqmMY13tM+cUypfncJSHbLzmusTYHduCTCmu6K8Zm/AjsEG8CRUs4jWKHAkOJhlhoHKnkocDmm108MhxOBKIFl3r9DPCx5GTONLHFmvcCm4ry9HkujiCg5QULqY++TsrJcyhtQVREJKEqQjdP+u8lcw9PIFASc38Qp75oL+/qdLvux+6qAGmWPPxTZvVC6WijQ3u7blWtukrXnZYSozzg0fMvGI7B8nXCybQXPlCU3WanliNtRH+jEnyN8+x75II9jAdOS4ZAKzjLWg6KAw9nhZ+wPbopGi2gOpZXh3VyYrdIHKk9SMwGUo0nea5E/4k2C6hIlrVBgl9cXDp7SjYYs79B1IcMssfFjvGwQu6EjhwAJ08JSkPWolc2Mcldr6VLjkJEG+tDANtfL6Bn59GSA126ANfVZgCJzcf3C0YegV/xByiVT93PHl2IFJWqpnti/QRvOjQQ07etlYEhQL3ZQD8VrA9Oaqsgxdk8FN89kQ2ZPVVXw0tLCQIxnSj0Xv/83v8EoWlyKEihhSMqoYWbSS9OlWt7y79oxyELgiy0l+vLGrVfgoU/RUI260jy4O26pjMTENbNiDTISx4/Po1yXW7p9nzyUiOd7xqkd
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(6266002)(26005)(82740400003)(40460700003)(70586007)(316002)(42186006)(70206006)(2906002)(7636003)(40480700001)(356005)(110136005)(36860700001)(36756003)(2616005)(336012)(54906003)(82310400005)(6666004)(478600001)(83380400001)(107886003)(44832011)(186003)(8936002)(5660300002)(426003)(4326008)(41300700001)(8676002)(47076005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:45:51.4171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d69a598-3254-4a9b-461f-08da9c76dab5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7906
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-xiic.c | 53 +++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2aa43e067fee..79802fffa26c 100644
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

