Return-Path: <linux-i2c+bounces-14562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4FBCBF297
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 18:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78A5C301BCD4
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803EE33D6FE;
	Mon, 15 Dec 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="KIb6dELm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F3F33BBC0
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816765; cv=none; b=P7BxkFEjNHMvhAEFUdYcBda1W5P5yd2LtoT4rcO4xReC+kGG5TFz2uVoKAfaSzZnlGHEhjBU6k/HroYK+eiKkpGTbwfBgVNYAWrlaVoqbiBevwzmWL59n8JaiCvpghokq6agSWrN9ezOmxcb5B7ooKsPMDZYtMcVolmdea7Jff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816765; c=relaxed/simple;
	bh=mlFnmlaUzPjU4vJlQ+AT4Cwx7NsbLl4m+5vs+lqei2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KF/lk2yzZLt6rrJIxONZ9Z3b2q5DpEKxWATsvgJ7RULSbDrHZp5BNZmIZzUtTCvX2eq0aJGbWFpNwDJfYID7yd1NAw03hDDAX0ktZ/uCdMAsrumUyWwne5LlWh1z8QpD3cqkzIju2MVMtRU1iWWSRJnnCbb5+0CMGID+V/1/FOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=KIb6dELm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47774d3536dso37511435e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816752; x=1766421552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOoWnK0gf2o6iG3x9q5l/DfQ9p+Pp5dHWYttnlxZz9g=;
        b=KIb6dELmoDJcFTYbmHlk8lC/caD7trxaTqkFdkGZXfM4Rx+Ss/CDt/5pO6pvMWex0r
         jzZZva9O45ZkW3uyPsBbbu1I2/kImDdZK1KOO84gejYEFkn8Sr6o77tzsyzsSmm7d2b2
         d8UtubBOz8TGbqeQ7B1KlFj5p9X6qe7muWjTJwzL/oNsFJgS6wZ/fh8jldGZo9drm/hs
         lDlCpaWaXWXRQ7k93LgAa9NdUjTlSZQu59TU3KEgRKz8DvJpjQuBuAS2RVulQZ3TlHXc
         NwPm5Naak7/rmy91V1Q3jRctlwfDLB3FIsARpgU2uRS5Du9vErtvHYFt6eezv6uWGF12
         bgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816752; x=1766421552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOoWnK0gf2o6iG3x9q5l/DfQ9p+Pp5dHWYttnlxZz9g=;
        b=KQ6Gk0X9AvNlck/9tSKFbNsdoPLGPaQtxAIlmZJZUKHtOCyNEUcPvZ5F/ONaq3kl5+
         QSviDcG6I3CG2qG43hoDQi/M93KQQu/TCbYDEPVcACA+9cmv89A6aoARpcy+PdqpLls6
         3JmfXET1ABFUoaPn/ADAWrnLn6DuBFaJ7cxWu9B1RAAKfKuUG7zdq6wY6VjqFLIrruB4
         YN4rpvBpBUvtoYCCCX31wZ/iUGa/7Z4qgfy/+N7ZFYFpze0kxoZja9r3ZFR/NHMHKKv+
         JeUJH0XX1dIIUUXLqbdaAVg+nGLpVEP+4b8O6AMPeX79HdQyos0KX3o9iZo9LU0cIykX
         h4mg==
X-Forwarded-Encrypted: i=1; AJvYcCUzpZqmPJEcp80C3mVemY/uwI11SPqmv8xHfDwgLfmaZJvgiez2T4XwWNDvfVPPq2TLlMyBdw5HE6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJirVrA2eagLWCVet8meUV7vPTVarcBryM+610R+gLBaXQ2Wli
	yRuHq2YsSTEsOigvKilN0gvmveX9ka/aWPAR7LiRTkELbpvD0E8oGinY0DFCs+p6MD0=
