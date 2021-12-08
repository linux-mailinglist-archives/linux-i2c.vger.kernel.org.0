Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6A246D146
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 11:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhLHKt3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 05:49:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhLHKt3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Dec 2021 05:49:29 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDF4C061A32
        for <linux-i2c@vger.kernel.org>; Wed,  8 Dec 2021 02:45:56 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:a0bd:6217:e9a0:bd39])
        by andre.telenet-ops.be with bizsmtp
        id Tmlt2600G2LoXaB01mltQB; Wed, 08 Dec 2021 11:45:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1muuSO-003dvS-SU; Wed, 08 Dec 2021 11:45:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1muuD7-00BVez-IR; Wed, 08 Dec 2021 11:30:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: at24: Rework special case compatible handling
Date:   Wed,  8 Dec 2021 11:30:03 +0100
Message-Id: <9ca85ea0eda03d581ccb435052cf37ba19000c3b.1638959309.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sort the compatible values for the special cases by EEPROM size, like is
done for the normal cases.
Combine entries with a common fallback using enums, to compact the
table.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/eeprom/at24.yaml      | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 4c5396a9744f68f5..8b9f230e84156b5b 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -95,17 +95,20 @@ properties:
       # These are special cases that don't conform to the above pattern.
       # Each requires a standard at24 model as fallback.
       - items:
-          - const: nxp,se97b
-          - const: atmel,24c02
+          - enum:
+              - rohm,br24g01
+              - rohm,br24t01
+          - const: atmel,24c01
       - items:
-          - const: onnn,cat24c04
-          - const: atmel,24c04
+          - enum:
+              - nxp,se97b
+              - renesas,r1ex24002
+          - const: atmel,24c02
       - items:
-          - const: onnn,cat24c05
+          - enum:
+              - onnn,cat24c04
+              - onnn,cat24c05
           - const: atmel,24c04
-      - items:
-          - const: renesas,r1ex24002
-          - const: atmel,24c02
       - items:
           - const: renesas,r1ex24016
           - const: atmel,24c16
@@ -115,12 +118,6 @@ properties:
       - items:
           - const: renesas,r1ex24128
           - const: atmel,24c128
-      - items:
-          - const: rohm,br24g01
-          - const: atmel,24c01
-      - items:
-          - const: rohm,br24t01
-          - const: atmel,24c01
 
   label:
     description: Descriptive name of the EEPROM.
-- 
2.25.1

