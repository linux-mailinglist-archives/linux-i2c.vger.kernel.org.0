Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346DE41E8C2
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 10:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352745AbhJAIOW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 04:14:22 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49420 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352666AbhJAIOH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 Oct 2021 04:14:07 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 18AC01A0F4C;
        Fri,  1 Oct 2021 10:12:22 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0AC591A05ED;
        Fri,  1 Oct 2021 10:12:22 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7451F202F7;
        Fri,  1 Oct 2021 10:12:21 +0200 (CEST)
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
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [RESEND v2 04/10] arm64: dts: freescale: Add the imx8dxl connectivity subsys dtsi
Date:   Fri,  1 Oct 2021 11:11:29 +0300
Message-Id: <1633075894-10214-5-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633075894-10214-1-git-send-email-abel.vesa@nxp.com>
References: <1633075894-10214-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

On i.MX8DXL, the Connectivity subsystem includes below peripherals:
1x ENET with AVB support, 1x ENET with TSN support, 2x USB OTG,
1x eMMC, 2x SD, 1x NAND.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 .../boot/dts/freescale/imx8dxl-ss-conn.dtsi   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
new file mode 100644
index 000000000000..b0059296a03f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019-2021 NXP
+ */
+
+/delete-node/ &enet1_lpcg;
+/delete-node/ &fec2;
+
+&conn_subsys {
+	conn_enet0_root_clk: clock-conn-enet0-root {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <250000000>;
+		clock-output-names = "conn_enet0_root_clk";
+	};
+
+	eqos: ethernet@5b050000 {
+		compatible = "nxp,imx8dxl-dwmac-eqos", "snps,dwmac-5.10a";
+		reg = <0x5b050000 0x10000>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "eth_wake_irq", "macirq";
+		clocks = <&eqos_lpcg IMX_LPCG_CLK_2>,
+			 <&eqos_lpcg IMX_LPCG_CLK_4>,
+			 <&eqos_lpcg IMX_LPCG_CLK_0>,
+			 <&eqos_lpcg IMX_LPCG_CLK_3>,
+			 <&eqos_lpcg IMX_LPCG_CLK_1>;
+		clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "mem";
+		assigned-clocks = <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <125000000>;
+		power-domains = <&pd IMX_SC_R_ENET_1>;
+		clk_csr = <0>;
+		status = "disabled";
+	};
+
+	usbotg2: usb@5b0e0000 {
+		compatible = "fsl,imx8dxl-usb", "fsl,imx7ulp-usb";
+		reg = <0x5b0e0000 0x200>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+		fsl,usbphy = <&usbphy2>;
+		fsl,usbmisc = <&usbmisc2 0>;
+		/*
+		 * usbotg1 and usbotg2 share one clcok
+		 * scfw disable clock access and keep it always on
+		 * in case other core (M4) use one of these.
+		 */
+		clocks = <&clk_dummy>;
+		ahb-burst-config = <0x0>;
+		tx-burst-size-dword = <0x10>;
+		rx-burst-size-dword = <0x10>;
+		#stream-id-cells = <1>;
+		power-domains = <&pd IMX_SC_R_USB_1>;
+		status = "disabled";
+	};
+
+	usbmisc2: usbmisc@5b0e0200 {
+		#index-cells = <1>;
+		compatible = "fsl,imx8dxl-usbmisc", "fsl,imx7ulp-usbmisc";
+		reg = <0x5b0e0200 0x200>;
+	};
+
+	usbphy2: usbphy@0x5b110000 {
+		compatible = "fsl,imx8dxl-usbphy", "fsl,imx7ulp-usbphy";
+		reg = <0x5b110000 0x1000>;
+		clocks = <&usb2_2_lpcg IMX_LPCG_CLK_7>;
+		status = "disabled";
+	};
+
+	eqos_lpcg: clock-controller@5b240000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5b240000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&conn_enet0_root_clk>,
+			 <&conn_axi_clk>,
+			 <&conn_axi_clk>,
+			 <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>,
+			 <&conn_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_2>,
+				<IMX_LPCG_CLK_4>,
+				<IMX_LPCG_CLK_5>,
+				<IMX_LPCG_CLK_6>;
+		clock-output-names = "eqos_ptp",
+				     "eqos_mem_clk",
+				     "eqos_aclk",
+				     "eqos_clk",
+				     "eqos_csr_clk";
+		power-domains = <&pd IMX_SC_R_ENET_1>;
+	};
+
+	usb2_2_lpcg: clock-controller@5b280000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5b280000 0x10000>;
+		#clock-cells = <1>;
+
+		clock-indices = <IMX_LPCG_CLK_7>;
+		clocks = <&conn_ipg_clk>;
+		clock-output-names = "usboh3_2_phy_ipg_clk";
+	};
+
+};
+
+&enet0_lpcg {
+	clocks = <&conn_enet0_root_clk>,
+		 <&conn_enet0_root_clk>,
+		 <&conn_axi_clk>,
+		 <&clk IMX_SC_R_ENET_0 IMX_SC_C_TXCLK>,
+		 <&conn_ipg_clk>,
+		 <&conn_ipg_clk>;
+};
+
+&fec1 {
+	compatible = "fsl,imx8dxl-fec", "fsl,imx8qm-fec";
+	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+	assigned-clocks = <&clk IMX_SC_R_ENET_0 IMX_SC_C_CLKDIV>;
+	assigned-clock-rates = <125000000>;
+};
+
+&usdhc1 {
+	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
+	interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&usdhc2 {
+	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
+	interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&usdhc3 {
+	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
+	interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.31.1

