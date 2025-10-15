Return-Path: <linux-i2c+bounces-13527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72503BDD17B
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 09:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 38855505006
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 07:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2B232145A;
	Wed, 15 Oct 2025 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2W954IJm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771D731986D;
	Wed, 15 Oct 2025 07:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512851; cv=none; b=gIAgMYzOqdLCBAPmYgwp51+FuIJlVtmksMmKs7WOOzDuXkKsvW6UJ1M9kqLvt0Geb44qDFiVCrbpiN/b1meDSnSNGG9T+epsYJZqRa9EZ/UcsADlWk9bTldpo+zNMaZ+MaCKZ3jiiGCfycjc7AXjh7KT5Q/1+rQocJUB95anE9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512851; c=relaxed/simple;
	bh=KM1TyGJRW99LZ1Gug4Y4+ZmgXPoP9WuBOrZKALbNEk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DU8JUQyCfn+l1s+/nUKMsVhEfIc/dPTG/oUzzBOz3Y1lvxKuPClQi7CpHeS5kk579iQ5X/q4sp2ibcdkd2OLToAeu1m26zrB+Ozhhg25rCsohdPf3l2uIpiuYac6CIzM+spuKWojOctvjxDe0DqxTlMiHAu3fGzjEiO5K8zokew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2W954IJm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF6841A13AD;
	Wed, 15 Oct 2025 07:20:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C63C0606FA;
	Wed, 15 Oct 2025 07:20:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9E0A102F22AF;
	Wed, 15 Oct 2025 09:20:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760512844; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OTsM6UP8vDmc40CwlK0Yi4+JdG7w99ssFmK3r9mEaZc=;
	b=2W954IJmvnYANKXwL/nvZTSoOyuMO2lSkZyNB15219bbhFL7XyLkGZR/PoPZXgVvTWSK/I
	nkEQBXaPZNYban9hRKO11ahbDxCs/c/LViDgxHMfeSnVtsSLkw6h3KmOgVl5rR2uAsZJ84
	pGD1fRvSkx9UoeNXK8ZOdn9atX+jdOmj5W7DxMdk7JIKuT2GIODkCJ0GMGi/+8rE54mrR0
	XumN/e3u2jXoM9vVXmUOBvoXlM+nQfe0vDjBqlLZGym1qE1z1y2BFtIcmN/AriYzg99gvH
	B3FJAu/KZwTvU3hvks6TucfrugdwwzAzFbr4UHsfqzZVKZxQhZ4IxhD+i9EHYw==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 23/29] misc: lan966x_pci: Split dtso in dtsi/dtso
Date: Wed, 15 Oct 2025 09:14:10 +0200
Message-ID: <20251015071420.1173068-24-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015071420.1173068-1-herve.codina@bootlin.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The lan966x_pci.dtso file contains descriptions related to both the
LAN966x PCI device chip and the LAN966x PCI device board where the chip
is soldered.

Split the file in order to have:
  - lan966x_pci.dtsi
    The description related to the PCI chip.

  - lan966x_pci.dtso
    The description of the PCI board.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS                   |   1 +
 drivers/misc/lan966x_pci.dtsi | 130 +++++++++++++++++++++++++
 drivers/misc/lan966x_pci.dtso | 175 +++++++---------------------------
 3 files changed, 166 insertions(+), 140 deletions(-)
 create mode 100644 drivers/misc/lan966x_pci.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..7676484f838e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16877,6 +16877,7 @@ MICROCHIP LAN966X PCI DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 S:	Maintained
 F:	drivers/misc/lan966x_pci.c
+F:	drivers/misc/lan966x_pci.dtsi
 F:	drivers/misc/lan966x_pci.dtso
 
 MICROCHIP LAN969X ETHERNET DRIVER
