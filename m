Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CA059CEF0
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 05:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239696AbiHWDBY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 23:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239802AbiHWDBJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 23:01:09 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B4F5C96B;
        Mon, 22 Aug 2022 20:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hErJTyr0znLBO+5QLuDTx6zpF4x7wbNbpgGvV6kNXeIExQ7Tjjn6qOcE2Ie3pJgBfaE3kU6QjIXY+Fp+Tv13eEATRA4XwmzTkZpW99xB6IMHkyJknBjz9wG35MpK4rU6ImGhO+46/D+3rB3Ww/9pHwgEucw5IwSYNnqZMDyFtxInyhSi/gM5gjbxMylr/GKRJ5iiNKHCCSm9NP0Xtp7Zm6FhSI8EvbfYDQOSmdoRvxen2D0FWi58p3V5alog+ZylNB1ubCqAoQJk5JZAnmFjk7ZgTV68yZEBhDApghoFJBt5gE4YTj/ECn69IHL9C/TO8/s4n/0mR+uxlxzpa9eLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNeEk9dv+lQOYrPqypppxmPR6F4phkmh3IOeN7xKiyM=;
 b=LqIJjsb8DevVWIfejLdqcwq9Se4iTNXmARYgzWpa0zlfknRFM7JoX7ryulfrSfjL43wowMbUvGGd0qNgeZ2wCq8ll1V2/zlCqvbpG7aL481JAWr5Q8XKPJhX64gkGdVq8RowUC26huBc1V1RmYnbEaEAuJxn58r7GAuSvXTCqqJEHg1OqL0vkUi50pZimWOc+ymLFeela3wtnB3ez8hvepUZIZ9lAFy7+U0Xziq4SZDqNC3Mg3jUU3/WqKKrskEPX/lYZ/oSsJZIrQ+nwQvgfyXxCfMKDeiWI3d5kG0cwfyJEPUt4ZkFWxBEGjRltgXw2vKQlNErOq+WtRaEwCWc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNeEk9dv+lQOYrPqypppxmPR6F4phkmh3IOeN7xKiyM=;
 b=JQhZNsiCfJOdMr/pWLMFPUNXhDCKmzaovJpCRv3lAfaoECMS8kmaZnYTEPAS1mOT1gH2VlxpN/wwzwy1xSTH+tnMlHDEq7kyD8LRrXhiGwWabPxDqeSv/6XifHcj4FDoGZZOtNOCkfWJ5j0U+AlNjbA74n/PaRVgJ80KslTvbKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 23 Aug
 2022 03:01:05 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 03:01:05 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 4/7] dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
