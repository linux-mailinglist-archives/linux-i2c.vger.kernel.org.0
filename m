Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27BAB678F99
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjAXFFk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbjAXFFj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:05:39 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF82239CE1;
        Mon, 23 Jan 2023 21:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieqj25BbTxmZyLd4E4xAipKm3U4MDPTtDQaoW4MNAOuv+WTTfSSraUxdlwmbizgxUyM7hsefTfMSNRUXOtoOcZyK0UzJQMHK/D1Y0nH/H++zw9+t0JsELHJBphhqriunbF4NePhVGtT6L/axy6TKWDCGSqYR4jvbCcrDBACrRjeMqS78H9xKbs23unYPCkMXd6ix7agB6M+BY4J0GRiXyt0dnjGsIHxFMCNLfFrYVZMd/UG0E6OnSnassKsnm64cgYeYU2A2OlR4huHHCCWQJXKuwY2fIMMvFsmjkLzrjtw7O5doW+X99vqty5nuexRuEIhS+/Jb7pfzQjmcse2SQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgPu9PptTkSQgoFmVCTn+1fmcrugJCaP+yBakgmxo7I=;
 b=S9Z+VBGc+Xvl1/rc2Bg1/kSfKt/nhxVQkid9HBj5XlcViUSGyT7sObem40mOZuNlGBD6e/0zNkc+ZK0hXyOWmy2/ltT/THmUdOx+Ee2uYvbvH/pQWU4NPr5zPN9yDr23epxKT+xuO2DVBz6141wMGQPMh6yNtsC1Ff33MrQ5IkPSH/+jG163WnXN+RNMk7B48pmaSVwGu3MohPit6/sjAgZVPFM9Frr8xwpDtU0sAF9B4s2TfAix6l+ub4vxlLKAQCRlfjZl0OsM6+Jy6HyQhTLkcFUK+eeBOwOCIfTTvhPtW7kfAowLw1D56EbzUcvWK8rBG6R29KNY5EKX42rQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgPu9PptTkSQgoFmVCTn+1fmcrugJCaP+yBakgmxo7I=;
 b=EUnBVbahe9rs5FqfRRXUTuyNcxDJT8zJd1pm8vlG58kqjMaTJBUqS2Va/ith64OrQATbQ26ECPhs/rTzAs5/HQ6UR5i2TctOzI49S3kZ7H4KMaSpCpyMLPwMgIjiLG0sPKM5KeaLVgcLkgGGYZaI+Jg4t3upN/24hLzXIi1RBB0=
Received: from DS7PR03CA0315.namprd03.prod.outlook.com (2603:10b6:8:2b::10) by
 SA3PR02MB9345.namprd02.prod.outlook.com (2603:10b6:806:31a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:05:22 +0000
Received: from DM3NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::88) by DS7PR03CA0315.outlook.office365.com
 (2603:10b6:8:2b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 05:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT014.mail.protection.outlook.com (10.13.5.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:05:22 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 21:05:18 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:05:18 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57526 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBUe-0000Ys-Nh; Mon, 23 Jan 2023 21:05:13 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 674B61055AE; Tue, 24 Jan 2023 10:34:47 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V3 2/9] i2c: xiic: Fix Rx and Tx paths in standard mode
Date:   Tue, 24 Jan 2023 10:34:35 +0530
Message-ID: <1674536682-25278-3-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT014:EE_|SA3PR02MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: ddea5e47-6a87-4bff-ffe1-08dafdc8988a
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sGfGX5j4OV6+0RwITuxKQ4LZfa931RYLUcoMK0bqr/YoeKXcnSr1Tzwb/dN651kNQJtrLNzbjdIFldeDbRj2AZRG1lLGNxdynfTYiHt037t/HM/mpYVLfoFV73hqbGgRdCQihkY0AfvInwmjVv/WVGJnn5FLJV3B50/nbyaxIh3bjqKvQ2ihW+BxrBRch03scnzrh4MWpJLkFKoOfbVmNVgOWln/17mVTzDr+i1D54T6NrjOXLQz0+/8MEFbdTX+V2YGM+Khz6kCU4bwAYv+SFAA/HgSq60qPmO5HTbmj5Vm/O7/WfmoO8BftwwmTS4LnXn6scc+AHKy6a+9wyL+rAFra2CMraYK3d2AyGTlSYEqUDWOoyQMH0jOszBRkyFA5CUNzdgfaEk79soh1HwwnkpHe7mhlkd7WXCLFX86SUuROqERt3WD/JFZwclrY5VK5XbN0NpCudRS4CUdZ3kSy71ZNyQe2CWIeJ7rmivm7SQbQXG7PnS4Q7OBW/DB8vXhMdh1ZBt90DLuqUOGlvjYfs7m6HLw/GEMIys5sWAEN40/1PdvhgA+lCQZpX/ZDUwqGcNV93i6Jd0+VTu4Lkb0Hp1tmyldS9Cf6yN15SA/ptMJ+wxxZsao6FmpBFEaB/6wyzOpXl3Juaopifxi0h13MXXWhOycTRAqAAhyQ7qfpHxGqYNBdpDbf9JQr0L9iumxDLk2r9K4y8XNJfNKp6nzH0E16ejSMHp7bk9T9MYkyLRSc41SyK8fxDl3rKTqOdS9
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(7636003)(82740400003)(356005)(5660300002)(83170400001)(82310400005)(8936002)(2906002)(44832011)(4326008)(41300700001)(83380400001)(36860700001)(478600001)(110136005)(186003)(26005)(40480700001)(8676002)(40460700003)(6266002)(70206006)(316002)(70586007)(54906003)(42186006)(2616005)(47076005)(42882007)(6666004)(107886003)(336012)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:05:22.0098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddea5e47-6a87-4bff-ffe1-08dafdc8988a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB9345
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

