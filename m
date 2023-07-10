Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F06774CD20
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbjGJGfo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbjGJGfQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:35:16 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D3E1A7;
        Sun,  9 Jul 2023 23:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaUQsh5qDFOTfEx6db8ANOYQkFyyysSLy6cYC92i6sfKVFa1/JUL7Li0b6oFS0VTuYtRMZL+DMu1/8OwWlaJG10Bo9OLB2tI811S0m+HHbmbTY+SPDplQ59/My+bbjXvnjlVxs+SP5KUKJ6fSt9R825z6grxDdyG9w+feR6CohtgXpQhmUCVuuyUehYBf/WA41ZxA86MmLDBdwNci7FlZF4t8G1O2PoDio56D9uu2nTGbm+7IUGbZc6hqgZzCLC6VjiRmB3vrzgcSesNPd2KbbpNxivlEqtuy8HpetXvg+o2ZaOcejc84aedGNGuWCNogcAljuoa+wQqVfAhw4Eefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TH2zgzreA0+1DLz3CyJ/QJfaeMbLJAdZzM+utAmlUvQ=;
 b=VCmJUHEmTor6uadsfRY8hBNamiyCrLgeiSQw+7s1DL5s//K+tqJ2k4OrKXCGdWTgRRlWD1DSTxMjXlhfhOgq+8Bl0YKAeQJO35mzwxecDrao2cl6hKNhjTW+I9Jsa74jdIaKLTVqGutzPETVHGdVDBM83RUQ8u9VjPjyI1GepZckRIp8yRdHojX/c73mSWu5GxQwFN9Ly8mqmz51WEauuPe+6hncFmGwJ1zUy5hINA/p+/N2TQwGgpjT28yIuuLjYzsJaqBAoVgy7XcLP8Dd3UwbpKkBkuwzVALf9HlYFmfm7aGfjp58fPPYsqd/M9ysc1f9xlU4JVYx4XJap1O2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TH2zgzreA0+1DLz3CyJ/QJfaeMbLJAdZzM+utAmlUvQ=;
 b=UO+xLrNbHBt95/TzL3zFGbrgWZRCgSN5zRtD8YligEzY2Zxy4ieNHoJ2SWjD0oP752fRww+ogqdumB34sAp31jBAmDcK7/5fQ+RirfOXfceIDvr/hvidjFLSM5ZTtnxp61z6FPPmqm7El60KgFwmBstrxcSuSYVP/LSWpEtHA2wKyW+swULmYNL3qCWT/5B9QCVgeZ0buUgGZbm3X/UbVpeJC28RgUi5LMZnvePKd2HZqdpKkj6S2Y09/U1PV06LYqnyOsi4N8GtFbB8mrasCfad1E7N0s63lk+yKpc4VFXwh0L1LP4vvWMCP32wg0YxkeHweirRlkGMp2tJ2K+u6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:23 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:23 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] i2c: pxa: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:49 +0800
