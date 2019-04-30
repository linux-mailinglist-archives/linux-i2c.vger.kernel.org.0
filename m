Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9D6EFA9
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 06:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbfD3Ebf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 00:31:35 -0400
Received: from inva020.nxp.com ([92.121.34.13]:51596 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbfD3Ebc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 00:31:32 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0FE841A0013;
        Tue, 30 Apr 2019 06:31:30 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 45E801A00ED;
        Tue, 30 Apr 2019 06:31:21 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 65CD840318;
        Tue, 30 Apr 2019 12:31:10 +0800 (SGT)
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, leoyang.li@nxp.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com,
        wsa+renesas@sang-engineering.com, u.kleine-koenig@pengutronix.de,
        eha@deif.com, linux@rempel-privat.de, sumit.batra@nxp.com,
        l.stach@pengutronix.de, peda@axentia.se,
        Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH 3/3] arm64: dts: fsl: ls1046a: Add mul-value property of the i2c controller nodes
Date:   Tue, 30 Apr 2019 12:32:42 +0800
Message-Id: <20190430043242.29687-3-chuanhua.han@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430043242.29687-1-chuanhua.han@nxp.com>
References: <20190430043242.29687-1-chuanhua.han@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

According to LS1046A Reference Manual, for the i2c controller, you have
up to three MUL options available for all divider values. Therefore, we
need to determine which MUL to use in the device tree for driver use.

The "mul-value" property provides which mul is used in our driver.

Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index b0ef08b090dd..373310e4c0ea 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -385,6 +385,7 @@
 			dmas = <&edma0 1 39>,
 			       <&edma0 1 38>;
 			dma-names = "tx", "rx";
+			mul-value = <4>;
 			status = "disabled";
 		};
 
@@ -395,6 +396,7 @@
 			reg = <0x0 0x2190000 0x0 0x10000>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen 4 1>;
+			mul-value = <4>;
 			status = "disabled";
 		};
 
@@ -405,6 +407,7 @@
 			reg = <0x0 0x21a0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen 4 1>;
+			mul-value = <4>;
 			status = "disabled";
 		};
 
@@ -415,6 +418,7 @@
 			reg = <0x0 0x21b0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen 4 1>;
+			mul-value = <4>;
 			status = "disabled";
 		};
 
-- 
2.17.1

