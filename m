Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A74D5769CE8
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 18:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbjGaQj0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 12:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbjGaQjI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 12:39:08 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC89A2711
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jul 2023 09:38:38 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9c0391749so72791751fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jul 2023 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690821517; x=1691426317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LsanXy8k3EumbMnHWgiWkn8DzzFx1eum1pbJ+kZJ9sk=;
        b=ZR2yqUtaKyrfAHirBD+QMQu25SdfFhbHrp7Bo6qir3Htx8jZ5B2s9Qvb193N6dyjgo
         HjzODJ0n/kgZvvcZZc+VYonmYtOtp9VCtKoWb6PYk93q08t0/r/KXecl1PV1bQ0Vm0Kr
         Z8yeaAj3u/dmY0MeNe8UWaoPtbSaI+1s6U+GpuJrXqGZwbWoBGitD5cndQKIDejyDleQ
         d1ucCdpzVxWdTPc+1S2PvLDwxkRQPkp5ljKUX8In331Al9D3iSoXN7+FbhNgvOPPitTn
         yATQ40SZlHP7Y673OtEKHKgaW82hMEPTi8UaeaBXCas+aj5FrEAf2sPDcD2m6oDEJce0
         NlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690821517; x=1691426317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsanXy8k3EumbMnHWgiWkn8DzzFx1eum1pbJ+kZJ9sk=;
        b=GS22BOaYau8dihM+em9AlwtapBqMRmOwMzZsdWZGQ/o+Nggs/twhLZmgd8WHOqmbzv
         97aQ9LsGPw8kL5V2PXyP/WFZyyh4V4V/9ONB4N7YCi1T0fn8A9P5H7TqWbxL7vP8CDz8
         B/gkIQG43A5oQXmHIW91wMlL15wqPSF7RZRVLHIaVvAZtNPO8tZd3MHCotIvZDrQkaym
         ZUIRa1AoADtp+H8tqNRa7l/ASLKQwBg4VcoU8GBw8AGnWj/GcWkw5uSAGowuiZEXILQu
         RRDn4gauLgFi5CpF5J9nTb+u7x5lKVWBkyKUvWaj7lIK7Z+R31Dv+j2MS5gT2ttA0j8o
         cXMg==
X-Gm-Message-State: ABy/qLYROww/c2I8Es6lSwTt08yOAW0nqvG1eXWLmDBzjcXVsOI1z9b0
        RFoDXzua+u8S8Ev6P53t1h9QljxxQ/LaNVoh5Ig=
X-Google-Smtp-Source: APBJJlEphxuDpI4mRHiYZpwGe2gegJkIAfr2OFqa5KQLvvvJBMzr2amzftrwIzMEblpkKcawDQxbWg==
X-Received: by 2002:a2e:8ec3:0:b0:2b9:ec57:c330 with SMTP id e3-20020a2e8ec3000000b002b9ec57c330mr406548ljl.7.1690821516817;
        Mon, 31 Jul 2023 09:38:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id n22-20020a170906841600b009934707378fsm6350775ejx.87.2023.07.31.09.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 09:38:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: i2c: nxp,pca9541: convert to DT schema
Date:   Mon, 31 Jul 2023 18:38:32 +0200
Message-Id: <20230731163833.319258-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the bindings for NXP PCA9541 I2C bus master selector to DT
schema.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Peter Rosin <peda@axentia.se>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Add acks.

Changes in v2:
1. New patch (Doug).
---
 .../devicetree/bindings/i2c/nxp,pca9541.txt   | 29 ----------
 .../devicetree/bindings/i2c/nxp,pca9541.yaml  | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt b/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
deleted file mode 100644
index 42bfc09c8918..000000000000
--- a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* NXP PCA9541 I2C bus master selector
-
-Required Properties:
-
-  - compatible: Must be "nxp,pca9541"
-
-  - reg: The I2C address of the device.
-
-  The following required properties are defined externally:
-
-  - I2C arbitration bus node. See i2c-arb.txt in this directory.
-
-
-Example:
-
-	i2c-arbitrator@74 {
-		compatible = "nxp,pca9541";
-		reg = <0x74>;
-
-		i2c-arb {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			eeprom@54 {
-				compatible = "atmel,24c08";
-				reg = <0x54>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml b/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml
new file mode 100644
index 000000000000..b65c25c1a435
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nxp,pca9541.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA9541 I2C bus master selector
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+properties:
+  compatible:
+    const: nxp,pca9541
+
+  reg:
+    maxItems: 1
+
+  i2c-arb:
+    type: object
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+    description:
+      I2C arbitration bus node.
+
+required:
+  - compatible
+  - reg
+  - i2c-arb
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-arbitrator@74 {
+            compatible = "nxp,pca9541";
+            reg = <0x74>;
+
+            i2c-arb {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                eeprom@54 {
+                    compatible = "atmel,24c08";
+                    reg = <0x54>;
+                };
+            };
+        };
+    };
-- 
2.34.1

