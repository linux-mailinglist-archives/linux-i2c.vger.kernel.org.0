Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDEF4906AB
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 12:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239001AbiAQLHC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 06:07:02 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:32509 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238988AbiAQLHA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 06:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642417620; x=1673953620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kM9r1xW/DHGqgb4EQRJlkwePmu9HkhIfNKIm9H/2uhU=;
  b=gynnwEx86HClbEdJtS4gOcRV7W60mr5Gh7XlFYosnOFQ2zy8OrhzPP3t
   fOSfjHSwVXOyFdX2ee/nE6kcQeStDGLpPIdR+FLGgaAG6UVMbpDHq0a46
   tA5mgLcD9KSm3Cu66/GM0CvWv/gFccr0haUq4zpsDazXvJj4A/ivmXhtU
   ToBCTXx+8enYzsjvxLtF+aGs/+6H+n2EVj5VEBrNDBSYXWlMNelhIJoS0
   /qfRzyxuXcUsnnwQFFCCwam3iesRFv0blg2YmaXlcmmcya3//2Aj0BtxL
   GhUI8pzcd6Z3BWxB+jhlxhnUn8IH5ePqo/rF75qIa26lm83dINWiAcn5d
   g==;
IronPort-SDR: rL7MqIuYxT/nV8q++65dJNBx1ujqOnv2+nEcs4KeIpuTq1aMXzh10f8x0jP/7NWtJ5X8e4Fwiv
 qO47FFq5+lTGcJvd0xFFT+kvhJ2XNE04sSa3l8ELxufC5EYjMRbb310HC8bjndBau6CS6+8Pqd
 1cg3FZ41uy1+F5LM4OIJSYgj6pFE5uDjKp2x7idr2oybylDfktaj1O3JSoTdkN7Z2tqI3C2X7S
 mK13tmQZ9WNHsPlMgNX9BA4uD0cTPi94aedNevmJAWAjgYydBur/iYryfm26YEGXEzUhyUvvCn
 JIQQU0A6row2myBbV+x1OktE
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="82713566"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2022 04:06:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:06:58 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 17 Jan 2022 04:06:52 -0700
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
        <atishp@rivosinc.com>
Subject: [PATCH v4 10/14] riscv: dts: microchip: add fpga fabric section to icicle kit
Date:   Mon, 17 Jan 2022 11:07:51 +0000
Message-ID: <20220117110755.3433142-11-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Split the device tree for the Microchip MPFS into two sections by adding
microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
FPGA fabric.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/microchip-mpfs-fabric.dtsi  | 25 +++++++++++++++++++
 .../microchip/microchip-mpfs-icicle-kit.dts   |  8 ++++++
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  1 +
 3 files changed, 34 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
new file mode 100644
index 000000000000..c1dcd56b0679
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
+
+/ {
+	core_pwm0: pwm@41000000 {
+		compatible = "microchip,corepwm-rtl-v4";
+		reg = <0x0 0x41000000 0x0 0xF0>;
+		microchip,sync-update = /bits/ 16 <0>;
+		#pwm-cells = <2>;
+		clocks = <&clkcfg CLK_FIC3>;
+		status = "disabled";
+	};
+
+	i2c2: i2c@44000000 {
+		compatible = "microchip,corei2c-rtl-v7";
+		reg = <0x0 0x44000000 0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&clkcfg CLK_FIC3>;
+		interrupt-parent = <&plic>;
+		interrupts = <122>;
+		clock-frequency = <100000>;
+		status = "disabled";
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 6d19ba196f12..ab803f71626a 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -68,6 +68,10 @@ &mmc {
 	sd-uhs-sdr104;
 };
 
+&i2c2 {
+	status = "okay";
+};
+
 &emac0 {
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
@@ -86,3 +90,7 @@ phy1: ethernet-phy@9 {
 		ti,fifo-depth = <0x01>;
 	};
 };
+
+&core_pwm0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 717e39b30a15..c7d73756c9b8 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -3,6 +3,7 @@
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
+#include "microchip-mpfs-fabric.dtsi"
 
 / {
 	#address-cells = <2>;
-- 
2.32.0

