Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAE0574CD1E
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjGJGfR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjGJGeu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:34:50 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B26A10E7;
        Sun,  9 Jul 2023 23:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYi+awHXDQG4k6p4IoysMfkApYWgNYQfTc957EObkOht7mHQ5oT1pMLdHzNS4rmLLWD0R5T09ezlqb7YZgv9LDv3BYnYNQGVXXW9exFOWDlOaWJWopDIKZI44bUI5o1eCdOcsFpnxDyYN4bH05sAyXYzt9O9GUqyVLva7XjtdtkeY8zjnN8ka/A3luk/psSMfpczbLWbUfj3PHlkOX3RPnnIecynqKM8o51Pa1nicP96DPl1HHhm8Y0He/8IBRohfJH2jwOEF5H7FjLuGHOdq3n0SqQQvZxJUmXjysSLsanObkYha4js3XsRK8oJxjAXun+6hsb/XyMpre5KNamiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi6TzN2hL0vt3qrUYbV1lXQWxJA8TiWxiQ0uLCPdZRg=;
 b=PBNC0xE9kj6/24BAY7LRhuBksyBQeEJ8DJnnpH5WHY7O6amm1eyHpEq/S2Kr1bXqOmN2ybffCrm1XxTkCAIUcP25hhzORKP126FSKphddbfPtfUvSASucg/Dq6YX+j2C3zUOu54dP+uQddd4ecpoda8NPwNYA57foG00sAa/1SHVkRj8+N9RoXPHSdiAGJHYblE+jGRWHsOc7wqcxO+ztMYmm3JXpFVYLL0KlO04hy0ldwVjZRzmeJWRJlOZHmoIbwHKkr7UNyWagDF044pyNHQngpzHeSGAwcegHEMvjXla6yly1TOjHH2K7tmYFFg2P8mQMHbO9BJkApA8F9VqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi6TzN2hL0vt3qrUYbV1lXQWxJA8TiWxiQ0uLCPdZRg=;
 b=AKYMt+i7iptr1bbXpuEj0KNYS0cPQhQhmLDY9BCErfootRxuSvAC00DYOTl4NPITpl4CKEJgzhK3mh8gNBz5YQ1uAyOzFrAKPgQ2B2H3Ycb0hkqVZY2zKceMkOpUpj8my8ULOhPJVztyrV5TDjv11aMYbenaXmaigHvZvgKifL/KKljFbdVpvDP0cnhk+7ja5bsralSKe0ATjVECvMhG5zBEeegaG4v2Rrf1+sa19TdVXrpNV6TFezKOUUJjDSNO4aXllxc/jngdfy1qPzYD8eJHDtelHGnAFa1T8AdSvgkbPXSlDAtlPVzTRoQyzCKYgXD2sSH9PFHHdMzFExjXVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:21 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:21 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] i2c: s3c2410: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:48 +0800
