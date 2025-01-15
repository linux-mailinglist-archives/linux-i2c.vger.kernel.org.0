Return-Path: <linux-i2c+bounces-9098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693FA11D96
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 10:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C6AF160EEF
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 09:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EB924816F;
	Wed, 15 Jan 2025 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d0jRktLp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983E248192;
	Wed, 15 Jan 2025 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933169; cv=none; b=O2bX46BXADZkfuN3yCoKDZwAnh2c5yDFWCefETg+hpPDU5pNV/P25QnlpnXE66f41j825npHEkbDoj0VvCWvCnzdm/2bzRLYMoYUViK7yKBlZXUFgV4fXAtSYXO6Go9q/FZ1uQ3HSIM5xWupDmBTnMzc1vyelRPo/ELiaI4ryF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933169; c=relaxed/simple;
	bh=xFP/+4SRBKGjb6aPu8oH1KuzF2unchTIsEVX/r+gJCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccKLJL/HF2+dtbtm+e/jZsY7SVDH32bcMkrPA4ad9kKSPgERPwu3pJ1XyWns4GEmdYgXMpqM3sAa233WdmSCbklbwg01IPEpxJMWb7WZSMymS4H9vPX805ffcI8rr5ocdpbMGp7y3HQH3ptIm+ub0TuVVQ2H1+vm6DPWCzLGsak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d0jRktLp; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06F56FF809;
	Wed, 15 Jan 2025 09:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736933165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZAZNWhpm8ToAVmITFQtJEb8rZQTtFaBaFXMR732Xr0=;
	b=d0jRktLpxKAfsjOuo7QPDtqnjSiC8eqiJ5fTq9nSScI1P1kcpuNZPtEOqmF9DfqANlPPDP
	gAj0Zroy26I8zBjeJlAMZ5COmKVeYA0G7WgWNL0XkkyAK6ySS0ZbDdxdAr4CN3oibsbRki
	OjP7ymUjL0cZY9BQiswmPuDCCEN2GEBM9TQPVTs3hkSOGKKAO4Cn4BYRqfVF8D5PqFBS/v
	EpijD8ka42P0jTHmrTcVLpBrwKQ6I37KrY9M87Y7bqradiKo0sjOYL9/iLUYLpv+TCAOBq
	0dWjXMtHFRhJnm9QQoz0WrMdsdzQMDU+cfvLw5weFTA1jblbzUw/qskmqRIQEw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 15 Jan 2025 10:25:38 +0100
Subject: [PATCH v6 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fpc202-v6-1-d47a34820753@bootlin.com>
References: <20250115-fpc202-v6-0-d47a34820753@bootlin.com>
In-Reply-To: <20250115-fpc202-v6-0-d47a34820753@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../devicetree/bindings/misc/ti,fpc202.yaml        | 94 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a8cb10f2d0df3fa5224f95f6f87467a8bce253bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
@@ -0,0 +1,94 @@
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
+    $ref: /schemas/i2c/i2c-controller.yaml#
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
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - "#address-cells"
+  - "#size-cells"
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
index 1e930c7a58b13d8bbe6bf133ba7b36aa24c2b5e0..2ef5c0d395b3668167dddbd27237a2177f85571e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23497,6 +23497,12 @@ F:	drivers/misc/tifm*
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
2.47.1


