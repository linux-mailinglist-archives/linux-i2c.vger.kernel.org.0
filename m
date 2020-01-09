Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A46CE135300
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 07:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbgAIGD5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 01:03:57 -0500
Received: from mail-mw2nam12on2085.outbound.protection.outlook.com ([40.107.244.85]:6165
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727749AbgAIGD4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 01:03:56 -0500
Received: from BL0PR02CA0099.namprd02.prod.outlook.com (2603:10b6:208:51::40)
 by BYAPR02MB4503.namprd02.prod.outlook.com (2603:10b6:a03:56::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10; Thu, 9 Jan
 2020 06:03:54 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::202) by BL0PR02CA0099.outlook.office365.com
 (2603:10b6:208:51::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Thu, 9 Jan 2020 06:03:54 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 06:03:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQvB-0007LO-AI
        for linux-i2c@vger.kernel.org; Wed, 08 Jan 2020 22:03:53 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv6-00064F-6Z; Wed, 08 Jan 2020 22:03:48 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv5-00063H-Cd; Wed, 08 Jan 2020 22:03:47 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 3/4] i2c: xiic: defer the probe if clock is not found
Date:   Thu,  9 Jan 2020 11:33:38 +0530
Message-Id: <1578549819-14110-3-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--3.128-7.0-31-1
X-imss-scan-details: No--3.128-7.0-31-1;No--3.128-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230234338482088;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(136003)(376002)(396003)(39860400002)(189003)(199004)(498600001)(6916009)(5660300002)(26005)(86362001)(336012)(55446002)(76482006)(426003)(107886003)(2906002)(356004)(6666004)(8676002)(8936002)(82202003)(81156014)(2616005)(81166006)(36756003)(4326008)(73392003)(70586007)(70206006)(316002)(9686003)(54906003)(9786002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4503;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef673565-5957-4b69-5c14-08d794c9b4bf
X-MS-TrafficTypeDiagnostic: BYAPR02MB4503:
X-Microsoft-Antispam-PRVS: <BYAPR02MB45033FBFD58A3D1F53F436C087390@BYAPR02MB4503.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gqMO7aYSeNWZqTJsErP0r3+pVD5M/9CEqy95546GZ5ojg+CPuKm9Dev3jANfTT+V+tFfGhQ/I35SQzLCpjkc+gyzHadGCYO44sAqkNf+2yMP2YWo+XCIrf1WWjVX1X0SxpLZhcyoBHntN1lE03ie851VJ+GX/bx+V94eCNQyMRsQB5BUlpwm8B3DdjNqdIir13cXlcyotRz19qjNDLgsIzGJ1bWVaCPHJGJug+rWXIBfUV6uGxmPhizndgVImH+hzct8m0qkpKbCvGOF2P/TW0DAKjTFOqnedY01CeEkX7jdggJdxBFYD8vEiaWat4teXxKB2qKPs91Fxgjj7uX7Oz1/yPURGqTFcof1qPpN0S6oem3BPvefnmki0deC8/XmGD424mTqRsYHZyjjVvlZB4LAT5BILKcagh0cX/LHkyI1DtpErfjGTPhHgPwW88Ge
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 06:03:53.6870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef673565-5957-4b69-5c14-08d794c9b4bf
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4503
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>

It's not always the case that clock is already available when i2c
driver get probed at the first time, e.g. the clock is provided by
clock wizard which may be probed after i2c driver. So let's defer
the probe when devm_clk_get() call fails and give it chance to
try later.

Signed-off-by: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 700b401..7d2a8c1 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -788,7 +788,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	i2c->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "input clock not found.\n");
+		if (PTR_ERR(i2c->clk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "input clock not found.\n");
 		return PTR_ERR(i2c->clk);
 	}
 	ret = clk_prepare_enable(i2c->clk);
-- 
2.1.1

