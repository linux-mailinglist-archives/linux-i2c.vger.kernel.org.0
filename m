Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB49E355234
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242251AbhDFLd3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:29 -0400
Received: from mail-db8eur05on2047.outbound.protection.outlook.com ([40.107.20.47]:31407
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242124AbhDFLdZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQO151/Strx4/a+48DrbJdmsp7wrdnOCBt47NBRRk0A+NwRd91gHnV81pZO9p3BfnxdTP81XgzKEKr+tLatxrRPvUOjtl+4bG3oTA23Kkqv7RZbHnSG1t7LVmc3gdlXrx+rhR/638zQNdwyMq4XIiSyx0lzthjmheZ9YeUZ50l4LvkyWpXZE4PGWrUahGwZ5nvWV9bWotjLyYINMr4nUqYcPZwkyNNt92pvt7b9THpxQcL4L9PnQbLFqXsFP+TDmtOeLwm19xpjlagawqc1H3m3QpK43EAvCVHQx4iNZDnSKHUdaVLk5K6pUNDT1fyWTfwtOYz8KcJLOz8KNNrbaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CILmh6SUfQdYNkpp3k7X05hN6ybufc/pGlh6OBBbDY0=;
 b=MgqJK7YJ5aZHF0z1uKbWgtkJ35Ev7JcL2kF9bFWRt727y3AnikN9MmxuBEJe1Et22jwyr8iZtCgnUrUY4Y8Tfr57vbnuUgCQm3UjUIPBO6bOCd5bk5xtSqByOw5x9HqJADRviFa8UFoOiLc+QUOX+1m9MQ6mcreVt2Vfn7gVscZGYjMJob940ktPxbq2/IdgiZagTdXtMcP1P+yC2leXOArkCHePDuENDQCppHpRT1VYohELYTVr7zZacIuJNT1eBa/3l8bPowk1QWIuQweX+FxhrQ7lPErstnGF8uD3aOk5/BECMrs1/tYfc7feFboggZ5MQOR0GO1RvAx3cwRhrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CILmh6SUfQdYNkpp3k7X05hN6ybufc/pGlh6OBBbDY0=;
 b=rqsRHhr1ygghZMxmBDDZzYyT6yS4LvzuEHvQW5xNOgyP2DuBJEPRkPk8cfPnbbpRu9oME8W+PEAAXnEjFAwpKBaOK1a8CZnDtIkY7MJdfnWt1ZvNZUEsZjhzYCMI4pPNXfqqn2U54dtm3hDIX+yaSqlieua8jxU2ipOZsuaU2iU=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:33:14 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:14 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 05/18] ARM64: dts: imx8: add the missing lpi2c ipg clock
