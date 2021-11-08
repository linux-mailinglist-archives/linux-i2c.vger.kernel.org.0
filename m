Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C494497AA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240779AbhKHPKj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:10:39 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:21281 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240781AbhKHPKA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384036; x=1667920036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2bunDyf7QdoO97mJxTZcNYPQXz2FP977/gYahndmmno=;
  b=s9Y2LfChTje/zvt0SStTGRBC8E1NGyQTWKbhedh9j1kwax/ZjJA+4EWG
   X1ZUddQ3SnEXpPw+93bsFvagnG3PcADWJ9jAQN2949ovgVVSZEvMq5vVe
   rvAf5hJQ8c7IYFdseMeN1cQsTaz0PsOAQ/F1LnF+rdW5zRMMxk6gRb1B7
   XVFYUsX/X5ScBGrHKV/hnlvIuR3NhaAlrsIbV8mvw3hyGDehy/orh3G3C
   W0U2r7QKGgYNgtWfCy+v+7zFZX47XfozB0AAUEznAC9LuA6zlAuzend07
   YQUEBv620DmYXvDFoSBQ5+JEa6/4gvIAP5N+FuP+zTYHz9XW1UzMobOjt
   Q==;
IronPort-SDR: J/W+WCXDkghFIAGAt5mOOrNV0DnRs7aFzNyIDg3V/oa+LvgnNE+h5CPqNTLdb7A6YoTZ6mIEp7
 ipxyL3AlrNVwdKccME4qlf7pvp26kpglWgNh0okRmn3SHI1/aWYjjQ+Tl9xnH/k4cUqzmm7Ibc
 KGzpx1N8EKxjss94+Ns1LRhIkrmGJ4l0oHWIcWS9kB2U+59mEjUomaZP4HyjRYBxxhBPtq/bp2
 NszeqTvHA1NTbFRe9qlGUdN4tnFHjiCsWNIYiKX2bpqfzgbjWMLQSwF92UmOWEMWS71ztartWo
 om3KGbOZbiW8yci3tXjX9PJA
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="75727263"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:07:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:07:10 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>
Subject: [PATCH 07/13] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date:   Mon, 8 Nov 2021 15:05:48 +0000
Message-ID: <20211108150554.4457-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the real time clock on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
new file mode 100644
index 000000000000..c82b3e7351e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
+
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+  - Lewis Hanly <lewis.hanly@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  prescaler:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rtc
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        rtc@20124000 {
+            compatible = "microchip,mpfs-rtc";
+            reg = <0 0x20124000 0 0x1000>;
+            clocks = <&clkcfg CLK_RTC>;
+            clock-names = "rtc";
+            interrupts = <80>;
+        };
+    };
+...
-- 
2.33.1

