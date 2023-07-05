Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F52C748580
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjGENxN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbjGENxB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:53:01 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB451FD4;
        Wed,  5 Jul 2023 06:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImDygVG6pUxjAbFhiQtodxKRsE4Th/aDC+a9QzrFhBkDyfyxlmIPw7alKBEpKhGuAKvAu7c4JwuHMfyc7GvwDDRmtHvUxVHWXlHkMBTp3Z0qebXMLSD7znn3ws6nrnVn0Hchxba4P2x4AVSKC1aaDh/OM41W58N5zPgurG0TyjHmBMNcKeOVAnFF4QCwnxlIE7YnnnO1N+lTHog4wZM8AEWi2zmz8HvfUoqiDU9Ci2PYI8Vspt0yJ0T/LO6i5wAxynK4kunQhuQTLyyiB+PfwUkKitnGwnljyNUvaQHy2zdiDUgTOKmmDxeQ8hlxmTalv1K7s1cKpq/jcvZTKsvMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHyrtNnG06ZSzKzW7gVBZQKPDpAKb3rsNn91Hd5iBY0=;
 b=Db5thvzKjYNgTaeNgXu2cB0MMEQKL413NwBIC8W8+WYHS56ihFypwaBfFjJUzdw9+QBYit/4JqIrf5IF8Cqe+2GQYpdkch38e757RO5Tfh+xdy1/1Z6dp0PLEJhpMHflB/2L7vnjFOG66B2p2R9Qw1B0tDlaDd6wc8uk6hYGDl87V2ifGbFF56gjVHmq+9KYHhdXfz/GjQtp0+BiVNx5duO2yid47ipSzwjw9YUwrO2XFcckPHNLxHac6IoA5FBG6Ex5wq2POqEiWBIAyGk718Vq9pb+Etr8glAFvDjrGMSOXEO3zoCP/5D8K9xfwQvqg5gxMC4kDsvMISHkIQ9RxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHyrtNnG06ZSzKzW7gVBZQKPDpAKb3rsNn91Hd5iBY0=;
 b=qll/h5SzLiAF6ySmEP3Q3SXQEPe6HmYKgZM2xDJ2AQ+WsSaAW4SMaUIF5f7ZXefp4acMPKHIsbpWb0socCj0W53Q2g2D6kVquqLcAp2em7gj1Jez6+nS4ZSI8CjMcvkBmuZaRCoO7pmHtFXulDXgMSj/979tv4OQSgDo/9a5C1VVCtzpklFPEt7IJZdkc7Ki7qPcvz5eaJfvKNRc8vlR3ft9npBkn4ZWhZ/gcMHs7ZbengW+vK97KdpnkYuKYEUsUZ7IVKiUI5ADvIjCRfYFCW7FwlQ3+LM7oup1a0/a+VLc7WuWxx717KWqWjHg+yZzO7PHDEbDCQv0/h/tWU1fJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:20 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] i2c: pxa: Use devm_platform_get_and_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:57 +0800
