Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC8E595C5D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 14:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbiHPMyu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 08:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbiHPMy1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 08:54:27 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B8672B5D;
        Tue, 16 Aug 2022 05:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmA3bAKf2FqgVRDchXhPTvxGSEQFpdSFvBUTVoIvT+S5CCzGtOQ8U14YkHIadqJcXs7jSuQZCr2N0PdmlhzsAQuP83z53cKUb/Wh1nXktqfUpbJ9dg2ahM3GXPjV55zkLD3/tx3YrDss6b8KjcuhVKmVCgqDzj02/ZHDf66psu6j+yQSlwLY6W4gu8rz3Xd2QVNWMOty2i4JVv9mQJ6v2LdWkQMuwV9ab3efoL42+5uw1mlR3xjiqWfJZpP8VARpJWgEo6JnHAm5hNASmdmSd3vSts07HJ3G4ZXQu/hx699sd0LyJxIT83/PQLi82vXQINnFE1jJNt+rdhry8i/1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNgSPifPVT3FOihHeEgcJJztqpzDyRC7Vp2xf41BsLM=;
 b=EtSa3Qh40BqGkCT97iVWWwngPrsNDZsEzUYN0s5X9oj5ma1wKTeFHTyO0f0CFT8hnjnalRFfgMrYmQMRhuGvuokMXK6uhCX04eiDACOoUyLuni6pDPEqlUCdrrFC1r4+yR8cgU1NrF7Bmb9uTXYZXgrlXKpByLbHFmQgFQGLHqfByq3Fb2npeIv5RAK7GeXV99pwLF+AuPPQutxv7KlWPonJR7pt495mppaUcE8kim+wS9oNfBhwBG+vqNMSS+dmKekOutpAvlXb8DOyvMDqK5BkNA7TDpFcaiNk2P6EQ+LDWxnvRAXa+4Kgop89gF3leUC6vreBumx8EdcO4SgKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNgSPifPVT3FOihHeEgcJJztqpzDyRC7Vp2xf41BsLM=;
 b=hIXVO1Kiz5Dl+ftBS98xbHnE08236fHW/6GDB63gAk7y1y9ElixdYtiz7COS1PaADJbI1h/lhP3jsRl8xbobS9Xer031fyj1zmcoh3p1LYfsDQw1qo54nrg9E1GVmOhefOQ+cLYZ4Jd/ZThAUKHX1rYjLK7XztWvWbb6laRBmTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB4060.eurprd04.prod.outlook.com (2603:10a6:5:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 12:54:14 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 12:54:14 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 5/7] arm64: dts: imx8-ss-dma: add IPG clock for i2c
