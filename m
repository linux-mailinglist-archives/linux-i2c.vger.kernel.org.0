Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBD955992A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbiFXMGq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbiFXMGn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:06:43 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCDD7E03A;
        Fri, 24 Jun 2022 05:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQmY+wIEnoUEZKS+bH3ONCVJmkOh5u0v9FPEC311MGtCisyWUNIGEJ/PqTdy5Bjo8FdK1iH4zMmwot38FfCvoSKG2xqxP84LonaMvVxGAzeQfnmst0CDTLe27UNYdU+ssK773HRork72ZItl0hDC3Q0zItHrzIT19eVfety5dCix1e987JY4icoe/ddrDB/imlH72/gm5Ca7i3F53WuTqTPpw6wTFv6M9co6VvreTlxR4y40KiDSlPC5ogrM9QGlZIteJPWUFIXgVZdN0hn3B+e77eDvJF4Pp8THd2DiCrvRynS7ea9VMH7KNjAtnvDM8Z12RDdaPU0Gis7k5NuXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeQwoQ0RRLoXHdY9/bwrGuA2PNBPb0svqiany5xuwuY=;
 b=ggVbqRdxjCAH6t/KgkXje5roRbo4hylg7xgDTuqPP3OAhL61xLQ44qgwaPaN+56ZiU2DxdqSYtwPA4msYoZ6RD1i3YegAsUioVGtxOkI7QjPzkYOAXysXPAADdFM8GgCbScDqMJv02+Z4RUEVj482YQvvHZPJg7tWSvJhKRqW0iICd1ZfR3wUm8SSVrxomLlxS356IOOaJgaEsPr4mJwM25KPNT3Z/Bv8roCDaADEf4gjkO8mpZ8XV6J0pCtVMz30WY3CdEYkbguzj0hevpwuSdd5dHCLhL042iUBxoyiQJFBsN0uvkkNJXGore+2bjXb/5Sk6UgTulO0Q/QRuE80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeQwoQ0RRLoXHdY9/bwrGuA2PNBPb0svqiany5xuwuY=;
 b=gkXBADh4f9GF57iA4IHKX7CDgJWkqK5Eac3KTOTR6PSl5pdp/WNeZwmaOrWE9do1DSniCEzM0ZMESbKgo6b1n4+hAYKtlyzl4riILX5WKWvsMwF4HMt0LQFwZXZJxG0jGFtnEdI660+i+pRxlhhYvcAIeIhXH7FWbDsfa4MNfB4=
