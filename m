Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFFE4EFECF
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 07:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240564AbiDBFOK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 01:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiDBFOH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 01:14:07 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC20218A3C6;
        Fri,  1 Apr 2022 22:12:16 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id bc27so3888019pgb.4;
        Fri, 01 Apr 2022 22:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rl2KiTAWf0g00it/ZPSsvEky7u8HEu4NJtG420APAuk=;
        b=pMLcOSgwPDpGjFg22gpvLL3HUaQ5GBhg+F+vhrNuJ7sn8njlR720CU45G9Mfh1YNra
         81DNYbLj0VQ7MkSs307Cwg5KhcwJSiNCXj7fUXBX7ov4KwYsxd7B6EvtLfxeMvjbAuVj
         yg3UGtlTxUacHQTuDuVlCH6ME02k4aw8HxUsGi8Tpx0fVVOyOfylHvOHiI2xoncw/OmX
         t4JxNYGQpAOK+liQYY6o772FGGwabE2//AqPOWgAjSuX1mEWy8BrOlgeqmyL/LxLtKPu
         WQdGHe+GiMQAYWbBSDcnioLHZEhyYcBIABb60KgZGfAtoApj4dwU30JM4bWfbmladk/0
         4kBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rl2KiTAWf0g00it/ZPSsvEky7u8HEu4NJtG420APAuk=;
        b=ch7FmaEHDtj0HgTn4+AOVkXM7WDUsi/XjX0U/7Kpb/VfsJhNFoYF7AlydCUgy3hzlF
         va2MVHhkejfjw/q0KE5c3M7onyhpFQQ1xq0F8G6Mp+vLE6yr5tTXGLeCgdTK+gb/zDTe
         Rfb6occy+0RW5z+m+Gd+cW7ISp28uD3YMBigkBqwdhPdwLLt5kKVVkkc+jqCk0c/9CDO
         oicQpTjH2lQL4BO9icccnslklkp4Rs+VVumG1aK0BNje3WbdGeiZLmZEJam9kx4+bFgi
         XJ02yBhHXDFClwlc95rosWwMOVUW9WrxMk/n/n4CI9I7B84A9a7GcQhYQ01hNw0NqWoJ
         TNgg==
X-Gm-Message-State: AOAM533jIWmyjB5TEOK0kWgRVAT84KRn+wBMBLU+Mk4ADFM/p8XDJgCH
        23XlQhXvtJ/ubLoVpMsILVOfLG4QFNo=
X-Google-Smtp-Source: ABdhPJy2u7ia0T2Lfe/8PhBVofJtraBQrliS6X0IGjCuawW2YSexmh95QjVsvTVmV+xHf7q2mpVMdQ==
X-Received: by 2002:a63:788f:0:b0:386:3116:818c with SMTP id t137-20020a63788f000000b003863116818cmr17329345pgc.414.1648876336318;
        Fri, 01 Apr 2022 22:12:16 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id u10-20020a63b54a000000b00380ea901cd2sm3834721pgo.6.2022.04.01.22.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 22:12:16 -0700 (PDT)
From:   Kuldeep Singh <singh.kuldeep87k@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: i2c: Add Qualcomm Geni based QUP i2c bindings
Date:   Sat,  2 Apr 2022 10:42:02 +0530
Message-Id: <20220402051206.6115-2-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

GENI(generic interface) based Qualcomm Universal Peripheral controller
can support multiple serial interfaces like spi,uart and i2c.

Unlike other i2c controllers, QUP i2c bindings are present in parent
schema. Move it out from parent to an individual binding and let parent
refer to child schema later on.

Please note, current schema isn't complete as it misses out few
properties and thus, add these missing properties along the process.

Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
new file mode 100644
index 000000000000..01a02e680ea3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -0,0 +1,110 @@
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
+    enum:
+      - qcom,geni-i2c
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: se
+
+  clock-frequency:
+    description: Desired I2C bus clock frequency in Hz
+    default: 100000
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
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - reg
+  - "#address-cells"
+  - "#size-cells"
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

