Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C2F44E331
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234760AbhKLIeQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:34:16 -0500
Received: from mail-eopbgr80088.outbound.protection.outlook.com ([40.107.8.88]:36352
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234732AbhKLIeH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:34:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bieNhLrp70l7usQ2HcabSfSTcr5sF4TKWLbcGQ203NpKtnORI0DU/yyztdUrMl4dvi+aIK5fiwSquK6/E2UzULR+8K2pct+gtF42B/ncqi7zJ/sy4fU3pYZXFdLcFI8kG18Mu3AhVVd5ZkNSQrlzLs/YgCyE55LgjHNF9YPivLxvCeY80dzmz3TCizpbvg9VQlIADuVldDnC8aDRBn2QvCqlFohQX9wCJTnEbz90NzlYzNolY5ci0C95ttMlQos2B6C4siIX2m9rCO27+8FbXRMKKdyL6pbynKiZyJv/ANzt6zCj4Pu972RbLtYzLjZmYRmT/qPJF2YFR3sBxvEE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHFM8b+4roqQILCSLpRhGgS83Tk1fE0UPv47XHnsgiw=;
 b=eqmJcg2T1Wf7XpRPqgQXhKcOdhmdZhmkV0rnH32Iat9m0TdQ6uVo29pEBGBDW5kS+Q7Or43GpQCLaubxJBeTKb1YZuwqTRle+zg5AO+hQrH5wyG3lK4mxKdt6EWAUgAPDP/L3yG74KNZICtWQcaifahlGWa34YjSGf8lAo5FFMzimckz7NPMQu8EdeMcRZVjvZskt2aa+8GdsJ2mr6A1Lvk4ChJpkVaRPA3ePHKAMklzucsjn605R5MwXugYXIoAxm7jp9Ineupe78QwY7t7V9olFJXLmQT8FaHw/cX93zmQD/SDfwWWOGysZ+RrkxYE99yvqrmUXUAFHY78bpkZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHFM8b+4roqQILCSLpRhGgS83Tk1fE0UPv47XHnsgiw=;
 b=VkHp7TCqvbBCX1vWJLmI9WiNssTapRh90iuk8AcqA5CJcG2r0q22oxjcyUuntL8oRhN7FPoNF0jG1Gl/cZo7GCLGUtwjofzjPz4EGp+4A9YcOiYYxrmL+fwN0/zpREEGn5jRibGcdgkJ2KotcXndF/IsC2QWjBSeS9hmoBwKzf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:31:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:31:09 +0000
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
Subject: [PATCH V4 7/9] dt-bindings: arm: fsl: Add binding for imx8ulp evk
Date:   Fri, 12 Nov 2021 16:29:28 +0800
Message-Id: <20211112082930.3809351-8-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:31:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7a39d73-ba10-426c-f48e-08d9a5b6c759
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8493D722732C1611C7177388C9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QEZmI6LEEbJ1krfWOoAD6Cmp+moyp+upWMKKZSZ6mpcLacy9U+T4wdH+Q8/QV1rG83mx25oI4pnCPe8mUyQbfsqzCMYsLVUlH0Of1IM49ETJ1qJfoaOAXHsNsvHs9+XA/o5O3deGcERkK90kDnDIWLhloIj6WH2EBK/uJHOLq/+f/q0zCV144b8QCgfaI6JHJM6TwI0S93UrFqv9i+xgzWIWZV/HGTbBKpGTWlZGrZpnYTlrmD4eMYbV9lyZnVjmH8oqQRr04a5Eu/zD6SQpYAk6g9Nbyz7ysxgGb89+8IzEjkZShoLbadSV1u7lwXo83gwLbucxpCang4SvlwxINK++h7+AFS0BIqIB5REZydl3SZFSDJ0DzPpTyCUgc/Zpj8It8svqk4XMC6kW/i4MsPwQs5vMGjlIyR21QW2DpJokTDbZcmepXbR4N7dPozS/N/am7JKkGzdKZDk4bCfA5qiXUth6L+Gpv4D7sMJUktV+j+1XE3PP/OcrMIFzUCXpswC8gbB2lPX7/umsGJTV2wELzgy9p/+hucPXtc6FSLx258wsdf3PO1RRlJofGGvo16hyC/+AOsdoiAFQ+As7MnZmR/FksbMKb1DzwkE51+QCccTyGtiqEXW6AXz8I9fkI4+r1zaXzV2C90tEc+6npb3DpUIwvgx9zorEQPlJOs0tXLMumkhbURq34ZkZkZQWTGWkL4oVXBinoSdk7NUDXAxvat8DIZn95/Rx3AusGJk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(54906003)(6486002)(2906002)(316002)(6512007)(4326008)(5660300002)(6666004)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H1ljys82CJPOqVKtWaSZZZZjUuUKljZMBgzyBEILld7mR6J1DQrYDLcJp3Ov?=
 =?us-ascii?Q?ngP40W84RHPsVwizkg9LFDPGu+8mIGjAUF8CGyHcpEhjWjgz1+iEkD5eY7oe?=
 =?us-ascii?Q?68LvWVdTEyFHsi+oJe/ssdBBNvKuRWizP9TeLHIydUKYXsEbJSNV5vdq1tJz?=
 =?us-ascii?Q?qvg29r8puCh/bm+aZ2As958gfEO219Z0LygCvwpY8ufsyWdh0juXvKm+z8FX?=
 =?us-ascii?Q?FkVRa3C3IH6arCvwIUPOg7Ce/kSCGf2nOoysJej8hJv8qcg5TTV4ttfwEMeH?=
 =?us-ascii?Q?e5NKWC3HtIJ18pnsexb5conPJQZfKH2yeXy5p8HtegG1RY9LTETfn9N9dmOs?=
 =?us-ascii?Q?NldWlEMzhajTiT/YzFXmRLYKZx+C/eFcYKX/RMwBx/J5UDMfZfGuAQC4DmKe?=
 =?us-ascii?Q?pz1o2bNu0tgMnzZBNJ9apQVjtNvQzfFWVvJJko5ihoNwA98iYt2Bmp9YLhoN?=
 =?us-ascii?Q?auFo7QYQ7J8+1A5RaX6JusErCKosC8mItJQM1/ZJOokCMRO0Fw+W0x//C9ny?=
 =?us-ascii?Q?pU1zvaH7Vxu0kwbaTrKq+gjig5kUhHvj0QUuac/lm0PIZnBOsR5i1B/k2Mt7?=
 =?us-ascii?Q?jlC+l0LQdPe4q/I+nNgkUKFWHpcaO7iFGKkyPpBRiaVa9eGHzm7XwDmevi7U?=
 =?us-ascii?Q?/bJc9J+xoQRDQqOzr+5/BKexpSqUT8jwfiv2rwm3cO4f0tIKHNE0QV4F8PcE?=
 =?us-ascii?Q?8Oo4JqYOLhjNElgiTHzq3sWwRVyI6aIDSYQSkOl/Wwc/HK7Fdc0tPEM6OwzS?=
 =?us-ascii?Q?E4HVMevewFn94qaxO3StezCInVAvnRuxIMJhlPiwG4FA0dXTOALwy35wEMNx?=
 =?us-ascii?Q?Lp10XL5885latvzvH/FQzyD8ItNiSYlzomLMpmKeakuWztjeIVTeQ5TSJy3k?=
 =?us-ascii?Q?Jpyt5rQH5fNx8LCrEvmNs7xgjLtHCIffzYPA5m6tZzgw6IdP9woj1bZSKinD?=
 =?us-ascii?Q?iQ6GOwjEHXjRGuwO4v4hceheYwl3oMzMxw+pHxqP0irBO3b7o1cdkVXk+3QS?=
 =?us-ascii?Q?Roqx+I3MgcHw7Zu8MHbZQs9debujpycTLMOQoOCwvyFXGCta+8+1FGtnHhbV?=
 =?us-ascii?Q?QCMTTDxsgaUcJCF830I2Fjcy0F4iEjAi4XrA40N3TpGEDhywdYl/Dt6QXxzv?=
 =?us-ascii?Q?/mt716C9V32JXyMrM6O3hlLzA5KDSa4mUyaQv0wupf1DSF/MNA3DxmRlVGWr?=
 =?us-ascii?Q?sXzyUE4tGk1D6PfrdAMoKmIS0Lg1N4a1M4AKJGgE4HNM1hsaC8LXTDhhs/jz?=
 =?us-ascii?Q?Ctxi8Pr2U/PtpvHFxXpaSbFo2Ml046Sc36hcf2iFigDrWVM+CKpKjwpdYyEj?=
 =?us-ascii?Q?dm8hljhpOlJxnJ+XjbYFpaYey+F4KPalXVW0dOKd6Y2iZW1XMVR54hvgiQnO?=
 =?us-ascii?Q?kCTypot3DALmOFFOApsY+cPZknXKDxuSiK2IDd2MRQKTQK5/XDf+VkN7w6aE?=
 =?us-ascii?Q?YdIonsY4Sr2VABYbWC6HDsL4dZNsIp6rFW0RsaqhE0rKGWPEPNDG7X3DnCw5?=
 =?us-ascii?Q?QTun8PmQhRPTFXFgoTq5BeCjdcnm2AMp7OID1yqJzs884cOeNJcTHctILltY?=
 =?us-ascii?Q?5um6mkTXli2Yv/8AlnR5RtQw1BVuGOkEbyC6SVocodrvbJx9phFN77KD5hFC?=
 =?us-ascii?Q?VzvLqAMfz4vNi33vA3mVrK0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a39d73-ba10-426c-f48e-08d9a5b6c759
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:31:09.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKMcMe04xx6aWqO0KXxe7fysb68rMoOhxFfMJs/PwJEiOm+86oFWJhEVPKf3lh8eQGw57m+WH7j1m8t123NbUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
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

