Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507A0547E94
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 06:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbiFMEaS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 00:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233071AbiFMEaN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 00:30:13 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63851C901
        for <linux-i2c@vger.kernel.org>; Sun, 12 Jun 2022 21:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEh9lKGeG7MfUboKDRjn7yiyuegQlfnSERXkI9Lk2PmJS99+Pdj4R29H1U8fIdQHnLfsL1l6RMjdiIrJUutITZcV2YpidWqcbyMURS/sOI4P0OwvdCdKbSk0YFDvcNOhlLa/TT2d7mReobn+X20DosJx69sa9nJItceiI9m8fSPqKuquf7yqD3dpkmt0l4Lo8YMdWlN4vYdtuH8vkt5DAtFKgI0L7cya2CRqIWTAmx+3F2NCAB13YqbwlWIGLQiEAngRzo/xOQnJU/TXvLL2dp0FwFCSSLNz8AGtfNFrsqliJ+QDIi0hu13L/j3ZZIYUQxcWnv57oMoGXQOlhMOLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzkFlo7f84xmbj0tYfoMhpNlR1xWPNnWb6orYg0qG1w=;
 b=S8GSAO3ES143edElWtU1o4cTxnq3v2idNddQI3g/Tn8tXV4wAt7gtXCj7ZYMj/WKq3qggCth7tQ2hvJJ1DeJ+FzxGWuo+WOpbgBJYa6wxBFVP2FORSbARzyADXCORU4lgYC9z6K9pOkSkeJeDZLb8bTFvFbfteVjOJ2LEE6Ggwd25Our3b+wMYjT1F3Frztuzczo/9Rh8hBVmB8cBt1UI1WqUFy3nGnj6jzzvRUES25juet4YMf+HJi1osyegbX9Npg+MRKxCxtkd7c8CGJcKOPIYobQYMSyrA+y7YJSlNukR75wrPOzL4pxPsyy0sWY6jhz+EEaBhZxHUco2sb90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzkFlo7f84xmbj0tYfoMhpNlR1xWPNnWb6orYg0qG1w=;
 b=NqNRDoZU+mdHaLoxT8RTKX9eNIRpMYe6IedwgIJ4nf7hL1Q4hedtXtIZhT8syOor6E1LMHKmqaXX0VgJBHf9D2cPV2QhtvjeP1ZNOQyfmSBoWNPgOIkCwD5r0RrM9HHSemltJdvOAvIxt2O/escIkTHzUGBO4tB3bQ5+4tvMY5Q=
Received: from SA1PR02CA0006.namprd02.prod.outlook.com (2603:10b6:806:2cf::15)
 by CO6PR02MB8770.namprd02.prod.outlook.com (2603:10b6:303:141::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 04:30:09 +0000
Received: from SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:2cf:cafe::84) by SA1PR02CA0006.outlook.office365.com
 (2603:10b6:806:2cf::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16 via Frontend
 Transport; Mon, 13 Jun 2022 04:30:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0018.mail.protection.outlook.com (10.97.5.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 04:30:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 12 Jun 2022 21:30:05 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 12 Jun 2022 21:30:05 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=41264 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1o0biH-0008p4-08; Sun, 12 Jun 2022 21:30:05 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Date:   Mon, 13 Jun 2022 10:00:02 +0530
Message-ID: <20220613043002.28152-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcf10043-eb50-48b1-cd29-08da4cf5668b
X-MS-TrafficTypeDiagnostic: CO6PR02MB8770:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB8770D719500309B0C8806508AAAB9@CO6PR02MB8770.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELF9SZJGuJevEsdaLGXM0neXnz7AT17RJ+qyd6qqdVk52fhsbGpZlI6ixPIXLi3jB+Bd5wG8tbraZr7LWknut/uu72MIDuel2W6F/uLM7z8IrXztfkfAlZyHF2M4i4tH/+F6QGdDI5UwXoZVVph/LdW1yr2mtk7B2tv+ODeoRGaX2nSGGNZ2ww6+BaNAFrMBNFMttztBouFADxJcq50WdDHO2nD30CDyVOU6V7V1hDQUVL/hqhw+3ftbwR+PAQGeiHHsoHPRJnaPrprh5UTNa/Vvf/0VA2jqky5+4r+t44A5J8YAIOZL/B4/G0Wk25DSg4qJUWFHgTxZ2cgPPLWIIQEX7qyHLT6QOnDItfLB3gLiTW4p8bSpkK6gxUhGRRPGvIDI2g0cPevzTcbk5ruPFjjavYS2YRq/JDD9CCtRzQqwvPhvv14sl6UCwVyhDTVN3j+v8kmlfn3FYXvtXb0CBwJNNmXJOoEkarZp0Cu8MA+HDzIiGbG7MB6NgGcC3wTgkksBnLTBeBBzSoXeJUHjRycJ9J4UvZsQQ+8JWTi0cYFWzypiviOxJ745RymiTNiZsFBPZyeDp3r+UZ0pycNqUxHXzQaW/+y2fg3shWWgUcgSeXkzjXopeHDKUcakx9SwaFpcBqudRFOAUR+x+jRO/KJ3AwDQfflu7BktgXzacrIWgRMmGMEFBhNsTmNdhYOc9RaP/XKpfP93oVfuTB4KGw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(46966006)(36840700001)(356005)(8676002)(70586007)(70206006)(4326008)(508600001)(6916009)(316002)(7636003)(54906003)(336012)(47076005)(36860700001)(426003)(2616005)(186003)(7696005)(26005)(40460700003)(83380400001)(6666004)(1076003)(107886003)(44832011)(5660300002)(2906002)(9786002)(82310400005)(36756003)(8936002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 04:30:09.6543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf10043-eb50-48b1-cd29-08da4cf5668b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8770
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

 drivers/i2c/busses/i2c-xiic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 9a1c3f8b7048..ec56b80653d3 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -34,9 +34,9 @@
 #define DRIVER_NAME "xiic-i2c"
 
 enum xilinx_i2c_state {
-	STATE_DONE,
-	STATE_ERROR,
-	STATE_START
+	STATE_DONE = 0,
+	STATE_ERROR = 1,
+	STATE_START = 2
 };
 
 enum xiic_endian {
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