Message-Id: <20230710063351.17490-10-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710063351.17490-1-frank.li@vivo.com>
References: <20230710063351.17490-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fd90ad-2c68-41bb-77d1-08db810fb2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eLtBHtbVNmhAlwxsjm5LuLNggWJnNy6yDeTPxeNtHUrpcgTiNXbyBfyepnykVRWRsxFpPOA3oTOQsbc/gVSYO9g0c3GQ18M54n7c9bXkT68qnINJu5CTF/MIqiBcE7Cx53tj0QnwlqF4Q+yulnmrEgaG+ky3VFyyqo3Dq/EhwNoUlMLOiBJYI18i3nc5AACGMmBMNmHM+9ghVgQy8BZMznS56FekiYdNAGrYd9EdRtyn6sDBIov6st3RvpT9piZVLbzGbV69xCkDNgi72yMf+5m210M0RcW4iW+5R+vp/H3y4fgcqeyN8w1PTfVDpWwVyOaS4KNA1Xv0zXybiLhAguX01FvFoaoJsyCSGgVp6Cyy7zQD7tUYGKFL0hTz+23drlXMza5q67ShQfTQbccizEe+MdzkV5UFmqtnJPJzvg1phrAcDG3ZdbGDBtUPKHVq2zAVjAeRg+cUcAuxWQ1WzA/836XwsCmHCN0ng33JNB0Yt8uWY3hwtopiLFCgWdBQPoT54RJ+bOOtMunj2wBwhuM1fNNjT8ejntzuzQtCvzxVduNd3oznN3QtaGx2NOjIuvuFoKJN8rYyWb213VQIL5+FnbZ3sCF72NrTTwuvox0fTGAc+0x9SCuZ8ukyLXvdBnArOUuK73GRiyjrsw59fFCQRdKJRB9znRdLC+6AhNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(83380400001)(36756003)(86362001)(2616005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(6916009)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJVplNEK0cOxFegAPZ0aeq87TQVOA7IvpiGngqVPVuzrHgQxFg4SX1i1byHA?=
 =?us-ascii?Q?6auIsrdiE0IZSuDHYmbmXpCyBtQ7k8FkgPnhVSnnloDRj/QizySjQkP8d4X0?=
 =?us-ascii?Q?HPqyLQvxC66lJ/Fz4lxJIytUntY4MxsD5wlJQNvQ3A1Msx7KIv6sbCTKVkhQ?=
 =?us-ascii?Q?vPJHC9xTwBNd7IBWjLGzXTInApPPLmXL3y/u11Mix9FlLG/sTCepevVdwYrO?=
 =?us-ascii?Q?rRP/zZYSzwVOK+vnFhlSHVLtQS7T+/Ctg8Z8OfzdHXatVNPwvjZ9S5IJeCgn?=
 =?us-ascii?Q?gGL0ONZnHERDIu3C8VHsdcEhrxfaQL74d3LWz14iyHP6l6hVkZTjnVfwj2Tg?=
 =?us-ascii?Q?jYR7tohmgMTM/xhb3cTEI7L7haT7bkoz5UsgeDFrkIjd0Xg2/Bp37ZnJABpG?=
 =?us-ascii?Q?iGkoXAI5wTkC8AkHqo3G29BknXUhGqbRS9d+b1izFx+nS3lY7mO6DV+D4ZlV?=
 =?us-ascii?Q?+o8BjgdfmQqxZfXhyJObXBanZKnj9K475nX0qkQR2qT5DxfwkTzs+oOjsjcW?=
 =?us-ascii?Q?GJMZJvU7vXVW8708eUd9lS31sB0+jFfDYHbrgjBQVJhGzaTx8fudsRL4jnTV?=
 =?us-ascii?Q?/hf2lImD8r0NCV0IAYmFU8KplnyiuoyN+llUr5qEsWdGGR80D+W+NZwrbbzq?=
 =?us-ascii?Q?8utzLlcEz3XitWUb05Fo+KeVxqgA0JdXBXJJba+f0ya17a51zpievjPz16XP?=
 =?us-ascii?Q?JdsZ5j3dIQYP8xRdJ9/AOB9ao4vQlJada5QHXTn+hd2tjlkBdlT3b5/vMWZm?=
 =?us-ascii?Q?CPsfWGGdX1VfP1P5CL7AghmcjudRIB3SFqnTIT3KvEprl9DMXXbskPxbc0Ih?=
 =?us-ascii?Q?KECJbyrOs/ACNLlutyipCU9Tnc3rst9LGDaSv5XsGekTHTQvtmz3+eTc7geY?=
 =?us-ascii?Q?pg0vomwsdIdCPoLk4umHj1Frw73aGuAElIXM9POberwtpFAUe5+WEWu50K8r?=
 =?us-ascii?Q?aQ7MZXBFvZqsGi4rxTNc/TUSm3irT4YRdPIy8qTWIq8Dk4ibn77bjtHAz9eB?=
 =?us-ascii?Q?UZeCWAnb2hOneUWYQX+Ll4b3sqcPKUAavy94ywLBy7TpPxG0dMS7xqDOu8ds?=
 =?us-ascii?Q?H0lTtSNcraDJ5EWXrOErKfjrVLyEG2W7N9qE1t0ESBj1dIm+o9DvWpnPmwSw?=
 =?us-ascii?Q?L7H9lSLZNlqRy0syaQLHSiMZmCaQ7qafGaPiGb+4VQZ6CVixLg37jrUHyNNj?=
 =?us-ascii?Q?D4/PSi/F0hQUjpXGS1ihvSX2yyMfKzv529FJ4ImVJPIZ8OvAPNLvjBRkMpTT?=
 =?us-ascii?Q?MYDgY8+vidp9hr2i5HIyFGKH3hvQu1I34Z1uuZGDm3bcTbKoGBNhFbXhkbzT?=
 =?us-ascii?Q?SvzA96jKs1gWYT0hF6g38VL09uf3PDKC+tN2k2vhNQwHIPp5puK6hAoHOfms?=
 =?us-ascii?Q?tw2wd1opIPkcDkdeEsdCnqEoNVwMvwahAZPVtAkiPevh2BpGEYYSP9PCGoSn?=
 =?us-ascii?Q?KBWkX9dCLANkYDpobyI4eSLMXLak43w8vI/R/BlTekREXY9jLcwSfBkSqDBX?=
 =?us-ascii?Q?zT2dg1+e+BSsXFr1Srxk0FCdYaqwMR7vidy38tg956f8sfU7TS3ZYIb7nfhk?=
 =?us-ascii?Q?BrEvqz3LISnTLR/G6m8bVM1csQXLthvE2njll/ww?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fd90ad-2c68-41bb-77d1-08db810fb2f2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:23.1972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoibAWyUJ6jlBh9wyEuMm967CThmpsUjYDjxT5ceAf1WVSfcBk8OxcCPkz5KPtUR8IBKT8/iPWyxGm02qtIS3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6586
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
v2:
-s/devm_platform_get_and_ioremap_resource(pdev/devm_platform_get_and_ioremap_resource(dev
 drivers/i2c/busses/i2c-pxa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 937f7eebe906..b630bfeaeb85 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1362,7 +1362,7 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	struct i2c_pxa_platform_data *plat = dev_get_platdata(&dev->dev);
 	enum pxa_i2c_types i2c_type;
 	struct pxa_i2c *i2c;
-	struct resource *res = NULL;
+	struct resource *res;
 	int ret, irq;
 
 	i2c = devm_kzalloc(&dev->dev, sizeof(struct pxa_i2c), GFP_KERNEL);
@@ -1379,8 +1379,7 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	i2c->adap.dev.of_node = dev->dev.of_node;
 #endif
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	i2c->reg_base = devm_ioremap_resource(&dev->dev, res);
+	i2c->reg_base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
 	if (IS_ERR(i2c->reg_base))
 		return PTR_ERR(i2c->reg_base);
 
-- 
2.39.0

