Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A07207215F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 23:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392004AbfGWVMc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 17:12:32 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59289 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389263AbfGWVMc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 17:12:32 -0400
Received: from [88.149.224.16] (port=34022 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hq1Xc-007idA-SF; Tue, 23 Jul 2019 22:37:45 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video deserializer
Date:   Tue, 23 Jul 2019 22:37:20 +0200
Message-Id: <20190723203723.11730-4-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723203723.11730-1-luca@lucaceresoli.net>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Describe the Texas Instruments DS90UB954-Q1, a 2-input video deserializer
with I2C Address Translator and remote GPIOs.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes RFCv1 -> RFCv2:

 - add explicit aliases for the FPD-link RX ports (optional)
 - add proper remote GPIO description
---
 .../bindings/media/i2c/ti,ds90ub954-q1.txt    | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
new file mode 100644
index 000000000000..73ce21ecc3b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
@@ -0,0 +1,194 @@
+Texas Instruments DS90UB954-Q1 dual video deserializer
+======================================================
+
+The TI DS90UB954-Q1 is a MIPI CSI-2 video deserializer that forwards video
+streams from up to two FPD-Link 3 connections to a MIPI CSI-2 output. It
+also allows access to remote I2C and GPIO.
+
+Required properties:
+
+ - compatible: must be "ti,ds90ub954-q1"
+
+ - reg: main I2C slave address; optionally aliases for RX port registers
+   and remote serializers. The main address is mandatory and must be the
+   first, others are optional and fall back to defaults if not
+   specified. See "reg-names".
+
+ - reset-gpios: chip reset GPIO, active low (connected to PDB pin of the chip)
+ - i2c-alias-pool: list of I2C addresses that are known to be available on the
+                   "local" (SoC-to-deser) I2C bus; they will be picked at
+		   runtime and used as aliases to reach remove I2C chips
+ - gpio-controller
+ - #gpio-cells: must be 3: FPD-Link 3 RX port number, remote gpio number, flags
+
+Optional properties:
+
+ - reg-names: names of I2C address used to communicate with the chip, must
+              match the "reg" values; mandatory if there are 2 or more
+              addresses
+    - "main": the main I2C address, used to access shared registers
+    - "rxport0", "rxport1": I2C alias to access FPD-link RX port specific
+      registers; must not be used by other slaves on the same bus
+    - "ser0", "ser1": I2C alias to access the remote serializer connected
+      on each FPD-link RX port; must not be used by other slaves on the
+      same bus
+ - interrupts: interrupt pin from the chip
+
+Required subnodes:
+
+ - ports: A ports node with one port child node per device input and output
+          port, in accordance with the video interface bindings defined in
+          Documentation/devicetree/bindings/media/video-interfaces.txt. The
+          port nodes are numbered as follows:
+
+          Port Description
+          ------------------------------------
+          0    Input from FPD-Link 3 RX port 0
+          1    Input from FPD-Link 3 RX port 1
+          2    CSI-2 output
+
+          Each port must have a "remote-chip" subnode that defines the remote
+	  chip (serializer) with at least a "compatible" property
+
+ - i2c-atr: contains one child per RX port, each describes the I2C bus on
+            the remote side
+
+	    Required properties:
+	    - #address-cells = <1>;
+	    - #size-cells = <0>;
+
+	    Subnodes: one per each FPD-link RX port, each having:
+
+	    Required properties for "i2c-atr" child bus nodes:
+	    - reg: The number of the port where the remove chip is connected
+	    - #address-cells = <1>;
+	    - #size-cells = <0>;
+
+	    Optional properties for "i2c-atr" child bus nodes:
+	    - Other properties specific to the remote hardware
+	    - Child nodes conforming to i2c bus binding
+
+
+Device node example
+-------------------
+
+&i2c0 {
+	deser: deser@3d {
+		compatible = "ti,ds90ub954-q1";
+		reg-names = "main", "rxport0", "rxport1", "ser0", "ser1";
+		reg       = <0x3d>,  <0x40>,    <0x41>,   <0x44>, <0x45>;
+		clocks = <&clk_25M>;
+		interrupt-parent = <&gic>;
+		interrupts = <3 1 IRQ_TYPE_LEVEL_HIGH>;
+		reset-gpios = <&gpio_ctl 4 GPIO_ACTIVE_LOW>;
+
+		i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		gpio-controller;
+		#gpio-cells = <3>; /* rxport, remote gpio num, flags */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				ds90ub954_fpd3_in0: endpoint {
+					remote-endpoint = <&sensor_0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				ds90ub954_fpd3_in1: endpoint {
+					remote-endpoint = <&sensor_1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				ds90ub954_mipi_out0: endpoint {
+					data-lanes = <1 2 3 4>;
+					/* Actually a REFCLK multiplier */
+					data-rate = <1600000000>;
+					remote-endpoint = <&csirx_0_in>;
+				};
+			};
+		};
+
+		i2c-atr {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			remote_i2c0: i2c@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			remote_i2c1: i2c@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&ds90ub954_fpd3_in0 {
+	remote-chip {
+		compatible = "ti,ds90ub953-q1";
+		gpio-functions = <DS90_GPIO_FUNC_OUTPUT_REMOTE
+				  DS90_GPIO_FUNC_UNUSED
+				  DS90_GPIO_FUNC_UNUSED
+				  DS90_GPIO_FUNC_UNUSED>;
+	};
+};
+
+&ds90ub954_fpd3_in1 {
+	remote-chip {
+		compatible = "ti,ds90ub953-q1";
+		gpio-functions = <DS90_GPIO_FUNC_OUTPUT_REMOTE
+				  DS90_GPIO_FUNC_UNUSED
+				  DS90_GPIO_FUNC_UNUSED
+				  DS90_GPIO_FUNC_UNUSED>;
+	};
+};
+
+&remote_i2c0 {
+	sensor_0@3c {
+		compatible = "sony,imx274";
+		reg = <0x3c>;
+
+		reset-gpios = <&deser 0 0 GPIO_ACTIVE_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			sensor_0_out: endpoint {
+				remote-endpoint = <&ds90ub954_fpd3_in0>;
+			};
+		};
+	};
+};
+
+&remote_i2c1 {
+	sensor_0@3c {
+		compatible = "sony,imx274";
+		reg = <0x3c>;
+
+		reset-gpios = <&deser 1 0 GPIO_ACTIVE_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			sensor_1_out: endpoint {
+				remote-endpoint = <&ds90ub954_fpd3_in1>;
+			};
+		};
+	};
+};
-- 
2.17.1

