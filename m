Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E02686EBAD5
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Apr 2023 20:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjDVSHn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Apr 2023 14:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjDVSHm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Apr 2023 14:07:42 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4944519B;
        Sat, 22 Apr 2023 11:07:41 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f1957e80a2so38092875e9.1;
        Sat, 22 Apr 2023 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682186860; x=1684778860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMC/WYCs+O5/GQ2fJfJkDG2YCTzb8/HxNIUvGlcuZ8Q=;
        b=OP4aDpB4OVKsFekT46euDox7xTbn1SprnPwhlkqr/E4JouEOqXnRTqPt3YIi7ySrWZ
         SetHDFRSYbCSveXqbDA5QxISnlH0VkJoHYXFBPC4GAQm2FJgkcw6vJNC9mb9bwd2A/om
         byMRO2F0m/ELzc9H0YTYVPT6PCZQwm8gfmEhZ/ACyqsXn8oC/G5giAVw7GGmvIBUiGV3
         epmtmR8+yWW+cR6slIEFCJGn8ptmBO4wU7ovlX4lehSBUGUW6/GRlzm5bft68olQdKnp
         JykGPx6UyFCb+tV7dATBu1Ai98bWnl9CkfKNHiFmOuRqqIJxgERnCPlrD7Tt0wq1+TAe
         42Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682186860; x=1684778860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMC/WYCs+O5/GQ2fJfJkDG2YCTzb8/HxNIUvGlcuZ8Q=;
        b=AdVifp/I8HzcxHPq5H3jY88ncbcez36iGGF8Gj25n0O7qriU1OKzcit9dSPH5efPmC
         r120/IzQ0ZCUYQu7X8Fmv3gsrrlW64ZwrUEedWFmNnTYf63uIqk2x6D5ETcgUpZL6UbI
         yt6KEJwGWFtAg5/H0Hm9cfqsjIGfPVYLC7GMaTfJDz3wPm11UzfTDMkVXvfKboJ3OBSp
         nr2mAQLVfnxzM6BxfkFFPN43hPSdMi7pVa8yCU86L8Xo1PviLIy8E5DBHcyZLqZ2m9BD
         FVEIqYPuAfWwn+ij5DQWz4uqRbVpFBYWbFj0M8TA75AxdBm9CkgAxpnuX7kJz+IaOmcb
         3COw==
X-Gm-Message-State: AAQBX9cb+odrlmUvonPTzkkXhs7R8Ynzw0LZtQDkvpIBsFRiOco1Pcuh
        xNhKMBS4NLUfYR/k2fGrHDs=
X-Google-Smtp-Source: AKy350br6PiT/AI7TGKfMADqaYGNrJ/6KKXZphHdYJRhn3yTL6zhwv5Vy7FMR5CffeNlA/KNhUZObA==
X-Received: by 2002:a05:600c:3b8e:b0:3f1:754e:69e6 with SMTP id n14-20020a05600c3b8e00b003f1754e69e6mr4256718wms.17.1682186859784;
        Sat, 22 Apr 2023 11:07:39 -0700 (PDT)
Received: from standask-GA-A55M-S2HP ([188.123.113.247])
        by smtp.gmail.com with ESMTPSA id q17-20020a1cf311000000b003eeb1d6a470sm7855243wmq.13.2023.04.22.11.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 11:07:39 -0700 (PDT)
Date:   Sat, 22 Apr 2023 20:07:37 +0200
From:   Stanislav Jakubek <stano.jakubek@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Message-ID: <9f4a9a8e20084ba895a309e7d2b78d2047a84ac6.1682185969.git.stano.jakubek@gmail.com>
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682185969.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682185969.git.stano.jakubek@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert Broadcom Kona family I2C bindings to DT schema.

Changes during conversion:
  - add used, but previously undocumented SoC-specific compatibles
  - drop references to SoCs that are not upstream
  - add supported clock frequencies according to the Linux driver [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/i2c/busses/i2c-bcm-kona.c#n731

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 .../devicetree/bindings/i2c/brcm,kona-i2c.txt | 35 -----------
 .../bindings/i2c/brcm,kona-i2c.yaml           | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt b/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
deleted file mode 100644
index 1b87b741fa8e..000000000000
--- a/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Broadcom Kona Family I2C
-=========================
-
-This I2C controller is used in the following Broadcom SoCs:
-
-  BCM11130
-  BCM11140
-  BCM11351
-  BCM28145
-  BCM28155
-
-Required Properties
--------------------
-- compatible: "brcm,bcm11351-i2c", "brcm,kona-i2c"
-- reg: Physical base address and length of controller registers
-- interrupts: The interrupt number used by the controller
-- clocks: clock specifier for the kona i2c external clock
-- clock-frequency: The I2C bus frequency in Hz
-- #address-cells: Should be <1>
-- #size-cells: Should be <0>
-
-Refer to clocks/clock-bindings.txt for generic clock consumer
-properties.
-
-Example:
-
-i2c@3e016000 {
-	compatible = "brcm,bcm11351-i2c","brcm,kona-i2c";
-	reg = <0x3e016000 0x80>;
-	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&bsc1_clk>;
-	clock-frequency = <400000>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml b/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml
new file mode 100644
index 000000000000..636912d8518d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/brcm,kona-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Kona family I2C controller
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - brcm,bcm11351-i2c
+        - brcm,bcm21664-i2c
+        - brcm,bcm23550-i2c
+      - const: brcm,kona-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    enum: [ 100000, 400000, 1000000, 3400000 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c@3e016000 {
+      compatible = "brcm,bcm11351-i2c", "brcm,kona-i2c";
+      reg = <0x3e016000 0x80>;
+      interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&bsc1_clk>;
+      clock-frequency = <400000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
+...
-- 
2.25.1

