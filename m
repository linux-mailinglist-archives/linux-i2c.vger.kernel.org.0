Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BF21CF459
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 14:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgELM3x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 08:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727859AbgELM3x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 May 2020 08:29:53 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 May 2020 05:29:53 PDT
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36877C061A0C
        for <linux-i2c@vger.kernel.org>; Tue, 12 May 2020 05:29:53 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:81a0:190c:7969:2334])
        by albert.telenet-ops.be with bizsmtp
        id doQr220065045R206oQrsU; Tue, 12 May 2020 14:24:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jYTxr-0005yf-4w; Tue, 12 May 2020 14:24:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jYTxr-0005Gh-1o; Tue, 12 May 2020 14:24:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: eeprom: at24: Fix list of page sizes for writing
Date:   Tue, 12 May 2020 14:24:47 +0200
Message-Id: <20200512122450.20205-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

"258" is an odd power-of-two ;-)
Obviously this is a typo, and the intended value is "256".

Fixes: 7f3bf4203774013b ("dt-bindings: at24: convert the binding document to yaml")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index d77bc475fd148d99..4cee72d5331877a8 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -124,7 +124,7 @@ properties:
       may result in data loss! If not specified, a safety value of
       '1' is used which will be very slow.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 8, 16, 32, 64, 128, 258]
+    enum: [1, 8, 16, 32, 64, 128, 256]
     default: 1
 
   read-only:
-- 
2.17.1

