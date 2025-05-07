Return-Path: <linux-i2c+bounces-10859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4EAAD7BB
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 09:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CFD3AF6FF
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 07:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1B422E3F9;
	Wed,  7 May 2025 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EeJ9m5xS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1922D9FB;
	Wed,  7 May 2025 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602059; cv=none; b=TwnPox7LsIzbjTSv1XElePZ99RmcjdLmG5aGa03K56aNDpC8hIFmqWUSN5Gyu+1m2qI4To290HaDVMpvqZod9hszoPLXOIJP/Tux7LkrGtjK5aTCE/gwsl5hKkYSEPwKpKEcPROLrH3TrI7466G7To94M+w76paZl7VBTTNYnV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602059; c=relaxed/simple;
	bh=xBrtD26NIAs4XLyYFal3Do6QxZ4ShRZy9r/MUQfR3IM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcNVNrPYgeu5tLmvxRLn6WtJrdXRLYu4puV8D7n9IOIdYe/b3oOmDDFU+SW5jJzdBxzhC0rVedW36cpOgOxnz/aSmP0ljGxUp8uH3JdAqbNnunUFAWprWnY4CwdZz8x69Ig07h92geujjOBFcpzEjmJlpC5yAZQwkn77lp0VV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EeJ9m5xS; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 5C8D143B54;
	Wed,  7 May 2025 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eoTpd5CK7nvr6dHG5LWr9IC26BMOpRfFaLW3I7g0LVE=;
	b=EeJ9m5xSxG3ReoDsrqUoyrNG16RnOWgfpTImIGNxPpzabvb50GI4jWquX1Py23nL3C1wxX
	q3gCcS4Ldmw+w1C7z9mST9jFTxXQIRW3qUcw9VXigFvXe5AnqgFac0/jDDCHMGGvbnrgAv
	RxXIcfRkPuZlykUlFvSD4hid6BsNfo8sOJi86RQoz9uENUviHACxWz5xkZDK14iGFY2Lc3
	kHxQ67XvvJG1GeChO1Bfq5UZckO8gRMPYiNd7Otm/fE3gieGLobvq6D6Dw5fj6isZU/Nog
	xuLJeGtOQoAUlzm5tATBt/xzSldeDxrSJu+76A2Ac1Gogp3+hs5WGVAd9tNJAg==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
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
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 24/26] misc: lan966x_pci: Add dtsi/dtso nodes in order to support SFPs
Date: Wed,  7 May 2025 09:13:06 +0200
Message-ID: <20250507071315.394857-25-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsr
 dhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Add device-tree nodes needed to support SFPs.
Those nodes are:
 - the clock controller
 - the i2c controller
 - the i2c mux
 - the SFPs themselves and their related ports in the switch

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/misc/lan966x_evb_lan9662_nic.dtso | 95 +++++++++++++++++++++++
 drivers/misc/lan966x_pci.dtsi             | 42 ++++++++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/misc/lan966x_evb_lan9662_nic.dtso b/drivers/misc/lan966x_evb_lan9662_nic.dtso
index b3de5f14d9cb..20e1fe4f78bf 100644
--- a/drivers/misc/lan966x_evb_lan9662_nic.dtso
+++ b/drivers/misc/lan966x_evb_lan9662_nic.dtso
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/atmel-flexcom.h>
 #include <dt-bindings/phy/phy-lan966x-serdes.h>
 
 /dts-v1/;
@@ -28,15 +29,93 @@ __overlay__ {
 
 			#include "lan966x_pci.dtsi"
 
+			i2c0_emux: i2c0-emux {
+				compatible = "i2c-mux-pinctrl";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-parent = <&i2c0>;
+				pinctrl-names = "i2c102", "i2c103", "idle";
+				pinctrl-0 = <&i2cmux_0>;
+				pinctrl-1 = <&i2cmux_1>;
+				pinctrl-2 = <&i2cmux_pins>;
+
+				i2c102: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c103: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+
+			sfp2: sfp2 {
+				compatible = "sff,sfp";
+				i2c-bus = <&i2c102>;
+				tx-disable-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+				los-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+				mod-def0-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+				tx-fault-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+			};
+
+			sfp3: sfp3 {
+				compatible = "sff,sfp";
+				i2c-bus = <&i2c103>;
+				tx-disable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+				los-gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
+				mod-def0-gpios = <&gpio 19 GPIO_ACTIVE_LOW>;
+				tx-fault-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+			};
 		};
 	};
 };
 
