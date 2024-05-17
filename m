Return-Path: <linux-i2c+bounces-3556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A78C86CB
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 14:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08F8EB21696
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 12:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AC854673;
	Fri, 17 May 2024 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="sYkG9chu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D34F887
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950735; cv=none; b=HBGkjTDumFQQwRgN8/wEOfnYtAp1YMKWhff7jRMclfG+GDKElnQwW8A/aCxHBllJYtU9lAQuBLKTzrwYjOCcHOyXh6Q/QK4r0fjAkGX6ZKv8XT0IfpmncbT6skvqzUnXAlemo0RW/shzu0rqp6Z+rt/A94RfRDavfvs1H3HvdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950735; c=relaxed/simple;
	bh=E71ly8foJT0aHkZA0E4KWODwmYGz89/hKVx+xoBMyzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkjQpYeJnapfV3HLeDvEvzYfHr4pxvHAVk8eVNOeGrUhhmS2WTj5eVkBErYoPafDk97tdvSxhxEg14iYnYNnW4L8hQBg3hHsg44k6HHViGTttQSMopI0PqbEg1KDEBTLwBXCeuCnO04b5sux5a1viCJVLhu87nvUFTLXLIq1Wlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=sYkG9chu; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: linux-i2c@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715950728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tl+q/jQrGvH8Zg3A/f5QNM02CauYUnImoBTtV4Mgvtk=;
	b=sYkG9chuB9PKF8rVZgeB8KsuUrww9cfYSftHd3krpTT8OgsAmS+BozINb68ThHW63t3bEa
	tG68OtCV+sMYWeNd2Kh/+57/uOPojV7I9MHXRFQkqSuX94FGcFBYO1aSmMdN1c2PBYP7ac
	7S5dHTxMwscKuxzg58pzJ1x+OxwNP5g6WrqeRTq6MNGtFQv91F/FhbGb97JU47Jo6AeATv
	VAEWUtNNSrwCNRCa9KbQ8FTkkLdpOJkn4QorlQ2O0m2tVvdqkoNRq+Nn3l6q08kwWee86A
	d2O1E9EFmK9KOdHoADcMxMvbDtIJSNy4kLMrRE/oCHw/2UqQ3zIOJJxbp7ivQQ==
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: perex@perex.cz
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: broonie@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: alsi@bang-olufsen.dk
X-Envelope-To: rafael@kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: tiwai@suse.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: brgl@bgdev.pl
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 14:58:01 +0200
Subject: [PATCH 03/13] dt-bindings: a2b: Analog Devices AD24xx devices
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-3-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Add device tree bindings for the AD24xx series A2B transceiver chips,
including their functional blocks.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 .../devicetree/bindings/a2b/adi,ad24xx-clk.yaml    |  53 +++++
 .../devicetree/bindings/a2b/adi,ad24xx-codec.yaml  |  52 +++++
 .../devicetree/bindings/a2b/adi,ad24xx-gpio.yaml   |  76 +++++++
 .../devicetree/bindings/a2b/adi,ad24xx-i2c.yaml    |  55 +++++
 .../devicetree/bindings/a2b/adi,ad24xx.yaml        | 253 +++++++++++++++++++++
 5 files changed, 489 insertions(+)

diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx-clk.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx-clk.yaml
new file mode 100644
index 000000000000..819efaa6a3f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx-clk.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/a2b/adi,ad24xx-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Inc. AD24xx clock functional block
+
+maintainers:
+  - Alvin Šipraga <alsi@bang-olufsen.dk>
+
+allOf:
+  - $ref: /schemas/clock/clock.yaml
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2420-clk
+      - adi,ad2421-clk
+      - adi,ad2422-clk
+      - adi,ad2425-clk
+      - adi,ad2426-clk
+      - adi,ad2427-clk
+      - adi,ad2428-clk
+      - adi,ad2429-clk
+
+required:
+  - compatible
+  - clock-output-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    a2b {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      node@1 {
+        compatible = "adi,ad2425-node";
+        reg = <1>;
+        interrupts = <1>;
+        adi,tdm-mode = <16>;
+        adi,tdm-slot-size = <32>;
+
+        clock {
+          compatible = "adi,ad2425-clk";
+          #clock-cells = <1>;
+          clock-indices = <1>;
+          clock-output-names = "A2B1 CLKOUT2";
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx-codec.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx-codec.yaml
new file mode 100644
index 000000000000..eee12f1c810e
--- /dev/null
+++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx-codec.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/a2b/adi,ad24xx-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Inc. AD24xx I2S/TDM functional block
+
+maintainers:
+  - Alvin Šipraga <alsi@bang-olufsen.dk>
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2403-codec
+      - adi,ad2410-codec
+      - adi,ad2425-codec
+      - adi,ad2428-codec
+      - adi,ad2429-codec
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    a2b {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      node@2 {
+        compatible = "adi,ad2428-node";
+        reg = <2>;
+        interrupts = <2>;
+        adi,tdm-mode = <8>;
+        adi,tdm-slot-size = <32>;
+
+        codec {
+          compatible = "adi,ad2428-codec";
+          #sound-dai-cells = <0>;
+          sound-name-prefix = "A2B Sub2";
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx-gpio.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx-gpio.yaml
new file mode 100644
index 000000000000..e2b99c711a47
--- /dev/null
+++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx-gpio.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/a2b/adi,ad24xx-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Inc. AD24xx GPIO functional block
+
+maintainers:
+  - Alvin Šipraga <alsi@bang-olufsen.dk>
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2401-gpio
+      - adi,ad2402-gpio
+      - adi,ad2403-gpio
+      - adi,ad2410-gpio
+      - adi,ad2420-gpio
+      - adi,ad2421-gpio
+      - adi,ad2422-gpio
+      - adi,ad2425-gpio
+      - adi,ad2426-gpio
+      - adi,ad2427-gpio
+      - adi,ad2428-gpio
+      - adi,ad2429-gpio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-line-names: true
+  gpio-reserved-ranges: true
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+dependencies:
+  interrupt-controller: [ '#interrupt-cells' ]
+  '#interrupt-cells': [ interrupt-controller ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    a2b {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      node@0 {
+        compatible = "adi,ad2428-node";
+        reg = <0>;
+        interrupts = <0>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        adi,tdm-mode = <16>;
+        adi,tdm-slot-size = <32>;
+
+        gpio {
+          compatible = "adi,ad2428-gpio";
+          interrupt-controller;
+          #interrupt-cells = <2>;
+          gpio-controller;
+          #gpio-cells = <2>;
+          gpio-reserved-ranges = <0 1>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx-i2c.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx-i2c.yaml
new file mode 100644
index 000000000000..ac52f184004d
--- /dev/null
+++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx-i2c.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/a2b/adi,ad24xx-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Inc. AD24xx I2C controller functional block
+
+maintainers:
+  - Alvin Šipraga <alsi@bang-olufsen.dk>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2401-i2c
+      - adi,ad2402-i2c
+      - adi,ad2403-i2c
+      - adi,ad2410-i2c
+      - adi,ad2420-i2c
+      - adi,ad2421-i2c
+      - adi,ad2422-i2c
+      - adi,ad2425-i2c
+      - adi,ad2426-i2c
+      - adi,ad2427-i2c
+      - adi,ad2428-i2c
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    a2b {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      node@1 {
+        compatible = "adi,ad2425-node";
+        reg = <1>;
+        interrupts = <1>;
+        adi,tdm-mode = <16>;
+        adi,tdm-slot-size = <32>;
+
+        i2c {
+          compatible = "adi,ad2425-i2c";
+          #address-cells = <1>;
+          #size-cells = <0>;
+          clock-frequency = <400000>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml
new file mode 100644
index 000000000000..dcda15e8032a
--- /dev/null
+++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml
@@ -0,0 +1,253 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/a2b/adi,ad24xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Inc. AD24xx Automotive Audio Bus A2B Transceiver
+
+description: |
+  AD24xx chips provide A2B bus functionality together with several peripheral
+  functions, including GPIO, I2S/TDM, an I2C controller interface, and
+  programmable clock outputs.
+
+maintainers:
+  - Alvin Šipraga <alsi@bang-olufsen.dk>
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2403
+      - adi,ad2410
+      - adi,ad2425
+      - adi,ad2428
+      - adi,ad2429
+
+  reg-names:
+    items:
+      - const: base
+      - const: bus
+
+  reg:
+    items:
+      - description: Normal I2C address of the chip
+      - description: Auxiliary BUS_ADDR I2C address of the chip
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  clock-names:
+    items:
+      - const: sync
+
+  clocks:
+    items:
+      - description: SYNC input pin clock source
+
+  vin-supply:
+    description: Optional regulator for supply voltage to VIN pin
+
+  bus-supply:
+    description: Optional regulator for out-of-band supply voltage to
+      subodrinate nodes' VIN pins
+
+  interrupts: true
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+patternProperties:
+  '^node@[0-9]+$':
+    type: object
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - adi,ad2401-node
+          - adi,ad2402-node
+          - adi,ad2403-node
+          - adi,ad2410-node
+          - adi,ad2420-node
+          - adi,ad2421-node
+          - adi,ad2422-node
+          - adi,ad2425-node
+          - adi,ad2426-node
+          - adi,ad2427-node
+          - adi,ad2428-node
+          - adi,ad2429-node
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 1
+
+      gpio:
+        $ref: adi,ad24xx-gpio.yaml#
+
+      codec:
+        $ref: adi,ad24xx-codec.yaml#
+
+      i2c:
+        $ref: adi,ad24xx-i2c.yaml#
+
+      clock:
+        $ref: adi,ad24xx-clk.yaml#
+
+      adi,tdm-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: TDM mode
+        enum: [2, 4, 8, 12, 16, 20, 24, 32]
+
+      adi,tdm-slot-size:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: TDM slot size
+        enum: [16, 32]
+
+      adi,invert-sync:
+        description: Falling edge of SYNC pin indicates the start of an audio
+          frame, as opposed to rising edge.
+        type: boolean
+
+      adi,early-sync:
+        description: The SYNC pin changes one cycle before the MSB of the first
+          data slot.
+        type: boolean
+
+      adi,alternating-sync:
+        description: Drive SYNC pin during first half of I2S/TDM data
+          transmission rather than just pulsing it for once cycle.
+        type: boolean
+
+      adi,rx-on-dtx1:
+        description: Use the DTX1 pin for I2S/TDM RX in place of the DRX1 pin.
+        type: boolean
+
+      adi,a2b-external-switch-mode-1:
+        description: Use external switch mode 1 instead of 0 on the assumption
+          that the downstream node is not using A2B bus power.
+        type: boolean
+
+      adi,drive-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Configures drive strength low (0) or high (1, default).
+        enum: [0, 1]
+        default: 1
+
+      adi,invert-interrupt:
+        description: Invert polarity of IRQ pin, making it active low.
+        type: boolean
+
+      adi,tristate-interrupt:
+        description: Rather than always actively driving the IRQ pin, only drive
+          when the interrupt is active and otherwise set to tristate (high-Z).
+        type: boolean
+
+    required:
+      - compatible
+      - reg
+      - adi,tdm-mode
+      - adi,tdm-slot-size
+
+    dependencies:
+      interrupt-controller: [ '#interrupt-cells' ]
+      '#interrupt-cells': [ interrupt-controller ]
+
+required:
+  - compatible
+  - reg-names
+  - reg
+  - clock-names
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - node@0
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sync_clk: sync-clock {
+          compatible = "fixed-clock";
+          #clock-cells = <0>;
+          clock-frequency = <48000>;
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      a2b@68 {
+        compatible = "adi,ad2428";
+        reg-names = "base", "bus";
+        reg = <0x68>, <0x69>;
+        clock-names = "sync";
+        clocks = <&sync_clk>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <42>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        node@0 {
+          compatible = "adi,ad2428-node";
+          reg = <0>;
+          interrupts = <0>;
+          adi,tdm-mode = <16>;
+          adi,tdm-slot-size = <32>;
+
+          codec {
+            compatible = "adi,ad2428-codec";
+            #sound-dai-cells = <0>;
+            sound-name-prefix = "A2B Main";
+          };
+        };
+
+        node@1 {
+          compatible = "adi,ad2425-node";
+          reg = <1>;
+          interrupts = <1>;
+          adi,tdm-mode = <8>;
+          adi,tdm-slot-size = <32>;
+
+          gpio {
+            compatible = "adi,ad2425-gpio";
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+          };
+
+          codec {
+            compatible = "adi,ad2425-codec";
+            #sound-dai-cells = <0>;
+            sound-name-prefix = "A2B Sub1";
+          };
+
+          i2c {
+            compatible = "adi,ad2425-i2c";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@50 {
+              compatible = "atmel,24c64";
+              reg = <0x50>;
+            };
+          };
+        };
+      };
+    };

-- 
2.44.0


