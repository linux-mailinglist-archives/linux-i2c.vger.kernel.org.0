Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384AB1352FF
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 07:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgAIGDy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 01:03:54 -0500
Received: from mail-bn7nam10on2082.outbound.protection.outlook.com ([40.107.92.82]:28769
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727749AbgAIGDy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 01:03:54 -0500
Received: from DM6PR02CA0117.namprd02.prod.outlook.com (2603:10b6:5:1b4::19)
 by CY4PR02MB2357.namprd02.prod.outlook.com (2603:10b6:903:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Thu, 9 Jan
 2020 06:03:51 +0000
Received: from CY1NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::206) by DM6PR02CA0117.outlook.office365.com
 (2603:10b6:5:1b4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10 via Frontend
 Transport; Thu, 9 Jan 2020 06:03:51 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT024.mail.protection.outlook.com (10.152.74.210) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 06:03:51 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv8-0007LN-Tq
        for linux-i2c@vger.kernel.org; Wed, 08 Jan 2020 22:03:50 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv3-00063v-Pz; Wed, 08 Jan 2020 22:03:45 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv3-00063H-0n; Wed, 08 Jan 2020 22:03:45 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/4] i2c: xiic: Add timeout to the rx fifo wait loop
Date:   Thu,  9 Jan 2020 11:33:37 +0530
Message-Id: <1578549819-14110-2-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--3.670-7.0-31-1
X-imss-scan-details: No--3.670-7.0-31-1;No--3.670-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230234316688723;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(5660300002)(9786002)(356004)(6666004)(70206006)(82202003)(498600001)(107886003)(36756003)(4326008)(26005)(8676002)(336012)(426003)(2906002)(73392003)(76482006)(6916009)(55446002)(81156014)(70586007)(81166006)(316002)(8936002)(2616005)(86362001)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR02MB2357;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 573a7d4e-8ad2-4d1a-433e-08d794c9b375
X-MS-TrafficTypeDiagnostic: CY4PR02MB2357:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2357C1D559B9C386432B071687390@CY4PR02MB2357.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:370;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M0aj9wg+03fqYxaqIU+/1WQJZCME6JCKVKI/1SYU4zvffR7J9r8Xon+y+4KSbw8/PkYHNvwrhF7tiHwPjQqr8AbUsB/zTUpmDX3TAif3S3RGxQZTXK08A92T8OMEG4fsymNRryllYSD1xIrO9fXY6V+KFPxVGyeFbUhXtmsNg5Kqx3QnNC46N8UHlj3Ssy3u5mcHvQ9JdZ6VZcmhwxmig0L+aOlbI4/hjenuEgPEqWsVmfwzOr4FgP7IAFcnwUgMZgu0RrDCgu8K5KBXdlSnpbOMAEZPE0AhPkx+yQKC+gIcdIONcRfl03zOdaxf5LBCJn6j3KvojUwPf0ho/01wZ3dmNvwYhbTkpbHR4FSowkeUbdpLxJ7vdX6Ix3jS09/eYUWHP6PKAZBCIFXSaT7cGBmwwiVbk+mWHtS24ecnzmeU5Yl+EB8x1Tsk1McwM5Xo
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 06:03:51.4627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 573a7d4e-8ad2-4d1a-433e-08d794c9b375
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2357
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add timeout to the rx fifo empty wait loop. Also check for the return
value for xiic_reinit and pass it to xiic_start_xfer.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 52 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index f42930c..700b401 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -156,6 +156,8 @@ struct xiic_i2c {
 #define XIIC_RESET_MASK             0xAUL
 
 #define XIIC_PM_TIMEOUT		1000	/* ms */
+/* timeout waiting for the controller to respond */
+#define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /*
  * The following constant is used for the device global interrupt enable
  * register, to enable all interrupts for the device, this is the only bit
@@ -166,7 +168,7 @@ struct xiic_i2c {
 #define xiic_tx_space(i2c) ((i2c)->tx_msg->len - (i2c)->tx_pos)
 #define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)
 
-static void xiic_start_xfer(struct xiic_i2c *i2c);
+static int xiic_start_xfer(struct xiic_i2c *i2c);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
 
 /*
@@ -247,17 +249,29 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
 	xiic_irq_en(i2c, mask);
 }
 
-static void xiic_clear_rx_fifo(struct xiic_i2c *i2c)
+static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 {
 	u8 sr;
+	unsigned long timeout;
+
+	timeout = jiffies + XIIC_I2C_TIMEOUT;
 	for (sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
 		!(sr & XIIC_SR_RX_FIFO_EMPTY_MASK);
-		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET))
+		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET)) {
 		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+		if (time_after(jiffies, timeout)) {
+			dev_err(i2c->dev, "Failed to clear rx fifo\n");
+				return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
 }
 
-static void xiic_reinit(struct xiic_i2c *i2c)
+static int xiic_reinit(struct xiic_i2c *i2c)
 {
+	int ret;
+
 	xiic_setreg32(i2c, XIIC_RESETR_OFFSET, XIIC_RESET_MASK);
 
 	/* Set receive Fifo depth to maximum (zero based). */
@@ -270,12 +284,16 @@ static void xiic_reinit(struct xiic_i2c *i2c)
 	xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, XIIC_CR_ENABLE_DEVICE_MASK);
 
 	/* make sure RX fifo is empty */
-	xiic_clear_rx_fifo(i2c);
+	ret = xiic_clear_rx_fifo(i2c);
+	if (ret)
+		return ret;
 
 	/* Enable interrupts */
 	xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
 
 	xiic_irq_clr_en(i2c, XIIC_INTR_ARB_LOST_MASK);
+
+	return 0;
 }
 
 static void xiic_deinit(struct xiic_i2c *i2c)
@@ -655,12 +673,18 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 
 }
 
-static void xiic_start_xfer(struct xiic_i2c *i2c)
+static int xiic_start_xfer(struct xiic_i2c *i2c)
 {
+	int ret;
 	mutex_lock(&i2c->lock);
-	xiic_reinit(i2c);
-	__xiic_start_xfer(i2c);
+
+	ret = xiic_reinit(i2c);
+	if (!ret)
+		__xiic_start_xfer(i2c);
+
 	mutex_unlock(&i2c->lock);
+
+	return ret;
 }
 
 static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
@@ -682,7 +706,11 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	i2c->tx_msg = msgs;
 	i2c->nmsgs = num;
 
-	xiic_start_xfer(i2c);
+	err = xiic_start_xfer(i2c);
+	if (err < 0) {
+		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
+		goto out;
+	}
 
 	if (wait_event_timeout(i2c->wait, (i2c->state == STATE_ERROR) ||
 		(i2c->state == STATE_DONE), HZ)) {
@@ -794,7 +822,11 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (!(sr & XIIC_SR_TX_FIFO_EMPTY_MASK))
 		i2c->endianness = BIG;
 
-	xiic_reinit(i2c);
+	ret = xiic_reinit(i2c);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Cannot xiic_reinit\n");
+		goto err_clk_dis;
+	}
 
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_adapter(&i2c->adap);
-- 
2.1.1

