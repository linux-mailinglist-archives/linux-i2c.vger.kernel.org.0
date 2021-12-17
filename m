Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E6447874A
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbhLQJcu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:32:50 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:16916 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbhLQJct (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733568; x=1671269568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fRK83uB7UBmgy7OppXNXdK4ZxB+gBwJv/ZT1t+O9sS0=;
  b=F10+gqB5y2cCuZX0ukj/BHMGxzvpO2dcBz45DpmrwAC1WCBVVOWE5ojr
   1apoIAgVSajvXV5jshL8PE4yNHgHuNWgmZ+f08SFfAL88n/EBmPfdrwcr
   JjC4T/kETrSUIKEaggV2GwjXnML2v+bozhs64Y7+57twZN8uyCaTLIvuU
   /vad6ix4VKUEP2pJkO5sv8wOSo/YodtaZCsjjxyqdGc6gWCfW1W0hLYAO
   EoMcDnnCP/Lgy+JcTqPenuDuEQtBHh4xd640RbggAAYSTFu9z2kJfPuev
   gEIQkRHwe+/9ah0XQDIwJ8dGX2gLLJu1sLvD1f+aC0a1PGXX28pz/uJUl
   Q==;
IronPort-SDR: CrKd4tOB+b68mUuQA2Zc6ZHToi/KHgvehYmiy4PX3pIT90VbOVR9DHCKvNXqJwwTSbeeBF8d9b
 qT/hxcMZ8ru69NqKG4oYHAcbnxezkEusLPGkbJjzooonvMjQXrGRX3OBaACKbERSZt6tjFmqGT
 CjVEPj/2sqNN0oQfkZ5tc21Z5cP8bBfVUA6+2AU70yfSMx1cbniCpQJVdr7lUxUOYa3W7OWSJU
 ms4r0BOxTvuXf6ZAkbpL9sjKttMVqmBmBPnbJYKHwM8Hvi6WDoDyiIobtpHrLDYAvxPKHrvcbe
 LM0m7AafWCeLwB16ghkWz/qX
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="140110734"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:32:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:32:41 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atish.patra@wdc.com>
Subject: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip mpfs rng
Date:   Fri, 17 Dec 2021 09:33:14 +0000
Message-ID: <20211217093325.30612-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
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
 .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
new file mode 100644
index 000000000000..32cbc37c9292
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
@@ -0,0 +1,29 @@
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
+description: |
+  The hardware random number generator on the Polarfire SoC is
+  accessed via the mailbox interface provided by the system controller
+
+properties:
+  compatible:
+    const: microchip,mpfs-rng
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    hwrandom: hwrandom {
+        compatible = "microchip,mpfs-rng";
+    };
-- 
2.33.1

