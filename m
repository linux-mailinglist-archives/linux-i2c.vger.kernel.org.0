Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270F644E301
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234569AbhKLIdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:33:25 -0500
Received: from mail-eopbgr80082.outbound.protection.outlook.com ([40.107.8.82]:13831
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231173AbhKLIdY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:33:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRTyelCsqdPiDMVgKATLDgcHbSVSQ0DfuCmcD5jFkiglZyNjoPx/ersEWwGKMIy60qecUveWHzpL5JRv9Py3XRZJI8eA1fJ1B9snqGv7y8hBD8KIosnKSAWiRpLMYpqpbaMeIFIc12zMNV7zs6HvncNgV46Xw+Q7WKpop/iZRfSXtYa6a0U/O1IWnweSoNfXrUVHnUqhVb4+HK2pQvwdenJNHUyT+OR2hMRb64v8TusqTuLNJyVJhWslQx+DXZZ5kUFji+cszexdHL3lYXu7QnCn4b4a5EynbXeEH+65dgGHwJO2JUJKEu5Fz0edY7Bgtu6lbh6/VT8OiUQWZiyiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbc/poE1Wy0/6UcfMAs1z3UArzTiGkugiHrbzAceiDs=;
 b=SopGLJpNvAS3m0UdmoMayEBQFsbdnTS29Vbu/n5jPnrYml/GeEN03jwTSJEI7HdSuxQ646rRzuFlIOBPzeXlK7QKqtzKNytLlxz3Ti+6oriTULNnZj/o7325Z5YDLPsa30fmfQAMoBvcj3nskmmet50vIsPsTPOA1rnfDsfH8DgCSuHuiviKuEXNGL/5+fSrMg1W6f20rhqc/ooeBvRAtE/u6L8vAkO8jNo2554/Xy893Bh6dubkSEimuKF6Jq695uVNVx2cQI3eBZWRuxvNdD0Uf+QsP+nQ75v4DuzbgFkH7ROKGHz4v9LtYnHNMnwTF1zbwaqvKLmWdVIPCoIMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbc/poE1Wy0/6UcfMAs1z3UArzTiGkugiHrbzAceiDs=;
 b=JKKy11M7rMLRXmSWjLLGp7eXtbtlWNKc+ofZpENmr+wMCCydZouBWXIA8kb8cACl/BrQHcQh499BcO/xfRZdTCtn9zaGDfmUTb7s8QfBRORE6AhhFqZ9z/srpEXis/LhuY/e+y1VX5We3016X7CqUQYR/FLgxuP2vtpWbPy9BNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:30:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:30:30 +0000
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
Subject: [PATCH V4 1/9] dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string
Date:   Fri, 12 Nov 2021 16:29:22 +0800
Message-Id: <20211112082930.3809351-2-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:30:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54bcfc9b-67ed-4cf4-74b4-08d9a5b6afae
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB84939E6F4BCDC91C0E4EEBB8C9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjULdsBUqhlojghFKiKw0QxCkoWv5zeg78P0UKqKDwj0SLAfz6n2PgE5h9HzhygpvZ014WtfUOYO4Cip7oeCk5wocxHULqCPdAcpr7jOB4A0CL6s45mg7ZPE/+pMtQVzWYZzkjCWXuRu139r16np2Nw1q6aW7a1gg0DKuYqRUIB0dC3rrjIVAxsAsIPkOp2l3K17FisxiD036yMTdnbZf1N3zYQvqX2CfoeDWzFpbCeu6ovwS9h5RPhTopNizqOAqGtYgj36LBSspat+fQo1onM4Pj0UJzVG5x8ciVjkQyfe8NhFCNkC9V11aZiLYJM6XsFgtyE3aOUGLSI7OqJ17gPkohfry4eM9QjNLFlhH0zBfM8itDKXgQGAHOKz7vnSc4P3b64t8gjdGNeE3YvzU8xous08YGV+C4888TrsR2IYEB3KOaCbB/Ros5Wh/yBVnTZJd9amGA/I04HIjR1jZWLYmOdr/DFPp5OQ1Xd0o1K/coWBde2M3+XZv78T89l0aKwnxSwjKxlPi9QRYrjtlE9yv4vupaBzhwlyHJkZ+RjBrbkM0f7/JEJmbH29hfUJ8Zz1Lh+RGOSuS9d3NrdxXTK+x+ToG9ooRp1ThjGE6/0IgQHjWbcrdg23U0EYRQDTIwZxWS1omL2jqhPbjEhzW2OO68qcYKy4EcHUVitR2Eq+cSOyA9EkkGWTZJl5P9yl3PPCLuc6FrbWDxGAFSbORToBFaaJo+4RzgN5l/XiOSU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(54906003)(6486002)(2906002)(316002)(4744005)(6512007)(4326008)(5660300002)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i5QcLH2pEoXnRfAF5A/N+YvuWAZ94VbBR2TNGswItMpE8W8YwfzufuWwmEGU?=
 =?us-ascii?Q?5Sl39wk4N4OKo2XUqUkZPEeQbM3V5rUAdnIys6ubo/OWlQXFcGf2+BSVuN5T?=
 =?us-ascii?Q?MQzw3UTcH2bvUWIw6AAwBKYmrrrwtCb4feC+8iq6YaZVzZfPoQm5rxxZl43p?=
 =?us-ascii?Q?Z4J4NEm0cueMgSYiZegSkHGR3S+NI1PDKdQQsxKSCxNvek8MWIA4kxXZo3x3?=
 =?us-ascii?Q?dM0iMOcQt71kPVEtYSL2dTKi/z8Xbk8BBJWvVJRbLM0IhMiEIoST2xB9d+wk?=
 =?us-ascii?Q?5kTkYLexysLDfdiqK6li0cQU2A0+Lm00pX3pNjN4LGW2gN+IkD3e1gIWiiPS?=
 =?us-ascii?Q?EuIZhwCsA9TtzHcDqldg62s8kvTQMdIGC5fXh8noXgPuwwT6Bkmzqap+OiSO?=
 =?us-ascii?Q?ur53r5ZcYj9ytHbcsXh6ZJSQFfiU0Ob2XMsk+DvrxFpveWHgkEzSPE5cYwq2?=
 =?us-ascii?Q?/jGBgACK1DjVNJYACL1BUquYbBofFyTU5feBWVC7Fx7gEQBznqmw2YI2U+Hx?=
 =?us-ascii?Q?IUTIf3Y7wAacs5yw4SlUIMYQSiCE3/JncHvytzHcazAetYCumBtqihpRyluH?=
 =?us-ascii?Q?F5vq3R8gxFe57+lkktvswK+mQaxoryXnnwqTo7dQpSksPvnnBvdsM2pHADb5?=
 =?us-ascii?Q?XudTd7htb8Iqe0+dXmKJA4UBYzJptslLUjWDatArPDnxCU198aPoKJy/VTbs?=
 =?us-ascii?Q?j140h3ecgjPIIERKlpfEnYLljoDH0Wf/tqsu/0KRmw+gNNWjRhHHLsGQALwt?=
 =?us-ascii?Q?pUsXs7K7OBbMuEBr5kDP9cnQA3bsCGLWVzI4WtoiRn4mwvvnWyw/wnMm6vsv?=
 =?us-ascii?Q?9d/3xTXtbAKUWqQCY2EE5vywvxWiKI8uzxEUoQkPaZ6X79ZbhO866sg6dO7t?=
 =?us-ascii?Q?X27n5s5n6NgmMh5qMs6351oeEMG3Y7BPB2wfrJN1UNEy4Vi+t2hcqwgdbz2D?=
 =?us-ascii?Q?m5juX+MlwVNhCGDnrxHhWtmzfEyRlQjo526dOvIlkn6JaNEjuCvOfoqlZonh?=
 =?us-ascii?Q?uEAP8Y3N06gwp0DF2YyR7hz12DizHNDYiKT8BMQ7HA8A9cao/u2uRYgUMFHa?=
 =?us-ascii?Q?QdTMufxF1bDjtlvhNzaoc7GJth7Ap76ckb86ZyPQr3sGNTRJGaknrb14TK6E?=
 =?us-ascii?Q?MU04H5eMQHRMbm3UswHSDffHSoARQO3yPbZPLNTcs8FYDSNtZZ/kOZftyjzP?=
 =?us-ascii?Q?8cHCjrG5hxYGAuzK2qGE/FO7jnbE6PFyeXY4l7fBA8n8Vl+64R7nP8PYzG4l?=
 =?us-ascii?Q?d9HFuEYNZD3ujyhUx9rLOPsip2XP/bem1OqYdas4NcVbcPA9Jghu58VrIIIM?=
 =?us-ascii?Q?U6jShu4Y6wSMTgOAgOe/Agj0j6qiEnXsPGQn+YLbxnctnVxdm1L+0tzOXQ1Z?=
 =?us-ascii?Q?rCn07JU5QlN613Pw38/PWDADnBFv5YG88fXeoT29imyCNYua9dEInp+mZdTk?=
 =?us-ascii?Q?YsnMgsH40WwcB+tDMchG8NNCK6VXnsExM0are7L/ngY1v91GNuukwjMqA4JO?=
 =?us-ascii?Q?b8Mgu589H2izYolkf4PUaNjAXtH0PVeqAVnqOVLC3a/VMSaSbUzhadioKtdA?=
 =?us-ascii?Q?NGF06zc0Dhdl36U0d1E+YjSQLkNKM+xmlMPt6F8XDEXvO/TNM1iY4lxKk5It?=
 =?us-ascii?Q?VmldtUlwnSqLpgTGN2VbVJc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bcfc9b-67ed-4cf4-74b4-08d9a5b6afae
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:30:30.3097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrpkY1YQ/Vlv4DMxBYXUsh7el3QZ8cAOim+WJ1RyIGpHrNHsxc5CBRDD1icezdppri4f9PWQGOFdMiiYAOP1cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
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

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   no

 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 29b9447f3b84..0875753c7d15 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -19,7 +19,9 @@ properties:
           - fsl,imx7ulp-lpi2c
           - fsl,imx8qm-lpi2c
       - items:
-          - const: fsl,imx8qxp-lpi2c
+          - enum:
+              - fsl,imx8qxp-lpi2c
+              - fsl,imx8ulp-lpi2c
           - const: fsl,imx7ulp-lpi2c
 
   reg:
-- 
2.25.1

