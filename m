Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A4645E8B2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 08:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359436AbhKZHqv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 02:46:51 -0500
Received: from mail-eopbgr80085.outbound.protection.outlook.com ([40.107.8.85]:2466
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1353787AbhKZHou (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 02:44:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AerNx8H1U4c/g0fvwS0C9zSdyqN4oUw7sWMXUKLntcmGq5pFXPtnPyUtfXVTjtiC+KVBI/rOPSNGnuUOWJ7couRo2wgo1h0ZPsDZh+O51lAS9boTgRDoeiLkJ3C6PdnEfq1atLcl9F9bN6J3VVoXF17zXhWIyZJJGhKkByII9MXfAUTwu5RPJXf3TbpkVxAK7hew/71uvENLSYtkYtAz2l4jfu+hcjz/Bb0c94l6fPbANX556WW6zpnkeB7odBjbj8U6eN3veTyqym0yGAyTIPPo8bqi0KOSAMln6qCUHH3d8aQuqzvut/JMfetAFLzP46w4af9hHkiWTB5R4wg6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yb7wB/qCSi/yQfTTCF9zrW+/F9eTEfaMEVXTdMU7SPw=;
 b=ncir2HiWMZwfOow3GDCRRDZpuQxJGlHGDsukfC+BHB5FzQHzUb0Ml7eTPvDIWKAYaas6sN9aonxP05DWPwoXTFUhiv0nbHfFLo2p5q9Tfo+lacuMAlvVcT3qY2iqUA1URoatTw3pYMLgcBJi0Tpvmpc4H1VaNLzZWcZY62EHJeAbpGVTo4DDGPHOZUPbVTmigZZvWwogPqYz+idrgkoRRfumHdd6ouMHipPz7KeKNpW3cjRRybfsx63xckTegQMJErUMctr3Hm2jjoWXXGcmaA/ePUSWFAn1t13mLGLQsAJUr7bS9QSAei/TaKkcebG0m1TJQqD7Mx79TMY/Xm+Xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb7wB/qCSi/yQfTTCF9zrW+/F9eTEfaMEVXTdMU7SPw=;
 b=IGNpKMRtytmTYfg6W1jkduutCTNtl7+0FyiSCZUu/FjTY9Fx+6twnEf/7zwZGBszBbRQmosvTt7tUGD6FTlt5xUPZKXwtediK10Uv2E2w4E4nQlRZowldicmC1qXjA+UEmWmaX2TWRS1LzfXfRwoj/X0Lt0SceCqw7Z98wLMvdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:41:03 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:41:03 +0000
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
Subject: [PATCH V6 1/7] dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string
Date:   Fri, 26 Nov 2021 15:39:56 +0800
Message-Id: <20211126074002.1535696-2-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0139.apcprd04.prod.outlook.com (2603:1096:3:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 07:40:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2416687e-d1b0-4230-d435-08d9b0b018ce
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB87900251919EE8F33AED4F8EC9639@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0zWrAwljh2I8N1UTq09VWXFvlZis+ihPeMAUdAA5KcRBO0EMQ92nn+TioI4HElwXZYOyYVfQNHvDonhXzeRMrjAJGUkw5yhRRoeK18bPWemcNMzQUbkUTcgL2YhsIZ2S7vnw08GYAeY+Zm0wekF8caqycJ5zeHH7fez8VBJ0JCzV8UUpD/eR0n/Dud1yryzY2nmCb0wI3WOvcx7XJReL9TrRh/u+1/nNKGfTpvRcMer9++MY+VLVCW8sMFcxzhp6VAOA4HWy2atP58EcvDSnaDBdrhBVw4WFs6gc3x6aaZWmBjQxFCrYeG7XtsQN20qMMHn/8u6Yl77QpiWKJlOq7arPvPyFjHIy8CzJJxTpEe22I7Sh2OoU/BmEfBsLE+MccubysVJ5BY2EAmiVYh1g/yiJ4deDeYyI/rx8NEqNX2qXmv3VuI3DnN44dI4vwkTYiBaZEfy7irJGYJcD9lSClmTzqDLwFYrThqx0E0PDREmFm0kyblL5WzTPcCxvGakx/D+btQ1/W1Yx2XFrveLY4as04t9HKHJHhCDuzQwgqVEjT0yi+IwApjoli9lkioYZgUorAgVqCGderMGaj2GUtSdtA9wTw90g5KgvsjOdQNHxmZkq9mndNGgEPdOoxxx1tXdvgwABj9yjgFQhGst99V3BXPM6GhwxBms62sFBCEEN/69gAG0uDb/BYtKkZHWeeb+v5td0UYkBpLznkKTxlZcv55pLQROlqmwiBbGOFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(4744005)(6506007)(66476007)(6512007)(316002)(186003)(956004)(86362001)(66946007)(38100700002)(2906002)(1076003)(508600001)(4326008)(8936002)(26005)(54906003)(8676002)(52116002)(5660300002)(2616005)(38350700002)(7416002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6hi6IyOnnnu4p2dnnQq3eQTr8YJGHUhjt61isIWJ3s3+SH36/dMWix+oxZPF?=
 =?us-ascii?Q?SUBkv4KoRqhULn/9t5T49gZnkeVa1EMbRliTFZsMONt9EgDQOamfl9dLfyjy?=
 =?us-ascii?Q?4GIKZ1ZBM7uvxnC8K5GRVhLVSrqKzprBloQq8ZyDZQYpTKs0BVZBv/1gCTw2?=
 =?us-ascii?Q?hYj3i3UUAMTSB3wl501UGN9kcr71yplkLA7J9HPPqO7dTTnTee7YLhm13raS?=
 =?us-ascii?Q?FSu66Nowoa/CduvH3bZev3DE1SD8TghD6AbStb2vI8DHtR4S9/cmfoGIY3Ud?=
 =?us-ascii?Q?6AhubWq4E1JEprTK9pIRBqw6EfC5Onaytu5CJ5JDGCBZoerTnIbxa+KfRPy1?=
 =?us-ascii?Q?dHy0tHLmDDx5kIQC8zbUQlwv2XVYzOqwUG3KEYKHOtnSey0vvVcfv7/6cslY?=
 =?us-ascii?Q?oHdr97ndLDOh/Q4JH1Z7FZLIquqDaf7ANsy8Hb0fIkltfWQRf9KUOkBjU87p?=
 =?us-ascii?Q?0BjE3QKU+Jq5D+jOpKdzv8VaI2nS4jSKOZ/q1mgBMyBVkATYHdrrUIlz7buh?=
 =?us-ascii?Q?irWDMa5RmIzF7eXz/9Wfd5uYFL8PM1d/155yZ+Oi3ldqSTqFyu5fLPaQ09yJ?=
 =?us-ascii?Q?SZY6tYCpi+xJQ3Mov2JN7HxIE83JO7hAGsl6VoYNKNmFnN/a1pZ+OSx8xKf5?=
 =?us-ascii?Q?nzy0a3lH0FyrBMcDwfAKJzuWE/FRp1vT5PTCj02WFDgSe3lhy5mfNyc9TLD2?=
 =?us-ascii?Q?4k1ugAVaGkuwpGeojPukX7fMunL2PSLZLuPAN+dRwvWReXX5ToTquaqVmbQ1?=
 =?us-ascii?Q?Kn/Gadb2oz63jsSQYZWoFLu/CigPh3nzg/WhTYdFZxDAD+Z+i5RYVgiv5B1E?=
 =?us-ascii?Q?wLBn7p9P0b/gxIZ/paN4rxGvPv255dWKupf9KhBpExFocsIFPNjikcYVjSq7?=
 =?us-ascii?Q?NkrYfgMHxjbRb20jn1TX6dj1QIb5w/eOOrS1R0177cFhxrP0gB5CuN2QaOM2?=
 =?us-ascii?Q?TYcGidbqL6ymxDgMVB+izA8LrHo5mb44AJ1H/EoM30XQp/tPJk8oYEI4LSr9?=
 =?us-ascii?Q?tO1QJ94eIl86ZQ7TrouCfrRgYi4YAa55aLdp1WE3de96F5NaUWE5bkEVAoRA?=
 =?us-ascii?Q?95RVnsYfV7q0dtntW/TinSEXW3DAmoKG2CIEt7fi3gWDstSFALiJiIUHB5ae?=
 =?us-ascii?Q?QRikVrtiAtrAljSSuAWEE7BAkS8o+StAVovenOOhw6uEXazy20S03aIW4udO?=
 =?us-ascii?Q?WTjlfU91ska36wlAcUafsJ72Yzc35zS9w6DA7eTLSTvXiOlJS86FJBSlxJt8?=
 =?us-ascii?Q?9QyEZOSinKS8wsjW6yB8qretHoqXVLOW0Lo3LpSGxOZVk919MxlWtj2dGniW?=
 =?us-ascii?Q?TxCK9zqqr1fnJGWg08BUb8vPBJJx7ViXaoDRMj/7Q9Mbh5qR/H4EF3I/OhDv?=
 =?us-ascii?Q?gW3w5+W9glNX+2t7jldwfttDbehVmGzf6zgj7YLH+YUIwJ2Sclyp+8lg0yb9?=
 =?us-ascii?Q?Mecsj4ZhKWn2Byace5bPdx6IaBcqnzDo4FAUvLLm6dJ9eH7xVwc9VqnB2Scr?=
 =?us-ascii?Q?YUO1XV571CyMqrVKEE8xYwCZ5WtC5yEqakK+smFEKXAAARDRdLlcR/Y92eH9?=
 =?us-ascii?Q?cUYfN+RaTZbScUH0vljRgPVGyCp9u5J97otR9UzkRJ8EY25bfrw3W5AylMco?=
 =?us-ascii?Q?YN6IAbRgOVbjereqJAP9pz0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2416687e-d1b0-4230-d435-08d9b0b018ce
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:41:03.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prSBp1UJsegYhvGnDEqewvX5rWRNLmQI+BsSuIFJyQamGsxgr+TYz1SZnFYS3/OzEQWPgDURrkkUGV2UOCuteg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

Add the compatible for i.MX8ULP.

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

 - v2 changes:
   no

 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index fe0c89edf7c1..a4bc57d044a0 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - fsl,imx8qxp-lpi2c
               - fsl,imx8qm-lpi2c
+              - fsl,imx8ulp-lpi2c
           - const: fsl,imx7ulp-lpi2c
 
   reg:
-- 
2.25.1

