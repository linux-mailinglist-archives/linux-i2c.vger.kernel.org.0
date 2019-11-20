Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA10103C72
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 14:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbfKTNoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 08:44:00 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:3018 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729779AbfKTNn7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Nov 2019 08:43:59 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAKDbVIB031076;
        Wed, 20 Nov 2019 14:43:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=l2oEHQGrIM4V5LvnrIZMo4o2Hgyea9ZVNyLN4gpA8XM=;
 b=mk1X5g3m47C67kcYK+k5ht2NtO+hcFisgT36JNuOBoTfnYsKEVMy9i6ytErtcfMZCl57
 qnsyZ6Zy0TBAPBtdK7EkSwEkkyWZIxt2+8jYkTbV6vXGxtqmSIwsGmXQ9Dv2puqvaZxL
 m6UREJMCpn0DOVqaD88+GtzSmTBFhPhoE8jQXIIWD00e5aqW7oBqpFF2vbBh+N9jXdos
 0o/N5rbqK8evm1FxFUyL9JSjei56ZC4HUDuK5R8b/10PWAWCnwTO8uZOoVEEQWuskF20
 fdLlmZBAfC5XcMlYgYwU/FhSdrC6WCdLNmUfh82fzAZ1Z7tQYjmm+6yzNnXmkOZggyWF Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wa9up69qa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Nov 2019 14:43:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AA4010002A;
        Wed, 20 Nov 2019 14:43:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 175782BAB68;
        Wed, 20 Nov 2019 14:43:44 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 20 Nov 2019 14:43:43
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] dt-bindings: i2c: stm32: Migrate i2c-stm32 documentation to yaml
Date:   Wed, 20 Nov 2019 14:43:43 +0100
Message-ID: <1574257423-26754-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_04:2019-11-15,2019-11-20 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The document was migrated to Yaml format and renamed st,stm32-i2c.yaml

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 .../devicetree/bindings/i2c/i2c-stm32.txt          |  65 ---------
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      | 157 +++++++++++++++++++++
 2 files changed, 157 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-stm32.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-stm32.txt b/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
