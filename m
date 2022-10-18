Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECEB602597
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 09:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiJRHW3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 03:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbiJRHWS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 03:22:18 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFB3AB82B;
        Tue, 18 Oct 2022 00:22:16 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ms4wd6MCQzpVhq;
        Tue, 18 Oct 2022 15:18:57 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 15:22:11 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <xuwei5@huawei.com>, <wsa@kernel.org>, <robh+dt@kernel.org>,
        <robh@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH next v6 2/2] dt-bindings: i2c: add entry for hisilicon,i2c-ascend910
Date:   Tue, 18 Oct 2022 15:30:12 +0800
Message-ID: <20221018073012.309355-2-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
In-Reply-To: <20221018073012.309355-1-chenweilong@huawei.com>
References: <20221018073012.309355-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Change since v5:
- Use hisilicon,i2c-ascend910 as compatible string. For more information about
  the SoC at https://e.huawei.com/en/products/cloud-computing-dc/atlas/ascend-910
- Alphabetic order the MAINTAINERS

Change since v4:
- Add description for SoC specific compatibles.
- Use the clock binding.
- Fix decimal, space, case, unused labels.
Link: https://lore.kernel.org/lkml/20220909074842.281232-1-chenweilong@huawei.com/T/#m4e1c915ead04f4e2e48d69131053a966801625db

 .../bindings/i2c/hisilicon,i2c-xxx.yaml       | 70 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml
new file mode 100644
index 000000000000..a7285ddc260d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/hisilicon,i2c-xxx.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: HiSilicon common IIC controller Device Tree Bindings
+
+maintainers:
+  - yangyicong@huawei.com
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: hisilicon,i2c-ascend910
+    description:
+      The HiSilicon common IIC controller can be used for many different
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
index ad32dc9c4822..961e4442fb08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9211,6 +9211,7 @@ M:	Yicong Yang <yangyicong@hisilicon.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 W:	https://www.hisilicon.com
+F:	Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml
 F:	drivers/i2c/busses/i2c-hisi.c
 
 HISILICON LPC BUS DRIVER
-- 
2.31.GIT

