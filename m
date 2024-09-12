Return-Path: <linux-i2c+bounces-6651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790F9770AE
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A7E31F28249
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DBE1C3F0A;
	Thu, 12 Sep 2024 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCbvWJvQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88F1C2DD5;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165218; cv=none; b=kk45tJwVN3bIjyzpyVg6xgi6nrNXOsJPV7h9r9AOWTmIwia30TVE4hIhJ0ORBskGikiV3zBLRS3+OkrvrDn7nXDrqgGmlk8UxPI7dtetf73u4gHfFL5QCPrhbiD3O5uXLjpwlx3tyLy15wWXSEELwldbm1Sfzm/5Zl+17rRqj0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165218; c=relaxed/simple;
	bh=Uy8WNAx6IRK53oIlJahJOHkFJeKhttmrw7rJBLYAZg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrK/NXP1ekfmnLsjdh98kRm5ZFIQKRm8wmiyXh5hIssDWVjt7qP+ttLkUrrPBuVj2SEpDC7OOwN1Eh9HaFXbh3unCPgJRSVvEgMVYf4EalUZpsyuHEGm8QDe3H+mrane/NY1+0e2IVVaJpq24yl3OQGWy3TBFoT5Bl++iRCq98g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCbvWJvQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 875F0C4CED6;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=Uy8WNAx6IRK53oIlJahJOHkFJeKhttmrw7rJBLYAZg4=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=KCbvWJvQXBKPt/3N6EJK395t1RFtsSgRBrbMorNTTVWcNwHAjmpmLUhPmPuHWvlfJ
	 OMzclv8El/nh5ANu123HtdMwDbE2se3siQAYnBnaGKo3Rod+687Xo46Anq5CPV+Rdz
	 h34gHP+A+5DJBUMvt9POIJqglP4ymBe139il8bZFJVjehSg7wE/VdVbpDQFmBf+q/7
	 +8y/4+4vPtJlBq+4ZfWyujgh0YH2fY4rYTMZ/FaGjlaN9nPLqgOIPBwTYqtNc6MNLH
	 cmrt9Ws2ISwAR3ghT4YJnVt5uJ396pbVMmMArmFf9WPHY8MLKyv8RsQeFY/gI+3tXX
	 AeB/6cXncqD3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A251EEE25E;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:25:04 +0100
