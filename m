Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEDE47920E
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 17:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239432AbhLQQ5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 11:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239470AbhLQQ5E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 11:57:04 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE863C061574;
        Fri, 17 Dec 2021 08:57:02 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q16so5256919wrg.7;
        Fri, 17 Dec 2021 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w7h2/0+dZxW3/CPndfq0LogEvfUC/YvXC7sf8DuD6Ek=;
        b=nOkdsR1dJKivvIFKqH9HUXosIoo3zigH+HMd1PttpXxQpht1qYtkJ8JbRspb+gS3SY
         oB2m0GE7Scd8R/9sbYACNan/h5sogI8dIt58Q42tv7WR7UnrhfHwQvjbmFcaksCPMMFE
         jx9GPRiIDQeh3ZoP7qhKJSFIN170J/T5YP6a6AFlirgrQ7blEL74eKVkA9IGGVQ3otGl
         bhk+zq4DGNxXvFxS3n1AlmN2J7lWu10brq+aouPD2ZSY9ljmLnr6n2gyRl1v2AQM8maV
         pGyVJ6DizgWSYkglr+0QjoOyVQsv/JZNFLj4SUkdC3fkwW6/+P017bPydAl1qDLuR4k5
         SHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w7h2/0+dZxW3/CPndfq0LogEvfUC/YvXC7sf8DuD6Ek=;
        b=ENCIiJ0gnDBj/djZP5nD0GbvYG0AwoAM03CxDcADfGcbDJbP0xVc3K8Y6GoDQtQRf1
         7EwcMBpnC3vO6TpSPj/N9brsac1uRu3gZqYad+cSIN3Rrgvmw8Yqi/Xl4IULZSsCvPOV
         ML1x2vgAkMLpFFV/XFu/Ix73P+hi/I9ZDSbZztB6l/KcmwKusfkdgZvGNXeqr6Mgrnyv
         kcBz8+QmfUTsuGPen6JMzfkQ1+Xih9py82YuteNceuuWG6ItwSxhgs/sZa1HFjfc6MSg
         gyZR6nK7AC3iGd9TgRMocO4IeVNou2bjC2pKl3LqB5Tar3P42p3q9tysrNMHv/+POPk7
         3YkQ==
X-Gm-Message-State: AOAM5336zF0X+Afq7TOPab9RCu0xoHeh1ynP8p887kO+XvDTz0702qsQ
        9I0V0w0IPVZQot0UTEGVvnY=
X-Google-Smtp-Source: ABdhPJzSbeYK1YoGwU3ZLRG9BZPWdAhRqA7E+oJdjzS2Fojxlo8jEDNMK46WUHLeSs7YWRbJo2DCqw==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr376958wrq.672.1639760221270;
        Fri, 17 Dec 2021 08:57:01 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m20sm11808204wmq.11.2021.12.17.08.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:57:00 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: i2c: tegra: Convert to json-schema
Date:   Fri, 17 Dec 2021 17:56:55 +0100
Message-Id: <20211217165658.2650677-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra I2C controller bindings from plain text to json-schema
format.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- include i2c-controller.yaml and use unevaluatedProperties: false

 .../bindings/i2c/nvidia,tegra20-i2c.txt       |  87 --------
 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 192 ++++++++++++++++++
 2 files changed, 192 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
