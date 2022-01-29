Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C414A327C
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 00:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353398AbiA2XAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 18:00:50 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:59169 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353393AbiA2XAt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jan 2022 18:00:49 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9CEE632008FA;
        Sat, 29 Jan 2022 18:00:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 29 Jan 2022 18:00:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=9yxtGa/gxLqBTSBTDmI/ioVNCFPQcS
        50q3woH6HVfqY=; b=A7lnOu/cte98W0Yd2LUMJxPM94Rlhx0+a4zBN6c7tT8UKE
        AM1aQw0YsXIiZxioTqSo9CdBTTk44+0d6U5cjxxVag/VDtxrXM7n/tmjJ9Dq0MrD
        fwZwLraW3eoyvZ2QmhSZzyiuOBRrNGEfHVmpmvSjEkQge70GNY7L45pkE++UKIh/
        CGTp1bMN+V9c5LH/wnWcvJVgIdqLrrS+aUw1vAaDESXcOwIPDrjFXNB8ESfYE6dq
        mPkiJsYPmOZO0Y+8JiI0NAiXxhP6bJxb9Jd0jdrNqWB37AuabTCSjV1IsPGqXqi1
        l9do80xjgp3fMKATDgpeLtqHCYFC8YHI5218kgYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9yxtGa
        /gxLqBTSBTDmI/ioVNCFPQcS50q3woH6HVfqY=; b=FGkMTVPN/kfjGsbtecw77p
        4vsDkrS5/JGWG9tZ0NfYQy6PxrADf9XYlplf35KdwShvhs0N3iTirRuTHUX7T4US
        oUmRq20eJyKA+of36/pH/0MO/pE3nj7MDnnDEGzC3wGQYPOODF8jMy+sz36VL+8K
        suJtg3DWIRu/tM4NmsPZRAUgkFXPizltwwuglEuQHD8nuZnN2nAh89zsDJ5N/vM8
        NZ3dHJNY9OoX+LYuqYzGfQedZvHi7KOFZrOXkDC3ZzWfi6/hsDRtcBFqhizxFxIX
        YbMg2hxZEITYy4e2TJveSFpA2G+INpChrH81BO42Q3dJGdBzFdBgx7xzfBlVNZbA
        ==
X-ME-Sender: <xms:H8f1YYOLsdL09zXSnvyV_NwMcH2thOxm541HpGqitl_JUo7i1g2UWQ>
    <xme:H8f1Ye80qrdoC5U5ShtGSOTXDKlWD_sIWjqtCeQV5P2z14vSsjCs2b-_IcVyeuZSa
    enfowVEPIgAeIRjew>
X-ME-Received: <xmr:H8f1YfSbuyQbROoej9T9H-f8L1-xUnFBUSh_G4sigoW0eN7BxCM4_kZiLK3YYg6c9td8gP2BnpiM4Rar0NMee9V_o5DDenLn8iCxHQvbiefVy5Q4KpOzDEokiWYAzz2NwC5CqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgddujedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeelueelgeettdfggfeuffevkefhuddtteeigfevhfdtffdtjefgteeg
    leeggedvudenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhho
    lhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:H8f1YQsL0tMqMJ0gtaeAG0d18UVt2mtijbJX7_HdNZpJ28N6a-Rm_Q>
    <xmx:H8f1YQdawtpRjUBpF6hmpATKQheVpUer_buYPfRG6vyVsTGoLDiyMw>
    <xmx:H8f1YU07_VIuYXTYOf4ReIfZKnLEtBXKJzvLSSJnvKOs6v4d1H0w4g>
    <xmx:IMf1YevYVoWjjBhEYaU1sX82yrohN9EKvmf7WTRdCO4hF_z-ejEDxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Jan 2022 18:00:47 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/5] dt-bindings: input: Add the PinePhone keyboard binding
Date:   Sat, 29 Jan 2022 17:00:38 -0600
Message-Id: <20220129230043.12422-2-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220129230043.12422-1-samuel@sholland.org>
References: <20220129230043.12422-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add devicetree support for the PinePhone keyboard case, which provides a
matrix keyboard interface and a proxied I2C bus.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../input/pine64,pinephone-keyboard.yaml      | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml b/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
new file mode 100644
index 000000000000..00f084b263f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/pine64,pinephone-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pine64 PinePhone keyboard device tree bindings
+
+maintainers:
+  - Samuel Holland <samuel@sholland.org>
+
+description:
+  A keyboard accessory is available for the Pine64 PinePhone and PinePhone Pro.
+  It connects via I2C, providing a raw scan matrix, a flashing interface, and a
+  subordinate I2C bus for communication with a battery charger IC.
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: pine64,pinephone-keyboard
+
+  reg:
+    const: 0x15
+
+  interrupts:
+    maxItems: 1
+
+  linux,fn-keymap:
+    $ref: /schemas/input/matrix-keymap.yaml#/properties/linux,keymap
+    description: keymap used when the Fn key is pressed
+
+  wakeup-source: true
+
+  i2c-bus:
+    $ref: /schemas/i2c/i2c-controller.yaml#
+
+dependencies:
+  linux,fn-keymap: [ 'keypad,num-columns', 'keypad,num-rows' ]
+  linux,keymap: [ 'keypad,num-columns', 'keypad,num-rows' ]
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
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      keyboard@15 {
+        compatible = "pine64,pinephone-keyboard";
+        reg = <0x15>;
+        interrupt-parent = <&r_pio>;
+        interrupts = <0 12 IRQ_TYPE_EDGE_FALLING>; /* PL12 */
+        keypad,num-rows = <6>;
+        keypad,num-columns = <12>;
+        linux,fn-keymap = <MATRIX_KEY(0,  0, KEY_FN_ESC)
+                           MATRIX_KEY(0,  1, KEY_F1)
+                           MATRIX_KEY(0,  2, KEY_F2)
+                           /* ... */
+                           MATRIX_KEY(5,  2, KEY_FN)
+                           MATRIX_KEY(5,  3, KEY_LEFTALT)
+                           MATRIX_KEY(5,  5, KEY_RIGHTALT)>;
+        linux,keymap = <MATRIX_KEY(0,  0, KEY_ESC)
+                        MATRIX_KEY(0,  1, KEY_1)
+                        MATRIX_KEY(0,  2, KEY_2)
+                        /* ... */
+                        MATRIX_KEY(5,  2, KEY_FN)
+                        MATRIX_KEY(5,  3, KEY_LEFTALT)
+                        MATRIX_KEY(5,  5, KEY_RIGHTALT)>;
+
+        i2c-bus {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          charger@75 {
+            reg = <0x75>;
+          };
+        };
+      };
+    };
-- 
2.33.1

