Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218CD44E33B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234737AbhKLIed (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:34:33 -0500
Received: from mail-eopbgr80088.outbound.protection.outlook.com ([40.107.8.88]:36352
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234606AbhKLIeZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:34:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKDGLuyvCr+nH2GZP8QADpXLo9z8BgAjp2FirxuIFSNeCw3WteZWLZ/UtummN2rEIPr8KWNmeR7stlU85WWpbekcOiP3WqDsSW2a/zwDGElfg3NDxxqrgZdMyTr+MIlDC6/dSEdhnJsRVbM/GhtTPpumy4ktSN6yw72EN+vQehZu8ioLh8eqi5o/byfB/ljjsbQQX9eKUDYg7rr1MCfSiuk1byykIkWwVvH+i/SYx3a7zIEVgytICbXW6GBj2Y76K7EtqmvojSQVne5nYLjvoYQfSluxFFO7xMrNn6t3XCM+XwwQOO4fo8H3QGx7GnHzNjDOd/9T8jDWZbBZZv0/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baTP9O+9KBcWxPJsch55eHjz1EPU83mvU7tfgIVzoGY=;
 b=mSGJeSL5Joto4MkoKYZtyst2JFzgJIEH12f7WpTCYiTuQ3l8AQiM0HYGqkKq5iHO56w4jjHCg5IkbYYIEaBJ4SXt694FKj+LjjaMxTZlf8dKJ4PojZjrm3HP7Os4TrW6qqeICeiYsTMBEbPV1tDGgUuca2qfCwSirrO6JB228LkSjVIXwU18xJYqaVCLmmqtZIZda5AXx6dx+EnVdCxaYxHP67FG7uJ5ZOKkuBA07TnLcSXPHEWfRcYAu8E5vLS74S3mQF/bQiNV7k/p2vJONAcKzWuU0sncqzctILXYNeANchlH29/GvIM4LuHuG9EY+ppSEzeQ5mZi5BzosfrVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baTP9O+9KBcWxPJsch55eHjz1EPU83mvU7tfgIVzoGY=;
 b=M7K5HjGKJAVHZS/riZaEOER7zsZ/LA84Jb53YVIJ6shdC5z2X1SBzy8AQvw27ZuqE8P4mWDT4uZK53nHdybXWDhGL7mjGmHHqnEPKC1d86M2wBVvd4lfZNL5GpHgx77dEhc0NARLnqgjyiy3A2FF+BVVAtnFKEgUCIjc9yolPD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:31:22 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:31:22 +0000
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
Subject: [PATCH V5 9/9] arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board
Date:   Fri, 12 Nov 2021 16:29:30 +0800
Message-Id: <20211112082930.3809351-10-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1175bda2-1006-4f23-76d8-08d9a5b6cf04
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB84938E5A51AABC2AB239C430C9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QUa6vlO4RyZgOSpbaxxhXPeAQXM9RCujqH45uc9Zdliicraxu/E9gTuTp4ysTZscwlP+5jhFmnBP1cUm17lxJlmPX5uQGGcEcOwNd89bTQPcfoSZiHdvJRXjv4f7cEM+ikU5AbZbGN9jtBFbNXIjaQ6euFLzFxP7Qsfnk1HsG2bhzAifdZIMWZ0XiYweyGKhBHq/pKlDUZE1aPaqV7h09esAbdviKO6wCZdM0V9jI4yApHIEDLr1J01eRENhJdNv0Rf6l+9SKNYjPNlJMdkOZq5dHm9I5a9Up3ZEWTi0RUJpNcYcjJgR2RQMw1+Q/K6aIFp+qxTyUrBi6uWQxXYxeifIPxdN70T8ZHgaUcQkKS0/qrh0C9TigV6SKsEn4H+nxgO/GX/8fpHuXCxXS5gI4HhdYZCVCruJfkGUoMwRywNJNT+k5b10KSurwsUbR5DZEBeDhkom3liEutOJk9fjj5w1ulbwtupuK7jrF82Z9+u9BhkfyGIAnqJg82Dm1mM3ZpldPVgx4BnR/XA0a69dEvwxVDkqry07CZTsK1bisVK84IiDbj1QOiAhjpfArUH7ZQxTulr0tdqfoNxU8eksB9eJb8D46tlq4mVt2+BKPl0lIA6TpQ740zyH/lXH8hi46e6aCbb4KSwS3nVwaYzFYZSZpoc+DhRiYxtVdcldvWJqQH6k6A25vKCGiLnP7jvFumO0LZ0U+eWXDfY8MIZVVwMt2nzdYfscXksrme9N3Yk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(54906003)(6486002)(2906002)(316002)(6512007)(4326008)(5660300002)(6666004)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mN/HfDxShq1VPA/fcLJW+68xjZr2nEU8xJL1v8eVPax520zjq66o3Uvd1YJG?=
 =?us-ascii?Q?odbsMCMXmu0w+EmfkTI1Lvzrr87Ma0Gdrr76olCJDTcObJmcgeoyY5pYZOC8?=
 =?us-ascii?Q?D8L8w6nCOM/lpQpW77uNMdc+vFsj5mP0n77w/a8yRa/GdSInS3yVyG149IYC?=
 =?us-ascii?Q?8XXv37Fpmfb8aesuY/ulYRQBgW/aWKuNY54gkCVa3IpxGSCG9IaGu67+31WK?=
 =?us-ascii?Q?2zcLrJ7WscMlKTdwnL5fB4JXa6/PriHH+HC3LlDpqG4l8VJEUg3MjRmZljNW?=
 =?us-ascii?Q?sLKG2aCxUiWWUqhq+Yuw9Sqgj3VJ1rPNEx2D9vfd/kP7kOwzd5dBnL9xVHcY?=
 =?us-ascii?Q?qva8NxhPY/whFUaN9kHjwAlH0K/SoiiQ4G1jBBhumVwlkz3uJuk5vmGH7pKT?=
 =?us-ascii?Q?2xTT/cjGmJEY4EKKWYookmtmrV6ex1K0pmYDE7GRUIRYN/dy0SjRei80lX9i?=
 =?us-ascii?Q?OLuECzZzOgiwFK+O0Vo6K5t3vroecmCmgCZLPG9SDbrFaow4pRvyQT6i6lJB?=
 =?us-ascii?Q?6p+WVUXvYdBc9eb8usO7uvF1E/GBHi3pQDAeibelRimJtERp2vgeg9z1IHGG?=
 =?us-ascii?Q?eEsDBmUrUxyzz+yQ293bxEBmEqua35auMTmD3G0LIsOHBuK5yG6UqcGanDRx?=
 =?us-ascii?Q?rPj5IBdibRF0L0CRoMcmdoXJXMdvtcpQVWBSeWM9a6QsAeYSO8ap/EpCU754?=
 =?us-ascii?Q?wWhseikO7slskhgKQI/yCVPryyotPfrUl++bozIhEOr4PzH7fuC/1ftSXO1C?=
 =?us-ascii?Q?gZ6j60oQmv+XdUf3Cl+fvKe4RB0YAOFCETXmjRcl1rykBTExxLFxzdWXQzY0?=
 =?us-ascii?Q?lNgOJDIyyxiPesk+jR59fjNpi7TbdvD8PfltPy6gq7E0ZbHJ8lne3LHzNSg0?=
 =?us-ascii?Q?i1tX/YukK9na2f2kqQQL97vQ+pWYHRYhE0yZikh30zDC5eQRsXfZx0HUP3C4?=
 =?us-ascii?Q?luxO1fzBQcHd0XiOFIjCc3EOPZ5mS1RyNZOFeuZ8nRjD1PtMf4P8oPTkX5ys?=
 =?us-ascii?Q?X8cUZ9bh4OLnYpVcOgu7F5bK75COhgfPv9jHSiHXm9zH7GpzGoPyfa+v2o6Q?=
 =?us-ascii?Q?M6Kmpnm65m0l7q6ReMGrz9X3gMRwJLhIF9DF4IERiJmUDva/eGBD+rroRV3D?=
 =?us-ascii?Q?2xnzHdQY1+hSTWWF8hDHAtH1OZWL+p2Wv1BuvbSvF+O884GWd7uWEmSp62bS?=
 =?us-ascii?Q?S7n+Yi5VFqVVdMK0X/KL2qp4ow21wlyF6uiYRjxklMlj3EFtsyNIVmIPoszP?=
 =?us-ascii?Q?af6sNIItEgEYmo3HgjVxyX+2ZNoFG0Ml6UeAuY4oHmpYkCLJ07DZJQMEKgQU?=
 =?us-ascii?Q?B/OVj13tsVRvtKwKlFnN0oWZ+SDGwckRrKr0hivxeWq+ZCSAEtD3ZZSStb2d?=
 =?us-ascii?Q?fa7jRqfs1LcVimk+b6PjAgVqg0oKXz6NVinOG8d4htlvbOv8GLcGkK5tmXCt?=
 =?us-ascii?Q?A9SteFnMhVYlvEDTmJdWzN40evzXTkDAVcGTzF1GL0jtrptSw9kJO8tk684W?=
 =?us-ascii?Q?UT/hu4m+qiZ8msOUVv6BXlWfoCQIulU4zpn6XLZs1TO/KTi2P7HdVVfHQKnX?=
 =?us-ascii?Q?ehU/rH2SaUuY4vEDiFVhS+LLW4mR6CGxg27u+zy+cActqSJhXhrbM4+CA92c?=
 =?us-ascii?Q?EML7vtRR/OSjzq4Ho8u9Vkw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1175bda2-1006-4f23-76d8-08d9a5b6cf04
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:31:22.7354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvL750mB33/EPxxsTs/0btlkWt+tJNul706AaGfW4unqs5UN5VGeE5IOyuEzW8ATN2BCONsyxf0ab0cRcVjFZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
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

 - v4
  Fix memory node
  Drop usb and fec nodes

 - v3 changes:
   no

 - v2 changes:
   add the memory node place holder
   update the license

 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
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
index 000000000000..b7cd4d28fee0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -0,0 +1,80 @@
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
+	bus-width = <4>;
+	status = "okay";
+};
+
+&iomuxc1 {
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX8ULP_PAD_PTE15__ENET0_MDC     0x43
+			MX8ULP_PAD_PTE14__ENET0_MDIO    0x43
+			MX8ULP_PAD_PTE17__ENET0_RXER    0x43
+			MX8ULP_PAD_PTE18__ENET0_CRS_DV  0x43
+			MX8ULP_PAD_PTF1__ENET0_RXD0     0x43
+			MX8ULP_PAD_PTE20__ENET0_RXD1    0x43
+			MX8ULP_PAD_PTE16__ENET0_TXEN    0x43
+			MX8ULP_PAD_PTE23__ENET0_TXD0    0x43
+			MX8ULP_PAD_PTE22__ENET0_TXD1    0x43
+			MX8ULP_PAD_PTE19__ENET0_REFCLK  0x43
+			MX8ULP_PAD_PTF10__ENET0_1588_CLKIN 0x43
+		>;
+	};
+
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

