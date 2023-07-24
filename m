Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDF1C75F3D9
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 12:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbjGXKwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 06:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjGXKwR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 06:52:17 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FE0114;
        Mon, 24 Jul 2023 03:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIDUXLIS+Z8roHuO/psqNtBjxnaoZ0LSwU/UVsdN7qqWRXq6RndauSdd+a4LZBtL2WM/h1zB6934VHvUAutEZEIma9gskIwD7w0cEgIyju38dyDUGpQ82K9dBdGp4XNoH4DD9TXFeXEwCEacr9gReetNs3h1fbb76YIwWZW1WT47NWy3TvHJwmkoeagOhBBpa/31oH5Q5Kc6QFLrfzh7ZMeHq2hLmm0HQzBuBDU3lIgqbad0UywNi7cNYpE8g63HuhI/baBpUgy8HK6awu1wvGlx/TQ+Mv5qMTEQzKXfWRv4j1sjAGUSGjolwwuNqgCc9MPsKbaKj83oPLai62O2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B52Xpi9DWPuNoI6324N8OwegJ6KPde7ZbNqimD6I+E=;
 b=lB5MN5JDjUKHadk7s7upEhXU9hkRg2fEmSNQEsgLX2aHn28dJJY90pUO76lwws0afMTOkd9mXy4dJ2i6OMZCgcCjvbqYqIOQkyc9RCuoOliW/yxCkvlwHvXy9LXMj9YE/rAdAHpF281ggCBce7H01b8e1lpFV4fwxXl86oPZA/uZn3BB74IfYgr6G4qdb26xoj2GUbI18XR4fL+EKuQMb2vXwHST9c4E8flwf48Pc9C6qYMlvozmaLsrLZ754EsJbhT31CsZ5mtzLLzrzT4zA4lIejjj9pFunG2NMsRRj8skD4DWz/Rg9E85SUsmxbowoFJKEbn1dH/KSd+hXK00BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B52Xpi9DWPuNoI6324N8OwegJ6KPde7ZbNqimD6I+E=;
 b=L6NkzNU8wUR0x6iVzy5KnCdVDqFE11yJx6J+Gzlsa1MCCB3+gIN55sGPfFOziiX2cvnv+PSgj3rN6ZhWe78czOlS5ehM+0ERV0yi0UIARgzau9gMkJokFTbnwra6eGXcY/sPS9olaRP2GINNGxyMPklEWNLRTteJVyf9hqVQdqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DBAPR04MB7288.eurprd04.prod.outlook.com (2603:10a6:10:1a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:52:06 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620%4]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:52:06 +0000
