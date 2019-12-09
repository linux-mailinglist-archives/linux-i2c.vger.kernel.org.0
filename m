Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983EB116B3F
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 11:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfLIKlF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 05:41:05 -0500
Received: from mail-eopbgr760050.outbound.protection.outlook.com ([40.107.76.50]:65390
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727462AbfLIKlF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 05:41:05 -0500
Received: from BYAPR02CA0027.namprd02.prod.outlook.com (2603:10b6:a02:ee::40)
 by BY5PR02MB6836.namprd02.prod.outlook.com (2603:10b6:a03:204::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.16; Mon, 9 Dec
 2019 10:41:03 +0000
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::203) by BYAPR02CA0027.outlook.office365.com
 (2603:10b6:a02:ee::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22 via Frontend
 Transport; Mon, 9 Dec 2019 10:41:03 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2495.26
 via Frontend Transport; Mon, 9 Dec 2019 10:41:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTO-0006JT-BF; Mon, 09 Dec 2019 02:41:02 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTJ-0006IG-7I; Mon, 09 Dec 2019 02:40:57 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xB9AeuMh019939;
        Mon, 9 Dec 2019 02:40:56 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ieGTH-0006I7-RK; Mon, 09 Dec 2019 02:40:56 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/4] i2c: cadence: Fix error printing in case of defer
Date:   Mon,  9 Dec 2019 16:10:49 +0530
Message-Id: <1575888052-20447-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--1.542-7.0-31-1
X-imss-scan-details: No--1.542-7.0-31-1;No--1.542-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132203616631135458;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(189003)(199004)(81166006)(9786002)(81156014)(4326008)(8936002)(8676002)(26005)(356004)(73392003)(82202003)(6666004)(9686003)(86362001)(107886003)(70586007)(70206006)(76482006)(36756003)(316002)(336012)(2616005)(498600001)(2906002)(450100002)(305945005)(4744005)(426003)(55446002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR02MB6836;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c328aa52-5e2e-40e3-b6b2-08d77c9449c0
X-MS-TrafficTypeDiagnostic: BY5PR02MB6836:
X-Microsoft-Antispam-PRVS: <BY5PR02MB68369B7D01CAFCCD9EDF812887580@BY5PR02MB6836.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-Forefront-PRVS: 02462830BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eX1XNr8ViW71M/SV9Ow8cr90wcRehyCByJG7jzoQ80ay3ZPFUca/m4JsaR4G+sXDAeav1ISLvXhDGNbniKoojQ3u91zNqPWuclIevZAWu5/rIyAjB+LorcuNm/Cf4++9iV76pU0pgrdn6rl6B3MexHlKu4ehulbokRoDiv/d6vZaBgib4abXTg5J51z/PRkBNGISQgbp3Z7F8lb8uK/uJV2GxUGLK6Rq4y6O1uqeyKHCGsRmdEKFteAam4Va2fLyzgaJ+fXltwW+jDnUcFhnspr0nloV9ua7Gg+V/9yuHAJRktYC+zcYRdbaUvFsoh345YLqX/2uJyAx0O2bomaJAUed1ZaYj1zLakK4FJd9/24JYosWSNMNYC+bB3hc5+iIFAV7l0cDFn/1bSfO+sukzxebjb+DCF3LQ+GJ2v70BuyJwlcvTY7ii3MY7qwWF3S6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2019 10:41:02.8853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c328aa52-5e2e-40e3-b6b2-08d77c9449c0
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6836
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Do not print error in case of EPROBE_DEFER.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 1ffd21a..7b989a2 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -924,7 +924,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 
 	id->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(id->clk)) {
-		dev_err(&pdev->dev, "input clock not found.\n");
+		if (PTR_ERR(id->clk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "input clock not found.\n");
 		return PTR_ERR(id->clk);
 	}
 	ret = clk_prepare_enable(id->clk);
-- 
2.1.1

