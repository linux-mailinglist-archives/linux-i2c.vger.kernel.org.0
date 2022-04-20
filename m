Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13961508310
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Apr 2022 10:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353883AbiDTIDv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Apr 2022 04:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376604AbiDTICZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Apr 2022 04:02:25 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC026625E
        for <linux-i2c@vger.kernel.org>; Wed, 20 Apr 2022 00:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBMEtB4YMkWD7OT/A4Dli1v0Du9tDeD1LEQJo7S/KY0ny/2+6KEpzb+eY6UfNrtQOBHhAOG09+OgMGwQQnlqUGfD1mF8t17n1oT46oZGexOLM+h6tp5qvJKbZzYa3IDUY8Bp9DjDOXpEYx2kyOPvH2FG4+HeKNB791PKz/kwVvErh1cFznNpN/GQP3XIwI8opQiz5H6a7jWoKY3aGURD8U+rV22mwjIXHLSQmvhUhRGlsaGdgatkEmjzhYXGljsErK2XAau2MI80hSg89MuBf2mDM/YZF10AwGgt99VcktzQ/U1zphISksix+Y1KK7PaQUImu0IeL0P/sAPNOLuEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dyb7L8MhEPweMwRzWN8aW0I2fAtlnwu2jhtsq5Vgz0=;
 b=fagBc9BprRV+xNW72MkVFX2ONvcjr/XeWIafRTfbgV9uKzmgo8mFqVvXzQ13zYFqMG+7uq/8dE1X65gzFByUXp30DiBSoAVlkyLMXyV13ZjzgGniE1i+Zk411TupOKuu+HxnoE5PkTH/q1086fvBS5qFHou0qWSn7uEERkn49E4pVWv2rEI8K2OmHSUFKh3Mm3rJgqEPpHFl8KoqJ24rKxu0aH5IvlcGX7lATnd5U1Iqd8nPe8q1xcdwRYqvysjueFPrzj87gTteJ0axKIRAF3arJcQhJQrkQXR58XWCx0g7yukgF5lLIGmvOcRhvIbQpeNYWEjbp9OdFM35fTlHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dyb7L8MhEPweMwRzWN8aW0I2fAtlnwu2jhtsq5Vgz0=;
 b=ZZeuZdcNA7EyyfvfZytcQC5bro2a+c1n3dSXkvE1I/BiOwcPwTE13hlRIazKsqFHdlqwUbyVC9RerhSy+kS6ZRBRQ9BpsVP8FCZuDaO8U5xI9UsQxRYUN4yY+Zg7jaU15Y8qNrJzGPqORW5F7qgYC2g94+9sPqfIGvulxE5Scv0=
