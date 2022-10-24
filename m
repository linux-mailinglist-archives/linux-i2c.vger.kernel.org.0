Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08FCC6097EB
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 03:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiJXBoK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Oct 2022 21:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJXBoJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Oct 2022 21:44:09 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083216D9FF;
        Sun, 23 Oct 2022 18:44:08 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MwdCH3v1XzHv3l;
        Mon, 24 Oct 2022 09:43:55 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 09:44:06 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <xuwei5@huawei.com>, <wsa@kernel.org>, <robh+dt@kernel.org>,
        <robh@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH next v8 2/2] dt-bindings: i2c: add entry for hisilicon,i2c-ascend910
Date:   Mon, 24 Oct 2022 09:51:51 +0800
Message-ID: <20221024015151.342651-2-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
In-Reply-To: <20221024015151.342651-1-chenweilong@huawei.com>
References: <20221024015151.342651-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
---
Change since v7:
- Fix yamllint errors, rename i2c-xxx to i2c-ascend910
Link: https://lore.kernel.org/all/166635752527.3428089.707277745439761591.robh@kernel.org/

 .../bindings/i2c/hisilicon,i2c-ascend910.yaml | 70 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
new file mode 100644
index 000000000000..918825a3026b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/hisilicon,i2c-ascend910.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: HiSilicon common I2C controller Device Tree Bindings
+
+maintainers:
+  - Yicong Yang <yangyicong@hisilicon.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: hisilicon,i2c-ascend910
+    description:
+      The HiSilicon common I2C controller can be used for many different
+      types of SoC such as Huawei Ascend AI series chips.
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
+    i2c@5038b0000 {
+      compatible = "hisilicon,i2c-ascend910";
+      reg = <0x38b0000 0x10000>;
+      interrupts = <0x0 120 0x4>;
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
index ad32dc9c4822..5e5e4a3f5ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9211,6 +9211,7 @@ M:	Yicong Yang <yangyicong@hisilicon.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 W:	https://www.hisilicon.com
+F:	Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
 F:	drivers/i2c/busses/i2c-hisi.c
 
 HISILICON LPC BUS DRIVER
-- 
2.31.GIT

