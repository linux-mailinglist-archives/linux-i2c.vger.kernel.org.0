Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEA96EF1A6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Apr 2023 12:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240221AbjDZKH5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Apr 2023 06:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240033AbjDZKHz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Apr 2023 06:07:55 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC35746BB;
        Wed, 26 Apr 2023 03:07:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,227,1677510000"; 
   d="scan'208";a="160827163"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2023 19:07:47 +0900
Received: from renesas-ubuntu18.ree.adwin.renesas.com (unknown [10.226.93.103])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 44F3F4001DC5;
        Wed, 26 Apr 2023 19:07:44 +0900 (JST)
From:   Chris Paterson <chris.paterson2@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH] dt-bindings: i2c: renesas,rzv2m: Change maintainer to Fabrizio Castro
Date:   Wed, 26 Apr 2023 11:07:36 +0100
Message-Id: <20230426100736.11808-1-chris.paterson2@renesas.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Phil no longer works for Renesas.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
index 92e899905ef8..5d1e7885b64a 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Renesas RZ/V2M I2C Bus Interface
 
 maintainers:
-  - Phil Edworthy <phil.edworthy@renesas.com>
+  - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
-- 
2.40.0