Received: from SN7PR04CA0160.namprd04.prod.outlook.com (2603:10b6:806:125::15)
 by DM6PR02MB4683.namprd02.prod.outlook.com (2603:10b6:5:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 07:59:37 +0000
Received: from SN1NAM02FT0006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::cb) by SN7PR04CA0160.outlook.office365.com
 (2603:10b6:806:125::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 20 Apr 2022 07:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0006.mail.protection.outlook.com (10.97.5.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 07:59:37 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 20 Apr 2022 00:59:32 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 20 Apr 2022 00:59:32 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=54328 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nh5FL-0006KN-So; Wed, 20 Apr 2022 00:59:32 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/4] i2c: xiic: Fix coding style issues
Date:   Wed, 20 Apr 2022 13:29:22 +0530
Message-ID: <20220420075924.14546-3-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 295d9fce-5869-40c4-19c9-08da22a3b743
X-MS-TrafficTypeDiagnostic: DM6PR02MB4683:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4683607BB667EB03BFC3CD62AAF59@DM6PR02MB4683.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTJlP2KCjQQO4i+P/QKDCFPJYzK8GtrUxaAfwqqhRexMks3I77qyq7U5x6oBtTwArvb6hmHpFdCz3K4nckVwg7b1EqGWl2hflwZVletJtgGUQeO7qR9uVkXpfCQiSkQ24V8ezXV1PO4MnRrj5Owq0WNoXutCPSRtOGQ+7WeMzmxl2Ws2r0cpW378hXQk2plpnY/yKBs5I/SXVr/MpvB34NEgJIAY6n2rU6q8RI+Tdgbbxo3cdIC1v6Pv1gY2/AOXAeKy/c8DNwuFlzh4kHi8RuaEp6MYu6jwwlOi4cNLs516txuxGyu04K075Nbr4BCHjdqUj6sC+t3J1elCxaqf5zEGCKYXbM4Qs3QILUVQbIfnB85TQmPSGZSAngyddiEy9JE7vlecilHjFxfpYwcaH+E06AZwKZdX+D28V6miMIhVLWtZXXNbkZcsqNKxQ/sB99egWVMCpB/VImoouQrlwB7yn3AiUMgEq8Q0QnBh+WCeq74PaVJDh7rya9a0PWm7zisXy6d8WeylajuVFHtwIkSMvCVs6urd4eOUIA969vF/KfmGMnlr250ek4Guo8sagccOlHivQSVMnxek+HP72EKqfKEUNVSzT0th//3Tm3iAC/OnLCvBoGIDiLS/eKMVf2V/GwId8dqR+6uoWdtoxYNovbY4zbQ2L/Z9jkL6uozGm022jvwmBfTcEc6M+Y1tbggYP2j9preD+Jk83sjYCA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(1076003)(82310400005)(8676002)(186003)(4326008)(83380400001)(508600001)(5660300002)(2906002)(70206006)(336012)(36756003)(70586007)(26005)(6666004)(47076005)(107886003)(9786002)(356005)(36860700001)(7636003)(40460700003)(44832011)(54906003)(8936002)(7696005)(316002)(426003)(6916009)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 07:59:37.5206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 295d9fce-5869-40c4-19c9-08da22a3b743
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4683
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Michal Simek <michal.simek@xilinx.com>

Most of these stuff are reported by checkpatch.
But fixes are:
- Incorrect indetation
- Missing blank line after variable declaration
- Additional ()
- Missing spaces around +
- Missing parenthesis when if has them
- Newlines
- Remove MODULE_ALIAS - none is really using it

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 37 +++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8b39f9c7e773..16a7e3164e68 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -78,24 +78,23 @@ struct xiic_i2c {
 	bool singlemaster;
 };
 
-
 #define XIIC_MSB_OFFSET 0
-#define XIIC_REG_OFFSET (0x100+XIIC_MSB_OFFSET)
+#define XIIC_REG_OFFSET (0x100 + XIIC_MSB_OFFSET)
 
 /*
  * Register offsets in bytes from RegisterBase. Three is added to the
  * base offset to access LSB (IBM style) of the word
  */
-#define XIIC_CR_REG_OFFSET   (0x00+XIIC_REG_OFFSET)	/* Control Register   */
-#define XIIC_SR_REG_OFFSET   (0x04+XIIC_REG_OFFSET)	/* Status Register    */
-#define XIIC_DTR_REG_OFFSET  (0x08+XIIC_REG_OFFSET)	/* Data Tx Register   */
-#define XIIC_DRR_REG_OFFSET  (0x0C+XIIC_REG_OFFSET)	/* Data Rx Register   */
-#define XIIC_ADR_REG_OFFSET  (0x10+XIIC_REG_OFFSET)	/* Address Register   */
-#define XIIC_TFO_REG_OFFSET  (0x14+XIIC_REG_OFFSET)	/* Tx FIFO Occupancy  */
-#define XIIC_RFO_REG_OFFSET  (0x18+XIIC_REG_OFFSET)	/* Rx FIFO Occupancy  */
-#define XIIC_TBA_REG_OFFSET  (0x1C+XIIC_REG_OFFSET)	/* 10 Bit Address reg */
-#define XIIC_RFD_REG_OFFSET  (0x20+XIIC_REG_OFFSET)	/* Rx FIFO Depth reg  */
-#define XIIC_GPO_REG_OFFSET  (0x24+XIIC_REG_OFFSET)	/* Output Register    */
+#define XIIC_CR_REG_OFFSET   (0x00 + XIIC_REG_OFFSET)	/* Control Register   */
+#define XIIC_SR_REG_OFFSET   (0x04 + XIIC_REG_OFFSET)	/* Status Register    */
+#define XIIC_DTR_REG_OFFSET  (0x08 + XIIC_REG_OFFSET)	/* Data Tx Register   */
+#define XIIC_DRR_REG_OFFSET  (0x0C + XIIC_REG_OFFSET)	/* Data Rx Register   */
+#define XIIC_ADR_REG_OFFSET  (0x10 + XIIC_REG_OFFSET)	/* Address Register   */
+#define XIIC_TFO_REG_OFFSET  (0x14 + XIIC_REG_OFFSET)	/* Tx FIFO Occupancy  */
+#define XIIC_RFO_REG_OFFSET  (0x18 + XIIC_REG_OFFSET)	/* Rx FIFO Occupancy  */
+#define XIIC_TBA_REG_OFFSET  (0x1C + XIIC_REG_OFFSET)	/* 10 Bit Address reg */
+#define XIIC_RFD_REG_OFFSET  (0x20 + XIIC_REG_OFFSET)	/* Rx FIFO Depth reg  */
+#define XIIC_GPO_REG_OFFSET  (0x24 + XIIC_REG_OFFSET)	/* Output Register    */
 
 /* Control Register masks */
 #define XIIC_CR_ENABLE_DEVICE_MASK        0x01	/* Device enable = 1      */
@@ -233,18 +232,21 @@ static inline int xiic_getreg32(struct xiic_i2c *i2c, int reg)
 static inline void xiic_irq_dis(struct xiic_i2c *i2c, u32 mask)
 {
 	u32 ier = xiic_getreg32(i2c, XIIC_IIER_OFFSET);
+
 	xiic_setreg32(i2c, XIIC_IIER_OFFSET, ier & ~mask);
 }
 
 static inline void xiic_irq_en(struct xiic_i2c *i2c, u32 mask)
 {
 	u32 ier = xiic_getreg32(i2c, XIIC_IIER_OFFSET);
+
 	xiic_setreg32(i2c, XIIC_IIER_OFFSET, ier | mask);
 }
 
 static inline void xiic_irq_clr(struct xiic_i2c *i2c, u32 mask)
 {
 	u32 isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
+
 	xiic_setreg32(i2c, XIIC_IISR_OFFSET, isr & mask);
 }
 
@@ -355,7 +357,8 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 
 	while (len--) {
 		u16 data = i2c->tx_msg->buf[i2c->tx_pos++];
-		if ((xiic_tx_space(i2c) == 0) && (i2c->nmsgs == 1)) {
+
+		if (!xiic_tx_space(i2c) && i2c->nmsgs == 1) {
 			/* last message in transfer -> STOP */
 			data |= XIIC_TX_DYN_STOP_MASK;
 			dev_dbg(i2c->adap.dev.parent, "%s TX STOP\n", __func__);
@@ -402,8 +405,8 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 	/* Service requesting interrupt */
 	if ((pend & XIIC_INTR_ARB_LOST_MASK) ||
-		((pend & XIIC_INTR_TX_ERROR_MASK) &&
-		!(pend & XIIC_INTR_RX_FULL_MASK))) {
+	    ((pend & XIIC_INTR_TX_ERROR_MASK) &&
+	    !(pend & XIIC_INTR_RX_FULL_MASK))) {
 		/* bus arbritration lost, or...
 		 * Transmit error _OR_ RX completed
 		 * if this happens when RX_FULL is not set
@@ -641,6 +644,7 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 static void __xiic_start_xfer(struct xiic_i2c *i2c)
 {
 	int fifo_space = xiic_tx_fifo_space(i2c);
+
 	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, fifos space: %d\n",
 		__func__, i2c->tx_msg, fifo_space);
 
@@ -742,7 +746,6 @@ static const struct i2c_adapter xiic_adapter = {
 	.quirks = &xiic_quirks,
 };
 
-
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c;
@@ -902,6 +905,7 @@ static const struct dev_pm_ops xiic_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(xiic_i2c_runtime_suspend,
 			   xiic_i2c_runtime_resume, NULL)
 };
+
 static struct platform_driver xiic_i2c_driver = {
 	.probe   = xiic_i2c_probe,
 	.remove  = xiic_i2c_remove,
@@ -917,4 +921,3 @@ module_platform_driver(xiic_i2c_driver);
 MODULE_AUTHOR("info@mocean-labs.com");
 MODULE_DESCRIPTION("Xilinx I2C bus driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:"DRIVER_NAME);
-- 
2.17.1

