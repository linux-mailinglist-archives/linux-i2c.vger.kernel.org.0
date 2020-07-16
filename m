Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEAE2228EF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 19:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbgGPRSz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 13:18:55 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52329 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729364AbgGPRSy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 13:18:54 -0400
X-IronPort-AV: E=Sophos;i="5.75,360,1589209200"; 
   d="scan'208";a="52107174"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2020 02:18:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5954B40B5142;
        Fri, 17 Jul 2020 02:18:47 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Cc:     linux-ide@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 02/20] arm64: dts: renesas: r8a774e1: Add PCIe device nodes
Date:   Thu, 16 Jul 2020 18:18:17 +0100
Message-Id: <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add PCIe{0,1} device nodes for R8A774E1 SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 47 ++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 001874af8cf2..5805541b7882 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -1517,12 +1517,57 @@
 		};
 
 		pciec0: pcie@fe000000 {
+			compatible = "renesas,pcie-r8a774e1",
+				     "renesas,pcie-rcar-gen3";
 			reg = <0 0xfe000000 0 0x80000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 319>;
 			status = "disabled";
+		};
 
-			/* placeholder */
+		pciec1: pcie@ee800000 {
+			compatible = "renesas,pcie-r8a774e1",
+				     "renesas,pcie-rcar-gen3";
+			reg = <0 0xee800000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000>,
+				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
+				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
+				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 318>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 318>;
+			status = "disabled";
 		};
 
 		hdmi0: hdmi@fead0000 {
-- 
2.17.1

