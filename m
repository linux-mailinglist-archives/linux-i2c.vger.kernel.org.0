Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51EA751EB8
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jul 2023 12:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbjGMKSs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jul 2023 06:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbjGMKSq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jul 2023 06:18:46 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2098.outbound.protection.outlook.com [40.107.215.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F497E77;
        Thu, 13 Jul 2023 03:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLk9C3MaSkL9feGPP49V7CmGH8rGw4TNuRZQxR0kvzUyJkGrkQ2ydUas8+FBcINksNFpxK4Nu0TC0rC7M9zztHaJKKd0tA4vJBWBb3rYr8o4573myBPJl/Ho0IEOONAnQ64P8ot8cIZ1PWyAVl59EvpABsfeGRcyATEezcNQPtzqCocc6G/FAKjARuRgW0sb0yNTur7q1uM/t5AKPEeANw4xK+PLF9+4F8n1tK7gaBTyEc7Y3j2pJSqgP8czH+EUmqYEeNAHvzqq3knRZ0bCNAfX8ue/rPSV+y8FuiVM4ViwjmFxmFci7duyiEOa+9bOgYaPBAZTmLiKHjktMR12Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iHYAp2K5Ch4SEkwAyIKhXBh3azcybLUmgG+bV5miEQ=;
 b=EnTfw/CkiWgF4Ld0S7s1FGycbCwFEerELkyl7Lfv5WHxrRVgrLAQmWQ5e+VCgBZjyfRXvLYwEyr1b6XGRBrKWKpPl0/nvaBmydOqf8V8T1RBKQgqIIhRoyijNfPms4udnGV2cf0F/0HRk5rOk9o0Wguwm9sUSRo55RUQ50aZsrahQyrIs7R4HmJwOWw9xb0V+uDehm6aBZZ2xig2JHeXymQuy9EVGatUMyyP+EHt6nadEw6pSpZ8qHhorSM1hP5m1t7aDvpsZqfZDhJunzJIRiAQ8bgXhSom4d5dZo58Y58X4u8jbjqDM9PbK8Y9iLO2lXl8dld3vzSRTlJKU9w32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iHYAp2K5Ch4SEkwAyIKhXBh3azcybLUmgG+bV5miEQ=;
 b=FnoBCTIlYiDMj8VfZYRJkppG9CccXMMoajHyx31heK2y4ADbjNrv8WMGt/FMCXcQnnCgOOUnjJMSZ8L1xuWXEIGxwmFjQeUJ64UxVvC+cfQoCipBIixjKazw0RtVGIDA0pl1655VK0xRaSYvCEEMlYZK3CMzUFv+Lxc6ex40t0pnCbFKYZogMI+bLaWyfqMYprlCIG9ez+8C3LL/qvJrjMAO6HjdTchgwwU8+IHHAksn9N7rbNvX5mibFZAQnma4/56vVNe5Nhq4UAe49JgHf/DNGssTZhtU07Z3jtaXxZaC2y4Doq01oogKIckGyrrFS5g8ABxkmmXOCh3Opo8o6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 SEZPR06MB5174.apcprd06.prod.outlook.com (2603:1096:101:70::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20; Thu, 13 Jul 2023 10:18:36 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 10:18:36 +0000
From:   Minjie Du <duminjie@vivo.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Cc:     opensource.kernel@vivo.com, Minjie Du <duminjie@vivo.com>,
        stable@vger.kernel.org
Subject: [PATCH v4] i2c: gpio: Fix an error check in i2c_gpio_fault_injector_init()
Date:   Thu, 13 Jul 2023 18:18:28 +0800
Message-Id: <20230713101829.15548-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To SG2PR06MB5288.apcprd06.prod.outlook.com
 (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|SEZPR06MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: f80fb1d4-425a-4fa4-f2a1-08db838a84b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BswmD2UtZBhcE+PIhrvC+5+ajCffNCCdwjcqH970Z2FlEhyX1C3ldAejIfF56fUqEs/GZoORKmH9+UsY5dPycayYl87G272tqrPQ4L/eBlf0YWuNqPcgTPso+pIRPnC8FenKyHyvUhUfB8r7uTnnPyua2PbqEwKxbvfkmnSaZeIEhGoX3muQN4XXxJ0gG1ekZFhPKkvm6JMXSn7/Xlne/OtaS72nmcVdJFmew0NN9/oqJ2aqto6G51bPiFCNeamuygXfLAMGqFnpRAzEqMoC0MvUA11s1GHhr6ZADIVagsaZoF1WNYXA83QMRFBhS/eh+NFYoEVbZZ67HH5PyEE36XdWyr3w4QKsCFdehmaSCVf7jnk+WDCiV+U3QBCoRRBouQN4/hlD/XFeHSnG5jkMSyDsh+l/MMdygXUrU+7v2oFDE24JqUYpdCyee/EzWVm1u6+s5CukwFFkDJDDGeVsC7JNDMT6rxPcJ+uIIF70tGYW9v6mnO66jJlJ0JnebnXJeeD5kuQ2IVkxQIPsFtaX7Oh6wud0p5h1fa4wGF/UilMW88+oHDXxmWipRB2lOsSxazP73u72Ce3YgUSkyBezTxJ6ZyCVgyFxPAffp9hZzWH27Mbkdbp2ksHv7epS9s/Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199021)(316002)(41300700001)(6512007)(8676002)(110136005)(52116002)(66556008)(66476007)(66946007)(6486002)(4326008)(478600001)(83380400001)(6506007)(6666004)(38100700002)(38350700002)(8936002)(1076003)(86362001)(36756003)(26005)(5660300002)(2616005)(2906002)(4744005)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?foU3e/+bs1JMe3DYHWgO0kq7IdHNou7kYb3pvGJ441dyCrbmtNFypLyvHuCZ?=
 =?us-ascii?Q?ZRKnPXrCADEbfxIhxfce82wQrDi4wifroyK8eZJHwjAxGzAtPQe69fCansYv?=
 =?us-ascii?Q?fxhN+pnrqg16yRPWL1xNhu1pXcOZvAWtss3AcyM88QLjD0LQtjvSvuNPRF0m?=
 =?us-ascii?Q?V2QK1pOzzllbyg9brojffeqYod1AC/py6SoDfYHTV70/ggPV1y33qtTP9ZSd?=
 =?us-ascii?Q?+tAvLKAYRZVToGUuk3W+m8mQ+/TGpZdqZQkYJAyPViQ5q8rSi6z/ljblGb6t?=
 =?us-ascii?Q?fUraVkomgTlqIc73h3IWwcUJYedAth1f9BEFPuXY6oeMZA0+hCaUQFIUkRuq?=
 =?us-ascii?Q?5cEL9gDuXyM9pTdX07u3Ks+8mV4Te0giGl4bjPUAIiE898d6vYd9vJMX4B5S?=
 =?us-ascii?Q?mAzyOk7LlfhFAN40uqcdZ0OB7mjkZlzPJAdnR1MNZe5Z6NBaTL3aKB4SWDzM?=
 =?us-ascii?Q?8qzdLAtCnpCk1pjrMGyQAFz1M2LCxGtu1JkdwBxma8o8+9j3u+5IbKwAIDyJ?=
 =?us-ascii?Q?TrUEesJNcP/aH0A++Z3UDIXypuFkY9bFlSzSBpqDGexVbrzsWbcHefiNO46L?=
 =?us-ascii?Q?z3W18jBeMcD/eZSx6uwTN1kfUa3EHyqmvSxCEohNJxWXPaTEsCJW1CZlRn6l?=
 =?us-ascii?Q?VXQOYa+S55/ab+vxhwNV6kQNHOrKK3vfV0b2glwXTt8IwhLfubCY/LpoLshI?=
 =?us-ascii?Q?HwVwsyq9hCOthYhmeMGegPaA5c3UWIXnsFmTXzgNJF7QMryhhRtHYVG/cGRc?=
 =?us-ascii?Q?35D5p/yF9Rwo+Ip8fxuXtQH386A3QBaoG5UtjkV7XVTrmsGlIKvj1+o+Q9tP?=
 =?us-ascii?Q?t6dV8onaEPgmL8UYMEe0WA0APk/GoZNoe0n0dUUouNepNXh8PDoEhs3CB6C/?=
 =?us-ascii?Q?07Qzv2KdqJ5Ybne3Sb65kjS6jxUf1RYFy0OCdaJ9BidxS+7oweAMKHP1lKq+?=
 =?us-ascii?Q?J6rSUImgx4L/KJWzKD8Hwoat/PoL0Qfu8nRUeRb3+8eM78/uN9lUCSwSuxHD?=
 =?us-ascii?Q?V8hMZAJ4UNqNclEqarAxHpMoRCXfqUz66MvG9qRtfNODJVCGCT6M36SRfan+?=
 =?us-ascii?Q?JKjB9BSymxMzQUmutkRdk0mcx5zMLTQkTaa0JUaf7Fe6b4m3UdOUYua4fkiE?=
 =?us-ascii?Q?XT1GEnMjfUgqMS+EVW9fTjtyJ2R2P1WWOPBPq8S8PpOEYutPTCnl7w9IXhM/?=
 =?us-ascii?Q?ZFT2eMrqf/QpYpthPOwmUfGGvb6IFHuKhoNfaLjqARmurUVeSnSB7hzhL/3B?=
 =?us-ascii?Q?8qlQwp+3h8PnJ0mLCsYXoVfAdPl1bc8WJlhUktQYxhWWMD/nB2amVxb74bCV?=
 =?us-ascii?Q?9x6sBXBiiLLdLIL+VDqlq0ZcVlO9Dw1p8SMJShK4UtYg90Xkr4hT5kv4B61C?=
 =?us-ascii?Q?SWXB7xtTZDhMSxbupRd2V7tzJ87yRZvJ3K1zXtAtY7+v1QUgywplkOeptjhu?=
 =?us-ascii?Q?u9BFzsyycyl/7a2YnPIj6ajQ6UJCiM1yVdGhPJojHDqaEx2AWuv3gXl2Ijph?=
 =?us-ascii?Q?TytlzNF2r47dvHDG40B8+4Q/YDabGO4XvMysoNTU6MYPcEABiqsCVe14L0xs?=
 =?us-ascii?Q?cj65qOWI893JIFJ81rBPWfvApONcjPZG/EL4Fd6T?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80fb1d4-425a-4fa4-f2a1-08db838a84b2
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 10:18:35.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwgOXIbdwdakK2cpE4xyMk03gpxXzb/S4DApQTnwYEydD6mDcc21jT5do7/9jEDdTnLj2CbP2SvsxCjsJ8midA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5174
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

debugfs_create_dir() function returns an error value embedded in
the pointer (PTR_ERR). Evaluate the return value using IS_ERR
rather than checking for NULL.

Fixes: 14911c6f48ec ("i2c: gpio: add fault injector")
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: <stable@vger.kernel.org> # v4.16+
Signed-off-by: Minjie Du <duminjie@vivo.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
v1-v2:
Fix judge typo.
v2-v3:
Add tags.
v3-v4:
Fix log content.
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

