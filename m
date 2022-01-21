Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A7C495B2A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 08:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379163AbiAUHu4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 02:50:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379156AbiAUHuw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 02:50:52 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA413C061574;
        Thu, 20 Jan 2022 23:50:51 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id l16so8648309pjl.4;
        Thu, 20 Jan 2022 23:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=pbSC1yYyB4AKHdDBdlcWgPXqp9EY40xn4+ePZ50AjS4=;
        b=NBOdPgw5hd4f8e+M+iculjigVS0fNC/Tze6B3YAwlXybdW3JS4I2wRPn5duHOanvTD
         cdwIZTXmhxz1DnEBj9GlXXaFQGSYwLpODXhZbgIekLDT4rBskhsS7Q5peFsh0mlHH/hw
         sKxfepP+5zAE0H8H4rE0POT6zZTPTCY0YsjtIJh7xw+kFz5BLBkfGKjRL78fwoppi+MR
         Mqc/bgWYG2f0NCO74GF/lUMu9OcXfQnmgKVR99qm6MVcfqnfvMeOCXzCswnXYAgmoBfO
         etxnQXTHvtIkjsVO4y3s90hXkwlLP685DOYJpyL9ihRzVT6L9gbhPOqN9Oknr/7x9TnK
         xAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=pbSC1yYyB4AKHdDBdlcWgPXqp9EY40xn4+ePZ50AjS4=;
        b=cW9FB68tA0rimVMS2j5FU6s2bPo2d3kFP3LDQBA8MrRLT5vxmgAeOY45Woo8bzMMLZ
         C03HszSk73VLVrpcvxuav5crgmkZH6dRJxK1EbVn5H9gzYToU+Y+Cs9zfEs93jjldHIn
         p7dIvBt1uN9hlM3MhadsP48/z4jNQ5f+VuX3J6kPtZDo6+GWjy7YZ1fV5Hna99Q5n8UZ
         Yh7q1AgLugfkGQ2seBVkHIDL9pSUj26UKT4v7cPo4tJ6s1hs8Rr6p1cG13vYVefQ/dEn
         lt235qSELVo2VlWzQt5sx1GgzDVgLzqw1oEvkn0HKAwoT25bjB6YMjuR/RziTigq7iBH
         F7gw==
X-Gm-Message-State: AOAM533tTGikegI+1b/DoMJxdx+jJCW7SXoKWYF97MRtDxam5OeotuJR
        NMi8aURX/ihwQDDfGxHCQqE=
X-Google-Smtp-Source: ABdhPJy9WKT9B9LqnfUdOtAPpZAXoYoWywOXdRC4ijsy+oAHa/I039rfm7Zyffh5fndwBvspuWi3zA==
X-Received: by 2002:a17:902:da81:b0:14a:8fda:e321 with SMTP id j1-20020a170902da8100b0014a8fdae321mr2645228plx.96.1642751451167;
        Thu, 20 Jan 2022 23:50:51 -0800 (PST)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id n35sm3353873pgb.25.2022.01.20.23.50.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jan 2022 23:50:50 -0800 (PST)
From:   Li-hao Kuo <lhjeff911@gmail.com>
To:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lh.kuo@sunplus.com, wells.lu@sunplus.com,
        Li-hao Kuo <lhjeff911@gmail.com>
Subject: [PATCH v4 2/2] dt-bindings:i2c: Add Sunplus SP7021 schema
Date:   Fri, 21 Jan 2022 15:50:56 +0800
Message-Id: <3361159c0a654eb237638969e64ccde742d2c7c0.1642751147.git.lhjeff911@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1642751147.git.lhjeff911@gmail.com>
References: <cover.1642751147.git.lhjeff911@gmail.com>
In-Reply-To: <cover.1642751147.git.lhjeff911@gmail.com>
References: <cover.1642751147.git.lhjeff911@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add bindings for Sunplus SP7021 i2c driver

Signed-off-by: Li-hao Kuo <lhjeff911@gmail.com>
---
Changes in v4:
 - Modified the YAML file : fix indentation issue

 .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 73 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
new file mode 100644
index 0000000..e44a7ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) Sunplus Co., Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-sunplus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sunplus I2C controller
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+maintainers:
+  - Li-hao Kuo <lhjeff911@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - sunplus,sp7021-i2cm
+      - sunplus,q645-i2cm
+
+  reg:
+    items:
+      - description: I2C registers
+      - description: I2C DMA registers
+      - description: I2C DMA power registers
+
+  reg-names:
+    items:
+      - const: i2cm
+      - const: i2cmdma
+      - const: i2cdmapower
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - resets
+  - clock-frequency
+  - pinctrl-names
+  - pinctrl-0
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sp-sp7021.h>
+    #include <dt-bindings/reset/sp-sp7021.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c@9C004600 {
+        compatible = "sunplus,sp7021-i2cm";
+        reg = <0x9c004600 0x80>, <0x9c004680 0x80>, <0x9c000000 0x80>;
+        reg-names = "i2cm", "i2cmdma", "i2cdmapower";
+        interrupt-parent = <&intc>;
+        interrupts = <174 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clkc I2CM0>;
+        resets = <&rstc RST_I2CM0>;
+        clock-frequency = <100000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&i2cm0_pins>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4f83935..44eddba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18494,6 +18494,7 @@ SUNPLUS I2C CONTROLLER INTERFACE DRIVER
 M:	Li-hao Kuo <lhjeff911@gmail.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
 F:	drivers/i2c/busses/i2c-sunplus.c
 
 SUPERH
-- 
2.7.4

