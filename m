Return-Path: <linux-i2c+bounces-13526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E45BDD04D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 09:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7A2188A353
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 07:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B8B320A31;
	Wed, 15 Oct 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LG86RVlj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A178319855
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512840; cv=none; b=J483m913ovfEk1PpPW97Lb+R6whBUM9bYzDRzdPXBoMEXjDRXFzEqcNkYcHUTp/pF6PabHTKeH/qLk7dBQzrmtY9/RCDwNnjjNdk16Y0wvPcUWOr9HRShqqVjIi1/jRK+Bl8yEEEyJdDF8/XVkBuDLnCmsJdQn1dLx1+/8YgXWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512840; c=relaxed/simple;
	bh=ToovwD3c0mGn+eP6p7W15mbWy31bOdQOYFSxZoR8C8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhPyxJb67bxbvuli/lxZrXUgXXwge8XNXwYllXDnsxGt1u0Q1lGD/KskV+m4WVA2s3R37RBzTVY1i/8Oblu5fiuYVU01Lt5REA3DonGRtgGfY65kf3xzWbfXEyA13H7PHow149HraLT4W0BoSHZluSvz5zPl0SIXjsPM+UeVDto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LG86RVlj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D1F3C4E410C3
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 07:20:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A81A0606FA;
	Wed, 15 Oct 2025 07:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9D17102F22BB;
	Wed, 15 Oct 2025 09:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760512834; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=U4fVNa//WFW1x4z/uW8z63fVoT6K+3r0aK3cFZcJDLs=;
	b=LG86RVlj6PU45dK00ahd3m0sfwSRsUh9rfKnRRCsfmFy7IKHcBrR47t3m3lX5p5Xc6iTZT
	u+YWfotvL3+1PQj/ZauUuE5TIIh9vG7TdltydHY4sohIAtN72HagzvbUu14U1Qszi0FYH7
	dLIcDjt45MjYIDFrPYCpP6RzwjophkMJaoBfIqIvSSysLzHTHWXtCcUeaYFAiZWc1+POXg
	Z2SY9JLG1SlUJRRXxYhH0upfpq5Mqs78jpGudwurQfel2TJrL2kl0KabUCN2yIZl1j56wf
	4n5/gKoo5v+b2zHgUK+xmzm5SeOKp3wk6uhkSFHek8Pke8szuzM3po/iaF2Xcg==
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
Subject: [PATCH v4 22/29] misc: lan966x_pci: Fix dtso nodes ordering
Date: Wed, 15 Oct 2025 09:14:09 +0200
Message-ID: <20251015071420.1173068-23-herve.codina@bootlin.com>
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

Nodes available in the dtso are not ordered by their unit address.

Fix that re-ordering them according to their unit address.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/misc/lan966x_pci.dtso | 99 +++++++++++++++++------------------
 1 file changed, 49 insertions(+), 50 deletions(-)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 47d61dc963c7..88f3daabfc89 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -59,6 +59,50 @@ pci-ep-bus@0 {
 				ranges = <0xe2000000 0x00 0x00 0x00 0x2000000
 				          0xe0000000 0x01 0x00 0x00 0x1000000>;
 
+				switch: switch@e0000000 {
+					compatible = "microchip,lan966x-switch";
+					reg = <0xe0000000 0x0100000>,
+					      <0xe2000000 0x0800000>;
+					reg-names = "cpu", "gcb";
+
+					interrupt-parent = <&oic>;
+					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
+						     <9 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "xtr", "ana";
+
+					resets = <&reset 0>;
+					reset-names = "switch";
+
+					pinctrl-names = "default";
+					pinctrl-0 = <&tod_pins>;
+
+					ethernet-ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port0: port@0 {
+							phy-handle = <&lan966x_phy0>;
+
+							reg = <0>;
+							phy-mode = "gmii";
+							phys = <&serdes 0 CU(0)>;
+						};
+
+						port1: port@1 {
+							phy-handle = <&lan966x_phy1>;
+
+							reg = <1>;
+							phy-mode = "gmii";
+							phys = <&serdes 1 CU(1)>;
+						};
+					};
+				};
+
+				cpu_ctrl: syscon@e00c0000 {
+					compatible = "microchip,lan966x-cpu-syscon", "syscon";
+					reg = <0xe00c0000 0xa8>;
+				};
+
 				oic: oic@e00c0120 {
 					compatible = "microchip,lan966x-oic";
 					#interrupt-cells = <2>;
@@ -67,11 +111,6 @@ oic: oic@e00c0120 {
 					reg = <0xe00c0120 0x190>;
 				};
 
-				cpu_ctrl: syscon@e00c0000 {
-					compatible = "microchip,lan966x-cpu-syscon", "syscon";
-					reg = <0xe00c0000 0xa8>;
-				};
-
 				reset: reset@e200400c {
 					compatible = "microchip,lan966x-switch-reset";
 					reg = <0xe200400c 0x4>, <0xe00c0000 0xa8>;
@@ -104,14 +143,6 @@ fc0_a_pins: fcb4-i2c-pins {
 						pins = "GPIO_9", "GPIO_10";
 						function = "fc0_a";
 					};
-
-				};
-
-				serdes: serdes@e202c000 {
-					compatible = "microchip,lan966x-serdes";
-					reg = <0xe202c000 0x9c>,
-					      <0xe2004010 0x4>;
-					#phy-cells = <2>;
 				};
 
 				mdio1: mdio@e200413c {
@@ -133,43 +164,11 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
 					};
 				};
 
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
+				serdes: serdes@e202c000 {
+					compatible = "microchip,lan966x-serdes";
+					reg = <0xe202c000 0x9c>,
+					      <0xe2004010 0x4>;
+					#phy-cells = <2>;
 				};
 			};
 		};
-- 
2.51.0


