Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C57C508311
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Apr 2022 10:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376409AbiDTIDv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Apr 2022 04:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376608AbiDTIC1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Apr 2022 04:02:27 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852C233E31
        for <linux-i2c@vger.kernel.org>; Wed, 20 Apr 2022 00:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmnPGxczRU1t8AmpmohHJ3C8nfRkhUWnM+vqHg48oWBegC9NMSpHOhCbCcB5Rktm194Dr3fckfWRRTMB64FsX3LtKRkne27+O29JLZSHvKVoUDitIergYUdvKVtt5m+E3rt0B1puzDjFWdsDBHIhIJdt+DaDwjsq+kJgCbifPltR1RmOJQI763rdcwwK5PdXg2qdQUmD1sLUwSvONoyYpJf+ZrVtZ3ydajBzgCxZ9g5762jaTMRGzxVm/gF6FEh/1gTrSygjCvaZDdVQvmlw6FAdyrFszg0Hw9bF2qFIJL1jH38Mng50zftJWtjPGtcYw6QpqmBlBG4+JxWG5royFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3scFZ6qceLUnAyCiahtL9cC5JSW6SvPh8/dnemOUSo=;
 b=XFqzNDAAW05MloMewRgpvT8RtuITpK1A9rIrVzXBEpyizRh2ytSwjvbmBva3b9t8r7AypEMSmWSfxP1GUVT95RwJJSGXKLcso4OKMvu0/ZYyEl7zlULucct54ARenPIoDQxbmQaGtdIaRiijCvFz3aGUN31Ew64nCTMgl9+sVvNdF46aLDUGmSPhPYCkYqVuU7C+gYk7xhfHs0fkR2/6OuMNeDZfDzWcA+BWCTBd8tPSSvZ4TMUJLsuAMHe94bw5MWcPCMIG2Ju+qNU5dduIGqZ2lHY5BDg7dp37sftO6RLoimwMnXrGXROQanPpb/FR9He4eG9lEL5CSTu/JJRz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3scFZ6qceLUnAyCiahtL9cC5JSW6SvPh8/dnemOUSo=;
 b=gfIpOJKq/3OGvXcHSCaberTGWsgwWJjerneTGL4vkVLWZHppe/U/ajVLMbzx6/EiJSI7uKHI+NJZ6z4UR26k7Djdmgjx27TTKnDSlzeqFFjFfq+B+hoH5Mso79+80/a2i/euGj9ddNhvIxUfrX/gsHmFt0pSIQNeDJoPbtFxrms=
Received: from SN6PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:805:106::35) by SN6PR02MB4846.namprd02.prod.outlook.com
 (2603:10b6:805:98::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 07:59:39 +0000
Received: from SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::66) by SN6PR2101CA0025.outlook.office365.com
 (2603:10b6:805:106::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.4 via Frontend
 Transport; Wed, 20 Apr 2022 07:59:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0057.mail.protection.outlook.com (10.97.4.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 07:59:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 20 Apr 2022 00:59:34 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 20 Apr 2022 00:59:34 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=54328 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nh5FO-0006KN-0O; Wed, 20 Apr 2022 00:59:34 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 3/4] i2c: xiic: Correct the datatype for rx_watermark
Date:   Wed, 20 Apr 2022 13:29:23 +0530
Message-ID: <20220420075924.14546-4-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7416dec3-67eb-480c-8122-08da22a3b817
X-MS-TrafficTypeDiagnostic: SN6PR02MB4846:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB48461E9BFA2207A43F4A182CAAF59@SN6PR02MB4846.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMIH7FL1fVxsBtC1O6Mfh8sgxn/viJ/gdF6cGj0pkOMTnCyZ7MU3v/q6XXz/60HHql9xvGOnFqC+CCJJIwfItsJqZepGfbWxKLxG2vpfFJIoNXFCCu/b0tV36lapyiCYCXCiVelYnrNtluXOwjo+YOqVr8vcdsubeke4Ysboc6VfvzLsn+mYLm8Y3ab95P7Y+K0+507PIliH8lTHxaooZiyNyTc3xiZqINa574pAPbNWzhlse5nHA4WW0jsAkDjUr6N1sEJbtwjMeR1Cfu5VgGRQfhgwWcvc435COE7OJoUrHSfJ8VsC3MP1bSdJtkamFGFMsYk73sCfo5SmI6ZQ8/kETJkQ4racHyH9rWMWOW2O++cn+mUV8dbNCBmvPFt6l7ftsn6p2pVF9GZYeZiWV4ERtHYoHvGFZ3fcgxr/9WvUxSqqbHm7iE0Zxc0g0QJc4FtT53SxHf8cUonYQSWjEGQVm9Z21fAJqM4f7q/z2gA4zyg45heYH7AagNght427mWNgY5VebDwE0r9J6xcQyFYhpe4UzpM/ZUZPH9uUviyUdSwoTe+TE16bfXLaRjV6DjLdvZTZcMYS39UsA0H0VK+jwi2OSAPHn/3JXs7+/loPh1umOjrz8iF6J2aAGxHasCVjfdNRBZNnbNX2dLDdf9ASXptLVMo4MPTA+T3cRSKph0/u5sJ8rPK06dlpik0sbmGzIQSMXPgP3v3xaoPdRcOsdhrYX0utlzFZCXaXfxVthPEkTV+YHTbD5G8JGNz2
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(44832011)(82310400005)(47076005)(4326008)(8676002)(107886003)(26005)(186003)(2906002)(70586007)(6666004)(36756003)(83380400001)(70206006)(43170500006)(356005)(1076003)(54906003)(336012)(426003)(7636003)(8936002)(7696005)(6916009)(2616005)(9786002)(5660300002)(508600001)(4744005)(40460700003)(316002)(36860700001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 07:59:38.9127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7416dec3-67eb-480c-8122-08da22a3b817
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4846
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The message length data type should be u16 as per the i2c_msg structure

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 16a7e3164e68..eb4d34e7c0fe 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -576,7 +576,7 @@ static int xiic_busy(struct xiic_i2c *i2c)
 
 static void xiic_start_recv(struct xiic_i2c *i2c)
 {
-	u8 rx_watermark;
+	u16 rx_watermark;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
 
 	/* Clear and enable Rx full interrupt. */
-- 
2.17.1

