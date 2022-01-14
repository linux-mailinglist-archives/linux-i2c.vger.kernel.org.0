Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB2148ECD3
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242981AbiANPR4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:17:56 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:31154 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242879AbiANPRl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173461; x=1673709461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kM9r1xW/DHGqgb4EQRJlkwePmu9HkhIfNKIm9H/2uhU=;
  b=USNLFQ9IsJNxeS+VO4Cwh3wd70GtRLrA5NScM2yChrFQ7zyGWa9xAsNE
   IgHDCWE1eIJXZ+dOMVjUU94vOTYMfImfOt3T871PbnS8T5QA7gcWzePx7
   iO58v09+7Cz1XKytnAd2ZOz8mZ5ecEWka7/RTFlzV1VQnlUwE0m8zkQ43
   cESaCRwNRhmhYGBIoPETZoIgL/dkmEao6hGVijRZypvmH4aSemSWGxF3T
   pCxzyAdahDhGXeKrDVgP6OW+Lkex4hEg6pyOmsYKGZHBmSI8b93Wh4Djk
   z4kgwXjy+wmfW8qmSsKReLBVZa1jtXlwpCoasdVYEymn40LZOtM1auEcj
   g==;
IronPort-SDR: flvwLCvaUCa3lb0zO52vfC5pG6GWgKazqygOad63cnrhwWwQzzSR28a2uyCZo6pL/1OmUBBV9x
 SXQZO7ANhbXtHZDIEBII+mC87suKU2HKnum3nmZn27OlHHGzEhQ05HKtkYOvXjhK/1j1eWpZ1w
 aTxqyo2MNvHYztUL9UHX5ZMP15SFB35T4MdfUktzzKN2c5yO9w8yBBL2VcDMk/rnQ+M3R4vlB7
 1DMe5OoI1/OhGtWTvxwlIQRCrMyCwB5SyHEBgifxGrU8vPj5VvwX/r53VuabGaip+jJjhZbwAe
 s1D+RxO3w78bxTaTj7VGhoTj
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="82522738"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:17:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:17:39 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:17:33 -0700
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
Subject: [PATCH v3 11/15] riscv: dts: microchip: add fpga fabric section to icicle kit
Date:   Fri, 14 Jan 2022 15:17:23 +0000
Message-ID: <20220114151727.2319915-12-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
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

