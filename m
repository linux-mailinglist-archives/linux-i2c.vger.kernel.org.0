Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC16D764417
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 05:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjG0DAH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 23:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbjG0DAE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 23:00:04 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2088.outbound.protection.outlook.com [40.107.104.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792121BCB;
        Wed, 26 Jul 2023 20:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOWMH1+DT9b+cZq15aSoFGjXAMrjKkM+T7N2zB2/Q6cpQZ3QD8bIf29UAbeyX24kNbnNpidKOAOscGzdXeARu7adwz21YM7bqC33HRa8lHmGFi0flmPhGmlsNUmWvRryLEHbhvIbemSiv4gH+UxlIncqfgQPnP8b8WvqlsB8uRlsEyRB9jupimcLHgE6I7VYtfeSJfy8FlU7dCzNeELRnmKd3l4sqyZIlDYLbadlgKeovNNPeGHWJjqDLEv9POkNem6CyyYS4Qpx1EeXyeL8UKdIokHm8WbWWJCWezw9Xm3gLmoyuut7SNnroWYwO+5tDim+VfmmtRIgovsnrpZ/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/gx94XGuv9bsYJzsFWSDpd4ivJxor3uYmCS54gD/Do=;
 b=KIzF5boDUTaRdaROxZoq3pVeRMfcNnL851K2habOLtWrv1H9mEySiXcYuLupiPoSOh1zTd7X2U4lk1Rh6ulC4EskkxvgQpSBqTVscUkfAAaNTmIz/73oMWcuHgj4+Pro3N1P0I1HGTJb3NT1mU1E9jwEliZExZHwRlS8L5ta57RwrcPNlmgeQiQcSHQ+9feD/XdOoHpyg6i2P7IXQ+Wc6UzwxCYXh/DZOdeTL88q2dldWwU0FFKKPXWwJi06uAVN0oyvGYvlbRaFgHm5roEUtPll1yV5dPsb/3uFrdZ/iPrtfydrBFcFM681U8s+zrgAjyPcmQUPUaK/LJrVoj5OFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/gx94XGuv9bsYJzsFWSDpd4ivJxor3uYmCS54gD/Do=;
 b=mttTRB79HmqH9kSJ0bRxYJszgf71w8lKtJMtxQSU7R9JdGAk9YPCq67Dv6fl4Zof3JToBK53R+bzORa2eUTP0uW0h3W7Fgb2KUoUJvvZz0/3Q/+ojcvCNwa7U6wmprhbjt/qeBevK+IOQqloZUnBFFNURDn985FjGgRvAgkOp10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM9PR04MB8259.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 03:00:01 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4%3]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 03:00:01 +0000
