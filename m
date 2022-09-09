Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150785B330B
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Sep 2022 11:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbiIIJJM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 05:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbiIIJJJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 05:09:09 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9819C13463E
        for <linux-i2c@vger.kernel.org>; Fri,  9 Sep 2022 02:09:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by laurent.telenet-ops.be with bizsmtp
        id Hl952800D0sKggw01l95vK; Fri, 09 Sep 2022 11:09:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWa0W-004bZ1-Sn; Fri, 09 Sep 2022 11:09:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWa0W-004OXh-17; Fri, 09 Sep 2022 11:09:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779g0 support
Date:   Fri,  9 Sep 2022 11:09:02 +0200
Message-Id: <a6a704ff5fb06218daed492010e320605a4efe2f.1662714509.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document support for the I2C Bus Interfaces in the Renesas R-Car V4H
(R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
index f9929578c7613f07..c4ace5585e1e22d3 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
@@ -52,6 +52,7 @@ properties:
           - enum:
               - renesas,i2c-r8a779a0     # R-Car V3U
               - renesas,i2c-r8a779f0     # R-Car S4-8
+              - renesas,i2c-r8a779g0     # R-Car V4H
           - const: renesas,rcar-gen4-i2c # R-Car Gen4
 
   reg:
-- 
2.25.1