diff --git a/drivers/misc/lan966x_pci.dtsi b/drivers/misc/lan966x_pci.dtsi
new file mode 100644
index 000000000000..a7a72218a58c
--- /dev/null
+++ b/drivers/misc/lan966x_pci.dtsi
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Microchip UNG
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+cpu_clk: clock-600000000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <600000000>;  /* CPU clock = 600MHz */
+};
+
+ddr_clk: clock-30000000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <30000000>;  /* Fabric clock = 30MHz */
+};
+
+sys_clk: clock-15625000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <15625000>;  /* System clock = 15.625MHz */
+};
+
+pci-ep-bus@0 {
+	compatible = "simple-platform-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * map @0xe2000000 (32MB) to BAR0 (CPU)
+	 * map @0xe0000000 (16MB) to BAR1 (AMBA)
+	 */
+	ranges = <0xe2000000 0x00 0x00 0x00 0x2000000
+		  0xe0000000 0x01 0x00 0x00 0x1000000>;
+
+	switch: switch@e0000000 {
+		compatible = "microchip,lan966x-switch";
+		reg = <0xe0000000 0x0100000>,
+		      <0xe2000000 0x0800000>;
+		reg-names = "cpu", "gcb";
+		interrupt-parent = <&oic>;
+		interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
+			     <9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "xtr", "ana";
+		resets = <&reset 0>;
+		reset-names = "switch";
+		status = "disabled";
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port0: port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port1: port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+		};
+	};
+
+	cpu_ctrl: syscon@e00c0000 {
+		compatible = "microchip,lan966x-cpu-syscon", "syscon";
+		reg = <0xe00c0000 0xa8>;
+	};
+
+	oic: oic@e00c0120 {
+		compatible = "microchip,lan966x-oic";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>; /* PCI INTx assigned interrupt */
+		reg = <0xe00c0120 0x190>;
+	};
+
+	reset: reset@e200400c {
+		compatible = "microchip,lan966x-switch-reset";
+		reg = <0xe200400c 0x4>, <0xe00c0000 0xa8>;
+		reg-names = "gcb","cpu";
+		#reset-cells = <1>;
+		cpu-syscon = <&cpu_ctrl>;
+	};
+
+	gpio: pinctrl@e2004064 {
+		compatible = "microchip,lan966x-pinctrl";
+		reg = <0xe2004064 0xb4>,
+		      <0xe2010024 0x138>;
+		resets = <&reset 0>;
+		reset-names = "switch";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&gpio 0 0 78>;
+		interrupt-parent = <&oic>;
+		interrupt-controller;
+		interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <2>;
+	};
+
+	mdio1: mdio@e200413c {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "microchip,lan966x-miim";
+		reg = <0xe200413c 0x24>,
+		      <0xe2010020 0x4>;
+		resets = <&reset 0>;
+		reset-names = "switch";
+		status = "disabled";
+
+		lan966x_phy0: ethernet-lan966x_phy@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		lan966x_phy1: ethernet-lan966x_phy@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+	};
+
+	serdes: serdes@e202c000 {
+		compatible = "microchip,lan966x-serdes";
+		reg = <0xe202c000 0x9c>,
+		      <0xe2004010 0x4>;
+		#phy-cells = <2>;
+	};
+};
diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 88f3daabfc89..3ad50abee72d 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -3,10 +3,7 @@
  * Copyright (C) 2022 Microchip UNG
  */
 
-#include <dt-bindings/clock/microchip,lan966x.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/mfd/atmel-flexcom.h>
 #include <dt-bindings/phy/phy-lan966x-serdes.h>
 
 /dts-v1/;
