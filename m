Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC54B30748A
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 12:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhA1LOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 06:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhA1LO1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 06:14:27 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E881FC061573
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 03:13:46 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id NBDl2400D4C55Sk01BDlUz; Thu, 28 Jan 2021 12:13:45 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l55FA-001L6Q-RJ; Thu, 28 Jan 2021 12:13:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l55FA-009dHD-6N; Thu, 28 Jan 2021 12:13:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: eeprom: at24: Document ROHM BR24G01
Date:   Thu, 28 Jan 2021 12:13:43 +0100
Message-Id: <20210128111343.2295888-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the compatible value for the ROHM Semiconductor BR24G01 I2C bus
EEPROM.

While at it, sort the entries alphabetically.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index d5117c638b75c76c..021d8ae42da318e4 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -95,9 +95,6 @@ properties:
                   pattern: spd$
       # These are special cases that don't conform to the above pattern.
       # Each requires a standard at24 model as fallback.
-      - items:
-          - const: rohm,br24t01
-          - const: atmel,24c01
       - items:
           - const: nxp,se97b
           - const: atmel,24c02
@@ -113,6 +110,12 @@ properties:
       - items:
           - const: renesas,r1ex24128
           - const: atmel,24c128
+      - items:
+          - const: rohm,br24g01
+          - const: atmel,24c01
+      - items:
+          - const: rohm,br24t01
+          - const: atmel,24c01
 
   label:
     description: Descriptive name of the EEPROM.
-- 
2.25.1

