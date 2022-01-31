Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F474A45D2
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 12:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376891AbiAaLqx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 06:46:53 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:2742 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380565AbiAaLpj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 06:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643629538; x=1675165538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FOsmUbbny+ixBX3cWHAy4nowHDLKpppGZfGFKSKvMPc=;
  b=FN8A9/qyJO+pJEQliZe1mx08YZkndEommwiXCOB7U2ZYurZuNITdY0at
   wtUKJm5Y++HvVyfBRQuaoHKf2bRc9JC60eS6syHtvzXRnAd4UR4dJC4Q3
   Q9Mdics6rxwsChA6j3RwVcM0MWNK/qWAqTGIsWPSbaWYmEK4+X7Ju7FBI
   lRLPmZmxypT0p3fI8RL53Uaj60N8AHSn2dnA3pY4gUANNUfiulcnYm+1m
   a0Yx0AHzdLJO50ObnpCZkTPdi8TWsd8KgCUSH23mSgi86TpV5DYtVOmq/
   um2GujQb4dLn1Wes3GF2xypT8EejXJtRxeWdoshraBlPnpMXmxputSxID
   w==;
IronPort-SDR: F454A3WrrP8zSsgW3ADCsbQeZhdF0hDc2QcfhGt472B+aWTLyRd2sPpc/qMB00RBaf6hAiq5c7
 4Y9Xe11uJzqwn7kvCCNfnf46JQniG15U8spYFCWBsT22nhp2fGgCiZWzeUwK59cxZwTjUTLCpQ
 2g1CsJTTWvJfeUwjBkKCvTG9i8WMUbEhbCUVyImilxodHg03mRISqYXQd+PQ9Nv2xKP7hoJpS9
 2b1/KckhxINvpgmMQWNOA+HzyVasrWS4pJqT2J0YzUZSR+JVoLJN1wAtt0X+tw7OetXxGulFw+
 LPFiuYwUjS4NOgKalW335jUa
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="144390590"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2022 04:45:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:45:37 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 31 Jan 2022 04:45:31 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC:     <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v5 01/12] dt-bindings: soc/microchip: update syscontroller compatibles
Date:   Mon, 31 Jan 2022 11:47:16 +0000
Message-ID: <20220131114726.973690-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

The Polarfire SoC is currently using two different compatible string
prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
its system controller in order to match the compatible string used in
the soc binding and device tree

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
 ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
rename to Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index bbb173ea483c..082d397d3e89 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/microchip,polarfire-soc-mailbox.yaml#"
+$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
@@ -11,7 +11,7 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,polarfire-soc-mailbox
+    const: microchip,mpfs-mailbox
 
   reg:
     items:
@@ -38,7 +38,7 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
       mbox: mailbox@37020000 {
-        compatible = "microchip,polarfire-soc-mailbox";
+        compatible = "microchip,mpfs-mailbox";
         reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
         interrupt-parent = <&L1>;
         interrupts = <96>;
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
similarity index 75%
rename from Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
rename to Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index 2cd3bc6bd8d6..f699772fedf3 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/microchip/microchip,polarfire-soc-sys-controller.yaml#"
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-sys-controller.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) system controller
@@ -19,7 +19,7 @@ properties:
     maxItems: 1
 
   compatible:
-    const: microchip,polarfire-soc-sys-controller
+    const: microchip,mpfs-sys-controller
 
 required:
   - compatible
@@ -30,6 +30,6 @@ additionalProperties: false
 examples:
   - |
     syscontroller: syscontroller {
-      compatible = "microchip,polarfire-soc-sys-controller";
+      compatible = "microchip,mpfs-sys-controller";
       mboxes = <&mbox 0>;
     };
-- 
2.35.0

