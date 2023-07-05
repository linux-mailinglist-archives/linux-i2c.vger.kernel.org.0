Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAE7748571
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbjGENwV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbjGENwU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:52:20 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2118.outbound.protection.outlook.com [40.107.215.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207EA121;
        Wed,  5 Jul 2023 06:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIhvO8CWN5qkjZvcshynL7o7x4y8sFYuB07Ycm0pKOx/1XcndGDi3ZK4I6hwkIxAC47cIut9DqjThT1llVIcQ3y9XEOhel+Ul1lC5283EURWJ6A86cEz5wmBEQNFkj3UJrfyF5KlT297fkuKuLKQNg14XoGVM0gxrUv09/NIYyk0+wAWKqfyR2ODOkKPtCRpw5y09nZyYRJZtSbMEfxwaQp6f8/wwbOq11xGlm0RPd2cyTfrF3KQBcfDYWr5jc6Zp3UZH6/b9pu9fmG7QfeMuH0qO0iRgIs2a0Am4UNwOQEz2nli2tRbJNtKqptQzDvmLfuNo0r85FZP9lM02pTt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdb26EYaPAoprJFKtW/qFt1bUD6rf5cw+jKBZQC71QQ=;
 b=Yd/5EEP/IRJxBBCoiW+VanE6mgBDLB1qeSIvkX8z9FcDBYUNtDnZmwolT1/Y5R6CzISrkzPSUsku4joKP9SHTxQpXiQy18+Q4h9U5ntu9Vt7Xhfi63K/2GQYAFEH7OTVP3fNDsw/WyzlQihGJZGYOsNTrYtEFqtkyVlbytscg3ADeWs9ttKdpoTHsrI5tmGkwfGZr5I4DpYNmMe4ephmuS8/maSdCl4jZznckaU+GdUrwqSXIYgq5/3pyTv93dhb6aKHfcMmSbNj42ixRGZ3ovBsyUIE9KA0qXiBw+1TWprKr0HMAna8BgRNxR5dpO070zrg/GtSrTxG26xH1tIUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdb26EYaPAoprJFKtW/qFt1bUD6rf5cw+jKBZQC71QQ=;
 b=ecL7YLPI+vIE1XO25HBZv84WOu8H6UtxfYRFWadHkiyVfy06WtUzmojoyd2bUcst6vE/NxbPwfuGg71KQdEyCpBZKpWi7ItwWpKb3FxheqEOT/tDlytUTu85FsBqDOasAliLfpYk4SKSE5iyv9c5RoQi1LSH/cQncq/YOh3sNct7Rh5nq0cfeIBv6EdlnAaQM6bZNNMROEnRhMy1Oua2Yd9FXj1bKAe3Z++r9IUeG30pZiD4WhwkkgzmEsYejBu+JMUGrJypY9/r0k8e8sPrM67a1CVPfZnHrEkl49rUQcooCKR2P3rx/QxC/MdyhfkavgkB79o3BbbA2ZFoObtUmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:15 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:15 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] i2c: qcom-geni: Convert to devm_platform_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:53 +0800
