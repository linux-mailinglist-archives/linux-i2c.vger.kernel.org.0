Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC6B47879B
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbhLQJdw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:33:52 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:26609 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234394AbhLQJdm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733622; x=1671269622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=08O5L+Vs/pfxTkYpw2ToEdxBlp8zXskW7qyLhr7gK4Q=;
  b=AlcGDm++crhjIO5YWESNOamOB37pFuyJ6VayJYk6ahPMujZkrX+7A1uC
   Gmk71UWbtNzjQBB4MVLL8EDgCT7i71qyPqRdxc3j2IxzPmKlJfuxZTUZk
   C3luSLsCPEAcVR2cBZy4pW2G0cS31xGg9Rxs0tIldsBhY4zHsdoz9Jzdr
   JmCox5H4nvZ6pTEsKH3zpWgeJ2oPpuzgmYNlmJpJWZuiP/88kadWSHBxv
   +3+sQPvDuxN2Js70J0t1KRTZnF+ax8NPOq3lwkshvWCMT8C4iW9l716BQ
   47uY/9oa/bKU8rw9Aw2Ie9udhVTo1KrMkTC5uxcxAG6efOjhXJRBsZK0L
   Q==;
IronPort-SDR: OPeD8Xq9K/xtGE+uXgMX8U+Cowx6RTjIOi95eGMaHFWSt7Wgf9vVIsGaww+Bf1UhPXWOpMAeA2
 C2vpW2xpQD069ptL1LY3zKfb+KnD1bNW7A0N+xYl6Hj1BUHWDaD86RWyK+mG37Y142N4RrKuVX
 ilXyd9udOzauCTf2J0rV+SX+ImSwnSeVHdS/HaFJ1HFfmhae5cpSYyINua6DFDJmWXyer5i5aZ
 /fA2Jap3W+v390TG3akXBJT1sjaHvwYBtSnLvWWUIgJlWWlCT3wDGkhuqEhjFjg4J87nBUr7DX
 xm7buOaMRCaLidPBcR93hn1R
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147571179"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:33:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:40 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:33:35 -0700
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
Subject: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section to icicle kit
Date:   Fri, 17 Dec 2021 09:33:22 +0000
Message-ID: <20211217093325.30612-15-conor.dooley@microchip.com>
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

Split the device tree for the Microchip MPFS into two sections by adding
microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
FPGA fabric.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/microchip-mpfs-fabric.dtsi   | 13 +++++++++++++
 .../dts/microchip/microchip-mpfs-icicle-kit.dts     |  4 ++++
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi   |  1 +
 3 files changed, 18 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
new file mode 100644
index 000000000000..234c1f9bea40
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
+
+/ {
+	corePWM0: pwm@41000000 {
+		compatible = "microchip,corepwm";
+		reg = <0x0 0x41000000 0x0 0xF0>;
+		microchip,sync-update = /bits/ 8 <0>;
+		#pwm-cells = <2>;
+		clocks = <&clkcfg CLK_FIC3>;
+		status = "disabled";
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 6d19ba196f12..174f977c164b 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -86,3 +86,7 @@ phy1: ethernet-phy@9 {
 		ti,fifo-depth = <0x01>;
 	};
 };
+
+&corePWM0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index ce9151edd1b6..808500be26c3 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -4,6 +4,7 @@
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
 #include "dt-bindings/interrupt-controller/riscv-hart.h"
+#include "microchip-mpfs-fabric.dtsi"
 
 / {
 	#address-cells = <2>;
-- 
2.33.1

