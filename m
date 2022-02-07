Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD664AC607
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 17:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344647AbiBGQhK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 11:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352714AbiBGQZH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 11:25:07 -0500
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 08:25:06 PST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB6AC0401CF;
        Mon,  7 Feb 2022 08:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644251106; x=1675787106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a6FIsAxlS8CipozOrCRtXjkQdiL4ZSwawArQFXpf6H0=;
  b=k6m2QYdM5MuslAJuYBw2S2MK9CjWO74xO30UbUFNi/pgHvo4VTQ94e/o
   CqQwmT+3nMACHkHTwO6nY7mp2dr//eHM6zSiqf+i45rU36be3adIagfih
   OQ7XjxRo6R84Jxv2diXSSKVUYpQQMT0R1I2szt3X6ySmfqxSsdsquLfwq
   Ujfb6527zvDaybAk/TUz9XkZKl9AIPmIxotzt83xzCGolVueenCIuvewN
   wV5GN7VgsUxrnCvAeCEbsgpma8oEmMcfiQcFQP7IdRrk/R+xlMknelRYI
   piSJKSvf8NeNEbJ+1kxpXtlyWj85y2vGr9xvmYeszNJOetswZDHl987uI
   Q==;
IronPort-SDR: olD1nXIeV6qYui820sqHCq6LXGhzzDFLcA3zFhI0a2QMW+hz3g32tD6oF1MCz3bb06LdU7/KX6
 R6/kmpyiF8Dv9HrR9UFo9Gfrm6so3M1KG3lphrAP+J5+KrO98GBQh/P9JOMj+hGDAtR0Q5Cybh
 O9Inum9/3imfhb9KIOvaGJjhEj/eODimVqMoyiEYlr+vrZ5t+FWmqAXeoNsaHRGCRe1uEQCoBQ
 uDkM0MkfdrDqEfgD0SqRO9rpUl4niYDaQyx38XpGESDSK79jIKPSSMNJuh3DFuN/COxTgXpco/
 Eea5hWLFPkMtjV5GFEgKTGX7
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="145139958"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Feb 2022 09:24:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:24:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 7 Feb 2022 09:23:56 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
        <krzysztof.kozlowski@canonical.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC:     <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 02/12] dt-bindings: soc/microchip: add services as sub devs of sys ctrlr
Date:   Mon, 7 Feb 2022 16:26:28 +0000
Message-ID: <20220207162637.1658677-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207162637.1658677-1-conor.dooley@microchip.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Document mpfs-rng and mpfs-generic-service as subdevices of the system
controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../microchip,mpfs-sys-controller.yaml        | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index f699772fedf3..b02c8bd72605 100644
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
@@ -29,7 +60,7 @@ additionalProperties: false
 
 examples:
   - |
-    syscontroller: syscontroller {
+    syscontroller {
       compatible = "microchip,mpfs-sys-controller";
       mboxes = <&mbox 0>;
     };
-- 
2.35.1

