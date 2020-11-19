Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2352B9ED3
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Nov 2020 00:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgKSX4b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Nov 2020 18:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbgKSX4a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Nov 2020 18:56:30 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2950CC0613CF;
        Thu, 19 Nov 2020 15:56:30 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id bo9so4662962ejb.13;
        Thu, 19 Nov 2020 15:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mAXSIdjDaBZjNU/PUty/VD0YiGWKRCs/msZcPqHHsQ8=;
        b=olV0CftbaPm3wWBGcUTe/JrVCRjs1vlS6jtf6cakzlmOHaddocroxYBpjjGkm3VBSc
         qWjDE3PtAr2+pM856zO01Zg2SRXDDTMtyJa++5IAkehJhci2wuw0ZU8mBF9iu3oxqqmV
         nUqXw1tRdbyz8DPb3cDwZbEI5hL9PAzP4qgGqfr66r5oeRiOJ3w8oRd/uQQk3oJggsSe
         YkY+TSQOoaztDtfWGvKzPEz+t48WTVylrs8lj6z0esCtoTUOs9EbASmYTIvbF4uZpz3v
         /Jmu9fFqbIg2dfP3j9ZLdqunel0vc3hMhSU9BXLbWkMit8umdWG9L8MQ8KvtqQRar9Ms
         s3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mAXSIdjDaBZjNU/PUty/VD0YiGWKRCs/msZcPqHHsQ8=;
        b=jEfksC2/r9GiTXgtURWjTNQAEVb8IiRpQWyxWZZWHQAmmnQubLZp945m96JiwI5Unv
         H9QDrpDNTUc7KFUv28SuG1giOTgz+7UNbWIuVI0bf5iaKDHoxznwC2PzeGq4+cLFQMcU
         g81XXHmz9+M6/DEo8cb4OIjRXSrOqpk8SYhOVpq6BfoKek8uFxUvpxLCwMzLRX0LfRne
         Pm0ZzIGF9+OuulGoIE/03LbciPwG9xTMdJ9DH0U/ZMPDxcCg2N+MZmzbebH0aRjmsSI6
         v9Y1GzGFU+qp7TnzlIhYSs9O8DSF6RQiIA1LNyCsXTg2tc/ZYM4rQcrEr2u8xbr9JDY6
         iX4A==
X-Gm-Message-State: AOAM531hTpLAycbRqoULm6hGUMTaZG9Ksj5aD3gC4l4M28+Uuw2fAzBd
        PfMrBzM+uVRktzex7zLCsG0=
X-Google-Smtp-Source: ABdhPJxJ9NF0uQrsEv911V2ZQs1HR7OBlh0Z91TxvvGAnGVt+fxu9f4A1XX4ZtnjTpfEgC+TxVpAIQ==
X-Received: by 2002:a17:906:7813:: with SMTP id u19mr4102780ejm.153.1605830188881;
        Thu, 19 Nov 2020 15:56:28 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i3sm452987ejh.80.2020.11.19.15.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:56:28 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 10/18] dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a schema
Date:   Fri, 20 Nov 2020 01:56:04 +0200
Message-Id: <2521d2e63efcd125a4fe93ee55435f399157ab39.1605823502.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Actions Semi Owl I2C DT binding to a YAML schema for
enabling DT validation.

Additionally, add a new compatible string corresponding to the I2C
controller found in the S500 variant of the Actions Semi Owl SoCs
family.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
 .../devicetree/bindings/i2c/i2c-owl.txt       | 29 ---------
 .../devicetree/bindings/i2c/i2c-owl.yaml      | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-owl.txt b/Documentation/devicetree/bindings/i2c/i2c-owl.txt
deleted file mode 100644
index 54c05dbdb2e4..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-owl.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Actions Semiconductor Owl I2C controller
-
-Required properties:
-
-- compatible        : Should be one of the following:
-		      - "actions,s700-i2c" for S700 SoC
-		      - "actions,s900-i2c" for S900 SoC
-- reg               : Offset and length of the register set for the device.
-- #address-cells    : Should be 1.
-- #size-cells       : Should be 0.
-- interrupts        : A single interrupt specifier.
-- clocks            : Phandle of the clock feeding the I2C controller.
-
-Optional properties:
-
-- clock-frequency   : Desired I2C bus clock frequency in Hz. As only Normal and
-                      Fast modes are supported, possible values are 100000 and
-                      400000.
-Examples:
-
-        i2c0: i2c@e0170000 {
-                compatible = "actions,s900-i2c";
-                reg = <0 0xe0170000 0 0x1000>;
-                #address-cells = <1>;
-                #size-cells = <0>;
-                interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clock CLK_I2C0>;
-                clock-frequency = <100000>;
-        };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-owl.yaml b/Documentation/devicetree/bindings/i2c/i2c-owl.yaml
new file mode 100644
index 000000000000..d96908badf81
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-owl.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-owl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl I2C Controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  This I2C controller is found in the Actions Semi Owl SoCs:
+  S500, S700 and S900.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - actions,s500-i2c # Actions Semi S500 compatible SoCs
+      - actions,s700-i2c # Actions Semi S700 compatible SoCs
+      - actions,s900-i2c # Actions Semi S900 compatible SoCs
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
+    #include <dt-bindings/clock/actions,s900-cmu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@e0170000 {
+        compatible = "actions,s900-i2c";
+        reg = <0xe0170000 0x1000>;
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cmu CLK_I2C0>;
+        clock-frequency = <100000>;
+    };
+
+...
-- 
2.29.2

