Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A326EBF7E
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Apr 2023 14:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjDWMkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Apr 2023 08:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjDWMkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Apr 2023 08:40:23 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436E91726;
        Sun, 23 Apr 2023 05:40:22 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-2f95231618aso2060130f8f.1;
        Sun, 23 Apr 2023 05:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682253621; x=1684845621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zo9wJCHv4Oo4xHmcfbocaOEILn2riMVbCffKcYD70nU=;
        b=FLL8vAzlZWtV+BbaSTC75869ZSmC5pSjZ8ceJoWgnpgy1s+pe5zAb8e2MQA96PVk6R
         6FA5u/Ijc9pQmzG8kyR8V/0SQ0hotstpegRt39vcHn6SvJjR1SzlLGaVKGVfD1I0fw1P
         F1lpAC54YKfJtfJRC+W+hkr0SFSzy+gA2CoyR3zHKBVxfx744anSZNHodpYTT6fSaQxp
         olguK7uZBjPGbThp0Sx9mumF7FtWt2WYiX27WGIYWYa8mcHe+h7a/7+SwvbgtaAJft7f
         v6V2NwrIEgrsdjhtYvLFdsE0KilqefDZEn51ubSHzWRXXKdWYELICdiqWqVHNGi3tRAR
         xjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682253621; x=1684845621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo9wJCHv4Oo4xHmcfbocaOEILn2riMVbCffKcYD70nU=;
        b=MMFdaS89Qpei+GN6g6bBPqzYREccT2zIxYxPCpeDA4362hxdxMy9PLSYQTigQXfhXx
         g/0KUy2vlNYsMHjU8FhaHmFJNDt3yoE02UnGzPMq8vgK/OOCSEKEXIZ1d0p/J1/AYBNC
         lZcMwGIFT3xofHEwg+Uo4oFcNaAnaeVFzW0EyWXEcXp3OlUI4I032qiYwiibOtRPgaal
         vTgQ0WQJmInJK7Y8qByQF2b/l7em9aNiwz359L8L9iURBEm6J7P3SEpWu+vpE2fgjpID
         3ZrdF8O3eoWGuUtkqTF5ZzbtgSbPlDjxYzVW57JoF3guf6i9Y1XRhHISYs0E39cTX5Mj
         B/DQ==
X-Gm-Message-State: AAQBX9cY78C4rS+FRRFBcMRltr9O13Z1g3CqWHNR1gsEcB0OtJxky+bv
        lPfXc9xuL0yVk2TKNlxXKpw=
X-Google-Smtp-Source: AKy350ale8DTeU3rstHGIHi+s8KZ+KcjckZueD1LAWiwhKV4Kc/QSjBAbrxaTpJEd4hPzsVk9jE17g==
X-Received: by 2002:adf:d4c6:0:b0:2ce:aa2d:c625 with SMTP id w6-20020adfd4c6000000b002ceaa2dc625mr7343766wrk.22.1682253620512;
        Sun, 23 Apr 2023 05:40:20 -0700 (PDT)
Received: from standask-GA-A55M-S2HP ([188.123.113.247])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d5246000000b002fe87e0706bsm8550789wrc.97.2023.04.23.05.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 05:40:20 -0700 (PDT)
Date:   Sun, 23 Apr 2023 14:40:18 +0200
From:   Stanislav Jakubek <stano.jakubek@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Message-ID: <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
Changes in v2:
 - add missing arm-gic.h include
 - fix indentation to 4 spaces
 
 .../devicetree/bindings/i2c/brcm,kona-i2c.txt | 35 -----------
 .../bindings/i2c/brcm,kona-i2c.yaml           | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 35 deletions(-)
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
index 000000000000..7a694af90fc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml
@@ -0,0 +1,59 @@
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
+          - brcm,bcm11351-i2c
+          - brcm,bcm21664-i2c
+          - brcm,bcm23550-i2c
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c@3e016000 {
+        compatible = "brcm,bcm11351-i2c", "brcm,kona-i2c";
+        reg = <0x3e016000 0x80>;
+        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&bsc1_clk>;
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
+...
-- 
2.25.1

