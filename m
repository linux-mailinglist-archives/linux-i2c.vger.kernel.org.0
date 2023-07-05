Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9867174857D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbjGENwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjGENwf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:52:35 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C51F1BC7;
        Wed,  5 Jul 2023 06:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvQVJ2IhECtydh+NJytaPn5NNqtwEtiME08GovwMYnWhOW0nCdyGJXQbdyaGmVXm2S57mxNBPKZHIdzhkrnsXlWn+7uPXcjR10spqZZorcewaw1+HUh8sXRWDDO2ho8LpnCW820DPXQ+NEZRgKJeWdwGg7Q928sI9q0dBARemozs+CA7yTTZ/scGNEm4cXYgWg/C68lZ7kU2HCJa1k9dM9pNnjq1tDjMNLfRbIW7bKTuhtAxZiVHHfkfPtKMS3rnvSUlrGeHcPYy4qRDUiajRuIMDXxVQLtC5v+QhsC29rFlKkaONZnWWuO6b8ySQq6lp2Me55PjylF87hprpxRPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUqjCw8dJAGGMwXpKJMBJI/YD7X/PDd5YfI8Bg34FpE=;
 b=SA4D/sDoyYzW1LM8zjVBZAQEA4+nAGxP90mxzyUM/7FKgJQk7aVaMimWf6AUqBW40o8xNnkcXsEIfVdD891YGkTSeKRCIXWHdbDcMjPfLe6oqMvJBPyuNIfZN02NYdUdWkB0TfIgJZIphuXzf/X4mI2bdFibnd+AsQTE6V44WEnVXmMLsmMEvJExarFrC6BDZE+SUFprf15TejLj5ymU2NY0pV6b/kfl8bx/lxdw2Bey4EltugkGpp7HaybbQs/XrdoirOHKi8ZL4CkogHxrVzkK9FAiJTi03Bsth17+iLgb9Wg3Yc+l6xnA+ppcPbafNXSqOBpScBmFkbDoJYAuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUqjCw8dJAGGMwXpKJMBJI/YD7X/PDd5YfI8Bg34FpE=;
 b=RYHduFyY0P1HMcpAB70MUbmOFVjYngEPB3lXrkuPnEUghBgSUsSMPcHA2SCVGXBaoS06Fp8Ez7hAqeKsbUWdfYIixQaZbFWmB+mm9sNQnSKePyElfvHmCV14GCLUvQ/MSSBO0yCzUE4RSph4c5mvV76vUBeN6COSCTOLHn0GZsiOOLCvT7J3Bmjg3BVY69shNlA/ylv7EdF+NGwyOtJX4mYRNedkGnCGRhhoiBJWRmBtzt65D/xWsbROVDryolUcPSUveRqbYkhBz36Rl6a5g+hB4CCvptoBEcmG6WYqHZAa/T8nFP0cGp9784kW19S9RTeEXbHkSS5/NIQ0kW+QPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:16 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] i2c: st: Use devm_platform_get_and_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:54 +0800
