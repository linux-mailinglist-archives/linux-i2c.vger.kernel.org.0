Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3A3135822
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 12:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgAILiS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 06:38:18 -0500
Received: from mail-mw2nam12on2073.outbound.protection.outlook.com ([40.107.244.73]:33120
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728018AbgAILiS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 06:38:18 -0500
Received: from BYAPR02CA0012.namprd02.prod.outlook.com (2603:10b6:a02:ee::25)
 by BN7PR02MB5234.namprd02.prod.outlook.com (2603:10b6:408:2a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.8; Thu, 9 Jan
 2020 11:38:16 +0000
Received: from SN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::206) by BYAPR02CA0012.outlook.office365.com
 (2603:10b6:a02:ee::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12 via Frontend
 Transport; Thu, 9 Jan 2020 11:38:16 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT023.mail.protection.outlook.com (10.152.72.156) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 11:38:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8l-000232-Bw
        for linux-i2c@vger.kernel.org; Thu, 09 Jan 2020 03:38:15 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8g-00043C-83; Thu, 09 Jan 2020 03:38:10 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipW8f-0003x8-IS; Thu, 09 Jan 2020 03:38:10 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2 3/3] i2c: xiic: Fix the clocking across bind unbind
Date:   Thu,  9 Jan 2020 17:08:00 +0530
Message-Id: <176b8f623a2994019d775dfb5dbb2bdcc3852069.1578569758.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
References: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--5.741-7.0-31-1
X-imss-scan-details: No--5.741-7.0-31-1;No--5.741-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230434958821141;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(189003)(199004)(7696005)(6916009)(9686003)(86362001)(9786002)(36756003)(107886003)(2906002)(5660300002)(76482006)(4326008)(426003)(316002)(498600001)(81166006)(70586007)(336012)(73392003)(26005)(8936002)(81156014)(8676002)(6666004)(356004)(82202003)(70206006);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR02MB5234;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93c17d9a-7cce-4b5a-a468-08d794f86aa6
X-MS-TrafficTypeDiagnostic: BN7PR02MB5234:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5234077DB1F2B4039C95B8E787390@BN7PR02MB5234.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AiXif2bHv4t7H+z/rkjL3icSl1hx6i2cICHfoamA5ej+/Tc6jZvAcp4gLgiAB7ayW27YLq3ozT0AojfEhpw0PscWqtmn9VW0hecxQqKWX9nYcnQs1qv3GRlUPGNmEayZs4p76UzKR75XY9ql7oHhXlQDUyVgIt3d7WS8SaBne9+qI2n6QZpkoCfJh4UknjbBrdRppjkykXbckbBC4HTyYmMfeG7n552TH+bLLdi8yzPx+kj2aljG2X/vRk6L0JxVhoVsbLXZEM3OoNopO4HDSTK3/i9/m8e0WTI4pCnCZ+zoqSvoRO/LQhswS0ZQt39xJ4Bow/37NXHJBhQh7U5Mk6cWIjSTZiwGcciGbn1AnrjlxST48Cwb5hbgmN3IWCnimXwmkhHQfk9d5RbzqPRlVNNGJ+eHJcTI4RdgmKto2Ein3ZIXLoI+9utyrbyiRhEv
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 11:38:15.7199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c17d9a-7cce-4b5a-a468-08d794f86aa6
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5234
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

The recommendation is that the set_active should be done
with pm runtime disabled.
Also fix the remove path for clocking.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
v2: Fixed commit message

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

