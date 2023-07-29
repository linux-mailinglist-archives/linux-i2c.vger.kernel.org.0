Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9D676807D
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jul 2023 18:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjG2QJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jul 2023 12:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjG2QJ2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jul 2023 12:09:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C20E109;
        Sat, 29 Jul 2023 09:09:27 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b962535808so48949511fa.0;
        Sat, 29 Jul 2023 09:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690646966; x=1691251766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4vDNLM3XLifOUeIHk+++zlMfUYzj741T6wp3kNlkXU=;
        b=C82RAcDOZ86/nEtrrAVg5CnBNfTHJhbhbmGCQHJSkURsK+9L1kcEt8gelD9Kt/oxhf
         jDJxfsZAnsPxVTu014bhVW/MjMd5plfDSUeJHpYFyB0qOhr/uEPYo/XoDPRy3WprjoAW
         S5CqdZbKVPMbK8+jaB4rPUm9hGSyUoaGymHzG9Fj71mTLDuuK/BBLK+UHNAOgwNh0END
         nu6OwRrCo1H3+pUnmbUKfIRJl35SR8eOVdbo7FXXQe/Sz1ombO/HrY/YNDO24wPnU5YV
         9IEC+eg8/KohF78Fl3Okcb2KHu8wJtEQOM6pE62QQCcxjt2Shs5UhePYzwiH27ue5Vh3
         KppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690646966; x=1691251766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4vDNLM3XLifOUeIHk+++zlMfUYzj741T6wp3kNlkXU=;
        b=lXsaW736WKUwIwek9O5Zwd+1kLICP3lqOknY/BDyq0qNYoB7EuIgG+z1TR87gg4TWT
         XnN3hqbfuw1tSvGtNOQuzPlMvbmxC0nMJvCSYZjrsuoFhnC+U7TNUoXmD9i9cS2OoiQ1
         KBQ3NXQL91Plx7+SekJPO8onmIUVhtyy3SikzRjXi7dyOQqfWZAg+UuuzSqrHfNHMpDA
         lYh+U+sVtShtUsCkutAhrM0NAaHdUGCUxpeUPlg6PdVivzJXf0ZSOWaC/TWR4nepgE7/
         LVzq8td8rawoBd2NEAnbo4SBy02VBJzD9k+0lyuAC1eD6c4gWu6VRcgj4MeFJ0r6ekGh
         ljCw==
X-Gm-Message-State: ABy/qLZYseMyr2e7V5/EkNo8CbzU6Nup9lDEu/jKrcLeUOWFPBsL9aSO
        SJNwHs7if4GpQj0jE72VQqo=
X-Google-Smtp-Source: APBJJlGG2aIWvCiMAzemnsDORDuTawwpZ9uC4uF+qHYxK7WGdb2vVW8rMvyN/3FpH5m14OdJ0QJ1rQ==
X-Received: by 2002:a2e:2c19:0:b0:2b7:3b73:2589 with SMTP id s25-20020a2e2c19000000b002b73b732589mr3547966ljs.32.1690646965507;
        Sat, 29 Jul 2023 09:09:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id f10-20020a2ea0ca000000b002b6daa3fa2csm1346886ljm.69.2023.07.29.09.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 09:09:25 -0700 (PDT)
From:   Svyatoslav Ryhel <clamor95@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
Date:   Sat, 29 Jul 2023 19:08:56 +0300
Message-Id: <20230729160857.6332-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729160857.6332-1-clamor95@gmail.com>
References: <20230729160857.6332-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document device tree schema which describes hot-pluggable via GPIO
i2c bus.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/i2c/i2c-hotplug-gpio.yaml        | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
new file mode 100644
index 000000000000..21f2b74ca6c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-hotplug-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO detected hot-plugged I2C bus
+
+maintainers:
+  - Michał Mirosław <mirq-linux@rere.qmqm.pl>
+
+description:
+  Driver for hot-plugged I2C busses, where some devices on a bus
+  are hot-pluggable and their presence is indicated by GPIO line.
+
+properties:
+  compatible:
+    items:
+      - const: i2c-hotplug-gpio
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  interrupts-extended:
+    minItems: 1
+
+  detect-gpios:
+    maxItems: 1
+
+  i2c-parent:
+    maxItems: 1
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - interrupts-extended
+  - detect-gpios
+  - i2c-parent
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /*
+     * Asus Transformers use I2C hotplug for attachable dock keyboard
+     */
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c-dock {
+        compatible = "i2c-hotplug-gpio";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        interrupts-extended = <&gpio 164 IRQ_TYPE_EDGE_BOTH>;
+        detect-gpios = <&gpio 164 GPIO_ACTIVE_LOW>;
+
+        i2c-parent = <&gen2_i2c>;
+    };
+...
-- 
2.39.2

