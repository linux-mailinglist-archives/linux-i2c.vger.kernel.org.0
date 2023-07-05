Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 854F374856E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbjGENwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbjGENwR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:52:17 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2118.outbound.protection.outlook.com [40.107.215.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50973F7;
        Wed,  5 Jul 2023 06:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnfJ4xRP+z0VcxwjZN6ohwul72yqqiuLABs/wJlBZkdATFXqKQvcx4/9Zgrmmib6EdffRbLfYzcufsN51SNRPbnEx5wg3ktkFRSnxHPDXj0XgE6ogJ1Em4bpQDjK94o/oEmO0+xTSl/mc2eJ26Y5nwLNxyB4NazD8Vh0+a/asfwb2gGjSVlP8fH8tYjmdT+m5We/nKbRbj+9zhrf9/ezS5xifCDE6DRbIC0pnqmwsDKZE+xQ3fi+OuZCFIG1biFndLbpOu9UCahqsnN1jX+8f38JQn16F3gU2HNCV4gwo0Awud9GS+g5kyPEnMARFUAXimk6HjbQzQmv+QL2+W31Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtGdsGjKwrkleQHLRTgg+RRLnMhaS9ZoWfQWbgk0L7c=;
 b=cMbkh+w7osIdIk13lSsrREZwQs8gPyRrr15UtAbOOMCeFi1JJpThlJEzowaJvfHP/Fe5QKCOXgLF/gXJKWbApZB/Q0i2hkFtJcu/yffpbO2ZJQ8yBScy9fEFFSzH/1N3TNR15wcick91yK613HVzrErOw0tqmz2rN/NYa0T+o7/CjhG0qcAdnrgYSiPuHlXEq4HMMrKE1Jt+ymbMBgWQfUqeDv0SeGVLzNsnP/xwCgfyKLMigIQ7DZZDSavghqb7an6GOsz3MlxPJFFbbA73raY83k0NYw+OypS62WEr9dVqmQqJVaKaGGTV4enUFPQCKIxW0shy7/tE4Rns4y4/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtGdsGjKwrkleQHLRTgg+RRLnMhaS9ZoWfQWbgk0L7c=;
 b=HKRemG+ENqdt7dVRA2mBjkyahrKbYepDgpAuChfZOYQs0q50qN/rZrGaFmpnsd6XVJCYjO+/uv4n+3Ifj8WzaXUICTLR61DBycB1BZkfjjTDEx9EGRHf8bHDtIBWqrvopqxCqcsA0yh+KprExoOxJaZaiOnIciLDwVVqGqqrYQs/eqYDF8ZxFbj9Jk29kEn4oh0En75hh2NCkf/DjQryI/OYzxhK93U1Vug25UoE/o43ia0h5krhU1ufTdCXT/IzO6PFnHAhmZPB7PU75iLCKRLOEi5E72k1U+dUl+ouiU5/ZIEfO7pKi8YuKbj4lsmeXa3B4VUcTuL3emRb+ZVsQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:12 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:12 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] i2c: mlxbf: Use devm_platform_get_and_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:51 +0800