X-Gm-Gg: AY/fxX7sMTbeDoBU/tBdiaINYwf9yYajCKOzrLrgQi+aCH2mdqGi8O8KVHpQCZaoAe6
	BJl2h+Pdg7XY+JiE04+zV4CjoqtCkAx1XVdPAhNVOSE2RIkdzymowl1ax4eqWKwRUiPt9KPu7bD
	2RJ+2Oy6bsACOpmvtAxLlAjhKd0GpflLYGYI6J3/oK83RSyUH6H8viUpCof9FEIdB+FEkrle1Iw
	Ex8QU+SUsOsAFeqE63yiARAlLY12qfv40gsallfGLz2vVmPeIxS19lUXfvQDJjuXDtl1FAmCqOR
	ql2rpODBvtB5cPuV8x6++GLWpbwvDM7NqY/eM3Hk+NAsk+2+iLC804rjBztBj/+z+1aXbP+W7km
	DqDbtOPW+WUsuLo2CwbAlb5F/Ze86a+LBSQWXK5w9ikWb8yJlYSdx2wDmeSTagWlDloMRwypICD
	qc7Exydq8zH3PknCYf0sTOGyyg+O6TS8yJHVoO9SOx3fC0
X-Google-Smtp-Source: AGHT+IErJmeg0IFRmqaoYgE5ePCox48wKfJsmtTlysRTtkvAFtlNmL5MMIdhS3/fuEP6IcBMDBosxw==
X-Received: by 2002:a05:600c:6208:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47a8f2c9fa3mr124923025e9.16.1765816751896;
        Mon, 15 Dec 2025 08:39:11 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:39:11 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 19/19] arm64: dts: microchip: add EV23X71A board
Date: Mon, 15 Dec 2025 17:35:36 +0100
Message-ID: <20251215163820.1584926-19-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip EV23X71A is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Split from SoC DTSI commit
* Apply DTS coding style
* Enclose array in i2c-mux
* Alphanumericaly sort nodes
* Change management port mode to RGMII-ID 

 arch/arm64/boot/dts/microchip/Makefile        |   1 +
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 757 ++++++++++++++++++
 2 files changed, 758 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts

diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/dts/microchip/Makefile
index c6e0313eea0f..09d16fc1ce9a 100644
--- a/arch/arm64/boot/dts/microchip/Makefile
+++ b/arch/arm64/boot/dts/microchip/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_LAN969X) += lan9696-ev23x71a.dtb
 dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb125.dtb
 dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
 dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
