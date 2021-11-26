Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7539745E8C8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 08:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359533AbhKZHr5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 02:47:57 -0500
Received: from mail-vi1eur05on2048.outbound.protection.outlook.com ([40.107.21.48]:55521
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1359349AbhKZHpz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 02:45:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBQDMj1inI5hdZGZPqz8V/g0zyEyDFydVSwLkf0zQHyVKYSIaiuunczbCAfZ9PisvAcleUq6LyjoWlCUJNEG41n6GyClVKQ38A/s6oH+mnIsNuSIm9IScDT+1F2D9fsL/5KxzB7tTkMrrN3LkcJkrwl1ROKATyMeJyJwCV9sdD4QBNdmrhqo/7Id8NaX5wZWpPYtPQx6ewGCFaTE6ZenoPEf6FUGvcgNZe4WAjITacGAinq61WRW5PUqxLSQq2ooPyPHksQ2fJN02ay6FwOIJso+tZa5C3Sa0Vf3KNapMkfgOwPgGzuaOgmD2wBYh7wMWLv5m0TSiQaD0JmX5kgeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4ax1gO5xIKQ7qLkej4gSR7+loH1cXibdT8puUUFwH0=;
 b=VZjYlhgjqHgE7GM4nWxfhZGGvTz9sU/yghHcD+GpFSRotW3XXU7LH6VHYzHkwunJia059ovqAMs9ogtP+/pfamJcOPpHPkWQZA0j25q53i8BD+PyPVyI+Topu8en/vttLwFQFrU6qDGGw62MPDvMtyasbDmNY7KQ/Ome9TPSkN6Acr1Lc/UgBsFPIw6PtE4k/fzSb4z87VUFPITx4EutMLWFMBwTdCfiob/q7TvY/abv4/j4kc7n28awom28RMBUr1yspcn3zQZ7VgSesTEn4bpw5sLFQuf0OlnVxLyB7R5tE2ncLRfctK/59wv1SOHukp1LvpRaPBzC3yq/VBZjLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4ax1gO5xIKQ7qLkej4gSR7+loH1cXibdT8puUUFwH0=;
 b=B/Md4/wrVVj3+HXLXV8XjixmCLp6XtUPgFUWZ3GODNHAeLY3Fk9DfvRNk0ZIWzlaCqg3g39jgahINSnHo15zuAFUbdtcNIgoqwhw5KOdsQx+vBXM41NCvumwCRx45rFElfHQZPCFK3676DI6NjadWQ5sHL0i5EKlKqr86ZMmIhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:41:43 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:41:43 +0000
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
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 7/7] arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board
Date:   Fri, 26 Nov 2021 15:40:02 +0800
Message-Id: <20211126074002.1535696-8-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0139.apcprd04.prod.outlook.com
 (2603:1096:3:16::23) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0139.apcprd04.prod.outlook.com (2603:1096:3:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 07:41:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09029b0-0a55-4dac-28cf-08d9b0b0310e
X-MS-TrafficTypeDiagnostic: DU2PR04MB9212:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB92126B881118784B64BA742CC9639@DU2PR04MB9212.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VhDiYrswh1TkgcWE1wR3BBdY/wr6I1HigCGXcUyUT7FKGiEl2ssVglwqL4XBKxrgFPmGbpQ8iTTR6OJF7ilOsBlWyOivOW3gsLlb6pfY3IMQk6XC8psWjGzpGSaZgjlJuysC4+mmr4IJdCA5703+08xZTjh8nCkXYGtjrog/MvTv6P+kqM7BarrqKF8JB0qkxW1spOcXy7uIb8RaYQTw1flU1Sr8PipPIShi8Vo8vdjKzx8D5l09ppL7FCsUTxo1d9+khqRhozFcAC51s0XB+BXayjf9xv9GdjRN60pQypHd9AdNlQhlY8K4LwKpOw31e+bhbLQpGqTt6DwMpNm/JlWAFL86kMkuDx+Kg3wyvgPeEgf4vktB5bIRPZRr55TnG/yqEqzvTcAzY718jHBjfLrX1AnVRxXtLuR1OoTvaWKLSIx74wUD3r52NyH4MIZhkTP+Einy+NpDIztorHx8vy1N1R03y3m+mIfFEGZkbbBuLtm2Ks3FjkvBPV/4m5uM1Kx3Jviol0PT8ooUFRqe4x2G+h8ZhhaYq46y5NWn3x495+TaerR+VsaTJGU4fHOY0jHP25KfW6vTf7rI+Uitb8r+DhOOwmrPvnRVBatESp6SQ1B1PcOT2eiPsDeUvqLjppsv8XNJLYygW08x7WOzZOuGwQeMIeZLtuihY+zPsDXIdBItJzxhbTvunMI3fQ0MsnlKKwcLY5hJKY4tqP1rLe3TPDaa9c+ovp9K1jxpM4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(508600001)(8676002)(54906003)(52116002)(316002)(6486002)(956004)(2616005)(5660300002)(6512007)(186003)(66476007)(66946007)(83380400001)(1076003)(66556008)(86362001)(4326008)(38100700002)(6666004)(6506007)(8936002)(38350700002)(26005)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3/LSjhih+6TTi+8xCJBnFX17hkOEjWzTBZwSu+/T0qYxJrJKNQuQV0VDOXvd?=
 =?us-ascii?Q?U0DawVTNltqgyvwox5us0Yq/tqC0VmOGRqfU6WsQTp9TYJmNnaynQAYZuB6Y?=
 =?us-ascii?Q?D9gGk5UPyk8uo1QRr7iXt8R87zXr015/IHmqhxQMoKMt1ApxnM2u73VRdXGQ?=
 =?us-ascii?Q?82eRHJKXjqO/ODBKhQLVsQoQ5PKlpU9dc97czUY3or0HmwExYUHgDsixyhcV?=
 =?us-ascii?Q?4kd2N8EzKfsLvdPt4ZwDKiHPBiOSv0rmPYEmeOIf9so+/S46Oxj/klUtOg9K?=
 =?us-ascii?Q?QLMcN2F/ylFoWfdo7vfd288l8b/y0oxrT28o59gYA7Op8CYpdPfIMyrrHhxo?=
 =?us-ascii?Q?Q9vnAedwhyyvSqE4FY/wIkrvdEX5OzKhMjuziXZ8Zc46YSBUV6GXinVKUp7i?=
 =?us-ascii?Q?NY0aLKHlmjHwyawWXekHAGCK23/HgssC46a6Yd937HnRdfpymkF6tTH9fW1X?=
 =?us-ascii?Q?tss6Jkyu6ZGvwSltUTJBe2dIX/clXb1C0W/5UIiDf5P0OJXEouE4JdVpvf7e?=
 =?us-ascii?Q?ujFO9n7rx79OcVUqHp6qQZp0X0nBNvihOU53tImnghZgGUBUtu/Bwj9O9BrB?=
 =?us-ascii?Q?BRm/cJRgIHNCQHAWIUaDczANCxk76YMBRqzIHN2dbRRDZJah8540DwT2oAGF?=
 =?us-ascii?Q?Bt0o50D9MdkWscfuple+WhxUWMMjwEKYBBMtmjBChEvCv/zHcPtR8vMJ12dT?=
 =?us-ascii?Q?dy5/nXoRnn3DJW9+eN9BOwGzswvXWbYGtWxvQso5dagzlI527ZEYoKySy9Sv?=
 =?us-ascii?Q?Jt0fx9aLOJwxnaWSQk0Gt4TrOFzWlfwPJcb7BQ/ukVMpZ4aECHoaUb2nPBKG?=
 =?us-ascii?Q?03GDn4dVy8+kz3vjUFjnnZ0U4KLyQG1AUQKXTWK/MOQTjh761Q/sQdnalmgT?=
 =?us-ascii?Q?HX1VkbRWEhepmTtl4mrVt9lPaf5aWZYxPaqoMRLs3SA8Nkl8VZJahIaVnZ/t?=
 =?us-ascii?Q?nlBBZVsaHeh4RzoXWey1pAGIVZe7i99VaRRTPP7zUOJFfBiO1vBKnpCmW1bb?=
 =?us-ascii?Q?RPDgi9ek1pFBWviEyRJJnOBmrqw4S/TnfjqL1cxaRs6HjvgciYPgcehAZOrM?=
 =?us-ascii?Q?fUfw4gbyFfTBz4Fc8g10M6YFTiLOmYJU6T4C2lRbYKoj3SD2F6vTYLQXdYL0?=
 =?us-ascii?Q?7UMZG1PBSRq5Loy2mlYjtmimV+rFmjcV5svQjVaSdrGl95dI+oLzllSr0tII?=
 =?us-ascii?Q?1r4SLxxeX2vG7dgyb7lO87WHI2vei6X83+FVwtLhqyDxs6hIfTOsGfy7Xkcl?=
 =?us-ascii?Q?TcZfSGmsLfb9NpeCSVDCjAIGPEe963Dn6fej/dwJej3xfzsg+lTup0fL1eDU?=
 =?us-ascii?Q?7OIty3Hv9YGA6Jp8ag/G1Fy6Akh9sceyfMfRaWSAgeT+2CIsz879jxcPJ8dE?=
 =?us-ascii?Q?NX9bMUl3UK6YJafssKqPm1SXOOGDdibGCE+AHa7f6o3jq2LlJLI7hrEXWJhE?=
 =?us-ascii?Q?clPXooNeVpnMv6BIJuQoqmWPL0AlQkO8yGQGyqROvXLxZGxrqu3qC3BwGxmQ?=
 =?us-ascii?Q?AZVFEQHXiWWrqPamdFIa1AGJgam5cntHoo1x0ak+Tiu5eoajpz1xIU8ywJA6?=
 =?us-ascii?Q?Ul7MULh+Z3a//Bg3p+nt2IQkhP/hY5xRNveT+7eb3WiPperh6b9Nt0yUeCIp?=
 =?us-ascii?Q?BWaFz+OpPu9HssPKtMU5wk0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09029b0-0a55-4dac-28cf-08d9b0b0310e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:41:43.6476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfWvMnWhyy8dD4KQAxxe7QmfAqzK7p1L820jzydfKfYaWXS1YWf0p27Ccq3yRg1Hx0qlbq7pD6DaQIFeW+WA+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

Add the basic dts file for i.MX8ULP EVK board.
Only the necessary devices for minimal system boot up are enabled:
enet, emmc, usb, console uart.

some of the devices' pin status may lost during low power mode,
so additional sleep pinctrl properties are included by default.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 - v6
  Rebase

 - v5
  Fix eMMC bus width
  Drop pinctrl enet

 - v4
  Fix memory node
  Drop usb and fec nodes

 - v3 changes:
   no

 - v2 changes:
   add the memory node place holder
   update the license

 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a14a6173b765..c64616192794 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -71,6 +71,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 
 dtb-$(CONFIG_ARCH_S32) += s32g274a-evb.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g274a-rdb2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
new file mode 100644
index 000000000000..33e84c4e9ed8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2021 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8ulp.dtsi"
+
+/ {
+	model = "NXP i.MX8ULP EVK";
+	compatible = "fsl,imx8ulp-evk", "fsl,imx8ulp";
+
+	chosen {
+		stdout-path = &lpuart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0 0x80000000>;
+	};
+};
+
+&lpuart5 {
+	/* console */
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpuart5>;
+	pinctrl-1 = <&pinctrl_lpuart5>;
+	status = "okay";
+};
+
+&usdhc0 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc0>;
+	pinctrl-1 = <&pinctrl_usdhc0>;
+	non-removable;
+	bus-width = <8>;
+	status = "okay";
+};
+
+&iomuxc1 {
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF14__LPUART5_TX	0x3
+			MX8ULP_PAD_PTF15__LPUART5_RX	0x3
+		>;
+	};
+
+	pinctrl_usdhc0: usdhc0grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTD1__SDHC0_CMD	0x43
+			MX8ULP_PAD_PTD2__SDHC0_CLK	0x10042
+			MX8ULP_PAD_PTD10__SDHC0_D0	0x43
+			MX8ULP_PAD_PTD9__SDHC0_D1	0x43
+			MX8ULP_PAD_PTD8__SDHC0_D2	0x43
+			MX8ULP_PAD_PTD7__SDHC0_D3	0x43
+			MX8ULP_PAD_PTD6__SDHC0_D4	0x43
+			MX8ULP_PAD_PTD5__SDHC0_D5	0x43
+			MX8ULP_PAD_PTD4__SDHC0_D6	0x43
+			MX8ULP_PAD_PTD3__SDHC0_D7	0x43
+			MX8ULP_PAD_PTD11__SDHC0_DQS	0x10042
+		>;
+	};
+};
-- 
2.25.1

