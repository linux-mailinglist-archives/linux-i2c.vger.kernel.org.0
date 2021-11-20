Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F82B457D81
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 12:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhKTLjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 06:39:16 -0500
Received: from mail-eopbgr60043.outbound.protection.outlook.com ([40.107.6.43]:5092
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236827AbhKTLjP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 06:39:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3spOwafRVYsjkSarD4NH3OrXp4Q6PNq9hpEJSh3zBeKW692J6tC0Hs1svpCRXFjVlpZH2cgwQl6MpSkWCqnaWAyEgraJwkjOdRDKZwFBJbsC8be9V/rUebqIZlK7Jq8UHiTkecrEo8LAJjlcB7g5IfHKuFV17bFHcwhCrVDx0Cf+M6kXBnYRnJZaA2NGxXyrs33iuebeVhzETl6YBLu2iO+ON6ePl2DZQocv72jdf2J8YdCU0+13hYIJFdrDFT9/mXBtR/JM1UMKaDTYulJZOv6MT/6lBHt+9pYOZNMDNny94Sjaodz+r7SNdaZUwHOyUT8auBqBQ93YQf7Nb3HbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMc5otQbJCHJL3gaT0fbRTIhjLa2Yzj+47md2LPEaTg=;
 b=FyOJw7fVV5rCuhCAYCPtkKOrrZuxfenCbcKFfxX8I7FA63E4C2e2iJY9HIhd81GG7jhYGFkT9OM26b1xSJzPUCZSdwzmImcbSgMa6BnNTwZghD6Ewdk8gb2wa9uFHjEFyAx1ak5yUqmkAqNHdB7LBusbsPAsdDfUOwEy5u+vHygHAOzFsYvmBNrPzRSr94cH+m5x0qb9I2/xV7Zf1hW721AOZAbBcxOJKFCK2rnvjElwboAfeuKemwk0Q/M4YHrZeZciFUzK3n2r0aFV7UjcfY0NuJISH2TCHUV+fy1xZf+ZqMlvN8WwKB2RWiNjYadpV0PAqbBxRsZgbzQxCLozhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMc5otQbJCHJL3gaT0fbRTIhjLa2Yzj+47md2LPEaTg=;
 b=JLB7mwdFy2XlUd9Z5eSv7VvF9rTGU1bR7KZy/ueCYOMiZJH3N88vZbDXgTiPumb/VZkuTYNO1N72Sl05I4eh2DpmXPZ6mkzFVOBKjZ+dbe57tv+owXSvMjKVjYZOQyk87cuWBpz2eFdxP9WYos6N5PIV8lm/gn9fy4lKFCIfx9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 20 Nov
 2021 11:36:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Sat, 20 Nov 2021
 11:36:09 +0000
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
Subject: [PATCH V5 3/8] dt-bindings: spi: fsl-lpspi: Add imx8ulp compatible string
Date:   Sat, 20 Nov 2021 19:34:49 +0800
Message-Id: <20211120113454.785997-4-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0029.apcprd01.prod.exchangelabs.com (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 11:36:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05f1fa6d-8db7-4171-761b-08d9ac19f294
X-MS-TrafficTypeDiagnostic: DB9PR04MB9308:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB9308AF84B63DCFE9A92EFD59C99D9@DB9PR04MB9308.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fGFCI546SOO/Wv3PJzfqQi1Gvtcx8eLvuxHxjdtwVF4D9gf1MSbnUgDpSvL+nJbM/R9IBa1tuQmyYy0O1ttrhzRSk+ac0CtsiT6JJGBiTiTuX7oR0UWMyno/Htb3E+dNIXpTV3MTJig6t+eCH0NaeVJ9JnUJjvuuhwSTkrxbEoGsbhQIXMNVQoOsBJzsXPLbo/TmEjjhq4O9VNjZRwpzNEr2XMc2eDaZ/7zqj0FoStLzmAU2X32N9cJ9LqdBdPU/2w9YMG9zc6vBmnZYjvD5KHP2zchixLaGzpj5bWKDwxWGAedeylUnxiLK6KPM41D24M8ZSAsURzFoeOvlGinQ9POCrgN++Y0q0ZMEapv8AeLcfYTf9/iCu+Qjtvlpr9cyETkOWfx+A7AKgKagZF3XBecP0ygdbMpzK6j/aGBHnYwr/UkiwVQApegWAXod6sqHhSGZCaiuupD9d0T5Qu9l34oJ4Nskfd3g8chqG7090aw8SnDPOd+L7BlXH/F2dShI1ERvJgnay55fj0d6km4nGPUpCOcPheO4OkAE9nRrtWAX5d8SGJnosun43r8Jiov4h/tYVsAtUTWxpp4aEKn6s80MyYp3JUZfcZqffvrkf3Uym6boB6udHONxPDBvKivT29T8gkwMPhJ+4JfFEu794gpMH0tzLBz/vPGU/m3YKIEGEAfJNG+dRTKqggmLR3fs2jmEcbWFFSLbhgPhDE+/YsDripZVaaMfPQOBHUMryvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(26005)(6512007)(66556008)(2906002)(956004)(86362001)(508600001)(6666004)(6486002)(66476007)(1076003)(54906003)(38350700002)(38100700002)(52116002)(66946007)(2616005)(8676002)(8936002)(6506007)(4326008)(5660300002)(186003)(83380400001)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UaUnzO1v+rPyxq/dtg1xBUjMD4EE8nu+rKGWgT5uNUxrxnodC/pH4KxvEaCj?=
 =?us-ascii?Q?kcpNZdwRtsRVC+36Dg9puFpVs+Qx8eGWSxTRBnkCE42ufWWjgtoeQcM6eqZs?=
 =?us-ascii?Q?AE5XMihhf4Sap8vMAQjVPWHQoXhaJ8/Pk3jkdn+3QUeCi+QZFQfceA6urpWq?=
 =?us-ascii?Q?5AnceNmLW2agBW+3bDd5QpxOZEX2ft15rjWDMXEkxIyn4bGLoEs4e+Dflb5D?=
 =?us-ascii?Q?/vpHELIgwnPlheWU+D1zKtOc8wD43kFw5KACRAygVf1WH7sNw/S2LWfcOUsS?=
 =?us-ascii?Q?9XKt8eJEe4WK2BKhI3gUPOgCob3kgLHHvvExLpVZDI29SygDPz/C1T9B8+dY?=
 =?us-ascii?Q?yk1DRGgST4ElTCl1jlFcySP4ptaUc996EweaNxuWiSNHI39HvjCu1484Quu0?=
 =?us-ascii?Q?wYCSlji0nXZKQn+n3N4oyASXfwLzQZ3C/glfmM6pF5qjEqa242UowfubY/n9?=
 =?us-ascii?Q?rHI7NytW2+grXcKODwLZUcItkZf1d5hvWFoKsU2tjwF3w0l3YYx89jAWtIQh?=
 =?us-ascii?Q?xGAdC6cDDwtEhQiTYoPQ6aPPQ6U+2Iih4bw1j3qEj6fagrDpqURps36NdEPx?=
 =?us-ascii?Q?C1bigMw3guNpG9MlsfHjnd1ECJAlxZ25DPovZ32LZEOYvPKjUquOkb5TV3+D?=
 =?us-ascii?Q?reJT+Pr3JBXW4xdeVUHuEeHOAc3Jca2eAahkh64BjCjoTZZ/QmbsSjZTz2pb?=
 =?us-ascii?Q?KZ3U4o1QcBlhp+h/2zxfRn9bNl2s7BM8uDfln0JdH1SyaFXbI+kduJOOit7u?=
 =?us-ascii?Q?Q/bxPyOnwucc5tW+TeyltTWu75Gwu3+5yc8cF7fRD32OFh17B3Ox0shbalZZ?=
 =?us-ascii?Q?bZgunwlh0xKexyfw2w5IvLcTr4XlGoYl3IunxXM826vEp8/sA6fdmAfVgQ5E?=
 =?us-ascii?Q?FKedCFDXhnSDN/KqdNK35uRilsdEXX7XscX2sTp1XmOEA9YXSKC6x10rI9a6?=
 =?us-ascii?Q?2lD8RksE2qs9Don07xjAdter4BKPP9KBpyPg8D9f2ulnzYLZWgEQZ36UGv1S?=
 =?us-ascii?Q?+Nvnm9Xu5HRpUri4uI12rEwP4eki/tV2lZmsrWc3KiFrUuVvlZHXEvgp41fU?=
 =?us-ascii?Q?mCXhULXIL9CczVZuN4GgM46KXnYigK2uzhxWnSSUBeiW8uX9OGL5W3D23Wro?=
 =?us-ascii?Q?ESigTLFrMm3lXHQcqILMiFZceCabq06QZpX83FmWXO8lxAYAXegJbtjjITX2?=
 =?us-ascii?Q?lpKZ4YDHwtrLTdMjC6pbKJxMOsI9L5ckjLduli6VzQBF1dsL2u9U9po6Nw4V?=
 =?us-ascii?Q?vtoyKNFLAcAtW3KERZxvsB8BZsdKbt8l+LV3T5Q7gA9xb+eFVgGOtgguCapU?=
 =?us-ascii?Q?D/vkLSfB9w3LKcz+4diD8SrhyFIqoc1t1OoCTjmcHlws1BBrIkpJIGozJOyV?=
 =?us-ascii?Q?JrP/nfApDLJ+4h3tFdt9JE/IoZVW1vCqYwH+qNungZaJG0LvXzdjBgpv592W?=
 =?us-ascii?Q?0b8jYFbLLnwolAEHxGKgxNd+Bxne/Ko6IJVJv4lUBTcvQu2si7yJLlR4XhJo?=
 =?us-ascii?Q?iYBRrDHYUEXTU+Yf03iTIdsE5xjRSGNnY9C4+JIrarP/fSknTFpTK9ZuAkJj?=
 =?us-ascii?Q?BKeb2kSzf8YSeTSGuuf8xBhpVmgAnefdPVV6WjW/obX/jsLKGUaAJcxOiF1N?=
 =?us-ascii?Q?1UpF00WmHKHHeWnilduUrJ0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f1fa6d-8db7-4171-761b-08d9ac19f294
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 11:36:09.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkxrihGlJitzKpu21cllclJINUvdvaWMB45NDu33hMl1bdCSXL5s/hCojMG/fBcJXw4xqn9V56Itw5YYwgpuGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
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

 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   refine the commit messages

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

