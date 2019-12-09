Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9E6116B45
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 11:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbfLIKlQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 05:41:16 -0500
Received: from mail-eopbgr760075.outbound.protection.outlook.com ([40.107.76.75]:15089
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727567AbfLIKlO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 05:41:14 -0500
Received: from BL0PR02CA0034.namprd02.prod.outlook.com (2603:10b6:207:3c::47)
 by BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Mon, 9 Dec
 2019 10:41:08 +0000
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::202) by BL0PR02CA0034.outlook.office365.com
 (2603:10b6:207:3c::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Mon, 9 Dec 2019 10:41:08 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2495.26
 via Frontend Transport; Mon, 9 Dec 2019 10:41:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTU-0006Jf-0n; Mon, 09 Dec 2019 02:41:08 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTO-0006L0-T1; Mon, 09 Dec 2019 02:41:02 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xB9Af1kd020003;
        Mon, 9 Dec 2019 02:41:02 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTN-0006I7-Dw; Mon, 09 Dec 2019 02:41:01 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: [PATCH 3/4] i2c: cadence: Implement save restore
Date:   Mon,  9 Dec 2019 16:10:51 +0530
Message-Id: <1575888052-20447-3-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1575888052-20447-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1575888052-20447-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--4.908-7.0-31-1
X-imss-scan-details: No--4.908-7.0-31-1;No--4.908-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132203616686649061;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(39860400002)(396003)(189003)(199004)(36756003)(82202003)(8936002)(55446002)(498600001)(81166006)(81156014)(8676002)(70206006)(5660300002)(4326008)(54906003)(9786002)(316002)(450100002)(86362001)(73392003)(26005)(426003)(2906002)(336012)(2616005)(6666004)(9686003)(107886003)(356004)(305945005)(76482006)(70586007);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR02MB4033;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1d61146-6a05-4372-444f-08d77c944d17
X-MS-TrafficTypeDiagnostic: BN7PR02MB4033:
X-Microsoft-Antispam-PRVS: <BN7PR02MB40332C203BD94AD3379D187587580@BN7PR02MB4033.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02462830BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xaWzhk9ZX9ihKQrGlfulXrFHZq9+T/ogQB8R6nOjZoDf6xRFJYSUqkQ+kpSJnffnGWDObHU8o5KR1NbBocZWbzolGnRNT7k6v1aXTiRsZwL33fmR67N6mwZjTEXugnHlxrL7p0TLfXMsPoladVVujEVLa1CitWjE2tCpuQsrc3We7CqsGL3vdkk1FSFDCPbHh4euAo2fMgxCUmBxnT4/kazVIZq4vfLfaVzG+PkAQyzXYUzTPd1mDeHTt2fnP5CALFIBX6Y3PszIurV1oZLyRTJtsJzkPSt+NR47VVfsIkmJMyZ698pRTFFex2e39bkSRgxfdrNwxmAuFhbbZ84YpLnly1Ri6OApOZCbb6BuHYL5FB262EUrncw81StvvG7537lJ1wtGN2Mp1K+nMX+mIwY7vqJwKFbKayKDxW+sl56UW03bWQ/Ss+ZgST3umdc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2019 10:41:08.4867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d61146-6a05-4372-444f-08d77c944d17
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4033
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Implement save restore for i2c module.
Since we have only a couple of registers
an unconditional restore is done.

Acked-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhraj@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 41 ++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 08427e9..8a2983e 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -138,6 +138,7 @@
  * @clk:		Pointer to struct clk
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
+ * @ctrl_reg:		Cached value of the control register.
  */
 struct cdns_i2c {
 	struct device		*dev;
@@ -158,6 +159,7 @@ struct cdns_i2c {
 	struct clk *clk;
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
+	u32 ctrl_reg;
 };
 
 struct cdns_platform_data {
@@ -748,12 +750,11 @@ static int cdns_i2c_setclk(unsigned long clk_in, struct cdns_i2c *id)
 	if (ret)
 		return ret;
 
-	ctrl_reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
+	ctrl_reg = id->ctrl_reg;
 	ctrl_reg &= ~(CDNS_I2C_CR_DIVA_MASK | CDNS_I2C_CR_DIVB_MASK);
 	ctrl_reg |= ((div_a << CDNS_I2C_CR_DIVA_SHIFT) |
 			(div_b << CDNS_I2C_CR_DIVB_SHIFT));
-	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
-
+	id->ctrl_reg = ctrl_reg;
 	return 0;
 }
 
@@ -837,6 +838,26 @@ static int __maybe_unused cdns_i2c_runtime_suspend(struct device *dev)
 }
 
 /**
+ * cdns_i2c_init -  Controller initialisation
+ * @id:		Device private data structure
+ *
+ * Initialise the i2c controller.
+ *
+ */
+static void cdns_i2c_init(struct cdns_i2c *id)
+{
+	cdns_i2c_writereg(id->ctrl_reg, CDNS_I2C_CR_OFFSET);
+	/*
+	 * Cadence I2C controller has a bug wherein it generates
+	 * invalid read transaction after HW timeout in master receiver mode.
+	 * HW timeout is not used by this driver and the interrupt is disabled.
+	 * But the feature itself cannot be disabled. Hence maximum value
+	 * is written to this register to reduce the chances of error.
+	 */
+	cdns_i2c_writereg(CDNS_I2C_TIMEOUT_MAX, CDNS_I2C_TIME_OUT_OFFSET);
+}
+
+/**
  * cdns_i2c_runtime_resume - Runtime resume
  * @dev:	Address of the platform_device structure
  *
@@ -854,6 +875,7 @@ static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
 		dev_err(dev, "Cannot enable clock.\n");
 		return ret;
 	}
+	cdns_i2c_init(xi2c);
 
 	return 0;
 }
@@ -947,8 +969,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	if (ret || (id->i2c_clk > CDNS_I2C_SPEED_MAX))
 		id->i2c_clk = CDNS_I2C_SPEED_DEFAULT;
 
-	cdns_i2c_writereg(CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS,
-			  CDNS_I2C_CR_OFFSET);
+	id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS;
 
 	ret = cdns_i2c_setclk(id->input_clk, id);
 	if (ret) {
@@ -963,15 +984,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
 		goto err_clk_dis;
 	}
-
-	/*
-	 * Cadence I2C controller has a bug wherein it generates
-	 * invalid read transaction after HW timeout in master receiver mode.
-	 * HW timeout is not used by this driver and the interrupt is disabled.
-	 * But the feature itself cannot be disabled. Hence maximum value
-	 * is written to this register to reduce the chances of error.
-	 */
-	cdns_i2c_writereg(CDNS_I2C_TIMEOUT_MAX, CDNS_I2C_TIME_OUT_OFFSET);
+	cdns_i2c_init(id);
 
 	ret = i2c_add_adapter(&id->adap);
 	if (ret < 0)
-- 
2.1.1

