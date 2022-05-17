Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6760F529915
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 07:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiEQFfB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 01:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbiEQFfB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 01:35:01 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A8840918
        for <linux-i2c@vger.kernel.org>; Mon, 16 May 2022 22:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1tsuAnZuDL5086yWZqKIopHtWpDvMnzHLg5xkbMXozfdMx89P7SoFsmuuBsOSTBbeZSc4cI5gIFZ4hGwqUfo9bPolO815YZJX6y5p0bWxfW8XDVSVSLKVZ3GLXrkmj3CQH+Xdmk5c06lJ522+HCojBbbrdVaaBQE6TI9OIT6o024l1e/tqOmVo2Yf57IuRKWqNym/ogJN9ZytGYkJEgCLMXUnolv8DU0HA7C/anbOUPb2QTLDxhXd148+IRr1dSNeFmTKMUwQipezUFE7qf7EjgPTBMOQUjTLrQzzqDOlS9CpQx03ylvgYUF23AKyM7OKN1hcrPGFGmKLi17kuWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sHQJxcItsAhJnafo8dGLWSV0WeyPhCvky/AOQkLOB4=;
 b=S1J3xI46Aza8I8bMuePl+UihDvyCdYBc1oUFoRNo4/frYCzZShsIU+IXepqbdgxZtcGx8CkIqwTQiRgHVa+BYXTUbR9SqpZkt7yt0dfjQWWpKprw0V5d3XF7Lcyl4p+wUEAUtrCc+v4NbI4+kYimRYvDyi96EjCLbA9qkVWR8N+KMgCKoC8/CpOJSEx2AEVF+u9jorL5c+cPBPJrTwFCsrVgoZtDvuFudtrZxpCFdbdDBjY6HDL4pCh3kjVrun141Y0dt//44r4oAFwmqVjUtwrnbLeJIn0pLt2OQ0tWUaPdKsFby6u3oLzAqVcCioHinHnwH52S5FdP2+eDx5T1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sHQJxcItsAhJnafo8dGLWSV0WeyPhCvky/AOQkLOB4=;
 b=pSmdkB5T0usl2nEi4liyFgEdhlTSJNB2dNhCXaJ39tluBYBq3Fkb1obkXnew/ID6qQirCWyannRff33Nh/30vspaMXUXlVkO4tuRja+TZEXdxZHcBcr0eXw98+ajjQVucp6+LDFCPp5W6+qioR8mWMpYrwPz6y+OCORBRFfpKfQ=
Received: from DM6PR07CA0052.namprd07.prod.outlook.com (2603:10b6:5:74::29) by
 BL0PR02MB4324.namprd02.prod.outlook.com (2603:10b6:208:40::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.15; Tue, 17 May 2022 05:34:56 +0000
Received: from DM3NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::97) by DM6PR07CA0052.outlook.office365.com
 (2603:10b6:5:74::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Tue, 17 May 2022 05:34:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT056.mail.protection.outlook.com (10.13.4.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 05:34:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 May 2022 22:34:55 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 16 May 2022 22:34:55 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.39] (port=45082 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nqprC-0001MW-TC; Mon, 16 May 2022 22:34:55 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2] i2c: xiic: Correct the datatype for rx_watermark
Date:   Tue, 17 May 2022 11:04:52 +0530
Message-ID: <20220517053452.1526862-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc8f9db0-d765-4eef-05b0-08da37c6fa3b
X-MS-TrafficTypeDiagnostic: BL0PR02MB4324:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB4324B6094B12A331286890C3AACE9@BL0PR02MB4324.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsvNIFtyiShFrGtJNhCY/tAdNoVkY2X3DHOq0AF0vImuPHp95gy1Ax3jVm2z/Z/grE+ESAC0oHM/rgFaeuvFjfatnO6QpMEFNTgJwZ/teTDqt+S50Dll1ZJP4AoJGCtZLPcxaOhASD1fDpzv+4X9cIEvKvgK4T8Owf9p33mPhu4J+FBN4/C1ck+7tcc/9TocSiwLhorkg9MqmuIaTeyBGWfXJQY8OFMtNyatscXThtWfvoUTIlqfs9MD5Wmc074/SteSzqyw9unB0lqvqp4brLIk7qHP5nTbFcTraHpbnFowJHEZAN0vTX3cAx95SO+pgE1dVArp0+QEdo9cYSwhMveQWQXmo3Yh/9H/4JNl+Asikmu5hO29ro26rvIYDjd2Aokczno0SSHicpdMdsXBqfwrzq65SpQH4LpN8z+8cF52XqG5jEQqANfYL6M8MGf3qU/MQsRhNkV1P6qMEKnfq5Viw6Xp4LwwxzIce81lCZwSV8ltRPSbBbrzdf675eHyaFVCpfFYNy3K1C3IEebZ5csYLWZxvHWEq3g+RDmMZy7AA9mq/d/3uzPC0rSvLDR6t3t/JR6IDaMTiR0kQa/7dghhMzK9IrSw2qOFxnUSqwH6aKFj1nfrjZrrkX5FSclqgt0RysBrXLasNXjfY3kcK2LE1bZsOiY1JEhzHZXeX43fza6XtCl5Odse8VCCbEltiFfOx+W2kZf++T9P3v/YO4DGFgdO+YqN/iw9Ov8zpGHntigRLfpANvr1LMDG4d0T
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(70206006)(70586007)(4326008)(8676002)(26005)(8936002)(9786002)(7696005)(508600001)(44832011)(7636003)(6666004)(186003)(1076003)(316002)(6916009)(54906003)(107886003)(36756003)(2616005)(36860700001)(2906002)(82310400005)(426003)(47076005)(356005)(43170500006)(5660300002)(336012)(40460700003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 05:34:56.6789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8f9db0-d765-4eef-05b0-08da37c6fa3b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4324
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The message length data type should be u16 as per the i2c_msg structure.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
Typecast xiic_setreg

 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index aa6e37a9f275..9a1c3f8b7048 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -578,7 +578,7 @@ static int xiic_busy(struct xiic_i2c *i2c)
 
 static void xiic_start_recv(struct xiic_i2c *i2c)
 {
-	u8 rx_watermark;
+	u16 rx_watermark;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
 
 	/* Clear and enable Rx full interrupt. */
@@ -593,7 +593,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	rx_watermark = msg->len;
 	if (rx_watermark > IIC_RX_FIFO_DEPTH)
 		rx_watermark = IIC_RX_FIFO_DEPTH;
-	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rx_watermark - 1);
+	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, (u8)(rx_watermark - 1));
 
 	if (!(msg->flags & I2C_M_NOSTART))
 		/* write the address */
-- 
2.25.1

