Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DD645E8AA
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 08:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359420AbhKZHqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 02:46:46 -0500
Received: from mail-vi1eur05on2059.outbound.protection.outlook.com ([40.107.21.59]:61011
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1353051AbhKZHoq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 02:44:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaZeGnK6H2bthF0JvBgjGcGYtuZP6JnnfW83BDOPnRmu/iqUEPMijumvAAFNAoj8JQJH11Iy9JK2jQDitPlsLfPQ6a3+PbHQaURkX4eI+nladVG/2J14rhjhvavu82ZwAkRSVlK6/F1FHwEKrhSSCb4EfDKNGx6V+XSUDfvhplwVFsm9RhR5DAwBDJVnb6nHLp94SBBqPIXOD1SmDZLVHBd4w94owz8NuDI5jhIsZlWRLpwmFKBr54z2BI1VPWuqS8AzlwK2EDa+2+SFpffQKfrYsYQILYl5R/sa7gL19cLIeXpkLxgXceaZ+/kasF/G9KkBcD5UDKY/QtMG3AU+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mac93gIleLEi+RV6kcOVyETWU2V+GsF4z8Ta/v36ro=;
 b=RFLZ31yvrOdK1e+BfMGgP1UmqCXG5UHA95yLk7iiQOKxMnmC5peHgV9jtouIiYuahrMa1eljW6T1Yka69hXETly9Kd3xJ6Yxahyq6kodhR0lIHoxC7V9FEPNiV0SfDNwQQofH3kmwho1tpfWqxxZm/fbCvLcXCpM3NYFTvQ8sr6oDcC20009T526zZiVeAtipSGKM61KdBbRaFN1u7xsMkh8cZKEuYBGFZRg1IBGgwImcOzTw+Rfi+FkmxVKgEA8heOImLGvJpxvfC6zq4mNpaJH58Gb55/zfHnYcEZ11sGWCpefTscW7ZKlp31aQAm1i8gZQQfYPyU0pDHvTB9iig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mac93gIleLEi+RV6kcOVyETWU2V+GsF4z8Ta/v36ro=;
 b=lB0vSDjTvpEuQKo/dXLRTWDLKj37vSFNCs554hIKQ2L29/6HmaBG9/HcnF2KiucBr3x99GZ1og13HHnbKfPhDTs2QCMswQiXNlsnoI4XQO5Khn0KzB5f5fPPfmp3sfAjzfquyolWDBcYYpvMrWTADW6FkSnniiuzTH79ckI1J+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:41:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:41:30 +0000
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
Subject: [PATCH V6 5/7] dt-bindings: arm: fsl: Add binding for imx8ulp evk
Date:   Fri, 26 Nov 2021 15:40:00 +0800
Message-Id: <20211126074002.1535696-6-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0139.apcprd04.prod.outlook.com
 (2603:1096:3:16::23) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0139.apcprd04.prod.outlook.com (2603:1096:3:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 07:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 890273cf-1dc1-43d8-8ed7-08d9b0b02909
X-MS-TrafficTypeDiagnostic: DU2PR04MB9212:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB92120EF512786E8973046683C9639@DU2PR04MB9212.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3SJNBM0doy86GiwomJY0CbZvv0+2HseVEK26pu0+pyspiV96dszIZ7TD7EMq6X1DpP+JmKvF842Y7KKD06AT6KIEKypM+j2R5cbi1smzmEn4kCWVcL+rxHbUrpaXNopG+tVAR7UROWD0apMVGORUnm8AY4EdspiU7hpQajhE7RjyXV1T7sGWdQUNlQuZ7CbSEIoY398p/RuuFK+SQIJT+JWh/h/WLll+Wv+S4+tndWQAdeLB7JUTqnP2bXNN/Xg4dpJHwnFi0Bljw2TrSWkT4BidnSOl34SuYFkE0lF8h2yDumtet3hm9BCqQyvK/KqnisS7xpD45VQGsqpwpWPqfmG7cY+dOj7xNFe9xvi2ukjje+ym30ohDkpEOtZzpFkrbbUypWzu4cfe/ItfcsIVtNIRDmaIyAjN1Fkegz3zpwawN5UYiWkmEMjFRT9MFwbnOl638Xmvw9rVdfZPmaa3qNvoksC6TrDkAeupV3evjs994ugb6afXYc1n7pvXovmUMK3FYTGEH8vpGGW8FWb108ivWZ3bN1YDaD3y6t38ah7LrgLuwhtItUSWAoEiA/hxL35mYcr3alvgOkkHb/Quit5A5olDVTP3ABvnY7ePSOtv1m4Z+0GfSD1ucCx63/xRgdoygt1ueVNfPCPYRSV6PE2WWzojrSnvVsMU1/Gu7Dso68VkfcDAe80CH+T+d+R9tMxXtDbeV7BYeAjkxb+pHPpvWeUDHgsV0Ofs7DZdE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(1076003)(66556008)(86362001)(66946007)(83380400001)(5660300002)(956004)(2616005)(6512007)(186003)(26005)(2906002)(4326008)(38100700002)(6666004)(6506007)(8936002)(38350700002)(8676002)(7416002)(508600001)(316002)(6486002)(52116002)(54906003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fzhppAAo5Qg4q68ITC92eQ3ymgQHP2MQRPeDNhzGG17Ilvb+5l7OMD9q64pc?=
 =?us-ascii?Q?orOlVVnK0Bz6faGJSaS1aUbcpZ0hFIRBMvk6uFccMr8SMQdWvIh4IWLx2bbL?=
 =?us-ascii?Q?FWiWsQGzKGm+4gvyblZB1nEZ3AiqqzyWF5fyJEZ1Z+CPcuHlfTh/UhEIi3Ph?=
 =?us-ascii?Q?fPpV5OWlsEuxAcAciyIApsyGx3u2kZABrXJ2kWN9AZQ+jqLl6TmK97DXhB6h?=
 =?us-ascii?Q?6NzulKp7ZpoHDAp+zDT7tdevkV+UJQIMbe6IHR9ZmsOF+f8WbB63hGU0IgM+?=
 =?us-ascii?Q?kNf65YETjaogTWq/ePVuiu/uOBCOlLVFIt9QhclLuyVOUvtruLJkvkJ8tf7J?=
 =?us-ascii?Q?YrHj/Y4rdsHqlSYJP6dSi+QPhrbQybgkOQV5VkH46O02BJ/RdYoVT4o64ypM?=
 =?us-ascii?Q?9nbQopt5J8d7Nh6Q+76E1+j+kRzohbammXaBvJcvy4j+AH3oLkZ/3ymwam/a?=
 =?us-ascii?Q?ZKp0VdFoTd86gtjfJBY1AsBXcMSAjnW3G7Dj2L8f3rjzzSvwRLmR0nD5Ue5d?=
 =?us-ascii?Q?O65451DlAWEl1/qF18qntOsa/pTu9s6laF8TL2orF045KTqCVrCpvQVwV4O4?=
 =?us-ascii?Q?xSt8OOU0Km/qp7uInISrYv6WIOvAlssYFJr9vYGw0JxmX6HDoeahl57sxyoN?=
 =?us-ascii?Q?Tafa0H39slIxlOwgo79IBjYPv7QZgK0ZCazVJKSt5alG4yiul1AO6yukekMp?=
 =?us-ascii?Q?imF+AGTT0SZ7day7vXr0BmskEEZOrkevA46VHw8t4/25kP+5D0j/E1ubOkq8?=
 =?us-ascii?Q?Pu/5epZs4V+2i1sfEknPPxuo0sWgAbudKaWeWRB6Fe11Ebl/qjRav1INuytt?=
 =?us-ascii?Q?DnrrRbBn8tyBb4RnCqdgfrywf0Jw1grKj0a37xWJxwzBmg9kU80LTQAJT7J5?=
 =?us-ascii?Q?F26bCJLg1sr5Vbhb4+3Zadt0MPMsd8isxfGPPscstbA9SoAnNI/Gckq6O8bf?=
 =?us-ascii?Q?u055NDpHjNnVsbw2IxAlVAN2HcT1xX3w+tV3XaBUz0lALwjxsU4fICO36AZx?=
 =?us-ascii?Q?gCtLL5jlS9xwnvAZeysDoroWJVuNQWMbVWeWzlmfB0Y4DSPMvIq6l+gJ7NJd?=
 =?us-ascii?Q?MW4+qVhKJkdL9BfJ9eso87wu3ePWKnTKF5dqDOnURpykMIzUKIeIDuX9UioH?=
 =?us-ascii?Q?OgELNtVAsEKemLtiyMsMThtguQluourGQ7u7islhlil3BWglwafbTQLJeKmX?=
 =?us-ascii?Q?XweHss0dq4M6+RQnzLTMUjVpbPAxKt05N0U2COS+hllCQzoaNbX7qx9Anbq8?=
 =?us-ascii?Q?XvjTEI140WIrzEBugML3XHHh7l5fXPOqKyNe1fSylyeP8MR+wPJTZtlO/Dnv?=
 =?us-ascii?Q?ujekoLL4ES64sp2KTlSAWwXcXQaEB2i9rdVRHg8nOUEYOhGddBfw4qt9UvOY?=
 =?us-ascii?Q?gKw/Raocg6KuudqE2wS23MxX73ol8W7lkByIJ14Vs5+0Pd8CDZeytxC5oYzg?=
 =?us-ascii?Q?OkF75w6Z9SNzS9rH8MiMP7CFz4TPbLaM+s3Z0HPBT625KOz3uFNT45xDb82F?=
 =?us-ascii?Q?m8R0nHt19i1V2Fe7L40TtSgZkX5MyeDc5i0BHC8UwLyP1PEnKPTOX+49O0FD?=
 =?us-ascii?Q?vckSqb40qK/4zi9WihSEvxAjBQBweuCrRi+s7bDUnaH8kpRbe2pUKDnGepll?=
 =?us-ascii?Q?d0f3NaIg1eU7d2wJgSNfV3M=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890273cf-1dc1-43d8-8ed7-08d9b0b02909
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:41:30.1200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBgJF/iMlucYOm9A6UGJolyXmGkKeBuoVmWVrSikMp7wPJlmtmiNBkOLOxuuh0n8Ztdjdu0C90ctJyeOU0smNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

Add the dt binding for i.MX8ULP EVK board.

i.MX 8ULP is part of the ULP family with emphasis on extreme
low-power techniques using the 28 nm fully depleted silicon on
insulator process. Like i.MX 7ULP, i.MX 8ULP continues to be
based on asymmetric architecture, however will add a third DSP
domain for advanced voice/audio capability and a Graphics domain
where it is possible to access graphics resources from the
application side or the realtime side.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v6 changes:
   rebase

 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
   no

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0b595b26061f..42b5dd546aee 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -834,6 +834,12 @@ properties:
           - const: toradex,colibri-imx8x
           - const: fsl,imx8qxp
 
+      - description: i.MX8ULP based Boards
+        items:
+          - enum:
+              - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
+          - const: fsl,imx8ulp
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.25.1

