Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5034C2BC5
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 13:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbiBXMb5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 07:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbiBXMb4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 07:31:56 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7D126F4E5
        for <linux-i2c@vger.kernel.org>; Thu, 24 Feb 2022 04:31:26 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:598d:7788:288b:e4f])
        by xavier.telenet-ops.be with bizsmtp
        id z0XP2600C0fvPgN010XPhT; Thu, 24 Feb 2022 13:31:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNDHG-001jJe-Ta; Thu, 24 Feb 2022 13:31:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNDHG-00CPGI-52; Thu, 24 Feb 2022 13:31:22 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of compatible items
Date:   Thu, 24 Feb 2022 13:31:21 +0100
Message-Id: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

make dt_binding_check:

    Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Fixes: f1bd6661946b20d1 ("dt-bindings: i2c: add bindings for microchip mpfs i2c")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
index c8e605fbb8a6b3d0..7bad4b946a349c8b 100644
--- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -16,8 +16,8 @@ properties:
   compatible:
     oneOf:
       - items:
-        - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
-        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
+          - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+          - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
       - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
 
   reg:
-- 
2.25.1

