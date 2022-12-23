Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA58654B8B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 04:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236038AbiLWDFy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 22:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiLWDFw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 22:05:52 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CB89588;
        Thu, 22 Dec 2022 19:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVT2PqEks+ytYbRqlDL5jJ/YB5TUaDBww/86if1k4CAFeHsSRjl0oF74O3p6tA9ewrKJKBzAJh5cJEUWvVHwd+QRRIopTxYzndbaxb4DbNtu4es05HUpPcAMhHDVS7uqdGE9la8WVmYXVBt5soaF2JK4UzXx1xAhUTug/kmU36IzUXDyEyNJ790f2VrdY/AOh4fELJmHYTsPSAX49hIj5MMRrwzR58u3Vt751BR/ah7msdp9PKIfuwui6uleLSwJ5cwjZrh/c+OKNw9eWaTnQcniidIsvpKP41H8fgYivnoUFIJzI6WysmLm78yByMKun+Fcyc4/XtBuKnlFSoGXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3ZOSY94p1wp9XQufFIVE0/MtXk78fB+YYVAqVWT4hw=;
 b=YclJOAYSm0TTvVQXSnZi9Dx03jqM7/VtjIU9uQTGFD66assNluzWx43b+xU1MUwu+luhmiBWCKTNJ9Nbz1wzs8Bzrn/A2HbBUZ+qZ1Xb6fLMtgWuTNQ6mm2hJoExUldGHdT+2/65xDC+BwoQcNgjnltdToU27DnipNTGJ4c59+ZIYA70zKefElcjTQQ51xaBzDSsS5Blu/0dTXvBFR9rCGuozF/ZD4UjaqCwp5CxqQ/8JPFRURwIMe0VSz+Ru5bzyEONNIDvH4iumwJh5R0S5Pw70zFm4T8iQESu1sPfVJCw1ykgEH7WryRKRP2xGWhHiXMiJYd50nrioLF2nMIB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3ZOSY94p1wp9XQufFIVE0/MtXk78fB+YYVAqVWT4hw=;
 b=B85KX9a9WVkr7lbMErBZ22ld3IF2URUnSELYE0HovjUdWIM6I0jUOCPGq/OW0SznCKFbPaF4R9rZgGov7OpvWPSGX7A9TfJgvzIze2y/zJYCNFyE0WGO0hOiYgOOV5gA41kqQSJpYzR7CS1R5jSsFE+pTSmH/JCixTZIe2Rglk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GV1PR04MB9103.eurprd04.prod.outlook.com (2603:10a6:150:22::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Fri, 23 Dec
 2022 03:05:46 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::e33c:46f9:ef88:8973]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::e33c:46f9:ef88:8973%5]) with mapi id 15.20.5944.013; Fri, 23 Dec 2022
 03:05:46 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ping.bai@nxp.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] dt-bindings: pinctrl: imx8m: Integrate duplicated i.MX 8M schemas
