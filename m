Return-Path: <linux-i2c+bounces-13531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FECFBDD133
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 09:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5DF63B194D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 07:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EB8322556;
	Wed, 15 Oct 2025 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vt66Kt+9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36A314A6A;
	Wed, 15 Oct 2025 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512888; cv=none; b=X+FYmwtCAcJxE3/aOMJAwXs/pPyEBQszwerumYY3OJPWzcmdO9A2bCzfGY/jvdaEmNCBBuKnII2iktJEvdo470Md21/ocny5ZVSlVsKamEdQx7KioHrjyJ39tqKkRGJuhXxnxryPLUV4uLMhZE5qyKvj+cgxNh+pTUUil8dVoqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512888; c=relaxed/simple;
	bh=TTroOPqXxjG//qKe9A/Wb5fs/I2nb0k+iUtwu7aKCds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7JysgytF5Yq+83XQcT7NzjlRBvpHJOstFZcfT5jEO9pby8JbIv6OKCPIC+50IG66GaUCoXRb5RMwYVaeL/tpF3KaKYCSbPZsa3AfcUVo6N/D9EfuQ5QU0m1Z+xpzcp2h9H9Jq5hTXrXqst8tItUbdhfw/EPtm7ilanN5/uwfVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vt66Kt+9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EAC96C09FAA;
	Wed, 15 Oct 2025 07:21:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10D86606F9;
	Wed, 15 Oct 2025 07:21:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0053102F22BD;
	Wed, 15 Oct 2025 09:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760512882; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=u6XTodlRVhMB+xHq2BDcAc16sIRCGFH8BTjMoJeRyUc=;
	b=vt66Kt+9+XnczuM9TwbuEfHSnwdtFYhrQADDl9WartoJ/osg7yoVOvA1zAGuwE5BHBEzp2
	fsV17iwx0dMM3wGr8HWY7DHOsxtkUlmtsk/0Q4x1QtS7I5+T6i3Zyw2Q1Rg1vo+QIfVfP4
	K0MuDGDF17BMlXayPUfpaRtEyXFu5c37Cho9MMHX4l/Lj1xmRZoBRucIkV43rc8tuoDJys
	elVzNTLiN7Ni2Io/7F9QyGZm7ulPBvIdqxlGUgVg0ytMfpPzu8v3ja/6YCcSKhmIN0gdKc
	U31AekAaX/Pj/c4U8Jt+80+VgAQD4W7lX5bHP3tmWkAgcKOmA7DMlQafWyUeBA==
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
Subject: [PATCH v4 27/29] misc: lan966x_pci: Add dtsi/dtso nodes in order to support SFPs
Date: Wed, 15 Oct 2025 09:14:14 +0200
Message-ID: <20251015071420.1173068-28-herve.codina@bootlin.com>
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

Add device-tree nodes needed to support SFPs.
Those nodes are:
 - the clock controller
 - the i2c controller
 - the i2c mux
 - the SFPs themselves and their related ports in the switch

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/misc/lan966x_evb_lan9662_nic.dtso | 96 +++++++++++++++++++++++
 drivers/misc/lan966x_pci.dtsi             | 42 ++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/misc/lan966x_evb_lan9662_nic.dtso b/drivers/misc/lan966x_evb_lan9662_nic.dtso
index 3ad50abee72d..20e1fe4f78bf 100644
--- a/drivers/misc/lan966x_evb_lan9662_nic.dtso
+++ b/drivers/misc/lan966x_evb_lan9662_nic.dtso
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/atmel-flexcom.h>
 #include <dt-bindings/phy/phy-lan966x-serdes.h>
 
 /dts-v1/;
@@ -27,15 +28,94 @@ __overlay__ {
 			#size-cells = <2>;
 
 			#include "lan966x_pci.dtsi"
+
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
@@ -64,6 +144,22 @@ &port1 {
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
index a7a72218a58c..789bb0ac5704 100644
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
2.51.0


