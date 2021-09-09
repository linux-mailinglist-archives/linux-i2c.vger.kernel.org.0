Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7FE404395
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Sep 2021 04:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbhIICdp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Sep 2021 22:33:45 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]:55484 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbhIICdl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Sep 2021 22:33:41 -0400
Received: by codeconstruct.com.au (Postfix, from userid 10001)
        id 9F43020165; Thu,  9 Sep 2021 10:32:31 +0800 (AWST)
From:   Matt Johnston <matt@codeconstruct.com.au>
To:     devicetree@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>
Subject: [RFC PATCH v3] dt-bindings: net: New binding mctp-i2c-controller
Date:   Thu,  9 Sep 2021 10:32:15 +0800
Message-Id: <20210909023215.136490-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Used to define a local endpoint to communicate with MCTP peripherals
attached to an I2C bus. This I2C endpoint can communicate with remote
MCTP devices on the I2C bus.

In the example I2C topology below (matching the second yaml example) we
have MCTP devices on busses i2c1 and i2c6. MCTP-supporting busses are
indicated by the 'mctp-controller' DT property on an I2C bus node.

A mctp-i2c-controller I2C client DT node is placed at the top of the
mux topology, since only the root I2C adapter will support I2C slave
functionality.
                                               .-------.
                                               |eeprom |
    .------------.     .------.               /'-------'
    | adapter    |     | mux  --@0,i2c5------'
    | i2c1       ----.*|      --@1,i2c6--.--.
    |............|    \'------'           \  \  .........
    | mctp-i2c-  |     \                   \  \ .mctpB  .
    | controller |      \                   \  '.0x30   .
    |            |       \  .........        \  '.......'
    | 0x50       |        \ .mctpA  .         \ .........
    '------------'         '.0x1d   .          '.mctpC  .
                            '.......'          '.0x31   .
                                                '.......'
(mctpX boxes above are remote MCTP devices not included in the DT at
present, they can be hotplugged/probed at runtime. A DT binding for
specific fixed MCTP devices could be added later if required)

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

---

Compared to v2 this patch changes the MCTP indicator to being a property
on the I2C bus node.
(Previous patches went only to DT list, I've now CCed linux-i2c)

Wolfram does this look OK to you?

Thanks,
Matt
---
 Documentation/devicetree/bindings/i2c/i2c.txt |  4 +
 .../devicetree/bindings/net/mctp-i2c.yaml     | 94 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mctp-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index b864916e087f..fc3dd7ec0445 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -95,6 +95,10 @@ wants to support one of the below features, it should adapt these bindings.
 - smbus-alert
 	states that the optional SMBus-Alert feature apply to this bus.
 
+- mctp-controller
+	indicates that the system is accessible via this bus as an endpoint for
+	MCTP over I2C transport.
+
 Required properties (per child device)
 --------------------------------------
 
diff --git a/Documentation/devicetree/bindings/net/mctp-i2c.yaml b/Documentation/devicetree/bindings/net/mctp-i2c.yaml
new file mode 100644
index 000000000000..d0ff7fa9e114
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mctp-i2c.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/mctp-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MCTP I2C transport binding
+
+maintainers:
+  - Matt Johnston <matt@codeconstruct.com.au>
+
+description:
+  An mctp-i2c-controller defines a local MCTP endpoint on an I2C
+  controller. MCTP I2C is specified by DMTF DSP0237.
+
+  An mctp-i2c-controller must be attached to an I2C adapter
+  which supports slave functionality. I2C busses (either directly or as
+  subordinate mux busses) are attached to the mctp-i2c-controller with
+  a 'mctp-controller' property on each used bus. Each mctp-controller I2C bus
+  will be presented to the host system as a separate MCTP I2C instance.
+
+properties:
+  compatible:
+    const: mctp-i2c-controller
+
+  reg:
+    # 1<<30
+    minimum: 1073741824
+    # 1<<30 | 0x7f
+    maximum: 1073741951
+    description:
+      7 bit I2C address of the local endpoint.
+      I2C_OWN_SLAVE_ADDRESS (1<<30) flag must be set.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    // Basic case of a single I2C bus
+    #include <dt-bindings/i2c/i2c.h>
+
+    i2c0: i2cbus0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mctp-controller;
+
+      mctp@30 {
+        compatible = "mctp-i2c-controller";
+        reg = <(0x30 | I2C_OWN_SLAVE_ADDRESS)>;
+      };
+    };
+
+  - |
+    // Mux topology with multiple MCTP-handling busses under
+    // a single mctp-i2c-controller.
+    // i2c1 and i2c6 can have MCTP devices, i2c5 does not.
+    #include <dt-bindings/i2c/i2c.h>
+
+    i2c1: i2cbus1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mctp-controller;
+
+      mctp@50 {
+        compatible = "mctp-i2c-controller";
+        reg = <(0x50 | I2C_OWN_SLAVE_ADDRESS)>;
+      };
+    };
+
+    i2cmux0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      i2c-parent = <&i2c1>;
+
+      i2c5: i2c@0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0>;
+        eeprom@33 {
+          reg = <0x33>;
+        };
+      };
+
+      i2c6: i2c@1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <1>;
+        mctp-controller;
+      };
+    };
-- 
2.30.2

