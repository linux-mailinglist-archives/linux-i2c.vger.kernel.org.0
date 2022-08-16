Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE108595C64
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 14:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbiHPMyx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 08:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbiHPMyd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 08:54:33 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A6274CF7;
        Tue, 16 Aug 2022 05:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0A10yGGHWw2weUptY2rTUDeBdVPTpnfWqYcHX/GIKbv4Rx5uOjczK74rh677+Vvy1zeMtq4WKpfXmjH2MS08EDSkxIdxFE4BSfgE6f6MAn8d6aHnSS5pdALxE7b5ZodnPUMpLCgsw7nkGCbnLHbhHN/osW6zCNW/a+YMh43OBQcMbmv2ti35gf9bZQm0GGyHFoyueiLtqwJEknY2YI0aqTNMTnYR/i/mRQmAZRFinnBW7kiHfooaJGLAmTn7dlRfP+MgJFkYISbVv9EOv4iSGzMsNcGcen0MqeTTAaYyFXzCqzs2OYKOynEiYOiJc1qFJr106u+nUM2ll6XSZXBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaIWqxWtiremPooqsfwC4PFoBs05rrYbVpTN2pUdpWU=;
 b=k+0YCmovF+rd+8zz9l/i2yfesrDa8A7t9GFeK5oxt3nW3+D/1E8ga3GJhgE/i3MrCCIRHAE00tH3tTDVDQYDKUO6n38h90WM85HFehub+5eXLo1PIzrUBOz8GKobjU3mDhG5smfOsulAfop/efH0YakHivyxpHBTFPwwX8sTwVNrozK68Ue1bz1ZGHQAphXAeU21mry00FhXEVdHm7EF7xLab+oCouVeKTa1a0m3sNXHbnPTxlr5nuCgKH91dr85+K9HGZCa6ImQRG1phWmMSwwwOa25ZFUVpTiBIY2MzVqiN9UKOZV6FRXJnQzwaMZdoJvlL5KzAPFQK7yACGGOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaIWqxWtiremPooqsfwC4PFoBs05rrYbVpTN2pUdpWU=;
 b=e5R0ZQbRyiWcGnE1+R5R46LipdIfyVLVQxN7xr+5sNlGKJsJlLE6Pa5j1trGZSENEeUy8FBxvExf9nevo9GJJ+BTWwycof7aHobrzaEq/sEDBFg3DvXCW4cZlYbEo/uNuvOtWmau+e9lvCcP3cQhDep06QmJY3o5mCCpaGETQ9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB4060.eurprd04.prod.outlook.com (2603:10a6:5:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 12:54:18 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 12:54:18 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 6/7] ARM: dts: imx7ulp: Add IPG clock for lpi2c
