Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F783355247
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245635AbhDFLdy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:54 -0400
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:22144
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238346AbhDFLdv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHudd42oyUk2lNTxl4MN5Gj/Jw+evsNiGU35uLJrj2d78Plp92ysl+yQ+2hUTJHGYelONilaTzqQ1QdvRAG/JMVVXcPz71g3AeBt4EI4yGbPAmQws4VU4kcuuV4lgioE6i0JlTIGIAHzWRJ7hlj1i62zwEms2+10w8G0MHki4CLeqd9JySRgav5FSh5G0hVgV5fhKXjfRLbdYI5SXw9FJaqHujU6yR5enbWq02LKxwZJ0jdK0Va4raLpNyHGipmc96Y+MMTW0eXiWn84P/CxSnIXY8XO6u5JDbZF6I7G0SgnDvulx25suvyqYVhhnxNCc9x7/vti2zE4fFwjm7AN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2MIbZ3YEqRcZ667TK06dNgpm8V1WHPf/1/2Y4RLyNQ=;
 b=OChVg7Nq/5I3P9AP7X2H8gqXteknN0C1wHuwX9xy2qDbKcsER6sG/vu7zn2SCbIHBHuOYaWOiRDCrRS5xkseyyHk5TqvqbIV01FElw8Byne7tECf6DFRKhLiWoJZYRkDHaqWr5FJqugQMEjZEvVQucBPRG11EJQwTOypc+V5DYBUuKWJ4qSeokgMo5WWyrQ7SBJccs3CAg+UGFLW/RfXInfdFYGyiVUmSK2rGE5QK1LWfz/U3rfJUdAk5LPscflOBKN6MgJ3qOD/vPhs4z8vRIxWbQBNw7jrluBf+pW7fQWKeskyXTvtCosBfT2Fo103piNLTyHeQwSAFCi1K0LEdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2MIbZ3YEqRcZ667TK06dNgpm8V1WHPf/1/2Y4RLyNQ=;
 b=UrDKVgo7tUq1nfuryzblmkWCypVNWZ7+F5z+6B4vP2E8/nWg/fLU/oxkVPLwVE4HQ0/4bIBDYOwsk1POeRocaE9HpcxRO+TQ/Y7LCAOqbDChw+g31DDCblFTcs+054Y6AwNkzUyfFO5lK1ajdJ8ja+LWqcXpyc3rp2r3YSoIcNk=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:36 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:36 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 11/18] dt-bindings: i2c: imx-lpi2c: Add bus recovery example
