Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFFE1590B42
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 06:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236947AbiHLEdK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 00:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236923AbiHLEdI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 00:33:08 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1D79E131;
        Thu, 11 Aug 2022 21:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTwjPHdsnJhOU4jRE3rKrVXBsnDZ5TS3knq7ksxhSkwl9BuGbBebWskqF+grsPNr6H+pgOEVlKrKSs+yahLVCxpOLiRKMFuFKfnYiXy/gIvsMWATZh6PzRSpdbDbW2WkBGTtsWNAieAru/rPUVMPAPgX0cNhrhHn7nkyMXd4TVgmhI+jBDkMz/i08EVx/0Sbn90Kfi5sNG+knjDhkgrKGd+IBXzPg4D5ES8uBnjrQrY82qYLKqmFBSv11rji506kXD1xU+f6xEsmjMW7ma/vEUn0W22SSpbuLkUCj2qsJUnsQbNBy069RxEuDpLtCK7q1OZssjAndv6sYWJcOUlEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNgSPifPVT3FOihHeEgcJJztqpzDyRC7Vp2xf41BsLM=;
 b=gUrEAwxHNJ67UvSjiFlCVTDyyn1RvwvtvPRWVQeXtXzc9FAZKxGqq7elniEBAaR6bGc4HCk5Un/8ldwLT5O9wZCojQawdcIDxoqJ9ea7hJS0+J2KkBqAD575Ks4SnxGYHznQhHPQv6eHT0ZwxotGYeD/xX9cFwIqD+hMtpU2jdaLhAmxMaKGtybUm3YhA1Kpoq6x8Odo+zJP6raAfkwnZMd9nTbPtH42DbPDK2CCQo41hrTtKwvJkgNq2m2jt0/keqdgjgcnShQOGPg8R+vxCL7uj7KrPaLABzFyDhOcCvDDSDjSW1qynm543+eTXN/Ofv6gAtb0nS6fccrtgmPMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNgSPifPVT3FOihHeEgcJJztqpzDyRC7Vp2xf41BsLM=;
 b=S1/01J8Ov2Chwm5xLG55KdnqpBNjUEFk08hjjBvUkuJYcqd4fV6wmYAIjjPrnkL2wEclF3l2UAUkVtx3qlyilQndsJNFZN4B7bqFNfKtz9giOYBTt355j4DL+Oovb66dN2N3mw3BRyVNdDetsukn8rNdasByDX5CKGtnfr/ab2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6243.eurprd04.prod.outlook.com (2603:10a6:208:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 04:33:04 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 04:33:04 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 4/6] arm64: dts: imx8-ss-dma: add IPG clock for i2c
