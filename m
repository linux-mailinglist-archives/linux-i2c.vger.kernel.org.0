Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B0F41E8BF
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 10:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352700AbhJAIOH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 04:14:07 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52678 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231332AbhJAIOF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 Oct 2021 04:14:05 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C539C2019B3;
        Fri,  1 Oct 2021 10:12:20 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B770C2019AE;
        Fri,  1 Oct 2021 10:12:20 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2B23B202F7;
        Fri,  1 Oct 2021 10:12:20 +0200 (CEST)
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
        Abel Vesa <abel.vesa@nxp.com>
Subject: [RESEND v2 02/10] arm64: dts: imx8-ss-lsio: Add mu5a mailbox
Date:   Fri,  1 Oct 2021 11:11:27 +0300
Message-Id: <1633075894-10214-3-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633075894-10214-1-git-send-email-abel.vesa@nxp.com>
References: <1633075894-10214-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The mailbox of the lsio mu5a is used by rpmsg on imx8qxp and
imx8dxl platforms.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
index ee4e585a9c39..76abdab40c75 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
@@ -141,6 +141,13 @@ lsio_mu4: mailbox@5d1f0000 {
 		status = "disabled";
 	};
 
+	lsio_mu5: mailbox@5d200000 {
+		reg = <0x5d200000 0x10000>;
+		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_MU_5A>;
+	};
+
 	lsio_mu13: mailbox@5d280000 {
 		reg = <0x5d280000 0x10000>;
 		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.31.1

