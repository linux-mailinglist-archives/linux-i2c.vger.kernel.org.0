Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22E44A45FE
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 12:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376560AbiAaLsr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 06:48:47 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:59027 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359866AbiAaLqe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 06:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643629594; x=1675165594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+fJlPFSSN0ii63iRUJ15zIuZHHuLMnPjBm4GFoBf9rM=;
  b=MjkjD6pI48+U8LJ1euzv3oSsN5HfETPYPTiO0k+oJxHv0B7dhsbcVi4A
   wPRF/SaT/Qw54xKmh3ucaDMs8J6hGmJS/s54yl/tXER0DiSVSqCJNu5HH
   jijnLqODbYmgfYamoRDYZJnwUhKUEfIR0B/ihQZnTECpyyqfS5JX3nJgr
   Njeox6fSm7+0V/6lfYmDa+0VEj2olPe1PDJ9gXQg4uJ/sL83XVUUX5jKV
   WL21Vzp2iX6JIIL4Q3vCpfWiU4aNd44ZKP8cO9+oRNt3iwojfSSuR9rWn
   OQTWIyPQFhQzEHBxJHZR7Xgsm1Ev0jLx4JJgh/xmTCnQG904TzpEGdSqI
   g==;
IronPort-SDR: toC4+UTyAC9LERMulsE8dX0vIbta+3e/2sJSeagC6Nrx+scaESRj6ROe+t+gP14QrhWoRDCwCp
 WfyKRGQ74mF4M5KZSZKTtKIofmiI+5s/gAmsCcqduqkvTwzHfNF49wrxz8llE1aEejkijSbfRh
 hUxJvs8CeEj9HcZBDX9bIc0JMYlrsM/Y0hYXi8uJfyQ/m9adkoVg9OjiPcgweJjg7NRhnMJ4oo
 wR9+LwxEwAV6bLUZzNOlrZqUgpTQcfJt8HuvUk9V9mI+SJ5KynQtCy9iINJjlTfy/cz1LCvG3k
 eTB3cYyGQ0gubSIq2Po05QQ5
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="160544999"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2022 04:46:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:46:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 31 Jan 2022 04:46:10 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC:     <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v5 08/12] riscv: dts: microchip: add fpga fabric section to icicle kit
Date:   Mon, 31 Jan 2022 11:47:23 +0000
Message-ID: <20220131114726.973690-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
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
2.35.0

