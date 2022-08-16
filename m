Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82DC595C5A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 14:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbiHPMyL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 08:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233076AbiHPMyG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 08:54:06 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B43696D3;
        Tue, 16 Aug 2022 05:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIFlE2HrT3Gkf3S13I/KTr+HMVx1m30fxby4oa21kBQIUfFXM0YyjcoFBQ+aVMh9SaHCKc0SEfMLqem/lk1Zn92TXrk0NsOYQV3OnzD26xXegJRRIlMD5/Gou5Z5rB2gYzXM8zt38wSKTtzm2ekZ+MSZhn30FNGD8FobuKT8+gAAjFU2U3S9woniHusxFizXLpU1+lteFwOTRcK3BE0EfSuMG+WWcx/g/Jwji4mT5DBcaDCOC0ldmhcQCQqIKOsZdQa6tRxiyP64ai4zOsARkTG0ythoT1Ma1jPO8B6Wo7HByqdQlTSh9Oe6L+jXT0FLgRwvBrJ57ZSylZYmMNefdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdaY/RqM3w3mSUnvQiRuCC2mLKvTQN8CuYVnhKckT84=;
 b=eBL37KaTHVRxjNACmTkpm+VJjizWn/+aH6ZlpcB7eEINcIqDrpyk7aVJbrzSkY4rOH33VwQ27R5wZd/4DX4G7jOTykRohcWejXjcM3Um7n13JB48zNTC8GPN0E67v6Ppcz/DABmrY22S8jjQeNNc2Q3y2pdyEGneQGfUHHge0C/E19r+MbOzRetWMQNnJqt8alPj2jV5rYJQCnDDpNKB0ajIL7wkwES+btjkR4zOT8j3BjP+nq/oUH5uKfMOrgLzkRPLsW7uJQ/d7nlkidqi5gMYuiTN3RexjkkjhDwVpw9tuUg+cwbHS3ybj4pALOZK3DxQInRWKGhD3mfhrbus9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdaY/RqM3w3mSUnvQiRuCC2mLKvTQN8CuYVnhKckT84=;
 b=XdPwrlVllWhozTv/tEtwBBrCl3sni0TFfnJ7OiU0IXz+RKVGODuO8WEExAGC3hVeqVytPOM+XI1K/2eKzq+4QcEi4hzDJGNRkk39M5INHeM+6TeohDPghVo65RfWCIOyuIjtX6jj2YkD+PGTVnCxTOuZkzIMYPof31MCLbVTsDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6666.eurprd04.prod.outlook.com (2603:10a6:10:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Tue, 16 Aug
 2022 12:54:00 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 12:54:00 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 2/7] dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
