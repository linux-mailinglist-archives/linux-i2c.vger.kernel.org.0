Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5262C4497AE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240885AbhKHPKk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:10:40 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:1701 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240743AbhKHPKG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384042; x=1667920042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F223P+LHyG+a0gJr80sI/UE2JykLqh7/ehIIfBDOW8g=;
  b=h9tlJiIo/GPA2PWEUbDFdi4/myeNdsHSgQtt7PFD/JiQouY+9SWNPTj+
   iJ7XB0En7nie/bj+WM1/Y8gAXOJgvQwuJGgMmriUvyNX7nVs7RRoqq2yS
   wOL9PeFFhix2nsigfoFEh5EXKN6VS8fjCs5PjFUetR1oMFAi5cLVPlxYR
   Mw8Ci5nqq9/ulLyA53qxLN8JkN+h146Tu3OHxldS8bDMJwVUFnDKFk0oT
   s4s9hAGXxmh3ksGHGlmEDSqzfSwMbbyRPS1JURTTpUcv1Nd37Aa/t3rZa
   vf2wjuyBc1CFW4R8XEh7jHlya0sp2VGN1mVpdcXmna6QKxlykVqw328GS
   w==;
IronPort-SDR: LotEgQwU7ZY6BNm4ah1XgQEO/UjY+3RM6gsVefFeUIFWBJan6unqHZ2yffCijMkI00ptRI6Gau
 x73O72vNDJ/Mma+7XTsUdFdoZqL69pl1NfPDOdFYULoGQmOEbDi0OSOYUHSvtf9zVaRKozCqV/
 UdJK1U2tAHbIlFrjUt31zeqSqQ2StvODqQbz96Me3GmV6366fLwQIRgeKds1Dj/sQFdFWnNfP9
 IdXABMSaKz7swchhprsDNraKlVO1SlKxrIYhD4BP5g0DdWAEhgkVcmIkiGPmLfnlDuGUNePSLF
 PUoDQOSoLOdvYFMhx+VDLUpq
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="142601885"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:07:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:07:16 -0700
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
Subject: [PATCH 08/13] dt-bindings: soc/microchip: add bindings for mpfs system services
Date:   Mon, 8 Nov 2021 15:05:49 +0000
Message-ID: <20211108150554.4457-9-conor.dooley@microchip.com>
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

Add device tree bindings for the services provided by the system
controller directly on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-generic-service.yaml       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
new file mode 100644
index 000000000000..f89d3a74c059
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-generic-service.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS system services
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,mpfs-generic-service
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
+    sysserv: sysserv {
+        compatible = "microchip,mpfs-generic-service";
+        syscontroller = <&syscontroller>;
+    };
-- 
2.33.1

