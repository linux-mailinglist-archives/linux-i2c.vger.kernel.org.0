Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F13F751603
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jul 2023 04:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbjGMCFg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 22:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjGMCFf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 22:05:35 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2138.outbound.protection.outlook.com [40.107.215.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB651BEC;
        Wed, 12 Jul 2023 19:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goa4u+T+AxMh4wfai63yzQ1iPv0DjjivhbgB7v62cH5cWxXK9OhEBJqpgxxrQ7CTNVql3Fxi3MvBU/TrIN7wfBXtCjf92sh3eezNjFqTdg3kUAjesZ6mqiQpwPC+hjd5Vz4qSQ1V6zt5Rzt09xXJN6XEohzkEzxGcxMmftuvydWOYhkxbNmEtdfjtAREkWFQ7eGryPjzCGiZCWfu3hyQZ8Q2Sh36U4R6QCmDtBv1oWmdxiXneknPjbprGR36spKT2B6gF1IYli0maibFkipFicLn1A0bezBXKBWidyKQFTqgAaL5aHNTkx77BjPZCwm+lbAxS1extIphHMqMrSMoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52ZDYr2fYT3AsEiqXQFIDPc/lyDEoLZbFKrFSZTL0TE=;
 b=cDv/cVGIgWpWLA8lu/Ev/b4MWJyPgsgHsw9osuBFOCcPcztPi0oYZVwcQKBvwPhEmNtQMwsXO7Ei0Oyyj7wGsLLvAwPjqUWKUs9xH/xfNv2Txl3oIaJ4RNPJCvbUDzSqacnjaTL/9xnyyQ337CJEElsvkRS4YKGw/HaBRwNsViBD5vyU2ttqvDiy9epA/bpRqCSwFgbUrhG860p8q6sHZT8ADZxpOJ1BGR/AdHP3nazj+aPMaKmMLLlWDzdEHR9AeUX/2TjVtRfTeqDFPn2bsPESYX6Se8i4/oA3pXLQIVti8l3buNgVjmtVpl0WrxwGRyERyqklPiUBOwLbYS5QjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52ZDYr2fYT3AsEiqXQFIDPc/lyDEoLZbFKrFSZTL0TE=;
 b=Y3w0x/xFsTwWKRWt1IRfJ3Va5l98aCf8fWDeK9hxW5MycsN9Q7aeO1ejEe/Pfmyn0MDYgbcIdABwObWlq983k/Ex9wmfBwmwlngXXBos9Qh42SyezDvIKXou3NyOQghQPdN/EJjs/gV8Cj+uo53P58SxVXg6CgAUqKFTv1wG8vI2+ul9A841Yg5230W+5OnksP3k/I9B67tF7jqE8GgSWB5GqqU6dqg8P1zLPP9Zabloe6+/7yTGip/XHXEq985TlTgTGhdIJ9lceCpSM6pFBKLfpp3MxEJXLI3js/FEB0PWTtkdYSwOBg+pPLcsnMlcZ14IZfh2FdnPJ9DGZBvlqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 SEYPR06MB5421.apcprd06.prod.outlook.com (2603:1096:101:68::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.31; Thu, 13 Jul 2023 02:05:26 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 02:05:26 +0000
From:   Minjie Du <duminjie@vivo.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Cc:     opensource.kernel@vivo.com, stable@vger.kernel.org,
        Minjie Du <duminjie@vivo.com>
Subject: [PATCH v3] i2c: busses: fix parameter check in i2c_gpio_fault_injector_init()
Date:   Thu, 13 Jul 2023 10:05:17 +0800
Message-Id: <20230713020517.614-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:404:a6::29) To SG2PR06MB5288.apcprd06.prod.outlook.com
 (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|SEYPR06MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: cfcd6a0e-32a9-46e3-59d5-08db8345a017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ls2GFsACG9kPlyMGQLMPl53FKViP9qoRsfaxybZXRbJLS2fvnQDW95efj8edb/UF6MMLkGBpsxVkhdOsOP7dusBfcZlOsLtGm7PPJ8BQ3vvbzIw+pAJDfZiqgFZlqELiib1MvpmPqr5k3e9iAK9SqlWM672OD23i97N+Oi9S1w6QTifeMxHZVOg8hMRvYqhTwQwggCKUCG1cqYqTZBS9l6exz4UGqRk2OVLUSY7/4Z6Pyw03djwRYK+bcw/3hiiXfewcnD8+I/nZnKB5EHMMEpJJCzyPB/6yVOmTCG1PFaF2r2szuXJKXr//C1JBG+NPSVsFpcInGYcYkwpHMG4AX1XSleGWraPEzjQ6KEcwMxU9OAds8aLnDSZYRBef5qxNZTzS4Wlb/c8NYm2HIGX10kTrWylQyUAxs+JvftmH6g9AHsNcoZnp70QVbPqtgg1vWSj3kv4W89bBNP3Hd3U23vfGsFsWjOiQDdVr2SMyaOBe+uABOWHk7GVEqg1T6Rmx/l05h1hcynkObU2G8BMIpAKwE0ls+svrrduxUJVPic97sIlqHcZnQSe+S5V84EDoNyYteuLkO5fV08cgWe1/B+9Fin3G3ERp+7uoLjdB8wU/6dv7Bkg63n/ZG6L7smcR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(8676002)(8936002)(41300700001)(6666004)(110136005)(5660300002)(316002)(2906002)(4744005)(6486002)(4326008)(66556008)(66476007)(66946007)(6512007)(52116002)(478600001)(36756003)(107886003)(186003)(86362001)(38350700002)(38100700002)(83380400001)(2616005)(1076003)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r9/eBDrMVDTc/UNJOVTB9W6feyKKoMO84fh05lIqJWBtafOqG3FIrb10vZWS?=
 =?us-ascii?Q?oVMLazWhRq+3YbDK5V7fTvJcREmXewnop/kAKXBhRtuoyJZ3dCyHUHkXJ3j5?=
 =?us-ascii?Q?Rr8vpTwidTJD5DPSOvYIMIE9J7lKxg/QVKiGRS651xAzul6V8L3a4FakqwB3?=
 =?us-ascii?Q?FR8sURA6WFaBA2hUrm4IhFCgomUrfxcAZ6HTodEzEoWgBPHG5IKKMEzctj3S?=
 =?us-ascii?Q?7b8t9Q/JLQ57m0s0yBRROeAXu9AAc5yHsdoXueWHA8m7elKE2nT91N0FYsuU?=
 =?us-ascii?Q?6zQ4eOiL4i8+Dxx11ei0Od4zxMzxV7PDbfpZOc9SuPLI6xtqnvrfii9VYlyn?=
 =?us-ascii?Q?RWNVvqV5da2Z/Fkz2Mjr3tjYHRoO2nv1fcJiZquT6B/xa1FYh591Xa26HeNJ?=
 =?us-ascii?Q?VrlE15Hsn0K7dgMU6zWJaLI9410H/cv4EHgkCuwUYKf96DsQ5UMtt6UIcek9?=
 =?us-ascii?Q?B0OZfUPmLCzL1GOUSvOv2s0N4PyZG9jBvX+7+6RLXm5baRbktigNTC5MHFTE?=
 =?us-ascii?Q?X9rD2DRA45NCibV5nV1ClQoi8RMvpP8UOsSUgjAY/S1BMYM9Gk+BowLxcI9v?=
 =?us-ascii?Q?F9Zen+7UMLkI+MWzqmjpEV1FP3v9nMM9CrwbQjMi/w5ItgmhZkFiQbBvylYo?=
 =?us-ascii?Q?w2MO90qchyAg8cFKcggRknb7+Xuv8mcyXlaQ9U4sBO9AktTVx7qvTZKQeEAM?=
 =?us-ascii?Q?FXopK+hq1gcE5rptipQygW3wpX1eJ47AmBkWVkQyoy3HuBERWCNIIP28VY/s?=
 =?us-ascii?Q?gbaKQFq14OhDpi9p7JOqo9bIQUTEB2G97bW8Dgy2Y0Qpq53AqX1cXZHsdICQ?=
 =?us-ascii?Q?PBrOlc+O4LD9hQvIRQfblEusiQkVSvsnVvAnfz82FSPocGCErNJIkZhTAjCT?=
 =?us-ascii?Q?ClBpSZqHG9MnhU5hcSgIN4SVrptcChSazEB50G8JwBDdefIJTaYM432tTODL?=
 =?us-ascii?Q?kW8B/fhlTBp53FanaJnLch+bCIgysnubihPgcymizNOgiO7b2Cp+R/TyRyXD?=
 =?us-ascii?Q?xBDDJmmitMS+tAYIpaMiqOJCX0GDH/TiQWER4WOKppIf8x0LK7hx1cNwIhoT?=
 =?us-ascii?Q?a72t+OVAMVkvHaIJ99hd8bjwOfc42a4nRPSL59Ufc75HC0NBmEjFBjnVWpvA?=
 =?us-ascii?Q?zTIz1V5UhPh+XRmk5ChgWzqiGjTlUcEy3za12+1ZNHyyS3P696aMXQUhS8+F?=
 =?us-ascii?Q?zH2/3aPVhG90SUFQbA8iTOX84P1pRbpi3+YoGD6DpDuSn0PuzTGSYsvcXTwM?=
 =?us-ascii?Q?Twg8O52ixPBIKFk1RkfM22pHDWiwwftnmxjO5ELdjwBml/7I1DifKbhqaxef?=
 =?us-ascii?Q?9fdniyvQghw8eh7RuTga6sq1bUlHZMfsWLnLUnoZmszaTxkdr5ysZgDR0QSL?=
 =?us-ascii?Q?hYJLcr+mdsiZWItlYY8TcWnZcV+mgVlajAypTihYUMVC7bnVzydrY5zTr29Y?=
 =?us-ascii?Q?F4f39zsCDhOSYHB6V6Gg6dihr+MgslKKAoNolN3YI0poHpRpSxXYTTkq2Aw+?=
 =?us-ascii?Q?MxRKB+pazgZCDo8jSbN5fXLMWpcRjdVt77REPsWVIiieGdo0/hS2Z1N7vu4O?=
 =?us-ascii?Q?2Xt+Abdtf6DkRhmenDzMkTcLIYUrZN2/IAyTEH5p?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfcd6a0e-32a9-46e3-59d5-08db8345a017
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 02:05:26.6924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVZozgSiaXGlISpKh58sRlyyPUC/oBWCcmY2N09RjTEjJARrPPDNwvAQijjXpIltHI17he5uw0ChUMTuJMj4FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5421
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Make IS_ERR() judge the debugfs_create_dir() function return.
Fixes: 14911c6f48ec ("i2c: gpio: add fault injector")
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: <stable@vger.kernel.org> # v4.16+

Signed-off-by: Minjie Du <duminjie@vivo.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
v1-v2:
Fix judge typo.
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index e5a5b9e8b..545927b96 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -265,7 +265,7 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	 */
 	if (!i2c_gpio_debug_dir) {
 		i2c_gpio_debug_dir = debugfs_create_dir("i2c-fault-injector", NULL);
-		if (!i2c_gpio_debug_dir)
+		if (IS_ERR(i2c_gpio_debug_dir))
 			return;
 	}
 
-- 
2.39.0