@@ -29,148 +26,46 @@ __overlay__ {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			cpu_clk: clock-600000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <600000000>;  /* CPU clock = 600MHz */
-			};
-
-			ddr_clk: clock-30000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <30000000>;  /* Fabric clock = 30MHz */
-			};
-
-			sys_clk: clock-15625000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
-			};
-
-			pci-ep-bus@0 {
-				compatible = "simple-platform-bus";
-				#address-cells = <1>;
-				#size-cells = <1>;
-
-				/*
-				 * map @0xe2000000 (32MB) to BAR0 (CPU)
-				 * map @0xe0000000 (16MB) to BAR1 (AMBA)
-				 */
-				ranges = <0xe2000000 0x00 0x00 0x00 0x2000000
-				          0xe0000000 0x01 0x00 0x00 0x1000000>;
-
-				switch: switch@e0000000 {
-					compatible = "microchip,lan966x-switch";
-					reg = <0xe0000000 0x0100000>,
-					      <0xe2000000 0x0800000>;
-					reg-names = "cpu", "gcb";
-
-					interrupt-parent = <&oic>;
-					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
-						     <9 IRQ_TYPE_LEVEL_HIGH>;
-					interrupt-names = "xtr", "ana";
-
-					resets = <&reset 0>;
-					reset-names = "switch";
-
-					pinctrl-names = "default";
-					pinctrl-0 = <&tod_pins>;
-
-					ethernet-ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port0: port@0 {
-							phy-handle = <&lan966x_phy0>;
-
-							reg = <0>;
-							phy-mode = "gmii";
-							phys = <&serdes 0 CU(0)>;
-						};
-
-						port1: port@1 {
-							phy-handle = <&lan966x_phy1>;
-
-							reg = <1>;
-							phy-mode = "gmii";
-							phys = <&serdes 1 CU(1)>;
-						};
-					};
-				};
-
-				cpu_ctrl: syscon@e00c0000 {
-					compatible = "microchip,lan966x-cpu-syscon", "syscon";
-					reg = <0xe00c0000 0xa8>;
-				};
-
-				oic: oic@e00c0120 {
-					compatible = "microchip,lan966x-oic";
-					#interrupt-cells = <2>;
-					interrupt-controller;
-					interrupts = <0>; /* PCI INTx assigned interrupt */
-					reg = <0xe00c0120 0x190>;
-				};
-
-				reset: reset@e200400c {
-					compatible = "microchip,lan966x-switch-reset";
-					reg = <0xe200400c 0x4>, <0xe00c0000 0xa8>;
-					reg-names = "gcb","cpu";
-					#reset-cells = <1>;
-					cpu-syscon = <&cpu_ctrl>;
-				};
-
-				gpio: pinctrl@e2004064 {
-					compatible = "microchip,lan966x-pinctrl";
-					reg = <0xe2004064 0xb4>,
-					      <0xe2010024 0x138>;
-					resets = <&reset 0>;
-					reset-names = "switch";
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&gpio 0 0 78>;
-					interrupt-parent = <&oic>;
-					interrupt-controller;
-					interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
-					#interrupt-cells = <2>;
+			#include "lan966x_pci.dtsi"
+		};
+	};
+};
 
-					tod_pins: tod_pins {
-						pins = "GPIO_36";
-						function = "ptpsync_1";
-					};
+&gpio {
+	tod_pins: tod_pins {
+		pins = "GPIO_36";
+		function = "ptpsync_1";
+	};
+};
 
-					fc0_a_pins: fcb4-i2c-pins {
-						/* RXD, TXD */
-						pins = "GPIO_9", "GPIO_10";
-						function = "fc0_a";
-					};
-				};
+&lan966x_phy0 {
+	status = "okay";
+};
 
-				mdio1: mdio@e200413c {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					compatible = "microchip,lan966x-miim";
-					reg = <0xe200413c 0x24>,
-					      <0xe2010020 0x4>;
+&lan966x_phy1 {
+	status = "okay";
+};
 
-					resets = <&reset 0>;
-					reset-names = "switch";
+&mdio1 {
+	status = "okay";
+};
 
-					lan966x_phy0: ethernet-lan966x_phy@1 {
-						reg = <1>;
-					};
+&port0 {
+	phy-handle = <&lan966x_phy0>;
+	phy-mode = "gmii";
+	phys = <&serdes 0 CU(0)>;
+	status = "okay";
+};
 
-					lan966x_phy1: ethernet-lan966x_phy@2 {
-						reg = <2>;
-					};
-				};
+&port1 {
+	phy-handle = <&lan966x_phy1>;
+	phy-mode = "gmii";
+	phys = <&serdes 1 CU(1)>;
+	status = "okay";
+};
 
-				serdes: serdes@e202c000 {
-					compatible = "microchip,lan966x-serdes";
-					reg = <0xe202c000 0x9c>,
-					      <0xe2004010 0x4>;
-					#phy-cells = <2>;
-				};
-			};
-		};
-	};
+&switch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tod_pins>;
+	status = "okay";
 };
-- 
2.51.0


