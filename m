Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B291537BBAC
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 13:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhELLVj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 07:21:39 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:28592 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhELLVi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 07:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620818431; x=1652354431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zwiMNpH52oThAx+DRM/Rg2UQqBGkObA2mjbPzwcNt18=;
  b=RXtuZ9QP9i1rSKLZMojA/yctqxYsj93UFoUl09g3EDFNMyIJV3h2sUhj
   8vfgslU0dZ3zS/WiDbCFuOagX2OUrWadXODgDIozlSZgICjNcesfJFTKX
   QM/roQng1+lPkmyZai88DvmLRE8nxf6XhwqR3nsnRl+P4hpa4L6OlSw/P
   HlcMtHQgNTGQ3JtVzn/oypI4pe5Z8IW1BkdbOzNImNGmEtAFjxDrXYC6x
   B5G57Ncluau5UXc56P2xqpnirMJ/Pg0ktO+Xu7Ak7a59MAuVncV/Fmgcm
   HxwLx5/251GjTQFWQTbKE1PSSrwHpe1EcZKTtL1g3R1WzsKqxhlFYOUJo
   A==;
IronPort-SDR: hahN5vpS/jLUMeoF5YgCfsbYogNkzzI4ES7ygehOT2s6UA2zn4ytsanSwzE1VY/HcFkveGp7D0
 cifq9KhKko4SBE0kckW01R357CKYNxHDUSHq2FYaAJIuz9QHvw+m1eRHqfEBfoYaf7JeDHXwgH
 DLx+3Ka6+qTOaC3qpgnCUHGd/+iitxeia8ChSiUkEryEewupMCtO+3u4ooj233UUF4+my4u3XE
 6DboPojk7sgt5SX/DFFCHTfP4RGd835FyaYC4XrpgegXpYkKRa6yaSzLTmtVvwXKS7HjMRnJsS
 1Aw=
X-IronPort-AV: E=Sophos;i="5.82,293,1613458800"; 
   d="scan'208";a="55295645"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2021 04:20:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 04:20:30 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 12 May 2021 04:20:27 -0700
From:   <daire.mcnamara@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 1/2] dt-bindings: i2c: microchip: Add Microchip PolarFire host binding
Date:   Wed, 12 May 2021 12:20:23 +0100
Message-ID: <20210512112024.1651757-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512112024.1651757-1-daire.mcnamara@microchip.com>
References: <20210512112024.1651757-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

Add device tree bindings for the Microchip PolarFire I2C controller

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/i2c/microchip,mpfs-i2c.yaml      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
new file mode 100644
index 000000000000..bc4ea4498d35
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS I2C Controller Device Tree Bindings
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+
+description: |
+  This I2C controller is found on the Microchip PolarFire SoC.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: Phandle of the clock feeding the I2C controller.
+    minItems: 1
+
+  clock-frequency:
+    description: |
+      Desired I2C bus clock frequency in Hz. As only Standard and Fast
+      modes are supported, possible values are 100000 and 400000.
+    enum: [100000, 400000]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        i2c@2010a000 {
+            compatible = "microchip,mpfs-i2c";
+            reg = <0 0x2010a000 0 0x1000>;
+            interrupts = <58>;
+            clock-frequency = <100000>;
+            clocks = <&clkcfg CLK_I2C0>;
+        };
+    };
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        i2c@2010b000 {
+            compatible = "microchip,mpfs-i2c";
+            reg = <0 0x2010b000 0 0x1000>;
+            interrupts = <61>;
+            clock-frequency = <100000>;
+            clocks = <&clkcfg CLK_I2C1>;
+        };
+    };
+...
-- 
2.25.1

