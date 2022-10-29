Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 546BF612294
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Oct 2022 13:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiJ2LwM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Oct 2022 07:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiJ2LwK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Oct 2022 07:52:10 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954F76C766;
        Sat, 29 Oct 2022 04:52:08 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MzyM65s8MzVj83;
        Sat, 29 Oct 2022 19:47:14 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 19:52:06 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <f.fainelli@gmail.com>, <jarkko.nikula@linux.intel.com>,
        <jdelvare@suse.de>, <william.zhang@broadcom.com>,
        <jsd@semihalf.com>, <conor.dooley@microchip.com>,
        <phil.edworthy@renesas.com>,
        <tharunkumar.pasumarthi@microchip.com>,
        <semen.protsenko@linaro.org>, <kfting@nuvoton.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH next v9 2/4] dt-bindings: i2c: add entry for hisilicon,ascend910-i2c
Date:   Sat, 29 Oct 2022 19:59:37 +0800
Message-ID: <20221029115937.179788-2-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
In-Reply-To: <20221029115937.179788-1-chenweilong@huawei.com>
References: <20221029115937.179788-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the new compatible for HiSilicon i2c.

Signed-off-by: Weilong Chen <chenweilong@huawei.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Change since v8:
- Use vendor,soc-ipblock format.
- Drop quotes.
- Drop "Device Tree bindings".
- Description goes to top level description.
- Use defines for constants.
Link: https://lore.kernel.org/lkml/20221024015151.342651-2-chenweilong@huawei.com/

 .../bindings/i2c/hisilicon,ascend910-i2c.yaml | 73 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml
new file mode 100644
index 000000000000..7d7a8de7bcd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/hisilicon,ascend910-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon common I2C controller
+
+maintainers:
+  - Yicong Yang <yangyicong@hisilicon.com>
+
+description:
+  The HiSilicon common I2C controller can be used for many different
+  types of SoC such as Huawei Ascend AI series chips.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: hisilicon,ascend910-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    default: 400000
+
+  i2c-sda-falling-time-ns:
+    default: 343
+
+  i2c-scl-falling-time-ns:
+    default: 203
+
+  i2c-sda-hold-time-ns:
+    default: 830
+
+  i2c-scl-rising-time-ns:
+    default: 365
+
+  i2c-digital-filter-width-ns:
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@38b0000 {
+      compatible = "hisilicon,ascend910-i2c";
+      reg = <0x38b0000 0x10000>;
+      interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+      i2c-sda-falling-time-ns = <56>;
+      i2c-scl-falling-time-ns = <56>;
+      i2c-sda-hold-time-ns = <56>;
+      i2c-scl-rising-time-ns = <56>;
+      i2c-digital-filter;
+      i2c-digital-filter-width-ns = <0x0>;
+      clocks = <&alg_clk>;
+      clock-frequency = <400000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d1214d83c2df..d42e34d1e8e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9228,6 +9228,7 @@ M:	Yicong Yang <yangyicong@hisilicon.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 W:	https://www.hisilicon.com
+F:	Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml
 F:	drivers/i2c/busses/i2c-hisi.c
 
 HISILICON LPC BUS DRIVER
-- 
2.31.GIT