Date:   Tue, 16 Aug 2022 20:55:24 +0800
Message-Id: <20220816125526.2978895-6-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e5f175f8-7a0e-453a-33a5-08da7f866bed
X-MS-TrafficTypeDiagnostic: DB7PR04MB4060:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iHYFxd31K+qfoYaCKbrUDNFVKa9CgLxklWppw2PS6AiqgEl+JzIPsH5m6+bFQ9UeEYcZRSgrdkrq5gWx8VibnB1nC5p1yK12DgZRTdhpNxWAKhdm4bKKVPH/t2DODb3A+KXE0oEE81bRmZb7WJF/29YYDWqdWL6Yqgu9zsEoH+O73BcRmN6w/zhM/Nmv6LWgiXhKppb/USzXKZIx3hXIgeWluKgkqzx2etXPayf/qRAhLEOicOaRoKiLh0/z4EXyJ4XwEpBvRvhvgu658GmGsvO3bD5vL2VTHaDErUHlDxIpiE9/C7gTUMOeoXzMIV/kPWv2V0Amsyc6NSMnj5TSb9qTkM3UFTT4/RuX+z4mOTI+1adLZNhByichqgj+CRvK5UiLtzGYm5/ptwmI99C0DYIsIRVj71uY9gHUy8UA04npK3cX0qxuCffy4qMk/dEXoI9a4gG81oRBgAbxlpeFtc2jmEpisuuhnuGK0jSxEznGmJyzGB7cklPypqEW3f1FnoAqP9F3aT7VFzaYKDXZ4a0VKz0mF+O7hZSwxL+POpWfBsf13h/pbeLkhngBFPxmSt6r8vEuokiqJ9893wZNMnhR04B9WVR6DS0lfwgyrSNBegWCFhpzyYAIOVVWY19ShNbINvIJG/KWHLCYlVYZqxqMeMV8O2iP6/gOjx/MHnbD1BsgLaXsiMmlKAzvjRKmn4073a4ZiCGml5tEQP5S0u4B6OcvEbcEVm6te3T9bFXy7wDqV0L3vEcSfXr+tVCKpEY0rWIQxRHzxfJoCRfGI4bj3ZZdAZLa/bvr/pMTV6pVceuKUR2ZpYYqvhDGoV2b
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(26005)(52116002)(186003)(1076003)(2616005)(5660300002)(7416002)(8936002)(6506007)(6512007)(6666004)(41300700001)(6486002)(478600001)(86362001)(83380400001)(316002)(2906002)(38100700002)(38350700002)(66476007)(4326008)(66556008)(66946007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/8JmsBYqNwvJVflWxcJVX48lG7CdwmqPUQt4sTikj4YynO1Fvs+Fznd6mUgH?=
 =?us-ascii?Q?oxxPM7chCro56Tq273rPrka3ewJR7N87uEFMo+Lw8XxP8nCu97k92/eSsPk2?=
 =?us-ascii?Q?rKQljWejYcdIth72i7nwsLvJZQwJhdtz7OWw/YSuxHZnyxuxmjDA3EFx5jSH?=
 =?us-ascii?Q?NZ3r6F+m8sCRESyE4a7i3xM4L2YNGRSM/arw4uEbFzK2mI/xpDfhCqSXecqG?=
 =?us-ascii?Q?QbapvQoUGrvpYx1TnD2r+OhKzshX2rW8rCpgweial45dopNoIsL1nNxmwHld?=
 =?us-ascii?Q?VsAcXnplm21YLEZPZJA9o/C2x9D5sj1kPa1ywqkaGAcIvu9j8ikq46GM8myu?=
 =?us-ascii?Q?40cm49gWiuJfRyupF6EPT6CsI/l7hRQOs3vSPFS7mmfzh/oblWG9GHv+tMKL?=
 =?us-ascii?Q?68B3gEg42tkzlkBrybCZSLHkraE7fTkgO61KsGJlUFAaDf6go/N0Efml7vs/?=
 =?us-ascii?Q?ZratlSuuBPj7ZSEAWAOArSyFDOFTwBk5k6RzKBHh6m8lT2te+65xZf8pLAhW?=
 =?us-ascii?Q?KPgVyB/9OTJ1reFUYhEIPo0zX+Msq9C2m9SCxBoBW1nAm5Hyl7tLFdvL7MUQ?=
 =?us-ascii?Q?t0JoLGi3IZG3D38B5RlsH8/RRek4xND95SHJNSQhebATYxlImi5nswgQsJ4P?=
 =?us-ascii?Q?T+Objxoeiex9jKLOxOhltIS8bDqiq+KsYsJP+DolTZ4eIIHq1NP+11xDlqfi?=
 =?us-ascii?Q?r/Vu5K+RISCwbJo5KZG9G5Ds2yrAUCs61cR/eN31VPsZGsURtskrNMLDury7?=
 =?us-ascii?Q?Cpk42F4DkfSOcok//+QI8nvjCTa+FLS/rKCcwGWNJEvL3iPDKP0O4e+EiW7P?=
 =?us-ascii?Q?7sYNW5MgI8dmMqfYrEmCO1h/p9gidR0Nk9Kax0f30D8md8NkR0c6RR4DekTN?=
 =?us-ascii?Q?HELqoHbhsWpUdHwb/9B/69MIkmz9/nNfZYEvDIvqaWIXdNpdaSBuo7v+oUAu?=
 =?us-ascii?Q?JT45otoMwcqxIOtqXfvXONMgtsv25vjUfvVh3RN8fjMT/N6InXC1aL075bMs?=
 =?us-ascii?Q?IjVx5/RALNVTTHWTRZt8RL7Yfr4kAoebI52SJfyFS9jg84QvpSs97StG4egT?=
 =?us-ascii?Q?d4KdH4xLuQdmeTAUDkb8LgtBxxBvjxxaVow04jPrxsys69D24NUDNae6hItJ?=
 =?us-ascii?Q?9/FfknOVFBz2wB+2LHveF61VXZ6VBv9lwZVsR49RBLpVYkXOdxXTr1gwo0mY?=
 =?us-ascii?Q?lGyfUWxGpAoppAGf6MBm5JO+cOkxWMGeYzCm17EBGrDK8/xLQP/wxw1nUyGP?=
 =?us-ascii?Q?nKjpIRcurSe2AXa2BK0cI6A6b8FLYFeoYVO+l/SItOzXo46yd8V50e2EjSDQ?=
 =?us-ascii?Q?F7KDbJM02PkGvssCPKEvRfG9VGvMev7/v/Ezo3B3rKJSEJvN7i1uQb0KB19n?=
 =?us-ascii?Q?HHzIMVJGxpOtzvRbUlgZZgHCWvWWEM9EUeC4Q+RGSh5eLYqLvxf7EtnWJsXX?=
 =?us-ascii?Q?iMraKIgWI0dU8u1+XMLzTuJ3PY8cOSz9AYeQ1NDE1DPJ/hQ3fkAHPyOYwVAT?=
 =?us-ascii?Q?ojkOfUnKxRUNFa2gjY+GZ6c029JtayQTJU4Xyn4qDaAzOZsITRhmUggxIOxd?=
 =?us-ascii?Q?FJiQc6ZX3BaCvQQliuZJslQpEXacYmC3JzbEgKKX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f175f8-7a0e-453a-33a5-08da7f866bed
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:54:14.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4j4Pn6awbrYJ+Np/RfuzBpT99FQJCPZQl89ZYF/k7htwDIieRSTazEMBUeVYvTkwyiNLvmC0hRIjaVaWAu0tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4060
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
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