From:   carlos.song@nxp.com
To:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] i2c: imx-lpi2c: directly return ISR when detect a NACK
Date:   Mon, 24 Jul 2023 18:55:44 +0800
Message-Id: <20230724105546.1964059-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|DBAPR04MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 5185faa0-f32c-4894-2a95-08db8c34057a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: klHiqSx9tAgwVuzsrqOR4qmUsMGRBRkfNZzTiCg4FjoBobrIg00zr2yq0eSGtvrsQafe99fNmRJ0VCnRo5uujkyhjGNGXRn/WzFIMQK2X3OzLubSOvO6HOWugtrPjzWv2qBi4TmbRDcqWjQMQKJUo1sUbwAjBDSptiVQLRRcOomUZvV4gBCSGuQjQyKKsLiFVJqCkv+TMZ159NGNKEY82nAmNFcbh2EdbvWg6r1zpPR7Ra1qvnKTkp1M+X3GCDgYeqNBl8M69bC54F28/eDoVPtMYcYyJhOYL4k/TSf7PHlMxUOUk6qgFQhAjlcpinh5bIZAsc+pONnPBPBLmSqXq+RN2zQ+1PiBkexjic+dGhqVAyvEQwhnM/SZaYR/D2tg1Z82vBTEgAiN3+cUtxtykzaaAcaVIlBCpb3MuOMv1sRPPk/51wIbC7uvVbuXr0rqRS2CASWjk/lKc6IeP0iWEi7bf1JR5v+K45XJPOTOR0B+GxTGDdgoWfSte7pPJHDmVIRQIeQzg1b9A6zPaH7J8DGofUivO6VRUz+s8iPpFzeENFnEvjS5lI4wZVxhqZX3KnUHn2bkKwybysOiRHE+O9VJhah9Vw5FmuwIZspmLqWn9oTsPycBx5DuTrWN+mzA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(41300700001)(8936002)(8676002)(316002)(66556008)(66476007)(66946007)(4326008)(2906002)(478600001)(86362001)(5660300002)(2616005)(6666004)(9686003)(6512007)(6486002)(52116002)(38350700002)(38100700002)(36756003)(83380400001)(26005)(186003)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJSeWJNc1SekrAVCPr7jVMKgsWeVNbQh+3XsGa9dwM+3BUir8+flYCu78ndx?=
 =?us-ascii?Q?oewM0qQrtlBERX99lVgnuNf5vuQW3WRtnBfQQ8C+Q83appOy5ZpbtvG5a24f?=
 =?us-ascii?Q?DqpQ/GIQTz9PydFRHJ9dde3sP45JUycu7W7AG5jqzP4tDBIM9xfk7QJnjbvQ?=
 =?us-ascii?Q?8+AVSzd07ZzBainCpi67hpwoH8D458bXWOp4FhdJWAT/Uy9278Yw4EHnWcXf?=
 =?us-ascii?Q?+ZJUafh7SIeQ2y3gGzZKKhKfmuJq9oF7kVNqvukyLRD72C/oHVBVmz9OJIVI?=
 =?us-ascii?Q?mL0K3Bp4NlESEZb5SwdqM8KZKHJOdKRChTiNTAXvhxPN+fX+p48ZyC64uO3B?=
 =?us-ascii?Q?1tTM+f8lqyb0uzV9sCGR4uuQh7aWKThCHh39uk5Y3UkjYpOYal6hAUj4NP+Z?=
 =?us-ascii?Q?0Vdf1hKZ+Q8yV4AG9lvoICjqmQFqaPg48bwZpg9nW+E/d/dAM4FvI8CuViVa?=
 =?us-ascii?Q?2m21g7fwbJGI4jWmMFvG/PFnG/1xTkwACC3Kn5YGTTA2d8SiXsnSCCB+M+mY?=
 =?us-ascii?Q?hCtkfa27uH5G4G8bNH25wsWgR8mniwcohcBGm61VsJ4XB3A0Ge8VKR0NsZgp?=
 =?us-ascii?Q?ikGrVSmm4DlfEqnVA6bRKICT2Y/9CNSrp5zQPIUXdiiipHwNNuwex7D2f+yp?=
 =?us-ascii?Q?Att9fHg4UoxyJVEg1b85kxiGjm+lljQqAXH7ZXe2zqg1gcOztG7tel9UR+HP?=
 =?us-ascii?Q?yxxKLI+u6qWJf6bkdSI6XPujynuDZiJh/fsatMx52SIokSrpYe0idI+z44Zs?=
 =?us-ascii?Q?fYylDl9+9vMZzElLrq7Ktc9Rk6T5Myvaqruki+2b3iFF7l6hwvCVopZ+Kej0?=
 =?us-ascii?Q?pw1FaFQ8pDFfV4Lrj2sBUXIO8MoNMmVGauUkXdxctRgyzYfi8zRZc4PxgwqL?=
 =?us-ascii?Q?xIFsvdeD56YZ1Pq36ZwRGmZyCteR/5mrqm/eD9AZm0j6a6kWb3AIKojcie1L?=
 =?us-ascii?Q?1/YBiAXNWREIK0eUXO9mrmNyX8t2FAGT/AQ59NJQ16xObwC/0bUxKZFGXyDv?=
 =?us-ascii?Q?55FL7za3/pym/s4d+94tN7o4/u/3c8W/xcjyEU9V91iYHwsGNJG2g4wIVIKF?=
 =?us-ascii?Q?3u12XHUkkvsBVLHmpyfgbBImTUDs05HstDaXVAgnTiX2yZAB4SqxO8UeQ3EM?=
 =?us-ascii?Q?wv154OO93NkrB5OZahyIDisqlFeWXekJII3tll7aDlr7z5EPwi5oUB8BD/WR?=
 =?us-ascii?Q?ZQOFiYC9qqBoesoiNrQr4LqJJGpwXT4z6tsS71Qn6Yp08es5kw9UdSZhUY/R?=
 =?us-ascii?Q?QnWLUyKTaBYEB99QCm1erdDnHhimAeSCF5BXUkrzdreexveQGJrAv8O6JTqM?=
 =?us-ascii?Q?hsSvaHAbvqraUUCikOJj1lx6KcJHoMUnmp+QsR4W7LK/hML9/JaRxbeFa6TS?=
 =?us-ascii?Q?Cu1UNEaRkNdPuvDu90bD7QX5WBwslY9dcKikeffyeSjISS3OfeY42iVaEPsg?=
 =?us-ascii?Q?mb8xsETMxPONNiNw3hBft9OJY6ZAiOMSY+svZZrQL0Es9jZ3QnNNsHxySZlz?=
 =?us-ascii?Q?2MlheT11VYsZUdTg+1uOcGeJE8w25x7CoEa+Oq2Dzv7RtWl3f/lAyeEQAgtw?=
 =?us-ascii?Q?TNCosh+UAf1a2pdMsJYMQ6WJ6b0alUqq3zN3KTnO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5185faa0-f32c-4894-2a95-08db8c34057a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:52:06.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSIry2RRLxWv1Jvyq54WQzYtkNSgV4jVuIMB0ArdV9G+VpSCQ890efRaC2SxGggK2hcv1OEdPrYydsWxGwtfcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7288
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

A NACK flag in ISR means i2c bus error. In such codition,
there is no need to do read/write operation. It's better
to return ISR directly and then stop i2c transfer.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c3287c887c6f..158de0b7f030 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -514,15 +514,14 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	temp = readl(lpi2c_imx->base + LPI2C_MSR);
 	temp &= enabled;
 
-	if (temp & MSR_RDF)
+	if (temp & MSR_NDF) {
+		complete(&lpi2c_imx->complete);
+		return IRQ_HANDLED;
+	} else if (temp & MSR_RDF)
 		lpi2c_imx_read_rxfifo(lpi2c_imx);
-
-	if (temp & MSR_TDF)
+	else if (temp & MSR_TDF)
 		lpi2c_imx_write_txfifo(lpi2c_imx);
 
-	if (temp & MSR_NDF)
-		complete(&lpi2c_imx->complete);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.34.1

