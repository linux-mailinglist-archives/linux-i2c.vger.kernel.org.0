Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5BA74857C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbjGENwo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjGENwd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:52:33 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB6C19A6;
        Wed,  5 Jul 2023 06:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzGPHifEPhEDp66U5GhJtqT3heu/dSX4QfUaCZ0T5VdwpTigkzDnp8eepKHpOF/gVCNhOKZMdSs1w6i+W6Z1jQUjqywuSXc0uLWpIcAtmkcENWnurGxp0nFiQyjZlYdI0ApFGRhj98ELO3Z3VZ1ZEc8z4YuKqP48k4CVCb9mTMkBtniHQnVCtIilrsryw/IR2X7eJSK/03jNZ5LRb8m0xhqr3PvzCdZA4l8MyP+XfOseUpjTH0UcSmiQx14Oy+XqmnlaOAn5BJ9BdmjtSE+TOD0PelmkAwwhynE97aD5UxLlz0w9UapXb2cqbvNWCCi3w4CMo+GWlbRksXEfUIfK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi6TzN2hL0vt3qrUYbV1lXQWxJA8TiWxiQ0uLCPdZRg=;
 b=UifFbtDbyDEQAsQchqEbm1QHI6RcrUkKDyxWur508VQWKk/ZYG1DnY545Ibmv052D+gTwH+obLn1a8Es6WBT/uJ4Mes0BUo54UQlmSPjTUsvZzr6h91teLPhGVSk2XQzowg7C6RD1iEuJAqRvzWYuaec29kqXpRETJv1zT86lZU29RkRmbqJ7cI6QnUSxmfPW0lLj17qDPcIV6jfy1kS0KTJRQRBNnwQtolAm2DjPoANZx6EzU2CyRe2k84wLloGzYNMS/vU3GRH+WAHYfcaS+iD7URdD71jUaE1G/OSriBNoxOo36v2FmBS0Dvcy/vMTK1H2tHw9ro6vPk8fLuZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi6TzN2hL0vt3qrUYbV1lXQWxJA8TiWxiQ0uLCPdZRg=;
 b=kjGUwEVJH23JEQJc1Wl0KsfWXx6+9mNa3vxujHdnojSQSvItP2mUc8fUuL2JHKimHAiqX/EXg6xPeGb1r0vsQDI76sxuP/Va+TEFXfBHqUdG881MRnoZiTFhzguvsKwUBWR6kwOnyxSXe9y343mMlKfO9jb+s6EUCDJGOLbO+pUHnMEwK6KdzRI4glpKB9/0Kg5gSH6USMdljRn/uaDuupNKAMXF9bIL/JyCmdjwX2C2dxP7WP1FdHC7pgqtktCiVmKDDJlo54KON4iNKU19FBEMy7GoqUH483iLjWY6awn6MZ/S/q5cR65MMxcXLh9mdI165zb18REF6oeFtxDhmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:19 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] i2c: s3c2410: Use devm_platform_get_and_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:56 +0800
