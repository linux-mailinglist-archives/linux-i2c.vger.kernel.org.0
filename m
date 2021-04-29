Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFDF36E6DB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Apr 2021 10:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240018AbhD2IOz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 04:14:55 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:35616 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240044AbhD2IOO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 04:14:14 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 482AFBA1B9;
        Thu, 29 Apr 2021 16:13:26 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P31919T139683992426240S1619684003975702_;
        Thu, 29 Apr 2021 16:13:26 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <eee30af8476834019eba667cd31b47e4>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 30
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   <cl@rock-chips.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: [PATCH v4 07/10] dt-bindings: soc: rockchip: Convert grf.txt to YAML
Date:   Thu, 29 Apr 2021 16:13:21 +0800
Message-Id: <20210429081321.17855-1-cl@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429081151.17558-1-cl@rock-chips.com>
References: <20210429081151.17558-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

Current dts files with 'grf' nodes are manually verified. In order to
automate this process grf.txt has to be converted to YAML.

Add new descriptions for:
"rockchip,rk3568-grf", "syscon", "simple-mfd"
"rockchip,rk3568-pmugrf", "syscon", "simple-mfd"

Signed-off-by: Liang Chen <cl@rock-chips.com>
---
 .../devicetree/bindings/soc/rockchip/grf.txt  | 61 -------------------
 .../devicetree/bindings/soc/rockchip/grf.yaml | 60 ++++++++++++++++++
 2 files changed, 60 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
deleted file mode 100644
index f96511aa3897..000000000000
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-* Rockchip General Register Files (GRF)
-
-The general register file will be used to do static set by software, which
-is composed of many registers for system control.
-
-From RK3368 SoCs, the GRF is divided into two sections,
-- GRF, used for general non-secure system,
-- SGRF, used for general secure system,
-- PMUGRF, used for always on system
-
-On RK3328 SoCs, the GRF adds a section for USB2PHYGRF,
-
-ON RK3308 SoC, the GRF is divided into four sections:
-- GRF, used for general non-secure system,
-- SGRF, used for general secure system,
-- DETECTGRF, used for audio codec system,
-- COREGRF, used for pvtm,
-
-Required Properties:
-
-- compatible: GRF should be one of the following:
-   - "rockchip,px30-grf", "syscon": for px30
-   - "rockchip,rk3036-grf", "syscon": for rk3036
-   - "rockchip,rk3066-grf", "syscon": for rk3066
-   - "rockchip,rk3188-grf", "syscon": for rk3188
-   - "rockchip,rk3228-grf", "syscon": for rk3228
-   - "rockchip,rk3288-grf", "syscon": for rk3288
-   - "rockchip,rk3308-grf", "syscon": for rk3308
-   - "rockchip,rk3328-grf", "syscon": for rk3328
-   - "rockchip,rk3368-grf", "syscon": for rk3368
-   - "rockchip,rk3399-grf", "syscon": for rk3399
-   - "rockchip,rv1108-grf", "syscon": for rv1108
-- compatible: DETECTGRF should be one of the following:
-   - "rockchip,rk3308-detect-grf", "syscon": for rk3308
-- compatilbe: COREGRF should be one of the following:
-   - "rockchip,rk3308-core-grf", "syscon": for rk3308
-- compatible: PMUGRF should be one of the following:
-   - "rockchip,px30-pmugrf", "syscon": for px30
-   - "rockchip,rk3368-pmugrf", "syscon": for rk3368
-   - "rockchip,rk3399-pmugrf", "syscon": for rk3399
-- compatible: SGRF should be one of the following:
-   - "rockchip,rk3288-sgrf", "syscon": for rk3288
-- compatible: USB2PHYGRF should be one of the following:
-   - "rockchip,px30-usb2phy-grf", "syscon": for px30
-   - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
-- compatible: USBGRF should be one of the following:
-   - "rockchip,rv1108-usbgrf", "syscon": for rv1108
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-Example: GRF and PMUGRF of RK3399 SoCs
-
-	pmugrf: syscon@ff320000 {
-		compatible = "rockchip,rk3399-pmugrf", "syscon";
-		reg = <0x0 0xff320000 0x0 0x1000>;
-	};
-
-	grf: syscon@ff770000 {
-		compatible = "rockchip,rk3399-grf", "syscon";
-		reg = <0x0 0xff770000 0x0 0x10000>;
-	};
diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
new file mode 100644
index 000000000000..93231b95554b
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip General Register Files
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    - items:
+        - enum:
+            - rockchip,px30-grf
+            - rockchip,px30-pmugrf
+            - rockchip,px30-usb2phy-grf
+            - rockchip,rk3036-grf
+            - rockchip,rk3066-grf
+            - rockchip,rk3188-grf
+            - rockchip,rk3228-grf
+            - rockchip,rk3288-grf
+            - rockchip,rk3288-sgrf
+            - rockchip,rk3308-core-grf
+            - rockchip,rk3308-detect-grf
+            - rockchip,rk3308-grf
+            - rockchip,rk3328-grf
+            - rockchip,rk3328-usb2phy-grf
+            - rockchip,rk3368-grf
+            - rockchip,rk3368-pmugrf
+            - rockchip,rk3399-grf
+            - rockchip,rk3399-pmugrf
+            - rockchip,rk3568-grf
+            - rockchip,rk3568-pmugrf
+            - rockchip,rv1108-grf
+            - rockchip,rv1108-usbgrf
+        - const: syscon
+        - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmugrf: syscon@ff320000 {
+       compatible = "rockchip,rk3399-pmugrf", "syscon", "simple-mfd";
+       reg = <0xff320000 0x1000>;
+    };
+
+    grf: syscon@ff770000 {
+       compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
+       reg = <0xff770000 0x10000>;
+    };
-- 
2.17.1