Date:   Tue,  6 Apr 2021 19:32:53 +0800
Message-Id: <20210406113306.2633595-6-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dae9f5c-f9e4-4f75-c586-08d8f8efc43f
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB37658AC6118D9CB3FCF97DCFF3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0jyRl75Vk1pXLOchmQMLRZEGN1VrMMlwykwHzeBbrtRN8ILrTrr7de5JMu8M+KMohYEikBN9HgbRG0aVbWGC+VvjMO8DT1HN+XgE1PUSbY1DyIsZtmYNMUl76dr2q2U5oPpcUbN9+2b6W4Ey1QrmRsIQY8g+F1dmKBq2lxDU9qVT47y388osyEDurRcaf/dr90XvLr1fA4lp5emIeuYqPO47m41+nlcZPaQb3nG2uHXLi9/1L0N8vhvZTwdeRX0OAZhTE44B4b6uK3I9bLIHXnJhi6VEx5T3lFLgy8wTtZrseJapox8Sui4/ma+CcYSxb6fG1pg/gaSPoypIXSQZnLlmi8n5kpT5h4GOfuzBxzRab3mp0ZSIJJvJ3MmYAJv1RbyB1GwNx/Sqpa0aPTvoLQVY+yWn27c3qpZWQPRlGht4L5cIi3NuEvlCPnwdzbfH/8iWIWvElVRuCtcEMsEGXhrn2fR7J9IV9QJHkT9Sag7lSaZ5gxMf9DVK7vYDWXipXCyMmcecBzRdAQ/NTH2vWSEsZ7ZcW+ipuheemplAN9EwXFshMYjGbJfDZWvFypzQZ+DDvMvVBWUMcyeVsXorVoplaY+vt3l/kAxBBFFb1zmP6mFT4eLlCGxh7VZTvcHIYXhgRuOgn8XqTUgCRd+kLBYoRvA4ohWtx/E3E7K8czN8rb3NDM7qmQxWpChkhoFF3TKQrp66W3bURNd3b4SKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qnNf65EApqc3tqwXOLZhK6yX9zRsPQr/7JfmU9NseMIQbaDN1qQrIIqrGwGZ?=
 =?us-ascii?Q?lfTBc+VUZXyHdY6qWS9OphIz9fiIKYnnNbLnzGSAAgR5L7abyB3081HxVsjK?=
 =?us-ascii?Q?swSyDlmWNPB2MYCzjK9lii+0suYGPsSmVgaP5FtRGkUjGZf9B9/P+FousJJs?=
 =?us-ascii?Q?GCidVytMGQdqE0gG6W+aDLgHcthn2aYHAs7WRXgx4KEv2mNSqyv2uMs4yO0k?=
 =?us-ascii?Q?j1OuSRhsMxk0JjoF79SUOoGGG4tPTtPqVq8mIcDtGOmNzlHK94fqT4O0mVHI?=
 =?us-ascii?Q?jpPRvykC4Bh3ChDjD6l3ZRq4ymyQ5mjzyTR6Sr5MCMHxYAG7WjvMbuoxMPa9?=
 =?us-ascii?Q?o+uNem2xcNT48YgsFp3JDLupaThVnCPd8St0JnFhnjFcw3hpcPpqPz8Lm/eT?=
 =?us-ascii?Q?Wxza6ifoxxTFeAdtggtDdjCBbiWU3MxB2loKOF7h5FRriyFkZF9dYAio1up/?=
 =?us-ascii?Q?zBGOyz46l/UppfsMzucbbgv9Ggt/H818cv9ptU2ZgdAgoKJNNGICQTZZeA0O?=
 =?us-ascii?Q?uDjHAqlqr115Y3SS4R2QX6MLhSdwMLf8WMsTFZbDrJ2Xd2BYF4pBb3isZkAp?=
 =?us-ascii?Q?X2EmVTBtowDsyVIN+PKnVQF7ZEPMqGQTOlJXevyxp8PnjuGOCaKV1bNrXXNX?=
 =?us-ascii?Q?1y1xS/dzRkqnDKRo8OGr++ouZu620EtFLTCrZGrDdNsNTFEH5kyu9h991uP3?=
 =?us-ascii?Q?47ueppnzPUtq7+FjJVluOJTYQ7PruoUU10CSgf0W1X9eIRCgmp3gQD43Vfxq?=
 =?us-ascii?Q?CPypeUeMTlEGtmO4jRhQUvDyDs6lch0ceHQrGk28EmykPHO7VgeZGeMbYtIy?=
 =?us-ascii?Q?JLoW3IPmXiRbHLLdQ4nhzLMTUdp4WRshwA5iSmXMobfucNF+l1a+D5IAMRQk?=
 =?us-ascii?Q?8sz4cRsnKKEXX97eo1GrhC/NC5x2pYdRWK19w/nWlj0m5eF3peWc1nckV8/S?=
 =?us-ascii?Q?lyZfbVDvxfGKpBQTHjmJANSqwXuso1O1qhCqlnOnQ0wUuuX3lzQuuUvCEuzo?=
 =?us-ascii?Q?mkhoqp6tHoLucG46+pdyHkaHYHCXGtuntviVOqCXOs8wkMm8EAW8QU2tysYj?=
 =?us-ascii?Q?cIFPe/C617c5TQUwj2PJmKra5HGkynUOkUNMg86q+CkRXOlc3brCS43kTAHQ?=
 =?us-ascii?Q?IFgNz4sN8agLUeWq91a5vU2HwM7H51tl5I0GJk4q52xDNxmFAceDt9nfMeuf?=
 =?us-ascii?Q?V/N3X+aE0VXqfjVWIYgPQ6YmlvHoIyXvyBZblX2yiKmL3iHi3NUPxq4sdqPe?=
 =?us-ascii?Q?HIkze1AA6dwfVajl9+HDZgBHDZDlGTxEplXW2KAg5gz/pqdzQ2lbHKhGL6Ja?=
 =?us-ascii?Q?zv8ZsmcnjHus/CRVdC+tjcAt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dae9f5c-f9e4-4f75-c586-08d8f8efc43f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:14.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIFRwyyNUXQxnwb0Eimi7VnvtixohctDi2CyRX1+aBp3UuO1E4EhIJEC21sKvY5X1dc5qgaSb73mdfZHD01gvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The lpi2c driver has add the missing ipg clock.
So add the ipg clock here for all lpi2c nodes.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
index 960a802b8b6e..b5ed12a06538 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -111,8 +111,10 @@ uart3_lpcg: clock-controller@5a490000 {
 	i2c0: i2c@5a800000 {
 		reg = <0x5a800000 0x4000>;
 		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		interrupt-parent = <&gic>;
+		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_0>;
@@ -122,8 +124,10 @@ i2c0: i2c@5a800000 {
 	i2c1: i2c@5a810000 {
 		reg = <0x5a810000 0x4000>;
 		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		interrupt-parent = <&gic>;
+		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c1_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_1>;
@@ -133,8 +137,10 @@ i2c1: i2c@5a810000 {
 	i2c2: i2c@5a820000 {
 		reg = <0x5a820000 0x4000>;
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		interrupt-parent = <&gic>;
+		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c2_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_2>;
@@ -144,8 +150,10 @@ i2c2: i2c@5a820000 {
 	i2c3: i2c@5a830000 {
 		reg = <0x5a830000 0x4000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		interrupt-parent = <&gic>;
+		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c3_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_3>;
-- 
2.25.1

