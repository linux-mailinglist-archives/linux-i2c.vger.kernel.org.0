Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135B648EC77
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242754AbiANPQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:16:24 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:50579 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242738AbiANPQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173382; x=1673709382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OOEiOzJYOr2rjLZtIJaPl6yuaJhJGBub8XFzhK4pAzA=;
  b=YTL1Y+kQ+ULwsXGMFjzB6jnCes208LJC3brDSOVRjhWzVP5MBcqWJedu
   WdUIgKXZ3ghtf6dVe7UN43yZ+QEvUWznfaQotoszf3d0voquLwqLGvUAD
   Ra4q7jPZARrv6LU3ahkTimtrwnW9g8RQnpLE5RxmG2mK3eOkkGxhzkw78
   zdaRMga1YLogrEr19OomJS+M7JWv5mUSjH1PfRVa1C/oO6xS5p+qGwWAp
   MR1oUYj58vbPW/DSuooWj7idlSjrrUNkDZCpfeDOo7XA4W7LlggeX9FtN
   mYO/17Ixg75kmsZPDbfKb4JQOnX6BBDBgR4MByAhFEtKINsraevoMuR59
   Q==;
IronPort-SDR: ZlverUWZhaP2CTWMXKf4HNoJGvGRsBvJ3fqFwRjK4JqtOOSstUnLSbsVFgelk7MxAWKl4C5JMD
 Jfba3pOk4g8o5zmfyPY8C7ogcT28kY0xG326jhZWUet/a3fHoOjCDcgWe4bD60aWuf7jHMP1kE
 QsYD1rBGZzMQiYJsQNIn8A8PaaWuC2CCY9SseAH6aBIXPPy35bk5YDmJoZCM8zQtbiQHZHxmLK
 kGHVWXIWtUam7VeTOUTglRrIX2zsCpA+F+tZrWHEepjTTiV2Nws5dNiyqil14ezwtvvO8eyVu6
 cW3P04SemoAul75toaEtbFIC
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="142730796"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:16:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:16:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:16:15 -0700
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
        <atishp@rivosinc.com>
Subject: [PATCH v3 02/15] dt-bindings: soc/microchip: add services as children of sys ctrlr
Date:   Fri, 14 Jan 2022 15:17:14 +0000
Message-ID: <20220114151727.2319915-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add mpfs-rng and mpfs-generic-services as children of the system
controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-sys-controller.yaml        | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index f699772fedf3..b69386b1a3e1 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -13,13 +13,45 @@ description: |
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
+
+  rng:
+    type: object
+
+    description: |
+      The hardware random number generator on the Polarfire SoC is
+      accessed via the mailbox interface provided by the system controller
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
+    description: |
+      The PolarFire SoC system controller is communicated with via a mailbox.
+      This binding represents several of the functions provided by the system
+      controller which do not belong in a specific subsystem, such as reading
+      the fpga device certificate, all of which follow the same format:
+        - a command + optional payload sent to the sys controller
+        - a status + a payload returned to Linux
+
+    properties:
+      compatible:
+        const: microchip,mpfs-generic-service
+
+    required:
+      - compatible
 
 required:
   - compatible
@@ -29,7 +61,13 @@ additionalProperties: false
 
 examples:
   - |
-    syscontroller: syscontroller {
+    syscontroller {
       compatible = "microchip,mpfs-sys-controller";
       mboxes = <&mbox 0>;
+      rng: rng {
+        compatible = "microchip,mpfs-rng";
+      };
+      sysserv: sysserv {
+        compatible = "microchip,mpfs-generic-service";
+      };
     };
-- 
2.32.0

