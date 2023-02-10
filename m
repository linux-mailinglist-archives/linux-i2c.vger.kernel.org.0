Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85304691C96
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 11:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjBJKTF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 05:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbjBJKTE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 05:19:04 -0500
X-Greylist: delayed 359 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 10 Feb 2023 02:19:03 PST
Received: from mr85p00im-zteg06011501.me.com (mr85p00im-zteg06011501.me.com [17.58.23.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FCA6D8E6
        for <linux-i2c@vger.kernel.org>; Fri, 10 Feb 2023 02:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1676023984; bh=KFtwu33ECMShGMR+8RbNg0g2/vZHZBsmYaAmWtSkATg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=UaBFz76cdjjYzbcOrW8W49cxaGIe0fSmkAAyfh8p/y+X+P3NA8r1RlLcDiXsf2o44
         5Q872UKMzBwr3LEFbo3V1kb3tH6z19BMrFCd6+lmYp93GqdTsncn+wIliQ6pg1yTY+
         Qq0CxRUq8uXekZk3Vz98QFjPBsjW4/0buQ9iClx7CNIVJmy3PDYUgrT8H8XNML9LuG
         g5sG4EEoANSWnd5/Dc6ZQyc1d1ImdVoQs7xKNBVILIxvKnwrmV3ZSFfhtGXvKSTfDc
         vIMMT8dyIpda2mpWLRPkOY+xO6xYUd9aARj5yLYjreoTBfurcBk/0F9kRgl0dklC2W
         EmbRRqXq+qUoA==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
        by mr85p00im-zteg06011501.me.com (Postfix) with ESMTPSA id 3F1B4480B4B;
        Fri, 10 Feb 2023 10:13:04 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     Alain Volmat <avolmat@me.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: i2c: conversion of i2c-st into DT schema YAML
Date:   Fri, 10 Feb 2023 11:12:16 +0100
Message-Id: <20230210101218.14529-1-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

File st,i2c.yaml replaces i2c-st.txt for the i2c-st driver.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 .../devicetree/bindings/i2c/i2c-st.txt        | 41 -----------
 .../devicetree/bindings/i2c/st,sti-i2c.yaml   | 72 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 73 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-st.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-st.txt b/Documentation/devicetree/bindings/i2c/i2c-st.txt
deleted file mode 100644
index 4c26fda3844a..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-st.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-ST SSC binding, for I2C mode operation
-
-Required properties :
-- compatible : Must be "st,comms-ssc-i2c" or "st,comms-ssc4-i2c"
-- reg : Offset and length of the register set for the device
-- interrupts : the interrupt specifier
-- clock-names: Must contain "ssc".
-- clocks: Must contain an entry for each name in clock-names. See the common
-  clock bindings.
-- A pinctrl state named "default" must be defined to set pins in mode of
-  operation for I2C transfer.
-
-Optional properties :
-- clock-frequency : Desired I2C bus clock frequency in Hz. If not specified,
-  the default 100 kHz frequency will be used. As only Normal and Fast modes
-  are supported, possible values are 100000 and 400000.
-- st,i2c-min-scl-pulse-width-us : The minimum valid SCL pulse width that is
-  allowed through the deglitch circuit. In units of us.
-- st,i2c-min-sda-pulse-width-us : The minimum valid SDA pulse width that is
-  allowed through the deglitch circuit. In units of us.
-- A pinctrl state named "idle" could be defined to set pins in idle state
-  when I2C instance is not performing a transfer.
-- A pinctrl state named "sleep" could be defined to set pins in sleep state
-  when driver enters in suspend.
-
-
-
-Example :
-
-i2c0: i2c@fed40000 {
-	compatible	= "st,comms-ssc4-i2c";
-	reg		= <0xfed40000 0x110>;
-	interrupts	=  <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
-	clocks		= <&clk_s_a0_ls CLK_ICN_REG>;
-	clock-names	= "ssc";
-	clock-frequency = <400000>;
-	pinctrl-names	= "default";
-	pinctrl-0	= <&pinctrl_i2c0_default>;
-	st,i2c-min-scl-pulse-width-us = <0>;
-	st,i2c-min-sda-pulse-width-us = <5>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml
new file mode 100644
index 000000000000..dd6ff18b9ed7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/st,sti-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in STMicroelectronics STi platform
+
+maintainers:
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,comms-ssc-i2c
+      - st,comms-ssc4-i2c
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
+  clock-names:
+    maxItems: 1
+
+  clock-frequency:
+    enum: [ 100000, 400000 ]
+
+  st,i2c-min-scl-pulse-width-us:
+    description:
+      The minimum valid SCL pulse width that is allowed through the
+      deglitch circuit. In units of us.
+    maxItems: 1
+
+  st,i2c-min-sda-pulse-width-us:
+    description:
+      The minimum valid SDA pulse width that is allowed through the
+      deglitch circuit. In units of us.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stih407-clks.h>
+    i2c@fed40000 {
+        compatible	= "st,comms-ssc4-i2c";
+        reg		= <0xfed40000 0x110>;
+        interrupts	=  <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+        clocks		= <&clk_s_a0_ls CLK_ICN_REG>;
+        clock-names	= "ssc";
+        clock-frequency = <400000>;
+        pinctrl-names	= "default";
+        pinctrl-0	= <&pinctrl_i2c0_default>;
+        st,i2c-min-scl-pulse-width-us = <0>;
+        st,i2c-min-sda-pulse-width-us = <5>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 06d5be2c713c..2e32eb8d44f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2925,7 +2925,7 @@ M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://www.stlinux.com
-F:	Documentation/devicetree/bindings/i2c/i2c-st.txt
+F:	Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml
 F:	arch/arm/boot/dts/sti*
 F:	arch/arm/mach-sti/
 F:	drivers/ata/ahci_st.c
-- 
2.34.1

