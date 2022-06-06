Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E28853EABD
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240734AbiFFP0S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 11:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240715AbiFFP0Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 11:26:16 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467BD328ECD
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 08:26:12 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id a10so5320214wmj.5
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hZdkoa4f3dS0vHJIll9XRyKBK8IfupJfle0pIR+CS5M=;
        b=FHCihJRHA0NhBsPU4jxzqdixXdc7HgNyQyBu1L+72eh5ISbz//2EnwnRjRa7dP/uUl
         VgvV5ErkLss2G2nL3p81tU2SReFh+OAXu9CVJJQ4+FOC+ADLIzXHu7hiQxpSLyDi3pFu
         I3DvzajSBL36y+FtgNHawajeYUBBH9Fofx0KvEJWMBWmT7pQBjM98RSwkBctqEimjyF3
         ZuSNNpzbbl9QiTq8eoYNTbABDni53UQUg52VafC+sR1gqjNQOkAeT+8g4O0KCu59gHO8
         Mo2uhH+mR/qDH+JORKsB/7wybGgRSsy7PCxN2NNc/vL5G+FrHNuSX8WAO8s3gooZG4qS
         VkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZdkoa4f3dS0vHJIll9XRyKBK8IfupJfle0pIR+CS5M=;
        b=E33osYn2tfX0f5CobPelFtJte998HePxwakOSEL+fRsUcLOiMdkXhofJjMQJPQ5V4I
         o7ocv1bWkGQW3VP/VfPzQKJ+8BtnskscdNeyKJFQ+Iri0KDAZx1rDPcHCf9lLp2sczv4
         u3SQYDK3ON9v4ZR0m7Y8R3Hn2CLdjRBZynw4843q49fQUInu8h3gwvG/DICSr2UoE3tj
         5jRBffaAzlP8ucCvIrFTKukgCvwfzUWIryXIsRz4QzxLdsWoqZ9+VUuPa0p5NF9eb7qf
         gyZCgYu14ZwNTxB1g899HLd+57EMRoKJQTlgwmGHbgdgjRYxgtbX1HmCAhdZmsmz+WBA
         pOCw==
X-Gm-Message-State: AOAM53326mmzIz35e+i9dTcinAVD1/tuP0xzWgL64WztXP9WnTenHFx1
        IzIMPCc5Su5o4q+Db37bqWgqqw==
X-Google-Smtp-Source: ABdhPJxp3OFfINk2AAKh6owlATXaLNxGLnQE/UoAxRlQacTM75ntBSGa2L2wDv3IMczFVGCFRZVktQ==
X-Received: by 2002:a7b:c5c6:0:b0:397:8a39:37b with SMTP id n6-20020a7bc5c6000000b003978a39037bmr24001370wmk.182.1654529170467;
        Mon, 06 Jun 2022 08:26:10 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b002103aebe8absm15623944wrs.93.2022.06.06.08.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:26:09 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v2 1/4] dt-bindings: mmc: convert mmc-spi-slot to yaml
Date:   Mon,  6 Jun 2022 16:25:55 +0100
Message-Id: <20220606152557.438771-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606152557.438771-1-mail@conchuod.ie>
References: <20220606152557.438771-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Convert the mmc-spi-slot text based binding doc to yaml,
with the side effect of cleaning up some of the riscv
dtbs_check warnings.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mmc/mmc-spi-slot.txt  | 29 -------
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml

diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
deleted file mode 100644
index 5e74db69f581..000000000000
--- a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-MMC/SD/SDIO slot directly connected to a SPI bus
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the mmc_spi driver.
-
-Required properties:
-- spi-max-frequency : maximum frequency for this device (Hz).
-
-Optional properties:
-- voltage-ranges : two cells are required, first cell specifies minimum
-  slot voltage (mV), second cell specifies maximum slot voltage (mV).
-  Several ranges could be specified. If not provided, 3.2v..3.4v is assumed.
-- gpios : may specify GPIOs in this order: Card-Detect GPIO,
-  Write-Protect GPIO. Note that this does not follow the
-  binding from mmc.txt, for historical reasons.
-
-Example:
-
-	mmc-slot@0 {
-		compatible = "fsl,mpc8323rdb-mmc-slot",
-			     "mmc-spi-slot";
-		reg = <0>;
-		gpios = <&qe_pio_d 14 1
-			 &qe_pio_d 15 0>;
-		voltage-ranges = <3300 3300>;
-		spi-max-frequency = <50000000>;
-		interrupts = <42>;
-		interrupt-parent = <&PIC>;
-	};
diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
new file mode 100644
index 000000000000..cf79092de8fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMC/SD/SDIO slot directly connected to a SPI bus
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+allOf:
+  - $ref: "mmc-controller.yaml"
+  - $ref: /schemas/spi/spi-peripheral-props.yaml
+
+description: |
+  The extra properties used by an mmc connected via SPI.
+
+properties:
+  compatible:
+    const: mmc-spi-slot
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  interrupts:
+    maxItems: 1
+
+  voltage-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: |
+      Two cells are required, first cell specifies minimum slot voltage (mV),
+      second cell specifies maximum slot voltage (mV).
+    items:
+      items:
+        - description: |
+            value for minimum slot voltage
+          default: 3200
+        - description: |
+            value for maximum slot voltage
+          default: 3400
+    maxItems: 1
+
+  gpios:
+    description: |
+      For historical reasons, this does not follow the generic mmc-controller
+      binding.
+    minItems: 1
+    items:
+      - description: Card-Detect GPIO
+      - description: Write-Protect GPIO
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mmc@0 {
+        compatible = "mmc-spi-slot";
+        reg = <0>;
+        gpios = <&gpio 14 GPIO_ACTIVE_LOW>, <&gpio 15 GPIO_ACTIVE_HIGH>;
+        voltage-ranges = <3300 3300>;
+        spi-max-frequency = <50000000>;
+        interrupts = <42>;
+        interrupt-parent = <&PIC>;
+      };
+    };
+
+...
-- 
2.36.1