Message-Id: <20230710063351.17490-9-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: f6827966-e49e-4221-6b83-08db810fb1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FBjCoiP14hCSPJsyP63vC3BUs258jb4+usWZ/hMkQ0gvu6csK2YETo+wahMgGEUxRqvgXs9L6ff+yCrTzKFHXdWDJBSR4VqYW1sD4wML0E1RspGmWBme+dyhKSWl4G9fRvSCq7CN2qZxxpeBlDZgmxvdfYVGY4rEqCxCSWDXAVlsPF3QhC/EBiD0KkPnjboHE3WbtOQuaJ6jaKAMZ/du2qdhQOYx7GE5i03Wsz4iUBhLgMPF40K43Z+tojgfeZ7Wa1rP8g/UW6I5f6lVN0QPkgQ1OlRNMafaLMUsLvcwYqyls4p/WFm9ALK9KBU5mGpTXCUF94t0vYOWWDdxMMAuM8X/9nLFfLvuEmqLLW/oaBGrEQFD1S1M1txb37asQ6+Yj2DVNQPXZwy/HZoN0fWHQkydP5i7X1dW42ruDMzopcLRmgDoNY1OwE9f0LX644NeTBANnTAhD4/i9xkg/6KP79r1Vla08szllqsd4UPQRNdDbKG9fdmY+9R4QORbt4dmKVssQ/a4Nixue4KBsibjpn9h614xUq7GjbToOB3yz7b8pvlf/zc9lRy+epNJKL0ygpvVxsOzVLK53xOY3h87vgWQ9f8YYyZGdaqOWgZKlC7ZxxAN3LNF6GarDE6M+JT2yBw/jzBuzvLZssjg1WOlbUGPuWyCOV8LZNiFM2aI0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(83380400001)(36756003)(86362001)(2616005)(4744005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d3qR78BmQLkW6ZLfIgxCggh8A63AsbTvzeYVRVxXSm2rErZk3dSoIyKuEOTw?=
 =?us-ascii?Q?ZUzJ0smBQaIOgWnvRFiAm9zPzqPu505JaGt1+h9LOCzsUUM9qgMkSjaa+xvQ?=
 =?us-ascii?Q?eRBswzYnJSNUba9VV3tKoQIPKfADd3h92VNYzzu6wvlMAz1jAxtkFc0XmuYx?=
 =?us-ascii?Q?Dd1kNIWQIywq8lSO8plT1a/GslOIpWDDnoqqOWP9sHRFiV3JPtua24LrD9cw?=
 =?us-ascii?Q?CeowISwDLC6ALzRkYLRYaivPtCEGXyt36fah6Jk8kl+KZt9CMjSVuT43M/3G?=
 =?us-ascii?Q?cJJqaO8MkkELGG4hx8HqWcv8NPwPTgTkkV3E7+kW7IOpetiTokWyujywmrbg?=
 =?us-ascii?Q?3VxK0EAPT3Aktu3ncbKqu6f23fJCuHGU07SeGxjvL/xexnDP9o0EAAvhX64R?=
 =?us-ascii?Q?af0ZMkMeVgL0U94M8/vyBFvkpxcj4y4p6gINvFxQWzJmimmYPXkbGUQkANn0?=
 =?us-ascii?Q?H6G2rKWJ+yXIwGKWne2tNlg4UQhJENjLCiqMUz+ZqqWqgXZxFn6WrTwl8hqx?=
 =?us-ascii?Q?RjBn4fPb58r/O/ywKniunTkGofSzAl6L3LpFgQirPfxOfM6K38iRVDvQfNA7?=
 =?us-ascii?Q?l0B8W1PUaNuShsOuWtCLjUuAh+I0O+uOMb6miri5Vrl3XyobaVdyureXEUsn?=
 =?us-ascii?Q?FZStxaAlSukPUNhROblYwY1zYDKuas8RRWOjrgJf7ho4DMKCK5H+7DutAIAz?=
 =?us-ascii?Q?fJE43DMaYZKBlNNLrXvw2SzlihZrj3HGbv3dbqI42uCXWV9F/sAODy2kEf0G?=
 =?us-ascii?Q?vYvqqn87eKQGfflDWEq4VqotJMjX7tcGtYEhGZ2vRJzlqXpVEKLMtSKwqlx+?=
 =?us-ascii?Q?uNMuIi0PlvXoxC2v+IP7wgy/wPD8SDz0nVEv0/9bvchItDlzg15CdeJlKo94?=
 =?us-ascii?Q?W1MgR1AfrPbS42Ec0gREaRotLv18pOikIVkpKhSivyYb1GSvwI8JUZGF9FnA?=
 =?us-ascii?Q?IWmUYsOSbd5JBtkRCy2KbBNQUsn/eMLAT8FiO41OeZq9jLMFPE6uPtV/ng/W?=
 =?us-ascii?Q?ZsDTE6liLv2VuRjaCXPL60ZRICB+3QUnSzfw7B03g1CLDmEQQCX2FI6EBPuZ?=
 =?us-ascii?Q?gBiPkb6izUuBlKCQuuMLgRrPUdjGrc/1Hzy5So+OdEoCA4RxTkMIOtTwiiRo?=
 =?us-ascii?Q?hPHlRZZdBKT6h7mAa88XTiidmaIqXJAe0P8kcZWCarLyU85vnrvzpP2J/7/T?=
 =?us-ascii?Q?McC+vH4bHFeRTMnFbbiDgbJj20pfEAPYKRTkfjVnuUHK0T9j5SKpJP2Mmq9/?=
 =?us-ascii?Q?b5FH1vzn3LLll1L7OzwFq+kKkHRD3pO3SCrU4lYpOtjt0OG5SM68oADtwrF5?=
 =?us-ascii?Q?x8YH9gz5Q2uT3y+ug6BBWm8LAnM8xWj6whZvhio4hBpTdFH8dwS8QqRNczB3?=
 =?us-ascii?Q?TMNCjxOeZuDaeelSnR4/pOEQRjId0Ko/CsjQ374M4ehQNKr0tLlD39G+qKLs?=
 =?us-ascii?Q?M+IadQy1AuDWgR4e6Z6UDB+4iCJ5Wohm+wMZ7ve/pItBnnMpWWipzM1/L5RM?=
 =?us-ascii?Q?b/lzvCBPlwQGqvAAn+PVP42P8UkxzpE7Qhk9msz9qhwYK5W16Tf8eYNYfTce?=
 =?us-ascii?Q?lW6tdeuTCaOoI6shXpGsKmY3GVr7wDUBTpS40/AA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6827966-e49e-4221-6b83-08db810fb1d4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:21.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fnGRPtnG2vjTMRO9KKD07C7qfST96h1KAIU0U4pT9l6ycjAyX7jAhILdJ5AHf+ShBs6I5r7xrtXVlmGCaS03g==
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

