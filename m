Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA91644E329
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbhKLIeG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:34:06 -0500
Received: from mail-eopbgr80088.outbound.protection.outlook.com ([40.107.8.88]:36352
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234735AbhKLId5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:33:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJPYZX4iIBKvA6HXQkJeuVt3X03Ahli8xF7MfQI+5NQ/tx94UmoeTYve/LOBfFkBXDqcqNAG8yOTnU7COlX8BpmGIfKm4ei2XP8mBiMSd0vSwhGKnmnixU9ZdPMpl01fEmOdmh1t3Iux6l4edDMe8bGm5DLorRR0A82t3RblGFDxVY6n87A7AZZONg/+t47sgO+zui8OQLaq0uu4sjmx+R9HnnFVtUFThDCXesMmAmjbhRz7tLFQ9v02KYXExXykTbb9gwsZkjmdz2km5CaOozSdtQihCRnuPU6N4o2TypaHAp8pkv+GQBTu2u4Z7biO7ql852s6tR2rdLx1Vi7Iag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbKIrJi1RjWuh4WUfignk2Pj6BMi1SDgjqfC57O4bPY=;
 b=Q9kXfzlrj/JUkAT7YqP3nRRnwX8gI+v0OVOK9GxXkTQ6txswH6Oaew5v81NwM63trdjecAfWRAHp/ckSwTLG1O1v53KPzDQ3u1zpIs4UGBcZOgTACze4d+0imOYsUiI6DC4BjUW1nOwVKkjNNyeBQ9AVOBuQARu2mdYJoMUlL8DL0ak0I4z20ulByPrby5NezV9hNmgaw5vTKX9Ks8e4L6+XC6MdJ7vTjuZ50n8a47AwFRXxtSLdMQyDKINjqEpueHgyoWoMGEwdDdI6niqqmHkkwjhBqzgBAX8eQ8w604iDZ3zX1fsuAlXqD6vU5TBio05IL9NAmogKkqz8ZtB7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbKIrJi1RjWuh4WUfignk2Pj6BMi1SDgjqfC57O4bPY=;
 b=P5+DfCWN+UVdsT310y31yyuiOEYWjee7suL5+IdW2bThzCinxDucov9Xiv8pvUHYNr2pXdoGtuMiouBe9cAG9eWQzrzGjfXxWrOe89wGMZoUaS9Id4AwnwiYNCQNJNRdSSbk1RwSVm3u/1ueP/JbQurSAw3KaiBCGFmllQTPVN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:31:03 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:31:03 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     robh+dt@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ulf.hansson@linaro.org, broonie@kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org, linux@rempel-privat.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 6/9] dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp compatible string
