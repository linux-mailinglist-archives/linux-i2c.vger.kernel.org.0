Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8AB5735B36
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbjFSPhw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjFSPhv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:37:51 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C33210F;
        Mon, 19 Jun 2023 08:37:50 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5189f49c315so3706616a12.2;
        Mon, 19 Jun 2023 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189069; x=1689781069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4vDNLM3XLifOUeIHk+++zlMfUYzj741T6wp3kNlkXU=;
        b=QzFocbn/K1Pwm2d4+KukbL2F7ZSUqKDeRTgb+LUbEtY57IIQHX0n/B9XW/kZo1ijwt
         n4dLiiE4n/O6PtOuRML0iOAssxM10EcMYA96OEJmOWNwqIxU9IiC/D1SbEjq1sopxb2g
         gIhLwiMna0sCZWxeh13lNVjzZxTR+GCrt4aDYbteVYSkxTaYgkBYXCpG7agVFNXxwxzT
         tJ/D3uH3sIc8O+WzHaYo6XIz24v6SpbSS1fXQs8qo2tjdHOBwJM9DW4FWUUqv0uALgeK
         //2Ygnq3J73Db04E6aZ611pUFglgMHXmjWjYiH+usb9FchEDx5jRT/JSB/+yqpnkL8GG
         DuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189069; x=1689781069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4vDNLM3XLifOUeIHk+++zlMfUYzj741T6wp3kNlkXU=;
        b=TodT2Cy4bQiWQkofCBD6vuEaBvC0RznCxxfwLTKP0FXV7ihVrLDINpkkNqS12iILow
         OKHPLBLR9jW9T6YGfVT6o5H3AhoIhM84ctiOxkkQwXbvK4BzHQnehkhik8JBnS40Krtk
         Hcd5O1PsYbpyx9f0b+my+kW9le8qZ7qmH63IQJI3WS3UQ6RI3AVEmryS+ZyH9ktvW/Ui
         T1trJlkogoLp3bkuI99oX9wEh+0uvKtP4t+3eQQbfszuUaYqQYnMtnUjqNZfHrbUFT+g
         7Ajg6v1O9RyTN4GINgE3Gcn706DhD6eX/NLwKwfkcgv3DdFcI/TFfvnEFjOjLePoSi26
         HF/w==
X-Gm-Message-State: AC+VfDyGNFQ2FFsdjHqtnzriJl1DwjZWePSwvnsgGxyZHbr4EkfEuQMD
        Nbt7pHTdUUp40bUsiLb2KSo=
X-Google-Smtp-Source: ACHHUZ4wrBloMuOEeOKIk/4e/kD3k1z88TpkVAlWm1hxVQE3q4J9rwoEPTLkqxIyFheLTvQ1Qjy6wg==
X-Received: by 2002:a05:6402:755:b0:51a:4842:ecdc with SMTP id p21-20020a056402075500b0051a4842ecdcmr3794828edy.1.1687189068682;
        Mon, 19 Jun 2023 08:37:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.79])
        by smtp.gmail.com with ESMTPSA id l8-20020a056402344800b005187a42b44fsm7469043edc.58.2023.06.19.08.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:37:48 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
Date:   Mon, 19 Jun 2023 18:37:31 +0300
Message-Id: <20230619153732.46258-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619153732.46258-1-clamor95@gmail.com>
References: <20230619153732.46258-1-clamor95@gmail.com>
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

