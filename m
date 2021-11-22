Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686C14597B1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 23:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbhKVW1x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 17:27:53 -0500
Received: from soltyk.jannau.net ([144.76.91.90]:59168 "EHLO soltyk.jannau.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhKVW1v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 17:27:51 -0500
Received: from coburn.home.jannau.net (p579ad520.dip0.t-ipconnect.de [87.154.213.32])
        by soltyk.jannau.net (Postfix) with ESMTPSA id CACFB261B43;
        Mon, 22 Nov 2021 23:24:42 +0100 (CET)
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
Subject: [PATCH v2 2/3] dt-bindings: i2c: apple,i2c: allow multiple compatibles
Date:   Mon, 22 Nov 2021 23:24:39 +0100
Message-Id: <20211122222440.21177-3-j@jannau.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122222440.21177-1-j@jannau.net>
References: <20211122222440.21177-1-j@jannau.net>
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
Reviewed-by: Sven Peter <sven@svenpeter.dev>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 22fc8483256f..82b953181a52 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -20,9 +20,9 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - apple,t8103-i2c
-      - apple,i2c
+    items:
+      - const: apple,t8103-i2c
+      - const: apple,i2c
 
   reg:
     maxItems: 1
@@ -51,7 +51,7 @@ unevaluatedProperties: false
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