Date:   Tue, 16 Aug 2022 20:55:21 +0800
Message-Id: <20220816125526.2978895-3-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8a69695-8a7d-4db6-de19-08da7f8663ca
X-MS-TrafficTypeDiagnostic: DB8PR04MB6666:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lB4oPSmSae+fclMqyxKs0xa6oX6IjtukZKK/XRQ8vG8l6fv78MWfs2Uli1i0Qu0LaBl/ncQtOrlYXrGxnWXL/3HKf9AI+Ou70q4kWbZcbEWQyJ6ZcEgmeJeP+hF/0KCv8ozJHw4+vjsk5DAJhypx+siE3RoJdpSWZnH16Uj8uH8Sb8NnXsUfXYBPIWwZR7CYlt4Bq/wwPAx5Ex6wwbYgTbR8QbneWNGRGZYd3s5zcW2rPAl8gtX2x798cpyBw4nXATh+4dCmC19ZxXYFXV0s7NIS4EN0KLZ1eYXn8fgaGNaDDA/SwLZXoaVjC7s8/1QdGR57GQqCoSWq4VAA7Yg45v3mJOSDFs9CbUoTArspK0pSUITrtfhUKLAlluTHGbJSd9p5uWG10H/Id6UtGPI6hfqcyqRgZGeHSe36dAIR74Fm3SW6oxpCyHyx4JyfEvKsA6Lgl2LSvSo/cMD8dWXB40TmfO4WufXwDwwuaV/mEcGua4GruUjhrplVeELetHAKlj/j1prI6tvH1BKekAEhefw7JhUZmwpNx/g/jgHTXY7+tBV+YzjAEiK4EHjiNV5NlZcO52rR7o+gdH1Gfh8fznwZeWOjFJl/i8BLcPiqg19TdKBzuM6yr/M1JyktJtT4ZqyficBwvjW7gHv6vwUySEkz7lSzgXdjyvClUNzumMRZTpjIEuieZOxe5QfAxYJzP19Jx3aU7B2mQwu/knrl+9AnZ+F5qH0cyO3DtOQvFhXaPFZeYgjwMQtv91YhyUrgDophe65zCm8ryULkgYuPzcNyr0QRMBWsBISoDI0TVvlVxXaUFqaTYC148nrkHnuw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(8676002)(316002)(66476007)(54906003)(66556008)(66946007)(8936002)(38350700002)(5660300002)(7416002)(38100700002)(4326008)(2906002)(86362001)(478600001)(6666004)(6506007)(52116002)(41300700001)(6486002)(83380400001)(6512007)(2616005)(26005)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UCqCs+3b9pggWvu7emL8Zn+gvq2d7OAbJcXXYOwQa+Ed9gvBhPxECqGacGgc?=
 =?us-ascii?Q?BUjuNdco9wD8N6LooaxPSl736jGhaUcHNHltcab2bUARFtB3QAsIyNA80S9Y?=
 =?us-ascii?Q?XN9iweqBs+NniiaNPJqAt05BtNwUWMLsmunSEaGGvX7Y5PQ3CNijGEhseLZw?=
 =?us-ascii?Q?7EwpAL8f3tELQmVdieyPfXneRSJOApL+tR9fghaxfwziFg2FScT4MQ6X14S8?=
 =?us-ascii?Q?Mjsy2/jadUasrmtAGPtV9l4L5jX7rX924STUSkhv+8kRNMzM3F7NA/nQlB5w?=
 =?us-ascii?Q?v5UAwoBt12+pitoEsq7WC0ROcnqKnq2m4n6rLor6PNzenNqSM0wVzWuTE8Gr?=
 =?us-ascii?Q?hiFEQLi14CRNObdvq2kuM6KD2O/GkvzHuc6ty7hQ1p92eQkD7E5+3I4kNIWJ?=
 =?us-ascii?Q?2VhEXI4/TgsbSiMiUOTJ+NUr7jpmWIhbWXrrpK1WoZmKusmmbuL2OYuAQYOi?=
 =?us-ascii?Q?bsCD+bi+i8f0dm71VSXu39hPDFsyE/JhmZBs9Ukg2gcsi2xgvRw1UdGm/2v0?=
 =?us-ascii?Q?+OvGGVvOY62W4pOUYt0oreHWwyqVgOIrhGNC4eXAbFAg/DH2OjP+y1wO+25c?=
 =?us-ascii?Q?QG2nK1/U8YpfbrGs6mvo1KLPqUAFhepap3LU+TQ0xCoifw+cOHZuE0D0Y+sL?=
 =?us-ascii?Q?ZXhkup0bHEbLD4YkMH7GzqvpKIjc7EnKvHnAGDnndXg0l6xh/qlW9ZfoXyNl?=
 =?us-ascii?Q?UUQuMumiOQmfmhSaOgI68RwJfyDKK6hy3niE6Xynu+alZigXyw1NpWyK5Tq7?=
 =?us-ascii?Q?8xSO8i3rViuugAaVSOrsCKfDGV0yxd0p5pkxFC7ZRIaO7vsMgq7B9+Y2WgHq?=
 =?us-ascii?Q?uYZJQTSJpGmFqn8kEhgp83IltF5Pieubqg6BFyOdm9gLNViYsy/P5kS6DMa4?=
 =?us-ascii?Q?mNRcnb4rYRz40/RjHuUn8sc4J02Xy8Zrb5q61pQWQB0E/mvsi7KCX8W2JPeo?=
 =?us-ascii?Q?gWtDMQAB8HCcxIE6cTn/pBjhqR7A7uRkSf3iy7r+q5PjtOJseN4ODi8nh+8x?=
 =?us-ascii?Q?20AtYtUtm1+qxfTQrcKh9bp2LMLqZ3uqLBXAai4PtplkrJNmTSzjZVzCHp4G?=
 =?us-ascii?Q?JSBJAMRS2K4HHPMiMQ5huJSbkACC4aDx1f8wUWv6UsMIMq5kcdlT55fsymbd?=
 =?us-ascii?Q?0YkH0C7h8G3hW+VOIXKeMUiaZ2kY9O/MnUpdtwm1+5eozWlU5NNFCBR6wpO1?=
 =?us-ascii?Q?+cBvbKE1wOw+Fu0AQ0d8avhW05mFZK6U2d2tucY4S8916/PDlEB1f+CZQuMr?=
 =?us-ascii?Q?JKIe092B4uMUu31VQe3++MHM70t5ZQyZSdyDiINIjHNoOnLLblBtz4H9Tlre?=
 =?us-ascii?Q?YWrj/c35KVZoLq2nva3zMmNpI216NGRHJfT9Va0EJO3lXHzuFmCCF5SgkkTl?=
 =?us-ascii?Q?FI6LhuyRhQhm+1dq0tXf3RNUl1pNOhcE3W2Q3VPN6EHozcggcGgIeo7+qlGL?=
 =?us-ascii?Q?RHpVCXAirb10NKqyjgeuNARgrAlI8xbZb+/jeM/DOW6qG+hHGCU10tUvAjvx?=
 =?us-ascii?Q?JbhMwMo40uTw/pG7RXrPftLgjQdpTQwoV6QMAT8t9JVcMrCKxREs1jUc7glW?=
 =?us-ascii?Q?LKCzX2ziu38/Gus0mZn02CAL9tHHHasIAt0mbqDu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a69695-8a7d-4db6-de19-08da7f8663ca
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:54:00.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AO6Z+ObySA2ubCYT06gPaU6Y4rFIY4b5+dikW+9vZtFCQGD2cB4RdQ7CxYR2Ol3XULxCxn0DEU0k0u+JACpmYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6666
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

