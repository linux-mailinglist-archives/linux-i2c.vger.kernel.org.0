Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89FE87631BC
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 11:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjGZJXT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 05:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbjGZJW5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 05:22:57 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2069.outbound.protection.outlook.com [40.107.104.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6D5B6;
        Wed, 26 Jul 2023 02:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsDJ1+r+3e4WHISdZtSAG1MdcElE0QP7jt+fMbWPxox5mcc3o2uh+LYWKtExpC17nWVo+9Ii5nOg6o2Eu77Q8gdQkIUyMqiL4yVSA4EmjmMZyORDLAd3PyOjmrkQAXrJrMudinHvOJfuOEcld1tVhG22bfZYoIIZK2vbS/EUqoY90YdFzR0emHkM4+sX3HMvR9gZ1nLDxG7kF/5xJ9A9cmx0GuDwwu1wjJ9wCnAKCmk/nRavmCDtZtNGdn3/Rryd5CZgKzuAtFezJGnZu1iUXYIeFUE6JR31iG1R3hR9X5slyfYi2LRcqN1hyBMwAUFhxUAOUpu0wm9+/bu+yX3Wag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lsdal4BH0XDS0wEPClwOn+J7szSCbHiBVvvVhHMGBas=;
 b=KdOgCvEwpo6HQqkGDJUIxdJD5pg/RW37rRTW2werbmpBB/98OALf7m7n/izxtBamm3Jt6ipwLmrJDv5Efxm/z4hBDyCeCDCpebOcSS6MbQNn6nPHGvCFJi7F99sQZOHCDJ3p+cWVWxV8Aln4Ysoscby43Lhiz2Te8FKjGdNsYNCnrlIjR9wWeLpXok04pScBOxa7r1qKl+0TcM7ojhYr1bwv2alpEiC0Bi62o/iIIGE8HwpfNVQtCf6GCVaoiInNWV9cfSPAFbIvULTe8DyAjuLewaFG2RmbpRb7JPczb7aElxzfDamLhvvBs+vS5E+LhmAYXvO70viVMyzSYt1Vbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lsdal4BH0XDS0wEPClwOn+J7szSCbHiBVvvVhHMGBas=;
 b=jpXm1W6+pyirg695psy6THnR8nPIYW4fCZyHIUX4DLTbkE3p1LNF7KYaoNS6jDNObDS9Fxz2oI1iml8QUHXby+P74Zr/VU+Ws7Km0bSfYINmegtyEA8/g/MwESOZEgJ9ToDTfP+FdCyya9GWM2fjpTNzbeu/V+2RtD5qwvjoyRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:19:58 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:19:58 +0000
From:   carlos.song@nxp.com
To:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: imx-lpi2c: directly return ISR when detect a NACK
Date:   Wed, 26 Jul 2023 17:23:50 +0800
Message-Id: <20230726092350.3432837-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM9PR04MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 5286fa63-5d0a-4288-eade-08db8db97b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E4GMU55r0+KWLkg2VUPvTJWXlu1WFBqSGk7Pkbx+X/G1XWSrUazPehylhiq+95tp64Xep+eixn7ptaVff/0SSCwKhFyKhrT1IJEOj1J0zbi80KAn+Ec41KHcgWNcjyoo8yRz4Tmb5XY4NQrMQcJVeeDrrw6FcV+RZOa4vdShzLVyRbm0diMDhUPBKOgqaHgh/aUjuVuE1iaPEZCYVT5kRqkUqxC9vjkveVefKnt6GtWZ+OYjZh6dpEctLBf9NevHEsUsMzn3d7XoA2zH4beA7MhfBfjDuxXkLR4c8r8qCinxvPNyZfEzUp+9BGm4R+WzUfZHvqCT+p8biHvSm4hbmqBghYb6POiVic1tnds6allLs9MO3xZDv+teJf4BcX9UH/B5vlRTRQieZiM+lGQjv5XaJC0frsxIcyid9Ubzw2+udCUp33EcCj6yqI7HDxCH71VwdEoJAEyrPp/OGZrRqqZ621lDNtUXNAZGhKfDJiCS/QFEwUDJWFBhLBUkVf0Ips70ofI5DX6/SRIzQje1p/8xSh3zmdcMjX4ZDIIsSNac6y0sdQFktVMwNN8mKGNOFhoEiIyf4+g8pMXmao+o3uD/6oNozUsz+dGTx27t+bhXHmL8BAiMMlStAG8o7RQk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(9686003)(6666004)(6512007)(6486002)(52116002)(66946007)(66556008)(4326008)(316002)(478600001)(38350700002)(38100700002)(83380400001)(66476007)(186003)(26005)(1076003)(6506007)(2616005)(36756003)(2906002)(8676002)(8936002)(5660300002)(86362001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dIoxeCzebqQCcUisWOKZyyzJXu1pZcJlQWqYdF8e+tPlHw6h5OFr7NXacJS7?=
 =?us-ascii?Q?THGJ+exH5hnaBK5+LMs0tmRmlH3Q8Am2hjeMWzgT3GNgXlKLkQE3Q6IwrSNR?=
 =?us-ascii?Q?9MwtS+lhg3coM1DsqRl3WhcZ24HiYzK149iCEr6w0O0qckmFd19ZC8H5ErXT?=
 =?us-ascii?Q?sd29ZxVqgf4XH0ArCaHz92mCnBNd+82u0fA3GDM5t+grdE4r4fAZ5cYeke/y?=
 =?us-ascii?Q?nVszG03bRBdkUpbsy3RAXD+XHel5mko6jkBNGkeXq/0SfVnWPCy8nD80BOQ4?=
 =?us-ascii?Q?1XddDw966/7s+OZmS3FKOde1ecF5xAovnUqH16XX5xOKgNbr6aERAe40paDX?=
 =?us-ascii?Q?tDUiUBb/fJEnvAM7lwWeFRfyvL0qYfwzjGTdzneri8Yrq2kAUlJ3CxK14dVl?=
 =?us-ascii?Q?lrJEAwRk1ALD4nATT38PMLjb3i0hxWoghE9pTFXivwMX52EAMciiVcSigCj4?=
 =?us-ascii?Q?YwoAaHt+Z0+TtoVWCArDZhdfQzgdous8HL0+Zn3IEkN4W9Efk/lmRgqe/Pcd?=
 =?us-ascii?Q?YfDnKp7Pxnc+rUhYA+Zdh8EHw429zqvPvZ1rbx+RwlXLqIGuZEDOUVvRxIUu?=
 =?us-ascii?Q?DyEQ9KdDvtOax+CeulY1I9uv6Qn6KoFZ/H/MCjcUyevr3wfoouPlY3oDxB/u?=
 =?us-ascii?Q?1tzgR68q3UeGqerx/zaxBe2Dg58ZMB/fIntNah7+G7sTCGUrXjyRNYTwKOG5?=
 =?us-ascii?Q?JygCOk+VcFBBUJLr03lJXFi1rZZvfmWhL52rl/n5BB4hui/t2ZnMlm3JF66n?=
 =?us-ascii?Q?hfFbO6n+r3SrvO9jdJZ620ReBNOrDDersINgKm5ao5wXR6t4i53nY5ZleDwT?=
 =?us-ascii?Q?HSSh9hiVkYcq+AKLr6WdXtlyDpxH2UGsOEixRNLaPyGhrQfnQFTphjDgSPYu?=
 =?us-ascii?Q?Ms63m72hdXftKMnu3dU4dH2j7EUBOocsRhJQzCFzFF5hHSNiFThVoKMk1NRl?=
 =?us-ascii?Q?BgA7GpKxlatMsTYlxxYtmKQPsqglpnYYzu1CFckPMOtFB8ga72tj/mlaLR5f?=
 =?us-ascii?Q?zYG4e4PtsKJQbzUCLlPiJKOekS5lT+mSldGNSsT2rgH9hF7UXjlk8wsZuRxo?=
 =?us-ascii?Q?vBxc3KmyQWLMYoY5OcZFK4inhc0sU3M9Utp26Gn1ctgzhAXDgPWw3uCEUwIH?=
 =?us-ascii?Q?ui8ACu9BJCqRQon3uvfcP7PEXfzfo+kGwwqhq85KO3MqwBXBsCg4zQ/UEJ7M?=
 =?us-ascii?Q?jMICfCS2CzuGXPvVhdALaz0ksXUjKYZIg/qVyiDDLeJqr9bnXtIoHBZL4Pqk?=
 =?us-ascii?Q?MiDhHwLTQpQT5czXtzx0MQgbNhJX0aR0O+4SvKufs6HW5Hz3rwoSolRpxAZ9?=
 =?us-ascii?Q?aRsGLDw1Y3RIwKghhf/PZJIIbhO/fqSJRu6q/tEIqPl/tcaLLU/0QuVq0aFV?=
 =?us-ascii?Q?s+57qnP7Lk8Td0dtFeNYdtloTVHxq5/hRjcPf8GY3mtqXauJ8IxQZv6RuZ6K?=
 =?us-ascii?Q?X1dqqVD9blv81Kk+YN3H19SK0CIkrIN/yUYS1f/6Cs42eJf6sCZdJXVU81JL?=
 =?us-ascii?Q?kqKUnC9K/3JMFd4W3x7rBSEgVFdvgn5HMii/yPL61/8rBaE2xCF0rRbUaHHF?=
 =?us-ascii?Q?BKaVaRvf/P+3oZ5AfMSp2FwPMV+SYgr9gKM+SSrO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5286fa63-5d0a-4288-eade-08db8db97b74
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:19:58.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZxlJS4msLYqnfBDql6KqLzoQGXFe18oqBab0sEAYEhd5fDmi8SfjbdB24wkT1slb9GAQ6tmGg15dy3O+uAVMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Carlos Song <carlos.song@nxp.com>

A NACK flag in ISR means i2c bus error. In such condition,
there is no need to do read/write operation.

In this patch, i2c will check MSR_NDF, MSR_RDF and MSR_TDF
flag in turn, it's making mutually exclusive NACK/read/write.
So when a NACK is received(MSR_NDF), i2c will return ISR
directly and then stop i2c transfer.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Changes for V3:
- modify commit log
- modify Signed-off-by list
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c3287c887c6f..636ad3247982 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -514,14 +514,12 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	temp = readl(lpi2c_imx->base + LPI2C_MSR);
 	temp &= enabled;
 
-	if (temp & MSR_RDF)
-		lpi2c_imx_read_rxfifo(lpi2c_imx);
-
-	if (temp & MSR_TDF)
-		lpi2c_imx_write_txfifo(lpi2c_imx);
-
 	if (temp & MSR_NDF)
 		complete(&lpi2c_imx->complete);
+	else if (temp & MSR_RDF)
+		lpi2c_imx_read_rxfifo(lpi2c_imx);
+	else if (temp & MSR_TDF)
+		lpi2c_imx_write_txfifo(lpi2c_imx);
 
 	return IRQ_HANDLED;
 }
-- 
2.34.1