Date:   Tue, 23 Aug 2022 11:02:12 +0800
Message-Id: <20220823030215.870414-5-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823030215.870414-1-peng.fan@oss.nxp.com>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2909b49-b12f-478e-5889-08da84b3b801
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUvAm3AbDAsRnkd9+gZqW19swlDlg2hxFn6huoK7w08AY+BjHJY8EDbJLnmA+7cOCDhrGEXGx/9eh+ypQWsVmJgNflIIMRMF+lVU4qaWuKaQxx7fb9v9+9sADVV3QMbNbIg35D3p+nnOn7FhFAJOqssHDet9R9j3Wp+eDz7pYrPpmmKtaeE/CJQvL47KyA7iXixJJIGEbe3p4zci4kM1JEY/MchxUr6o1G1RV9uB97aQ0aiZ3FKA4QjZiTEP+Vy81t0rmQeC7a2cnQa3+6+2gXHxnsVpi92ZNmlgYiZ85xd1LIVFws33GUXz+824d+BC+DbUDbTbxgalnpBO13ZXxnF9cLd4+Hm7B1KYLtF30MLNsk/LEIYZSfT52Xdg4QdRcN64af+/GxA8sOOpkaBJYWvUlg/EtTI++Ovm0rYM68tl1dxndjE5TV9SWza5+PuEsWR8GBM1QfkKgSyr+2h7uugy7FWYlYbaSfAkYJzui+9Irp2Ax8KQOTLAKKvigeVvrFGpWm1ik+vTqbSiY4uh5tlMjLND9rMN4Sc7obEcvAv2GohnXfCxXvSdAprgppd0JekYi976r4nUe95e9vcQ56KugKsBTIo7BOy4DDmxHKoiI57D/kEwEL2mQN5dUb7zgoCBH1fpEToHJltkagfaQh80p70VyPm3N2+0oNyv3BgId+BqNPcNfDUUhD1ShnT0H2hk1sNdAV6J9F7pFdQP4OQSY/xecua7FknIqeiqOJBArimwm2bW+OCpRtbaRqMT0j/8hx7fD4bSeExNoaCDyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(54906003)(38350700002)(8676002)(38100700002)(5660300002)(4326008)(66556008)(66476007)(66946007)(186003)(52116002)(8936002)(6486002)(478600001)(4744005)(7416002)(316002)(26005)(6512007)(6666004)(41300700001)(1076003)(2616005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R+9yTZOv67uVaelsL81TT1XRFDCdnYyTAIj2kxkdSU+33smXtH82Fn8/oVzg?=
 =?us-ascii?Q?FF3VVs52o7xKrFRh6MrTUcbh3907TumKNOOCrJcT/YCWdkDR5SmolunLLa9N?=
 =?us-ascii?Q?RvPL03Meeq1y0+z3Fi/TZ6GHP4mfn4jq8IBL3crpu6gElzHI8AtJx47paoO/?=
 =?us-ascii?Q?DBX7yZPIpRydIzHVgJu+EZMor6ch1DZrTYNnitlVPi06/dzugsGpU/N7caEl?=
 =?us-ascii?Q?vowqgMTQATytT6E5zg8kBaeHAeL33bvdutsCKk6vDVs+vaKToWVDT/C1Iedw?=
 =?us-ascii?Q?xvsBgR/Wyt2xVgqjPk9iefwOymd3tihCdfAB015dVsf9++Y6Y7RwKK4Lsx4o?=
 =?us-ascii?Q?7gMbJYRoDr7oO8I6Fk27tebgyeEoFL19aciJla+gFkseeQmnc1BPSwCxsiTt?=
 =?us-ascii?Q?Aa0GVxEKLSQbr+xJBvSdfvt8lzuZn1m77/bH1Tdnpf/lFgYpI8o1Fn9k0gm+?=
 =?us-ascii?Q?J+cQa/5Bx1exTSPu243+KtkCyUZIN8845UeMvI4fiwS36/Ss+AF+pxs0zE4X?=
 =?us-ascii?Q?c13stwzlirW4268NcvMMptWFvqe5/vHka12qBpn1jbiA6+Ai/B74gPqrW/CF?=
 =?us-ascii?Q?bss7A05NYVHFYMAoYiU/QHqd8Io+b0pJTfqhvnBBcCmekBTbX9zncPgRjrvU?=
 =?us-ascii?Q?knHSYF6dpSI0EfLTWXLVl3BfarNZzPmbVspuSudd/qSb5xQ6yQCT2wP+bHem?=
 =?us-ascii?Q?KO0fnm7rEX+1r6zu775zg7Kg98d2+qc/40tywP2cF1xkPckUHryPlYbCxzpS?=
 =?us-ascii?Q?MOg3dCSRDiZk+ob2IQ3V33iZ3OBiZ6ytP0BryXicHcogXqD4HN/upe0zp6gO?=
 =?us-ascii?Q?ReSS+C3LaJOQ72g6NVHR4PGXHBoViCN53qrGiiRykquWrBxW7GQE73I26TwF?=
 =?us-ascii?Q?N/yw2IiRWh35vZGd40/i7CZDj71hUMZHDG33aszm+nvEtR2oc2SLr4pgRij7?=
 =?us-ascii?Q?0xJkw99Rp/ck/PmPJBOJijDiJQ9S7mGm3hLvXh7qRCqtEkINX9dO6+LRZA2d?=
 =?us-ascii?Q?DmOQEswiI23xOE9CxRdwq2Kyg+oLZwNb5gdGjCTgu8p/UyLqUi0EGXACj7ua?=
 =?us-ascii?Q?zxzrLCIqwTyM1Yt0CkWn4CP0J2Pw5kcukPoKjn7aLZS/TtmxyXbvJqVho7zK?=
 =?us-ascii?Q?zhqryTMMIzrL7S8RLEpLsR6T/jlE/RwCWVFY69ocwHrsPi1greY8wLiNmPGo?=
 =?us-ascii?Q?aprryiTyxMxTz6uThjsQ+it01HiJVz9YjkwkRSHBymT0UM9ggkDeud4lre+b?=
 =?us-ascii?Q?MWxv3RUz5VZHqVjf/GaSIaryTqwB2rE95WMEOImz24EYeuhtax6tRrGGbH8X?=
 =?us-ascii?Q?uJuHS4ATWyxrguUzRj07CVkh/Ragh37fuN5eRjzwWP65QxhuE0gYLL/bdr8k?=
 =?us-ascii?Q?p7lhASjqJe7VkjzjBvWVSk1cYX5/IfsfWsqNloqPe+S8cmwkbzS9FMPDT75Z?=
 =?us-ascii?Q?9AoR8MEz0GR7RWKcIi26jxikoBt6UlIftwBonT0T/JGt5dBaHB8kLAhTpqqA?=
 =?us-ascii?Q?Y9zoABipnaYps8W0e37CK1OJ8MPMwFvtYtAKSsumCxq02ODVN+kTmPcIx1sx?=
 =?us-ascii?Q?CzWV1y3I5tOvCYms0/s1PHEDWoZhs+m/SBwmflhQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2909b49-b12f-478e-5889-08da84b3b801
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 03:01:05.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cEbJV0mhmr06BAzDX5Hv7c4W7NMdo/KfvwyUvlQYrebytp4XrQuyCFW/R2J80dzpNnAAa7CQcnu2QCEZ0eeFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX93 LPI2C compatible string.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 08b81d57d7e1..4656f5112b84 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -23,6 +23,7 @@ properties:
               - fsl,imx8dxl-lpi2c
               - fsl,imx8qm-lpi2c
               - fsl,imx8ulp-lpi2c
+              - fsl,imx93-lpi2c
           - const: fsl,imx7ulp-lpi2c
 
   reg:
-- 
2.37.1