From:   carlos.song@nxp.com
To:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: imx-lpi2c: directly return ISR when detect a NACK
Date:   Thu, 27 Jul 2023 11:03:47 +0800
Message-Id: <20230727030347.3552992-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0233.apcprd06.prod.outlook.com
 (2603:1096:4:ac::17) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM9PR04MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 860ba24d-944d-40e2-d9c1-08db8e4d9175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9uQd/EINC0aBZ0PN1REWIy4Rx33muOecJocIXZ5MLnWroVvvGm8E2eyZMISotEL+FyD7kaKB1Kt0p70ZDmy4qUow51MMEK1FNsOIF+5U5L9xGOU7AmKeDjgA8PwoiE2bE3R7cpLMQdgQOCc3U3SAzDZ3Ah44QGBNcYfvXynZwgoTpKrSfoEj5y7IJBJu3JxY7cRAJLfI5FjQ6yXHbSGb3paW/ysrvg66oXpWqdWODMEHsdfUnApZDok4YcUqzsTt2g/zDx8rptwpR12G43xMhj8CuVYgXuo9Iup5YIxNorsQFkNQ2K3msZ+0WybS6eK1mmqBj38ETVhhaOJmY1VC1eJ3bJVVv56lEtQ0rW7jdPWtL1ftq+zPSfIIF4o5gV57WmV81fVKdzXBMx6y8L7I98vmcGcWx9FTiVO9Jn2EiZiKMp3+r+AZB9Qmyrz6BZNERFvj73JepjfrF5d5hqmK7Tua+o4qaDx9iA35ditetTm7deszj00nbhbfMRwytX+JHvOuNtUWrFEB+gqeOthkTIzfWgFITcm3gS2p8ivCqxKgtwjs4IplFJUvgR87/f9p3RgdY23nZ6Pbe82+zcJQXagfH97MtUOL6qgfNOKqC5xb1i72er8ux61oikpQjA5a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(52116002)(478600001)(9686003)(6486002)(6512007)(6666004)(26005)(186003)(1076003)(6506007)(2616005)(2906002)(66556008)(66476007)(316002)(4326008)(5660300002)(8936002)(66946007)(41300700001)(8676002)(38350700002)(38100700002)(86362001)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sUM8BozRvX0NzQPgZ7oSGaVw5ZTB3ywlkTMJmuO57nNFqZOWNpdoPJFgk9l2?=
 =?us-ascii?Q?LXugFwNc8vDLedDJcDuapjV82cQplrR4xTDj14MmcOybWU0Oz5hxDQZQjODa?=
 =?us-ascii?Q?OhrRD4kB6ysoy5D0Ds0QsWeHHRaiBzh/uKTMn1+TVL0OkbyJx4CwxK9ljlNP?=
 =?us-ascii?Q?/m13Krd2TZAiku3J/ab9ZjHfZlAyEAAmKedq05UPQIPtrB26Yw0ZFgQY2CCT?=
 =?us-ascii?Q?c3EGN2MWbAvOq2IRro2i+9W7ebBXneyfthVQVwS/h6lDNgtY3p7LgGGMRj1m?=
 =?us-ascii?Q?jaIsY5U5tPK3eemfGE0Uj48XlnuwPdCPzOwjFo8dvtEQWX3tFRIFEWicO+eA?=
 =?us-ascii?Q?qDsG9nl7oy+FvgZTCrelViPY9+KhXFNv96fHWlh/GCHOaisVoUKXWD7yxHIx?=
 =?us-ascii?Q?nSH+vXd8Or8NwKDEmNhHuBrdWIPyKgflFeiwd7BtPN2r0VXLSLHejhzv+m85?=
 =?us-ascii?Q?scRC4lM6bEGipsaMWrZjvKt2Pp0z5U6vxisAgAVe777LFrHDH5Dn89ATnImj?=
 =?us-ascii?Q?ce5nnLkO9tv7Vw/BbtH6aXAblbNc9lhNxdRLq2gvXvJOMFMCUnEflLEokEFi?=
 =?us-ascii?Q?ctVBnZVTT+zcTbsDIHdCTEZbjp6iRunIimk55YKyq2PzaSO/D4EswoWiZt7N?=
 =?us-ascii?Q?9IG/IqLaLy0VtbX6RpoMxRIAUpKZdO+Wf7BVcbdlsrkaX1fKrvs1BnYmqlKO?=
 =?us-ascii?Q?WGUvdp6nHhFFakmaGwGN8zQn7OAc78WQzX/g4Nw1IWwL2qgQl04ihCrM/KDf?=
 =?us-ascii?Q?t6YoMzQ5ZW2Fasn038zKngglagBf+9FwI6mtltUpXW3rgivV61fybIW5wkcl?=
 =?us-ascii?Q?gsbfaUym7iRt5tzQz8omsyBHjSCLd+zAt/K2W+56AJfg9XLVd5UgwpfzB1wt?=
 =?us-ascii?Q?Lv5Oma3GbJAv4RyPoKJRQXIwRpigpItBA1ixyUjn4GyzURt2d9CJ3J2Gy55j?=
 =?us-ascii?Q?XdG9a358/tpt8sxXmcBRNxgBjx6mCs+I7e0f/d7ptEBsxNgrYs03pLUaiB0g?=
 =?us-ascii?Q?51vW1jugfy3C+hoBEVB5/XErDPra4x2uwz8YfyOeYHXesydcuGzAEB/ErVZ7?=
 =?us-ascii?Q?NaybhXGyJSeU8dKrm0X2Y7uSbdF48YEtLjAZdFdKlrpoaCm1iPp1yH8kbwlp?=
 =?us-ascii?Q?3Q3+hP3O+n+IooYVabBpBC/7ftN+U/pfzsKwUIff5bicE4BvwIyhVk8H3sNI?=
 =?us-ascii?Q?V+wYTnE9a1vWkc1hTJkO1sDd+tB2NRIBCypE55/4gmf/t6clq3twLAUwW30V?=
 =?us-ascii?Q?Dv/E1k3O6M6v4J+2XLdP8/0VUVroBBTcGfGCMlI8koAW9yKc/EZm3e1tmG1b?=
 =?us-ascii?Q?Mf1Sy8h0gSXREqq52u1/o6ZwMnEs4FTFBSVowOKc9lWawzbmLdDN8/wG56NA?=
 =?us-ascii?Q?XJP2bkvqRDyg0LvhwkS+2rUtrwzm3TGdEpW3DdM/cqrNmVJa4Qhs9a9Ankth?=
 =?us-ascii?Q?lcRIFNJ+iTBQwYDr7baC8/+jlwX6y6JYC8IJ1vznNZ5hN+AZX++JC9gR3RA0?=
 =?us-ascii?Q?LIJPATyR0OQTgQ0ZSUfW0fC4xENi5sXTku5f3mAjT4Jm0S/Dv4zwFV/LFEuY?=
 =?us-ascii?Q?TtNZweTZcqTnNEavBRENRXMmCfip50ResQUjsHES?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860ba24d-944d-40e2-d9c1-08db8e4d9175
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 03:00:01.0731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9PlSXb4hIM92WDx6IiXdMxjJGwZfa3N8VX/rRQGCHQacTJxHY5qghr9uHz3NAyJoJNs3i87LlcKctBY5V8NEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8259
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 150d923ca7f1..9a3e3a1bc4ee 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -517,14 +517,12 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
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

