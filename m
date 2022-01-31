Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B99D4A45EA
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 12:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiAaLsj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 06:48:39 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:10095 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380644AbiAaLpo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 06:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643629544; x=1675165544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GArxRL0ukTLHtvXGn7fxkIcEOSLOLGCe2nkS7p6MYBQ=;
  b=z6EeeiHfg9Z6GWoAgSPzurWrrn1zlZdILXJvt2FwDctX7UG2oL24Tpnn
   Qz5jTsJyG5Cd6RwmrrTOw5KD2fhSdWaHXUZryGRY0HIiq+TbMFAqrc7hi
   oaRf0bEgAv3iE+08vfTTAuIeqH+B2lFLbkVlcV3A6b93XTHC09RlssLN5
   sHkIeD7anMqHNryx7rFjlIWEJxlJ0XCZwxltJc+UH7zW0zWKyFqys/mN7
   esI9zM40KGdfDAM81zSjAVy1b9GxomKjEdS6n3bisCJcZE4+EujWyeaBt
   TWxEwbDdqmXbCfkhKaI1Q7vnZ/undpHTv3khAI/6h2BHxDBwWEog1msgt
   Q==;
IronPort-SDR: 5FOp1HJ7qC9ioKQ8XhILvYGGfhsqe25vOHplcqueSD42EQlOpoqYbUKOqukc/HPDf8EP+QSwnX
 SMMteOQUOp4bAVwwpEAqsNWindEXNSlGbosrHL12CY0w+FM7kx63glGy+o1K2X/xNO6Tr240R8
 fR+WdH8DKiCFaaMUpDmTb6emovOuodlCvcAblkDw6WjUD3iLN8k8wCfzH3u1MmUkeoMZA9tLto
 M8gGD+1CVSisX/n5IYYlWTU+kj5HnFAyKBzrsPg0TdJ5c6Rt3c892+PXKZqW3Ob5zUUB8okWWw
 kWokAe689Hj8z3LHB01gO7B9
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="147115850"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2022 04:45:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:45:42 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 31 Jan 2022 04:45:37 -0700
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
Subject: [PATCH v5 02/12] dt-bindings: soc/microchip: add services as children of sys ctrlr
Date:   Mon, 31 Jan 2022 11:47:17 +0000
Message-ID: <20220131114726.973690-3-conor.dooley@microchip.com>
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

Add mpfs-rng and mpfs-generic-services as children of the system
controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-sys-controller.yaml        | 41 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index f699772fedf3..5e9977bc114e 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -13,7 +13,6 @@ description: |
   The PolarFire SoC system controller is communicated with via a mailbox.
   This document describes the bindings for the client portion of that mailbox.
 
-
 properties:
   mboxes:
     maxItems: 1
@@ -21,6 +20,38 @@ properties:
   compatible:
     const: microchip,mpfs-sys-controller
 
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
+
 required:
   - compatible
   - mboxes
@@ -29,7 +60,13 @@ additionalProperties: false
 
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
2.35.0

