Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB27E11748F
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 19:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbfLISnE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 13:43:04 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:34262 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726831AbfLISnA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 13:43:00 -0500
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
        by mail.bugwerft.de (Postfix) with ESMTPSA id AE0892E5CE4;
        Mon,  9 Dec 2019 18:29:09 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com, Daniel Mack <daniel@zonque.org>
Subject: [PATCH 04/10] dt-bindings: clock: Add documentation for AD242x clock providers
Date:   Mon,  9 Dec 2019 19:35:05 +0100
Message-Id: <20191209183511.3576038-6-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This device must be placed as a sub-device of an AD242x MFD node.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../bindings/clock/adi,ad242x-clk.yaml        | 32 +++++++++++++++++++
 include/dt-bindings/clock/adi,ad242x.h        |  9 ++++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
 create mode 100644 include/dt-bindings/clock/adi,ad242x.h

diff --git a/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml b/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
new file mode 100644
index 000000000000..f434b3e4928e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/adi,ad242x-clk.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analog Devices AD242x clock provider
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description: |
+  This module is part of the AD242x MFD device. For more details and an example
+  refer to Documentation/devicetree/bindings/mfd/ad242x.yaml.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2428w-clk
+
+  '#clock-cells':
+    const: 1
+
+  clock-output-names:
+    minItems: 2
+    maxItems: 2
+    description: |
+      Array of two strings to use as names for the generated output clocks
+
+required:
+  - compatible
+  - '#clock-cells'
\ No newline at end of file
diff --git a/include/dt-bindings/clock/adi,ad242x.h b/include/dt-bindings/clock/adi,ad242x.h
new file mode 100644
index 000000000000..307a6cd1f5a6
--- /dev/null
+++ b/include/dt-bindings/clock/adi,ad242x.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __DT_BINDINGS_AD242X_CLK_H
+#define __DT_BINDINGS_AD242X_CLK_H
+
+#define MAX9485_CLKOUT1        0
+#define MAX9485_CLKOUT2        1
+
+#endif /* __DT_BINDINGS_AD242X_CLK_H */
-- 
2.23.0

