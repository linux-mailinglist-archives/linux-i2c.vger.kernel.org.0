Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50FB125D950
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 15:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730330AbgIDNMc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 09:12:32 -0400
Received: from crapouillou.net ([89.234.176.41]:53486 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730281AbgIDNMA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 09:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599225118; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=MXm0QlSyDYx4inR+MzDqXcasU+Usll3jHy53j4WydOI=;
        b=nM6Zz7ZOpAmOozTxueV/UIxTIN09wSpZ6mEaQibnNwLNdTMCZvttPXBm/rdTidS0CvhkPb
        hjlfkxMZ5mm/vfvkkNq8shoQAg0cDElTPoQIbFskF0+uCpGkRqwu39GuL1F+3ar8EowIUg
        KqZHZ69ax9e5ZmgTZgbbopGPWGKumW4=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] dt-bindings: i2c: ingenic: Add compatible string for the JZ4770
Date:   Fri,  4 Sep 2020 15:11:50 +0200
Message-Id: <20200904131152.17390-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C controller in the JZ4770 SoC seems to work the exact same as in
the JZ4780 SoC.

We could use "ingenic,jz4780-i2c" as a fallback string in the Device
Tree, but that would be awkward, since the JZ4780 is newer. Instead,
add a "ingenic,jz4770-i2c" string and use it as fallback for the
"ingenic,jz4780-i2c" string.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/i2c/ingenic,i2c.yaml         | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
index 682ed1bbf5c6..0e7b4b8a7e48 100644
--- a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -17,9 +17,13 @@ properties:
     pattern: "^i2c@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - ingenic,jz4780-i2c
-      - ingenic,x1000-i2c
+    oneOf:
+      - enum:
+        - ingenic,jz4770-i2c
+        - ingenic,x1000-i2c
+      - items:
+        - const: ingenic,jz4780-i2c
+        - const: ingenic,jz4770-i2c
 
   reg:
     maxItems: 1
@@ -60,7 +64,7 @@ examples:
     #include <dt-bindings/dma/jz4780-dma.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c@10054000 {
-      compatible = "ingenic,jz4780-i2c";
+      compatible = "ingenic,jz4780-i2c", "ingenic,jz4770-i2c";
       #address-cells = <1>;
       #size-cells = <0>;
       reg = <0x10054000 0x1000>;
-- 
2.28.0