Message-Id: <20230705135159.33327-6-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6f142f5f-b2d0-4329-e37e-08db7d5f0a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2IeqqjDlO7QfFOBsqXubnhyQ391DzSWI6mAY80OxEyKbU8M7NX8drtj1sN054SHUKHjKBUmSe9gFm5lWCvNFrkRI38TsbSTkyrbsOIoele3Tf37LF2sAVVuhcP3ar7Cm2pRZFkp5Rrvf1g1mULHLIEC5XhLMkq0PXIeQ4fzpEEK+0+ih2ZLjZjnHBmCpwvoOz/TMD9lskU0PDBXDj3R2XikAloVgvXa2tCw9DBeyK4Hj/UiCEWdQ1TCeTG3gRmqN1kK9X8qvqRKYNJ/+e8aSFD5pnkHpDfMKuBaij8zQ5cCJ5BIRDgVIujFAjXFyasyddj2Db7JsKuA1442EVPC3PtETnUrQxQUW6EyahnaqLPIF8R2QMQIS0sQ//Zf2dXtnjR8hVx6EN+QlZTSTQCbr8XQ0lB/J/gjejRccZVlYKCcpuf6stXTbsmqyLfi/uzDtnIf4zcJ/S0l8ta8TSWaLnDhz/dqlezwVkoIYkc/GDEcUTkax9CvK61NbLHs5OGXFGJrn1UAwtfdLz+D0B+Zlhpz5NWEHalfK7+cu4TJGlOnjjLt2l63xrnjpuypnN/aRhvwPuWe84o7R2Z+KXjvm15HCro6X/fI96X5m73Y8ckaWpBOPafqCd38gTtJKXg1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7q25s2ZuRZgNnQYYRyIpqq2vztAD8gsO1ChBm4sCfQ9UVOBBnOfdJktMl41u?=
 =?us-ascii?Q?Z4rdKHpktZRyP/w8RkXng9GTJdXOBnyp2UhEOISmiSPYll++cfgl/TUjXFKm?=
 =?us-ascii?Q?Ns59u4pgjI4XJN7fs6FshR36AkiBdYhgYmGXc6EczLozRAKpTmq2DRjUS39i?=
 =?us-ascii?Q?BU4Ta9255IhuZqrMEbYaDzvV+0YojNF0LUTq7PjAnTUsJMzq1XqiBD7ATDua?=
 =?us-ascii?Q?QMtKzZwfn0HQeJWSI7r4/F9YR+GG5/DaXodNKowW3XfkXvppRRYuNxAt66i4?=
 =?us-ascii?Q?DQuNCFpOZh4pq2m73IDVJ+6DIOAeEaVAYCsBnhw9CDCD48CpKqbAQMnYNedJ?=
 =?us-ascii?Q?ykqxd0g21lo90kA6uk9R6FIvcDAreiVcpBJJJdyqEQwyYD4Fmclv4u2UNzYi?=
 =?us-ascii?Q?ovDzm/yXLqYCWpqjvTf03zVpcapMSqHLeJC7J3bnQ9WQlXDl3hXpI2vfpxI8?=
 =?us-ascii?Q?EbDTmrWW9SUx3U8E9jZh7RZYR1AhHd7rUxSHIlpXLROCKsoBBvDtWH0+higB?=
 =?us-ascii?Q?Bm0cw95opfWJPYIjN+rp/uWKTPgYOp/T/03Ws/WMPyuj6JpHREIzaR4/uWs1?=
 =?us-ascii?Q?69rnEuQ0MPqmzyt5avO7sgSDTR1x+5A9wAGiyck2pztZgzjv/wP7ns57/qCw?=
 =?us-ascii?Q?yXEaxfp/fhaqMd0QzS5Y7W+f7pgfMLIIcWl2D7FOnU3cOx5MwzRYTVbX4rDm?=
 =?us-ascii?Q?FQU5B23el4jNxXDo8HOe7kkZ/GNXYB9kI41z8B9eT9dZfqC0KELWjBypqQLj?=
 =?us-ascii?Q?B+uY3F9k/D2ufK0d0/y+7660l1RuIfIJAY3O1MIZDY7s/09pNIOeQXUqn6J9?=
 =?us-ascii?Q?6o9oq6C7Tk4Tr2wsjAtO6a+Ujr8m/lP3PE0RPUK+Gk2t5TrSPMwxVtCkJZrJ?=
 =?us-ascii?Q?Kn8Yug9CUX+WDgF1ELH70IocMryszeM+JeIArwp0Bmt7nHcSnEDhwiTsVAIk?=
 =?us-ascii?Q?IYtXFPRONvMmLv8y+zzHmF9zUGNn2YwM4S+DxJzxx/8A+uDF4ZzCUGfmGZtQ?=
 =?us-ascii?Q?Pc5UdTw59UPTHTBo8SgNuH39dv+enpjQhU8j9j26El3VKNRf6eZT5k23U+Q2?=
 =?us-ascii?Q?oN0b/kvjhwg+wO3YONo43y9A7VHmkBevL+4BMYhGN2gCWbj3XswQ054Quqmh?=
 =?us-ascii?Q?RSdUsmNVD9xbZmJqHKuai97Z9J/3RV728sSpfaBikLjCouh9OI3sBG4cMDri?=
 =?us-ascii?Q?Lk9vpNr1uw7ggN0i0JVM/Jtu7JyIzI2Q737T87qdpdCq76sP9QTrSY/meXyN?=
 =?us-ascii?Q?v2uU/lEKBCv8arF1wbrUtTMhyueXxhvYa1uS9bKMosN2wOzHo1MNowUkldQC?=
 =?us-ascii?Q?viDU4+ApSOt1x6Eea2tECG1Wg+bcCJRiyBOKq6RvVvA+mUSdp752wpaltAA4?=
 =?us-ascii?Q?IgiqQkLkYiLykgsDZ6kG6478LoxBNcRMcS/GUYUtKnx15BzuYDZFoA4shFdQ?=
 =?us-ascii?Q?BIehQ2QdrEfSKi2XnStC8M/H3w3z3vMt4kEnII48xx5Ll54vxLhDQBGn7fnU?=
 =?us-ascii?Q?/U6L9A+mMbdohv8vLJKjwJRUjgUQtY3OJMuPuG9Z8sPtFdEgIvVugk3asmu+?=
 =?us-ascii?Q?eyzQZnEyxttzMZ/UbarxlDwMvJxmNo2njcMF9/kU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f142f5f-b2d0-4329-e37e-08db7d5f0a49
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:15.2618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9vXbDrDyRdeE0boSKFJombHiCylowMSavCFUvik53PbtGTUrelAerkwT8J+LN7jJWwWnquWG5XhZL4Auy+zRA==
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

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index b670a67c4fdd..229353e96e09 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -767,7 +767,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
-	struct resource *res;
 	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
@@ -779,8 +778,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	gi2c->se.dev = dev;
 	gi2c->se.wrapper = dev_get_drvdata(dev->parent);
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	gi2c->se.base = devm_ioremap_resource(dev, res);
+	gi2c->se.base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-- 
2.39.0

