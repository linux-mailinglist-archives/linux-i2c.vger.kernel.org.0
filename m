Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27ABE43F91E
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 10:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbhJ2IpM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 04:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbhJ2IpJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Oct 2021 04:45:09 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4971FC061767;
        Fri, 29 Oct 2021 01:42:41 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id x7so3622247pfh.7;
        Fri, 29 Oct 2021 01:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uDTCJZU7DhCB0VVCsGKEbP1g8fUFF2GRuEeusaByhjo=;
        b=QRPETtFsr7C7ddN4PLleARPQ9JjjNNE4rpkXwO1R+h8hs5IWz3EkmWPyqDnEBYVGNm
         c98Gt0yXhGYojoaJSe84FnVgi5TLI0fg4ZovyemdewSqcjJQaEyDE3cMoNaChCbLErpQ
         ohAhaHmoIkMQHQ9XPdWM/SqN9hwE/GwjwZN6zJjC4Lis2Fq+TP374+ZJRGGrgMSV3blc
         Dcmp9McU5rwmCaUG4wNvPeqNllIJmZkt7NC75P/BrIEBXiBm/Jlk3mS2Fr0/4AczJQIV
         Ye5VWapUpZXcPWvzaGziChdWim9FsrEiCygEqkBaTEi3Aev435yjwiDRKwewJoKf3x/J
         uZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uDTCJZU7DhCB0VVCsGKEbP1g8fUFF2GRuEeusaByhjo=;
        b=vW9SDTKFg6pmMSOm4eI2m1TZm9KKNDXxoyd/FHznKUzSGfICAwTQFzhqPQhbCn/u31
         6cWyzDRj7LGfsZ/w+xCdCks297wbBbO5j0v0bQKw7NW9EGwGSrrcgCoBMWYzOKy159F7
         Si5FGgtA1PsBMX9F/MHfQylBQ3IEh0j9pudRoDPuJUau3G1XMXN6ZBfpVRAfWx012jpK
         Kk5+t4awF7T4WeORT9RXrXueox4PA6gTG3Ue06yUZofM7S5dDORJoASWxUUj3jYvRXDQ
         2GF4YRXbq4Kytwku01uMYvn9yAlCbO8mPxUDMlE8w2rA/OKzmd8aarJ2gnHcXXShshLA
         /nZA==
X-Gm-Message-State: AOAM5334feKqB7oPx+VpiMLfypbLQnyAa7A0xqqDTF3ICHhoYMXK/3Q1
        hcxP85KWwGZC+XSHR/GSO4Q=
X-Google-Smtp-Source: ABdhPJzRfUOPUVKf5rmn9tT+CBtylw25DCwfQvB2MDmDAshtyWtJAhnSNO5w3+PsxSB8pPpFTvTJYw==
X-Received: by 2002:a05:6a00:1309:b0:44d:4d1e:c930 with SMTP id j9-20020a056a00130900b0044d4d1ec930mr9486642pfu.65.1635496960821;
        Fri, 29 Oct 2021 01:42:40 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id ml14sm1471424pjb.43.2021.10.29.01.42.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Oct 2021 01:42:40 -0700 (PDT)
From:   "LH.Kuo" <lhjeff911@gmail.com>
X-Google-Original-From: "LH.Kuo" <lh.kuo@sunplus.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dvorkin@tibbo.com, qinjian@cqplus1.com, wells.lu@sunplus.com,
        "LH.Kuo" <lh.kuo@sunplus.com>
Subject: [PATCH 2/2] devicetree bindings I2C Add bindings doc for Sunplus SP7021
Date:   Fri, 29 Oct 2021 16:42:35 +0800
Message-Id: <1635496955-13985-3-git-send-email-lh.kuo@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
References: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add devicetree bindings I2C Add bindings doc for Sunplus SP7021

Signed-off-by: LH.Kuo <lh.kuo@sunplus.com>
---
 .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 82 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
new file mode 100644
index 0000000..7e2f827
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) Sunplus Co., Ltd. 2021
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-sunplus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sunplus's I2C controller
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+maintainers:
+  - lh.kuo <lh.kuo@sunplus.com>
+
+properties:
+  compatible:
+    enum:
+      - sunplus,sp7021-i2cm
+      - sunplus,q645-i2cm
+
+  reg:
+    items:
+      - description: Base address and length of the I2C registers
+      - description: Base address and length of the I2C DMA registers
+
+  reg-names:
+    items:
+      - const: i2cm
+      - const: i2cmdma
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
+  clock-frequency:
+    enum: [ 100000, 400000 ]
+
+  pinctrl-names:
+    description:
+      A pinctrl state named "default" must be defined.
+    const: default
+
+  pinctrl-0:
+    description:
+      A phandle to the default pinctrl state.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - resets
+  - pinctrl-names
+  - pinctrl-0
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sp-sp7021.h>
+    #include <dt-bindings/reset/sp-sp7021.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2cm0: i2c@9C004600 {
+        compatible = "sunplus,sp7021-i2cm";
+        reg = <0x9c004600 0x80>, <0x9c004680 0x80>;
+        reg-names = "i2cm", "i2cmdma";
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
index c89a3b1..7dc9bea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17951,6 +17951,7 @@ SUNPLUS I2C CONTROLLER INTERFACE DRIVER
 M:	LH Kuo <lh.kuo@sunplus.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
 F:	drivers/i2c/busses/i2c-sunplus.c
 
 SUPERH
-- 
2.7.4