deleted file mode 100644
index 3f2f990c2e62..000000000000
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-NVIDIA Tegra20/Tegra30/Tegra114 I2C controller driver.
-
-Required properties:
-- compatible : For Tegra20, must be one of "nvidia,tegra20-i2c-dvc" or
-  "nvidia,tegra20-i2c".  For Tegra30, must be "nvidia,tegra30-i2c".
-  For Tegra114, must be "nvidia,tegra114-i2c".  Otherwise, must be
-  "nvidia,<chip>-i2c", plus at least one of the above, where <chip> is
-  tegra124, tegra132, or tegra210.
-  Details of compatible are as follows:
-  nvidia,tegra20-i2c-dvc: Tegra20 has specific I2C controller called as DVC I2C
-	controller. This only support master mode of I2C communication. Register
-	interface/offset and interrupts handling are different than generic I2C
-	controller. Driver of DVC I2C controller is only compatible with
-	"nvidia,tegra20-i2c-dvc".
-  nvidia,tegra20-i2c: Tegra20 has 4 generic I2C controller. This can support
-	master and slave mode of I2C communication. The i2c-tegra driver only
-	support master mode of I2C communication. Driver of I2C controller is
-	only compatible with "nvidia,tegra20-i2c".
-  nvidia,tegra30-i2c: Tegra30 has 5 generic I2C controller. This controller is
-	very much similar to Tegra20 I2C controller with additional feature:
-	Continue Transfer Support. This feature helps to implement M_NO_START
-	as per I2C core API transfer flags. Driver of I2C controller is
-	compatible with "nvidia,tegra30-i2c" to enable the continue transfer
-	support. This is also compatible with "nvidia,tegra20-i2c" without
-	continue transfer support.
-  nvidia,tegra114-i2c: Tegra114 has 5 generic I2C controller. This controller is
-	very much similar to Tegra30 I2C controller with some hardware
-	modification:
-	 - Tegra30/Tegra20 I2C controller has 2 clock source called div-clk and
-	   fast-clk. Tegra114 has only one clock source called as div-clk and
-	   hence clock mechanism is changed in I2C controller.
-	 - Tegra30/Tegra20 I2C controller has enabled per packet transfer by
-	   default and there is no way to disable it. Tegra114 has this
-	   interrupt disable by default and SW need to enable explicitly.
-	Due to above changes, Tegra114 I2C driver makes incompatible with
-	previous hardware driver. Hence, tegra114 I2C controller is compatible
-	with "nvidia,tegra114-i2c".
-  nvidia,tegra210-i2c-vi: Tegra210 has one I2C controller that is on host1x bus
-	and is part of VE power domain and typically used for camera use-cases.
-	This VI I2C controller is mostly compatible with the programming model
-	of the regular I2C controllers with a few exceptions. The I2C registers
-	start at an offset of 0xc00 (instead of 0), registers are 16 bytes
-	apart (rather than 4) and the controller does not support slave mode.
-- reg: Should contain I2C controller registers physical address and length.
-- interrupts: Should contain I2C controller interrupts.
-- address-cells: Address cells for I2C device address.
-- size-cells: Size of the I2C device address.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  Tegra20/Tegra30:
-  - div-clk
-  - fast-clk
-  Tegra114:
-  - div-clk
-  Tegra210:
-  - div-clk
-  - slow (only for nvidia,tegra210-i2c-vi compatible node)
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - i2c
-- power-domains: Only for nvidia,tegra210-i2c-vi compatible node and must
-  include venc powergate node as vi i2c is part of VE power domain.
-  tegra210-i2c-vi:
-  - pd_venc
-- dmas: Must contain an entry for each entry in clock-names.
-  See ../dma/dma.txt for details.
-- dma-names: Must include the following entries:
-  - rx
-  - tx
-
-Example:
-
-	i2c@7000c000 {
-		compatible = "nvidia,tegra20-i2c";
-		reg = <0x7000c000 0x100>;
-		interrupts = <0 38 0x04>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&tegra_car 12>, <&tegra_car 124>;
-		clock-names = "div-clk", "fast-clk";
-		resets = <&tegra_car 12>;
-		reset-names = "i2c";
-		dmas = <&apbdma 16>, <&apbdma 16>;
-		dma-names = "rx", "tx";
-	};
diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
new file mode 100644
index 000000000000..424a4fc218b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nvidia,tegra20-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+title: NVIDIA Tegra I2C controller driver
+
+properties:
+  compatible:
+    oneOf:
+      - description: Tegra20 has 4 generic I2C controller. This can support
+          master and slave mode of I2C communication. The i2c-tegra driver
+          only support master mode of I2C communication. Driver of I2C
+          controller is only compatible with "nvidia,tegra20-i2c".
+        const: nvidia,tegra20-i2c
+      - description: Tegra20 has specific I2C controller called as DVC I2C
+          controller. This only support master mode of I2C communication.
+          Register interface/offset and interrupts handling are different than
+          generic I2C controller. Driver of DVC I2C controller is only
+          compatible with "nvidia,tegra20-i2c-dvc".
+        const: nvidia,tegra20-i2c-dvc
+      - description: |
+          Tegra30 has 5 generic I2C controller. This controller is very much
+          similar to Tegra20 I2C controller with additional feature: Continue
+          Transfer Support. This feature helps to implement M_NO_START as per
+          I2C core API transfer flags. Driver of I2C controller is compatible
+          with "nvidia,tegra30-i2c" to enable the continue transfer support.
+          This is also compatible with "nvidia,tegra20-i2c" without continue
+          transfer support.
+        items:
+          - const: nvidia,tegra30-i2c
+          - const: nvidia,tegra20-i2c
+      - description: |
+          Tegra114 has 5 generic I2C controllers. This controller is very much
+          similar to Tegra30 I2C controller with some hardware modification:
+            - Tegra30/Tegra20 I2C controller has 2 clock source called div-clk
+              and fast-clk. Tegra114 has only one clock source called as
+              div-clk and hence clock mechanism is changed in I2C controller.
+            - Tegra30/Tegra20 I2C controller has enabled per packet transfer
+              by default and there is no way to disable it. Tegra114 has this
+              interrupt disable by default and SW need to enable explicitly.
+          Due to above changes, Tegra114 I2C driver makes incompatible with
+          previous hardware driver. Hence, Tegra114 I2C controller is
+          compatible with "nvidia,tegra114-i2c".
+        const: nvidia,tegra114-i2c
+      - description: |
+          Tegra124 has 6 generic I2C controllers. These controllers are very
+          similar to those found on Tegra114 but also contain several hardware
+          improvements and new registers.
+        const: nvidia,tegra124-i2c
+      - description: |
+          Tegra210 has 6 generic I2C controllers. These controllers are very
+          similar to those found on Tegra124.
+        items:
+          - const: nvidia,tegra210-i2c
+          - const: nvidia,tegra124-i2c
+      - description: |
+          Tegra210 has one I2C controller that is on host1x bus and is part of
+          the VE power domain and typically used for camera use-cases. This VI
+          I2C controller is mostly compatible with the programming model of
+          the regular I2C controllers with a few exceptions. The I2C registers
+          start at an offset of 0xc00 (instead of 0), registers are 16 bytes
+          apart (rather than 4) and the controller does not support slave
+          mode.
+        const: nvidia,tegra210-i2c-vi
+      - description: |
+          Tegra186 has 9 generic I2C controllers, two of which are in the AON
+          (always-on) partition of the SoC. All of these controllers are very
+          similar to those found on Tegra210.
+        const: nvidia,tegra186-i2c
+      - description: |
+          Tegra194 has 8 generic I2C controllers, two of which are in the AON
+          (always-on) partition of the SoC. All of these controllers are very
+          similar to those found on Tegra186. However, these controllers have
+          support for 64 KiB transactions whereas earlier chips supported no
+          more than 4 KiB per transactions.
+        const: nvidia,tegra194-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: i2c
+
+  dmas:
+    items:
+      - description: DMA channel for the reception FIFO
+      - description: DMA channel for the transmission FIFO
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-i2c
+              - nvidia,tegra30-i2c
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: div-clk
+            - const: fast-clk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra114-i2c
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: div-clk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-i2c
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: div-clk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-i2c-vi
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: div-clk
+            - const: slow
+        power-domains:
+          items:
+            - description: phandle to the VENC power domain
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@7000c000 {
+        compatible = "nvidia,tegra20-i2c";
+        reg = <0x7000c000 0x100>;
+        interrupts = <0 38 0x04>;
+        clocks = <&tegra_car 12>, <&tegra_car 124>;
+        clock-names = "div-clk", "fast-clk";
+        resets = <&tegra_car 12>;
+        reset-names = "i2c";
+        dmas = <&apbdma 16>, <&apbdma 16>;
+        dma-names = "rx", "tx";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.34.1