new file mode 100644
index 000000000000..435df455b078
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -0,0 +1,757 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "lan9691.dtsi"
+
+/ {
+	model = "Microchip EV23X71A";
+	compatible = "microchip,ev23x71a", "microchip,lan9696", "microchip,lan9691";
+
+	aliases {
+		serial0 = &usart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 60 GPIO_ACTIVE_LOW>;
+		open-source;
+		priority = <200>;
+	};
+
+	i2c-mux {
+		compatible = "i2c-mux-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-parent = <&i2c3>;
+		idle-state = <0x8>;
+		mux-gpios = <&sgpio_out 0 1 GPIO_ACTIVE_HIGH>,
+			    <&sgpio_out 0 2 GPIO_ACTIVE_HIGH>,
+			    <&sgpio_out 0 3 GPIO_ACTIVE_HIGH>;
+		settle-time-us = <100>;
+
+		i2c_sfp0: i2c@0 {
+			reg = <0x0>;
+		};
+
+		i2c_sfp1: i2c@1 {
+			reg = <0x1>;
+		};
+
+		i2c_sfp2: i2c@2 {
+			reg = <0x2>;
+		};
+
+		i2c_sfp3: i2c@3 {
+			reg = <0x3>;
+		};
+
+		i2c_poe: i2c@7 {
+			reg = <0x7>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-status {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio 61 GPIO_ACTIVE_LOW>;
+		};
+
+		led-sfp1-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <0>;
+			gpios = <&sgpio_out 6 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp1-yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <0>;
+			gpios = <&sgpio_out 6 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp2-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
+			gpios = <&sgpio_out 7 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp2-yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
+			gpios = <&sgpio_out 7 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp3-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
+			gpios = <&sgpio_out 8 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp3-yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
+			gpios = <&sgpio_out 8 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp4-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
+			gpios = <&sgpio_out 9 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp4-yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
+			gpios = <&sgpio_out 9 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		mux-gpios = <&sgpio_out 1 2 GPIO_ACTIVE_LOW>,
+			    <&sgpio_out 1 3 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp0: sfp0 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp0>;
+		tx-disable-gpios = <&sgpio_out 6 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in 6 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in 6 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in 6 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	sfp1: sfp1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp1>;
+		tx-disable-gpios = <&sgpio_out 7 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in 7 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in 7 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in 7 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	sfp2: sfp2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp2>;
+		tx-disable-gpios = <&sgpio_out 8 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in 8 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in 8 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in 8 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	sfp3: sfp3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp3>;
+		tx-disable-gpios = <&sgpio_out 9 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in 9 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in 9 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in 9 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&gpio {
+	emmc_sd_pins: emmc-sd-pins {
+		/* eMMC_SD - CMD, CLK, D0, D1, D2, D3, D4, D5, D6, D7, RSTN */
+		pins = "GPIO_14", "GPIO_15", "GPIO_16", "GPIO_17",
+		       "GPIO_18", "GPIO_19", "GPIO_20", "GPIO_21",
+		       "GPIO_22", "GPIO_23", "GPIO_24";
+		function = "emmc_sd";
+	};
+
+	fan_pins: fan-pins {
+		pins = "GPIO_25", "GPIO_26";
+		function = "fan";
+	};
+
+	fc0_pins: fc0-pins {
+		pins = "GPIO_3", "GPIO_4";
+		function = "fc";
+	};
+
+	fc2_pins: fc2-pins {
+		pins = "GPIO_64", "GPIO_65", "GPIO_66";
+		function = "fc";
+	};
+
+	fc3_pins: fc3-pins {
+		pins = "GPIO_55", "GPIO_56";
+		function = "fc";
+	};
+
+	mdio_pins: mdio-pins {
+		pins = "GPIO_9", "GPIO_10";
+		function = "miim";
+	};
+
+	mdio_irq_pins: mdio-irq-pins {
+		pins = "GPIO_11";
+		function = "miim_irq";
+	};
+
+	sgpio_pins: sgpio-pins {
+		/* SCK, D0, D1, LD */
+		pins = "GPIO_5", "GPIO_6", "GPIO_7", "GPIO_8";
+		function = "sgpio_a";
+	};
+
+	usb_ulpi_pins: usb-ulpi-pins {
+		pins = "GPIO_30", "GPIO_31", "GPIO_32", "GPIO_33",
+		       "GPIO_34", "GPIO_35", "GPIO_36", "GPIO_37",
+		       "GPIO_38", "GPIO_39", "GPIO_40", "GPIO_41";
+		function = "usb_ulpi";
+	};
+
+	usb_rst_pins: usb-rst-pins {
+		pins = "GPIO_12";
+		function = "usb2phy_rst";
+	};
+
+	usb_over_pins: usb-over-pins {
+		pins = "GPIO_13";
+		function = "usb_over_detect";
+	};
+
+	usb_power_pins: usb-power-pins {
+		pins = "GPIO_1";
+		function = "usb_power";
+	};
+
+	ptp_out_pins: ptp-out-pins {
+		pins = "GPIO_58";
+		function = "ptpsync_4";
+	};
+
+	ptp_ext_pins: ptp-ext-pins {
+		pins = "GPIO_59";
+		function = "ptpsync_5";
+	};
+};
+
+&flx0 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
+	status = "okay";
+};
+
+&flx2 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_SPI>;
+	status = "okay";
+};
+
+&flx3 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&fc3_pins>;
+	pinctrl-names = "default";
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	i2c-sda-hold-time-ns = <1500>;
+	status = "okay";
+};
+
+&mdio0 {
+	pinctrl-0 = <&mdio_pins>, <&mdio_irq_pins>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio 62 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	phy3: phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <3>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy4: phy@4 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <4>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy5: phy@5 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <5>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy6: phy@6 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <6>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy7: phy@7 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy8: phy@8 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <8>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy9: phy@9 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <9>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy10: phy@10 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <10>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy11: phy@11 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <11>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy12: phy@12 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <12>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy13: phy@13 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <13>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy14: phy@14 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <14>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy15: phy@15 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <15>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy16: phy@16 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <16>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy17: phy@17 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <17>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy18: phy@18 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <18>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy19: phy@19 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <19>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy20: phy@20 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <20>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy21: phy@21 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <21>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy22: phy@22 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <22>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy23: phy@23 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <23>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy24: phy@24 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <24>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy25: phy@25 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <25>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy26: phy@26 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <26>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy27: phy@27 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <27>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+};
+
+&serdes {
+	status = "okay";
+};
+
+&sgpio {
+	pinctrl-0 = <&sgpio_pins>;
+	pinctrl-names = "default";
+	microchip,sgpio-port-ranges = <0 1>, <6 9>;
+	status = "okay";
+
+	gpio@0 {
+		ngpios = <128>;
+	};
+	gpio@1 {
+		ngpios = <128>;
+	};
+};
+
+&spi2 {
+	pinctrl-0 = <&fc2_pins>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio 63 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&switch {
+	pinctrl-0 = <&ptp_out_pins>, <&ptp_ext_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port0: port@0 {
+			reg = <0>;
+			phy-handle = <&phy4>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 0>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port1: port@1 {
+			reg = <1>;
+			phy-handle = <&phy5>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 0>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port2: port@2 {
+			reg = <2>;
+			phy-handle = <&phy6>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 0>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port3: port@3 {
+			reg = <3>;
+			phy-handle = <&phy7>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 0>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port4: port@4 {
+			reg = <4>;
+			phy-handle = <&phy8>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 1>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port5: port@5 {
+			reg = <5>;
+			phy-handle = <&phy9>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 1>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port6: port@6 {
+			reg = <6>;
+			phy-handle = <&phy10>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 1>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port7: port@7 {
+			reg = <7>;
+			phy-handle = <&phy11>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 1>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port8: port@8 {
+			reg = <8>;
+			phy-handle = <&phy12>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 2>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port9: port@9 {
+			reg = <9>;
+			phy-handle = <&phy13>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 2>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port10: port@10 {
+			reg = <10>;
+			phy-handle = <&phy14>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 2>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port11: port@11 {
+			reg = <11>;
+			phy-handle = <&phy15>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 2>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port12: port@12 {
+			reg = <12>;
+			phy-handle = <&phy16>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 3>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port13: port@13 {
+			reg = <13>;
+			phy-handle = <&phy17>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 3>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port14: port@14 {
+			reg = <14>;
+			phy-handle = <&phy18>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 3>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port15: port@15 {
+			reg = <15>;
+			phy-handle = <&phy19>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 3>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port16: port@16 {
+			reg = <16>;
+			phy-handle = <&phy20>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 4>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port17: port@17 {
+			reg = <17>;
+			phy-handle = <&phy21>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 4>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port18: port@18 {
+			reg = <18>;
+			phy-handle = <&phy22>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 4>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port19: port@19 {
+			reg = <19>;
+			phy-handle = <&phy23>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 4>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port20: port@20 {
+			reg = <20>;
+			phy-handle = <&phy24>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 5>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port21: port@21 {
+			reg = <21>;
+			phy-handle = <&phy25>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 5>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port22: port@22 {
+			reg = <22>;
+			phy-handle = <&phy26>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 5>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port23: port@23 {
+			reg = <23>;
+			phy-handle = <&phy27>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 5>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port24: port@24 {
+			reg = <24>;
+			phys = <&serdes 6>;
+			phy-mode = "10gbase-r";
+			sfp = <&sfp0>;
+			managed = "in-band-status";
+			microchip,bandwidth = <10000>;
+			microchip,sd-sgpio = <24>;
+		};
+
+		port25: port@25 {
+			reg = <25>;
+			phys = <&serdes 7>;
+			phy-mode = "10gbase-r";
+			sfp = <&sfp1>;
+			managed = "in-band-status";
+			microchip,bandwidth = <10000>;
+			microchip,sd-sgpio = <28>;
+		};
+
+		port26: port@26 {
+			reg = <26>;
+			phys = <&serdes 8>;
+			phy-mode = "10gbase-r";
+			sfp = <&sfp2>;
+			managed = "in-band-status";
+			microchip,bandwidth = <10000>;
+			microchip,sd-sgpio = <32>;
+		};
+
+		port27: port@27 {
+			reg = <27>;
+			phys = <&serdes 9>;
+			phy-mode = "10gbase-r";
+			sfp = <&sfp3>;
+			managed = "in-band-status";
+			microchip,bandwidth = <10000>;
+			microchip,sd-sgpio = <36>;
+		};
+
+		port29: port@29 {
+			reg = <29>;
+			phys = <&serdes 11>;
+			phy-handle = <&phy3>;
+			phy-mode = "rgmii-id";
+			microchip,bandwidth = <1000>;
+		};
+	};
+};
+
+&tmon {
+	pinctrl-0 = <&fan_pins>;
+	pinctrl-names = "default";
+};
+
+&usart0 {
+	pinctrl-0 = <&fc0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb {
+	pinctrl-0 = <&usb_ulpi_pins>, <&usb_rst_pins>, <&usb_over_pins>, <&usb_power_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.52.0


