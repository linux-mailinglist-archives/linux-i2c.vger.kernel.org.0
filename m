Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0750482E4C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jan 2022 06:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbiACFtV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jan 2022 00:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbiACFtU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jan 2022 00:49:20 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA49EC061761;
        Sun,  2 Jan 2022 21:49:19 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so36618630pjj.2;
        Sun, 02 Jan 2022 21:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ZM8AsKjnbJCXOiSD1spteVOK6xblkkzmh7vBy1HLZ10=;
        b=b9ffeM6HeitiNnngoor19nTIL3hqZRHk8lKzltMBAjH0IA0rO+KX7QWTRTmjitaJZU
         AkgqNgDK+eKoiA/KjjL1ibfqi6YUtwMKvd29atFX6Q9KNaQCIAR4BhD3ONgYfuzfwU87
         LzpBz2ninrLiwK7jSyuQ8RlBJrNW0NPuQ5pKxNNkCoCsSMdTOhgCV/STxsz/EXXZ3hLZ
         X8QqGCLPztzKpgm5OTx0cOdDWyIOFV/8DwTYT9VsXUsUiFB2cfZSLOAq8WguQgz14Qvj
         0aYYYmBEuM8Fe9+6StWAnJJBs9NAkWew4q3hUzKQqZfcpYtExl80ohSOy2O7RltABErp
         NgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ZM8AsKjnbJCXOiSD1spteVOK6xblkkzmh7vBy1HLZ10=;
        b=BaATc3R8yD3UJGm7tsIp1CaH/zStZZPqeyRPSGd3J5FWMgfMiWAYbijY4jb9IvZyXN
         W/hxHnR5K8+DK5Mp61fwEqjZy2e70M5ZOKEANVYqcvQphLSTuNFVv4KX7XBEyKZfed0d
         hBxUTkGO5v/jF3JyahB62HeTpGaR81XMWyDr3vTgLTbWn0yY/mvYKlV3H1p4M2758hJp
         E1QAAWE5BDAuDk9AZOtbMu4Cq7TmQ5Awkt0lTVAIL0jJU8s0/WkQM3//fooaw3Vk36lC
         WVJusQajEdNQDiv1X5cMCyqQ4/TMA/nHCDH7ZDAUeytfR7R2yxUemIdWhtx4e3C1bwlX
         ptNA==
X-Gm-Message-State: AOAM530lJKxza/VGOPCAn6wGBk4jjZ368K3NuKRocvm0CFXlk9IpBh8k
        NmSMsbZYr/oytn2P4A0E65o=
X-Google-Smtp-Source: ABdhPJyPnqlRwuJ8LFQHaF+zZmC+WRTAtbCXS63/5OQVllnTN/oorl9vPFl+jx9T4zjs7ZZk+REt2g==
X-Received: by 2002:a17:90b:33ce:: with SMTP id lk14mr53912751pjb.25.1641188959267;
        Sun, 02 Jan 2022 21:49:19 -0800 (PST)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id m6sm30607229pgb.31.2022.01.02.21.49.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jan 2022 21:49:19 -0800 (PST)
From:   Li-hao Kuo <lhjeff911@gmail.com>
To:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lh.kuo@sunplus.com, wells.lu@sunplus.com,
        Li-hao Kuo <lhjeff911@gmail.com>
Subject: [PATCH v3 2/2] devicetree bindings I2C Add bindings doc for Sunplus SP7021
Date:   Mon,  3 Jan 2022 13:49:23 +0800
Message-Id: <9831c3acbbd34ad0d82eec67916f51bff68ae7fe.1641188699.git.lhjeff911@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1641188699.git.lhjeff911@gmail.com>
References: <cover.1641188699.git.lhjeff911@gmail.com>
In-Reply-To: <cover.1641188699.git.lhjeff911@gmail.com>
References: <cover.1641188699.git.lhjeff911@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add devicetree bindings I2C Add bindings doc for Sunplus SP7021

Signed-off-by: Li-hao Kuo <lhjeff911@gmail.com>
---
Changes in v3:
 - Addressed all comments from Mr. Rob Herring.
 - Modified the structure and register access method.
 - Modifiedthe the YAML file.

 .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 72 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
new file mode 100644
index 0000000..ac03041
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
@@ -0,0 +1,72 @@
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
+			reg = <0x9c004600 0x80>, <0x9c004680 0x80>, <0x9c000000 0x80>;
+			reg-names = "i2cm", "i2cmdma", "i2cdmapower";
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
index a06993b..2b8fa55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18246,6 +18246,7 @@ SUNPLUS I2C CONTROLLER INTERFACE DRIVER
 M:	Li-hao Kuo <lhjeff911@gmail.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
 F:	drivers/i2c/busses/i2c-sunplus.c
 
 SUPERH
-- 
2.7.4