+&flx0 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&fc0_a_pins>;
+	pinctrl-names = "default";
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	status = "okay";
+};
+
 &gpio {
 	tod_pins: tod_pins {
 		pins = "GPIO_36";
 		function = "ptpsync_1";
 	};
+
+	fc0_a_pins: fcb4-i2c-pins {
+		/* RXD, TXD */
+		pins = "GPIO_9", "GPIO_10";
+		function = "fc0_a";
+	};
+
+	i2cmux_pins: i2cmux-pins {
+		pins = "GPIO_76", "GPIO_77";
+		function = "twi_slc_gate";
+		output-low;
+	};
+
+	i2cmux_0: i2cmux-0 {
+		pins = "GPIO_76";
+		function = "twi_slc_gate";
+		output-high;
+	};
+
+	i2cmux_1: i2cmux-1 {
+		pins = "GPIO_77";
+		function = "twi_slc_gate";
+		output-high;
+	};
 };
 
 &lan966x_phy0 {
@@ -65,6 +144,22 @@ &port1 {
 	status = "okay";
 };
 
+&port2 {
+	phy-mode = "sgmii";
+	phys = <&serdes 2 SERDES6G(0)>;
+	sfp = <&sfp2>;
+	managed = "in-band-status";
+	status = "okay";
+};
+
+&port3 {
+	phy-mode = "sgmii";
+	phys = <&serdes 3 SERDES6G(1)>;
+	sfp = <&sfp3>;
+	managed = "in-band-status";
+	status = "okay";
+};
+
 &switch {
 	pinctrl-names = "default";
 	pinctrl-0 = <&tod_pins>;
diff --git a/drivers/misc/lan966x_pci.dtsi b/drivers/misc/lan966x_pci.dtsi
index 170298084fa5..d5c2056e4e5c 100644
--- a/drivers/misc/lan966x_pci.dtsi
+++ b/drivers/misc/lan966x_pci.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2025 Microchip UNG
  */
 
+#include <dt-bindings/clock/microchip,lan966x.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 cpu_clk: clock-600000000 {
@@ -61,6 +62,39 @@ port1: port@1 {
 				reg = <1>;
 				status = "disabled";
 			};
+
+			port2: port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port3: port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+		};
+	};
+
+	flx0: flexcom@e0040000 {
+		compatible = "atmel,sama5d2-flexcom";
+		reg = <0xe0040000 0x100>;
+		clocks = <&clks GCK_ID_FLEXCOM0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xe0040000 0x800>;
+		status = "disabled";
+
+		i2c0: i2c@600 {
+			compatible = "microchip,sam9x60-i2c";
+			reg = <0x600 0x200>;
+			interrupt-parent = <&oic>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clks GCK_ID_FLEXCOM0>;
+			assigned-clocks = <&clks GCK_ID_FLEXCOM0>;
+			assigned-clock-rates = <20000000>;
+			status = "disabled";
 		};
 	};
 
@@ -69,6 +103,14 @@ cpu_ctrl: syscon@e00c0000 {
 		reg = <0xe00c0000 0xa8>;
 	};
 
+	clks: clock-controller@e00c00a8 {
+		compatible = "microchip,lan966x-gck";
+		#clock-cells = <1>;
+		clocks = <&cpu_clk>, <&ddr_clk>, <&sys_clk>;
+		clock-names = "cpu", "ddr", "sys";
+		reg = <0xe00c00a8 0x38>, <0xe00c02cc 0x4>;
+	};
+
 	oic: oic@e00c0120 {
 		compatible = "microchip,lan966x-oic";
 		#interrupt-cells = <2>;
-- 
2.49.0