Date:   Tue,  6 Apr 2021 19:32:59 +0800
Message-Id: <20210406113306.2633595-12-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb674880-827f-4227-5de5-08d8f8efd13b
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7142BBDB9774AFE1E7186D67F3769@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwQ9h6pd7ZOFCubcekgCnyVV+aTwUT8i8ZaMJdTeVzab6R1Ko0FdeYN/8KUjdn7ECsvR6Cr7yEfnTJBPaWjZ8vqxR4xB/kWXFfORXT5zee8bMeeCwo2BrlW6gN7jrXBSTyIAV439vCX4esyp4pTGKix0mP+0FjZpulu2eZYr2h560JNvwY2Z7IAjgddsGWJXfXI0ojKLg9HJzd+YzGtWhLdJhRc0XyFLtAQbf2VIk39Cy7hsaQTzyx5LenK6NCD3Saj8KgRzZ6fICSXSfcfjw7CZjNgHoPJtjbiXlzpT5S5jd+ecA9FzGgscEQqOyarxDqD4AqYaEZetRxCJsukBdX6RhlRM4OzWdGRVzDExI3Glajgsg289wJRQM5OOOYL/jpvNeA0bQNJtto13CmSaDTOum2Ieu0PbJiHC8E4kqNCdqBjHn9VeuTIZzm9FgpIGVjM47Yj01VNSVCaRuCDTmfKqMCzlreyA9m7x93ZhwUrWNRkDdVrQGC4cmdJnFxBz1MORqf66SYvOofoOMY/07AE6mrBiEuarJ+wlzvl9SUm+RohYHbWjlWODUWvXbX1bqsQEK38zrxZQFP1LD9SfRXCAOd3Tu4d4THOrRcUS4pGk9E2x1KvQz7rT1T06fFdWEempuhz0o4c1WDsC2j+MP1MWxZatdbAK++lPdq5gDi04GRzKDSTCxlzI8lQo5bt5rKg3D+eSyNhMCCqhKn3nSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(16526019)(86362001)(36756003)(26005)(66946007)(6486002)(6506007)(2906002)(66556008)(38100700001)(38350700001)(498600001)(69590400012)(8676002)(8936002)(2616005)(83380400001)(956004)(6666004)(5660300002)(1076003)(4326008)(6512007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vQlPcnZ8+LKQBR2Vj7ft7bCkD2HM35xATyuREqn17Glca5Bg3bJLwd6mHNuP?=
 =?us-ascii?Q?YVRdXz1ttLk5xjZWPHmZJt1V8uo8kqinkBtt4VKmInXNJExrVgZIKIKSJTU/?=
 =?us-ascii?Q?EB86l/a2mg1KT7tm8UDOjKE/JbKuuE+tfH4aKYqYZB57cpj2TpwtEBqDB2Fx?=
 =?us-ascii?Q?5xHVMSo80xPrhwBPGxjjo33BYgzUCuaOb3Oijzur+rEZE6RjUSGV1SAXKtwq?=
 =?us-ascii?Q?/mjeXEl8o4g7yZoV9/oZpP6koiDuoCnN27RNmJGzvDtm9qvsr+ryMwt4FF4+?=
 =?us-ascii?Q?jffX231czq3ifbuobasMorqnce437GXqXaFsKZEVqfVRwlyrGbHTzVs6zSUB?=
 =?us-ascii?Q?UbOD9NZmJp/U523M8SCf7H/LkYpTc/wTSELDagoFLTVi0BSqYMd+KdLAK2xs?=
 =?us-ascii?Q?AjoighD5+b5GBAQkr4w65xab6Mi1OIfHii8mPMCtR7dbV08KtckXgdr6n4MW?=
 =?us-ascii?Q?uEZdg3YRcEruV98IrbV/6rgBiXCO6ziam8UG7cayU1EGAQ0Av0OK7mJ0spy4?=
 =?us-ascii?Q?l58fZJo6kRNcO+vl3T3UXIKam8hhdcgDgBsD3rzYENJKGqdtJA1zd0mbVjy3?=
 =?us-ascii?Q?MWTcCs9IY4cxjlW10EIt4InGLg2NxhtKFjwdLiNyr7pVdtGafw3Vy+tfYP4T?=
 =?us-ascii?Q?f2vJTsia3oUbBOeNhh4vfjWqIhQlmA11vXU5ZOMBcqdQgM80rVxoguuTtth0?=
 =?us-ascii?Q?JoszfGX5t0gwaeiPjghYY0CXSv6cMgCZSmFgpmzFZMz7+9NGuKoCkNypKx3V?=
 =?us-ascii?Q?ccOC4rryG+o6N2G4+iSBYBx624+FfygQczmgAoUq59z5V+jHw96+rY/2RG6S?=
 =?us-ascii?Q?tfKiCjDaXoJJN5/esteLk+rt82L5IQRZzJqIJA3isSqu5GYKBVHyQJTYdESJ?=
 =?us-ascii?Q?JHCp6D4rAGZS9GsAcdXN1JIt9oqdSslSVI6QZgGkjVSFaMpeqwCljVZIAmvl?=
 =?us-ascii?Q?Se+HUPrb6xhLbVHmHpdITJHdpwG6ltQlHYKZMXK71Sk/lMHE0ecryO813myf?=
 =?us-ascii?Q?9KqWhpMzqm78QJGn2fPTheih5KT+MQZuRgW549U37aq2IQmvyGJ49o4m5TF2?=
 =?us-ascii?Q?2uShaYzp8Wh0rvxY7OKQKDJgJwdqhYQTAfg+ZxsWBhUbmpRQ3cnvt7q/R+io?=
 =?us-ascii?Q?IBpqAVEB9i227LblziQlTHx8nKq214W/5xwyumpZZyhGngay/BIgLFu9IyVk?=
 =?us-ascii?Q?k8vE+lWzG72xGhcBIuxNFCpewPsXsGw5dTy/Sru4moPc8ICNUjppDnYC+R/W?=
 =?us-ascii?Q?+ttl1yKQu/Yy/IfpG8L1PuGRVCnwdc/xIHmLWkTS2+hK+Xc9RDO2EncD8/OJ?=
 =?us-ascii?Q?lRsKNAZoF0lphuU4GC1sGIqb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb674880-827f-4227-5de5-08d8f8efd13b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:36.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkRXL86STo/RQ8jsJMpI5FPw0AcypmBmQtmsqABqyVfBgPnxZI/bNeJZe85o6oE01I9iP5EuqvIYbx/Pcevpbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c bus recovery configuration example.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 29b9447f3b84..0a4b28827dcc 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -42,6 +42,15 @@ properties:
   power-domains:
     maxItems: 1
 
+  pinctrl-names:
+    minItems: 1
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
@@ -61,4 +70,9 @@ examples:
         interrupt-parent = <&intc>;
         interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX7ULP_CLK_LPI2C7>;
+        pinctrl-names = "default","gpio";
+        pinctrl-0 = <&pinctrl_i2c>;
+        pinctrl-1 = <&pinctrl_i2c_recovery>;
+        scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+        sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
     };
-- 
2.25.1

