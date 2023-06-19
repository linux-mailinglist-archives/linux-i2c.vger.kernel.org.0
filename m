Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E40A7359BB
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 16:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjFSOge (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 10:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjFSOge (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 10:36:34 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8D8124;
        Mon, 19 Jun 2023 07:36:32 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51a4044b7a1so4393444a12.2;
        Mon, 19 Jun 2023 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687185391; x=1689777391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M63MWzXEsAPQQsl++H6/LS5VBcI5JHI6IsyHetoStA=;
        b=dnvgDHuNRmwTy7om3tVZfA8WHSmaWcORJLS3TnLlPQjuhiJjeB3jsycakvCuVrnZs3
         V6cF/LdR5VErjtUSk+iQuU2fUhajGAD7ySGJ6v2yHJz1QIYwf0Y1VITwbOjh64pgxETV
         NMLqQ+Tj15hVcsULfD594EeP9r9AmyYrCSidAhPNWaH7HVJlG/u41W+0VJ11pIUWqSau
         Z8u1S+6qpRr6zovdfeQa4gh8bg8mwKAF+YQ02XfIxi48lYeeCCHpzhO3Yi71tZMO+sjT
         q3vlg6mYYOfo8pc5ENlsyYY2T5dFnO2PtAvH8l9lDT5x0PWpnp/FwlozfEaBW9wsQgIb
         CtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687185391; x=1689777391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/M63MWzXEsAPQQsl++H6/LS5VBcI5JHI6IsyHetoStA=;
        b=gG9hPKQydhiU8f8h4SV73tqSdm/wjR9Btdyj6Zch7qfKUOLIztPEM0CO3+MnyCdHxm
         C5iWUTS8r6aE5xL/VcPTygmRBhGmoYDLY/OsxeHwhonSjNqRlwdF7pYElRS0tAS+7xp0
         0JVP3or16ao0l7NddcelaXRTIgcTdTgPSkDrWnIH9V0tlWFzJp+TPszEpsj9Rjfd21OZ
         A1WY5TJp878oefM9J+gaU8EwIXuyubSoudJscGlZhIfaav0mx5eQrhjG1aL+mswJgSYX
         c+1nJFBz1l2caGQLqYIXW+KW02RkqrdZ9Iz+TsAKU47Qsj4AGbHucoezydGiPFNN+nDg
         HXiw==
X-Gm-Message-State: AC+VfDw5UJlrVrPzCnboknCcNXWGOrFMbsSm6w1+XlobJ78t64HUsOaI
        bRzKNjgd/FhTRS8eZyWvq/Q=
X-Google-Smtp-Source: ACHHUZ45S4HwtMC1vy9EJG/ta9bBI3eAHk0HWDO4cIsIqhn5N8OWUic6Grg1SIrTbuAHBhTpZmgn7A==
X-Received: by 2002:a05:6402:706:b0:51a:60b2:7fbe with SMTP id w6-20020a056402070600b0051a60b27fbemr1090107edx.32.1687185391076;
        Mon, 19 Jun 2023 07:36:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.79])
        by smtp.gmail.com with ESMTPSA id r13-20020aa7d58d000000b00514b2a9ce60sm13073283edq.81.2023.06.19.07.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:36:30 -0700 (PDT)
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
Subject: [PATCH v1 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
Date:   Mon, 19 Jun 2023 17:36:10 +0300
Message-Id: <20230619143611.24482-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619143611.24482-1-clamor95@gmail.com>
References: <20230619143611.24482-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document device tree schema which describes hot-pluggable via GPIO
i2c bus.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/i2c/i2c-hotplug-gpio.yaml        | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
new file mode 100644
index 000000000000..74544687a2b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
@@ -0,0 +1,68 @@
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
+description: |
+  Driver for hot-plugged I2C busses, where some devices on a bus
+  are hot-pluggable and their presence is indicated by GPIO line.
+
+properties:
+  $nodename:
+    pattern: "^i2c-(.*)?"
+
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
+  - "#address-cells"
+  - "#size-cells"
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
+        detect-gpios = <&gpio 164 1>;
+
+        i2c-parent = <&{/i2c@7000c400}>;
+    };
+...
-- 
2.39.2

