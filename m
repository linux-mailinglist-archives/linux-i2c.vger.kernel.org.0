Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C523F45856F
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 18:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238338AbhKUR2Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 12:28:16 -0500
Received: from soltyk.jannau.net ([144.76.91.90]:53422 "EHLO soltyk.jannau.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238366AbhKUR2M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 21 Nov 2021 12:28:12 -0500
Received: from coburn.home.jannau.net (p579ad520.dip0.t-ipconnect.de [87.154.213.32])
        by soltyk.jannau.net (Postfix) with ESMTPSA id 1D3E7261B2E;
        Sun, 21 Nov 2021 18:15:48 +0100 (CET)
From:   Janne Grunau <j@jannau.net>
To:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: i2c: apple,i2c: allow multiple compatibles
Date:   Sun, 21 Nov 2021 18:15:44 +0100
Message-Id: <20211121171545.27402-3-j@jannau.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211121171545.27402-1-j@jannau.net>
References: <20211121171545.27402-1-j@jannau.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The intention was to have a SoC-specific and base compatible string
to allow forward compatibility and SoC specific quirks,

Fixes: df7c4a8c1b47 ("dt-bindings: i2c: Add Apple I2C controller bindings")
Signed-off-by: Janne Grunau <j@jannau.net>
Cc: Mark Kettenis <kettenis@openbsd.org>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 22fc8483256f..f1cb96c08212 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -20,9 +20,10 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - apple,t8103-i2c
-      - apple,i2c
+    items:
+      - enum:
+        - apple,t8103-i2c
+      - const: apple,i2c
 
   reg:
     maxItems: 1
@@ -51,7 +52,7 @@ unevaluatedProperties: false
 examples:
   - |
     i2c@35010000 {
-      compatible = "apple,t8103-i2c";
+      compatible = "apple,t8103-i2c", "apple,i2c";
       reg = <0x35010000 0x4000>;
       interrupt-parent = <&aic>;
       interrupts = <0 627 4>;
-- 
2.34.0

