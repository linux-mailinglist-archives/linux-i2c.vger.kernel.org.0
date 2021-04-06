Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD9C355232
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241603AbhDFLdX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:23 -0400
Received: from mail-db8eur05on2059.outbound.protection.outlook.com ([40.107.20.59]:54880
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242022AbhDFLdV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmSyR5R6ZmeBl12J4utglvag9vdJmz+sN78D8XCmi8FbvShRWWPCZB76zoh39yrTJ2arsldQCQdjZdq+Mo68npn9xvD0XdeDPmrMM55Nf5+yq5wKEej3mGUNqvcKf3UB7KQoRa9Noa714/pMVidQCeHbPcF5qHHVTSSjf2isgEf7XNOX5v1EVLLM0QHEWwGwAZol/DBuqJrCZ3e1SIieIVsu5xcOsg5HjVFy73832BiKWtJEcbnQWe0rEoXi87o0QzFdh9Y0tJFWEZHQEvfOgtq1CZy38F7JPr70pdtI1YWWAZIxqhf4D65fdWuihBYB4PgHqqu4RPI/dV8RphrGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUxP6kXUybJmmHVqI4y3x/kNT5LVKhcxABhspnWD7xQ=;
 b=OistX+QG/sH5vIZEqDJO1CHhYceslunh4uU+xo9SSeYDW2fvQOhhLiQJXzECTwK1tgIa+Ns0xlGOMqDYP1JuQm5dX1uq4T5y1KLG+uSctzNFJu5j6PHKVWb0wNrW3uWpYZFtmDywNokwWRpAR1F6aCauddXYHrsqZMTlv4lW/JGiYAht1/EZhJqvt9wv4CesTiV0mtlVHuXAr9oWyuRyNgrrPkzLl3UIZVW5/7J/3Zn+a8Dd9LmPTWW9rUFcTwD9b7e9TbitgXX9zl7Rja6Yxicc5t2mJn97uniEmVRUy2lR9kdOS6+bgRxftMMxc4B1Cy2yaqR9UcUunRc9JyqArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUxP6kXUybJmmHVqI4y3x/kNT5LVKhcxABhspnWD7xQ=;
 b=FG/sRmux5Ip5y3Li4KVGJVyBaNLzP6DRUAF9SBkVbFPx6aqGjSidtQbPNjQk0tohlRKlt7/nNixUugYgFLNCj2W8qaH2Ade07pXje3SuzHCH/bZi68cbawS3oMntCTpczuEWajg7192zrx0S9SoP0uH5+OVOdkPZ1NHnaWm1rMw=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:33:11 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:11 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 04/18] ARM: dts: imx7ulp: add the missing lpi2c nodes
