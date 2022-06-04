Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59B7353D7F0
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jun 2022 18:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238785AbiFDQrC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jun 2022 12:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238847AbiFDQrA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Jun 2022 12:47:00 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E300F32;
        Sat,  4 Jun 2022 09:46:59 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id v1so10671350ejg.13;
        Sat, 04 Jun 2022 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=avNh9h8+MOw7k99GPQLLRg6KWk1j4wFpZKYDx2QT8Qs=;
        b=OTIMNzxmuar4680Fg5TNraZ4bHHfBXTi2Stw86M0kXpEVlDf7omD8rnb7e+8rofPLA
         l+BSuJatsldU+dPBQn2s/7VB0NWxnTD3PfL0FklxHSApwb6kZBHAt4UUuPHV3lxH7FYH
         XmMvnqIdJ8WSd98+646jkt7J1zqN2XH7wBG222nz+HBXeRDdkC3CFGlER7oFfb90dsU+
         M0KdEI5OY93Ik4fwYc4MneqgjborlN7nZpDAw7tIE35pYBxBZfAFd87M/PPTg6fA9qDK
         oIT+6G6Vs+Go19i45IiqFM7YKn8In6MBtnVrftzgQ3POTSxcd1KF84ZjxuEAa9LeWQA/
         wCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=avNh9h8+MOw7k99GPQLLRg6KWk1j4wFpZKYDx2QT8Qs=;
        b=Ry0mhjTAE6vY4qBAgKpM6lqxSGhWSxThvxPyAYDQkMayLklHdDIPh4FWzLM48LT7zN
         hjx1LSzqv1BE01M2pAYm+7XzmvadH4RIKDlwrklvPMNbIV5ZJhmgF21Bp7yzs5373xX/
         b6PXdDSIpZahyFc85ossMc1M9K5Ye78q3iLGn1/OKhFFIh5lIIENRD3uZd7SJIh3KHOi
         hD1laptnat2AEowTEgjcKUo1k7J5T4PSsJeZ3Hcm3xCPuY/a2slv3zsTShO9vPqpSlC0
         roFY2bW0yJX/QuK2OXgwTYxvGp7QzzixAvhnfhqgTOkquTd+UqvM/ZJ0ldjEyNrIWcHc
         bcYQ==
X-Gm-Message-State: AOAM533FgkO9syDH/gQgXzl/k4vkWKNrMjPBvIZE6VfnoaxjMKsDUc6h
        PPDyWLdy/wbepn0ceduiTWU=
X-Google-Smtp-Source: ABdhPJxErZXa+n/Q/YcKds8t0Fl6cPR0Bptfav5naEGXaAeHEH/13Sb4u/EaL9P4UGL+q+JN7mG9lQ==
X-Received: by 2002:a17:907:6d1f:b0:6fe:e53b:7f53 with SMTP id sa31-20020a1709076d1f00b006fee53b7f53mr14016250ejc.375.1654361217403;
        Sat, 04 Jun 2022 09:46:57 -0700 (PDT)
Received: from fedora.robimarko.hr (cpe-94-253-165-43.zg.cable.xnet.hr. [94.253.165.43])
        by smtp.googlemail.com with ESMTPSA id gt43-20020a1709072dab00b0070f1b033de4sm1834454ejc.200.2022.06.04.09.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 09:46:56 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] dt-bindings: i2c: qcom,i2c-qup: convert to dtschema
Date:   Sat,  4 Jun 2022 18:46:53 +0200
Message-Id: <20220604164653.79284-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert DT bindings for Qualcomm QUP I2C controller to DT schema format.

Old text bindings were missing usage of DMA so that was documented, as
well as the max clock-frequency.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-qup.txt  | 40 ---------
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
deleted file mode 100644
index dc71754a56af..000000000000
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Qualcomm Universal Peripheral (QUP) I2C controller
-
-Required properties:
- - compatible: Should be:
-   * "qcom,i2c-qup-v1.1.1" for 8660, 8960 and 8064.
-   * "qcom,i2c-qup-v2.1.1" for 8974 v1.
-   * "qcom,i2c-qup-v2.2.1" for 8974 v2 and later.
- - reg: Should contain QUP register address and length.
- - interrupts: Should contain I2C interrupt.
-
- - clocks: A list of phandles + clock-specifiers, one for each entry in
-   clock-names.
- - clock-names: Should contain:
-   * "core" for the core clock
-   * "iface" for the AHB clock
-
- - #address-cells: Should be <1> Address cells for i2c device address
- - #size-cells: Should be <0> as i2c addresses have no size component
-
-Optional properties:
- - clock-frequency: Should specify the desired i2c bus clock frequency in Hz,
-                    defaults to 100kHz if omitted.
-
-Child nodes should conform to i2c bus binding.
-
-Example:
-
- i2c@f9924000 {
- 	compatible = "qcom,i2c-qup-v2.2.1";
- 	reg = <0xf9924000 0x1000>;
- 	interrupts = <0 96 0>;
-
- 	clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
- 	clock-names = "core", "iface";
-
- 	clock-frequency = <355000>;
-
- 	#address-cells = <1>;
- 	#size-cells = <0>;
- };
diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
new file mode 100644
index 000000000000..097962a90e62
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-qup.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Universal Peripheral (QUP) I2C controller Device Tree Bindings
+
+maintainers:
+  - Robert Marko <robimarko@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,i2c-qup-v1.1.1
+          - qcom,i2c-qup-v2.1.1
+          - qcom,i2c-qup-v2.2.1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: QUP I2C core clock
+      - description: AHB bus clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  clock-frequency:
+    default: 100000
+    maximum: 1000000
+    description: Desired i2c bus clock frequency in Hz, defaults to 100kHz if omitted.
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+
+    i2c@78ba000 {
+      compatible = "qcom,i2c-qup-v2.2.1";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0x078ba000 0x600>;
+      interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
+               <&gcc GCC_BLSP1_AHB_CLK>;
+      clock-names = "core", "iface";
+      clock-frequency = <100000>;
+      dmas = <&blsp_dma 23>, <&blsp_dma 22>;
+      dma-names = "rx", "tx";
+    };
+...
-- 
2.36.1

