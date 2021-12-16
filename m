Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD9B477BBE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 19:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235440AbhLPStZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 13:49:25 -0500
Received: from inva021.nxp.com ([92.121.34.21]:53364 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231334AbhLPStZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 13:49:25 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 81F7B201A8A;
        Thu, 16 Dec 2021 19:49:23 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 71B1820130F;
        Thu, 16 Dec 2021 19:49:23 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 01212202AD;
        Thu, 16 Dec 2021 19:49:21 +0100 (CET)
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
Subject: [RESEND v4 00/10] arm64: dts: Add i.MX8DXL initial support
Date:   Thu, 16 Dec 2021 20:48:04 +0200
Message-Id: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Here is the v4:
https://lore.kernel.org/linux-arm-kernel/1636566415-22750-1-git-send-email-abel.vesa@nxp.com/

No changes since v4.

The following patches have been applied since v4 was sent:

[PATCH v4 01/12] dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QM compatible matching
[PATCH v4 11/12] dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL compatible match 

Abel Vesa (5):
  dt-bindings: serial: fsl-lpuart: Fix i.MX 8QM compatible matching
  arm64: dts: imx8-ss-lsio: Add mu5a mailbox
  arm64: dts: freescale: Add adma subsystem dtsi for imx8dxl
  dt-bindings: fsl: scu: Add i.MX8DXL ocotp binding
  dt-bindings: serial: fsl-lpuart: Add i.MX8DXL compatible

Jacky Bai (5):
  arm64: dts: freescale: Add the top level dtsi support for imx8dxl
  arm64: dts: freescale: Add the imx8dxl connectivity subsys dtsi
  arm64: dts: freescale: Add ddr subsys dtsi for imx8dxl
  arm64: dts: freescale: Add lsio subsys dtsi for imx8dxl
  arm64: dts: imx8dxl: Add i.MX8DXL evk board support

 .../bindings/arm/freescale/fsl,scu.txt        |   3 +-
 .../bindings/serial/fsl-lpuart.yaml           |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8-ss-lsio.dtsi      |   7 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 266 ++++++++++++++++++
 .../boot/dts/freescale/imx8dxl-ss-adma.dtsi   |  53 ++++
 .../boot/dts/freescale/imx8dxl-ss-conn.dtsi   | 137 +++++++++
 .../boot/dts/freescale/imx8dxl-ss-ddr.dtsi    |  36 +++
 .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   |  78 +++++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi    | 245 ++++++++++++++++
 10 files changed, 832 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl.dtsi

-- 
2.31.1

