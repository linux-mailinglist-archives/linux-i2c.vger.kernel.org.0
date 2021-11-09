Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF0C44A725
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 07:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243375AbhKIHCV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 02:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243362AbhKIHCS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 02:02:18 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67128C061767;
        Mon,  8 Nov 2021 22:59:33 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id q17so7143482plr.11;
        Mon, 08 Nov 2021 22:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O5DLywLCIt3WEr8AzqOeWM2ZVJBih1TyS5Wn3VxhmrA=;
        b=ksxPpsU2yMxE4m2k+HwNsmRofXABRujyAEP8Jj3awk/1y1nIpB1x7Eeqg4cnHKYuxF
         wzdOvc6Ly4mZ51HFcfs0J6mq2Ch2kR8OeRFXhdFVcYcGE+AJ9/SXYUCLAzDI76dJXTZT
         j8PiTEITel0hZ7aw8EgAm6l4nedcBvbi4CAW8V4cFUM1zRFNpI9FbDupWo3cFpPeKIfL
         dcZSAGm2t/WCMk1w3Yck7i0LMEa8628/4w9FuG+yq5jCBtYY0fG4mwrEpMYysR2VvvqJ
         EVM+Vbc4nSH/6uPm0aN6UEGPQ6TLy52va+fpLM2UZGCBZX3K1VQdZN5QNdTX/MX0DDKT
         Mvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O5DLywLCIt3WEr8AzqOeWM2ZVJBih1TyS5Wn3VxhmrA=;
        b=uwyDPgQi1TY4uxmgOoaBRvBhtznBY8KpzMmahEyamgBaxpmopgKof+nbuzERQffFX/
         7hc0Ns+PrYDbTQd8vZEoZn1Htpf8CP3c/2xODbmb4CQW2JCkq6ge/gKUcsJaIItkL8qU
         IDqDn3wpP57Mw00c277uGRcmJ3uO3JH4d74W1Xk9jF2zHlTNrnkGHfSs/vxx3XmvY/nI
         VUrtEN9ALwLTKgf+CWL2ZGdEQMXbesQZUajwZToPyuRwissrcrphC8sHl1B2OaX/qFWn
         IVzyspd1HkpvyQPgFzDsOG17wloJKiAd89NOG3fHX7w4eIut/gSpoxY8g+8eykRhhEps
         7fhw==
X-Gm-Message-State: AOAM531yuktqQgzhn4Vq7SEvULl74zwCg3XmiRvB+2JT7fvidwp0UR3C
        i3iYqC5HW5YWNg3E9xuzpuU=
X-Google-Smtp-Source: ABdhPJxmmfk+rHcVGIoKV3fGudcyp2Tv6+HTR3bPSnqr2vc1KiG8k2/eF4b0/9qPrFKpOdTPOFk8Dg==
X-Received: by 2002:a17:90b:155:: with SMTP id em21mr4900082pjb.12.1636441172848;
        Mon, 08 Nov 2021 22:59:32 -0800 (PST)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id ep15sm1929586pjb.3.2021.11.08.22.59.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 22:59:32 -0800 (PST)
From:   "LH.Kuo" <lhjeff911@gmail.com>
X-Google-Original-From: "LH.Kuo" <lh.kuo@sunplus.com>
To:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, wells.lu@sunplus.com,
        "LH.Kuo" <lh.kuo@sunplus.com>
Subject: [PATCH v2 2/2] devicetree bindings I2C Add bindings doc for Sunplus SP7021
Date:   Tue,  9 Nov 2021 14:59:26 +0800
Message-Id: <1636441166-8127-3-git-send-email-lh.kuo@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441166-8127-1-git-send-email-lh.kuo@sunplus.com>
References: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
 <1636441166-8127-1-git-send-email-lh.kuo@sunplus.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add devicetree bindings I2C Add bindings doc for Sunplus SP7021

Signed-off-by: LH.Kuo <lh.kuo@sunplus.com>
---
Changes in v2:
 - Addressed all comments from Mr. Rob Herring.
 - Modified the structure and register access method.
 - Modifiedthe path about MAINTAINERS. ( wrong messages PATH in v1).
 - Modifiedthe the YAML file.

 .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 82 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
new file mode 100644
index 0000000..af860ee
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sp-sp7021.h>
+    #include <dt-bindings/reset/sp-sp7021.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c@9C004600 {
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
index 5b7a8a2..575a8e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18193,6 +18193,7 @@ SUNPLUS I2C CONTROLLER INTERFACE DRIVER
 M:	LH Kuo <lh.kuo@sunplus.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
 F:	drivers/i2c/busses/i2c-sunplus.c
 
 SUPERH
-- 
2.7.4

