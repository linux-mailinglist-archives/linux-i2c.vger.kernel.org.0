Return-Path: <linux-i2c+bounces-8186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA989D7D30
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 09:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A305D1636D0
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 08:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813A618E023;
	Mon, 25 Nov 2024 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qzf1cUgN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A167718C924;
	Mon, 25 Nov 2024 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524337; cv=none; b=JMYsc7ED05F5vlO2anEsltPpl0VjQ+Q47NuwVEKaK3Ny6z+hqIux84LLpgIfgdlESEmsVsz7Hz8upibO+CMPCedii7wAwTJrTl+r72c5zau5YkTtnXJl4Kd8EF5c8T6g8sEuw1pVzr8V8lT/jC1IJ9od/rOvwkCAW6YYMcsGyA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524337; c=relaxed/simple;
	bh=4ASwNi5ankBzYUs7eKvyHd8qV8wC4jjoiJ6YHqezZXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlkTiIsNui/wd8HO42UpExs8Xr0Ozgrbz2ZEeNHzFCzPa1j31SDskYIdJ/C25rH23cNx2/bf7TGkzorGfZVC58Q1UNbMhE7CVwHlrxTY8vexeY8o8boMl7X8BmnDqqIhCzbE+dAHr6VoF+nQw51iCZqX4ux/rkU+4vRbCNWRCww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qzf1cUgN; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3C6C1BF20A;
	Mon, 25 Nov 2024 08:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732524331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBSbJSvuZ6CrBeoc5GrX6zpHHc9Igs8o9O7xMVGZg0s=;
	b=Qzf1cUgNHJzAgx0yDB09viI0mZ7x4kFv5BK6aZhV4FbST/+MWs8zZFA/hyaK0xuzKMA/Fr
	NbIOS8tElkZq5FxyKzDVwQ4YNV9jcpsDZDqDrPxoptpaeB1bD3bBl/n7Jl1K3mkiz56G4v
	lHzlqPkC48Pw5HyI7VTol0Ns484cyWMNP5I1iA9uT/RuWsyzvank0X3ST32AD7zKcWcA6t
	9HzJXK2vhiJPwiOVJWFU53MLSUNw1Y2XB/MwmEN+ngWhtoUPY26/XZQgGf/z3FpDIsJcrS
	5Y3GxhBFQ4S0hGzf6lmMPq9JVJGASPKRbLeWQoxy7uUZVgt62zDIZCVTo29heg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 25 Nov 2024 09:45:15 +0100
Subject: [PATCH v3 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-fpc202-v3-1-34e86bcb5b56@bootlin.com>
References: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
In-Reply-To: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: romain.gantois@bootlin.com

The FPC202 dual port controller serves as a low speed signal aggregator for
common port types, notably SFP. It provides access to I2C and low-speed
GPIO signals of a downstream device through a single upstream control
interface.

Up to two logical I2C addresses can be accessed on each of the FPC202's
ports. The port controller acts as an I2C translator (ATR). It converts
addresses of incoming and outgoing I2C transactions. One use case of this
is accessing two SFP modules at logical address 0x50 from the same upstream
I2C controller, using two different client aliases.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../devicetree/bindings/misc/ti,fpc202.yaml        | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d0464a77cabed81301e27ac2fd4e7f943a027f2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/ti,fpc202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI FPC202 dual port controller with expanded IOs
+
+maintainers:
+  - Romain Gantois <romain.gantois@bootlin.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+properties:
+  compatible:
+    const: ti,fpc202
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  enable-gpios:
+    description:
+      Specifier for the GPIO connected to the EN pin.
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^i2c@[0-1]$":
+    $ref: /schemas/i2c/i2c-controller.yaml
+    description: Downstream device ports 0 and 1
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Downstream port ID
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - i2c@0
+  - i2c@1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-atr@f {
+            compatible = "ti,fpc202";
+            reg = <0xf>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            i2c@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+            };
+
+            i2c@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b878ddc99f94e7f6e8fa2c479c5a3f846c514730..8e702cefd2070790330eebf6d2a2b592cadb682d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23181,6 +23181,12 @@ F:	drivers/misc/tifm*
 F:	drivers/mmc/host/tifm_sd.c
 F:	include/linux/tifm.h
 
+TI FPC202 DUAL PORT CONTROLLER
+M:	Romain Gantois <romain.gantois@bootlin.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/ti,fpc202.yaml
+
 TI FPD-LINK DRIVERS
 M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	linux-media@vger.kernel.org

-- 
2.47.0


