Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD675748579
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbjGENwe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbjGENwa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:52:30 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C36C173E;
        Wed,  5 Jul 2023 06:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZkNCGy8auo+XFQTi1vDXWmTzYMesK1Va+0fEdq+2Pnb+CblCqJhMZhfQcKGdofnL37NGQDAi3PNOnZs5Qmxgi3CZcTpfydscNdnHNFhlVLqL7ui8bu69TwogzDXffsUCmsXd7XIBD6edd/5XA682j+OHM/qEjfuqyrXJWpJdnzFDT2peQjRCoIL+kVCT3arTmRrio04LhiEfBg8OA/2pzD+NlNvugh5W/uMR1uyN+HrctYbYZssoitVENUft/C7wLKhqAWOHraSNEs36HQVA2B1AcZ4vsGN2Pw5EDs0XLtS2kKkvtWtbIG1qK4AUoH88sqLe2hE22ILKLtNUR7SlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNgMkAVszr2VHTFJZOTnggT/8att7Um9d/tkp8iyTeo=;
 b=QA+rnXJOPXWQLU7Yx16Zinxgj0iYrsSXazyYlbm2xPrFdkR9W9OcypnE6Gjd1Q2PFh3CY5gTgMW0pmTyTsMXT5JEMGY21SoQRVLYUP9Ngfq5zQbQWZlTxPIbAgLiQXbZUEjA8ItkM1YhhJhuhrDyFnTpEE2tTcBQVXpKZGgPNVwEpRVg1cRldD1wDoMUNakzH15Yfegph+3V3jH1rcy2ojyssupULZeiuYdAmd8zjfSq3DPha1phsu2lrHNDTE3dkYAi6xmGiRrbccC8IV0Wnd0TAdZ3Rra8hcbBRyMIyCCsRs3YNSvdES/cS4zz2lkQx08E8b9ZDuFBZQEAbQUgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNgMkAVszr2VHTFJZOTnggT/8att7Um9d/tkp8iyTeo=;
 b=cIMruj38BB6eBY34hlpsYtTT8LIzWO24QE3uDiYHm976uwOEZP22FRwEWEGnOjBFXjQnhZCclPcs53yhwGN/Q9XqeydNUYxU8Uc8i2LwFFGxifDjm7upOiDM+j3E4f76ZvjlnlQr3g8XCXCBG59xNqkY0QbTUNDLz3cFiBRjYgmkB03c/adgbmFZEXB2+ZhfXOJ8gnZQAwVYfLKqYfd/7oqakHPjizJt4nWb/doV7gts6ojg5skdQldEZ445lzjzTjDJ3+nopwJWd0Ct3kCRaAF6Jbjzcz2Uv4xcq/r3VvoDxPa9cFC3bKoSDSBwPYQ94pZuhawYWDa7WlhxxnmkAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:17 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] i2c: sh_mobile: Use devm_platform_get_and_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:55 +0800