Date:   Tue,  6 Apr 2021 19:32:52 +0800
Message-Id: <20210406113306.2633595-5-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ba46151-0668-4b57-0ea0-08d8f8efc21d
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB376543FBB6C45E04F606020FF3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7yiUvG+HLAua1XYeBvR38W0dy16cgzIxljci7GxjVL+45urGy2vp7DgsGJ2JypkRv4Nxk7ud1kkn4Y0BTcPCCO7cg4e/fI/5URakTXoICe7M8CFdnJKCY3PQg69UOzA0AjPc7l4QtHH1odqtZGWUyV0qJ6OJv/Y6B1YIDNbT3/e4Y6LWWLm4xHR9nXQm2yyfInvj1PSyn4zc5ejwLydlh+cMTMjWADVK+a2CECUHJNwlUjPWo8Z64c5pLy/591yZpdrsLsfzAT704bM/P/skcUDcY2Utdy8BIDtYlzRbqRGe8JDzDU9XSJVDxc0BIEDL50/en3HlrtA9AdW0er2mrlDVYc/oCE72EnH44jReLSLKhPpp0otaMddDJX6MKmLsK8+NQu9QA2WbobZvYHsc7BoTQz0nx3skZ8ge+Q0YUyaqRpt16D2hwBd+htIz5Ti0FUVQ50PyIO+9MADacOom2qJLv8iCngYvYTqOa6s5Gc2IBEEIMcIpNI9NJSAz2ISDEu13XkN1Lu8y9IvyNDTma848LhGEy4z4KJohnl7Eew7rgNg3P3Yfy10iyTIraPloR1UU4HiRIIMICCSVf3m79r7AqZ8C3Mo7fLY4wKXbe0m9zmzMYAG+Ef4k1dSfEjN4R/5dnSCFkPmCqKal+rhbAeyvT5C5YBW1CfR0w/wpLSztBd45hqQ1pNz6svJqwOHyJ7LcFC+ds1xCUWgpxuUBD0sUKfNn2gAvJ83hAGBWlas=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VkYw1i6ACN+tqoW0y42k/8s2jC5gkwN5Lbq/rKlBHVHvk0B3WCMfB6RuDWoq?=
 =?us-ascii?Q?PBQ8NXsaeknarhbveNyVrlB/TsKeLUZnavfi+bueBzTZ+SrTvChUK+NWYlvU?=
 =?us-ascii?Q?1KK7XPxb7liozL0sXlsqOS5rh/hqGj9Vf+JH0d4xCVtIWW6cAQRs2cqIJj1M?=
 =?us-ascii?Q?qBcR1xyxVwlUBxKNN/bEtxxkq3japRZkY8/JTsO5fKVJtUKbPUDasFbu4pzR?=
 =?us-ascii?Q?Z362uE7UF+9ksI7z0X9W/UrIJCQocgXOcqQX4OhU35EvcvoCHL/0uRboZM2Q?=
 =?us-ascii?Q?bvB7x5QigBOigiZkJXSiJgudJKRKkTbBYoQgn6d6KpzpMizo3jvwNbTA4rfP?=
 =?us-ascii?Q?y7rIgq9bId8QGXRSwO7cCEKzdKKtIiLTLpfiPxKGNL5fEx/diypIjHQnmo06?=
 =?us-ascii?Q?n0YM/VeRAIx8l+XrtYpeNp68q4CtKeF2TVl2+fchbq4ddvGhJJMWD/zRURPD?=
 =?us-ascii?Q?n+98eaUWxWfUo7zkUJ+gzGdLoVfcygNJn1N24xknDV2IeUSvU34+yzVT1OY0?=
 =?us-ascii?Q?Ao01CzbDzKRY47etW52zh2+mXhOOuC4jwKAwl0YKajy0wDy3B3AOoZsT6tlt?=
 =?us-ascii?Q?L7Mjxv3K28OxA7yivrPehgzCAnSUO6ugynRK83W3J+4oLgF+UapzsQAASA1j?=
 =?us-ascii?Q?bhMggkE+ooFViq/vE6ADn/HcA6Z6jf/zZYFmYnRpCgnlkQEA1YG1x5y7Boys?=
 =?us-ascii?Q?KH92HUJmTLBt6xb1GX8D6e6qyLmHUlcczslFwXOnQURshDEJ2FGhHtvTYMJv?=
 =?us-ascii?Q?ldQdqqUJF13iCROODxfoNjoMdTmnhzuC5QyrJQ1B5ct0devUDlZDPa0iFr5T?=
 =?us-ascii?Q?Ef+cSmuT5lhClHhyUPXD0qnYSBymFGDLjIjMeUtZs1ExgknWDwLTOGNTVIfO?=
 =?us-ascii?Q?XbGMKiTZiMujcBTIbuAr2cz0FdJ0YNFb+Dl9YM41AjjPZZJEZKjeuy0hHoGA?=
 =?us-ascii?Q?8B9GzzZcBCRMvoAL88bnEDRbFKZpwQqjGyq2HbJJ4LTrv1KgN2O4pDPUC+lY?=
 =?us-ascii?Q?VA1IzusrgH2vAOAdwVmvYO9bvtcijQLqQpRb1hBdRH+rTSedPNJ+0R3pLWLd?=
 =?us-ascii?Q?fF3wDEdFLnz2bWZEAljgIeJMNkoGkVQt94coZNsh3djc3UXIGOfo2/ENPONG?=
 =?us-ascii?Q?bB8Jw3xats8fUqmVQ+tHlvm6qxrZE2sXgWjVh0RH/Auu+Blc4HZXx2jj5DI4?=
 =?us-ascii?Q?W2OXazwT46trgsiVAzkGU+W7ejXgQESHLP7ajh2u0YdZN1rRPRLZbFJSIB4R?=
 =?us-ascii?Q?Em6rKy+lJZHduwyXPBek1bN2xCnY5RoZRFF18O3b/hh8Fsbu0tXgOAjP9xJa?=
 =?us-ascii?Q?feZJzaF790w9IwOmOW5kb6EB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba46151-0668-4b57-0ea0-08d8f8efc21d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:11.1820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUCjWjeKcLFcRmsYCpIgDwO/VFF7+lFtGsSpINuDgBt06ccIWhKXvbmbgqQWBSlFDnQWZCTAXrEOa/aHIgppjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the missing lpi2c4/5 nodes for imx7ulp.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 arch/arm/boot/dts/imx7ulp.dtsi | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index eb0d4b8f624d..0c51fa79c0bc 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -22,8 +22,10 @@ aliases {
 		gpio1 = &gpio_ptd;
 		gpio2 = &gpio_pte;
 		gpio3 = &gpio_ptf;
-		i2c0 = &lpi2c6;
-		i2c1 = &lpi2c7;
+		i2c0 = &lpi2c4;
+		i2c1 = &lpi2c5;
+		i2c2 = &lpi2c6;
+		i2c3 = &lpi2c7;
 		mmc0 = &usdhc0;
 		mmc1 = &usdhc1;
 		serial0 = &lpuart4;
@@ -145,6 +147,31 @@ sec_jr1: jr@2000 {
 			};
 		};
 
+		lpi2c4: lpi2c4@402b0000 {
+			compatible = "fsl,imx7ulp-lpi2c";
+			reg = <0x402b0000 0x10000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pcc2 IMX7ULP_CLK_LPI2C4>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
+			assigned-clocks = <&pcc2 IMX7ULP_CLK_LPI2C4>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
+			assigned-clock-rates = <48000000>;
+			status = "disabled";
+		};
+
+		lpi2c5: lpi2c5@402c0000 {
+			compatible = "fsl,imx7ulp-lpi2c";
+			reg = <0x402c0000 0x10000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pcc2 IMX7ULP_CLK_LPI2C5>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
+			assigned-clocks = <&pcc2 IMX7ULP_CLK_LPI2C5>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
+			assigned-clock-rates = <48000000>;
+		};
+
 		lpuart4: serial@402d0000 {
 			compatible = "fsl,imx7ulp-lpuart";
 			reg = <0x402d0000 0x1000>;
-- 
2.25.1

