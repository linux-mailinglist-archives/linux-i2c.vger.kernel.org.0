Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156B244979E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240838AbhKHPK3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:10:29 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:20358 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240779AbhKHPJy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384030; x=1667920030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RnzRJe2j8YUJD/3ju4Zm4B76UxmFkkmN8AGI+FaOFNU=;
  b=q0om1p1V3kq/jjkHmCrMXPBs9zm8L7an7vU2kPTfmWftyWwaqceqKiVd
   v3olxGDNqs4hShKqhvOs0EtAp+EDBrxh1gVPKEBp/kItSSYLMW2xOLGT+
   nqjQKcLbRIPBswaalhr+HsyfNZITHJHgwYCwBLKVHbr1+cuGntmC2OITT
   StfdIBdR0DwXD0ZErB2+7rcx31vlcqQ7iHlYNVQ59fBfBLGWuv+ISR8L4
   Hr4KX38ZwEAulGPHZzPKyQqEn5s4Ne0KjsUjSEA1cDUVGGJIi58YRTXfG
   WdE0iCcxof+s6DN+9sO6MO38JSM7ELPNWsF4OjekS3J4WPqwIA4qTPqtn
   Q==;
IronPort-SDR: gRM9iGd4Z5kToPIKmNPXQJXDF74gHh3Qo/SQy68lOs7xfksj32OLdrRet39IwAnqbcxVpWSF1x
 Om/cp2zzU/XZeZT32IWIF6eXbpTio0E2wGCnnNZiQD2j1RprcGHR6fQE3QnnYFNc/0+/7GgOIg
 flFvtFBBEmrN2e22JogEyWkClpz//rA0ip/1RYhkteMHHOvSpAQflRaXk3QmZlH/6q4iwPTpHK
 wraOZ/noYzF6L6qkLTvBJch64MSkn4v6UL61drg0xlUuSAkfGJWjOrq1LvuqRldaFOO4IiKETQ
 PcIJ0sR1bKLCGofpRBaG7huf
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="143179818"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:07:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:08 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:07:04 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>
Subject: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs rng
Date:   Mon, 8 Nov 2021 15:05:47 +0000
Message-ID: <20211108150554.4457-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the hardware rng device accessed via
the system services on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
new file mode 100644
index 000000000000..e8ecb3538a86
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS random number generator
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,polarfire-soc-rng
+
+  syscontroller:
+    maxItems: 1
+    description: name of the system controller device node
+
+required:
+  - compatible
+  - "syscontroller"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwrandom: hwrandom {
+        compatible = "microchip,polarfire-soc-rng";
+        syscontroller = <&syscontroller>;
+    };
-- 
2.33.1