Message-Id: <20230705135159.33327-10-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7c843d01-0c89-4ef9-1559-08db7d5f0d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqar5VTpD2KKpm2CQs2wgbpG+n34MsGgQsCUaya6DtYx7pE14OQZCpbXMKnSvlqtMNTLPtT73w8/NCCXsAtv8csq3/icOCh2ZzSOkLSZn2STBXldKneMD+hLhISYuZ2szOGVJUj2STliEhBsra0N7ee7AdAnExgulwlflVXJc1DILlRiNbXxwNzdR/XnT+hc8Zi1ot5j+HBIawGJHodYIjht7I1TJ8KJkpK4R3RSAS/q/GHftvQXtCwc6y6UoPUa/WKZIY/OzYjQu2XEBd7fB8Suay5aolSW85ZXa799p1jiPXT6G5PAklGF3Dqu7cz0JOeyAZPkv8UWPzVDyGZcomGTINENO+1o5iBpaEBE64x61254WXRyZSsB5vFNe/cnslzTHyMOHqYAm42/VN9UdBGB5nyag19/nZArLpVCW4BrV8qb2RDbemQlzH24hpIRfqRXrhTjESn8gTWxR72C2Q1I/zQGrY3nOyw8bbp5ENdRpcpCs0Gled3vHy8MGbgv5apfhAio3T8+UQ+oE9SMMYJhPApQ0Sbs/7AA/aC5Vgxm75fIivE/JdBaI/s49AEpjdkwWgY5423aUgd8SMl9pC48ZaK3JWe6Q21Rqw0Puw/22cmZW9VoQVkoWZyVvaLs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(6916009)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(1076003)(8936002)(8676002)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RO6W+mmupUo6N4hlT8+C3znmtmfIIg5TU6czwA7Z4Qt4snXlgenhBsuAM0MU?=
 =?us-ascii?Q?j93cRiRUuIrOOEBN3gkp95d/mwsAMx81/uK4aqwhEV+Nn3jJPesvKOnkQqFv?=
 =?us-ascii?Q?GyfkO8gcn0Jtgbflt86H60WCj/IuCBrMCK6qCeNZrDdiZV3hYhJmFTbkOcpL?=
 =?us-ascii?Q?n1N0bMp1/DK+RDXIiewyPXoEbHZqOZylT0L1IEhJC9pPQo9CShMFrGbJjMQy?=
 =?us-ascii?Q?hGBGaJfqAbJzMVihFPMo0cQcYN3sa4sSF6M6+FK/euTT5jET89wrchdXiShM?=
 =?us-ascii?Q?s+p9yKFciq6m+RWW+l+ANq8lIkFtv4WyHtvn/OessYc1cY7fyBf8GeIXlM8o?=
 =?us-ascii?Q?wxAc1tlbZOUYL5gI8johTZud3cmZ7srn0uW7MxCdqZF8MVbrYLNSOHWg+a/h?=
 =?us-ascii?Q?WSCweiO9sBhfi3uGu9j1Gw1Ynkoki7RYkIySeT0EGIVPwF+grCFfbs1+aCyo?=
 =?us-ascii?Q?RBW37HeBgj6HiVcuMQ2FQyKirdPBh6yBIN0XKDPCML331v/T76FBXi6pMW1J?=
 =?us-ascii?Q?jvL6v5rusVH1sTFtSv5h5eJP5w2NTnN6D/hxnOkSxhz7fjN3mRnNqsdPmFDB?=
 =?us-ascii?Q?DwSfPDxVtMGBe5ZQ5p0et11yVim+LkkS09UyD2mfpVDZ9pp6Ckbyw6yLnerG?=
 =?us-ascii?Q?YA4XadaOiSVShHEBEM/XXgwydZh4KhevcOVwkX5GA45sUnrVn8Gphp+ePywR?=
 =?us-ascii?Q?2f4IwZHiJ636bWn4NXHGhFR7gorwR3E+VLTR/mC98NWr8ZI8GLUYAtvl+wnr?=
 =?us-ascii?Q?ZC8zMg/7UeMPbkhbHQ/xlGoLXksxPXJX5GAibWJnXScvME7oNxm0afix+0Vy?=
 =?us-ascii?Q?5psA5j/qLmP1yb5IzogFZgQlwYGMhHVK53wy6W/IzDpl3/oPnfgJMMZVb652?=
 =?us-ascii?Q?s6fGN1nq8T98uPkk0+IXv3en0xqK5LfAHzuBHCltUzIdGZecde9V82gHmPOY?=
 =?us-ascii?Q?kDJt8jLVNVW6QQY2DnJQNOurDgP5lyVFiOkAZ4dCrUKvQJcH9RFCQf2Jk56Z?=
 =?us-ascii?Q?Tjbao/whYrUSPnxdV4zEsvJHUZeM56CUhbuxibtHbkZxcWqUVdFUyk9FfCQy?=
 =?us-ascii?Q?GAG1BsLRYnZUrZf2vPLIcF1h/Tm/WM+rzssXq9IrgNRhKFcm30aE5SBS96qk?=
 =?us-ascii?Q?aHVwZOeU7wuNJuilAq+eVs6G63lNL39jKZDsqgFYh6gp+jk/3EQjBv4e7thA?=
 =?us-ascii?Q?b4TrjXCz5lcLIjvU5UhzC7ZMjwnRQHESdA2Afq/CF4B5ZC/TNFdvzIV6Yx/0?=
 =?us-ascii?Q?UIMeSqpEBB8F9zY2B6vwYevleWjW4/nhefEOer7p1X0Jgds1qR5I4ikAsYvP?=
 =?us-ascii?Q?1pgMj9Ccga6QUey59/CV9ro52C2+sSydrd+gIxsA+9qFBTP1sc8X8hgy0vK1?=
 =?us-ascii?Q?tvQ8HmZo8Yqy3I2ir3sHCwvoo83msqMN26jcXzpK0sTqLBf5y4JSgzbgK38N?=
 =?us-ascii?Q?lCYhxp2AOAXRFCFuYa4uSs4z3O5CT2jNGzzI1hrOw7XpT71QqGhte55P34Fx?=
 =?us-ascii?Q?hu//U0gf+QOXenSrFvjySea7bOd3S/gBillr+1hQ4IOqw5w+vzy121Q4d06W?=
 =?us-ascii?Q?J2JMn3IZrjyQ36dNO2HBfsAlPO+62HMyAbSfuaIR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c843d01-0c89-4ef9-1559-08db7d5f0d28
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:20.0738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GFX5bXL7JQWHdJldeQe6UMWcyYBtxQEzSl00xGqB6kKRpKMb+NN10EZzEXFBaHErwxycpYleviAjRm2NVW29A==
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
 drivers/i2c/busses/i2c-pxa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 937f7eebe906..73adcff3a54d 100644
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
+	i2c->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c->reg_base))
 		return PTR_ERR(i2c->reg_base);
 
-- 
2.39.0

