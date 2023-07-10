Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 781FD74CD12
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbjGJGek (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGJGeY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:34:24 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE43E40;
        Sun,  9 Jul 2023 23:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcTc5mcQaoeayibBCM3xB/GdhmHeqaMzrmR5tl0L2U6+DqXgHzJkoKPqvPnRQx7wk6WNvxzuuulXkejeu60m3qmFW6GofWnDFs0tETrfZsp+zZf6ndi+xVtjL2tUudYDRNrobpHkVHSYfwH8hfstMf5u/WaNnoEAz4sNBY6qLdQk3YhoyzKu3nR+nak+i8B4CJlCdO2hNTe31e9xL7B+9Kd01SIGyAdj9gsa28LAlYAYAZOvU4FJGW7u0jNtFqBHC4+fO+vb4ALeJhjJnCt27OtSRQrfNrADDO/jHB2sl29XNsKzvYu1F5vY5ezcL4iBFkjaNkZ9AQIQitTx7XGdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtGdsGjKwrkleQHLRTgg+RRLnMhaS9ZoWfQWbgk0L7c=;
 b=Ey++zx13NwvU4pmEQgpi6o5f7LuZWBK7uBsBDGgPlhiiSyiHA4C3YdX6EoMVGvi3rQn1qNE6lFReQ1+3gfZljpYY6GJDu9VNJMwej8mH5aJV5V8L+ZjG0fCNnhzEqm55emf9RQXcL/NYn6rN6ku029/Gst9jxabb4RDYZDzs6izg+wKv95qx5VKwI+v3PceEfNZGA7YZ5NZTrAJ4tU9wXcycHjK4/5Nq0edxQoPo9oUJRO4Cika3rwWnKxn7e94qCkytPxUtAaXBLsIyF2RUz9qsdgX+7gixaEslNfrQA4OkjfWHXGW0pM8JMqqe1T/I+UJeVHDr166uxHTnNCY6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtGdsGjKwrkleQHLRTgg+RRLnMhaS9ZoWfQWbgk0L7c=;
 b=OPABu2nVgLBgNoKH+OtvfwYuHdzPRJol9aRf8F7Gd7lGCLzpuKZgIOBuozAsAmkHHhO0VGp9+56aek6HrATt8N7g4hjmRInepTVspBx1R3f2ZXW+AFOAVV7tfakS1G8zCRv2/UvR+wOQa4KZY0wyseLVzqTIz76P3lsmlfiSjeoKSEeAvuz/myDzsJgY1QUPAXmLXJTuwEBuZGlmXb8alaxA7gqAanQHzOSQj+TlGiuX1SceaCHLQc+dHPn+o73xSscukD7snqiZGkFZYJV3ASuofm78KYWbNvW0hqVy1F55bJJEY90UijqlCFWk0daCzaBJusQn4eAZKVRP2VjQew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:10 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:10 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] i2c: mlxbf: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:43 +0800