Date:   Fri, 12 Aug 2022 12:34:22 +0800
Message-Id: <20220812043424.4078034-5-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04b4fe28-6490-47b3-5d40-08da7c1bbf7c
X-MS-TrafficTypeDiagnostic: AM0PR04MB6243:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ils9/BaFxYZy99Dl1TU/KkfNykQ2GrjUBB3+VQ35lCcWasyA/Qu+5nEZfQB0plIObDuYl//SGDk75s3o6eH+6AjCoNUWBQVDaWnC309+eEa309nBpFDQ8Szyc4MjEo0W9dGXRabLUQhkXTaL5RqJr3Y4BF66Y7unqAXu7iQ272LE1NVQbZiVX4W92rRWzarrNshC37zJmihnycYXABAUWN+TzUE/kC7UrLtGZ8JmNmtDfZYws6yWf/iDqhhQjKrF6VtpaWJOBjYdjRLN8e0IASf2eC/jLVRPuAUe/a04ljengOTKkzxGDP773Xn+q+GDNzwUWHSexCRVLzJkSSWN1ET4x9aUxEwzJ3uIYV9u+d4+y/lJxgEwSepoyChx/DzdGZsM/nEDpubycOM0wcRWCH0LgcIXQd686xzTSeG2RqW3ErI/N7UpUTK/0Kfg92y35FU4dI88Kdb0pJOTuEHxdZLWOnUTes4dGMWPpI91k/HKlFeduG5MvEgDPJmsEo9Qy6XddGtqMV1bzZPsgju3IGAJknb5Ax64pXqDP3AsvKRgjniYZK8DwvvlEBFuNLJ3eyTl3aXzIHibD0Y6BB0p8Hi6eBwm2tG5MyXcFsMN4Ck4dcmM5RcyHbMvUh89f3Iay8LdyIE7q8QADgqRrzCjLqXc5txDjj6Xj3mdOt3560KKe1Q4p//ZFVRNyoUbRm1x5EJ4+26CRzpxQtJbJTPfyQrN6O6kzCjhRAKhe3iOcm9lzeTJTQ9CQ6vNtSiYiqfKIsuhlBtdgkogLMLMo1KdMTP3KOhHaRMr3PDmz3EC1ORfiSxkE5GX9Nm98PE1+Bb/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(86362001)(52116002)(6666004)(83380400001)(6512007)(1076003)(186003)(2616005)(6506007)(26005)(478600001)(38350700002)(316002)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(8936002)(5660300002)(7416002)(66476007)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E81q1FyHBp8Gt2hAzfAdwVSDU+PRNW54tqHYf1VMWqWIfKAVAIRDB2AUo2nl?=
 =?us-ascii?Q?3HgXmApL/nPECeWDCYIy3XJkWuwELwo+ZLqoQSpMqVvK8sIk5TTh6F8UD7+U?=
 =?us-ascii?Q?IJfvBuonS/hbZpjotWEjL+X6TA/vtvNxpwlecjBMOGJeC8kawSrkZsZ0pxFb?=
 =?us-ascii?Q?mRBQOVgkGgfOzqpbPtg/wPCxmJ2LZPzXKFji9/tzq6kNQRTVKht3vnuS3MVE?=
 =?us-ascii?Q?/Fr0gH43VyiJwLIBRflTSw/WkJngakViunkk6W1ewjOyV2f6fbdFvxz37QI4?=
 =?us-ascii?Q?bzXNIm9T6WK0W/J8oeQbmhwvCl0fHkWzFJRH3FKXnG/yhsOALP693ld4fNO9?=
 =?us-ascii?Q?USyaUUbbNy9zHr3QmPFUW+zRF91xcARnyVgSSGcrR/+ZE9dbglOlPmJ3b19q?=
 =?us-ascii?Q?/KeFdp3VoyvMpPCOrGt47oGEsdT9Z0bDGIq62Ubov5qX6VRavPsMnuy5UQsi?=
 =?us-ascii?Q?B3qqCzPHWnoXKb1kubOx7dzLp6uSnhA0x+UBfbACBYKXJ7GDeI/cGk3TO92P?=
 =?us-ascii?Q?Y/Kg0OLMAR22QzAxItagFTZUO0gkl6Vc6/BVKTkYDfxUXDrZ3bgYlEcI8RIz?=
 =?us-ascii?Q?Q94L6kYKvAGHwQ0VeKNqtYP7Oc25nAlNPA+UUnFq1RfOg8CPqU7U2UrnT+Jh?=
 =?us-ascii?Q?68HWWnCX8LU/otAj5jWE2gIibaval79KbHooass/UPh0p02MeUKpmsnZNxQ6?=
 =?us-ascii?Q?YIFsZlz8oFf3yaOz0H17eNsFzuxgn1xUnXZmk3nC/xPUhaqB7hgBpW/lUXEV?=
 =?us-ascii?Q?/WngLXuZxRAW7c0dJ5yTv5dCADiADRRWjPoXRaqdZZJNZPrdL3lvB5x0Zb+9?=
 =?us-ascii?Q?MFpHYN3umRsPx1IUQYxzSaFIww8U18quOGBNSMn8bvDg0TSEQj+L4RBYnQ0S?=
 =?us-ascii?Q?8qKCvhKOVPzHhaE0cx2utTi5t/viusuaFtXJE7WF6Tq3kL5G7iFCYMqtDxSb?=
 =?us-ascii?Q?ZEsldrKxoWSxewzyAvo0Jwu/SGkNNpCZOCt87ag9OqO1XKbVztCxaCkAILz4?=
 =?us-ascii?Q?dlacANelapzaVUGWswlZqN+N5INqzh/G6DjdcAO0NE9WwD8iNUa0WvRfP/eY?=
 =?us-ascii?Q?cUoi/mx7hGar9qxUzWD0PBe1VC22WOlN59Y/5Dm2V+hilRn983AxhRNeuui8?=
 =?us-ascii?Q?Z8LIN/Wkr9HaLh+Nd3VNKw47inEp02/4ngIToV8Rp76GYP3sL6FqBSSoJI6W?=
 =?us-ascii?Q?SJv39hrZh7NmFzj7UgNBiRnwlNuvd1jUISu4LeobpGgH9GTFgfWnnlNxTLAw?=
 =?us-ascii?Q?IbGNx3JQxk7gUOouUHD6DHCsfRiJsa7PJMWlj5PS7rRBFFCLex2NREq3BuQb?=
 =?us-ascii?Q?phJlkr8K+fj/2N+6tbp9omMZSoGB9bkgwBcAHN1b0UesXGBLNsO421q+hp4r?=
 =?us-ascii?Q?Bb+l+yAA8IL5rGWL0pm3hDuEwkfgOlPXOI+lDIY01r+K08d1bi47hxNDkT8P?=
 =?us-ascii?Q?tlyRA9mTKwNZlvL12VAv5jYmT6zJj5G3AROZ8E/0I8urBk7I4gFNNZzXk1Mg?=
 =?us-ascii?Q?FiIyTNsg8MPp3LUmHnumBfRBDAlr70MzbPvTNFx4/99rIET2RNo8C4EroCWG?=
 =?us-ascii?Q?xAUU0J95WiQYJMzZdPf9mkdVBhkNOFuRE94RE6g4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b4fe28-6490-47b3-5d40-08da7c1bbf7c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 04:33:04.7093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/97qqopTeavEl4L2ixURRkBtjmElcfgLYgRDCW3L7EAjYBO//oRwre+V3rrnpoQvf8eaPYywCwr46U3le/saQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6243
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX8 LPI2C requires both PER and IPG clock, so add the missed IPG clk.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
index 960a802b8b6e..d7b4229bb4a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -111,8 +111,9 @@ uart3_lpcg: clock-controller@5a490000 {
 	i2c0: i2c@5a800000 {
 		reg = <0x5a800000 0x4000>;
 		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_0>;
@@ -122,8 +123,9 @@ i2c0: i2c@5a800000 {
 	i2c1: i2c@5a810000 {
 		reg = <0x5a810000 0x4000>;
 		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c1_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_1>;
@@ -133,8 +135,9 @@ i2c1: i2c@5a810000 {
 	i2c2: i2c@5a820000 {
 		reg = <0x5a820000 0x4000>;
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c2_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_2>;
@@ -144,8 +147,9 @@ i2c2: i2c@5a820000 {
 	i2c3: i2c@5a830000 {
 		reg = <0x5a830000 0x4000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c3_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_3>;
-- 
2.37.1

