Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6FF135821
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 12:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgAILiR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 06:38:17 -0500
Received: from mail-dm6nam11on2044.outbound.protection.outlook.com ([40.107.223.44]:6266
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728018AbgAILiQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 06:38:16 -0500
Received: from CY4PR02CA0044.namprd02.prod.outlook.com (2603:10b6:903:117::30)
 by BN6PR02MB2691.namprd02.prod.outlook.com (2603:10b6:404:fb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Thu, 9 Jan
 2020 11:38:14 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::201) by CY4PR02CA0044.outlook.office365.com
 (2603:10b6:903:117::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.8 via Frontend
 Transport; Thu, 9 Jan 2020 11:38:14 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 11:38:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8j-00022r-Cm
        for linux-i2c@vger.kernel.org; Thu, 09 Jan 2020 03:38:13 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8e-00042W-8F; Thu, 09 Jan 2020 03:38:08 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8d-0003x8-As; Thu, 09 Jan 2020 03:38:07 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2 2/3] i2c: xiic: defer the probe if clock is not found
Date:   Thu,  9 Jan 2020 17:07:59 +0530
Message-Id: <87adb91cc1a459dc6d523ed2c28123330ab6e49d.1578569758.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
References: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--3.128-7.0-31-1
X-imss-scan-details: No--3.128-7.0-31-1;No--3.128-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230434939943232;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(39860400002)(136003)(396003)(376002)(199004)(189003)(2906002)(4326008)(70206006)(336012)(7696005)(6916009)(498600001)(9786002)(8936002)(426003)(6666004)(356004)(82202003)(81166006)(8676002)(81156014)(76482006)(316002)(73392003)(36756003)(54906003)(70586007)(107886003)(5660300002)(86362001)(26005)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR02MB2691;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8702713-19a3-478e-bda9-08d794f86986
X-MS-TrafficTypeDiagnostic: BN6PR02MB2691:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2691D96BFC63FD6227FC1C8187390@BN6PR02MB2691.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAm4uO2t+LcWDByr2shMO8QQD8ht1dzwUlwSiLugv6o4NbtfXIKw34FYDJhj+0jngUfQlIudi9nYUYxmUDoJ8p00ZV1xHRDka68W12BAN1Vq8TTREdsMOhIOaJJzKzYJkwUj0/+8lS9oM5VPTJu6j5rizkQ4Fj/Dzv16lKrSoCrn/wmBICoinmXMkee4XMvPiXwRTBZ18XR5nu+AnNxAaf2uvv6FHR7lGbeWW3htqC29cEXfv3Br4ld2aIEnm19e+7knYZ+k4s708wko+G1GkutmoPqKlGr6TVof+Fe2BmiuEznJ9KcHUqwI2VqnX4s1GX8lI5Eoy+9yEzh9OkMv5byVmliG0BNcKmyp6Y8b3Vu4AjPoRenj7UPVrAZP4REYoJTZJGvzITz+RDSKUQo2OTv1eDjscZDROSbsJYw2Lbkl2/WuSWKMjcu/Xwnfoy+L
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 11:38:13.8171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8702713-19a3-478e-bda9-08d794f86986
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2691
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
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
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