Date:   Fri, 23 Dec 2022 11:07:08 +0800
Message-Id: <20221223030708.91459-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:54::17) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|GV1PR04MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: 147245ae-2d2a-4a40-8e00-08dae4929616
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SdLUJs4SNo+ur71OuQ/+ad0XQoEuHD4BeSQNYNWmbNfsLt1stEQ6xzi3KzYMUrP3a7mGrh1swzoWy+/p0cqTN7kVZtStbSWvNnSBTtD2FSkgQlQnB9PeQKBrqLOCe21SkNNzb9GfVlMZNsA8BUtH7oYDJ9dEpVNzvCPiL7YK9mL47zzn299KwHEaUGn7WxQ1PnrHvWWRZYrQGwwEIfDApzBoRBDBcA/oWyBRNdSAUBmoDXBahgGbTnsIzGfSxdeiwOMO2vGsJHrFmfhs2dfBku2ZDWggc1vMCvRTAJkh+GiPXd5sdjer0d3qS3OfrYeSMtoDyrfHU46bP4twPvaszYUCvDI3gHp+TEA3a/U4c5Z+ApVKaEt4ws70VCIJIFKmUnKAWX8Ev3RYYlBA+wogyicIzICrnC1Wa3r9vsAHF8kXDO+RV6Vz6jTwstrhDVl+CAtesYdyKvWvAf6a/fm7EWmb9Qo4odpgBlJf1phufOJXo7G4h1oB462eGsHdcwFMHMXFblseshmiRr8BVAMOY2rmFQwgex9TnYHAys6mUxF7fq2DbKezA3htVz6uK8qu0AG0+cMEs2FsFZpcrcluyusi+PKQcbBYI+RgWJv7wGb4BzEDoJXpIqk2vgB26FIJ7xetfIEjApO+/xpOERS/an30rm4hDzGWMlw9+oRkEYJFQstzTfvy8eD42hIArVClOR9OeL6vd4QeBMbmlp0BMwPZ/IeRmqXpSw/9O+xcJPRzuru6OcgQ6b0hlE3Ckmz0t4B3DZeZMFS1JbsZ5u3ZoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(186003)(8676002)(7416002)(6512007)(66556008)(66476007)(5660300002)(38350700002)(4326008)(66946007)(6506007)(6666004)(52116002)(8936002)(38100700002)(83380400001)(86362001)(316002)(1076003)(2906002)(2616005)(30864003)(41300700001)(26005)(478600001)(6486002)(966005)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZPi5YUboyMhyaTb8pQbywv2r6niRBrxoFyMI8DYKBdiosoSWyChec5A/Z3WM?=
 =?us-ascii?Q?FvyxU34/jWMca7V6CSRuFUv0aNmUCHA9n+8+EdINi8ou5QIw41JbnzaTFrHd?=
 =?us-ascii?Q?QLsl8gtrONkHKxDcK1geGJoYhz+JcLDhRCnVjvTpyLO+LISRF5Gs8atCjAov?=
 =?us-ascii?Q?gpe2/7xDwjVGU9dzGsgXmr+ew+eaEnurFdS+UUnsYapTHFDeiWzWe+kEhyiL?=
 =?us-ascii?Q?7sOWgsN8TxOq+zY5XJNbVgnd3NgWKl6gQ1u09YwE7paqaMi4mUqeYS6IXbJ7?=
 =?us-ascii?Q?bhfjLTl/b93JhHUE7NuigcyhtS/drtUlNzeRikZv2of6MwivPMAoozBGGpiV?=
 =?us-ascii?Q?1CFzy3zZml9VWGEGJTGhZSmM3rmZuq4vtyasYTNOfAuqpmAIRImKJ+oHK3vL?=
 =?us-ascii?Q?/6HBO6ljXjxeM2msiHxZzHbbweyb81NPtV/pNrWMMPel8DayBt5qC/72t9V8?=
 =?us-ascii?Q?BR7DfuT7tcHZK/X4lBCv0fxH/+Q85Reouon/FdYF/t2nDIPGdCKY8wASNjEq?=
 =?us-ascii?Q?MlHmfAYNl/up0UBuFUTYEbpKBtCt1f+2lqRB44PihWJ/yLa2hpQkuiYUMbbH?=
 =?us-ascii?Q?7WTRAeIIcosYMhXge7c/nCVu1/7f6PZqc2tML6Lok2Taa/OOspsqJ3H56jRt?=
 =?us-ascii?Q?MmOPcPi9KJjSD9cchuoLE1xjSqon7ZA+aFAw+eirEkVUWK03VmtMoefYenV/?=
 =?us-ascii?Q?MSAafsRxWYslRM4MUPRfLIxAmmvUeavYjfOoFrBxcCXY0F7RxFCL6BgMT0YS?=
 =?us-ascii?Q?TYVfQPnYTdTp7kztzn1q5ML90Kfgi2sJbdCFMvMqzinROvXNRFSxyRFyVsIA?=
 =?us-ascii?Q?YpU9Tz4OG83Sph1RhfsLl/LI7o1/SULuM5CkqcAZpg6cYQFlc8s9KyMnzIeU?=
 =?us-ascii?Q?CVJ4+ciRYuwfe9Dt6//bauBucNQKPopTPOVkyceJkliY0WIwCLLU5UqqSOm2?=
 =?us-ascii?Q?sl4p791VnlfYKsyVpwsG5ztaEMMqoUwx5tjdFJxEf7ajHWRzVpbam4NcD5eb?=
 =?us-ascii?Q?CF8nJh2ICfWTtpsiz+ssp9RcFfB0xTy7lT7p6v//8lmINCA4rBtRGfEPo50a?=
 =?us-ascii?Q?EcJSfVjpcE/9ssQTGTzvNWw/l37yhcRbduwq8ubWK8sdyE22r4kQ06MrDXjC?=
 =?us-ascii?Q?b+E4BD5II9tFRaQv/DC9m3EOj+jzlwfNTIMr1A5Nm7ts/UuKveHUQ/uTKdCZ?=
 =?us-ascii?Q?C1BLNiGkVJ2O85xsileIWDszqLOfxq9qXSrNZqq94csm607ThpfQ6KttiiFS?=
 =?us-ascii?Q?M0zzGXz043HoPQXpoTqWNwSdvrf/gcpKjkrjIxS64dnF+mbF1ZnRiOh47ffG?=
 =?us-ascii?Q?BwRELwpZIkZoqQs7DlWjthlrG8vWAlkHyg3wwrYeutvO3hJTAXjymaNqOwG7?=
 =?us-ascii?Q?/Wzv5jLcWvkJNJ2Cd589rfAQ9LV4CylPgDfCaAAywHMd6m2igN586yJ/gWhi?=
 =?us-ascii?Q?cHBw2o54I7ksrMEI0NYXdvZIhP94zvg50iEXjycgUgSkJnhAplfizUpeO+0K?=
 =?us-ascii?Q?7oKI2pUPjBd8hTKtfYOikb3C0RXChFoR2GZcbV2rUDT8UlaAXxEjKmUMpA+V?=
 =?us-ascii?Q?0Pm21QWmdhqkN8U/BpfaMKpmKUVt9ZNXhl+k+m8z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147245ae-2d2a-4a40-8e00-08dae4929616
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2022 03:05:46.3733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PspXIr1iYs3g5/uW+xR4y5mX2BKVZZZLh0BLs32XIgnKjXjdGKNpxjJU9x/9sEpAHQkwOhYz/QykLWVz7Ps6kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9103
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The i.MX8MM/N/P/Q IOMUXC schemas are basically the same, it does not to
have four schemas for almost the same binding.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 ...mm-pinctrl.yaml => fsl,imx8m-pinctrl.yaml} | 16 ++--
 .../bindings/pinctrl/fsl,imx8mn-pinctrl.yaml  | 84 -------------------
 .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml  | 84 -------------------
 .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml  | 84 -------------------
 4 files changed, 10 insertions(+), 258 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{fsl,imx8mm-pinctrl.yaml => fsl,imx8m-pinctrl.yaml} (82%)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
