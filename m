Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B51D4787B3
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhLQJeK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:34:10 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:56784 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbhLQJeA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733641; x=1671269641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xbuNbGxwaRISCrzpjxPbl32Mgk4lu41GmI/U/9QTUTc=;
  b=xpuWggyp6G0Gcg6Dh0Be+VHUyusOTxmu2LpSsQj+CrxqH+Pev968c28w
   ZPemstIqeaMpKJB0kpBPMClWqmlnh7S7GilHr32FA2rBQC6FZiC0W+JKM
   vIowxjHA9T/Vd6JESLwFuHS9Ip0dkq7nu+HMiTiC5JagOlSC4nR2hVcsH
   BrIrnBxRt18uMksQWXc/wU9INrCY7Euz5xdPITqqvvC8TuzsHGcfQfF9Y
   KPqwKs1rPhTGb+8XDD/gFIvlZz6PMTPBV08SLR2eN1HKto/LMD73WKkgc
   T0OaDyxNzaSkUuhxV06LCXMTr1sG9F1YK47mr9gVdH6KSF+vs2/a+OnHa
   Q==;
IronPort-SDR: vAwU/8kCy/WcpN7j3TK8C+dbCFG87TIelPffRbBLz+zkY4IizVlZQ/4m2vDLIL/B9Ot8FMxUeG
 nbxC+uoY1dLTur1C8pd/FNjbwm0xS95dKe5rJNiS2HWzRdSLhIR5eUEk1nKzKV16BzhtFJB9Xs
 s19LFKjjULWUAcnysft+qpMibZyZdhFal0JlGLmS8mAO3YawHmeASfyhuRGr0EIIYMxd3R66Kp
 xaecjJXQva0Fs85AJjged62azzGKV0YSHlALuPDMahFEbnonbrFn4WcWKLSvorGpf551SAmnDe
 6Pt6BMtFJOzwzc8gw40o1Cd5
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147002799"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:34:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:33:48 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atish.patra@wdc.com>
Subject: [PATCH v2 16/17] riscv: dts: microchip: update peripherals in icicle kit device tree
Date:   Fri, 17 Dec 2021 09:33:24 +0000
Message-ID: <20211217093325.30612-17-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add new peripherals to the MPFS, and enable them in the Icicle kit device tree:

2x SPI, QSPI, 3x GPIO, 2x I2C, Real Time Counter, PCIE controller,
USB host & system controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   |  53 ++++++
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 171 ++++++++++++++++++
 2 files changed, 224 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index f6542ef76046..13172dec8e9f 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -80,6 +80,26 @@ &mmc {
 	sd-uhs-sdr104;
 };
 
+&spi0 {
+	status = "okay";
+};
+
+&spi1 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
 &mac0 {
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
@@ -99,6 +119,39 @@ phy0: ethernet-phy@8 {
 	};
 };
 
+&gpio2 {
+	interrupts = <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>;
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&mbox {
+	status = "okay";
+};
+
+&syscontroller {
+	status = "okay";
+};
+
+&pcie {
+	status = "okay";
+};
+
 &corePWM0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index d311c5ea27c9..2de9b23af46d 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -276,6 +276,69 @@ mmc: mmc@20008000 {
 			status = "disabled";
 		};
 
+		spi0: spi@20108000 {
+			compatible = "microchip,mpfs-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20108000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <54>;
+			clocks = <&clkcfg CLK_SPI0>;
+			spi-max-frequency = <25000000>;
+			num-cs = <8>;
+			status = "disabled";
+		};
+
+		spi1: spi@20109000 {
+			compatible = "microchip,mpfs-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20109000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <55>;
+			clocks = <&clkcfg CLK_SPI1>;
+			spi-max-frequency = <25000000>;
+			num-cs = <8>;
+			status = "disabled";
+		};
+
+		qspi: spi@21000000 {
+			compatible = "microchip,mpfs-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x21000000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <85>;
+			clocks = <&clkcfg CLK_QSPI>;
+			spi-max-frequency = <25000000>;
+			num-cs = <8>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@2010a000 {
+			compatible = "microchip,mpfs-i2c";
+			reg = <0x0 0x2010a000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <58>;
+			clocks = <&clkcfg CLK_I2C0>;
+			clock-frequency = <100000>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@2010b000 {
+			compatible = "microchip,mpfs-i2c";
+			reg = <0x0 0x2010b000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <61>;
+			clocks = <&clkcfg CLK_I2C1>;
+			clock-frequency = <100000>;
+			status = "disabled";
+		};
+
 		mac0: ethernet@20110000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
@@ -301,5 +364,113 @@ mac1: ethernet@20112000 {
 			clock-names = "pclk", "hclk";
 			status = "disabled";
 		};
+
+		gpio0: gpio@20120000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <0x0 0x20120000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio@20121000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <000 0x20121000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio@20122000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <0x0 0x20122000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		rtc: rtc@20124000 {
+			compatible = "microchip,mpfs-rtc";
+			reg = <0x0 0x20124000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <80>, <81>;
+			clocks = <&clkcfg CLK_RTC>;
+			clock-names = "rtc";
+			status = "disabled";
+		};
+
+		usb: usb@20201000 {
+			compatible = "microchip,mpfs-musb";
+			reg = <0x0 0x20201000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <86>, <87>;
+			clocks = <&clkcfg CLK_USB>;
+			interrupt-names = "dma","mc";
+			status = "disabled";
+		};
+
+		pcie: pcie@2000000000 {
+			compatible = "microchip,pcie-host-1.0";
+			#address-cells = <0x3>;
+			#interrupt-cells = <0x1>;
+			#size-cells = <0x2>;
+			device_type = "pci";
+			reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
+			reg-names = "cfg", "apb";
+			bus-range = <0x0 0x7f>;
+			interrupt-parent = <&plic>;
+			interrupts = <119>;
+			interrupt-map = <0 0 0 1 &pcie_intc 0>,
+					<0 0 0 2 &pcie_intc 1>,
+					<0 0 0 3 &pcie_intc 2>,
+					<0 0 0 4 &pcie_intc 3>;
+			interrupt-map-mask = <0 0 0 7>;
+			clocks = <&clkcfg CLK_FIC0>, <&clkcfg CLK_FIC1>, <&clkcfg CLK_FIC3>;
+			clock-names = "fic0", "fic1", "fic3";
+			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
+			msi-parent = <&pcie>;
+			msi-controller;
+			microchip,axi-m-atr0 = <0x10 0x0>;
+			status = "disabled";
+			pcie_intc: legacy-interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		mbox: mailbox@37020000 {
+			compatible = "microchip,mpfs-mailbox";
+			reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318C 0x0 0x40>;
+			interrupt-parent = <&plic>;
+			interrupts = <96>;
+			#mbox-cells = <1>;
+			status = "disabled";
+		};
+
+		syscontroller: syscontroller {
+			compatible = "microchip,mpfs-sys-controller", "simple-mfd";
+			mboxes = <&mbox 0>;
+
+			hwrandom: hwrandom {
+				compatible = "microchip,mpfs-rng";
+			};
+
+			sysserv: sysserv {
+				compatible = "microchip,mpfs-generic-service";
+			};
+		};
 	};
 };
-- 
2.33.1

