Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1A8355252
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238284AbhDFLes (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:34:48 -0400
Received: from mail-vi1eur05on2043.outbound.protection.outlook.com ([40.107.21.43]:5955
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238346AbhDFLeC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:34:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0KPj+GgJ+iPjdccgZ9h1WV8oMXpcY5gyNd8HE2m1+5YlghFDK8uBK0n/+zmhertv8hm5GnCWXxgl4eq31CBkOUGgMOCT3JuE+7biUAs+csycaF/zRlfq79KFKLWGRGLcSq1TgiskQerjSr40znGsk4GrSLgZRx1cayNS6/wAnTNqJZxihxfwS5it8oqUXcWR/ZuXCAjlex7OWOm+ON0JPWWikq1Woi8rf0EnyxDUt17jjBxRr1i1mvHfsJwrF5K9neLC1uR8USQ7wJ3Kr9QfmbZlc9N4mKaAj9LPfHgXttNmLk+c++XZB4pfd1srVSwRepLF3zWEs1Iu0d37WCl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlsQNheMsLfUzZMBi494k56EUF3qzqHcstMOTN168/M=;
 b=DRherDCN6uiIec7+8jI7vD50CLkwx0OK7F2JQah/7DLTHTVjaV+HmmzD8QXJE4ByQgtIrOrcyWn9jJO6EfiY+v+0YbU4+o0j2/s3Gtelv/6UUanBbKea2ryGBQCAVfqTGsqVS9SEQsOygavvIFGnalFbpuzRLZ603LzFHv/rFF2EzbePW8SNeULQ0QsCG+0j73agKLR6GN30UCIXNA4C2ZjIYT53T/pXuYlvex79STNZ/RYMocMJe2RMv3x+ImJZecU9Ab9+7qR6VvIjhEfXVWFjC+1atMzRefdvE9OBF361eonBNGQKNxmHZoqj8P391/jj5GeXHXOVc4B/+jNjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlsQNheMsLfUzZMBi494k56EUF3qzqHcstMOTN168/M=;
 b=BCQf44g7KmEYNq1SnPIKls2AT/gCkg8MjLsm5W2MQs/HYfTUhwRXepX2IaIb2Hw3qcxe2fF2mv+NVTZs0VyObMW1uuqcHFj4J9hQDilEdVR5SlzYKy6SOI/xlwO6ndaxsgXxsGa3VxwtciMAhewLPmXnJ7o4cMGfUN36lf0hRZs=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:51 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:51 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 15/18] dt-bindings: i2c: imx-lpi2c: Add dma configuration example
Date:   Tue,  6 Apr 2021 19:33:03 +0800
Message-Id: <20210406113306.2633595-16-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc5cca9f-2bb0-4535-8bd0-08d8f8efda01
X-MS-TrafficTypeDiagnostic: AS8PR04MB8359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB8359B7F5CD7F5122D4E07A7DF3769@AS8PR04MB8359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jbEUiQJ9Lk3eMw9IyVLpn/Kco4Q0Xi8VHGs+9MlXt+5DroQDQ/2kcQbxOrhP8FBih3OgK6nhf56WSaXJTb8HHblcvPUjZEjv/A8jwZTwq+iCTofZr70ijYnQ3bkBkqDxE7XTFJgRHUtWjrPlc6F0/9NneCAM/hAJqZ/ZQ2q6B8rn8UFWvkbSEZaDZ1UY+6Dc2NTH70XPkeXsX/FXlVb1UGTAMAcOdPWkbufoqN88Sm1wbV8I/MXzuSb2ezAlgtanqMMd4RNfvNUvvOLZNY0YtbCCP2IOvY3MrjOIE4IDMYfSb9BbH97kYlTS+sJPpxjIqZK/tKGMTX0mHqMEN0nCFszOV5uOU2400VDap8cGako1dNtskk0McCTC+OQPokVWIs5FTC69gpKUf30uh/4dFZKBLfsARwYEFx8Hj6LXeUf976PY9GUrV4pklJF6uB/oMIf9R5MHOzJPAanUOhkwOnL1q3XZFIWR4OelSI9OLgU973ft9Dv29SgN6a9zFlihxptny4uRPlLmp8F2SnOdyLoV4Pt+l6KLS+XIEO4Um4hxB9rgs6/uoeab+hXIFmLZLhizV99dTMLxxjU6ypcQXHxSXPtXSoQw1JjE32ysqeVk1ng1bnthzL/3T7RFHoEXYEIqafUpvD8PDrPRKcMaQfzGs43FN1Fbf3yMde6bqleJJEOlv9JJDgkjrWLSZD8gR+nLRJEp0lxUylJhziLtQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(8676002)(16526019)(86362001)(4326008)(8936002)(6506007)(52116002)(26005)(38350700001)(69590400012)(6666004)(186003)(4744005)(2906002)(38100700001)(956004)(2616005)(36756003)(66476007)(6512007)(66946007)(66556008)(1076003)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UQle0m/q1ZHUaFKhmUtXeYgse6KCPFEOjpsZ8KkFGuYUhLKbvdbwA/jBt9Rm?=
 =?us-ascii?Q?y0neQ+udJ4nkynNBmpIjqe6SWFe4oYC1L+fzFDNhP1cRUiTJTyWi798uSCU1?=
 =?us-ascii?Q?83zAyt7/2vJf7RM6+dK5HyxFyVOfv9FI4eUgxT/IoYBCYDfQEiFovfO9JmGd?=
 =?us-ascii?Q?OLP5XSCfRgcUuVl/2Cn1ebuaUFi2g52U4kRpMEHl9nxsopnbvgX6f8wAvF3s?=
 =?us-ascii?Q?WmHy11Z8lolvtnMjkSKDEvD28fQ6FCsFnVtcPZHOJ8Cls/O1ECreVQmkw289?=
 =?us-ascii?Q?x0HiPag34TYpHX0MY7eGf5av/z6Xew3z50Lgsa6KV0E3Ujyte2yg1zxG5Z24?=
 =?us-ascii?Q?Te8K5PGrKDpGISJF3rQrLFBQUCzjpLQ4obSPtLYvNH/hIJtZuHPBDD+/tNrD?=
 =?us-ascii?Q?NwluX1xVVKIKxpdUlvMPlSU7c0JIFugHqKekqC+ODVjU1QjdfA2BsR/9qNAp?=
 =?us-ascii?Q?E6mOdqGkI8E8TJYNOyNX9a1Zx1jBoruP4DPQyKpPp5Yq+ATyRtLn2WRdh25N?=
 =?us-ascii?Q?3OSj3sNdMa2K097NmV+l0aS0h6j3Cb9MZtvuZ9JX7S84czIMIc4eGOJvAdHO?=
 =?us-ascii?Q?+dVHIrB9/nLDp4GytmyOpYzIWt/1KGYqTzjP/F5BeEtrMe9HuQdDJpMAB1RM?=
 =?us-ascii?Q?ISeJPLPxmm/KvX5og49juovEyLB/elXdfxE5Uj/poIeEO6e23GR4D/70qJgu?=
 =?us-ascii?Q?3Vl7OXTZYdkboodpZJZMp1+cv3fQaXMUWewcl2oAC+8b+EpMz0n4Puhrmvj7?=
 =?us-ascii?Q?oEeYEn8l70SC7FAxQ25o/Tt5J8kHe45dj21qJbrCash5PTe0Fg1xLXjgxXf4?=
 =?us-ascii?Q?Ps6NcIh2xcVVEkN8hj0OA1Iv4fsrvX8flp1He+doTlYl7EqFT2wlMFO7aKqO?=
 =?us-ascii?Q?Q15Bx4LkY/QNgrPYZRPac7s6bgcXccbUsrYoYblyCMxuUEHCcPUDIm3scX6u?=
 =?us-ascii?Q?MukNfXPgntrTIjAR+vqbL8A8dnPW1lTleF9tNW+b194Bj8x8HLjoXO4FU8Qf?=
 =?us-ascii?Q?KDP4D6BS7DbluZY/tFPWB+0HElXxv/azTkz2vcnCJT6ef8+9IHs/FzVP7beD?=
 =?us-ascii?Q?wEdQDTALzH2gRTZ/CvMTs/0HbUl2jqKCXMACCrJCrfcE2oTLy4XD5SauD0nS?=
 =?us-ascii?Q?A2GQj9GYRafDKnFzxo0hbNs0TnMHSo7Gu/CxI5CiWewQvwunWMi3rTkGrsFa?=
 =?us-ascii?Q?TvWP61hJP0CfluVOrNdCdGE98Yfni3hZVNRqE6GQMjQN1liB5bGOXhgU6U6Y?=
 =?us-ascii?Q?OhqlKjYuqDtcS2INIP1FYx73WTwsxnepWVwMbnsOktDixWYdSivEGv0/OGAo?=
 =?us-ascii?Q?JSX1gSc8Ve+eSbtkTH5VIj3m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5cca9f-2bb0-4535-8bd0-08d8f8efda01
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:51.4749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeKiLDBxMVQxMaHqGAy0MXxhQsBTORL44HYUxIUGT7SODPzul144n++3ox+es1gAJqcTwB1mh0uzpju3eEiCog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c bus dma mode configuration example.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 0a4b28827dcc..3868fec0cf27 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -51,6 +51,16 @@ properties:
   sda-gpios:
     maxItems: 1
 
+  dmas:
+    minItems: 2
+    maxItems: 2
+
+  dma-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [ "tx", "rx" ]
+
 required:
   - compatible
   - reg
@@ -75,4 +85,6 @@ examples:
         pinctrl-1 = <&pinctrl_i2c_recovery>;
         scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
         sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+        dmas = <&edma1 0 16>, <&edma1 0 15>;
+        dma-names = "tx","rx";
     };
-- 
2.25.1

