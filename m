Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06419135301
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 07:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgAIGD5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 01:03:57 -0500
Received: from mail-dm6nam10on2045.outbound.protection.outlook.com ([40.107.93.45]:27840
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727854AbgAIGD5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 01:03:57 -0500
Received: from BN7PR02CA0022.namprd02.prod.outlook.com (2603:10b6:408:20::35)
 by BN8PR02MB5858.namprd02.prod.outlook.com (2603:10b6:408:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Thu, 9 Jan
 2020 06:03:56 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by BN7PR02CA0022.outlook.office365.com
 (2603:10b6:408:20::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Thu, 9 Jan 2020 06:03:56 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 06:03:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQvD-0007LU-Ca
        for linux-i2c@vger.kernel.org; Wed, 08 Jan 2020 22:03:55 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv8-00064X-92; Wed, 08 Jan 2020 22:03:50 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv7-00063H-GT; Wed, 08 Jan 2020 22:03:49 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 4/4] i2c: xiic: Fix the clocking across bind unbind
Date:   Thu,  9 Jan 2020 11:33:39 +0530
Message-Id: <1578549819-14110-4-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--4.759-7.0-31-1
X-imss-scan-details: No--4.759-7.0-31-1;No--4.759-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230234359640700;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(107886003)(6666004)(316002)(356004)(9786002)(86362001)(5660300002)(76482006)(82202003)(36756003)(55446002)(70586007)(4326008)(73392003)(8936002)(6916009)(70206006)(2906002)(8676002)(9686003)(26005)(498600001)(336012)(2616005)(81166006)(426003)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR02MB5858;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cc09d11-c7f8-4e5e-6446-08d794c9b609
X-MS-TrafficTypeDiagnostic: BN8PR02MB5858:
X-Microsoft-Antispam-PRVS: <BN8PR02MB58586DF14DD1401C5EB167BE87390@BN8PR02MB5858.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhuXPdrTj5UOTRPzPAR6LXW7a+6UNnq+7XvbvSatS746XDyT/pxzbO8mxIAykVrCPvM5aU8aBJXCTQ3MP80lDugHE/TfKy6KaHqtnO08+EUh8eE+KNwdG8O1lbwXX7KxxzqS87qMT2U/8sLcK/ZL1aq0AEzJhhRzEmPhv4mBisbnsUugkz9ESVB/s/cpGAMGdUDRykKXxSOhf5GHo2kSQI4tOSs2ydrsjSFq+TU0jaTEcVR6zT/DxVTSvQGPkVw+dy4E1ssWhCeI8kPTVEnXwH9eqo38dpw4zzjRUZot5r31ibsfbhe0A1LA6pQSaIbdLgEQG3MyNk/zmy6MRJsmuxG5fcXdEbVHJIyuKIanlT2vleHto6p6pGSltCuOjfgjnkXKUCcRaU8FhnWAEfnVJMgWqGcMlkVjldUkc6mKxDlYQ0OvhXl6Te2cAiT3kMJO
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 06:03:55.8349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc09d11-c7f8-4e5e-6446-08d794c9b609
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5858
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

The recommendation is that the the set_active should be done
withruntine disabled.
Also fix the remove path for clocking.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 7d2a8c1..30e42bb 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -798,10 +798,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 	i2c->dev = &pdev->dev;
-	pm_runtime_enable(i2c->dev);
 	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(i2c->dev);
 	pm_runtime_set_active(i2c->dev);
+	pm_runtime_enable(i2c->dev);
 	ret = devm_request_threaded_irq(&pdev->dev, irq, xiic_isr,
 					xiic_process, IRQF_ONESHOT,
 					pdev->name, i2c);
@@ -859,14 +859,16 @@ static int xiic_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
+	ret = pm_runtime_get_sync(i2c->dev);
+	if (ret < 0)
 		return ret;
-	}
+
 	xiic_deinit(i2c);
+	pm_runtime_put_sync(i2c->dev);
 	clk_disable_unprepare(i2c->clk);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return 0;
 }
-- 
2.1.1

