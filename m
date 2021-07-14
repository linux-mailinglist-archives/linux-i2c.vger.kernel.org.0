Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C44E3C8521
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 15:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239381AbhGNNXA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 09:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhGNNW7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 09:22:59 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5F4C061765
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 06:20:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by baptiste.telenet-ops.be with bizsmtp
        id V1L52500Q1ccfby011L5Hw; Wed, 14 Jul 2021 15:20:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo1-00193u-Bm; Wed, 14 Jul 2021 15:20:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo0-00Aapj-RN; Wed, 14 Jul 2021 15:20:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/4] dt-bindings: i2c: renesas,riic: Add interrupt-names
Date:   Wed, 14 Jul 2021 15:20:00 +0200
Message-Id: <a81d0e14e395f297666e8c3a8ce3e292d2606a65.1626267422.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626267422.git.geert+renesas@glider.be>
References: <cover.1626267422.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Renesas RZ/A and RZ/G2L I2C Bus Interface has no less than 8
interrupts.  Hence document the "interrupt-names" property, to make it
easier to review the interrupt mappings in DTS files.

Note that this property cannot be made required yet, as the RIIC nodes
in all DTS files lack the property.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 29 ++++++++++++++-----
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 52d92ec7ec0b2112..70f998f006305c25 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -27,14 +27,25 @@ properties:
 
   interrupts:
     items:
-      - description: Transmit End Interrupt (TEI)
-      - description: Receive Data Full Interrupt (RI)
-      - description: Transmit Data Empty Interrupt (TI)
-      - description: Stop Condition Detection Interrupt (SPI)
-      - description: Start Condition Detection Interrupt (STI)
-      - description: NACK Reception Interrupt (NAKI)
-      - description: Arbitration-Lost Interrupt (ALI)
-      - description: Timeout Interrupt (TMOI)
+      - description: Transmit End Interrupt
+      - description: Receive Data Full Interrupt
+      - description: Transmit Data Empty Interrupt
+      - description: Stop Condition Detection Interrupt
+      - description: Start Condition Detection Interrupt
+      - description: NACK Reception Interrupt
+      - description: Arbitration-Lost Interrupt
+      - description: Timeout Interrupt
+
+  interrupt-names:
+    items:
+      - const: tei
+      - const: ri
+      - const: ti
+      - const: spi
+      - const: sti
+      - const: naki
+      - const: ali
+      - const: tmoi
 
   clock-frequency:
     description:
@@ -85,6 +96,8 @@ examples:
                          <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "tei", "ri", "ti", "spi", "sti", "naki", "ali",
+                              "tmoi";
             clocks = <&mstp9_clks R7S72100_CLK_I2C0>;
             clock-frequency = <100000>;
             power-domains = <&cpg_clocks>;
-- 
2.25.1

