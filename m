Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8163353EF4C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 22:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiFFUOH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 16:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbiFFUOG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 16:14:06 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1497F139AEA
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 13:14:05 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m26so9853854wrb.4
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7vCPgtA3BbvZtshze5CQUg4kM9ICh/+RTxGA4WD1mf0=;
        b=LC4gaaoUVgwwaH+unaf96kROWS2r6vondQTIeTrkLXqhEYhHYME9g/jc4nwTRx0x4t
         EriKh2T7D6lmykbp7aU4rsziWsg8lrjMtj91I4R4MKX0gcnxKajPFaLzqDo2FhJ3sfys
         bzYrmQZO03q3bcE8oBIYN55C5dDnTZDPPgffqaInr4MxebfJqbHz47SoWMlnCILzyiMK
         H/eo01OYjK4IETEedcNAXgfOxsKQJVjrm3wKwF4T5X9f/L2RMxnFoF1x27k2l+4lj1LU
         naZGQOjfzZfXlVKaGjCZuytouGCS0IS0e4aAz/VRjkj7mS3pLA+73ESvNbkf4jNzeJz/
         eyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7vCPgtA3BbvZtshze5CQUg4kM9ICh/+RTxGA4WD1mf0=;
        b=44LD7AY1JKZ9nak4MhSgIAHYqhsCO7c6VZduoJmCnpKi3MAwTgpQczyoWL1CL+AmoX
         W1O2/HtIu+3fcsNeu/OP7zf/0ulR27Yr5cryTKAUbkWKckT3X+Ll+e1vzDVpLm43zYnw
         WzzdIR6h9GWD8Puq434N3SGx1Ox/i+M3hFR44ueZ7gLYabu4uegsv10xj8aWD3x+DzVK
         UGaDT62L6d6tpz3naXXUTTe3zY0wbJ+zCiqRv2GugsBtSF1Z1JEEdeycit2w/Rqiq+Fb
         P/cI3cE28uroJymHy+GNtFkuhHEIvynMqarz8QUBklmOrwD3QnEZhNgJJ571p0+ako3u
         aD9w==
X-Gm-Message-State: AOAM533R7uektiqU4CWDl33BISAklxRl85ujWbSikx3+dPLrrVKcgBRN
        To8/dTn79OVxHtWwo93Ioa20rw==
X-Google-Smtp-Source: ABdhPJxvgT6fY/VVwTGBW393iUEwu2JtUuZPhYqj8miS4mwpMcsuIC4g/CyKAFrs4/Q3oylmeATaVQ==
X-Received: by 2002:a5d:67c9:0:b0:218:4a6a:298e with SMTP id n9-20020a5d67c9000000b002184a6a298emr2016266wrw.153.1654546443329;
        Mon, 06 Jun 2022 13:14:03 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d4589000000b0020fcf070f61sm16038489wrq.59.2022.06.06.13.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:14:02 -0700 (PDT)
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
        Atul Khare <atulkhare@rivosinc.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: mmc: convert mmc-spi-slot to yaml
Date:   Mon,  6 Jun 2022 21:13:41 +0100
Message-Id: <20220606201343.514391-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606201343.514391-1-mail@conchuod.ie>
References: <20220606201343.514391-1-mail@conchuod.ie>
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

From: Conor Dooley <conor.dooley@microchip.com>

Convert the mmc-spi-slot text based binding doc to yaml,
with the side effect of cleaning up some of the riscv
dtbs_check warnings.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mmc/mmc-spi-slot.txt  | 29 -------
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 29 deletions(-)
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
index 000000000000..c45b91099325
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
@@ -0,0 +1,77 @@
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
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Two cells are required, first cell specifies minimum slot voltage (mV),
+      second cell specifies maximum slot voltage (mV).
+    items:
+      - description: |
+          value for minimum slot voltage in mV
+        default: 3200
+      - description: |
+          value for maximum slot voltage in mV
+        default: 3400
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

