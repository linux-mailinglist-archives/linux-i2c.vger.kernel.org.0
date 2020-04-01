Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCC919AD16
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Apr 2020 15:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732745AbgDANrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Apr 2020 09:47:16 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40789 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732742AbgDANrQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Apr 2020 09:47:16 -0400
Received: by mail-pj1-f66.google.com with SMTP id kx8so2745341pjb.5
        for <linux-i2c@vger.kernel.org>; Wed, 01 Apr 2020 06:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gpcjNNLQA0WgFogrno8/hAByG7ANx+ntF+/9mZ/TVN0=;
        b=bxn6fusrh8FVy2J1x16GTpyVB+/j78MoEQlJme2KHWxAyQBGUi18q52lW/oKJmVES5
         nlpcRV89pUL0TF2wXgCWm042y5phxbswTlr0vrVpqBUAAvlD1zSwkY8fNdf/JtfImS/e
         kv3+HC8g9Yof0Dmta4iAmQ4u039SVq5wz9Xb/wWuy5IZ6fFOXzkeel/hYe7NfvfXTPzP
         dZCAA2S67+LmkFw0eJugL7URDV/RQ6Uv0ffGXc0Ic5EyvEuWrsHLCp+d+91gLMcfSdfx
         nk+DkMW2lA4Bpxdc5bBXKRH8n3g+OsScOC7pkcVvddsF7dBk/nVm1x7RzPM2U0vjMJRP
         lWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gpcjNNLQA0WgFogrno8/hAByG7ANx+ntF+/9mZ/TVN0=;
        b=dIvaLkFL25bzkeg4C7Z7vK1+Oj70eO+6bBLeIUK8v8TcqfOPDaywV8JBNVys/7a70j
         otliSxWsx5z4D0XYHuKXjUEIczxdEUoGu77RXg8PhIbujnPJuRaNzFb+4RQotgthyFPD
         FkzR/mytck97AJ1pBrg4sKOMs76gEYC/cFHcVYj+eSf6NkySaywcrdvHorbcIgiuGXkz
         3T249pcdt/qAPMvTfqHKYVfzTF+xI2Nt6YPqjTPrFeayObOwTaIpXHksOsVLXEBm+W6s
         1hf8G31Y1DnzhKwTK/3QEeBZW2VTMWoxcu+kmrJs7HyI6FceFR73GA04Hqyv+/Jr7CWG
         yGgA==
X-Gm-Message-State: AGi0PublrUE3esVhCnDAu7YFmRTEJunZMJhBR6m14Tl0npR9Y+IXXSVq
        WvUkwsRAqR8tZ0UuFib7jJhL
X-Google-Smtp-Source: APiQypLFZPHBpXoYMtd+0WFz5JReMGyPKKF6vkPKqKWUXp48l3vkOnvM3cUBSMhQ3ZV66bG76ztBBw==
X-Received: by 2002:a17:902:7788:: with SMTP id o8mr18610843pll.9.1585748834975;
        Wed, 01 Apr 2020 06:47:14 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:bf52:1f8e:88d2:6ec])
        by smtp.gmail.com with ESMTPSA id b17sm1661930pff.81.2020.04.01.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 06:47:14 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     devicetree@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] dt-bindings: i2c: xiic: Migrate i2c-xiic documentation to YAML
Date:   Wed,  1 Apr 2020 22:47:09 +0900
Message-Id: <20200401134709.60421-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The document was migrated to YAML format and renamed xlnx,xps-iic-2.00.a.yaml

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 .../devicetree/bindings/i2c/i2c-xiic.txt      | 25 ----------
 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     | 49 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 50 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-xiic.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-xiic.txt b/Documentation/devicetree/bindings/i2c/i2c-xiic.txt
deleted file mode 100644
index caf42e9894625..0000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-xiic.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Xilinx IIC controller:
-
-Required properties:
-- compatible : Must be "xlnx,xps-iic-2.00.a"
-- reg : IIC register location and length
-- interrupts : IIC controller unterrupt
-- #address-cells = <1>
-- #size-cells = <0>
-- clocks: Input clock specifier. Refer to common clock bindings.
-
-Optional properties:
-- Child nodes conforming to i2c bus binding
-- clock-names: Input clock name, should be 'pclk'.
-
-Example:
-
-	axi_iic_0: i2c@40800000 {
-		compatible = "xlnx,xps-iic-2.00.a";
-		clocks = <&clkc 15>;
-		interrupts = < 1 2 >;
-		reg = < 0x40800000 0x10000 >;
-
-		#size-cells = <0>;
-		#address-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
new file mode 100644
index 0000000000000..67c1c84ba3dc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: ilinx IIC controller Device Tree Bindings
+
+maintainers:
+  - info@mocean-labs.com
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: xlnx,xps-iic-2.00.a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  clock-name:
+    const: pclk
+    description: |
+      Input clock name.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    axi_iic_0: i2c@40800000 {
+      compatible = "xlnx,xps-iic-2.00.a";
+      clocks = <&clkc 15>;
+      interrupts = < 1 2 >;
+      reg = < 0x40800000 0x10000 >;
+
+      #size-cells = <0>;
+      #address-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1fb95a12eda48..ffaf0053aba86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2673,7 +2673,7 @@ F:	drivers/block/xsysace.c
 N:	zynq
 N:	xilinx
 F:	Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
-F:	Documentation/devicetree/bindings/i2c/i2c-xiic.txt
+F:	Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
 F:	drivers/clocksource/timer-cadence-ttc.c
 F:	drivers/i2c/busses/i2c-cadence.c
 F:	drivers/mmc/host/sdhci-of-arasan.c
-- 
2.26.0

