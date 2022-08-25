Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72EF5A0C70
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 11:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239344AbiHYJVe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 05:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239353AbiHYJVd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 05:21:33 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F446A8975;
        Thu, 25 Aug 2022 02:21:29 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MCy6r4Cf4z1N7Gr;
        Thu, 25 Aug 2022 17:17:56 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 25 Aug
 2022 17:21:27 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <yangyicong@hisilicon.com>, <wsa@kernel.org>,
        <chenweilong@huawei.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH next v2 2/2] dt-bindings: i2c: add entry for hisilicon,hisi-i2c
Date:   Thu, 25 Aug 2022 17:24:12 +0800
Message-ID: <20220825092412.307052-2-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
In-Reply-To: <20220825092412.307052-1-chenweilong@huawei.com>
References: <20220825092412.307052-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the new compatible for hisi common i2c.

Signed-off-by: Weilong Chen <chenweilong@huawei.com>
---
 .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
new file mode 100644
index 000000000000..ea967abfe144
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/hisilicon,hisi-i2c.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Hisilicon common IIC controller Device Tree Bindings
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
+    maxItems: 1
+
+  clock-frequency:
+    default: 100000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clk_rate
+  - clock-frequency
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
+      clk_rate = <0x0 0xEE6B280>;
+      clock-frequency = <400000>;
+    };
-- 
2.31.GIT

