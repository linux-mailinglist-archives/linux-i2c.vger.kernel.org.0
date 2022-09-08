Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23DFF5B12B1
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 04:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiIHCy4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 22:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiIHCyz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 22:54:55 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9D8474E2;
        Wed,  7 Sep 2022 19:54:53 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MNNsy0gmMz14QNY;
        Thu,  8 Sep 2022 10:51:02 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 8 Sep
 2022 10:54:51 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <xuwei5@huawei.com>, <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH next v3 2/2] dt-bindings: i2c: add entry for hisilicon,hisi-i2c
Date:   Thu, 8 Sep 2022 10:57:01 +0800
Message-ID: <20220908025701.330210-2-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
In-Reply-To: <20220908025701.330210-1-chenweilong@huawei.com>
References: <20220908025701.330210-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the new compatible for HiSilicon common i2c.

Signed-off-by: Weilong Chen <chenweilong@huawei.com>
---
 .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
new file mode 100644
index 000000000000..19d535f4a79e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
@@ -0,0 +1,68 @@
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
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clk_rate:
+    default: 0xEE6B280
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
+    default: 0x33E
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
+    i2c1: i2c@5038B0000{
+      compatible = "hisilicon,hisi-i2c";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0x5 0x038B0000 0 0x10000>;
+      interrupts = <0x0 120 0x4>;
+      i2c-sda-falling-time-ns = <56>;
+      i2c-scl-falling-time-ns = <56>;
+      i2c-sda-hold-time-ns = <56>;
+      i2c-scl-rising-time-ns = <56>;
+      i2c-digital-filter-width-ns = <0x0>;
+      clk_rate = <0x0 0xEE6B280>;
+      clock-frequency = <400000>;
+    };
-- 
2.31.GIT

