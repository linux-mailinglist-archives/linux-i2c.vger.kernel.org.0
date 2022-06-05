Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4AB553DB9E
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 15:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241332AbiFENdX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 09:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244419AbiFENdU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 09:33:20 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4560238BCB
        for <linux-i2c@vger.kernel.org>; Sun,  5 Jun 2022 06:33:18 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 67-20020a1c1946000000b00397382b44f4so6611467wmz.2
        for <linux-i2c@vger.kernel.org>; Sun, 05 Jun 2022 06:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sUOXdPn8EOhhxjnRiVLAO3H3BCAF6yuCXw9gRZytXYg=;
        b=QbfCFTgGtKcOwqGaMRbSa4+e5jEOcoDFjkrwWtgr0Ba+3+ET2GgN/pBwxBChBpH+K4
         mslWlLN+4mvQ/xPTjuKA9cMbRJzlGk7Q+6yzWEH3nKf3lnhLw63P1Ma/J3M3Qds26qUZ
         E5GOB8GGFbkv267JW7aQ8nDPn5RTeQcIvFdP4IjiVkLfULVj6Zd4P+8yHHxu9PC8nk8U
         cq5am9mlaxp1hiATSpxf1R/MN44PvTA2FvoairCpnSbXL53rKAQi1uURBTLMO3vEuDFu
         5WX9pm7xmSm03dEgyUFX/i4ejnGaDn+qgrPsW/FZdt4RGjoDaIE54Vo6kg5dQeKympMB
         Bs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sUOXdPn8EOhhxjnRiVLAO3H3BCAF6yuCXw9gRZytXYg=;
        b=yykMXcsuaz6P4S7tHMxtbgnEp7oqiqQCVT94yCYbmpvSN2Q0RJ4c9NRVm9FJgHz2Ls
         T/jJgleAHEMdInjS3i2dE1c+m0srihrSxfchTVie8/y1CihfF6QYSqV1p7QFq+NzJP+Q
         WxkHXsnh0mJPYQU2mexiCvHqgslalpD+vurMUTV+IkFLsuoWVM3FZIT8So5o4VSJbM38
         Qxup0PpDsmSZlq1XAYKB/g+lix4oGEmTz0pUW3LPm8Wd58kIJjD0jj2G3muRjrKg+j7z
         VKGczd/FP0SqrXkHSWAtOnul24VRnqu95U9WPGzbcCbNerjtbtalLk40S4CNQAS3o8QT
         ajzQ==
X-Gm-Message-State: AOAM5329Q8q6wlDDI/NQ7WhMHWFoelLUJWlkRQxI+uGjeLuINP/dJ5Mz
        SyEXFmI77LNq5nNt3BYJ+k0P7g==
X-Google-Smtp-Source: ABdhPJxdcDTuUEHAQfxai+GQ5ckF1kK/+szwHFOLq1NgQVHxO1mPiMYwRbihKTJxK1quAmahfHVidQ==
X-Received: by 2002:a05:600c:601b:b0:39c:4194:e4f with SMTP id az27-20020a05600c601b00b0039c41940e4fmr11009634wmb.105.1654435996727;
        Sun, 05 Jun 2022 06:33:16 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:16 -0700 (PDT)
From:   mail@conchuod.ie
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
Subject: [PATCH v1 1/6] dt-bindings: mmc: convert mmc-spi-slot to yaml
Date:   Sun,  5 Jun 2022 14:32:56 +0100
Message-Id: <20220605133300.376161-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
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
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 76 +++++++++++++++++++
 2 files changed, 76 insertions(+), 29 deletions(-)
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
index 000000000000..a5fd723140c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
@@ -0,0 +1,76 @@
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
+
+description: |
+  The extra properties used by an mmc connected via spi.
+
+properties:
+  compatible:
+    const: "mmc-spi-slot"
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
+    $ref: '/schemas/types.yaml#/definitions/uint32-matrix'
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
+      For historical reasons, this does not follow the generic mmc-controller binding.
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
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mmc@0 {
+        compatible = "mmc-spi-slot";
+        reg = <0>;
+        gpios = <&qe_pio_d 14 1>, <&qe_pio_d 15 0>;
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