deleted file mode 100644
index ce3df2fff6c8..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-* I2C controller embedded in STMicroelectronics STM32 I2C platform
-
-Required properties:
-- compatible: Must be one of the following
-  - "st,stm32f4-i2c"
-  - "st,stm32f7-i2c"
-- reg: Offset and length of the register set for the device
-- interrupts: Must contain the interrupt id for I2C event and then the
-  interrupt id for I2C error.
-- resets: Must contain the phandle to the reset controller.
-- clocks: Must contain the input clock of the I2C instance.
-- A pinctrl state named "default" must be defined to set pins in mode of
-  operation for I2C transfer
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties:
-- clock-frequency: Desired I2C bus clock frequency in Hz. If not specified,
-  the default 100 kHz frequency will be used.
-  For STM32F4 SoC Standard-mode and Fast-mode are supported, possible values are
-  100000 and 400000.
-  For STM32F7, STM32H7 and STM32MP1 SoCs, Standard-mode, Fast-mode and Fast-mode
-  Plus are supported, possible values are 100000, 400000 and 1000000.
-- dmas: List of phandles to rx and tx DMA channels. Refer to stm32-dma.txt.
-- dma-names: List of dma names. Valid names are: "rx" and "tx".
-- i2c-scl-rising-time-ns: I2C SCL Rising time for the board (default: 25)
-  For STM32F7, STM32H7 and STM32MP1 only.
-- i2c-scl-falling-time-ns: I2C SCL Falling time for the board (default: 10)
-  For STM32F7, STM32H7 and STM32MP1 only.
-  I2C Timings are derived from these 2 values
-- st,syscfg-fmp: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
-  Plus speed is selected by slave.
-	1st cell: phandle to syscfg
-	2nd cell: register offset within SYSCFG
-	3rd cell: register bitmask for FMP bit
-  For STM32F7, STM32H7 and STM32MP1 only.
-
-Example:
-
-	i2c@40005400 {
-		compatible = "st,stm32f4-i2c";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x40005400 0x400>;
-		interrupts = <31>,
-			     <32>;
-		resets = <&rcc 277>;
-		clocks = <&rcc 0 149>;
-		pinctrl-0 = <&i2c1_sda_pin>, <&i2c1_scl_pin>;
-		pinctrl-names = "default";
-	};
-
-	i2c@40005400 {
-		compatible = "st,stm32f7-i2c";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x40005400 0x400>;
-		interrupts = <31>,
-			     <32>;
-		resets = <&rcc STM32F7_APB1_RESET(I2C1)>;
-		clocks = <&rcc 1 CLK_I2C1>;
-		pinctrl-0 = <&i2c1_sda_pin>, <&i2c1_scl_pin>;
-		pinctrl-names = "default";
-		st,syscfg-fmp = <&syscfg 0x4 0x1>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
new file mode 100644
index 000000000000..0f51a6ed0e9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/st,stm32-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in STMicroelectronics STM32 I2C platform
+
+maintainers:
+  - Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32f7-i2c
+    then:
+      properties:
+        i2c-scl-rising-time-ns:
+          description: I2C SCL Rising time for the board
+          $ref: /schemas/types.yaml#/definitions/uint32
+          default: 25
+
+        i2c-scl-falling-time-ns:
+          description: I2C SCL Falling time for the board
+          $ref: /schemas/types.yaml#/definitions/uint32
+          default: 10
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32f4-i2c
+    then:
+      properties:
+        clock-frequency:
+          description: Desired I2C bus clock frequency in Hz. If not specified,
+                       the default 100 kHz frequency will be used.
+                       For STM32F4 SoC Standard-mode and Fast-mode are
+                       supported, possible values are 100000 and 400000.
+          default: 100000
+          enum: [100000, 400000]
+    else:
+      properties:
+        clock-frequency:
+          description: Desired I2C bus clock frequency in Hz. If not specified,
+                       the default 100 kHz frequency will be used.
+                       For STM32F7, STM32H7 and STM32MP1 SoCs, Standard-mode,
+                       Fast-mode and Fast-mode Plus are supported, possible
+                       values are 100000, 400000 and 1000000.
+          default: 100000
+          enum: [100000, 400000, 1000000]
+
+        st,syscfg-fmp:
+          $ref: "/schemas/types.yaml#/definitions/phandle-array"
+          description: Use to set Fast Mode Plus bit within SYSCFG when
+                       Fast Mode Plus speed is selected by slave. Should be
+                       phandle/offset/mask
+          items:
+            - description: phandle to syscfg
+            - description: register offset within syscfg
+            - description: register bitmask for FMP bit
+
+properties:
+  compatible:
+    enum:
+      - st,stm32f4-i2c
+      - st,stm32f7-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
+    items:
+      - description: interrupt ID for I2C event
+      - description: interrupt ID for I2C error
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: RX DMA Channel phandle
+      - description: TX DMA Channel phandle
+    minItems: 2
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+    minItems: 2
+    maxItems: 2
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - reg
+  - interrupts
+  - resets
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/mfd/stm32f7-rcc.h>
+    #include <dt-bindings/clock/stm32fx-clock.h>
+    //Example 1 (with st,stm32f4-i2c compatible)
+      i2c@40005400 {
+          compatible = "st,stm32f4-i2c";
+          #address-cells = <1>;
+          #size-cells = <0>;
+          reg = <0x40005400 0x400>;
+          interrupts = <31>,
+                       <32>;
+          resets = <&rcc 277>;
+          clocks = <&rcc 0 149>;
+      };
+
+    //Example 2 (with st,stm32f7-i2c compatible)
+      i2c@40005800 {
+          compatible = "st,stm32f7-i2c";
+          #address-cells = <1>;
+          #size-cells = <0>;
+          reg = <0x40005800 0x400>;
+          interrupts = <31>,
+                       <32>;
+          resets = <&rcc STM32F7_APB1_RESET(I2C1)>;
+          clocks = <&rcc 1 CLK_I2C1>;
+      };
+
+    //Example 3 (with st,stm32f7-i2c compatible on stm32mp)
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+      i2c@40013000 {
+          compatible = "st,stm32f7-i2c";
+          #address-cells = <1>;
+          #size-cells = <0>;
+          reg = <0x40013000 0x400>;
+          interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+                       <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&rcc I2C2_K>;
+          resets = <&rcc I2C2_R>;
+          i2c-scl-rising-time-ns = <185>;
+          i2c-scl-falling-time-ns = <20>;
+          st,syscfg-fmp = <&syscfg 0x4 0x2>;
+      };
+...
-- 
2.7.4