Message-Id: <20230705135159.33327-8-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: be1328c1-184e-4c7a-37e7-08db7d5f0bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PCc69yQLv+FLOF8jIvsf/VTQi4V/ChXgZi/mbETUQ9qlF2MyUrWceScBLm0xBzrsUYEaRtHA28CbiPNEAoguDVUl3uDzuPWKpeWbPDqF+9VkyCfTqS4+TSJgCGxr4/mTQAZ/Zd5CQO72JpNyrGBepvNPd5vmNytfOLbw96k+yhmZoiHC0Rwsae2oAJAjs/Dc1eDYtHs98Tkef0I2Lmx4jpX5BHHJGkXCHWmEoKBpatki7p3Brql8X6cMZ/bnTZZBMmijwvppx4BiguR/jwSZWVQxU2A8OFGxARVXZTkAlfK/i6MsQJXMSrwfQFnZDwVWtqHkAkqXcFm0jNqmtliRpMyb3rBLfBclNVbrT4nIejbDqXO3UVWdlZVjwqglqgGF7+QQDKovowATjo7dsQP8we+hK62o1gYORlILQZC+43/TZS3pfqeyW81vTXzrsCyOX5dHT0eSwhF0CwNd6yEWRqbV8I/9l66z0749EPYIL7PeY8rsphE3JrKW0QA0yEBamTWGmPOElX19t3Dfc31Dj5fsw0Jg5/ES8fMzCfNBGdWs0AyfyXUaeP2iheKpT955tkTH+p6b/UJW45VoGYenoSvUe/KSpyvAIHsStTNlDN3kxpVmTYp/q7o6Eeyakc/X
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dOWUuJPgM+wgI0NN2TY5j2awfYqRU9oXBA0rO6XrO+/6usjdVywT6kD5NGNG?=
 =?us-ascii?Q?PaRuBr8WLdgWZpMpp99YC4pkCRDP9cYPnerT2F1iz1mi/pb+UyT6cT4vFM83?=
 =?us-ascii?Q?N6wZ9w5u/bfmFjI5R8tM8EfhD1cXfyR4Qs0A9ZATN+y12zmPGqXV5OApZkiz?=
 =?us-ascii?Q?ei8iBYybds7TaqiNvnMf5MxUEp6zvZ90ayesW+0tAkyIe1uy1SYLhi3K9zCM?=
 =?us-ascii?Q?uBgna93XXx/rO7m5dX7z3SijvPV3eZ9fNVN//7RI9gdC2TG4EDMzEdBQ6bF4?=
 =?us-ascii?Q?pszcI6UaHiHG7rQUjWIqrZ9k6z7pgUISNwspF7861I5JRcaylhPQ6ygaBFWo?=
 =?us-ascii?Q?soyKKOV/vIU7SArbFL158JMiWdccfM+yBQyc/0cVJWvz9hLV/JOWnlxrrACP?=
 =?us-ascii?Q?T2YEoScQBjMwfdvijK952AYgKIEG+KYFDhHBlyj1BYiYNbaV8F+9weYm/KR3?=
 =?us-ascii?Q?l+UkfCxLJE/X2GYgRMX9dwTju4DjIB9fhlEmHHt0xsd7iTq234QhkMNRO1BD?=
 =?us-ascii?Q?xj7Pnq3MpYXXYwUAX2Islw+rLZpkQS3mbyZl0DNLrTddc070DQDoTL65FxTm?=
 =?us-ascii?Q?QIZrMOU0FPA95b57eSgZtk1cX3Myo6H7X/nlFD8+CQoduoDCLMG0yy80i1Nd?=
 =?us-ascii?Q?TW/tjF2+9GEdBKX2s9SuLA6W7MyMgPj4z4v14iLXnfEb4BtTUB7ZOSdgVkq3?=
 =?us-ascii?Q?Id5hPA84e1hWEEHbf+mTaaf73rp6hYw3X0OYknf1qVtAIRiUwoZpXr9S1HXh?=
 =?us-ascii?Q?Nox5cJgQFF/8VRtpCNRbW90b+FRC9X9+d/VJwuRKulVkeGWe3m9esIbpCI1j?=
 =?us-ascii?Q?Pl4Y2hwd8ReXJuM58bCp9u05xt2EFEOEr9lJDe7LGxwNxLSYRWHLRfIn1yEh?=
 =?us-ascii?Q?jO1lUFPY3U1QQBuWBemrSRbuPOJ+3kwFhGxkFiQtyoz7hfBuNbbJjPQvh8SJ?=
 =?us-ascii?Q?E70551dkfIVx+xaHV/0r7CVRgSLnzhMdDXa+7k92XyiufUMOM0K1PyEW2ErR?=
 =?us-ascii?Q?fSeSNKdGqVa1bz77LZ3Gmwh6BxwItn12MvL+GcxbJ8HHW2nehBp0z6/nMnPZ?=
 =?us-ascii?Q?Ap1N3ogq2S1mZ9WuKkw4gQLOajEmXOwmsv25hij6c89xl3JlKINi+rZjHOkr?=
 =?us-ascii?Q?7X5h0pIOTsfFOnh3c2F+D2LKG8it0LO5nGpVyPBCDV1aYiWM5GI/XGKa7EQN?=
 =?us-ascii?Q?2rii4UDrf6P11SZd095S5h23LpXrqFGvFNxwgTfxhC6tlgm93OfNv4CyH31M?=
 =?us-ascii?Q?V+qkOnmzc3mlYT2Y/HOmqX9s2VNpWWFUYsTZ9+BWXrS83JoNMnjHvz6JmQU9?=
 =?us-ascii?Q?7lc1TSEV6EMWpabpfH2htOwc5/XqVgziNft5geODit3+49FMjnKtfckiYYjv?=
 =?us-ascii?Q?7tWYgJgJgBNNeFNLKiFU6O4bIVIH2gz3kIBAsXg2ER5YyDT6ZrkUjYgJZx5A?=
 =?us-ascii?Q?znuUNEUSG8gJKHrswFJYggE2jDkY1dKprjCDaevsARv/eLHmz+NjgBCY+00V?=
 =?us-ascii?Q?rWJtdNY89LCtF7Fy7WSC3aTLfQHvG5Pc2z2STN3R5X1pG4cflQ+Rt4KoFQcr?=
 =?us-ascii?Q?WGf5FkDw7W0hf6xfXItRhQrzzkaoYy4nj/HQ6Drv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1328c1-184e-4c7a-37e7-08db7d5f0bb4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:17.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGNNT2djHy/oA9CrpIMwuwCYKxfM0a66pM0UQ8jzmgOq533KYJZSlO7fbI9mPUcc1lNf6KYtlKEHsVw/HaMQHw==
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
 drivers/i2c/busses/i2c-sh_mobile.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 21717b943a9e..e2da633b5e9d 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -893,12 +893,10 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
 	pd->dev = &dev->dev;
 	platform_set_drvdata(dev, pd);
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-
-	pd->res = res;
-	pd->reg = devm_ioremap_resource(&dev->dev, res);
+	pd->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(pd->reg))
 		return PTR_ERR(pd->reg);
+	pd->res = res;
 
 	ret = of_property_read_u32(dev->dev.of_node, "clock-frequency", &bus_speed);
 	pd->bus_speed = (ret || !bus_speed) ? I2C_MAX_STANDARD_MODE_FREQ : bus_speed;
-- 
2.39.0