Date:   Tue, 16 Aug 2022 20:55:25 +0800
Message-Id: <20220816125526.2978895-7-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3be4539b-d190-466b-bc5a-08da7f866e86
X-MS-TrafficTypeDiagnostic: DB7PR04MB4060:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00aH/gG2Ixfjs607EEwRFR2LVe3extQtsgAjejhWGmPUaeA1buSergqnvLnPdXSjzeXRjHoQq+vx6PZQOwFr7PPAHuNdHvrHUnAbnleO08ztgbvxe+FxTGDCfpYSltKgsP2Uj+RiEhGkODRg/OPLc2fxTexIe5cX1m0OEV5xix61Rz3g0YYMDnax+5ksvl8XzAmWPZS8PQvBZBiQcss/u/CJQIuRExdfAfRp+ulQam2DG832sy56uYrfDQCA+doZtJ6rW3wCfUp5t5bMKokLbdkdKwZWBTcSdb3p6MRbtZbcgxCRc0+1Qr8ZCB7iYAHiFQ2cLnlnERO0Lyt4uKKRKyQ3g8Pu8piabq9P3wUAK42hHGahYeSykP9z2nlYxJv1XrK6jzQKqAgVT4BXwoHEYn4mvhdHJ5ycWaKSSUOZIouAb7cHvWNLW1WT25Mhg14YI3VHSTsMTxqpFwol6iu23gYzlhVZlqLVJ1kASGpj703uT3ba7wwoVHpv9TZryZUpiMLuGHKQw/eEsW7Yxc6bsH4VRm6b7qKDxhQ9g1QuG57Lc5t1sAc5KJ5WyfopDdUrhurmHLZYBjrxXzsicWlDUjYKffO+0RDhuE6MfN48uElJuI69Qxt3P2X/18iSda337CDn5PX+w++xGT2H4Wi3SOeNeAVJP12A5C1tbMKoqLx+pbxllu29p+09urJ6ZGLe3uHsTZBJdRR2sBBHTQNjSHK4eqQsCSj1HCqKaqKj3Vvx6L4Eg7tWMygKk9bZNm6KoQv+n1JTOzeLOv9kRGkXhAibTat9tsZAdMF7qtLpIUBAcWF1eyjcavBKx5WOv0jP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(26005)(52116002)(186003)(1076003)(2616005)(5660300002)(7416002)(8936002)(6506007)(6512007)(6666004)(41300700001)(6486002)(478600001)(86362001)(83380400001)(316002)(2906002)(38100700002)(38350700002)(66476007)(4326008)(66556008)(66946007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PkIFiJ6Aipr7WNlGDVXYlonofIlRC2sMsQ99MkhtZoQwyV4+YgoFrMyVwkFT?=
 =?us-ascii?Q?77JuvwuUZFiFrsfnfpchfJUnvJZSui2xPuyQi044CMIuS2l6xNzqopeQNPaX?=
 =?us-ascii?Q?QSljW722O6E6A6LZHrLtlnG601iFCPr5woyqOb6eL7JbwQ+1I0IOUp+Lk4U1?=
 =?us-ascii?Q?hoCvwETTRKaP8OPvOuBEmry4I4p+w0xImhMLz6nCkkUY3vnvKhM1ycP1/45L?=
 =?us-ascii?Q?s0s5CDzuMYqz/HWHrq5guVozPvKoz4gcHF+vnIh8gTdOTd/j0c2ZU8/KBbef?=
 =?us-ascii?Q?jOY8z7s9NhBQ2giC6oRj0hJ+hf9rdy0hKYQLsCemRrfxLpbZad3ff7SxvVv+?=
 =?us-ascii?Q?gQG/YYZz1NEfNZGZcG1p2M8g7U6SoDqKilqXJUouf5XZr7vNFsFfX8/9OA2W?=
 =?us-ascii?Q?fNNu1eP4G3RC3SfIwCldX2lcj55dA0ngVHIWD89JkwuYVZIEs7mKjY9htP2H?=
 =?us-ascii?Q?+yn3dS/e17tzoT2Yrzu56BT2PejCON2x4IVEy1O7FAcMzdm4KIXDAWEFc1iH?=
 =?us-ascii?Q?z8sHeHVSop+0VYmiUXAlk0QN6K6gN/8Qr6L5iwaIR5Gk2hHLbsyQqdI3YItx?=
 =?us-ascii?Q?knxJHNUfb/AAa8XSZFIYKnfu92ALs805mLa86/3It3XeqH2pJkO1AYVcmymS?=
 =?us-ascii?Q?+QqWIYhp97K4Xg1LfQq7IIhE5RcFLA1m1bsXzq/BhahSwg1jCJPH+9vr9ZHx?=
 =?us-ascii?Q?nTm0rp/Dphbw0IuDWA3oIYzdGjssw9X9JRqOGDN2EjdVBfPIw/ZFk5gp08E1?=
 =?us-ascii?Q?tlmtOfK8Ci9ra35x57Mr8lp+DR6w+GhiDDatQyBHPftptzu0GlFK3ttYzfGU?=
 =?us-ascii?Q?YOGAi5OjbeaGjZrnK3unp4ewQpHvzrrWWHV5JKaI477AYnQgkC9IpHTpc3v8?=
 =?us-ascii?Q?Fz2Qq/9jddvM57D8YR5txJZIMxlKDcn/9wH9LacewXSRrdtCTg+xgCXukS8t?=
 =?us-ascii?Q?YP7xCJAdrTNdjvMKxIDfPl0ZH0xopU1bteGGNKhsiWd8TOSaQkbIT6vdxdFL?=
 =?us-ascii?Q?fnO0YGyIuc5x/agAWU0lRb+oX95An+f/aNDz4qn87Nq+LuA+vc+YK6nJNvOi?=
 =?us-ascii?Q?7YTsP3UAnXS+gKDImJskCDZ/umOCG0b5E4zChq19Q8DQrfNN1BBR4khjdtW9?=
 =?us-ascii?Q?ZWuVvJ28V2ytsno6KBxa+LbgmUfUfgKcgzr+DhrSaRtvsuUGR9zpeYdFnfMe?=
 =?us-ascii?Q?xCz8aKs62ITa34acJssCDwfODTMxbhp5rSBkKkZAI5gKxiec+nnpx7PHx8Uo?=
 =?us-ascii?Q?VX0FUJ1a/ZmB7gP7Mdo0jFtpjLS7hcpkgDljl4PNbKJR9hrwjF4+O8XFVwLh?=
 =?us-ascii?Q?k8/sH9/B9gb5Hq6H+nP0PNHbC0g6plA9EjRCQ+gZGwmGMxt83GfFrc5vjDst?=
 =?us-ascii?Q?RD3bU2Rw+5zOU4+tNtFCNEV/qQfGCw/wb/Yx80iRsyZPem6AnFntImLSQYr9?=
 =?us-ascii?Q?gchJl8mFCO0UkvR2xvl+fa4CKcMuHJLheHjTKWEqkCjA9SYGQqvABHnyDJOd?=
 =?us-ascii?Q?fk9xJDVaHcQke57Vgo/tK27ERWVtVBVVMpva1XmZt7loq89wvSpEvRDcKQxn?=
 =?us-ascii?Q?qfzdwKTZyDwGUdlNYyXxS6wUNAiEqRCgCCtDLilg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be4539b-d190-466b-bc5a-08da7f866e86
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:54:18.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz7Zy1E2BKlghuIUOToTAgwE9hLO/EcNG1SnTD9CnitnefIFCV8fWnQvjRLSLF9YViKjPcuRP21Z5dSMzDur7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4060
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

LPI2C requires two clocks, add the missed IPG clock.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index 9c7abec90a89..7f7d2d5122fb 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -328,8 +328,9 @@ lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
-			clock-names = "per";
+			clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
@@ -340,8 +341,9 @@ lpi2c7: i2c@40a50000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a50000 0x10000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
-			clock-names = "per";
+			clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
-- 
2.37.1

