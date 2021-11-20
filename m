Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C42457D93
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 12:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237054AbhKTLjl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 06:39:41 -0500
Received: from mail-eopbgr20082.outbound.protection.outlook.com ([40.107.2.82]:28418
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237043AbhKTLjf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 06:39:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfCoXZ5RGw97GgajcwRvJldLYxnz4dZY9JWUu4TIoasLZzyGLS03csvweFSgXr0M6zrIffXPzAKaCZJDJgE07kyO1+mGLltySn2trgykkK0pQik05pk/jwjdv7OXdc6rfvBt+a4e7113CgeCspkNMd8ZOb1heyhNYPWBx/5C/SBB7Cw5ce1TFO0EpVG9dsQt0eKkXc8BcXckAZIBLrHviKxWUOonoPdr3z//rTURgJ79KAox72+OfJ/g1m2wlsKB62wgxvtJitT1kP1/md5GAOdhjJiNxRwufwej6j3mcYC4Skyo09iXCNaAdDV3KLGDj2IdV0Jp4m1DKblrHrvFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRTuoLTi8JPKIctyxDKdIuiyyP1oJ8nrKZdkaaydpUE=;
 b=hvhGahZ5hciI0AiO1iJXBpVG6kInYaT+0DlTDXpkrtFSI0QEGprUGh7XL3IppX3Mk2eYVK045klECOFDpY4jGH7jm2CC4+hNbO/rKgYsYVx+/GK/jXwEoUZNTB1LxVNWvDQEabXw01FntPoEzuoJtqnLBqPaIb6/ToMZ+eb5J5JC6ko4HjRrjS+c2jAhEYdEnm3cZcp0C+beCAZW7CphD2WiL0zH3ggtNiQjDZ0pR5Xcnq1TExbjbHXo6kG7KTrHU9OR7zWEuR+v8me0M3lfXyEKz8Hj2tQD5qzABCQiepNl0RJlhJo3guNcpigGlHNNrik7oTVjvgXK99t6QLLcGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRTuoLTi8JPKIctyxDKdIuiyyP1oJ8nrKZdkaaydpUE=;
 b=b0WRCHXB0tsSSXNzmjZwV7AUTfJlXjT5MSdPGyprQgYfpfWMabRmV9odELC9BEtwPWgtoFj0v1AvSPuFRJm1kcSDyXPcrQBrrhiE5owLj0Zl4ZSQXv82Pm8olmS3fya84qTyPWDFpPTRWV4mRjeSdz2VZEv/6qUulNp+DgFuFss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 20 Nov
 2021 11:36:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Sat, 20 Nov 2021
 11:36:30 +0000
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
Subject: [PATCH V5 6/8] dt-bindings: arm: fsl: Add binding for imx8ulp evk
Date:   Sat, 20 Nov 2021 19:34:52 +0800
Message-Id: <20211120113454.785997-7-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0029.apcprd01.prod.exchangelabs.com (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 11:36:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1231fc26-62da-4e0a-5d57-08d9ac19febe
X-MS-TrafficTypeDiagnostic: DB9PR04MB9308:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB9308DC24D8F4BF0D6B25395BC99D9@DB9PR04MB9308.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHW/EVy+hzOcKWzvnnu1D8tzky6nJc/s6aQExZF0Forxv3jnGIJ+kChyzzUeNOe4Hb7YwdRz0PC471GCX6/d3OciKvCrP5uKQ9c93UnbewNx2xXOgbf0NoR9No/iOVWj5ngNHYOQqMhR2nb2CZXOhuWvT5Q5YfIWcWKwzvUaQKYOsR13D3jGqjpcnNjXopBvoU6YAQ60GqxAFe9ToSwuzj7losKEzq06lIOP8wCeYznnOy6gkOyi9uzun+QbdwUv4sc74mxhWZMQOdNFZCpCH5lDnuN8JJNeURl24FhxojxjY4yylKz97/Bg/b9Gyz9WOu5GCcMvcFR2xlFu60EYDirP+JvR+20/Bf8M/AQ6a5IyuL23+reCe1D84pcWCfA0mI/3+WYfWkWv2rbP1cQN91XQIgrd711Mv+MzwEQBMXDPFPh3mz/RwB5ff/N4QGAK2MXUU8hS1wPX9w+cSwHlF4NeH4Ly8gqbRXje5ZeTeUMnloY+Qu3lZ8F6mz5Vaa00XNONCHsPTvjftovxgLISXu6BE88RtUbJTlLnX/ru2zhgzFnc5+YsWb5qLFa1RjnodyK4vpbA5THXRxQ0ytYsp3L7Wv2OLdJziqMXcaJAhOtaHjs073IH87Mzok+WkXoQRZVoccZO7mA9B+KzGLLhQA1IIUSu9GsC7kvYzvGFSCBpL4tlmnUlss9RbTX5Ec7YlfmicXQIJJ1ngCEE4W0txhVtKyTDh/1kEOOxokded0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6506007)(8936002)(4326008)(2616005)(66946007)(83380400001)(316002)(5660300002)(186003)(52116002)(2906002)(86362001)(956004)(7416002)(6512007)(66556008)(26005)(66476007)(1076003)(54906003)(38100700002)(38350700002)(6486002)(508600001)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KGGuVJd8TnxmIuApSdJiNCBtjuoCzCbLoCuKfgaDtVxPqHl7Zfu1mRsUIqRr?=
 =?us-ascii?Q?BV1Ro77Bm3Ng71ZI1JbrRTDYYMq4jpAxhrow65JJ4mMsuXt3I3ecfOsQ2Wr3?=
 =?us-ascii?Q?BXAX5MaIRtQT9wRaiGy6ZuohWh2YkJCgehJFTO611Id6hVD7gklEKm0GxlEc?=
 =?us-ascii?Q?pggkJZdsQSb/+DLJox3v7RXDaJANWQLayxe6KJYIJe+9+bSIS1n+wMQELhvs?=
 =?us-ascii?Q?ZZQWlXDoQV4GWA2tWtQG4KULUlHRD3E9NvFk5UQmQNAMrN7CvAmbj+xd8MbN?=
 =?us-ascii?Q?fs34F79yfmutx7tGWjJ4G5C2kqgwt0oMhz5HeFaf9Z4JdlGvWVMLcp/Vt4ha?=
 =?us-ascii?Q?klNQAHHgOftasdNwdZG5Ob2f5O3AIMLvMzySu3zr6mZxKXRFX2H8f2rhK51c?=
 =?us-ascii?Q?yQJNg6tdBlaZGT39Q8kblV/zM1bE4D1aQz6v6Oau4fNQPNz5zKPpGz3FuakJ?=
 =?us-ascii?Q?NMz2KnUuvVeufkzfLRsG/u76nTp6WSixtDZLMwx7OarUWPaMLA1/nqy1x8ZS?=
 =?us-ascii?Q?UmyXdTQI4WDmKS3e7TGRHQC/nu7LYu81VuW9M7h+br4EcOnaoo5/n3pXXXh2?=
 =?us-ascii?Q?h7iNeZ0XhNDyN8dIPB+2qmt8BTEHxuX/z6bRve+B4CwL3lZuwdp6L1Y/5Ln8?=
 =?us-ascii?Q?LAeatqaH5n1VwGhkIX3aCeN2IaOav0uL7ugePB8fNY/tjZkeF35QtybntdyW?=
 =?us-ascii?Q?U1Rm9rdbq3jyHu5V1JZ5OKSDX8Vb++AGXJKaTrDXjnzIHHU4zrIEALWfHF8S?=
 =?us-ascii?Q?hezHlPg9h+73aRuDgrHtJkToG8x+ZSXO3XqVDdoIx59YI2sUKQKAaioiAFuo?=
 =?us-ascii?Q?3gOLjT8U75QwudYOkq9Fjb3vM5niWE1Szf0+yP363cJ9pUjtKxMuCGwe/APl?=
 =?us-ascii?Q?PEhEnKW0DksH9/VAGiZbJ5cq135p+jlTruaT3KD3pXyzdCkx7ly81b8jFmbf?=
 =?us-ascii?Q?gggqdTvkqvmuQnEi9JGGFhDHakXgaQyd6Mdw1UPC2MV+8LKftFDv5AMIgkEj?=
 =?us-ascii?Q?lUXyk+Juoe6uxdwWW2SU/15a9O3DqL+ZaNmK5x3r8TF/GJe5UhULt/pIHunq?=
 =?us-ascii?Q?agsSKK6bMIOMoqEvcRjG1c5I70e22Zmz7XkoHz7bftb1K9+JdMb2RsYBji2t?=
 =?us-ascii?Q?IN/PrwYlbGq/AxpHCRCR7Km+U+Jp3vWuGBb+flJc1HJ2FoYKGjhKoSQDVNkl?=
 =?us-ascii?Q?Tr5IKn9R4wA5awaTr8OEr3TmqZsbdNym3+8pv8D17sfQjkTvGzw22riwMIW7?=
 =?us-ascii?Q?6d+qGGvjDh4rksCCQj8vcDgLC6NKa0tUG5OsrwDcNJ76jUDusypdmydQ+3By?=
 =?us-ascii?Q?v/QhbEiBlSVntvy0WWvSi6ka5SDJLebEk3r9msxn2kksH3X2N4W6DL1yX9MR?=
 =?us-ascii?Q?REF61xzuftTLy0YLKfcomWRlWHhGQ1AwI7A3O7ZEL+TE1N+q0NLllkgB0M8L?=
 =?us-ascii?Q?yoZSexTEG3fYPTIozx98wHWafSGJaDeCzex7QJ1DjiwvEEm7oQRK9tG2S0Vl?=
 =?us-ascii?Q?cgoskHJJKcDdg7utNa0yF/7+gGyBhmApTeJ5fG25DN8iGTVf0L44D3cQyyCK?=
 =?us-ascii?Q?CDKteOWYi5NcKrJDfg1OwI2/DgIEQemJ5T1W37Ex1c9Hi1jJOccEoMqWZAWW?=
 =?us-ascii?Q?Izq75zabZ2v4PGOzBejntrU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1231fc26-62da-4e0a-5d57-08d9ac19febe
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 11:36:29.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35VVsP3g51nr8JI5ClBpIxxi1CUoD9jWDS9bTpMkBQndWK6PaM9WCmHk3ADTCpxmhs8bULqh5/L4lp8YLKANBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
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
 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
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

