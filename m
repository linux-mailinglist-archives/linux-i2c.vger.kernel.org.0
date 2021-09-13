Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7885408779
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Sep 2021 10:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238517AbhIMIuE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Sep 2021 04:50:04 -0400
Received: from inva021.nxp.com ([92.121.34.21]:35240 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238217AbhIMIt1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Sep 2021 04:49:27 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D6264202A16;
        Mon, 13 Sep 2021 10:48:10 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C8ED3202A48;
        Mon, 13 Sep 2021 10:48:10 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 459E1202EC;
        Mon, 13 Sep 2021 10:48:10 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abel.vesa@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 05/10] arm64: dts: freescale: Add ddr subsys dtsi for imx8dxl
Date:   Mon, 13 Sep 2021 11:47:49 +0300
Message-Id: <1631522874-19862-6-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631522874-19862-1-git-send-email-abel.vesa@nxp.com>
References: <1631522874-19862-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

Add the ddr subsys dtsi for i.MX8DXL. Additional db pmu is added
compared to i.MX8QXP.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 .../boot/dts/freescale/imx8dxl-ss-ddr.dtsi    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
new file mode 100644
index 000000000000..75b482966d94
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 NXP
+ */
+
+&ddr_subsys {
+	db_ipg_clk: clock-db-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <456000000>;
+		clock-output-names = "db_ipg_clk";
+	};
+
+	db_pmu0: db-pmu@5ca40000 {
+		compatible = "fsl,imx8dxl-db-pmu";
+		reg = <0x5ca40000 0x10000>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&db_pmu0_lpcg IMX_LPCG_CLK_0>,
+			 <&db_pmu0_lpcg IMX_LPCG_CLK_1>;
+		clock-names = "ipg", "cnt";
+		power-domains = <&pd IMX_SC_R_PERF>;
+	};
+
+	db_pmu0_lpcg: clock-controller@5cae0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5cae0000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&db_ipg_clk>, <&db_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_1>;
+		clock-output-names = "perf_lpcg_cnt_clk",
+				     "perf_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_PERF>;
+	};
+};
-- 
2.31.1