Received: from SN7PR04CA0099.namprd04.prod.outlook.com (2603:10b6:806:122::14)
 by DM5PR02MB2810.namprd02.prod.outlook.com (2603:10b6:3:10c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 12:06:40 +0000
Received: from SN1NAM02FT0025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:122:cafe::9e) by SN7PR04CA0099.outlook.office365.com
 (2603:10b6:806:122::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 12:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0025.mail.protection.outlook.com (10.97.5.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:06:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:06:38 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:06:38 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47734 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i58-0005MC-LE; Fri, 24 Jun 2022 05:06:38 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id D8FEB104549; Fri, 24 Jun 2022 17:35:45 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 05/12] i2c: xiic: Use 'nmsgs' variable instead of repeated_start
Date:   Fri, 24 Jun 2022 17:35:20 +0530
Message-ID: <1656072327-13628-6-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdbe2081-03e0-405d-61ae-08da55d9fec9
X-MS-TrafficTypeDiagnostic: DM5PR02MB2810:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vL1Cisg6WEONRv/6FZZTKZgmKvy6MS/XjA/PEOd/vidacEy7c/HrNR8AV6ne9wmiAbSKJKh14uo/hHRZ4rmPWb7J0/pj8ZUt3RllC92vVE3kA2uxOPOCkE99l7zXj7eHXZVhtxdQibR4O48UGwTj/TJnZfOCNdIdeA8NV2b7FVcrbo5+f9qYl6Q65xZ0vyUIvydSh+2zm+15rWd8HLi2qIKz7nXNhoS5acvLfz1by+pgPmUo+i8yDfx9+r8P/m75W/rWRS3Q9HnSriQezTR4iGYCB/sr+S4Xl7nzeL1AdriBz8oTlNk1hiVvj5oaDcZYtUdhk1xuutylFf2FTs3IZcl3WiH8xwsI8dRIDBmYjLZMGbigFtx0t/blUQ3aFESEaQ+PA3sfSmeyeJlwOmifXEDFmZY0Bw4EQrgVtwN6acT/s61Ku+6UXqVHWERGe4VfljemCunCfpEIUgQ/kNu3QMsR1YsS7JPqwmgHrKwGDeapKqMrCOG578wFrvd9X5h6hAgwTLypkCZgo+j13HwNR4qLp77KjH6iKZ1haOQHXnPnb7yo69ckALoOCASBmf5b/pogE+Ro7l4msHlwkH3a2F/AFh18qn98Y4xCeUib0C01zv7CxWYLDrjHSRRvhD3Kn40ODFmUqJRSb2G663M+I+kA1r4v2BOCjViWpGk8aiDYPjyhr1w8oXkiD5gM5+WAP+6e0UoN2maCk1e1lAA0w95hYBMo1OxZeUeU9uqHQ04uv9AQK8ZzegaWgHQ6IoGOmKgAkceEnJBH5wqVTv5bnOgjOIBJYseTUD+oWQ0mkBhn1dgwzqI1oOFvvccjk3D9Z2Eb/JQxzjwLqSYNkdb1md45Nnl/9Ez3FIi3sEpuWM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(40470700004)(36840700001)(44832011)(7636003)(316002)(2906002)(54906003)(70586007)(8936002)(110136005)(8676002)(356005)(5660300002)(70206006)(40460700003)(82740400003)(4326008)(478600001)(83380400001)(41300700001)(26005)(6266002)(42186006)(40480700001)(47076005)(2616005)(107886003)(6666004)(186003)(82310400005)(36860700001)(426003)(336012)(36756003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:06:39.5971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbe2081-03e0-405d-61ae-08da55d9fec9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2810
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Remove the redundant repeated_start variable as it is setup at
different places, and read at only one place which can be decided
by 'nmsgs' variable alone.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 9c3266ac209e..3debb44608cf 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -61,7 +61,6 @@ enum xiic_endian {
  * @state: See STATE_
  * @singlemaster: Indicates bus is single master
  * @dynamic: Mode of controller
- * @repeated_start: Repeated start operation
  * @prev_msg_tx: Previous message is Tx
  */
 struct xiic_i2c {
@@ -80,7 +79,6 @@ struct xiic_i2c {
 	enum xilinx_i2c_state state;
 	bool singlemaster;
 	bool dynamic;
-	bool repeated_start;
 	bool prev_msg_tx;
 };
 
@@ -445,7 +443,7 @@ static void xiic_std_fill_tx_fifo(struct xiic_i2c *i2c)
 
 	if (len > fifo_space)
 		len = fifo_space;
-	else if (len && !(i2c->repeated_start))
+	else if (len && !(i2c->nmsgs > 1))
 		len--;
 
 	while (len--) {
@@ -786,7 +784,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		}
 		/* Check if RSTA should be set */
 		if (cr & XIIC_CR_MSMS_MASK) {
-			i2c->repeated_start = true;
 			/* Already a master, RSTA should be set */
 			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
 					XIIC_CR_REPEATED_START_MASK) &
@@ -805,7 +802,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		/* Write to Control Register,to start transaction in Rx mode */
 		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
-			i2c->repeated_start = false;
 			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
 					XIIC_CR_MSMS_MASK)
 					& ~(XIIC_CR_DIR_IS_TX_MASK));
@@ -879,7 +875,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Check if RSTA should be set */
 		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
 		if (cr & XIIC_CR_MSMS_MASK) {
-			i2c->repeated_start = true;
 			/* Already a master, RSTA should be set */
 			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
 					XIIC_CR_REPEATED_START_MASK |
@@ -895,7 +890,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		xiic_std_fill_tx_fifo(i2c);
 
 		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
-			i2c->repeated_start = false;
 
 			/* Start Tx by writing to CR */
 			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
-- 
2.25.1

