Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2678641AEA2
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Sep 2021 14:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240556AbhI1MTP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Sep 2021 08:19:15 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58508 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240528AbhI1MTO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Sep 2021 08:19:14 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 41E6D202844;
        Tue, 28 Sep 2021 14:17:34 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 34B72202836;
        Tue, 28 Sep 2021 14:17:34 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A8D612030E;
        Tue, 28 Sep 2021 14:17:33 +0200 (CEST)
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
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 00/11] arm64: dts: Add i.MX8DXL initial support
Date:   Tue, 28 Sep 2021 15:17:10 +0300
Message-Id: <1632831440-5880-1-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This allows i.MX8DXL EVK board to boot to prompt.

Changes since v1:
 * added commit message for the 8th, 9th and 10th patches

Abel Vesa (5):
  arm64: dts: imx8-ss-lsio: Add mu5a mailbox
  arm64: dts: freescale: Add adma subsystem dtsi for imx8dxl
  dt-bindings: fsl: scu: Add i.MX8DXL ocotp binding
  dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL compatible match
  dt-bindings: serial: fsl-lpuart: Add i.MX8DXL compatible

Jacky Bai (5):
  arm64: dts: freescale: Add the top level dtsi support for imx8dxl
  arm64: dts: freescale: Add the imx8dxl connectivity subsys dtsi
  arm64: dts: freescale: Add ddr subsys dtsi for imx8dxl
  arm64: dts: freescale: Add lsio subsys dtsi for imx8dxl
  arm64: dts: imx8dxl: Add i.MX8DXL evk board support

 .../bindings/arm/freescale/fsl,scu.txt        |   3 +-
 .../bindings/i2c/i2c-imx-lpi2c.yaml           |   2 +
 .../bindings/serial/fsl-lpuart.yaml           |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8-ss-lsio.dtsi      |   7 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 266 ++++++++++++++++++
 .../boot/dts/freescale/imx8dxl-ss-adma.dtsi   |  53 ++++
 .../boot/dts/freescale/imx8dxl-ss-conn.dtsi   | 137 +++++++++
 .../boot/dts/freescale/imx8dxl-ss-ddr.dtsi    |  36 +++
 .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   |  78 +++++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi    | 245 ++++++++++++++++
 11 files changed, 828 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl.dtsi

-- 
2.31.1

