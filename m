Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C54844E316
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhKLIdq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:33:46 -0500
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:54958
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234545AbhKLIdn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:33:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESEFQGDQKvF+tooCSZNx9fKvyvWxgwtCS+JkzvC+t1D69xuEYCarCmAC/3rTb0aVOxmqNBbUFCr7MrowxGzam7Pmfz5G7P5XdJKsTfNZYmfm5OxUOxDZDB10RWn0kqf05kQAUVEYPletEZmVu6lTsR193C69QzJWr03aqe2WAOxBptmSo7l86yxZds2H5y7O3NxIBvzd4L+G+k9HyOVVvTYIxBvOC71FJy+udMALQCOjMtc+dvo+1Tx82gsM9tARYMoMg7X2ZOmmWVscDGC+XR773F4qvskcLSth/1BhbfD935RA7F1mvL3jgNWiRo+k61FrF0FfFRhlsJFbDVlGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w7TV4NZLns4E63Dqh/TLrfHeFZ1EVd0Mi7FD5QvCio=;
 b=kpq5uhZi74Q7/Sn+Gjwgrco9julNc7RRK4TEtLu/3R1aQaT92wlKJQNgNYDSacIdF677WUfd5oaMXg9s3m45tV0w7CTPPI/36TwDuVuL9igWOXGd3xFV9MbO4AAGd3ck2Kdds2JXyZ/dYxmb2BXy/9aMxImy3k/WaOOzPZzde/F2UAzbc5aQy9mRgaYtCXK1WwZ5dd+8NK0r6m/hbT8jUk5UUe4ur3K/6hTD4WDpYDRwbj+9r5mY+MA+77Yc2wxmaVFjXqtR9ZZ2Thvllwbcm/QsmLKZQ/KDTqBjiMo9ETKIlINwuehiHw30RyCvp3RMX3ilHm7Snmd3PajuhkyYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/w7TV4NZLns4E63Dqh/TLrfHeFZ1EVd0Mi7FD5QvCio=;
 b=LVTpm55PJ9CAXnqcZvUvoZU4A09henyZfiw9Q5FVSwVKTmdXK14cZ52CUykMlGOaDUm8P7kXKNZSuxYdMWwPjWyejwUfkawijlnILq/Nk0UXjZgKlXNVM9qHyGXVUgFlCanh/qCGQ0aqjUThGpko4Lnc3N+8f9K7vrZORW95c0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:30:50 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:30:50 +0000
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
        Rob Herring <robh@kernel.org>