Message-Id: <20230705135159.33327-7-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 06993d8f-912b-4c2f-0dad-08db7d5f0aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXjlUcUcbIPqbPt3ZivAmqXz1E1pWXIwb+AOA2yGpQ2UX6i++aR0KVqo4dGSwl4Mk23NF7jZp3OkkcaEcsFZBJD8sZi3toqB9gSJL8rUtOFdJhcLuSvkG/d8ZRewiqoQW0vp6eSEMVgAuT+L9J++tA4nyHGOWEtArkeLW2zGONZAQCQc4hNVAUv/N9W94bVHSs21GdOM3rGTik3koycU0y2wQpolLb5K5SyUzAAecIX/QaqAv07Eu8fHoxyrO+SOyw43vInV5W+RwB7HXp4EbHcQwMGAC+2nx1Yx8Q+HL6+mIfseUsJAZ5lyWzwgFcRB+mWdsP+t7BBd0b94nZ+zEuTXrH1o4q5c0YB3GlpIrRS37CC3axqvxiQu/bLFNWY5nVEEIRyvjW7hRoJn0J28jXJRjGYnl0K3C9MHYAeDoGC7KNKhg5t0h/a2azLc+6s9PO9tvLJvB1tnvjQ7SL2oinypQ+Jm8UQUQ9u75su33caPP66o2Va8qbOh3Fq8orhjlg85MzPrPmF56oXLDiJpKVzGV/xACTRKTDGXJmFfXomEFPqrKxNLzH6xm9+LsivwBUk8X35PdWlljOAAvOB1VukAJn6ETl+4n0OZykWk396/N4WHJdFDYPzSvtSBczwn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(4744005)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PBJysH1sAbjVpdyUESBMVC3G1DBIu6CrfdCRXChMHAgY+LRR8H0ycatmOKBa?=
 =?us-ascii?Q?ryVqBn5KFrdcqhNMoSN0D7RKSP6FzdhWLqEu1HOk71P7OTtp0+K8Z04lYsLW?=
 =?us-ascii?Q?jEAMrsH7Fzt28Rmm+Iv24OUjCdnrBTk9HGY0fsNxmBUH+uJiBDEnrLzOqzEQ?=
 =?us-ascii?Q?3g24h+JbzSKZpEhWldCjryqMXjkCedp1/7kj2f+jXWj1GGaBpeTtgDBtc3gb?=
 =?us-ascii?Q?MTkyDPJZ6SSvSz/TGAy+kFfiA72gR7Bq7FgNbARr7H1Y9Rdy8jwqDK/hFxzx?=
 =?us-ascii?Q?14fuVLIxsiZdFAHzQUxIe6NS5tlTNFKdVC6eonwZwffahV6tmiGT4/Dfu/2y?=
 =?us-ascii?Q?Rc6ADQeZOLOOYFpTRsD7tEDrcrg5W701n3nlNkwcsX15AoESvm6j0fS9hpu8?=
 =?us-ascii?Q?CoK+w9f+gcPKYZu3XEiIdQN7Sdip5gUwmICNWC9napWRQcg0TZJm4IgR59sG?=
 =?us-ascii?Q?AjGuYANtDwvUOwQ6VERw+3A0mSrzBPNzn3nhEh/nBtno1V8LT6crKK6an0Ox?=
 =?us-ascii?Q?FuS+9Nv3VT1OWg4S9HK8QBTGmPStxKOXwUOe6atk2pB8uR4zJ6XUtEfXHZAP?=
 =?us-ascii?Q?HJwPBv3+BKGIKJydOwQ+YBpeb0jFaJeLxzpeu0lrot46SfiCp7QqXWxVzM8P?=
 =?us-ascii?Q?zrqN9AgPL4mE3Z+cuF/L08ymhkI+PT33q+wOm6yqJBfGd72c+kFBjFodu0VF?=
 =?us-ascii?Q?7oczPBpLfmE0zpwaJFEUi9SSwNI9S7lTSY78Xpaahk3ivTk/eZBi8AZ/7Jei?=
 =?us-ascii?Q?UKmcq8Sc11lpSfqhRmilppbVXzjDr+rFBozIfLzLQ9ETOGMrFtgmdKbaLFsd?=
 =?us-ascii?Q?DQQcKh3k7szX7GmcCfQjkc780+TIu8cprDWzlVPGtlKKt2PInnwwMgjUJR7d?=
 =?us-ascii?Q?vopollj39+qDYw/gk60vaIEzpyORXbVjnt+rEX+ISksKCEXoOcPeFWUm9iuq?=
 =?us-ascii?Q?bqz3AkPQUdfMUaTPB6cNSqrLJNYSUCc9lQpR7zPZmOLJI+H9ajF9P+y1ixAo?=
 =?us-ascii?Q?ttr7kJFOkIL10QLORy1FgDOZwt3oyEXvBL/+uc+FJIleFGb/QoMoR8Rk8WaL?=
 =?us-ascii?Q?lxesRILxsU2kbpVgL19xuiHZfk77Cy7KyQiJQK0Hwxo9DEiV9ytfWzDQjEfT?=
 =?us-ascii?Q?3elPFhzowFqorapSbPeUsMdJY837GLGbZu/eMLEh+X1smAB7oVuRPguggH/J?=
 =?us-ascii?Q?bY2hUT2yfQJjGdGIkenCaKNNGAhAy9WMhVbEKilr0J6AGc5jOuBS7gODMHuL?=
 =?us-ascii?Q?sMJzf6yILl6mft3CtoE2JifVJL9ZH2sTlx6ZEpgFgHPUSIMGcA6R4DX2Ifj2?=
 =?us-ascii?Q?AuOnvhSrOMbk4m3nlsFxiRgvX1CMY+L7tTOJXrANgFztpvgkjgDBm5mL8DIK?=
 =?us-ascii?Q?OPJ8IhFOSP484rsNvD3JmfiorAeC6ulkLHgI7SJRyb47727Me6Yp0PlIPWlf?=
 =?us-ascii?Q?cWwe+qp3py03UzJT4+8t8pKwSsDuF7YbOKeAko8xROOdXg+xpfsQ2R1yRh4O?=
 =?us-ascii?Q?0hCZMc420VOvgfjH/b1oSFvqf2AwmBQwydgAwqNBkkWlYC+XT/SozVxDSzGM?=
 =?us-ascii?Q?xwl7OlxdN4+ByOt95BepSNNBReF70Pb30cqU0De+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06993d8f-912b-4c2f-0dad-08db7d5f0aff
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:16.4499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxew/VH08jIdE6Y+7Zvvm20kpxMfH7X8u7W9lT4ZYeyCHSTiWkW0ZDg58eo65cM9Ld3u/UtKxCu9f5j60somVg==
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
 drivers/i2c/busses/i2c-st.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 25c3521cae0e..ce2333408904 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -812,8 +812,7 @@ static int st_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
 
-- 
2.39.0