Message-Id: <20230705135159.33327-4-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: ebcd374b-1ea2-4e9c-4759-08db7d5f0893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6lIAyM6Awt8BstOHUogzl14fbzD8eT0DEe7vMj2IC6RG1OfAEeAcXKIJK2PGmyrUW7oQLMVeF7K2Iy3Cvs1GgkeAhz58DiSIbquxFrKvxbE2p04q2OjeDQlZBPF05TxcSF2lh4kI/w5Iedjv7pjLsY38IEt+6Z94E8c537JG/lKeQUFPnRqo12pl42HecgAvd4Wcl2e8DWT/cPvqcK076sclhKTaeqi2J/hQFHOEgo9OmNFjs8oLlae96XD6FC7QdxgIjVTkrwNLQzz7i31S1IjYBFGUJbblIQJyox25Yl+JrEOC4F85ld6VKxX3ExFiDhJdYtjZDF2CBPZb0Zm920pW3X7kBMeMAGCVvVlSB7cB8D5Wr8GRSLMn+CdMZBeIL0EYZnBnbL/Bq78o8MMqsgjfr952mVsSEvPyokBxxqz/sS885WMeapDP1juDx48QL/bI0I8bpje7ppWCDrfrXDERLc25a/rVJbhfwstV3hjSCl6EF39a+5XXYs7ps4eyFwu0661kgb1kBdp+u2qA736tpzifkVWrTTUTseQdlhuVsghalNsWRDJMOmGLSzg+Cu3WUPDYMgJo3opTFX6InLoojjqB0sfn/49KgwlXNuG2IWGLa9a/S5aqBJZEtBnn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(4744005)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xbgiAKXcazg49we1h5s/GydwhtOU6olW+FqG0bvHQIZk++/5QPbxQZX/ZDUk?=
 =?us-ascii?Q?BbpU2NIsbogy2iEnOd53ijHmcV1sisf9mlwK3M9w4dfmwO9sek4brbbXwiio?=
 =?us-ascii?Q?UnLh81mgbSw+X5EmwETC/MeO0TfiPhAi/5bxlB2so3DzWsP0QYuoO9IrjXhe?=
 =?us-ascii?Q?AqYY8EJqTxvFUfLwAMcbaN7PZIt6TXd1wUHKbX/Eg/feMwb8obZmm2pfPpqi?=
 =?us-ascii?Q?AsP62uO80i3nfFKEKF20JyS0Tqx2oXgDvt+fuWb3WJ63TUg9QqyK8iVLHt7S?=
 =?us-ascii?Q?819P+5QXLqW3ipjhBb1J9RcCo8ienQIIU9zhdN0kJ8ZN4F5ZDsOEnC61n7GE?=
 =?us-ascii?Q?bDiVsAKMhXbBT+OfMI9fGeMfP93xYEfWtFuOfxTz+ObkSz+HK/W866X0pZ9h?=
 =?us-ascii?Q?lTZ5s6kLDZ10WIi71LmKyFnVhdYIKgJ9bD5Nez+ovWfJJueTWjShl2R8Sc9F?=
 =?us-ascii?Q?PK3dQMKF8psreLEomUY6niwN2k4UCB+pumRMNbjEfJLEISjgbINImjOlIEkw?=
 =?us-ascii?Q?lWD6vR3GJ86Myu1JD86W/nTUjvCaHFc3GZdzzRDF5wUc/SNTsXDVXT++xI//?=
 =?us-ascii?Q?D7bA0VqUUNv4m9MoX0BmwYnn5j53XLF2OAr26hSRac4U9UtraW3N08irmF/W?=
 =?us-ascii?Q?mEnj0c+q3XMuSJFJdHXxB7RN0ZHw7YSPmE6YWMPUjldIEQwO6Jw62EUIm4Ee?=
 =?us-ascii?Q?caD+XFIakdF2a2msZwkDDqxVpPJWR5fUTcN6/loCtAGbEjUh+oFTHpiHoCZ3?=
 =?us-ascii?Q?ObTnc4plW3bOYlIdPmzWUHYUd9iTRH4tcIFk/4AFRkOINip807bptIrM6Sbg?=
 =?us-ascii?Q?Wlve6xpNyt+5YoAxP0L3dMjVxdvgqG1BVBb5npFd5MFa+ZZDUIHWOoqY1sOC?=
 =?us-ascii?Q?784AS7FDeyYLmbf7QhL+Hz9u4c1Sds2mlkE6V1iQVAVHY4qE7aslAlFGQmbU?=
 =?us-ascii?Q?mQ5a+MKf7xbK2m1rkIReQut2WXQIcxyyfRBx6pSjyvhE+nwsgw/vGz/B6qFQ?=
 =?us-ascii?Q?la6Dq88H2gExfadhsmBEa6rnT8S9EMvNKXTtqH4DDh7iUbrUlqnxg+vIihJ4?=
 =?us-ascii?Q?VVcPrIXXclDnguym8nQjOILEhVzJZKcuggOhPK4eyW8+/TFOf9lC/0WQmF/K?=
 =?us-ascii?Q?ViEG9qAMT88slQ0g6NhKL5yjqJc+oMGMFisD4PL1f73reTRV5slX0VgNZMdu?=
 =?us-ascii?Q?DLPiMiKSnpRNqvLq5IzCkRYF4XzZ4o61KqCdotW6RQxsrG6VZBxh7N37+K/K?=
 =?us-ascii?Q?TLuIbVz5q5aP+FRNTFBvYl4hBLCdkaheKgTWCEVvuF8DSiJL5PmV9IMM1iaw?=
 =?us-ascii?Q?OqzpyZnaMhG+VI3ct0kW+AQbvEQE8DsMd76Bsc+sO36DpzcUuXvoZyjvY2jp?=
 =?us-ascii?Q?W3JM+vdzWtfSOSPDxERwj+/6z+Hlt2xMvfmlwsKHSvct48oa5NLGMhjattdP?=
 =?us-ascii?Q?hqWdzN/Fd2swi65Qgn6UUHO3H2yZ9Tc3uk+/Qh75FAPQTZjD6RQU5kiqkJBH?=
 =?us-ascii?Q?nvtOt0poUOAI55SriXZ2HtGAhZkS0/CVwXBTWOeYexhpk+eRg+51BKJsSrma?=
 =?us-ascii?Q?ccjF+tIin1PpnBaJYvk4B4uAcL/wEAy1YbX67ab0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcd374b-1ea2-4e9c-4759-08db7d5f0893
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:12.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsNZRu3U2bA1tSOkWXuslGdzCii94YVwpLlbjYlppgsbNaiI8GASC9SXtIIRhGctb3aocG7wmK1fRYdO91BCzg==
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
 drivers/i2c/busses/i2c-mlxbf.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index ae66bdd1b737..2f60e5532b54 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -1080,13 +1080,7 @@ static int mlxbf_i2c_init_resource(struct platform_device *pdev,
 	if (!tmp_res)
 		return -ENOMEM;
 
-	tmp_res->params = platform_get_resource(pdev, IORESOURCE_MEM, type);
-	if (!tmp_res->params) {
-		devm_kfree(dev, tmp_res);
-		return -EIO;
-	}
-
-	tmp_res->io = devm_ioremap_resource(dev, tmp_res->params);
+	tmp_res->io = devm_platform_get_and_ioremap_resource(pdev, type, &tmp_res->params);
 	if (IS_ERR(tmp_res->io)) {
 		devm_kfree(dev, tmp_res);
 		return PTR_ERR(tmp_res->io);
-- 
2.39.0

