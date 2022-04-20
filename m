Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C934750830F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Apr 2022 10:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358829AbiDTIDu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Apr 2022 04:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353883AbiDTICU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Apr 2022 04:02:20 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF313C709
        for <linux-i2c@vger.kernel.org>; Wed, 20 Apr 2022 00:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khqv70EA7Qbx0pb+lsYbqu/t/VY7VFD40bGC63tYCHIg1/GnVLrN65Rm1FIFQOER7xNDsviu8z0mcA0xn6xwLZtaVb1ZIA0tk39/DqUIhsuBxAR0ALTXyU9Uu1y4sH47aZp3RZo2dsNg3fPbW7XjFdw7Bxp/18gmX9ZYr0NG58p6ZhxwZ3QFeoTZqsP2MMaxpqJ8gDb973Kkt8j9W6Nfke/YTTxl/b8evOI5y/Q+A6xkLVxf6Ek2/SayOt5vLFKATLOeFxkdy/V1dy0zb70SCe5VUDb1zKKTQ6/iI5chGoYvZsao/waVtODbbAHPoTpzdP4n3D0TmOgnLG4O0PPk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJnLOxFwULeeXn/Jwig3V6XFdG/++BRPYKXFj++cj+8=;
 b=GbdeloNMHjeiMur5CPq7qdmdaOuOja4rl9S9kxM24yRip36lAYBhpUDGurTV6e12swlQtzex0XqUE8tZN7ql/bgF3PWTcn5ZsndpTgA3kR9RbdBTyT1aKipBjSY64a348Xlc95i5g+w9bymJihJVaGRAOZ61qyb4A4Cr5/ZFwborr3Qbj5ltbyrkMxEOe4ZIBi0l5KdD1MXhXtDHGk80ehIH1qRwIhK+X9QRhr9vqwOoj6H26ckeZrRiTqq+AFHKMwMXFmax3hMYBD9pfIciHt0lCZHWz/ZSaikyjn7Mz+texNJWMSC91VH2gcMbVN7/aQm4nKHvRtyOShoOqg5RLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJnLOxFwULeeXn/Jwig3V6XFdG/++BRPYKXFj++cj+8=;
 b=cCEnX8YVfV+rA1lZpZX66EkqQn764ez2LFeJHF2vyP5do9W3nDjkYJqyYkKla/L9pmcjhCBzqmPEyTMVHpiUlMvZhfRGdl0Wk7cdH3X0/CempKMUKWxqSakm0DFbqbf1kS+EpZA36JliNo/pkSuAwcjTKUU0Tc2fRWQBwxaW08A=
Received: from SN7PR04CA0153.namprd04.prod.outlook.com (2603:10b6:806:125::8)
 by PH0PR02MB7158.namprd02.prod.outlook.com (2603:10b6:510:1b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 07:59:32 +0000
Received: from SN1NAM02FT0006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::12) by SN7PR04CA0153.outlook.office365.com
 (2603:10b6:806:125::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Wed, 20 Apr 2022 07:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0006.mail.protection.outlook.com (10.97.5.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 07:59:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 20 Apr 2022 00:59:30 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 20 Apr 2022 00:59:30 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=54328 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nh5FJ-0006KN-Iz; Wed, 20 Apr 2022 00:59:30 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/4] i2c-xiic: return value of xiic_reinit
Date:   Wed, 20 Apr 2022 13:29:21 +0530
Message-ID: <20220420075924.14546-2-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fab7d39e-83aa-432f-76a2-08da22a3b3e6
X-MS-TrafficTypeDiagnostic: PH0PR02MB7158:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB71585D7ABB0CC027E86E8491AAF59@PH0PR02MB7158.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uAHVoR37vTKnL0Zm0/0r9GEIiluFYJXRaEeBjBqRcS9MnBILyjSNPZJ1sWG11FLO147Mw+Uhs+rAGOARQzu5CwxyEaFiDIV635GXmh6gWs4ILVYLisnmF4ydRvIXXLDy9QVtsb9u3FML728F059dzu5LeytrdDE9Mh2BYztkkO3xBX4J/Fo6zpYbJovT2I5OsDkfnJX0bMvNv4D9BV8dz8LZq6ZaNizQncih4NtghS8zOmtawanuCCoGL35ZVeuouyvH5/+ZSggiUcnMshG+a4HaNSDWTRzhbqNsk0UC5S7QnTekO20SP0QojMrn2aET6A7m3W0G2pJwro8WcVhsHh54LKysI3lQsqeI6S7ObgPQLWIDW9Uy5bCeVLIH2QxRNwhD1TqShe6VOe6wCl5Q3RJmB9+yZtuQqWq9yFLC9lgERzs//LlJFCQ/jwCyf0o6DUvtfP6W3dmq9kWpNxrULT4R7cHKN3CyLTs4MdxBukmNz4uvuqtRJm2QEoMz2N9RjvQtfG9uZ4nVk/XZAUWliJI2tLHSOkh9+cngRPt01XQHz1mvTbPyNNlGnl8g9rIv6atcIRtVIwckCg9pYeooPDWtmRjtg08aHb6q44pTV5MWX++9Vbmk0MGCOvjQdyXqQR0NDzTRnIMK+06ZQXZEnQ4KaKVSRGCPqwZTxZxWQhTbuFV0gh1loXvAWLbTLYZChtEq+Qi74Qs399xzIT5dxA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(356005)(40460700003)(36860700001)(54906003)(6916009)(47076005)(508600001)(107886003)(70586007)(9786002)(186003)(2616005)(1076003)(36756003)(5660300002)(336012)(426003)(70206006)(4326008)(2906002)(7696005)(7636003)(6666004)(83380400001)(82310400005)(4744005)(44832011)(26005)(8676002)(316002)(8936002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 07:59:31.8804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab7d39e-83aa-432f-76a2-08da22a3b3e6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7158
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Check the return value of xiic_reinit.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ffefe3c482e9..8b39f9c7e773 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -381,6 +381,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	int xfer_more = 0;
 	int wakeup_req = 0;
 	int wakeup_code = 0;
+	int ret;
 
 	/* Get the interrupt Status from the IPIF. There is no clearing of
 	 * interrupts in the IPIF. Interrupts must be cleared at the source.
@@ -415,7 +416,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 		 * fifos and the next message is a TX with len 0 (only addr)
 		 * reset the IP instead of just flush fifos
 		 */
-		xiic_reinit(i2c);
+		ret = xiic_reinit(i2c);
+		if (!ret)
+			dev_dbg(i2c->adap.dev.parent, "reinit failed\n");
 
 		if (i2c->rx_msg) {
 			wakeup_req = 1;
-- 
2.17.1

