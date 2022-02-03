Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18D44A8650
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 15:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351291AbiBCOdc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 09:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351278AbiBCOd0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 09:33:26 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A7FC061741
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 06:33:23 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:15aa:ab80:d2f:edb])
        by michel.telenet-ops.be with bizsmtp
        id qeZN2600B4dXKBW06eZNje; Thu, 03 Feb 2022 15:33:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFdAo-00D0Xl-1i; Thu, 03 Feb 2022 15:33:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFdAn-002sr2-D8; Thu, 03 Feb 2022 15:33:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779f0 support
Date:   Thu,  3 Feb 2022 15:33:16 +0100
Message-Id: <9558127ad3a49fc6e03a0f9cb9ff19917f4e52ab.1643898531.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643898531.git.geert+renesas@glider.be>
References: <cover.1643898531.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document support for the I2C Bus Interfaces in the Renesas R-Car S4-8
(R8A779F0) SoC, including a new family-specific compatible value for the
R-Car Gen4 family.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
index 052aad44e781a561..c30107833a5145f9 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
@@ -49,6 +49,11 @@ properties:
               - renesas,i2c-r8a779a0     # R-Car V3U
           - const: renesas,rcar-gen3-i2c # R-Car Gen3 and RZ/G2
 
+      - items:
+          - enum:
+              - renesas,i2c-r8a779f0     # R-Car S4-8
+          - const: renesas,rcar-gen4-i2c # R-Car Gen4
+
   reg:
     maxItems: 1
 
@@ -132,6 +137,7 @@ allOf:
             enum:
               - renesas,rcar-gen2-i2c
               - renesas,rcar-gen3-i2c
+              - renesas,rcar-gen4-i2c
     then:
       required:
         - resets
-- 
2.25.1

