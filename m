Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B877775DB95
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 11:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjGVJ5T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 05:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjGVJ5S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 05:57:18 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA53C10F4
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jul 2023 02:57:16 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992ace062f3so440854266b.2
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jul 2023 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690019835; x=1690624635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woFGdxs67jlM9TolmaMHkh2hVrHZae/JREG4F0Tldjs=;
        b=rHT92357naLfyIvlUABWxIna5SLJFAluExAXbwKDVyDgIdrbVckRvqwTKDOni4CPT+
         YWzleJ20spX7sevP+hGBlldGXWdh+zyNYcSAwhDaCssHi2cUcGu48N/VvW+h8L5A7mFX
         xafH6BOnDA7cFuC6NVPtV21KcwlF3NFpjnWflcml/02+p3BGihvqRwTniLFtXtshHWBC
         Q4W3K2AiWT8rKEK8Zcw1/UfPX9Btln7wZcEn2AoMdm9n8xzMpHFjgTxl2SHjVhCN/x2F
         mngFw8Ylm6OdUk0CFnb3/mBVtMZiLSLWR3TrpNM/VjLigngH0Ev6qT3nm3E9M8/aXCBR
         liyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690019835; x=1690624635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woFGdxs67jlM9TolmaMHkh2hVrHZae/JREG4F0Tldjs=;
        b=B6aAMXvHmeXJglPPw8fPVc/2aX3sQcwqeho/M/FppolsFktnesMN7xLMqyZvj6TL0G
         SEsGfD0iUgd5EhZG+PMyxJdIDbxvqriOdpLJ4pecYKkklxHqlyxLtl+M/QlJjjiks04j
         r79cyKhca1kD3vACGBH4gRMx0zn/WHKMYj9I9HnwQ9T7KumI4GEZyYBVfePmt8+8Dfe7
         O8EdrSHjc/WRnde/UElEQOkrDSTccFGyLoSOn56hIhXpqlVHVVapk5rR0xe+gAgxmhFM
         ZS78OoWmYPDZF2nYn7KHGulqPIdwcUY/sxwO/7qQ/jZMJf+ucVSqGyVFUdQiOUF/syCf
         0jMA==
X-Gm-Message-State: ABy/qLZgZj7ZSOfR/5g7Q/D//89wxRrW2Hjc01mnoF+RO1iv9mUS6ro+
        f/Ei2II8KbStj3iiex37PBlhvQ==
X-Google-Smtp-Source: APBJJlEO4imdHPS8TaUhZOyM72jJlHITdv2EKtv7i+fQLJ0hJmS4SBw1Sdj7LLrxG4P+HaQG0xeDtA==
X-Received: by 2002:a17:906:3f1e:b0:99b:504d:d9c7 with SMTP id c30-20020a1709063f1e00b0099b504dd9c7mr4313666ejj.67.1690019835200;
        Sat, 22 Jul 2023 02:57:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090648cc00b00992b7ff3993sm3281038ejt.126.2023.07.22.02.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 02:57:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: i2c: arb-gpio-challange: convert to DT schema
Date:   Sat, 22 Jul 2023 11:57:10 +0200
Message-Id: <20230722095710.17496-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
References: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the bindings for GPIO-based I2C Arbitration Using a Challenge &
Response Mechanism to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Douglas Anderson <dianders@chromium.org>

---

The text of original bindings was written by Doug, so please kindly ack
if you agree to relicense it from GPL-2 to (GPL-2.0-only OR
BSD-2-Clause).

Changes in v2:
1. Drop i2c-controller $ref in top-level part, because only children are
   I2C controllers.
2. Add Ack.
---
 .../bindings/i2c/i2c-arb-gpio-challenge.txt   |  82 -----------
 .../bindings/i2c/i2c-arb-gpio-challenge.yaml  | 135 ++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-arb.txt       |  35 -----
 3 files changed, 135 insertions(+), 117 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
