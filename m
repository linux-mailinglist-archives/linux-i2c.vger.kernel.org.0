Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9E64F0596
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 20:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343786AbiDBSmt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 14:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355594AbiDBSme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 14:42:34 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2510E4C408
        for <linux-i2c@vger.kernel.org>; Sat,  2 Apr 2022 11:40:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d29so2543261wra.10
        for <linux-i2c@vger.kernel.org>; Sat, 02 Apr 2022 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8UQnzpzJ7atASYcdmmpmKJN+w3hsF0/X9rG8MRnHqSQ=;
        b=sJkGlXQ6t/GZu/niHOpOZmjDOll5gznf77yzZ+d3nFHFi9zhmIBYWzO8zJm1lUtvHj
         mokqESv8EymQtzEj4HdDpdh2imD09qSWclAOV5dBnXy4uA+tnXRLnjsm8L52Jrcz1aBD
         kft5rp5Ubmhhn8OQ0zGKHEb/EyaRcr/tlJodiNTpHbeCiPHltu97uL/1OlqRkY4079Ap
         PPg1j02nGQGh2DU4qKEIpT+GG18rbfHnbmqU64fyVrAwR6ypo8aNywPOWJvt4ri3a6+U
         xDyAB98bBcx+xekpEefl5Ep6auS2KksQI4H1HtBOtqA38NlidZDO3ztz35Os8Cy+EN0Q
         pISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UQnzpzJ7atASYcdmmpmKJN+w3hsF0/X9rG8MRnHqSQ=;
        b=gUh49Zti/p0Q+SGYJoWNZFgaRy+Wrj1Kf5FceciS5vq3D11luZRv7tRxrEd3NLW8Ev
         nXUFTriwRbVx8Tj3azLLMAXIOvp0qiZbODmY+biScgLEbC0wf8xGx2uhRhZ2iSSB29pC
         JnFFlOHI2Dx0/Rw47tMTyAtESpeD8wdaG4duciooxqPfKvgjM58BtCF003IWhqzhFaL1
         a1wby/zvEALfkFoWHy9EwmCmRRE5SpaCx8P6RKONv1xT1YnW0ndLE2pta9gPH/JUvWeW
         ym5gzJh+ZXCqz5KWgjli19Suv4F1EStGPhn7whJj46zzBQZoA6j2DmLmDWcBR2MEjRWg
         xmJQ==
X-Gm-Message-State: AOAM531eAmBMEz4KdI4K+4ijyOlxjF93SSZW7SeFz6bLqOmBXmwM9fWo
        eE2v3389DowgYmS7lITraZ+90Q==
X-Google-Smtp-Source: ABdhPJzgfFjUaD8MoK9zh4Fy6hmHDi8obj/pudrAdpzyXg8ImEW0WyON+B6gInWAdwqVSGua/RsS/A==
X-Received: by 2002:a5d:5111:0:b0:205:a1aa:ab71 with SMTP id s17-20020a5d5111000000b00205a1aaab71mr11786912wrt.67.1648924823523;
        Sat, 02 Apr 2022 11:40:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0038b5162260csm6760502wmq.23.2022.04.02.11.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 11:40:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 6/9] spi: dt-bindings: qcom,spi-qup: convert to dtschema
Date:   Sat,  2 Apr 2022 20:40:08 +0200
Message-Id: <20220402184011.132465-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Qualcomm Universal Peripheral (QUP) Serial Peripheral
Interface (SPI) bindings to DT Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
 .../devicetree/bindings/spi/qcom,spi-qup.txt  | 103 ------------------
 .../devicetree/bindings/spi/qcom,spi-qup.yaml |  81 ++++++++++++++
 2 files changed, 81 insertions(+), 103 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qup.txt b/Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
