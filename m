Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D73A51174AD
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 19:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfLISne (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 13:43:34 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:34250 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbfLISm4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 13:42:56 -0500
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 4558E2E5CE3;
        Mon,  9 Dec 2019 18:29:11 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com, Daniel Mack <daniel@zonque.org>
Subject: [PATCH 05/10] dt-bindings: sound: Add documentation for AD242x codecs
Date:   Mon,  9 Dec 2019 19:35:06 +0100
Message-Id: <20191209183511.3576038-7-daniel@zonque.org>
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
 .../bindings/sound/adi,ad242x-codec.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ad242x-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,ad242x-codec.yaml b/Documentation/devicetree/bindings/sound/adi,ad242x-codec.yaml
new file mode 100644
index 000000000000..2cfb6f9fc548
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,ad242x-codec.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/adi,ad242x-codec.yaml#"
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
+      - adi,ad2428w-codec
+
+  '#sound-dai-cells':
+    const: 1
+
+  adi,pdm-highpass-filter:
+    type: boolean
+    description: |
+      Enables highpass filtering for data received through the PDM ports
+
+required:
+  - compatible
+  - '#sound-dai-cells'
\ No newline at end of file
-- 
2.23.0