index 6717f163390b..949d962a97b4 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mm-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Freescale IMX8MM IOMUX Controller
+title: Freescale IMX8M IOMUX Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Peng Fan <peng.fan@nxp.com>
 
 description:
   Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    const: fsl,imx8mm-iomuxc
+    enum:
+      - fsl,imx8mm-iomuxc
+      - fsl,imx8mn-iomuxc
+      - fsl,imx8mp-iomuxc
+      - fsl,imx8mq-iomuxc
 
   reg:
     maxItems: 1
@@ -34,9 +38,9 @@ patternProperties:
           each entry consists of 6 integers and represents the mux and config
           setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
           mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
-          be found in <arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h>. The last
+          be found in <arch/arm64/boot/dts/freescale/imx8m[m,n,p,q]-pinfunc.h>. The last
           integer CONFIG is the pad setting value like pull-up on this pin. Please
-          refer to i.MX8M Mini Reference Manual for detailed CONFIG settings.
+          refer to i.MX8M Quad/Mini/Nano/Plus  Reference Manual for detailed CONFIG settings.
         $ref: /schemas/types.yaml#/definitions/uint32-matrix
         items:
           items:
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
deleted file mode 100644
index b1cdbb56d4e4..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
+++ /dev/null
@@ -1,84 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mn-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale IMX8MN IOMUX Controller
-
-maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
-
-description:
-  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
-  for common binding part and usage.
-
-properties:
-  compatible:
-    const: fsl,imx8mn-iomuxc
-
-  reg:
-    maxItems: 1
-
-# Client device subnode's properties
-patternProperties:
-  'grp$':
-    type: object
-    description:
-      Pinctrl node's client devices use subnodes for desired pin configuration.
-      Client device subnodes use below standard properties.
-
-    properties:
-      fsl,pins:
-        description:
-          each entry consists of 6 integers and represents the mux and config
-          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
-          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
-          be found in <arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h>. The last
-          integer CONFIG is the pad setting value like pull-up on this pin. Please
-          refer to i.MX8M Nano Reference Manual for detailed CONFIG settings.
-        $ref: /schemas/types.yaml#/definitions/uint32-matrix
-        items:
-          items:
-            - description: |
-                "mux_reg" indicates the offset of mux register.
-            - description: |
-                "conf_reg" indicates the offset of pad configuration register.
-            - description: |
-                "input_reg" indicates the offset of select input register.
-            - description: |
-                "mux_val" indicates the mux value to be applied.
-            - description: |
-                "input_val" indicates the select input value to be applied.
-            - description: |
-                "pad_setting" indicates the pad configuration value to be applied.
-
-    required:
-      - fsl,pins
-
-    additionalProperties: false
-
-allOf:
-  - $ref: "pinctrl.yaml#"
-
-required:
-  - compatible
-  - reg
-
-additionalProperties: false
-
-examples:
-  # Pinmux controller node
-  - |
-    iomuxc: pinctrl@30330000 {
-        compatible = "fsl,imx8mn-iomuxc";
-        reg = <0x30330000 0x10000>;
-
-        pinctrl_uart2: uart2grp {
-            fsl,pins =
-                <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
-                <0x240 0x4A8 0x000 0x0 0x0	0x140>;
-        };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
deleted file mode 100644
index 4eed3a4e153a..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
+++ /dev/null
@@ -1,84 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mp-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale IMX8MP IOMUX Controller
-
-maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
-
-description:
-  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
-  for common binding part and usage.
-
-properties:
-  compatible:
-    const: fsl,imx8mp-iomuxc
-
-  reg:
-    maxItems: 1
-
-# Client device subnode's properties
-patternProperties:
-  'grp$':
-    type: object
-    description:
-      Pinctrl node's client devices use subnodes for desired pin configuration.
-      Client device subnodes use below standard properties.
-
-    properties:
-      fsl,pins:
-        description:
-          each entry consists of 6 integers and represents the mux and config
-          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
-          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
-          be found in <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last
-          integer CONFIG is the pad setting value like pull-up on this pin. Please
-          refer to i.MX8M Plus Reference Manual for detailed CONFIG settings.
-        $ref: /schemas/types.yaml#/definitions/uint32-matrix
-        items:
-          items:
-            - description: |
-                "mux_reg" indicates the offset of mux register.
-            - description: |
-                "conf_reg" indicates the offset of pad configuration register.
-            - description: |
-                "input_reg" indicates the offset of select input register.
-            - description: |
-                "mux_val" indicates the mux value to be applied.
-            - description: |
-                "input_val" indicates the select input value to be applied.
-            - description: |
-                "pad_setting" indicates the pad configuration value to be applied.
-
-    required:
-      - fsl,pins
-
-    additionalProperties: false
-
-allOf:
-  - $ref: "pinctrl.yaml#"
-
-required:
-  - compatible
-  - reg
-
-additionalProperties: false
-
-examples:
-  # Pinmux controller node
-  - |
-    iomuxc: pinctrl@30330000 {
-        compatible = "fsl,imx8mp-iomuxc";
-        reg = <0x30330000 0x10000>;
-
-        pinctrl_uart2: uart2grp {
-            fsl,pins =
-                <0x228 0x488 0x5F0 0x0 0x6	0x49>,
-                <0x228 0x488 0x000 0x0 0x0	0x49>;
-        };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
deleted file mode 100644
index d4a8ea5551a5..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
+++ /dev/null
@@ -1,84 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mq-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale IMX8MQ IOMUX Controller
-
-maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
-
-description:
-  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
-  for common binding part and usage.
-
-properties:
-  compatible:
-    const: fsl,imx8mq-iomuxc
-
-  reg:
-    maxItems: 1
-
-# Client device subnode's properties
-patternProperties:
-  'grp$':
-    type: object
-    description:
-      Pinctrl node's client devices use subnodes for desired pin configuration.
-      Client device subnodes use below standard properties.
-
-    properties:
-      fsl,pins:
-        description:
-          each entry consists of 6 integers and represents the mux and config
-          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
-          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
-          be found in <arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h>. The last
-          integer CONFIG is the pad setting value like pull-up on this pin. Please
-          refer to i.MX8M Quad Reference Manual for detailed CONFIG settings.
-        $ref: /schemas/types.yaml#/definitions/uint32-matrix
-        items:
-          items:
-            - description: |
-                "mux_reg" indicates the offset of mux register.
-            - description: |
-                "conf_reg" indicates the offset of pad configuration register.
-            - description: |
-                "input_reg" indicates the offset of select input register.
-            - description: |
-                "mux_val" indicates the mux value to be applied.
-            - description: |
-                "input_val" indicates the select input value to be applied.
-            - description: |
-                "pad_setting" indicates the pad configuration value to be applied.
-
-    required:
-      - fsl,pins
-
-    additionalProperties: false
-
-allOf:
-  - $ref: "pinctrl.yaml#"
-
-required:
-  - compatible
-  - reg
-
-additionalProperties: false
-
-examples:
-  # Pinmux controller node
-  - |
-    iomuxc: pinctrl@30330000 {
-        compatible = "fsl,imx8mq-iomuxc";
-        reg = <0x30330000 0x10000>;
-
-        pinctrl_uart1: uart1grp {
-            fsl,pins =
-                <0x234 0x49C 0x4F4 0x0 0x0	0x49>,
-                <0x238 0x4A0 0x4F4 0x0 0x0	0x49>;
-        };
-    };
-
-...
-- 
2.37.1