Subject: [PATCH 19/21] arm64: dts: adi: sc598: add device tree
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-19-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=13434;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=gZ+wPY1K1a7sq4LeaCpBlN6tpl7SEpOopm4S3bwpUQA=;
 b=LellgcuHUtjW5aI+l3dgRIs3S8FDlJkEZjSmYdG+kzYhFaNnnbVyTz8Cs6grSon5O4P3Heoak
 xbl6R7IXYa/BBGSIf3jYe9dA5WvlAmmLt0gDUViR3rYOnukCVcGIfNP
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add ADI SC598-EZKIT device tree.
Support UART console as output.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 arch/arm64/boot/dts/Makefile                |   1 +
 arch/arm64/boot/dts/adi/Makefile            |   2 +
 arch/arm64/boot/dts/adi/sc598-som-ezkit.dts |  14 ++
 arch/arm64/boot/dts/adi/sc598-som.dtsi      |  58 +++++
 arch/arm64/boot/dts/adi/sc59x-64.dtsi       | 367 ++++++++++++++++++++++++++++
 5 files changed, 442 insertions(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 21cd3a87f385309c3a655a67a3bee5f0abed7545..9b3996a8e01d8e7d264c44c075d7a50ee350ba44 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += actions
+subdir-y += adi
 subdir-y += airoha
 subdir-y += allwinner
 subdir-y += altera
diff --git a/arch/arm64/boot/dts/adi/Makefile b/arch/arm64/boot/dts/adi/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..1bf54bc97095e1ea3577953d379746fbc0ea02a9
--- /dev/null
+++ b/arch/arm64/boot/dts/adi/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SC59X_64) += sc598-som-ezkit.dtb
diff --git a/arch/arm64/boot/dts/adi/sc598-som-ezkit.dts b/arch/arm64/boot/dts/adi/sc598-som-ezkit.dts
new file mode 100644
index 0000000000000000000000000000000000000000..a8db6d5ea764f917faa6839d3d4f0b5217b927b8
--- /dev/null
+++ b/arch/arm64/boot/dts/adi/sc598-som-ezkit.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2021-2024 - Analog Devices Inc.
+ * Author: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
+ */
+
+/dts-v1/;
+
+#include "sc598-som.dtsi"
+
+/ {
+	model = "ADI 64-bit SC598 SOM EZ Kit";
+	compatible = "adi,sc598-som-ezkit", "adi,sc59x-64";
+};
diff --git a/arch/arm64/boot/dts/adi/sc598-som.dtsi b/arch/arm64/boot/dts/adi/sc598-som.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..3b90f367db1a24de1e1dddc4db3c219736c5b90f
--- /dev/null
+++ b/arch/arm64/boot/dts/adi/sc598-som.dtsi
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2021-2024 - Analog Devices Inc.
+ * Author: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/adi-adsp.h>
+#include "sc59x-64.dtsi"
+
+/ {
+	chosen {
+		stdout-path = &uart1;
+		bootargs = "earlycon=adi_uart,0x31003000 console=ttySC0,115200 mem=224M";
+	};
+
+	memory@90000000 {
+		device_type = "memory";
+		reg = <0x90000000 0x0e000000>;
+	};
+
+	memory@20040000 {
+		device_type = "memory";
+		reg = <0x20040000 0x40000>;
+	};
+
+	scb: scb-bus {
+		sec: sec@31089000 {
+			adi,sharc-cores = <2>;
+		};
+	};
+
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "disabled";
+};
+
+&pinctrl0 {
+	uart0_default: uart0-default-pins {
+		pins {
+			pinmux = <ADI_ADSP_PINMUX('A', 6, ADI_ADSP_PINFUNC_ALT1)>,
+				 <ADI_ADSP_PINMUX('A', 7, ADI_ADSP_PINFUNC_ALT1)>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/adi/sc59x-64.dtsi b/arch/arm64/boot/dts/adi/sc59x-64.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..4a9aa08b4acb0936c97e683562e05da063a4e193
--- /dev/null
+++ b/arch/arm64/boot/dts/adi/sc59x-64.dtsi
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2021-2024 - Analog Devices Inc.
+ * Author: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
+ */
+
+#include <dt-bindings/clock/adi-sc5xx-clock.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "ADI 64-bit SC59X";
+	compatible = "adi,sc59x-64";
+
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	chosen { };
+
+	aliases {
+		serial0 = &uart0;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	cpus {
+		#address-cells = <0x2>;
+		#size-cells = <0x0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0xdeadbeef>;
+			clocks = <&clk ADSP_SC598_CLK_ARM>, <&clk ADSP_SC598_CLK_DDR>;
+		};
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+	};
+
+	gic: interrupt-controller@31200000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x31200000 0x40000>, /* GIC Dist */
+		      <0x31240000 0x40000>; /* GICR */
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
+	};
+
+	clocks {
+		sys_clkin0: oscillator@1 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+			clock-output-names = "sys_clkin0";
+		};
+
+		sys_clkin1: oscillator@2 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+			clock-output-names = "sys_clkin1";
+		};
+	};
+
+	clk: clocks@3108d000 {
+		compatible = "adi,sc598-clocks";
+		reg = <0x3108d000 0x1000>,
+		      <0x3108e000 0x1000>,
+		      <0x3108f000 0x1000>,
+		      <0x310a9000 0x1000>;
+		#clock-cells = <1>;
+		clocks = <&sys_clkin0>, <&sys_clkin1>;
+		clock-names = "sys_clkin0", "sys_clkin1";
+		status = "okay";
+	};
+
+	scb: scb-bus {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		rcu: rcu@3108c000 {
+			compatible = "adi,reset-controller";
+			reg = <0x3108c000 0x1000>;
+			status = "okay";
+		};
+
+		sec: sec@31089000 {
+			compatible = "adi,system-event-controller";
+			reg = <0x31089000 0x1000>;
+			adi,rcu = <&rcu>;
+			status = "okay";
+		};
+
+		uart0: uart@31003000 {
+			compatible = "adi,uart";
+			reg = <0x31003000 0x40>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			interrupt-parent = <&gic>;
+			interrupt-names = "tx", "rx", "status";
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			adi,use-edbo;
+			status = "disabled";
+		};
+
+		uart1: uart@31003400 {
+			compatible = "adi,uart";
+			reg = <0x31003400 0x40>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			interrupt-parent = <&gic>;
+			interrupt-names = "tx", "rx", "status";
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			adi,use-edbo;
+			status = "disabled";
+		};
+
+		uart2: uart@31003800 {
+			compatible = "adi,uart";
+			reg = <0x31003800 0x40>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			interrupt-parent = <&gic>;
+			interrupt-names = "tx", "rx", "status";
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			adi,use-edbo;
+			status = "disabled";
+		};
+
+		uart3: uart@31003c00 {
+			compatible = "adi,uart";
+			reg = <0x31003C00 0x40>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			interrupt-parent = <&gic>;
+			interrupt-names = "tx", "rx", "status";
+			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			adi,use-edbo;
+			status = "disabled";
+		};
+
+		i2c0: twi@31001400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "adi,twi";
+			reg = <0x31001400 0xFF>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			clock-khz = <100>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			status = "disabled";
+		};
+
+		i2c1: twi@31001500 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "adi,twi";
+			reg = <0x31001500 0xFF>;
+			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+			clock-khz = <100>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			status = "disabled";
+		};
+
+		i2c3: twi@31001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "adi,twi";
+			reg = <0x31001000 0xFF>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			clock-khz = <100>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			status = "disabled";
+		};
+
+		i2c4: twi@31001100 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "adi,twi";
+			reg = <0x31001100 0xFF>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clock-khz = <100>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			status = "disabled";
+		};
+
+		i2c5: twi@31001200 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "adi,twi";
+			reg = <0x31001200 0xFF>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clock-khz = <100>;
+			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
+			clock-names = "sclk0";
+			status = "disabled";
+		};
+
+		pinctrl0: pinctrl@31004600 {
+			compatible = "adi,adsp-pinctrl";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x31004600 0x400>;
+			adi,port-sizes = <16 16 16 16 16 16 16 16 7>;
+		};
+
+		pint0: pint@31005000 {
+			compatible = "adi,adsp-pint";
+			reg = <0x31005000 0xFF>;
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pint1: pint@31005100 {
+			compatible = "adi,adsp-pint";
+			reg = <0x31005100 0xFF>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pint2: pint@31005200 {
+			compatible = "adi,adsp-pint";
+			reg = <0x31005200 0xFF>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pint3: pint@31005300 {
+			compatible = "adi,adsp-pint";
+			reg = <0x31005300 0xFF>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pint4: pint@31005400 {
+			compatible = "adi,adsp-pint";
+			reg = <0x31005400 0xFF>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pint5: pint@31005500 {
+			compatible = "adi,adsp-pint";
+			reg = <0x31005500 0xFF>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pint6: pint@31005600 {
+			compatible = "adi,adsp-pint";
+			reg = <0x31005600 0xFF>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pint7: pint@31005700 {
+			compatible = "adi,adsp-pint";
+			reg = <0x31005700 0xFF>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpa: gport@31004000 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004000 0x7F>;
+			gpio-ranges = <&pinctrl0 0 0 16>;
+			adi,pint = <&pint0 1>;
+			status = "okay";
+		};
+
+		gpb: gport@31004080 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004080 0x7F>;
+			gpio-ranges = <&pinctrl0 0 16 16>;
+			adi,pint = <&pint0 0>;
+			status = "okay";
+		};
+
+		gpc: gport@31004100 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004100 0x7F>;
+			gpio-ranges = <&pinctrl0 0 32 16>;
+			adi,pint = <&pint2 1>;
+			status = "okay";
+		};
+
+		gpd: gport@31004180 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004180 0x7F>;
+			gpio-ranges = <&pinctrl0 0 48 16>;
+			adi,pint = <&pint2 0>;
+		};
+
+		gpe: gport@31004200 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004200 0x7F>;
+			gpio-ranges = <&pinctrl0 0 64 16>;
+			adi,pint = <&pint4 1>;
+		};
+
+		gpf: gport@31004280 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004280 0x7F>;
+			gpio-ranges = <&pinctrl0 0 80 16>;
+			adi,pint = <&pint4 0>;
+		};
+
+		gpg: gport@31004300 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004300 0x7F>;
+			gpio-ranges = <&pinctrl0 0 96 16>;
+			adi,pint = <&pint6 1>;
+		};
+
+		gph: gport@31004380 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004380 0x7F>;
+			gpio-ranges = <&pinctrl0 0 112 16>;
+			adi,pint = <&pint6 0>;
+		};
+
+		gpi: gport@31004400 {
+			compatible = "adi,adsp-port-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x31004400 0x7F>;
+			gpio-ranges = <&pinctrl0 0 128 7>;
+			adi,pint = <&pint7 1>;
+		};
+
+	};
+};

-- 
2.25.1