deleted file mode 100644
index 548a73cde796..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
+++ /dev/null
@@ -1,82 +0,0 @@
-GPIO-based I2C Arbitration Using a Challenge & Response Mechanism
-=================================================================
-This uses GPIO lines and a challenge & response mechanism to arbitrate who is
-the master of an I2C bus in a multimaster situation.
-
-In many cases using GPIOs to arbitrate is not needed and a design can use
-the standard I2C multi-master rules.  Using GPIOs is generally useful in
-the case where there is a device on the bus that has errata and/or bugs
-that makes standard multimaster mode not feasible.
-
-Note that this scheme works well enough but has some downsides:
-* It is nonstandard (not using standard I2C multimaster)
-* Having two masters on a bus in general makes it relatively hard to debug
-  problems (hard to tell if i2c issues were caused by one master, another, or
-  some device on the bus).
-
-
-Algorithm:
-
-All masters on the bus have a 'bus claim' line which is an output that the
-others can see. These are all active low with pull-ups enabled.  We'll
-describe these lines as:
-
-- OUR_CLAIM: output from us signaling to other hosts that we want the bus
-- THEIR_CLAIMS: output from others signaling that they want the bus
-
-The basic algorithm is to assert your line when you want the bus, then make
-sure that the other side doesn't want it also.  A detailed explanation is best
-done with an example.
-
-Let's say we want to claim the bus.  We:
-1. Assert OUR_CLAIM.
-2. Waits a little bit for the other sides to notice (slew time, say 10
-   microseconds).
-3. Check THEIR_CLAIMS.  If none are asserted then the we have the bus and we are
-   done.
-4. Otherwise, wait for a few milliseconds and see if THEIR_CLAIMS are released.
-5. If not, back off, release the claim and wait for a few more milliseconds.
-6. Go back to 1 (until retry time has expired).
-
-
-Required properties:
-- compatible: i2c-arb-gpio-challenge
-- our-claim-gpio: The GPIO that we use to claim the bus.
-- their-claim-gpios: The GPIOs that the other sides use to claim the bus.
-  Note that some implementations may only support a single other master.
-- I2C arbitration bus node. See i2c-arb.txt in this directory.
-
-Optional properties:
-- slew-delay-us: microseconds to wait for a GPIO to go high. Default is 10 us.
-- wait-retry-us: we'll attempt another claim after this many microseconds.
-    Default is 3000 us.
-- wait-free-us: we'll give up after this many microseconds. Default is 50000 us.
-
-
-Example:
-	i2c@12ca0000 {
-		compatible = "acme,some-i2c-device";
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	i2c-arbitrator {
-		compatible = "i2c-arb-gpio-challenge";
-
-		i2c-parent = <&{/i2c@12CA0000}>;
-
-		our-claim-gpio = <&gpf0 3 1>;
-		their-claim-gpios = <&gpe0 4 1>;
-		slew-delay-us = <10>;
-		wait-retry-us = <3000>;
-		wait-free-us = <50000>;
-
-		i2c-arb {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			i2c@52 {
-				// Normal I2C device
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml
new file mode 100644
index 000000000000..5bf6ce14c2dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-arb-gpio-challenge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-based I2C Arbitration Using a Challenge & Response Mechanism
+
+maintainers:
+  - Doug Anderson <dianders@chromium.org>
+  - Peter Rosin <peda@axentia.se>
+
+description: |
+  This uses GPIO lines and a challenge & response mechanism to arbitrate who is
+  the master of an I2C bus in a multimaster situation.
+
+  In many cases using GPIOs to arbitrate is not needed and a design can use the
+  standard I2C multi-master rules.  Using GPIOs is generally useful in the case
+  where there is a device on the bus that has errata and/or bugs that makes
+  standard multimaster mode not feasible.
+
+  Note that this scheme works well enough but has some downsides:
+   * It is nonstandard (not using standard I2C multimaster)
+   * Having two masters on a bus in general makes it relatively hard to debug
+     problems (hard to tell if i2c issues were caused by one master, another,
+     or some device on the bus).
+
+  Algorithm:
+  All masters on the bus have a 'bus claim' line which is an output that the
+  others can see. These are all active low with pull-ups enabled.  We'll
+  describe these lines as:
+   * OUR_CLAIM: output from us signaling to other hosts that we want the bus
+   * THEIR_CLAIMS: output from others signaling that they want the bus
+
+  The basic algorithm is to assert your line when you want the bus, then make
+  sure that the other side doesn't want it also.  A detailed explanation is
+  best done with an example.
+
+  Let's say we want to claim the bus.  We:
+  1. Assert OUR_CLAIM.
+  2. Waits a little bit for the other sides to notice (slew time, say 10
+     microseconds).
+  3. Check THEIR_CLAIMS.  If none are asserted then the we have the bus and we
+     are done.
+  4. Otherwise, wait for a few milliseconds and see if THEIR_CLAIMS are released.
+  5. If not, back off, release the claim and wait for a few more milliseconds.
+  6. Go back to 1 (until retry time has expired).
+
+properties:
+  compatible:
+    const: i2c-arb-gpio-challenge
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The I2C bus that this multiplexer's master-side port is connected to.
+
+  our-claim-gpios:
+    maxItems: 1
+    description:
+      The GPIO that we use to claim the bus.
+
+  slew-delay-us:
+    default: 10
+    description:
+      Time to wait for a GPIO to go high.
+
+  their-claim-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      The GPIOs that the other sides use to claim the bus.  Note that some
+      implementations may only support a single other master.
+
+  wait-free-us:
+    default: 50000
+    description:
+      We'll give up after this many microseconds.
+
+  wait-retry-us:
+    default: 3000
+    description:
+      We'll attempt another claim after this many microseconds.
+
+  i2c-arb:
+    type: object
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+    description:
+      I2C arbitration bus node.
+
+required:
+  - compatible
+  - i2c-arb
+  - our-claim-gpios
+  - their-claim-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c-arbitrator {
+        compatible = "i2c-arb-gpio-challenge";
+        i2c-parent = <&i2c_4>;
+
+        our-claim-gpios = <&gpf0 3 GPIO_ACTIVE_LOW>;
+        their-claim-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
+        slew-delay-us = <10>;
+        wait-retry-us = <3000>;
+        wait-free-us = <50000>;
+
+        i2c-arb {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            sbs-battery@b {
+                compatible = "sbs,sbs-battery";
+                reg = <0xb>;
+                sbs,poll-retry-count = <1>;
+            };
+
+            embedded-controller@1e {
+                compatible = "google,cros-ec-i2c";
+                reg = <0x1e>;
+                interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-parent = <&gpx1>;
+                pinctrl-names = "default";
+                pinctrl-0 = <&ec_irq>;
+                wakeup-source;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-arb.txt b/Documentation/devicetree/bindings/i2c/i2c-arb.txt
deleted file mode 100644
index 59abf9277bdc..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-arb.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Common i2c arbitration bus properties.
-
-- i2c-arb child node
-
-Required properties for the i2c-arb child node:
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties for i2c-arb child node:
-- Child nodes conforming to i2c bus binding
-
-
-Example :
-
-	/*
-	   An NXP pca9541 I2C bus master selector at address 0x74
-	   with a NXP pca8574 GPIO expander attached.
-	 */
-
-	arb@74 {
-		compatible = "nxp,pca9541";
-		reg = <0x74>;
-
-		i2c-arb {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			gpio@38 {
-				compatible = "nxp,pca8574";
-				reg = <0x38>;
-				#gpio-cells = <2>;
-				gpio-controller;
-			};
-		};
-	};
-- 
2.34.1

