Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 563854F1CFC
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Apr 2022 23:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382423AbiDDV3r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Apr 2022 17:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379981AbiDDScE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Apr 2022 14:32:04 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9E5255B5;
        Mon,  4 Apr 2022 11:30:07 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id r66so218148pgr.3;
        Mon, 04 Apr 2022 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=urMa/+8sUVuJZ09fHlKhlvouX/0Bx6mJ/aPV5M7nHpA=;
        b=CwXiWYL4WVHs83y/rIg3mMyE/Na8xTwQ3BQAUEZilzE8s++8dcmEl7GfOZH+Z+rxk3
         Vh2jmcdiqDjtk/5MMerHmeBIhcZZQQEm4wffOdCHSNw52tI8j8hFgS9t/wJ9pZBQWnxV
         dV5E+2wGA9Wj6KUsRiBxK3xc5i7j1AmAANDUlILXZRDR4CAe/D/zlejgCpKGsZfJjZXm
         RnGzX7gRjVVP9QL/uqGafQE8KsL7IMuytb17NWG2TVripMc1MUcZdpceslZbbGxdxRMT
         TPfv4VoECAZD1UeObpIrYRC7+pC6b/N9/fx0tgUcWtutqFsa2t8cNlL//6Th97bs5m5R
         m0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=urMa/+8sUVuJZ09fHlKhlvouX/0Bx6mJ/aPV5M7nHpA=;
        b=74tRhXneNAeO0TqHgwTtdqjgpRRyDAXDqSRKpaWlvq2X72nFSn4Zx3eRnrGR+kd71q
         hO2BCsd5k+hpwPTPqGX6v5oqRFthRmZmiZR/IvY69fot8ub7+4glWGmT7ps8Wwb5QFqx
         i3S8NwmPEZtZ6N5bPCxp5yfFmwhOySGVEaT+mjUcZSwc1Nz+nDqdAtFrm3Q8gQE260K9
         MdMMNLU6D78lwSl+ytih77xqTueAfSus3GhNufdFj2oWt//zr2vM8cWRFdxAONkQjgzA
         cuBnUWSy79a//YoZo1QSeSDw9e0gkKsrxXPzgAahZx93yHfFxMpsvFBZeLFBPIY3BGQd
         BQrg==
X-Gm-Message-State: AOAM533fTLaIaljzVmasOambdXup7xIZRg2Aqci7pucEMwaJTkA+rhv9
        lPJyxd9kTvDEQlHFfJAhujM=
X-Google-Smtp-Source: ABdhPJyexofxEeNsyOJDnUtFE9S/Yrdks28SgrDutO8qxrncoJ/sbErZKTkfBxo5sxM5K00tS8B67A==
X-Received: by 2002:a63:2cc8:0:b0:398:36ed:c12e with SMTP id s191-20020a632cc8000000b0039836edc12emr1013655pgs.290.1649097007297;
        Mon, 04 Apr 2022 11:30:07 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id kk11-20020a17090b4a0b00b001c73933d803sm162656pjb.10.2022.04.04.11.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 11:30:07 -0700 (PDT)
From:   Kuldeep Singh <singh.kuldeep87k@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: I2C: Add Qualcomm Geni based QUP I2C bindings
Date:   Mon,  4 Apr 2022 23:59:34 +0530
Message-Id: <20220404182938.29492-2-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404182938.29492-1-singh.kuldeep87k@gmail.com>
References: <20220404182938.29492-1-singh.kuldeep87k@gmail.com>
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

GENI(generic interface) based Qualcomm Universal Peripheral controller
can support multiple serial interfaces like SPI,UART and I2C.

Unlike other I2C controllers, QUP I2C bindings are present in parent
schema. Move it out from parent to an individual binding and let parent
refer to child schema later on.

Please note, current schema isn't complete as it misses out few
properties and thus, add these missing properties along the process.

Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
v2:
- Change compatible from enum to const
- Drop clock-frequency description
- Sort nodes
---
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
new file mode 100644
index 000000000000..0e7ed00562e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Geni based QUP I2C Controller
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: qcom,geni-i2c
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: se
+
+  clock-frequency:
+    default: 100000
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    items:
+      - const: qup-core
+      - const: qup-config
+      - const: qup-memory
+
+  interrupts:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/interconnect/qcom,sc7180.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    i2c@88000 {
+        compatible = "qcom,geni-i2c";
+        reg = <0x00880000 0x4000>;
+        clock-names = "se";
+        clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&qup_i2c0_default>;
+        interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>,
+                        <&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+        interconnect-names = "qup-core", "qup-config", "qup-memory";
+        power-domains = <&rpmhpd SC7180_CX>;
+        required-opps = <&rpmhpd_opp_low_svs>;
+    };
+...
-- 
2.25.1

