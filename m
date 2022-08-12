Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2921590B2D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 06:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbiHLEc5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 00:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236239AbiHLEc4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 00:32:56 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595949C53F;
        Thu, 11 Aug 2022 21:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKuN+NhLEaUF+pv6i0eLdHqX/546I1bgwzPyLamxEwPMbOOWHyRn9Mh5qqBNH45GadkqoKcKaT3Az0FvFEyYWDR+4sqi/kPPWV7QYd6v3PseJgCUUrXbSmijrRarjuRswGjaedDLXJ/jZDHN4C/Uv2S3pF6E1q+1pUEpFXboxbM0rg+HgJggIaH0en/NvgVnZl1YnjeMvbb4U0Tunhw7CKfO6yqygSUDtNNNF1o9i/JtUCKhQUImprTb/JwUB0Kx3FNF8/9HrICUBegZc/u5LKAL6vdTYANATxyHe0GOv4ZUjAk1K32vdCgJHvBSturNFjk5bQ41CzCm80ceOBB8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+VDlxpwK1mbL/3+skhIYunrAgujrBtXvjqYL5Ac/y8=;
 b=RNSSgh/nEb1ZKMI49qKWNhjRM6W+uFB0BTJMsUAhnthG084n1+HheI19/pyvbYZsK/p1gjuVYYqVN7iRJ8nfvTtly/GeLFcqnkNYTcCdntqZB5qbqO7X4x+jtnz+XhuGT9L507plKHf/mmVuwqQe/q+ImcYcOzCbG2uvYqFrpZJZ07Rs0zzYagoHsHqohyLat866Kzl6KQyLVe7EtyxM3urH1nuBCl8OuY3tMuIDnN48sfHP5SYl1hWVybmgvs6NPkA5wD3WyPAdTzyexqkMoHPS9FnjgiChfrP4q1nhO5JKYP7kIRBppb+cLFwbz1XB1X0mHiGA12eShgMG5SvWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+VDlxpwK1mbL/3+skhIYunrAgujrBtXvjqYL5Ac/y8=;
 b=ZUYrYU01CoEX0dS9iFQV8j8B+lxmsMBjY5M5mfluFqkTCfLnBXcy2abJ1sCfFVEDIlC3vRuhH7mEGYCnUMepubQE7gzBjAvh+XyPD/Pxb2wtP4m++jI/K9m6i2Mp4xh+3Me9EJUQSzvdYyni5iwVkdyZ82R3myQHdjbsyhHF+Ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6243.eurprd04.prod.outlook.com (2603:10a6:208:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 04:32:51 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 04:32:51 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/6] dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
