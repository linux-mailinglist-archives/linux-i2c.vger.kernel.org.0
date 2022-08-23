Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1ACA59CEF4
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 05:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239346AbiHWDBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 23:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238765AbiHWDA6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 23:00:58 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DFB5853F;
        Mon, 22 Aug 2022 20:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i24yaj9D/+fdfsHJvHeluu4TUYSOZXqxE/A0xiUGhLtqOU3H79ZpjCp87/xu3we8F2ASTCxZd6t3HjKMdo0JGD9ITbd+s0ssLWBFwaMd5+yyR+W7nEtts0IZ7m+zB49l2m8EPEzqA6aRvvvtGYc+gvYYUSw1aNAw82I6sYh1w40daY8WWW3qVm47sYrJL2b/PXjoYacT4VOZNDGpG1sS1HuulQ4h1eRzjyLUsslUpVMZ5NhSuyloABCGVQkfuq04ED/sXsT8H0nywQi2FfD0TqX86CKvs5+rUCKxzXrbPTsuz4rbtT9OwBI4c6wZp2gOb4iSwmZiufCTaF0S3Xk3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0Drvr/3exAczbRIPd/iISuB62AttOo+AgKULr4JGV8=;
 b=S9UPhpm2/W4C7IxwA8WD1a+7U5xPtjLCNeyLFFRnmpUA8ZnaI9Nka14S5k/9xNWD9ubs2+UZuzfNGoaQC4hWhKVvRjJNFoCaV7ctBMxRBhZ0dL+ztJ216G1+VoHfy9tk3RUaZhGyfw0+WIYMPvLiCOlZx2pVhDbvCiGL7xGJwVxT6UgD9sW5dPQTS5HhwCUgQL1dPU0vNOhXk3UVVJWh5J54qwmdIAsRrdJRKmppxLFg4R2597IUOGFvLze+/qGzaaEksES20oOVcoP2w3MddlrDQZwKKCxzhvQyxn2LuITQ/YOOmBF+gCR3076iRRyq/3yYy9LBKI8gvYAkUSz0oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0Drvr/3exAczbRIPd/iISuB62AttOo+AgKULr4JGV8=;
 b=O3mKY4q9YyQjPAB0WQLRNIF95zvAuvwxmguu8xDZBkpguHeGFgwomVDusTEsJLBWRUd7W3XspUSI8ZDXkD3VABAsEoUINJ7HkXPrYYnEPh/2CK8+ycWRvD1mfUpqOcZcy+5u8rj6fHHe6hzmfBURBSd5hGmoCIsL6S2G6OB+oaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 23 Aug
 2022 03:00:55 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 03:00:55 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 2/7] dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
