Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9957B3A7990
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jun 2021 10:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhFOI4P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Jun 2021 04:56:15 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:29801 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231169AbhFOI4P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Jun 2021 04:56:15 -0400
X-IronPort-AV: E=Sophos;i="5.83,275,1616425200"; 
   d="scan'208";a="84276835"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jun 2021 17:54:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.147])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B2C5341EB326;
        Tue, 15 Jun 2021 17:54:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: i2c: renesas,riic: Document RZ/G2L I2C controller
Date:   Tue, 15 Jun 2021 09:53:59 +0100
Message-Id: <20210615085400.4251-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210615085400.4251-1-biju.das.jz@bp.renesas.com>
References: <20210615085400.4251-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document RZ/G2L I2C controller bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
   * No change
v1->v2
   * Added Geert's Rb tag 
---
 .../devicetree/bindings/i2c/renesas,riic.yaml | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 2d6378164958..52d92ec7ec0b 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/A I2C Bus Interface (RIIC)
+title: Renesas RZ/A and RZ/G2L I2C Bus Interface (RIIC)
 
 maintainers:
   - Chris Brandt <chris.brandt@renesas.com>
@@ -17,9 +17,10 @@ properties:
   compatible:
     items:
       - enum:
-          - renesas,riic-r7s72100 # RZ/A1H
-          - renesas,riic-r7s9210  # RZ/A2M
-      - const: renesas,riic-rz    # RZ/A
+          - renesas,riic-r7s72100   # RZ/A1H
+          - renesas,riic-r7s9210    # RZ/A2M
+          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
+      - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
   reg:
     maxItems: 1
@@ -56,6 +57,16 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,riic-r9a07g044
+then:
+  required:
+    - resets
+
 unevaluatedProperties: false
 
 examples:
-- 
2.17.1