deleted file mode 100644
index 5c090771c016..000000000000
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
+++ /dev/null
@@ -1,103 +0,0 @@
-Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
-
-The QUP core is an AHB slave that provides a common data path (an output FIFO
-and an input FIFO) for serial peripheral interface (SPI) mini-core.
-
-SPI in master mode supports up to 50MHz, up to four chip selects, programmable
-data path from 4 bits to 32 bits and numerous protocol variants.
-
-Required properties:
-- compatible:     Should contain:
-		  "qcom,spi-qup-v1.1.1" for 8660, 8960 and 8064.
-		  "qcom,spi-qup-v2.1.1" for 8974 and later
-		  "qcom,spi-qup-v2.2.1" for 8974 v2 and later.
-
-- reg:            Should contain base register location and length
-- interrupts:     Interrupt number used by this controller
-
-- clocks:         Should contain the core clock and the AHB clock.
-- clock-names:    Should be "core" for the core clock and "iface" for the
-                  AHB clock.
-
-- #address-cells: Number of cells required to define a chip select
-                  address on the SPI bus. Should be set to 1.
-- #size-cells:    Should be zero.
-
-Optional properties:
-- spi-max-frequency: Specifies maximum SPI clock frequency,
-                     Units - Hz. Definition as per
-                     Documentation/devicetree/bindings/spi/spi-bus.txt
-- num-cs:	total number of chipselects
-- cs-gpios:	should specify GPIOs used for chipselects.
-		The gpios will be referred to as reg = <index> in the SPI child
-		nodes.  If unspecified, a single SPI device without a chip
-		select can be used.
-
-- dmas:         Two DMA channel specifiers following the convention outlined
-                in bindings/dma/dma.txt
-- dma-names:    Names for the dma channels, if present. There must be at
-                least one channel named "tx" for transmit and named "rx" for
-                receive.
-
-SPI slave nodes must be children of the SPI master node and can contain
-properties described in Documentation/devicetree/bindings/spi/spi-bus.txt
-
-Example:
-
-	spi_8: spi@f9964000 { /* BLSP2 QUP2 */
-
-		compatible = "qcom,spi-qup-v2";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0xf9964000 0x1000>;
-		interrupts = <0 102 0>;
-		spi-max-frequency = <19200000>;
-
-		clocks = <&gcc GCC_BLSP2_QUP2_SPI_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
-		clock-names = "core", "iface";
-
-		dmas = <&blsp1_bam 13>, <&blsp1_bam 12>;
-		dma-names = "rx", "tx";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&spi8_default>;
-
-		device@0 {
-			compatible = "arm,pl022-dummy";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <0>; /* Chip select 0 */
-			spi-max-frequency = <19200000>;
-			spi-cpol;
-		};
-
-		device@1 {
-			compatible = "arm,pl022-dummy";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <1>; /* Chip select 1 */
-			spi-max-frequency = <9600000>;
-			spi-cpha;
-		};
-
-		device@2 {
-			compatible = "arm,pl022-dummy";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <2>; /* Chip select 2 */
-			spi-max-frequency = <19200000>;
-			spi-cpol;
-			spi-cpha;
-		};
-
-		device@3 {
-			compatible = "arm,pl022-dummy";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <3>; /* Chip select 3 */
-			spi-max-frequency = <19200000>;
-			spi-cpol;
-			spi-cpha;
-			spi-cs-high;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml
new file mode 100644
index 000000000000..93f14dd01afc
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  The QUP core is an AHB slave that provides a common data path (an output FIFO
+  and an input FIFO) for serial peripheral interface (SPI) mini-core.
+
+  SPI in master mode supports up to 50MHz, up to four chip selects,
+  programmable data path from 4 bits to 32 bits and numerous protocol variants.
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,spi-qup-v1.1.1 # for 8660, 8960 and 8064
+      - qcom,spi-qup-v2.1.1 # for 8974 and later
+      - qcom,spi-qup-v2.2.1 # for 8974 v2 and later
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spi@7575000 {
+        compatible = "qcom,spi-qup-v2.2.1";
+        reg = <0x07575000 0x600>;
+        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+                 <&gcc GCC_BLSP1_AHB_CLK>;
+        clock-names = "core", "iface";
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&blsp1_spi1_default>;
+        pinctrl-1 = <&blsp1_spi1_sleep>;
+        dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
+        dma-names = "tx", "rx";
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.32.0