Date:   Tue, 23 Aug 2022 11:02:10 +0800
Message-Id: <20220823030215.870414-3-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c359a99e-1543-483d-2a66-08da84b3b239
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZKCii9k4urF2ix2iV7V717/nODWMDLv9W45zQ+vCqFyxm4+5NwrlMQTe2INskJaz1XDu6JIwAzSTHh+VRkm5lbjrshfJwEzEEKoyRiZVvPG08jGPpdKCvv7AeqBz9A/hiGnEh6ggBseMxLnN8chv2U6gu4QVGlpkkX7VCMOYykU9ErVRkBIJBSh/w+0q6IOQoSSOOhJAOJdu0ZCA5rer+bufLzOyDKPjekHPLu2WGh3FKP/95MwSnl2ahB2/+doIHu5luhnWUUK3fhL1PgoQgEhSphZ7bMzvXD3GM3ly0vypNemn2LzVIftKdTiUl7riFR7gSTzAFtHDwGMDVVR6ML7GXuhQ4mJPQPlTEXBGzkCz34O7PZ7YXXxOg8gkJ1Ai1hlXgqzR737MaFtA2MkJqIn465DQ2S77TcjZSjlYWpEx0l9KLtjEIquQj6qPgeoUVV/W/N7RndoRaXstpiK6jnxI14GabW4pp9lQUHkWJtKMpz9dxOAharKYEiOLmZwxQyYZBJQOL5Znd1KDZ2w69U4KiGh2aas2qx8Db2ngAmUvr5mYcjrgJEPGWhqr6TLVpETH9BX0NNcVPdVdqAV8KxqiFdwIfn5ln7ZXbwIbMlgGqdhb7uAHFE0GziK+BbmbBYsE/auTyLgtX+w0LgGGV3d0kpymBA5Y2bjrttMgb+pdNBPWMr2n/RR3vxdTxBG1/busf2SAsYKH9BanWKdPfAHc6DGkEzQxEiNzeH1R0VxKnLKoE1n8EsEM9p/CqQkOhFnnm408Pe6MLA1H5/voQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(54906003)(38350700002)(8676002)(38100700002)(5660300002)(4326008)(66556008)(66476007)(66946007)(186003)(52116002)(8936002)(6486002)(478600001)(7416002)(316002)(26005)(6512007)(6666004)(41300700001)(1076003)(2616005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YoWe6GSs8hCEPbEHMl4dQdw0NzKUcaEbTERYUl8ODgk35bUoh0PCY295tS0q?=
 =?us-ascii?Q?9SDc+dRRc4OKemE4jNRezVRPB5v/VoUu/inqZOZG+iAtJt5+PiFa5wK3Dmnx?=
 =?us-ascii?Q?G+SoNNpl2QfqkjKDg+FkPdr8Pp9ju/Zwo10QKgC+HYlz0VdFtrZYfCpzOgRi?=
 =?us-ascii?Q?/rsoI9lWtJXvTx6Twdn5opx05m/YuqTGZiAYDqK9vvDSYAd4g/an24cMKg8n?=
 =?us-ascii?Q?P/mFen664jlBXcrKKmBv7x5pQEQpyKpssfe9jmgZbzm30ZL047ryimNRjz7r?=
 =?us-ascii?Q?9/ZO8N1UgmaWNIxrYwQFkwAs8d18PSiUSnMFJnDzSuQK9HizhWZUm5vvbUvT?=
 =?us-ascii?Q?KQxDlrrCGeZIs/0bCZTCvNT03kBg7G11rSgfJAJmWAWWe85J7IT5Vrs7qF5R?=
 =?us-ascii?Q?8QB316HyQjlsikmmG9a8B/mOFz1jh47gZZNeR6AVf49UqR/TyubHlNIjky/I?=
 =?us-ascii?Q?DsP9aTWXMR19DFewAb7wj7jFtJ6xVrQabiPSMZ+ZCKkMQxOR+gCDvY6hTbzq?=
 =?us-ascii?Q?u/X8LM0Vh9LDVJW8lC/V6a5tuQUCITXr0Nx++6C0srw6HW8XpE86xKOdIAUa?=
 =?us-ascii?Q?c77x4GGkk9mJQQ2hl7U6WegwEqyK3IStFyYb/oltqlLrD/BXFnyEEFu1yusf?=
 =?us-ascii?Q?bpK7UV9C/Ta8mtQteUdf6tFzw1oB3h8OsAhpQmCQ4CK20qo+8SIiTgndgrrX?=
 =?us-ascii?Q?K9b8j9GhHWBelco7VsYWalwRxUuuU/GN5x70BBNsmhfG9rUzDosMbVWloLkn?=
 =?us-ascii?Q?K5WAbkgpNhfL9uplmScL1rKI5hjC9Vk/0w2v71tgaVYKjuUuES78dWR0yOFM?=
 =?us-ascii?Q?7AtpNwRrgdVHXgXY8kyFOqAKT8kjLUPVcDVK2vzu6MMCFJTPcH0od9ekG1wT?=
 =?us-ascii?Q?0rPUurWEqbNiBYPnSVR6a9fRhQeuysNBUNtpSZuCYmMg9kjMdODbxbReYAwd?=
 =?us-ascii?Q?7ctdyPw7vV/Z6rHw7DiJiTqePScvhjNF/dPb251sV6QKmAW5uQUQL8iiJ+IK?=
 =?us-ascii?Q?LPLOl0GJAlgyBL94bqjqPN18ImtHzFC2Q51nHM2nihAOktHqrXKKQbbJzVn2?=
 =?us-ascii?Q?QaE1gTvaKW8yxv8Ml+H4xRpvvyrig6tNHHGot4ftzGX27z2rZBJXTv0OTqkH?=
 =?us-ascii?Q?H3oNHjKHSwavhUbthTpoq/DCwwwqeMQILJsjDDIzdYevBkiO3Zg3BCrx2OU9?=
 =?us-ascii?Q?/YUgTE8jzGH6xfK+nnxBJKbrkxrTnV1fx5UnF85+bvr2rM0ndHhAp0ez3WPw?=
 =?us-ascii?Q?ynd2zCcaOfdxpsdA9b0broQeQZgRC5FYjW2d4wtwFd28cEHurT777GQMOpXt?=
 =?us-ascii?Q?aOXW7pNxASpVgxINC3O5hpXCE0/DB1zOtotB5EZV+iFtSZl7eTJWS1yqQbxs?=
 =?us-ascii?Q?OPyFqzeWyRenXCqe7Snb34/jgXAyHBtfSH1ahhmZxhvwQP5kiQfh4ffJBQLv?=
 =?us-ascii?Q?Gitmi8qi2VX3EvNM5m1BeHGJnpoQbf5p8YPPZrrc0uhqf/VTpLg/SWh1n3po?=
 =?us-ascii?Q?rA8JtYASm3G2T743xnpOZrOuBdkNxaVznwPwMlicHVO2swU2MgkmaYt4ddsz?=
 =?us-ascii?Q?0pFWvL0CQVxewVuVrJMNYnltzmQ8WK9qWqy/Y6J0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c359a99e-1543-483d-2a66-08da84b3b239
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 03:00:55.3418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EIsDfu/Q9Bii8Jr8Uq5iJ1ygd43rjc+QiaUZxhlswAbFitXMSy+71SPFudX1o+lY1cn271zD15RbYGWTPDCaQ==
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

i.MX LPI2C actually requires dual clock: per clock and ipg clock, so add
both.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

