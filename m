Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A3F135826
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 12:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgAILiw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 06:38:52 -0500
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com ([40.107.243.56]:6053
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725997AbgAILiv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 06:38:51 -0500
Received: from BL0PR02CA0087.namprd02.prod.outlook.com (2603:10b6:208:51::28)
 by DM6PR02MB5180.namprd02.prod.outlook.com (2603:10b6:5:4e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Thu, 9 Jan
 2020 11:38:10 +0000
Received: from SN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by BL0PR02CA0087.outlook.office365.com
 (2603:10b6:208:51::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10 via Frontend
 Transport; Thu, 9 Jan 2020 11:38:10 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT007.mail.protection.outlook.com (10.152.72.88) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 11:38:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8f-00022l-9p
        for linux-i2c@vger.kernel.org; Thu, 09 Jan 2020 03:38:09 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8a-00040f-55; Thu, 09 Jan 2020 03:38:04 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8Z-0003x8-Bd; Thu, 09 Jan 2020 03:38:03 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2 1/3] i2c: xiic: Add timeout to the rx fifo wait loop
Date:   Thu,  9 Jan 2020 17:07:58 +0530
Message-Id: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--3.670-7.0-31-1
X-imss-scan-details: No--3.670-7.0-31-1;No--3.670-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230434898472101;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(4326008)(86362001)(26005)(5660300002)(9786002)(6666004)(498600001)(73392003)(8676002)(426003)(70586007)(7696005)(70206006)(36756003)(336012)(316002)(81166006)(81156014)(356004)(8936002)(76482006)(2906002)(82202003)(6916009)(107886003)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB5180;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f857fca5-26b1-4ce2-1831-08d794f8670e
X-MS-TrafficTypeDiagnostic: DM6PR02MB5180:
X-Microsoft-Antispam-PRVS: <DM6PR02MB51803CA8733F33073513CCA087390@DM6PR02MB5180.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:370;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cp1giGWiW37DU+nrHVG/G2ynMVv86BH9oqlcph/B4iNadiMIRmApUkQxCeNUtjBSqfPhHEOXDbvd2EXL7cNdV7Uh4aEVh5KYHtgqWfsRwsvYTOT6pbwJL3c5R4rzxAtkF9oeraJfnNS4lYN/qXzmJSqS5acZDyYmqdiKEmvAD+67k8uCN3vrjjx5A+NW3ziCuEUjoaSurhAKP8nrAWq+cW+HoinTxsUTta3Sx3jD8/tgRbGmszPmw4IuOsQ3ORkEGbqm18pHkPrFr9UZOESbdMnklKyYKKdsX+2u1ZOTo0IkYbyZJbAvQv0Kk887UFiqgsgE0eLJk+M1bsRbD8vkg2iudW/q1fMaOCCzYBx0Dz8j1fHXa6frrRQJgevWcqbp/KP/QqBoYGwG36hONzZfdOt+6TIfArbSy0h814zcODP7omfpg13kzsckk5I9zfOE
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 11:38:09.6520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f857fca5-26b1-4ce2-1831-08d794f8670e
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add timeout to the rx fifo empty wait loop. Also check for the return
value for xiic_reinit and pass it to xiic_start_xfer.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
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