Date:   Fri, 12 Nov 2021 16:29:27 +0800
Message-Id: <20211112082930.3809351-7-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
References: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:30:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb54970f-c6f9-4ca5-ffe4-08d9a5b6c360
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB849315B33D31582E111376A5C9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CcH13zLbPDcMKvLfyDqiDAosES+pFL/jncrbEIagja9p2shBnUZzCLwBpvqIbLLpIYQbKTR+3XzWQwaj9I/DidhkKomKk/6/+qduQO78c1P1Tbq534BReolHlL8ocGnH/+L5VPWmx+tIrmuH3ZkBnTCoMKMMjWnvu49/Lkx5vHKsLA0jz69p6KuHQY7tZiRP7q51MDKmQi9HSYy5j0enMUj8VBl+govO1o52JCVTCPUtq0Z8K9njZWAoSDyOFH+DytIL3E2/TYMlwYd2Y7+lcv6IxxOXJjjaOBjWqf54mTEX1Usfb4Q5S6jByQ0Y9ok4lk2nLr6gZNM+xnnsvG5skuPphAcvlMiy7H/wqL/vvheGWwQ+257jmoka1Ehdu72bdJWVaSu8m2DSoMj0ljGbprwhpDnc0aWD1oZ0ZoarZy04CTqAae+1QQ0QVx1+9rRcKdlnzsDyFumjDNUV1CQ1UlEskBFuaWagniweAAj6Fz4o8yt+WXm8hjVkrT64La8wZ9d8Xz7miCvZ8xfGFKBFI2xAXTaOL+BOUx46vCYTeR3uECnBDsaAUMyywo5s5D7kHPHm+u2vmzMr+qTUMKJHnSoyayR73Yt2c5oKWjqgovmYRknBm5H20/ORo3h9YhFNqKwaJWS6/8+0H/WgCZdEBnpK37Zmjm4ZxQit4bxWgeFaTw1ssYnpWLFRYPlqAi3I97BxiX5+ljzpuLArEJejKtU1AfaOn6XT4BigqY4Z9mQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(54906003)(6486002)(2906002)(316002)(6512007)(4326008)(5660300002)(6666004)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ONOVAr7aWn/wO6lis/NnIPhUs3/oNnvN/xOxjM9IH4UY9+7/s7V9rzvull2?=
 =?us-ascii?Q?kttulLqAZ4d14tvLU94Gx8KtFOL5fueqt7GY5oeJEYsJR0/TiGtkTzw9IGv8?=
 =?us-ascii?Q?ZXfGgVUKyQu51CGRcqmErDQPnoU5w55FSJHcv41ywkPCUG8M01LDwsBZYFYD?=
 =?us-ascii?Q?qw+1BC/5gHlX6SUTQHOJlWPDdFYF0ndlSc2ysfkJLHsPvPYW4p9ZzvaYE+fg?=
 =?us-ascii?Q?bo5cEKTsY7TXEX4pZWpjXmfQaG2Zb/ynoJD//kneI8JMQ71kFzleFCwl8AYL?=
 =?us-ascii?Q?YEpFesqMIUCQsusY/J8mkp9eIxBklZpMUy7SNUjj8V4r7zHEOCevfw9RPhPn?=
 =?us-ascii?Q?eni7bwgyOv3UfBNLMUlGDMvVjZIxAICaiv0w1nc1EvE3Lb8q18RrhpqHeAnr?=
 =?us-ascii?Q?oZ2nYCCXcD96n4xiNKmRC+nSjWqrt2xfIGQ8n7mDxbR9D59DiL/Kw3DIeQlY?=
 =?us-ascii?Q?n0x9yft7R7TFXs/h31xsPRm+Xw4yzgVF8UJCTymV1rSqypdbkpPsYMXqyDc9?=
 =?us-ascii?Q?nHvr9+9z+bdxkzSv59IQnaTvbZOUfWpbdnlkeKnmySHdEd6AdZPS2alUPWc1?=
 =?us-ascii?Q?EhZHmvZ3NzLWSPEt1NRTUXA7x49c38D56wj/ii0YAngmWEXkGafC3K4fMuGY?=
 =?us-ascii?Q?9EuQ/ifnCMffpapJTGYuMzDpz5ZLuS7mMa/1tGztldqPOF3HAlJXd1xYaQ0Y?=
 =?us-ascii?Q?H2267b1coE8kRLzqNeXgidhvUzGpfR6/Up7bVqTE1DR+CJAnqrjpFmlVTDkM?=
 =?us-ascii?Q?NXbhuepql43pTXnh0KOkPR5pbfm5s0lD5npRmbcWpLEfGMu48ZkgGZaSHnbW?=
 =?us-ascii?Q?tGcJQcsFvmW6KKKo/oE1flJPeEXqSePAV5ZZFNyrXy8P3tN625aHL0/fr5Fk?=
 =?us-ascii?Q?prqRa1/Fr+7Xw07yWst0slvvYMIrfmOyG5b7CVXlHRIUFlj3f98EhxvmJIvz?=
 =?us-ascii?Q?UmPhbRs+p+tACcRgAhOVroshuZkVi7MBq4xL60XIlRVX0jlO4ICZSiZ3s5IC?=
 =?us-ascii?Q?B5+yGJtlWgsFLR+RrzzsK5/Wu33yKiqLwjkgoDOW8UqW9DjJkSjsu866zHNw?=
 =?us-ascii?Q?rng2nHwQPCvN9ZODAkmXJlHsr4vor7oYrCqtu2VMdYeyBlGFoUWE9rJq5p9B?=
 =?us-ascii?Q?5ELt0iPBZbFGXf7Yt1Y8PqULa8HUCCRHcMmgqdW1RDsEsLsC9EpqwaKzShUO?=
 =?us-ascii?Q?/QDuAVn1Ma/7NpGVU2pu4Ib40Fy9cVV2qzsJegjBScXQSq+vK0utY3kWy0n/?=
 =?us-ascii?Q?1djy5yo3rmPUScZtIvSbpk0/5TnfjBmx7k0rZI6S/iRWiZ60yUprwz/t6rl/?=
 =?us-ascii?Q?v86Rx4Um1xx/RnmetyCNG2RWHfKgJN5WWd+vrhH4URmwtsiqdAU3Z9ubCHqp?=
 =?us-ascii?Q?lTjmhWiMalfK4YtoTFab5wrrIr90zERPM7SWaJdmj7ejfU4DeNaWQWzTgexC?=
 =?us-ascii?Q?sXOx16mXowSKsooiS81Mie3w+3d4r9H+bbrxPolWsYJmjQAMi/dJfMQK8/Eo?=
 =?us-ascii?Q?MCo9CaWFbkgF/uGBqeXuNI7B0BJB3FWyMr+ww1oa8XxMRrmARmRXUdVOU+Ig?=
 =?us-ascii?Q?yCyAIIH2irx9X+IRDouhq7V7hVdHjnMcoLbDG2a9n5mGMQuf2lJGXinSMSQL?=
 =?us-ascii?Q?Ot8jB2u9V9I1zJuqL3DfEJM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb54970f-c6f9-4ca5-ffe4-08d9a5b6c360
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:31:03.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6NBy2rC/5KHc62hLsQBpDORJj9F3LUzaFuFdxnN1s6gaCSw7FXltcpEkOsxLtNMsxBW+pSp4dO6OTpfjEYMmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The wdog on i.MX8ULP is derived from i.MX7ULP, it uses two compatible
strings, so update the compatible string for i.MX8ULP.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   refine the commit message

 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index 51d6d482bbc2..fb603a20e396 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -14,8 +14,11 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx7ulp-wdt
+    oneOf:
+      - const: fsl,imx7ulp-wdt
+      - items:
+          - const: fsl,imx8ulp-wdt
+          - const: fsl,imx7ulp-wdt
 
   reg:
     maxItems: 1
-- 
2.25.1

