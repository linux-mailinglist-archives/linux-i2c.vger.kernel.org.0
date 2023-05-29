Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7590F7145A1
	for <lists+linux-i2c@lfdr.de>; Mon, 29 May 2023 09:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbjE2HkN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 May 2023 03:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjE2HkL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 May 2023 03:40:11 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2085.outbound.protection.outlook.com [40.107.8.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7841DA7;
        Mon, 29 May 2023 00:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHxeE3in/0ZdcADZpuAHsyBCQdUE0jnt2bI1zrtp6F6sll7xhe9TZiWz+JzOHwUVN8Nayiwdgx55RG219zP7RHZf7gCf1Hnrz1Py4qTq4nU1pjAb9HBNX0KTiYNbYehog4gUUq4/Gdb+/EQ4HsmBF7g3Z5OB9SZ7O7ZFlkTe2ob6oAxU8m4VcpjX+jx26XsD4mDWcxd3YBPlacoA4coDwaiQq5fujpaN0brhDpH96P6K963zuqVIoZb2e1pVxQi1e/fD+XmbpD9im6ZAbPl4Hysfovo7jRCiLM1Ym2lhiFzI2rXJ5bHJwGPXO4wmQbjQR8nrbg/12IFs3D7owtxM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLk+GUIkzeVJXVq8rnKbj0iMWrSmyUeZc5B/onQBpLE=;
 b=ZOnupbhBwYtYwEC9CMHDFmJ2s3VDIgpnGz82fk6N1YW8o8k2GaDF2zt1rizgs4TWsmh4buXye97YeCRtnRJ95/ZN5/w5Jj233buQiCVjEA6VZNpuygo/LIqEuWtVPj7Z7AY0SRvbmkhvsU8omXsZXlAYb9SCBWa4BeBDALqec8hxtBrR7iRzGzWtR1WEHtHy+YbZ1ZOPOK3JSVIgKKu8RJuhhJFkGq/bAmIBEJak+b0cnj/Vb/8aS4rl5fTYRDh10LbO0bdEpBn2Kc01ptmA9Zfr/JruFih9fs7uKfq1OlEF9XoTF9sKmrA3QON0k4lNwv2PDZgXYRfO8lBTgNwMQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLk+GUIkzeVJXVq8rnKbj0iMWrSmyUeZc5B/onQBpLE=;
 b=ATTxWWA68JKsz2D6twO+ifiw5dI8QwFXnrH7ZSrtr2JiL9/cre7QTfRzQZ1P0o4s5dAJRh1vgcEozurVvK9Mt0FuTRuTMxqjfl7mVF+nGmatH1PFSpH8eJtcvH/KJJq2W5e5jqL3dQOD/wZ95eBprEjjlj2q1S3SQObrn48XjOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 07:40:07 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 07:40:07 +0000
From:   carlos.song@nxp.com
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Anson.Huang@nxp.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus recovery example
Date:   Mon, 29 May 2023 15:43:02 +0800
Message-Id: <20230529074302.3612294-2-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529074302.3612294-1-carlos.song@nxp.com>
References: <20230529074302.3612294-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:3:18::18) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|GV1PR04MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 34789fbc-3b44-4f1e-2022-08db6017ec76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ngEXZLGLjBSHrpPxUuQF3AMmtTt56opSX+OJwzfJQCiWrAzttJFvGvjgvTnj5Vuaxiq478KERTRct4ZhUnQjERUhY9aozcQjE/CGDxgvG3n2weJgjhMSHuhhYA8vIYeGf/sJhAtKDvL/Bc/Zg0KLmtx4Y6PzIkEKNV+RJE8BuEuNVMlFBHfUzirGUcqHDtxTFO5YOQp9oK4s9yDKnustB5bxxQc0V9ef5FFO3uvrVRe4m8ifLrH9pD/V95QONEckfaofif3UGJpERzVqfduypYPW32fGxsUCy6CaVp70Elcs3mTPfE8cbDnquO1/f6GGThWvmL3PuwrB5CNPkIHmraTu5xyWi51OYFP/p9WA9WzOjwwir/7LrgyC3+uGYrOxDfNfOAdJl8hY1Ciu9fqP3hIDfcPPNv8DJIyVKFbGP1fHWyRtW6pJQ7LNwdyvlZYV+OHd+5LgHMV02ytCqWEcY0URjubvNDhBwiz1/drc/Ukvfm+KgDsFegaBTK+SSLMmDrCpfDSreMZn1gJW2bT86RI8roJtUamh0sEaeYdADNJ5olqM0UMpCevgIr9RZzLJvtnX676EOWIsihdPXSpOwK/WKYRo6zYIazDOJgc0BKvZ0snmBOV5cS54PIzRVHs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(186003)(1076003)(6506007)(6512007)(26005)(9686003)(38350700002)(38100700002)(41300700001)(2616005)(83380400001)(6666004)(6486002)(52116002)(478600001)(66946007)(66476007)(66556008)(4326008)(316002)(7416002)(5660300002)(2906002)(86362001)(8676002)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vd6/AmDxqfu54KI11qBuwTxVvwR+cheSlK4c+SUpD4dVz51ERBqmsocZfac4?=
 =?us-ascii?Q?3OzZbdz5sjUwXIE1qxAavYv1uP7Uz+DV1g4acEhWRCNY+XuXn2CyHGts23j2?=
 =?us-ascii?Q?c6l0FyKHwUi89M2mGaT0nfvKqfTC91NPAXsDKZicPp27BVuw3rl+LjCYYGfa?=
 =?us-ascii?Q?YkF6almRBAh4fOCimAe4bNgR2+lT5DO3a5HcM7afYR9cvvzcUzeVVNpxQSoi?=
 =?us-ascii?Q?ztmw+gNXk/YFmvrM/8MFOxew3FSc5OpFz33zYwVms3OhoVEgc/MZ62ga0N9o?=
 =?us-ascii?Q?qQDkI8Mowo+YFBnlcCz1lG1R8s/nLPDVS5THZgR7sP9o2+Tv80H72oaH6vxh?=
 =?us-ascii?Q?63NyzdT5OnQxvkv/REb/zLZcS21FPs6QI/OAVFgbj206n5+tTNeq7QjvJ3k9?=
 =?us-ascii?Q?bu388WYAHyQafTfyA+PgZm/KtiiP4uNOTUjHF2e8LRN9Qu5/STkvPE8EdXbF?=
 =?us-ascii?Q?RthMFzGlvRhWC1ryAcz0qsjXcpupD9mtuSKxP8YR0ypZ2ucoZ6Znu3b9u3cW?=
 =?us-ascii?Q?Vfoy32y9iMj6z9CwPlQ38jVampPuzd+T+8zvTedmy/qFlBLh5WJDwIt/YKLM?=
 =?us-ascii?Q?F4oihjwDfERG6lgqt5CYZbyUshDiFt6INC6jVfdJCE8W2qmxhHM1UWnuTc74?=
 =?us-ascii?Q?hj9IoNQy5PitZOP5MFWhF2HNWCnZqlw6DjCf8bTmPeiZbV4MONo26+O+4giq?=
 =?us-ascii?Q?VOhaUpfPHJz/seWAmKJ4U6sPu1grrAjZzmGWW26/L+JKZg7NHDI++0HzIs5J?=
 =?us-ascii?Q?FmIETHzKhhYFxHOmC2XQl1v8bMMVreIH953lCqtEe0eQ92tw9eGL0KmVSuUW?=
 =?us-ascii?Q?THYms8K+21jtZ2Tz6qJoNfsolZn4b9XxMnC8ceAtypM4gUAKEvVL5c+txrAV?=
 =?us-ascii?Q?f8pEKPEL0uxzMrm0X9884FpiLwTfdwWPVvJ3m7a3jaoIpdJfw2s3snLIOXk2?=
 =?us-ascii?Q?MeX8TZqRV9Jw2uIlba4WtT1asQWYENgeJGuCklrPtWsm+LNa6r9zEYKvQBQc?=
 =?us-ascii?Q?mvbd0nPihShAcGui3aisFq9p34zYPCe292/ePC6adrjVKajzffBsDhOLb19n?=
 =?us-ascii?Q?MaSjqF9VA6rJr0c68foCR+fnxlToletxU/Ib8Rd2ao3hNALZ1KnjR4aWlqD6?=
 =?us-ascii?Q?NkAYQBwEh65nJ3eO5ENwQpWhgr0ncj0UF2ahSYjGxR0Quk6Ba6NpTLHlNo7I?=
 =?us-ascii?Q?iiJYIZIfYjPVOfvfSWnhot/HfnvRweuopxSFK0sPHu/3tTixDltIeiedWojn?=
 =?us-ascii?Q?pZDJxmbyNAyB5WONhVPKYqRBQFjSg5XFlXz0dRhlDfzk7sAPmmva34bX/KAQ?=
 =?us-ascii?Q?vVkWypc5RcpW8nREBLW4c/ow9+il60+mxBx6vEfmU39fZygG2L/h8fw8H07Q?=
 =?us-ascii?Q?ld4Qf0NsuwibtSrd0DGaQFcVZZ5hxxzse0F/BT2m9NTmU2T4jC4JjS4mJMEg?=
 =?us-ascii?Q?TiSh4P1cMltFwj4SIYPZJ9f+HYn1S1SjsdJKMfHar4MDgAXJB/x29FbpzDN/?=
 =?us-ascii?Q?8bxljXjZqH9Fwrt0wSXi0XbMKlBbW6ogyrXi/aizO86sOV1T3HJvDkzCkXmH?=
 =?us-ascii?Q?Bk91WDpPb1GHIXb8OgZBmGsb5Nxr+uWNGKYHAgSq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34789fbc-3b44-4f1e-2022-08db6017ec76
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 07:40:07.2915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZB+shUMGykkj3XhHe9hHTPHwNg+fSJ1UhbLC7NZSbDwgam4d2nxGjMS++yLOtW7Ul3hK6fJFSbLg7xFtZSqLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Clark Wang <xiaoning.wang@nxp.com>

Add i2c bus recovery configuration example.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 4656f5112b84..62ee457496e4 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -58,6 +58,16 @@ properties:
   power-domains:
     maxItems: 1
 
+  pinctrl-names:
+    minItems: 1
+    maxItems: 3
+
+  scl-gpios:
+    maxItems: 1
+
+  sda-gpios:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -70,6 +80,7 @@ examples:
   - |
     #include <dt-bindings/clock/imx7ulp-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/gpio/gpio.h>
 
     i2c@40a50000 {
         compatible = "fsl,imx7ulp-lpi2c";
@@ -78,4 +89,9 @@ examples:
         interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX7ULP_CLK_LPI2C7>,
                  <&clks IMX7ULP_CLK_NIC1_BUS_DIV>;
+        pinctrl-names = "default","gpio";
+        pinctrl-0 = <&pinctrl_i2c>;
+        pinctrl-1 = <&pinctrl_i2c_recovery>;
+        scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+        sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
     };
-- 
2.34.1