Message-Id: <20230705135159.33327-9-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230705135159.33327-1-frank.li@vivo.com>
References: <20230705135159.33327-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:2::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB3991:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bda0aaf-8e40-41dc-5f41-08db7d5f0c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HSw2htB2RHaqDULWqcb2VGHP+X5CcwmuhsodCWIWjREcgQIh7i/HbEsmDDGjkz6U1cG2JY5cDMR6D0sUcBy9FFTmpFpcaossYYQ/hPhvcCtybA/AxS413PzlJBVjQprfSbXmUlcdSsKNkS03RNNRszoAaFp2Mg0dtxhk28nipZrS70aGkecoVPlnBKaFDYcV/I0l3WZ9xn9HEn7PfAiQI4xWAczniRqm2euZNY6e/jL/nDKIMJLPtB2lVRxx5dfRfexBJ6Ksai8D0MoJz2BIEDP1LWIlU6m/DZrkYShq+XxNsUx0Tojyakb0jQQUeAhbKvD0bW7zb4NnLHrXjdjPScjcvCMGx/d+186ci7MbVy4kXx7RWrUZxeVBnchHOSDD7WS3LrtdLIBteFGyOFzJ5pCnStvUS1Kh4bg/gaF+QJuu2eAcHvHjdXK/vyiCmXseOvyzIO6JYsv1Tv7NUfCRr1zaGUUuQLYP8oB08nlyyiiF3FQvMYjlEpRIAsVmm4IhcD6gWDtZ9OSMdSvUYrhz5PiT0LaM/O4CvKRczuJ8AtOmROQPt/mj0T4ZiP8AU3CO8P0vA+bjJW9932Q07nvDcVQsXqxJyurf2qjrDs3DogErjmGIisLt/NJDXjIzDNBO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(4744005)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g5sQwXUIVmVXagbSEn0lRLbv6UH3paFIH8yB5XjVxa6m73sHX3+hcz+Ahj+P?=
 =?us-ascii?Q?jWiu8rirXuMGWKSwKYUQ88yqcBzE9iHRJuV2NyiprVSCfduZoUYUllw3mzeo?=
 =?us-ascii?Q?lp3uP37EZW1E3f5FPeu8rqbKXfCoLXTbPjSt6Eth6KC7G1Pg8sjG2mM9rCcy?=
 =?us-ascii?Q?MhAyD78fyOUxDIxaeqRs0c57sD81WS4u/l+EsaI9OySnF1m/on0P482ehNb1?=
 =?us-ascii?Q?s71Vc59RoyEsmf+nDaTSTiFOcucS/4CP0KZ61Lt7BjCOuHOKjSXP1d3ObprO?=
 =?us-ascii?Q?sFIjDH/hwSkSkJKsxKhLoi0AXt+L9dFkiASj46x1Y7al+eu3a5Zgp9k6u9Rt?=
 =?us-ascii?Q?p7mbA4kcGlx3m7YTN6cnyZfrd/q/p1v9XX//NTFo0qvC5xUrtPsU8vv75ypb?=
 =?us-ascii?Q?qah8xQjg4Y/FJD7x8P1A7A1siSBCZwOTJgVBILYXipR3zDXruX3aUu4TyzcR?=
 =?us-ascii?Q?vPkLxI5dDEx3cplzN7+eAAs8qN5ngyC21dV8IZot0ZMdncm70D81+7B8Wtjc?=
 =?us-ascii?Q?pJGioNi0+WvcRxXbnjC6+7yg43EjvJB9ezigxUXffW48kD/zME07tFlBygfd?=
 =?us-ascii?Q?Zq0vaPDi9xQE1omSxJ5nB3IsB7eCQ2okBzk0lhnOdvha46pEc5SZVNl2uM3P?=
 =?us-ascii?Q?TNWkj+lPZF0rKqbHnHxpaHEWnJiWWhZ/HPZeTIlY0sRodzFsOgPQRMkoHuPI?=
 =?us-ascii?Q?wk6tDj7M9xjjv3c+T6Bbvqr+GafUaZFBuhHZWQ+EMmTXUUCUhSA6Hx+IWdIu?=
 =?us-ascii?Q?x9DowSBVKYfUtY36hcb7g3hBpM91xz0dC0+SFe3Tl0q8vg4J0K3FLqY0T+Ta?=
 =?us-ascii?Q?2tPpDctVsD69Vh3R4LBNTvYAW+u1TBdcWpKbi5ebvjcyCi325ZP/rGpy4T5c?=
 =?us-ascii?Q?BbrZRLrU5zVM/yq0/0cs/Tu6T3oG3pHr/cj/2zCwSrtnJsBDKJwKqAWzaRwV?=
 =?us-ascii?Q?F9nbXvcS4TiTeK2NDgM2+1oyTy0oqhj60FjFzeX6bzgssPxyrCOK0mXA2xME?=
 =?us-ascii?Q?d8AJ81H//L0s97OCS3RSvyoWxdIWZx3bHfznzk7BGbBXGD5JIsCc8fLXESLM?=
 =?us-ascii?Q?aTmZhjAtvfAF4od0o/Fb7T6J2/NlibdqXHUQPq9BSnbfR0Q1doT/KxZ+JL+7?=
 =?us-ascii?Q?UdJTgGD82TYj6Cr0bxOOV+ac5u79DuehQKQXeN97OnSNJ+gLJjFP253yW0Bf?=
 =?us-ascii?Q?lB67vmlWsKB651xcUgJfd7dp/T0XBU4Yooxc9UCrcp+bvOw3GQEjGpt70P2E?=
 =?us-ascii?Q?M+KXAayIe445Ns//tNKePKjQgJQNmlhPOKPV5oGyoby8XEoTGUhJmUwj2ukP?=
 =?us-ascii?Q?laMCiEWQNcvyptLClur9fm4ZlEs/2nctPUnE0+/0EcTbH1tmR0jAyeaVYOtG?=
 =?us-ascii?Q?wteJePqP3pIltHRw0DNrnrL2jz0y56uSwKa9+F2elmozpEOo/RDYgaHMwgtO?=
 =?us-ascii?Q?ZpdfZrDqPdcHM4HH3SuzhiBV0/gvI6KpMv/p7Yt06dlkjS5xLD5eApvqF06F?=
 =?us-ascii?Q?/vC1WxDFe83vojQ/zJciLeT/gyPMQ61C3tsKZR4bfC6jGY7Hj6uG9z2GiB6U?=
 =?us-ascii?Q?a+N2JMmR0Lb9JJrE8t/u84F+hS1RIKC2xq/oct4W?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bda0aaf-8e40-41dc-5f41-08db7d5f0c88
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:19.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSrWeIRx+t3hx/gOhdcp6QIvM71ItIFov2Ccuyti7bF1B19WdlB/MeZsMdfJ5JMV+sw9bDNL5Kbg2cbmygWloQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3991
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 28f0e5c64f32..c14c3807e135 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1034,9 +1034,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "clock source %p\n", i2c->clk);
 
 	/* map the registers */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, res);
-
+	i2c->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-- 
2.39.0