Subject: [PATCH V4 4/9] dt-bindings: spi: fsl-lpspi: Add imx8ulp compatible string
Date:   Fri, 12 Nov 2021 16:29:25 +0800
Message-Id: <20211112082930.3809351-5-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:30:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c4f87b7-be55-4eea-512c-08d9a5b6bb75
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8493ACBD122801105BF88485C9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5rVdhc4cbcS0g532hNHzgQZeG84XA9kdiY7XcONdagsCYQ18YR1xC2k/4mZPNFL9/qzlsquW8X3MKb95+zAi+OrAUJ424WwV7CeEJOy0fe5e+Z7n1dDygq11wS52Jp+ZOE4lrEwJUe5jE5D/oNYqh0Ziv+FN6koafgq5ZEY2HbJeKZ26MkyKeZ5iQYCxRr+6WmhpdmK64ZnSZj1f+9uRKqSi8e7XWoj+5keNyYOW4w+hIlBHZx3n7QB1ZLIx3KPDvj/kTIdgf7hWUCC2ufXh8E5pEdbXfFn3gZ3g2dgx1bUpJz5H6EqoamdfLvLSEnoLdmbs/XBYOiPQDy3C2nOs9iuwXEwdxJuQam6E9B3qgmp/5qG+A8Fu3dJK1sykdjXKqbTGlEEVKG5FjkbLRJTDF2pXKqi8d2poB3bLVNwKCdeNUjFbTdyJz6M2bAYCMONVHnFaIGa80QcIU79YNEiQnIr95Z051g8N/WarSeZR+vE0JwmmuS8rAg4IP2saTBjvz3XV0QkJuWQvffTHNXT9z0T8ty3fHo8+IiPYli6JZmGRJovyOrZU/f7TFn6roZ7k9MEad8bamcRCd1gPQL0BVu1TPpUxenI8gIFmD7Ri/BIlmn5a6OCXJbpOcAnvRtiQgheqMf4IfyR43mKvYsSCGFNOPLoaJMv35kVJnJ8jNv7dQiFWEFXwVFqKiv+r+5PeXV1d03PoxmSiaNycMj7Z+mWxUMqWHUptsQcyy9FhMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(54906003)(6486002)(2906002)(316002)(4744005)(6512007)(4326008)(5660300002)(6666004)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jGLYxcOvI0201BYPcoUss7/MPi+gv2kstnh6BDKGRmO3wMVqa7tOQphbOs1j?=
 =?us-ascii?Q?7QqmaAUzeCxdnyLbpLHhCOF9RqeAnie0V+Pik63Nzl7+CoKEfENU55W3sWj8?=
 =?us-ascii?Q?ev10xEWBGu4ybFz+ylJqsBznK55rZkGrim9KOYgvmGqPxKwmpYd6VBGIOPbW?=
 =?us-ascii?Q?5u4leBspmlvwbtRUmsHqBx5YZU5PmdC3xlDKfejDodU3BCUypqUxcvDo1bBu?=
 =?us-ascii?Q?xTVp33gKEq3Vbjl2UXftaraIBX9ZeUGhEovPhu1hahjezkGlaWS7LiHwkySx?=
 =?us-ascii?Q?XW/j0wbVEH8hXpJlEcSkRJmNzepDflQrK+HjLjprj8TZDyMcOF0QEdeZStao?=
 =?us-ascii?Q?vXhIg0uPKsURkNczuTZ9N4Bf7mltXHdQQh2fJpxRSJbpaiqJciUaSwpOJ4sQ?=
 =?us-ascii?Q?GA85HbM6I/TUQW7QZIfZ3hy/lUDBvnaVgYgXSIQ5Ot6UNv3vC7pFrJOXDne+?=
 =?us-ascii?Q?49Vfsg5tglXeShnnAbt0XdvhypWaHYF6DlQot2K3poynA4pXm3Fa6a1FUelC?=
 =?us-ascii?Q?f14Asxr31g0YODzOFE3WSy1W6M3UzyLgHd8C8dx4TPQLYDrI8AgCS6P4cDpH?=
 =?us-ascii?Q?mMVs3x3ThXwVNQqdFAPeQUpXtJqUkQLqqu+vBVQzYmTnoCzOmneZA/VNSJpq?=
 =?us-ascii?Q?+B5EALlpzBJdlP+ECZaPNc9pk96Jn9aZKBHlEZE/zb8xp7YshgPhn8PCNYtg?=
 =?us-ascii?Q?ZL5AQkdVFmNLC+I7rZlvLyM7YC6S+2OL+fQKCJOWikkD59wlQpmXcUzY0wIb?=
 =?us-ascii?Q?y7SDYwOnYrdTAGOg19qzrfLa3ESK0cZ8WkNC/uGdURB+g7LqkS0dfOPnA0LT?=
 =?us-ascii?Q?SR3Ax7w61C4EX1CepZ1O+m3SshQe0AdpKgvqmmCKlgBr0pzh4/EMMv/sxq4n?=
 =?us-ascii?Q?SgthzNfU8rBg9Tb4vKdlzyUGwnIx3kcLXokt9GPQalckwZv2EfblVHTu0nQY?=
 =?us-ascii?Q?aANzOIcGootEjHi+mHO6YhQPIABCKwu5NZjv6fsGKUgrfBeI3zgxvGKtTEnO?=
 =?us-ascii?Q?8WrMNlWQX5Zr1MFqshc/WLiHGYglEGcl/xvwYbTN5DcSIqYcxRyoIjDs8++f?=
 =?us-ascii?Q?z/JY8agidDN+sZ99zJMLtPnrBmyaiT6mQNb+OH0Vd1GjDOvu07BIFXk8GhWV?=
 =?us-ascii?Q?eSb+zdnjkyVFQpm69NZ28FaxsEhBJlBYr1mivDB23UtuosPOf8qT3Puc7I/m?=
 =?us-ascii?Q?oxl5H/HWDUwRnr0BP7//I0hGE88v9Ciy5EdIM7YwozM7akBefh8I1TP3S3X+?=
 =?us-ascii?Q?MrmmjQ5U3FkkMab3/IB9b8vbr7/mZVdswn4Egq7RIlUD40r5qEeW66wnAurn?=
 =?us-ascii?Q?LK95+H9eZcrr6Us0B/h+Rwm+8cbU7Y17H2juTWv0pI2vNhrGteYBA3rDwD2b?=
 =?us-ascii?Q?BOqaC+kT82uti+1uosx4gLPwabSF9WeQmxuJBoRXWqRB+tg5vY3LQelRp83x?=
 =?us-ascii?Q?1H6REVRAIj0xlTBhjXWEBnTdDdiqDeBhKu1bXTxZMkr7KP69MrXd5rxNR59m?=
 =?us-ascii?Q?h17j11pCWj5bx7mS5wVijEcQcvv3gPjxPzx7UnASyAnlQuiWztnHNJXrmy5U?=
 =?us-ascii?Q?CqBsPUNejB9NFZSy/m3cI7Txrw1+7hkCwZNxc0Abe4+tDTAeB/BHHjVLtgyd?=
 =?us-ascii?Q?7jhwCA0XB/YAagF7mI0J36s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4f87b7-be55-4eea-512c-08d9a5b6bb75
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:30:50.0211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9D1GLIUK3KVEYLLKqFpnEfgDFbNaMzeOGwO+wGHXySw3kzYr+Sd8kEIMHbnI8V9IA8V9RKA15qjdAQNaS6fsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The lpspi on i.MX8ULP is derived from i.MX7ULP, it uses two
compatible strings, so update the comaptible string for i.MX8ULP.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/spi/spi-fsl-lpspi.yaml        | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
index 312d8fee9dbb..1d46877fe46a 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
@@ -14,10 +14,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx7ulp-spi
-      - fsl,imx8qxp-spi
-
+    oneOf:
+      - enum:
+          - fsl,imx7ulp-spi
+          - fsl,imx8qxp-spi
+      - items:
+          - const: fsl,imx8ulp-spi
+          - const: fsl,imx7ulp-spi
   reg:
     maxItems: 1
 
-- 
2.25.1

