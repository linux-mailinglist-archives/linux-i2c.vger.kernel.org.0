Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7683F4D2EBC
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Mar 2022 13:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbiCIMIz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Mar 2022 07:08:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbiCIMIr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Mar 2022 07:08:47 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D0A574AE;
        Wed,  9 Mar 2022 04:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646827668; x=1678363668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vQk3AJizw988FGYDrUIDXPHMUr2Qimpe9ZC0M79rv6I=;
  b=jo68gqzlqJ2hsLClJFqdLGLQo/+4WrXFFd4S67Pr5DnttSmusjlP6trt
   Oo2oFC5VxgzCqsBGdRD7cwZNjoiv0UCh4iH28pNe3X/rpa4gLktTXPR1c
   TA7p+KXQETDCCf9o9hbuAmF3s68nNFmHkQ2/6ZT2hZim6jKsK21uWCzkV
   3NYIsG0c/DKYJoYZKxJd7TbnYbDscdmFHBKBt9Pzol+OEJsMGJ30EYHV1
   BVHG/POy1mxcp9NTWXr/qYdKy2OI8YuAjHYCobNrduXzoQ5LT9mi/iq9L
   FEhzANU+WikPMtNHWdC0j8F2ooD/6pGdfMuFoARXxvLDUnpwCy8Uf1hKb
   A==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; 
   d="scan'208";a="151397211"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Mar 2022 05:07:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 05:07:46 -0700
Received: from ROB-ULT-M68701.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 05:07:44 -0700
From:   Sergiu Moga <sergiu.moga@microchip.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Sergiu Moga <sergiu.moga@microchip.com>
Subject: [PATCH 3/3] dt-bindings: i2c: at91: Add SAMA7G5 compatible strings list
Date:   Wed, 9 Mar 2022 14:07:14 +0200
Message-ID: <20220309120714.51393-4-sergiu.moga@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309120714.51393-1-sergiu.moga@microchip.com>
References: <20220309120714.51393-1-sergiu.moga@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add compatible strings list for SAMA7G5.

Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
---
 .../bindings/i2c/atmel,at91sam-i2c.yaml       | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index d4aadbbd1a11..661a679b98cf 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -16,10 +16,15 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - atmel,sama5d4-i2c
-              - atmel,sama5d2-i2c
-              - microchip,sam9x60-i2c
+            oneOf:
+              - items:
+                  - enum:
+                      - atmel,sama5d4-i2c
+                      - atmel,sama5d2-i2c
+                      - microchip,sam9x60-i2c
+              - items:
+                  - const: microchip,sama7g5-i2c
+                  - const: microchip,sam9x60-i2c
     then:
       properties:
         i2c-sda-hold-time-ns:
@@ -29,16 +34,21 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - atmel,at91rm9200-i2c
-      - atmel,at91sam9261-i2c
-      - atmel,at91sam9260-i2c
-      - atmel,at91sam9g20-i2c
-      - atmel,at91sam9g10-i2c
-      - atmel,at91sam9x5-i2c
-      - atmel,sama5d4-i2c
-      - atmel,sama5d2-i2c
-      - microchip,sam9x60-i2c
+    oneOf:
+      - items:
+          - enum:
+              - atmel,at91rm9200-i2c
+              - atmel,at91sam9261-i2c
+              - atmel,at91sam9260-i2c
+              - atmel,at91sam9g20-i2c
+              - atmel,at91sam9g10-i2c
+              - atmel,at91sam9x5-i2c
+              - atmel,sama5d4-i2c
+              - atmel,sama5d2-i2c
+              - microchip,sam9x60-i2c
+      - items:
+          - const: microchip,sama7g5-i2c
+          - const: microchip,sam9x60-i2c
 
   reg:
     maxItems: 1
-- 
2.25.1

