Return-Path: <linux-i2c+bounces-10169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD26A7E3B0
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA9E4245DE
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380EA204C25;
	Mon,  7 Apr 2025 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NL/lwJGY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590CE20459A;
	Mon,  7 Apr 2025 14:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037800; cv=none; b=N3DlUULCzFcGnUeI2w4g6KgS34hCE6W8jAFd0z6zkJPE9BNmFKK5y73oeabLnA0JJ2B0JR5Pd3D0xy8uO1Y2J1kkjKl9+9msJERNlPbaAamV8Sbk3IHdpvj7s/6N7IXCbFA3WRv9g6z6oAvcXOVm1l4qcl2T9sVMg7O7dKPR89A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037800; c=relaxed/simple;
	bh=n57HZHLWhLeCWoJGuk+5VRBZFrZrvDEjjDkdpqBODcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9X6D/D4FjpMMlKR+qPtZM5vwFgrumZP12mi9p5pb8k3SuzhLlPDOtY9O9VJpiW1QMz4OsRo1h+RhdYh9jLTx6+vkVXnpE/vZeZTkHtvRXbf8tou+qH8n5e+RVSD02sFgzWue2I0mQ1efndXaH13tCqoFNvRq11W5I9ryHkJVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NL/lwJGY; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id B56C544329;
	Mon,  7 Apr 2025 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744037795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4/G8/exgOOvkgKjAj+UibFwMMH8hTvH+jqgXzucqWA=;
	b=NL/lwJGY4IhVWDGBQIV4jX9Elf9DXdzMg6cgxl1zajKwlwt/1xNlIhdwJI3yHsUYWBZaKX
	lBwJlii0OyrvJgo2UXJ/y374HpPZJnGGOQJ/pHX8XYWI8MMAKp3LPHAk0IeKBauALvaoub
	fLd+NDugNMAfWeYw1RAh5RmcsJeUDv1NZV2fCHJy0xS8fic0T9oyQQCdBOIOGd/J5oaw+r
	Sb4z5MVtFeS85WS7uRRnZAN5/Mov83wGdbYo8mEmvhC67kRv3LAKP5sgSzEuzp2xEkamE6
	hIYKZ2E8wVBh+bMAovBsEnc28So1BO7dy7i6n5kvZETvoEz8QLXb7osFozn23Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to support SFPs
Date: Mon,  7 Apr 2025 16:55:44 +0200
Message-ID: <20250407145546.270683-16-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407145546.270683-1-herve.codina@bootlin.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrt
 ghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Add device-tree nodes needed to support SFPs.
Those nodes are:
 - the clock controller
 - the i2c controller
 - the i2c mux
 - the SFPs themselves and their related ports in the switch

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/misc/lan966x_pci.dtso | 111 ++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 94a967b384f3..a2015b46cd44 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -47,6 +47,47 @@ sys_clk: clock-15625000 {
 				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
 			};
 
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
+
 			pci-ep-bus@0 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
@@ -95,6 +136,50 @@ port1: port@1 {
 							phy-mode = "gmii";
 							phys = <&serdes 1 CU(1)>;
 						};
+
+						port2: port@2 {
+							reg = <2>;
+							phy-mode = "sgmii";
+							phys = <&serdes 2 SERDES6G(0)>;
+							sfp = <&sfp2>;
+							managed = "in-band-status";
+						};
+
+						port3: port@3 {
+							reg = <3>;
+							phy-mode = "sgmii";
+							phys = <&serdes 3 SERDES6G(1)>;
+							sfp = <&sfp3>;
+							managed = "in-band-status";
+						};
+					};
+				};
+
+				flx0: flexcom@e0040000 {
+					compatible = "atmel,sama5d2-flexcom";
+					reg = <0xe0040000 0x100>;
+					clocks = <&clks GCK_ID_FLEXCOM0>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0x0 0xe0040000 0x800>;
+
+					atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+
+					i2c0: i2c@600 {
+						compatible = "microchip,sam9x60-i2c";
+						reg = <0x600 0x200>;
+						interrupt-parent = <&oic>;
+						interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						clocks = <&clks GCK_ID_FLEXCOM0>;
+						assigned-clocks = <&clks GCK_ID_FLEXCOM0>;
+						assigned-clock-rates = <20000000>;
+						pinctrl-0 = <&fc0_a_pins>;
+						pinctrl-names = "default";
+						i2c-analog-filter;
+						i2c-digital-filter;
+						i2c-digital-filter-width-ns = <35>;
 					};
 				};
 
@@ -103,6 +188,14 @@ cpu_ctrl: syscon@e00c0000 {
 					reg = <0xe00c0000 0xa8>;
 				};
 
+				clks: clock-controller@e00c00a8 {
+					compatible = "microchip,lan966x-gck";
+					#clock-cells = <1>;
+					clocks = <&cpu_clk>, <&ddr_clk>, <&sys_clk>;
+					clock-names = "cpu", "ddr", "sys";
+					reg = <0xe00c00a8 0x38>, <0xe00c02cc 0x4>;
+				};
+
 				oic: oic@e00c0120 {
 					compatible = "microchip,lan966x-oic";
 					#interrupt-cells = <2>;
@@ -143,6 +236,24 @@ fc0_a_pins: fcb4-i2c-pins {
 						pins = "GPIO_9", "GPIO_10";
 						function = "fc0_a";
 					};
+
+					i2cmux_pins: i2cmux-pins {
+						pins = "GPIO_76", "GPIO_77";
+						function = "twi_slc_gate";
+						output-low;
+					};
+
+					i2cmux_0: i2cmux-0 {
+						pins = "GPIO_76";
+						function = "twi_slc_gate";
+						output-high;
+					};
+
+					i2cmux_1: i2cmux-1 {
+						pins = "GPIO_77";
+						function = "twi_slc_gate";
+						output-high;
+					};
 				};
 
 				mdio1: mdio@e200413c {
-- 
2.49.0


