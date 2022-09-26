Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48D5C5EA8AD
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 16:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234602AbiIZOk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 10:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234784AbiIZOjr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 10:39:47 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2F2A58E0D4;
        Mon, 26 Sep 2022 06:01:15 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.220])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OGUojFjdz4iAA--.62163S4;
        Mon, 26 Sep 2022 21:01:10 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
        WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 2/4] dt-bindings: i2c: add bindings for Loongson LS2X I2C
Date:   Mon, 26 Sep 2022 21:00:05 +0800
Message-Id: <73bf41f681f94c9569a439a4ac33e6741bea2878.1664193316.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1664193316.git.zhoubinbin@loongson.cn>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OGUojFjdz4iAA--.62163S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW5WFW8CFWxXF4xurW3Wrg_yoW8Wr4xp3
        ZrCr9rGr40vF17u39xGFy8G3W3Zr95AasrGFZFyw1UKFyDG3Wqvw4akr15Xa13WFy0gFW7
        XFZ29r4jkas7Cr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5GwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUUGYJUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree bindings for the i2c controller on the Loongson-2K Soc
or Loongosn LS7A bridge.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/i2c/loongson,ls2x-i2c.yaml       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
new file mode 100644
index 000000000000..8c785f329d2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/loongson,ls2x-i2c.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson LS2X I2C Controller
+
+maintainers:
+  - Binbin Zhou <zhoubinbin@loongson.cn>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - loongson,ls2k-i2c # Loongson-2K SoCs
+      - loongson,ls7a-i2c # Loongson LS7A Bridge
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+    i2c@1fe21000 {
+        compatible = "loongson,ls2k-i2c";
+        reg = <0 0x1fe21000 0 0x8>;
+        interrupts = <22>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eeprom@57{
+            compatible = "atmel,24c16";
+            reg = <0x57>;
+            pagesize = <16>;
+        };
+    };
-- 
2.31.1

