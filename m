Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC376478733
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhLQJcM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:32:12 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:47380 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbhLQJcL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733532; x=1671269532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Ys5Zp18b6DPFQFZkjB5/UX5vB+X8TCYLaOUPyG10Ao=;
  b=bgdoGtt/etYbr+Q7FRD3waKsTSEqsoI2IYdXFpSWUuyFwyWp7AFJKoBZ
   cY1QfOCNW3v25ghzey2fXOABm7hZkS4DsxOcyeYwnJPtlcXYsX0JyYu9n
   kl/PdzSnVYy55NGcwT6Ji2xztMjyTq6IOJpn6dp5iHvQGRbIIO5EyqAzZ
   nQ5yHNVAWeox5Go2op18bTNhhlw47LRVZwEd/JUIj9Ohztn+1wlYFVbqz
   rR1atdjiz/M/Uc6ZD3wAh9cXJjL1IAoyG3sxjVvJgNVgtfN8gEeTyuv7M
   pyW1jdPqOiGk+az0O8FkDFmaJqD0D+9ft8dCcLE/cITRQbrmIr6n6cDQf
   g==;
IronPort-SDR: GEWBkyiFq90yQY7D5HbEF2vqImlqERWVo7V0Gd8xo9xPlDOUMW/2GidNIcgvgnWGsCuVNwNVxN
 6A8JM0+SctVBgRrt1Z8XoZUi/bO2/Rudf9fU+4Nkj9nOELLsjyxZshaYMxI3/b/NDSvXNwMtbD
 gDTGJjVtGfCXtt1oh35g2SsF9+XlPxk0WhWSp1FFAj0P9j0pGP7CjjhavWB6ECbAuoM7aj3a5J
 +nsuanKQ77X5VIv9Fn96iflMQBeJh/btQSxzMBK0TGlY+Taa3mlH+QXJxysrBYdpYypQ01Sbxd
 rnEPWXYViPcA8yvU6UzAM/kl
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147002623"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:32:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:09 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:32:04 -0700
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
Subject: [PATCH v2 03/17] dt-bindings: soc/microchip: make systemcontroller a mfd
Date:   Fri, 17 Dec 2021 09:33:11 +0000
Message-ID: <20211217093325.30612-4-conor.dooley@microchip.com>
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

Make the system controller on the Polarfire SoC
a "simple,mfd" so that the services can be child
nodes of the system controller node.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-sys-controller.yaml        | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index f699772fedf3..014cb44b8f31 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -13,13 +13,34 @@ description: |
   The PolarFire SoC system controller is communicated with via a mailbox.
   This document describes the bindings for the client portion of that mailbox.
 
-
 properties:
   mboxes:
     maxItems: 1
 
   compatible:
-    const: microchip,mpfs-sys-controller
+    items:
+      - const: microchip,mpfs-sys-controller
+      - const: simple-mfd
+
+  hwrandom:
+    type: object
+
+    properties:
+      compatible:
+        const: microchip,mpfs-rng
+
+    required:
+      - compatible
+
+  sysserv:
+    type: object
+
+    properties:
+      compatible:
+        const: microchip,mpfs-generic-service
+
+    required:
+      - compatible
 
 required:
   - compatible
@@ -30,6 +51,12 @@ additionalProperties: false
 examples:
   - |
     syscontroller: syscontroller {
-      compatible = "microchip,mpfs-sys-controller";
+      compatible = "microchip,mpfs-sys-controller", "simple-mfd";
       mboxes = <&mbox 0>;
+      hwrandom: hwrandom {
+        compatible = "microchip,mpfs-rng";
+      };
+      sysserv: sysserv {
+        compatible = "microchip,mpfs-generic-service";
+      };
     };
-- 
2.33.1

