Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546FF477BCD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 19:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237953AbhLPSta (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 13:49:30 -0500
Received: from inva020.nxp.com ([92.121.34.13]:60482 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237453AbhLPSt3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 13:49:29 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F23A01A312A;
        Thu, 16 Dec 2021 19:49:27 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E4E4B1A3127;
        Thu, 16 Dec 2021 19:49:27 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6DC93202AD;
        Thu, 16 Dec 2021 19:49:26 +0100 (CET)
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
Subject: [RESEND v4 07/10] arm64: dts: freescale: Add lsio subsys dtsi for imx8dxl
Date:   Thu, 16 Dec 2021 20:48:11 +0200
Message-Id: <1639680494-23183-8-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

On i.MX8DXL, the LSIO subsystem includes below devices:

1x Inline Encryption Engine (IEE)
1x FlexSPI
4x Pulse Width Modulator (PWM)
5x General Purpose Timer (GPT)
8x GPIO
14x Message Unit (MU)
256KB On-Chip Memory (OCRAM)

compared to the common imx8-ss-lsio dtsi, some nodes' interrupt
property need to be updated.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
new file mode 100644
index 000000000000..d90602bab384
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019-2021 NXP
+ */
+&lsio_gpio0 {
+	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
+	interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_gpio1 {
+	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
+	interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_gpio2 {
+	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
+	interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_gpio3 {
+	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
+	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_gpio4 {
+	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
+	interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_gpio5 {
+	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
+	interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_gpio6 {
+	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
+	interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_gpio7 {
+	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
+	interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_mu0 {
+	compatible = "fsl,imx8dxl-mu", "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+	interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_mu1 {
+	compatible = "fsl,imx8-mu-scu", "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+	interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_mu2 {
+	compatible = "fsl,imx8-mu-scu", "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+	interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_mu3 {
+	compatible = "fsl,imx8-mu-scu", "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+	interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_mu4 {
+	compatible = "fsl,imx8-mu-scu", "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+	interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_mu5 {
+	compatible = "fsl,imx8-mu-scu", "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+	interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&lsio_mu13 {
+	compatible = "fsl,imx8-mu-scu", "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+	interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.31.1

