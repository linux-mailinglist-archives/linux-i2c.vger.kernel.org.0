Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCACB54A94D
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 08:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbiFNGTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 02:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiFNGTT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 02:19:19 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7342FFF9
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jun 2022 23:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daebQB3SHmvvX7lFj0i/kGRWGABqVtKwE0llcX4ROBGt5eB3yD1GJ3HBqCS+KfJXo0+1cUL02apTeNuOb2dFZ7e2bA8sLdt7UbfgwlZJCc3oWWnrPn7VFUs/JAFMC3ipVuRkihgPZsLQ7FFdmK5PfifTJKRhmeQXofAIxnIn1YdM9Qg6uc3osmuvAe3p5VAvlZJmDjAKQY7SWSfthSDKo82zCgJ2zeXfzUaH59zwbr/Hj10ThZIbEFydWePM4QF7KHnbt9b00Zvsvd2bazvN8EbUL+ra3YsPSdm8k7MSzf+oAGrCU6KOJ7+sBryqo+XTytQj3BFUOcWhWW1kC8w1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbD+jQJt8CCTx46vJxpZBaLjFBye0R1p4I9OS5xkAd8=;
 b=KmtzfkAFixb9S1fSdXr4pzeLu1OB1nCtm73TF8Krg/OoE1FhdoF7gIBy9ZnzKqCuH7uzjmRw9FXKWoMFP2XaUf6FE9YUOiS5S779ZFZK5b/KI5JaOtMuNw9OV17CeFmKdD2rGeGobTluRNcHUsSOnJmAyBsuT+tUk/TcJeZINACXbAi7I0mw/LYLJm33VbgUkTH63HyihyYNq6SeVREZ104lClhOZI4pnRf5s7mdoRlZJhb6uvxjhqI23ETzoYxb31ICcO0S70kqfzIjZJDij14jK+CYLH0sQ1atvxbBQ2WDytaiGXICoZ+vAOZYjBT0Wo4KHUe9SBetFmp6WrODsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbD+jQJt8CCTx46vJxpZBaLjFBye0R1p4I9OS5xkAd8=;
 b=INtVyDs9vwGcP5gt63LK41OtooV7GZDyDpJmFwxtgaCfL1suq3Woqy4zeGBvD5S74lO/Akf01PQ0N6tfIsd6Jk4s4Ujm7FlY9aZq8pBShrCkT4Cgve81RfJG+CKFDslacd6nWL+hevnx8NdHdZKPlvn8LZReJCqyFle4NE92CR4=
Received: from SA1PR03CA0018.namprd03.prod.outlook.com (2603:10b6:806:2d3::29)
 by CH0PR02MB8118.namprd02.prod.outlook.com (2603:10b6:610:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 06:19:15 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:2d3:cafe::9) by SA1PR03CA0018.outlook.office365.com
 (2603:10b6:806:2d3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17 via Frontend
 Transport; Tue, 14 Jun 2022 06:19:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Tue, 14 Jun 2022 06:19:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 13 Jun 2022 23:18:59 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 13 Jun 2022 23:18:59 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=42704 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1o0ztC-000DW8-Ni; Mon, 13 Jun 2022 23:18:59 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v3] i2c-xiic: Fix the type check for xiic_wakeup
Date:   Tue, 14 Jun 2022 11:48:55 +0530
Message-ID: <20220614061855.24210-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be0346e0-158c-4c1d-ad90-08da4dcdce7d
X-MS-TrafficTypeDiagnostic: CH0PR02MB8118:EE_
X-Microsoft-Antispam-PRVS: <CH0PR02MB8118D89845E27E41365CAA9FAAAA9@CH0PR02MB8118.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3l9meHVBDV1lTDw/yr4z06NQxWoj+/oMmSXoxuVKcIEpJ6EwDZ97rRksiY8mFUayQFZbahxq5Vu8bWq0IkWhqZHQ4epdeS7TqAEV0tvSYmMowYw0jOZPiZohvwG6Ms9HqCEgWTia66SUjLIoJEhD+NkHBsmEZhrlF0EbhX99ckah97b8rCmFhnzoCZ+Z7ZqIRzHiva3JK2EAtDAEm6vh88jVnqukE8ejiKBxybZQWw3SAsorkd1wy0E+WKn7sAqicCOhDHAn5m7Ej2WLI0uQw2+uOS9qrO+4vUQBbl4kA7Layj7+bAqZzFdIgQUG9uY31DWypBdL2IsoWDKI12W2FlypR6HKJIcmJl5AOjxCVLozCzgQkqIldUuwt7rIXAlS63QQcljdR6UXUNlN9qgEGjSYZ8rBRC4fHvYLNMJl0Hu5tRNqPcbfzyMItud+KLF4Acnc3h1UbAFo1Gm2xRJBNAmeAqQRaZ0uzUPETWKUJcgIfa8IcDDrY8dUtWVZf3L3ihXhhiNkZdNIfh086uc2FQ1GRzj41xTEDSFXDCB+xiCh5the0rZ1RMesEgmwf6+cWmLRWVqMm8IU8INeFqSpZru+pf5aTIisvkhKeAyisvyf2ia919VHsVVNJg5UQVCQmt7pPrDv1ViwIInbNB/tuAChgbYGzmxkuC1Q1o7BQm/033ZQwV4q+E8icdvh0UFkXua3HFb3ESBX4V5xXC61Lg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(8936002)(9786002)(356005)(54906003)(6916009)(36756003)(316002)(1076003)(336012)(107886003)(2616005)(186003)(508600001)(426003)(2906002)(44832011)(70586007)(70206006)(4326008)(7696005)(83380400001)(47076005)(8676002)(40460700003)(5660300002)(82310400005)(26005)(7636003)(6666004)(36860700001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:19:15.3542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be0346e0-158c-4c1d-ad90-08da4dcdce7d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8118
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the coverity warning
mixed_enum_type: enumerated type mixed with another type

We are passing an enum in the xiic_wakeup lets change
the function parameters to reflect that.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
Update the wakeup_code to enum
v3:
remove the initialisers

 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 9a1c3f8b7048..b3fe6b2aa3ca 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -367,7 +367,7 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 	}
 }
 
-static void xiic_wakeup(struct xiic_i2c *i2c, int code)
+static void xiic_wakeup(struct xiic_i2c *i2c, enum xilinx_i2c_state code)
 {
 	i2c->tx_msg = NULL;
 	i2c->rx_msg = NULL;
@@ -383,7 +383,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	u32 clr = 0;
 	int xfer_more = 0;
 	int wakeup_req = 0;
-	int wakeup_code = 0;
+	enum xilinx_i2c_state wakeup_code = STATE_DONE;
 	int ret;
 
 	/* Get the interrupt Status from the IPIF. There is no clearing of
-- 
2.17.1

