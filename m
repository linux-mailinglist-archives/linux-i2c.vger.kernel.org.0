Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D83C05BDE0A
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 09:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiITHUl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 03:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiITHUk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 03:20:40 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102B53F1EC;
        Tue, 20 Sep 2022 00:20:39 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWtB31HmfzMmw1;
        Tue, 20 Sep 2022 15:15:55 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 15:20:35 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <xuwei5@huawei.com>, <wsa@kernel.org>, <robh+dt@kernel.org>,
        <robh@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH next v5 2/2] dt-bindings: i2c: add entry for hisilicon,hisi-i2c
Date:   Tue, 20 Sep 2022 15:22:15 +0800
Message-ID: <20220920072215.161331-2-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
In-Reply-To: <20220920072215.161331-1-chenweilong@huawei.com>
References: <20220920072215.161331-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the new compatible for HiSilicon common i2c.

Signed-off-by: Weilong Chen <chenweilong@huawei.com>
---
Change since v4:
- Add description for SoC specific compatibles.
- Use the clock binding.
- Fix decimal, space, case, unused labels.
Link: https://lore.kernel.org/lkml/20220909074842.281232-1-chenweilong@huawei.com/T/#m4e1c915ead04f4e2e48d69131053a966801625db

 .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 72 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
new file mode 100644
index 000000000000..b06eb8cb88bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/hisilicon,hisi-i2c.yaml#"
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
+    const: hisilicon,hisi-i2c
+    description:
+      The HiSilicon common IIC controller can be used for many different
+      types of SoC such as Huawei Ascend AI series chips. We use the common
+      string (hisi) for specific compatibles to avoid confusion caused by a
+      lot of different names.
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
+      compatible = "hisilicon,hisi-i2c";
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
index d213a831133f..4c928a444e4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9155,6 +9155,7 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 W:	https://www.hisilicon.com
 F:	drivers/i2c/busses/i2c-hisi.c
+F:	Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
 
 HISILICON LPC BUS DRIVER
 M:	john.garry@huawei.com
-- 
2.31.GIT

