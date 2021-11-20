Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A4B457D8F
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 12:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237124AbhKTLji (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 06:39:38 -0500
Received: from mail-eopbgr20082.outbound.protection.outlook.com ([40.107.2.82]:28418
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235609AbhKTLja (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 06:39:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NohmkaStjsvYRJtA0OEwJv7PW+dLjJ4j9WAXilQlX6f5RlP1nCStVm1sQhQX4q1NRxyAXlNBqgJ8p4+fnwLExewKxcRHE0Vqrk1sfKfSN0mG8Owj/N66YkJ+NCykgMDt38SjPFhOZZj9Z3d3L64Y+WBzaKZA4WbZ+D2/J1AyqodXRMGD7Fu0ldoPXYKa0aQ3c8cXpTbyVsyP/h2zuI0cadQEmBiPJxLYVVi/vBzLR14KpcqMl4kBwEYyI9E11Lp1Gyf6WiM1w3XMlAmvwmehhJNbBlgWee3Crp3nlq5Pb9xHa2hVHUnRSTSEY6ataUe1orQ95IYUs6jUk8q1Cnv7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAFdi9W0X/17DvTIs8x7Aqu3f8kXHTuAUSsWiJ6lr0M=;
 b=avjaAerTEJyr0W0UNNu96X+oTqgHkdNF4GMGzSoqzPF0LerqAiaE4nX90RzqMQ/ueZa8d3iEMybaOdovyUkQD2c4se7/DIQ/bGJhzc9+cOK09x2Q+4aTLZsQeTL79QH98UR+MX86oAx8dW+/atKRHftBOAL+LSy7AWbi0opSZoiwHpkPmfeTyIcrGKlaIAVFnAey/0SOUQXw7tmHHK+fk0T/u/lOmC04jTY31FRDUq8b5PuOjhkhS6dikq4VzMCSWIiw4l8Q6yVRB4pFM/ExpjoHu41sSR5vyTqUQ9f3UZaPnuPwDACLCMnIRig+T41d8GgrZSU0VKpVHepPXJIzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAFdi9W0X/17DvTIs8x7Aqu3f8kXHTuAUSsWiJ6lr0M=;
 b=WCV0O0Z/oXLx0Av6ijvlj19OdH9fG/u3Zhcs2EEi+gNE9+s8L7X0qqNZ6BuiQhH/dhNfUio+sWIr+01V1QSjGvcs/ZGotgPgXz9DZmub+UR6c1IvzWISowNy0PUgy0qWTrMy/7sGqYnkx43Gthn2OZvVTujk56bRiDv4UCEBBK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 20 Nov
 2021 11:36:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Sat, 20 Nov 2021
 11:36:23 +0000
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
Subject: [PATCH V5 5/8] dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp compatible string
Date:   Sat, 20 Nov 2021 19:34:51 +0800
Message-Id: <20211120113454.785997-6-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211120113454.785997-1-peng.fan@oss.nxp.com>
References: <20211120113454.785997-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0029.apcprd01.prod.exchangelabs.com (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 11:36:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4327416-86b3-4805-6c1f-08d9ac19fab2
X-MS-TrafficTypeDiagnostic: DB9PR04MB9308:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB930838FA94A456CB748B59BAC99D9@DB9PR04MB9308.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WeWBu1O9wtFEuHfWHvMCrswLlCIuUsB2UOgtdQy6uLhNUHz2mKYl9FCxOOwBoYTfG257OhaVUsxMnQJuyMX8IzbKolVEzhym0gC05Bk7HKdXr1ZCrH9H40XVpdKxKmsW+08Av23w/aOd6Sk6K0YMk+o6oLwaDjb+umMt7XTph5LAZHwEA1zPqRiMN4nUorY79speUPGV9EbSo4yMudDEcI60md1WZzodFgVvH9dJdK3IUXJQLLqNKitWlupvclC5JK0bg3EeWJ0yvi4NaVD9hc4nXypC4mngG6rTdZFN5KDD90lhOeUzsPT8uQq1/VVLMugQKP8gpG5+76f1zpMVsY7FCY/fmHlF7llk437JIx5abmymcmXxCHf1/p7MF9bGd8FjS0+jOag6fZOy9AQgTBVWKjXm4fOW7kQz/WVloVjs72HoEIsoMvGQhUFL7frivQJSVXbQc+4e2pHM4IujvK1ZfzuPe2WQBrONOrae65MyKTnRo6/uo57KQj+Rb6LtxsXzeTyHqK52P68Nt0K7FmhXyReC/wsmzUOjMXBENS+WX0pj3fUN8Pmh7HISEzMmg5NU1M42N0EGpMG4DVg7wxOmpVoflMesCAPrXhu0Zg1ecytyy9Z+9OBNzbD7QPlUKTVq5Wf124wUAEBFy4bWApLSCjFNwftQetHGIA3zumLc5ul6XTbgP4sLmbLVCgLDxzfzPpQQ28MRjmcl6aIHz3/1CG2xXq2eR2aaHvu6TiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6506007)(8936002)(4326008)(2616005)(66946007)(83380400001)(316002)(5660300002)(186003)(52116002)(2906002)(86362001)(956004)(7416002)(6512007)(66556008)(26005)(66476007)(1076003)(54906003)(38100700002)(38350700002)(6486002)(508600001)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OGc01NY6nIEyiHjwflZcEYoC73Y4chKqbNHJ+HpLb66WJNDaaivJ9SxPKL3a?=
 =?us-ascii?Q?t6uNEY8IgMXnCv02dNLGirZStc7TmMpnuGZTN7sFvpI4WdzYSCFI3uDPqNIV?=
 =?us-ascii?Q?aXCo+U8AiXBA+e22rQ0vB5PRKsJD3YaHR8w5n2Pf8oH/cwALDPAF0W09dW8e?=
 =?us-ascii?Q?Fn3R/VFcpUasRx62umVaXR6ftuF8fA4VmLQR3Z8lwf69TwrUkvaLRXpH2llt?=
 =?us-ascii?Q?o8ALEQBajg6LxqPOC8Ykzs8LM/m1CkpZA/gX3JPmNCM2rZhCnMnqnqm06o4g?=
 =?us-ascii?Q?4fTlM1I281raKUPoeqNyvFS+3iGRgkGotNpbVJjSk3PDRK7+iG5JPTL6yirf?=
 =?us-ascii?Q?1Y4DC96FOAaJD9RqOd8S+ZFsmicU+pVUrALjGEJrHVfoskjroYAu5SyRUcbt?=
 =?us-ascii?Q?0ZGZk0AR4r4wyWj63zZO1+yVezeijMe0U0/Ny3sPCRCfVtf6sgOD28eb3esq?=
 =?us-ascii?Q?9K7UwqTCMlYiekT/Kl8ZUA7T4bamg+5ZFDPP1rhI4xnt46XNZvA3u5bxAnE6?=
 =?us-ascii?Q?9o2v0grrEVhOxNKz7MTdYavRoq+wuhg2JIlCvl7RSWbJwabVGs9T4jWUSJQQ?=
 =?us-ascii?Q?Lxx9Rdld1LCSSfZek2Tu7ZiGSvs64u+XYaPzRT50Ux9Jg1/fHex/w+qdcBCL?=
 =?us-ascii?Q?zAlf3BFPrhmSvNl8WrxbHcMxxDe4YZKnotq4ofv8xgleHDHTB8IZEz5zil7q?=
 =?us-ascii?Q?GzbYlc9WM2doE2yJAeAf2oSW84IZffyWfM4HnSJm+f9Wi2Gz8mfh1Y0CTCPg?=
 =?us-ascii?Q?ICGrUkLZmzRLKP0lnUaj7+IMesJr11A33FiKMOpByDWhLmu4wSTo/C5NwqBd?=
 =?us-ascii?Q?+XLdZHfOnp9zugkZZE7nBDLTRagVzz0En5llHU7Dfgvm+lR+S9S3WqpDojX4?=
 =?us-ascii?Q?rBb0BPwcFysz92G2GwQNlJYdNmACwWsqzkHFonZwMTk1azyCRkoeh9kDklqa?=
 =?us-ascii?Q?6hArp1CTBuY7jJJWeICME0fymrN7a2lE56e3+gD661KExXbHjolWzerjAfpd?=
 =?us-ascii?Q?KbUji+E+/xC6biRyRz3EGzrmCY3jKnnqYTgJFPClztwz5dp/UKK/Ptwpy6m0?=
 =?us-ascii?Q?OSla7wO1xkJOlYsFYKR6M8FRh6NnUajcQ6dBMnv7dpZvsuUijS0ADiDRLOm2?=
 =?us-ascii?Q?j4HayxFk/676jBz17yAbzU7uVItJX7IcaSRP/9gWv5wNkN5J72YR3LBmviBj?=
 =?us-ascii?Q?Wf+Wcyb+CgDa5+9EDKeUfgRyLuZ6GYH5k61AV/7JJ1ls2k1+lWbsXtBm/SKG?=
 =?us-ascii?Q?yP8DQYsf5xDitQLP4EF6kvh7lnLbi6pI3eeJ/3ANu2OzBQXxf0kcxRsoYxFc?=
 =?us-ascii?Q?R5ZV2mR1JVYW1R94UpXhVFEHCankq7hUFCFtTTmLGZn69BZvB4DJ4c51Z5MT?=
 =?us-ascii?Q?i1AG57xcyok4AsAXPuaurEg1PrU/1ZlqqoIt+q59JNRrOkfvTNK/nKvPnH0p?=
 =?us-ascii?Q?p3XdAO8IZTnU363VmL/2kLYvI8bn+mbDS4wRtMPVMVRynwGjbnxkV56wM4nA?=
 =?us-ascii?Q?VZTMZQl2bDZ/iOuBnx/lnMKmjW3eHFEt2CeH+PmBpDFp48FELeOM2zQxrrU4?=
 =?us-ascii?Q?7mdBgH7jRT27jJAgZi4CalJxOpsjQlSSfSfMUXTgED0+x0U0YHYzanXyCH/w?=
 =?us-ascii?Q?D+7C7aG81M4rSfBJmi1eg2E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4327416-86b3-4805-6c1f-08d9ac19fab2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 11:36:23.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRAHi3VkwBIcN2FdQO6ZnIY2ojkIybH/mniVHhfHbw0TwavWYb1N24njhLGYTuTLgQgC5YE2+9n21QjBiu1ilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The wdog on i.MX8ULP is derived from i.MX7ULP, it uses two compatible
strings, so update the compatible string for i.MX8ULP.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v5 changes:
   no

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

