Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32484116B41
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 11:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727568AbfLIKlK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 05:41:10 -0500
Received: from mail-eopbgr680089.outbound.protection.outlook.com ([40.107.68.89]:32005
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727462AbfLIKlJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 05:41:09 -0500
Received: from CY4PR02CA0045.namprd02.prod.outlook.com (2603:10b6:903:117::31)
 by BN6PR02MB3362.namprd02.prod.outlook.com (2603:10b6:405:64::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Mon, 9 Dec
 2019 10:41:06 +0000
Received: from CY1NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by CY4PR02CA0045.outlook.office365.com
 (2603:10b6:903:117::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Mon, 9 Dec 2019 10:41:06 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT034.mail.protection.outlook.com (10.152.75.190) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2495.26
 via Frontend Transport; Mon, 9 Dec 2019 10:41:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTR-0006JZ-3T; Mon, 09 Dec 2019 02:41:05 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTL-0006Iv-Vy; Mon, 09 Dec 2019 02:41:00 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xB9AexsP019959;
        Mon, 9 Dec 2019 02:40:59 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTK-0006I7-K5; Mon, 09 Dec 2019 02:40:59 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, Topi Kuutela <topi.kuutela@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/4] i2c: cadence: Fix power management order of operations
Date:   Mon,  9 Dec 2019 16:10:50 +0530
Message-Id: <1575888052-20447-2-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1575888052-20447-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1575888052-20447-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--3.086-7.0-31-1
X-imss-scan-details: No--3.086-7.0-31-1;No--3.086-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132203616666166109;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(26005)(54906003)(73392003)(426003)(5660300002)(336012)(82202003)(66574012)(55446002)(450100002)(76482006)(356004)(4326008)(2616005)(70206006)(70586007)(6666004)(8936002)(9686003)(9786002)(2906002)(2870700001)(305945005)(107886003)(316002)(86362001)(8676002)(36756003)(81156014)(81166006)(498600001)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR02MB3362;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f341bd4e-365c-4021-7220-08d77c944bda
X-MS-TrafficTypeDiagnostic: BN6PR02MB3362:
X-Microsoft-Antispam-PRVS: <BN6PR02MB336220B66B03D5ECEAA1C00A87580@BN6PR02MB3362.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-Forefront-PRVS: 02462830BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MN1a/BcY+AEI9EOP7LmbRdzBPuNs/C6vkOayR62njVxGa7c9tS8X3FJZbrIyri8SQbXqIJ1YtYO3B872GHDrleVfGQJe4rgTOiFJIzMCwPKuvwvum5CoTqHT6eg9bqVc00KGlIv+XhUMKJ9OO1LCUMY4WmOOr8baNxROaX7MmoiAmBaOT+lqZreuOknGSYm9Yoba4oiDCHnqRPV46DNDZuCKeMqa4pbNfckJxcdfLfIG6bgBTLIk57NBxKF1PyRAzaAiM11lMUf6OB0oNMuftLjYTn4p7zTFp9i2AIYo/3h85KL3YmkOSdD3YX2UNE0+FRHNUufd/bHCo1WtQhn2dFQFjNso3IPPxNRslvciCTLIZdW0RlmB/NytyiSiQXiUNI03ncnMkHU6bd6CvLJ1ttK3Snt5bTrKiTaBVTPp6FnXELv/bimxb16mow4Kvv/N58lLQXTSYj5ekOGI97yh2kXZCill6rDIwnA+Uoi8K0GBBtGQ7NaGOwtzHIRKERHV
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2019 10:41:06.4534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f341bd4e-365c-4021-7220-08d77c944bda
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3362
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Topi Kuutela <topi.kuutela@gmail.com>

E.g. pm_runtime_set_active must be called while the power
management system is disabled. Fixes extra hanging clk_enable.

Signed-off-by: Topi Kuutela <topi.kuutela@gmail.com>
Acked-by: Sören Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 7b989a2..08427e9 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -932,10 +932,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "Unable to enable clock.\n");
 
-	pm_runtime_enable(id->dev);
 	pm_runtime_set_autosuspend_delay(id->dev, CNDS_I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(id->dev);
 	pm_runtime_set_active(id->dev);
+	pm_runtime_enable(id->dev);
 
 	id->clk_rate_change_nb.notifier_call = cdns_i2c_clk_notifier_cb;
 	if (clk_notifier_register(id->clk, &id->clk_rate_change_nb))
@@ -984,8 +984,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 
 err_clk_dis:
 	clk_disable_unprepare(id->clk);
-	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
 	return ret;
 }
 
@@ -1001,10 +1001,13 @@ static int cdns_i2c_remove(struct platform_device *pdev)
 {
 	struct cdns_i2c *id = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	clk_disable_unprepare(id->clk);
-	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.1.1