Date:   Fri, 12 Aug 2022 12:34:19 +0800
Message-Id: <20220812043424.4078034-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9300919e-791c-4630-2721-08da7c1bb782
X-MS-TrafficTypeDiagnostic: AM0PR04MB6243:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZYO09Y0+AjWu0e1Ccv5pmias8pSBSlEgosNIsHZR5hPiI27aDUV2FH1yeXoMrmQj+IYjcLyCa2DpjV13+BSHOgkO3cQpKy8oOYvyKd9Y9lR0IxOPfOMmzxqQHU0opVLEeB6Sh+pRRzN3h3MaJVeQm10aLCg8In1U+53PB3Cb1Uj4bdMExZekyDrqc5ynd/ljcXRVOIDpub2zPluXqB2AvWKxCG2thVM7rKoedBCDeKfWeS91G9c94mnMAD4dTLPQdHeazSIi1rG099LumBUh8Ur8zj2HGxMgmqq4E6l/AYMzvvYJVxM6htyZWhNIFVVibY8XcjBBqgV5yMG03/KgD1R2QajSGOEkrba67Q1oQF9XIFa8Bq1DYA6vTmtrctqaIidlCOyFIbqjdBcBP/L2KHRa3nZ+ZOZowiQC1cC8Hj40Ws38dsf3DDhSVIqO3frgzYKAEhjLJgI15KppWEKAWHRJ+fWXLtR7pyDrJ4r6GmVWrWIR1D3tWLvg+m1R0w2qrfb/OeU4B66p8wwc1L7GZOY9xBDN0a2Q5WURmiXEa1f1uj6h4GApzV+17VYchmLlbhcPGQNMiMMe+p6HHl3FtHE9yfw227ZZkqhOLpphyAnB/cvaFuviN6EH2LQTy55OThbVSmmfHCTfVJL6jFzTD9QsUB2X88cu5inZRYUlyIAgpWHMB7lRZB/VfRBlF9lL/mE7lXaC8yxJac5emBNJfJyahW6DFJrk1ntVVEnCIMYwlkCW05yXqb71p6/LyAxygQxNOXkMplhHMgFiXUSDQ0Bu6Ch9eqG9lLzMQEHJCg2MnB8gGrpESpRV6CzxRQ3F
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(86362001)(52116002)(6666004)(83380400001)(6512007)(1076003)(186003)(2616005)(6506007)(26005)(478600001)(38350700002)(316002)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(8936002)(5660300002)(7416002)(66476007)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?97uWX2sy+Vj7YDA4W+eoICHuXNfg1wLXhcqTA39U3LxgrDRS4Y3V5KEwHp/8?=
 =?us-ascii?Q?/YVWZKjdnVHzgQVCza+P2/Y6v6wl4+TevZthGTPydX/Qfd4QfAhFL3hvpwqT?=
 =?us-ascii?Q?LfGQ2iyJgEDLs0ta4OXlXjOVkjcdDGFAbalhrWzcoMk2n8yHf1ZdUoKl37+N?=
 =?us-ascii?Q?FdolNoqUP1c/68Btiou7dLG+IOEEj5Q4pc+hdbqBQI3QkHUlz1eA0+IUsGu+?=
 =?us-ascii?Q?sFdO30PhioSXDgJsTRk++7fzyZV4h2PFADmSdn3ycuInkU7hRdo548HprlNf?=
 =?us-ascii?Q?jnSpZKefucUQgj62mzU0rGZLOsfBXOkfYpqEETtYeinDmsA82hQTSXHs4AhH?=
 =?us-ascii?Q?54U150FUNvbK1l3Mp+lo98vOsI7bmIEMMGHM+0+9Qn0aVQfq3zUDJD7vkmzj?=
 =?us-ascii?Q?fwADWTpmMxOyhIMbs8jCcGZ/oxEzxY0bUVdOqTvvujXMVdMPS1w6pq1ZFO86?=
 =?us-ascii?Q?cXaFwd62IKZYrCVJ/r8S4Y3DHIeONtcA3aSmUAUAE5+yQk/HNomde5xvYaqZ?=
 =?us-ascii?Q?m41Uf1Xvb5fvStV9EKeHTksd/+/RHWhYYB2T760raSSO9DHal31llVPqR2s7?=
 =?us-ascii?Q?v1hGFwrcSiLcCaiPxOSLFxQHHUWuu4fZCNOkgiNbJYBienVhn4Pk7PBsSMmq?=
 =?us-ascii?Q?sd9BSqIsaMIVe+Kt7AkJSGJtGWgGDvHQjRozE9ii6nmgOBfVE642qco9Ply0?=
 =?us-ascii?Q?msmV0zDVTNrVlSVTnlPagtRKCjTNIPoeFMtgh5NNj+z9yVkqELJo8VjobGXI?=
 =?us-ascii?Q?EKE8YGJ6B/uHftNPbkasm2YFzLfzyvsdXUP0ALIT3AAs6vBTzA1D2pBNMZ+C?=
 =?us-ascii?Q?hh0X7yHQUHnwClovJ3KSvwQkVE5NFNlDSyOn4vFme4g4mUKaPTBVK2G8StsF?=
 =?us-ascii?Q?obumejLGCCQNA6k7XVzYYkViiXORvpKfB4MDELJAbgRp0NKMRRnhrSidx6+G?=
 =?us-ascii?Q?boieH40eGB3wrOEC7mSW2Y9536neV4pvMmtbGGyKkQ6hIbeBmBQMWF6q0Axy?=
 =?us-ascii?Q?Vh5rq1R01b1kgBZWhDqnqyXjT19wo7hqsPt5m3P4/YH5cBjFe047wUCGtZil?=
 =?us-ascii?Q?R9GAXcZFEci6fwZ/NuD7x2gcSnwyH8XO9o68KMStq+U3UUqDTeXzFb6tK59U?=
 =?us-ascii?Q?CFEVdSqBTXEqY3QFy4Gqn6VN99sMwQEsjBGLAEgxCI59y0XkLKxXz9SYERmT?=
 =?us-ascii?Q?zcwH3lyFGQxRh+zUEc06I69ZVwHHttCLttBAppVDriIt+o2+Hg7oSwsCxfeB?=
 =?us-ascii?Q?wVuhmvpwpZjCFi88yaPJ5/I8ytf7FRoGE95F7pA6R+92l7cp0m+5oDa1Q/Lx?=
 =?us-ascii?Q?6DVyn4NdsyDy2xmYHlHIV/kmcDIhyLCV92dKleYiphwfuw/XAU3tImIbvOu3?=
 =?us-ascii?Q?qhVqIOq5OwHBTqtjyY0xAwra5M/J9UerhJA+e0SwH7Fzcc/sfI29qAuI2dBp?=
 =?us-ascii?Q?i9HWG9RujWqJt4k/1WQtlB1Nei6E0561PJAuE4CQe1g1PSgkY7rwdQ9RypBT?=
 =?us-ascii?Q?j8oRqVRHOE03NHk5ABXOcz/eREF6E/d/mxsZqNRvdxPSiLDEV2TlIGVD6Uvg?=
 =?us-ascii?Q?yomGBXS7GODvtppPcTvqA01BDnjKogMmhUkYi1yq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9300919e-791c-4630-2721-08da7c1bb782
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 04:32:51.4673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb5ACYOioiK5EJQK1fh7F62Y1WYpcBT32qy5F2gJR0mVKpq8WGki3lJ+pJ5y/dYfbdk9B3MD7qovQD96KH6qvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6243
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX LPI2C actually requires dual clock: per clock and ipg clock, so add
both.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 529bea56d324..e42e35003eae 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -37,10 +37,12 @@ properties:
   clock-frequency: true
 
   clock-names:
-    maxItems: 1
+    items:
+      - const: per
+      - const: ipg
 
   clocks:
-    maxItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
@@ -63,5 +65,6 @@ examples:
         reg = <0x40A50000 0x10000>;
         interrupt-parent = <&intc>;
         interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&clks IMX7ULP_CLK_LPI2C7>;
+        clocks = <&clks IMX7ULP_CLK_LPI2C7>,
+                 <&clks IMX7ULP_CLK_NIC1_BUS_DIV>;
     };
-- 
2.37.1