Message-Id: <20230710063351.17490-4-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 58163408-2c4f-4170-9264-08db810fab54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iX4ucmjDitEvrcMdJ2DnM/zVkgjV2cq1D4CKrpC1os4ERAF0kGacKocr65xZ/wgi5cyDpiaNi7msH3CX/JVFCPOhKF83o8BCUMc+F9jhbo9PJBrrWEX5goeUQ0fCYaIRTjdjDWoqBc2dy+q1jHLQCZpKVZL+Uha3Si/e46TkC3bU0iNOhdCbBEG5RGR3TSIpYognShK9lYbFJKtGik/YacmJtQUggUlqk2WTRLTEpFGflYuvDk1QO5N9V7yd9zboSyOi9xNbHg5irlgbnKFLN+t83TjLuUArw8t29AAm3yekZtauBsv23DOEhaHU54m5Sxu3OTLYIvR3mKer29go9+KoQe8zhWwANqSdBNa23JZM3ekQRIbQpH7qSIfghqaveSXjieyxw2XpkVEE/N89oBBW5dFxMMAUImqqUkejSTETUURtjLIhbBXGikJ2V7KSFxo063hehn/UVDs04fMy3Z4AZdjhbe5eCftpBpLuAiqwjMNuv5bTrUHO+8g40Ys6tflwzDedCVwf98hjsfv9TuFDSG8AvmaMsUlJB5aJ8kWyXJ+aUwoFwYIT1nopAaSbJaLZSqRf6vdB07CtOgK6rfk0zEcirDKA0zt4i2Oj/XSg6pk+vnw8Es3Gb7WU19ujOxFvfbbM3F4/EeEfsO1QVtC1n8RljbIRJIz/T2geiBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(83380400001)(36756003)(86362001)(2616005)(4744005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7UCi866kXhzQi9vnw6wqqnD08gGoRT4chVnepNNGXm/3JIQdkl2GXm83EX82?=
 =?us-ascii?Q?rzMe1n/Ay2lP31M1svek2zC7q4NEzo3k/fpLNCMFNnxQrVAH8P7WK8pjk/4H?=
 =?us-ascii?Q?A2mCuhQtWHbH8Y2oLz9oAeTPCLswCX9xo4vo7j/h6F1wibFhDoxKKygoxcgb?=
 =?us-ascii?Q?hQfazNW+ZEC/rJl2DhwBw3XFUjldvLI2ZZPyNRrTeuCrhzNjoV02YnbEXs2S?=
 =?us-ascii?Q?65M4c7BM2snBWhl9XavVfFjblx7QMopGwQHDextgPB4qxZ3mH5XdWW9eLWW/?=
 =?us-ascii?Q?kSDx/+Ud9QTlHLBq0QxJbSMwtdOv0xY4CYBzmZjqYVtixaL0Da8NSaQFXVGW?=
 =?us-ascii?Q?P1dIPrMJz9Z+I6wJoX1tfKqD84kbtzKf9edTlzdwSz5J8E1uGr5CMBScGdnz?=
 =?us-ascii?Q?i4T8M3OTToSJfPC8xFqCT0jdR9vwb633UfTi3rBJOXsfPG2CyBpdK0bwpCAX?=
 =?us-ascii?Q?gmmNlH+Pd4z+EjhpfGAxTxiSJNNlL/L8KMCXDKe5HuX3yRmTLIiCEaV0Zd/t?=
 =?us-ascii?Q?uJHZXfPdcFvMufosQHu0n+rWxi7Sghd4QwOMhadc1xlF7xVELFz+pbuUTn7U?=
 =?us-ascii?Q?WgNleW4xm9/u01wr1J7T53smGXqUQNuHcoSr7HUdWz/PYk4z+T3DoFh+hhe6?=
 =?us-ascii?Q?+ml6Y0vD5yVtxGNnIjt3nNbu+NJY/nrU+F3ESjKgcM+k5/Q5XK675BD4Y8gY?=
 =?us-ascii?Q?YfYdEFWq47dqIlDITwuwQHhXCHFs+aRpSGxQZnACgsGu2lpOvC5iIdGybf80?=
 =?us-ascii?Q?Fqw1prQ7XQ0hWE0iVPAx8PhFC1jZ1JMFphh6bbqegS4YWEpdDixZ/1tfg/RA?=
 =?us-ascii?Q?iDfZ5zn48eq3oHLNtOmv5LDcax/ZEP2RDe5Q72WW9oPPWwFJeVwMLs91s3pv?=
 =?us-ascii?Q?Tt2pI92p5+9OVU0qqJWg2l5hg77DkZHmbbezY6IlK29oD5d2sWL1NViwgq3Q?=
 =?us-ascii?Q?4OJC8kSopjDWWVUho7mHdMoQ06dnP17k2QL4KiFJtg1EEYiS8cygbW7Pd1GH?=
 =?us-ascii?Q?UCLAL9bfW6OmagzgS9u17wX1crmQVMYPY5mmafnG5AFpqCNn0DOpwM3kRtJB?=
 =?us-ascii?Q?UstkAj0S8dAfknekPyi3IwIm06nyMX0SvX7bmlX/L+46WiablYYekuHvBJ5k?=
 =?us-ascii?Q?SxlOfdVFv+9xQG+jIpNyrnvfR1qKqY+8Tiy643yk5sRQMvExTp0AmE8/doHz?=
 =?us-ascii?Q?zjpuBj1kGpv/1Yaj1kj2LCGjj9XdRsoRLG95Q5Dk8tDrV51MmygeYw8T+8mG?=
 =?us-ascii?Q?TNHyns6hQ5ymJCOf3JTMaV2lmlWjed68HSzP4Q8UuDEJW/pmV/0SxZf3AWej?=
 =?us-ascii?Q?HkfB2CGY4y9NQOd3KPMAgyIYCmTGuUs7h9k8BLgnjYY9iuLrMGKaIiorysP+?=
 =?us-ascii?Q?K5TcIjZeTfABcrPvzV3jlWwr7c7EcggIx3v3BRKKYNyVrgjKSgD7NFxZcW+t?=
 =?us-ascii?Q?qM1o+lYjh/f6SUzYpcnDXNLTbNf+utR4TQsJzSi2lDu1MFJ3zhRuBy+tuLFi?=
 =?us-ascii?Q?57mdO8tdSJ7rSp9xVP9F9t5cUypjm/LIlYc1WsdVApP7jQbIKMxN9nBqUQwD?=
 =?us-ascii?Q?wYPtrakme8wtenHLHkW7nzEnC6KNDiljFbjnRx/L?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58163408-2c4f-4170-9264-08db810fab54
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:10.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4Zsqsn1aoDhGTJ2kygevMMPPK0GNnd8J7r/i91myUF2xRnok64DeIDksPkN40jxfxKGmv7Tc4ybgR7zPCDtXQ==
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

