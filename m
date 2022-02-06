Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05BE4AAF97
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Feb 2022 14:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240420AbiBFN5x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Feb 2022 08:57:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbiBFN5w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Feb 2022 08:57:52 -0500
X-Greylist: delayed 7071 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 05:57:50 PST
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B474CC043182;
        Sun,  6 Feb 2022 05:57:50 -0800 (PST)
Received: from [77.244.183.192] (port=63680 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nGgDK-00059v-PZ; Sun, 06 Feb 2022 13:00:18 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        matti.vaittinen@fi.rohmeurope.com
Subject: [RFCv3 3/6] media: dt-bindings: add DS90UB953-Q1 video serializer
Date:   Sun,  6 Feb 2022 12:59:36 +0100
Message-Id: <20220206115939.3091265-4-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206115939.3091265-1-luca@lucaceresoli.net>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Describe the Texas Instruments DS90UB953-Q1, a MIPI CSI-2 video serializer
with I2C Address Translator and remote GPIOs.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes RFCv2 -> RFCv3:

 - rewrite in yaml

Changes RFCv1 -> RFCv2: none, this patch is new in RFCv2
---
 .../bindings/media/i2c/ti,ds90ub953-q1.yaml   | 96 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 include/dt-bindings/media/ds90ub953.h         | 16 ++++
 3 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.yaml
 create mode 100644 include/dt-bindings/media/ds90ub953.h

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.yaml
new file mode 100644
index 000000000000..2a836a3e65e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2019 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub953-q1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DS90UB953-Q1 video serializer
+
+maintainers:
+  - Luca Ceresoli <luca@lucaceresoli.net>
+
+description: |
+  The TI DS90UB953-Q1 is a MIPI CSI-2 video serializer that forwards a MIPI
+  CSI-2 input video stream over an FPD Link 3 connection to a remote
+  deserializer. It also allows access to I2C and GPIO from the deserializer.
+
+  The DT definitions can be found in include/dt-bindings/media/ds90ub953.h
+
+  When used as a the remote counterpart of a deserializer (e.g. the
+  DS90UB954-Q1), the serializer is described in the
+  "deserializer/remote-chips/remote-chip@[01]" node.
+
+properties:
+  compatible:
+    const: ti,ds90ub953-q1
+
+  reg:
+    description: |
+      Index of the remote (serializer) RX port that this serializer is
+      connected to.
+    maxItems: 1
+
+  clocks:
+    description: FPD-Link line rate (provided by the deserializer)
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  '#clock-cells':
+    const: 0
+
+  ti,gpio-functions:
+    description: |
+      A list of 4 values defining how the 4 GPIO pins are connected in
+      hardware; possible values are:
+      - DS90_GPIO_FUNC_UNUSED (0): the GPIO is not unused
+      - DS90_GPIO_FUNC_INPUT (1): the GPIO is an input to the ds90ub953,
+        the remote chip (deserializer) can read its value
+      - DS90_GPIO_FUNC_OUTPUT_REMOTE (2): the GPIO is an output from the
+        ds90ub953, the remote chip (deserializer) can set its value
+      For unspecified values the GPIO is assumed to be unused.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 4
+
+patternProperties:
+  '^ti,ds90ub953-q1-(clk|d[0-3])-inv-pol-quirk$':
+    description: |
+      The MIPI CSI-2 input clock lane or any of the data lanes has inverted
+      polarity in hardware
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/media/ds90ub953.h>
+    remote-chips {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      remote-chip@0 {
+        reg = <0>;
+        compatible = "ti,ds90ub953-q1";
+        clocks = <&deser>;
+        ti,gpio-functions =
+          <DS90_GPIO_FUNC_UNUSED
+          DS90_GPIO_FUNC_OUTPUT_REMOTE
+          DS90_GPIO_FUNC_UNUSED
+          DS90_GPIO_FUNC_UNUSED>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        #clock-cells = <0>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 7383aec87e4a..4429ce035496 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19090,6 +19090,13 @@ F:	include/linux/dma/k3-udma-glue.h
 F:	include/linux/dma/ti-cppi5.h
 F:	include/linux/dma/k3-psil.h
 
+TEXAS INSTRUMENTS DS90UB953 VIDEO SERIALIZER DRIVER
+M:	Luca Ceresoli <luca@lucaceresoli.net>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.yaml
+F:	include/dt-bindings/media/ds90ub953.h
+
 TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
 M:	Nishanth Menon <nm@ti.com>
 M:	Tero Kristo <kristo@kernel.org>
diff --git a/include/dt-bindings/media/ds90ub953.h b/include/dt-bindings/media/ds90ub953.h
new file mode 100644
index 000000000000..5359432968e9
--- /dev/null
+++ b/include/dt-bindings/media/ds90ub953.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Definitions for the Texas Instruments DS90UB953-Q1 video serializer
+ *
+ * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
+ */
+
+#ifndef _DS90UB953_H
+#define _DS90UB953_H
+
+#define DS90_GPIO_FUNC_UNUSED             0
+#define DS90_GPIO_FUNC_INPUT              1
+#define DS90_GPIO_FUNC_OUTPUT_REMOTE      2
+#define DS90_GPIO_N_FUNCS                 3
+
+#endif /* _DS90UB953_H */
-- 
2.25.1

