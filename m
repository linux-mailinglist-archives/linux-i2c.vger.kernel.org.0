Return-Path: <linux-i2c+bounces-8020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B5F9D0E13
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 11:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270D71F22B26
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 10:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B661197A67;
	Mon, 18 Nov 2024 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ierVNdIw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64B193418;
	Mon, 18 Nov 2024 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924801; cv=none; b=rpgrGzyl9qWftS3refLh7rHS5IZEv2kK5wu/wKHiKCjxgjO0+Ri1t/HgBS5sshvewW0DHE0kBrIMexCvOHUcCsh12n5BAqwlH40ar3G6eoeexPJsdM4JFr1C1raQp4T2sPWB72ZlyGwBAeIMKY8vOdronsJb8Dxjvun5Np2AT2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924801; c=relaxed/simple;
	bh=rpY50y4tOKIqos/SRxkfGMhi7hg1ZYtbU6kompP85r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/kSPcIvDNQMyEsjK214twlHaf+2oszzTNvf0WMIpRjLWo2B4XFUFsLc3QD1llq7ypsJWg5GemeJ9NDT7l+ccB/U8fHdtq4u2ddl+vbsARcQP7ufYG7eTRLheXvo6U82s0YFig0ceeJ+Wjqdmwswq8GJtYSU65pnMqW4fW0Pezg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ierVNdIw; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAE731BF209;
	Mon, 18 Nov 2024 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731924790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jo7mC7tcn8WZUos/lTt/Ma33nH3tOfw/yDleh7Ei4x0=;
	b=ierVNdIwS16nz4zr4pxeyPNcyVhdtHkZWTzaEC7jr/0rvLUx0CwMlXo5dluBI00gwO+sHk
	bk06h6BTmYTn/Wo4TGbZSByE5V19qA/kIeE09AXx7A4fRToPadGbdXU2wAdaP11JaWk070
	0CuogTGGVe9F1vxJpfwX993t5yehoBg1/LK7dG0hgyX2Kqtcn5a5fr9y25563oPWbRD/jC
	ODXYz7Tf1mD9Iu7IeoJCNtRKED6G/l+e4nrX0+4CMfUUMkYu9dp6xiJ3vG/rOSs+VSNhX+
	t7naDt9D69HXyETyEUxYoGksaWZJgL+sozpInM+QMLtrawj6myMXQ5QPbux6gA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 18 Nov 2024 11:13:00 +0100
Subject: [PATCH v2 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-fpc202-v2-1-744e4f192a2d@bootlin.com>
References: <20241118-fpc202-v2-0-744e4f192a2d@bootlin.com>
In-Reply-To: <20241118-fpc202-v2-0-744e4f192a2d@bootlin.com>
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
 .../devicetree/bindings/misc/ti,fpc202.yaml        | 83 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1c7243f0325211d8cea3736cbe777c4318065b12
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
@@ -0,0 +1,83 @@
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


