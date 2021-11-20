Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8725457DA4
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 12:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhKTLj4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 06:39:56 -0500
Received: from mail-eopbgr60086.outbound.protection.outlook.com ([40.107.6.86]:23694
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229832AbhKTLjx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 06:39:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPgU7uZPDv5eagBsf9fJ19v4tHCpbQlkmxBpravP2cgLFxV0uttF784n2NiTiepyW2D5XxuTjSdP4hS3ejMZc4virMip+O+fz++P2OYtIMQKBUdwjircwg1Hr1ZpjgeznnHscirEGJZBG4vvApETdQZzJV+KueLuhej+JWMxF1ZYqjAOF2inpXWsV4hj4IacncTfngI3Dds7QN8fKd27D74uDPd7v8XGj/PqGN/9jyeCD/IBZg1SRBI1bgM5PVARlzZ53eV4cj5oM0IOMy8OWo8wH0zp6/b6gNQNlg4sY2Na+MXzzw5pCw2EgbU8WPa5MePW09FDoX+sni1SIbqGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viIkWcs0Uu/sbkbKu2YK72Kz/nurC1UCogvFB0SWL88=;
 b=VEjYxJz6DY0Ut1e1aUq3DYPKvRscrBxyL8Qw+tMQsXxbz7lPEAxsbKo8jrQb6MDMMBjFZ1D5LAPowVFb4KlR4HjKDxLxx8fGpe7ZBkTr0iTnTQTK4lGC0bS/1+AzbkRi5r57HeEJBfSws2D/8HbYUCy1JUnLBBRPEF+KzvAaRXNY9Zd1N8yBekYdc2WnY/oB6s6H4EpSRH+oNLaLmOt+48nc18ej3DLUFFwPieLqclSOKdlaVYXtjvn9qbj5OuzeP3INq0gne0whvNNFTUvabq3xMxIeHOTIClE4mGjI7ETVIFbiSghAjPeGpCnA7K+AB5OtuJkgMXi0kbQduYlxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viIkWcs0Uu/sbkbKu2YK72Kz/nurC1UCogvFB0SWL88=;
 b=UH7k043LxCcaQcWXc4LrNAEE6Jn+A1t1bviy2sp9fGzcKsPYaNSQDqg8T/aHyC/HKLfH/x9xdMVRCSGCnoOdXrSMRkxryucpWxWbDFlsseC7mNjXqhffw6ByBCvyUwWI+d112aF8rbahuDFNC+Hbg6TS4P8Em1+xfIOcWBnpv1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 20 Nov
 2021 11:36:43 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Sat, 20 Nov 2021
 11:36:43 +0000
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
Subject: [PATCH V5 8/8] arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board
Date:   Sat, 20 Nov 2021 19:34:54 +0800
Message-Id: <20211120113454.785997-9-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211120113454.785997-1-peng.fan@oss.nxp.com>
References: <20211120113454.785997-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0029.apcprd01.prod.exchangelabs.com (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 11:36:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 424eb311-8741-418e-c4f9-08d9ac1a06e3
X-MS-TrafficTypeDiagnostic: DB9PR04MB9308:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB9308DA7B9C2992E304A4BD23C99D9@DB9PR04MB9308.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSg13isHjCmsHiHozgLVFImJUuN/usqgXcVVfk1yEz6iSOq+WaHrmD2ReIWU6ceZCQRnmso49SMk0/Ujzb5jtqpgJ97i5FcOiw77AhEtCdQt6eIKalEMKxU76uaDyF9un2x1Jb8p/DM09BQJ8eYveGTBHBlENoo9MCKy4CjILlopr0GWeJcxlF2SjwEJwrpTDFt++WvsDP13GWvG9+yZVSU1LVIEOQ32h9wXLkGuC7FNAGsYJWKPFV3neuvm03QdZyjevfyvFUkMn/zGIP+HmbtqjHgMpnEQhaPAsul5cZOtr1Jw4rp3kTfn8gITB5OopaeLOg/nQKQb/xPHUMYdV9Pj6weNSlTZXZHOSZ6bccymh+mQ2aGDiXF6pnEck1Uo1V4/LPmjhn17p7mTMTMCMbshRnONewcfPcjGcvEjF9U904Ko7RM/5kgcCnd+aO6uojQgGJx5uscx9hu3RXTkVX+aWacFvXG9ZUB7Gvgj2xHfJsRCL5QZgV2jESbhvsD9vC+DAkXYUOpVq4dx64I/xfdESMMHi5df/5d6gPyOGd8Vic/Wk2R8ztMBi6G8DqaARfekmPQN31pZd9ih4r4XTBeHlW3DRTj7jcSceeyBv7lr9iZ/60xn+ENQqm8YY52sJqzD03F6lho0x//OWkv3oZmsXjT3mGdhZ2hvg1N8Es+rrNwdzncA1dS9zK6hVXwfOeMsgUQ5aF5JB38fzacWvifNp1UI1nKBBMoa6+i1t28=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6506007)(8936002)(4326008)(2616005)(66946007)(83380400001)(316002)(5660300002)(186003)(52116002)(2906002)(86362001)(956004)(7416002)(6512007)(66556008)(26005)(66476007)(1076003)(54906003)(38100700002)(38350700002)(6486002)(508600001)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k5KduuHugK3v/jSOkM1I+DjKN1jks6jL3ZcUeUNCUQ9vw33p+5XIKykPFugl?=
 =?us-ascii?Q?Nm9lMEiib6CoPHhpjml+1Pzx8lnkC6UdNDubjYCf6jotf7L8Ly0AClrVyCeX?=
 =?us-ascii?Q?pESWe7F9NurWLYPnYAedBu9B1n3G2InvHtYoL/5h632V54bRd/oRgsn+9qPk?=
 =?us-ascii?Q?JEe3h8SPEQ9wXwc9YMLMuHYw//MnNQsT35uqBQM681cWekXwKmzkqVA67aEB?=
 =?us-ascii?Q?me4tVWS2jFkGmxxdYflmiEqCbh2IAB7xj3tluMzDh1CjpTjHmPvWeYsdPhKI?=
 =?us-ascii?Q?b75Ess6RlG/aBfExZrHsFLjhY6sP64OD/hUaIXkf0fV8fpK+zAoRPYG/tB2t?=
 =?us-ascii?Q?eyQOXgg71odKAlwyUnKXukpqD9sHb2xJTTa2d7IYTcyaDTS5XY5jN31labot?=
 =?us-ascii?Q?ZRZUYKjyM5IHq4u+A8ML0f8BBHi5ahKqKo9ezkntzZZS/eogFthot0F9sfhd?=
 =?us-ascii?Q?34KubtLP4gcHAjOuB9i+V8pdAgzKvkUicDI6+skgCSEXm4vArAEWT+w1QwIH?=
 =?us-ascii?Q?ND6mp5FNCdtsmematrv8m4Z3VKhUrTevR+IJrMxgr+QTFOn/srleC9tLDOry?=
 =?us-ascii?Q?uE65j5zOqNhTUjlmcAH52wza5JIuTY7xjTT4+UlNfPzOUObxtcE+b7AWQziK?=
 =?us-ascii?Q?jGXiEKZkUedeht7DgaU+QQTtHL/yvOoz6Bjlftnq9atUERkAkmQdUb28bn+t?=
 =?us-ascii?Q?S/rZYsKEGtlqUsFR/DQPwFXW0Lcf08wcBqOPZxvmMImw1nbv7CQ6AI04b4/E?=
 =?us-ascii?Q?tI+9sBTqf06eFEJYtNoczF2YA6MCMsupG1uR9Y8V+pDHLkEdELROLV9pxptR?=
 =?us-ascii?Q?m1gybQDaglemIaCqVTlSCQwpDX21rt5gQemnUNmkDE8AeBiakbJPzihMkkhA?=
 =?us-ascii?Q?2DuwerbmyJ2eZjIYQo5xGLIxxZgu3MKhfchgvJHkqSapU5Um96g+dJlgOwrV?=
 =?us-ascii?Q?IY1fIwQyUR1Ua+xCOl5eyqmRVWjZwgK2hwSm08CgCOObTJK8GO21jG4TMH7n?=
 =?us-ascii?Q?dEk4MsfK9AnHstnFxh/amky+DwtR9ikXsQO9j+TikuihFKH8BSuO3xLx6xS7?=
 =?us-ascii?Q?Gz4iNA9PyUdPVonpCgg9GRBscuAIDjLadF1mZvvY4lUUQ6XUBkh6jwaSlNpk?=
 =?us-ascii?Q?TKaUVCJEDwukwyApqAB8kw3TlYqFPNzk87TgP2yIk+E1qIef/XbqObkQ6b94?=
 =?us-ascii?Q?nwJ6Ao7f9VMO7XPuv8glVJHFpCbnq0bH8YZtEYdGJrsOJRsFabhyiFadnu1F?=
 =?us-ascii?Q?Z1Yq7Lj37ANFyU8MNE6ii8PeWx0puIO/9fz/5UJaL/fjAlGF67Z+LLQQdXAD?=
 =?us-ascii?Q?cjhSfvolJ0EtzWJmXdO53aBmmMkqZQP8zOiFkC7rdHVOA4/KhhIIASYgPtSg?=
 =?us-ascii?Q?iSr+iK6e8dRw9CNnZl3xco4feklmfGVdNOOE0ZR3Ql1seHRdFfY8GhQxkL7x?=
 =?us-ascii?Q?wXer8ndxsGTYIMZXmxTFPKnYEgLz0Sb+rQilYl2duqmIWAOYTjdi5G0DJ36b?=
 =?us-ascii?Q?7RYEfsvmvI+QXDWrv8Bye8dbxVXhKr5bpvnVugXFQSe35Zat26ENkeGC6ZDq?=
 =?us-ascii?Q?Oox35z6QRgPi2Ov074JfQMdlkX0VyyKTZqrflbU/JWeF2NdQU+UjqiSj7h4B?=
 =?us-ascii?Q?TaiSzUMgEBni3FjEYCWt7uI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424eb311-8741-418e-c4f9-08d9ac1a06e3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 11:36:43.7061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlCnpObGBGKL5WihHgBDfd0X/XFWWldDxBFJ2+S3wSNyQjD1WP8pBUJL67BLULTEPvvM0DO28mo09mxv0eCcGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
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

