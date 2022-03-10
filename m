Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865E54D4640
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 12:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241812AbiCJLsc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 06:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241814AbiCJLrr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 06:47:47 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123B71480C4;
        Thu, 10 Mar 2022 03:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646912806; x=1678448806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jL7cdye1Ir+ZaUEJroIOEwZ3lyyxn9XxoM3wkpTy+Vo=;
  b=ElCvh/utsCAPDMmuS2b7HsCurCDgM/EJapei4xnFBWLt1IOpEvbZHify
   R1WprBvoTuojaceEBglv2sjWed8x49eGecr29d+XvoO6B4GsWXrSpNumg
   vCY3ozj9AX36N0mw4LpWlzpQf8DfYx6ZY8GgXcYRl/XuAyMZw95BPPo2f
   hDfiJW8yA7rM5EwyOLGCDzp9Hl1LfBXueJJtaDmDuppSepECg6tNBG9Q5
   oH4CGn6ZqEOGBD0E9RZwx81Hr042yIIwx7ke0mtRDo6e0igQRsR5d+Ym7
   Hw0BbIPLlQIa4wspAAbvljGKaBqH3Q0Sva2BtMwIDd/lC+b43q0QfChCN
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,170,1643698800"; 
   d="scan'208";a="148756547"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Mar 2022 04:46:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 10 Mar 2022 04:46:44 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 10 Mar 2022 04:46:41 -0700
From:   Sergiu Moga <sergiu.moga@microchip.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Sergiu Moga <sergiu.moga@microchip.com>
Subject: [PATCH v2 3/3] dt-bindings: i2c: at91: Add SAMA7G5 compatible strings list
Date:   Thu, 10 Mar 2022 13:45:53 +0200
Message-ID: <20220310114553.184763-4-sergiu.moga@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310114553.184763-1-sergiu.moga@microchip.com>
References: <20220310114553.184763-1-sergiu.moga@microchip.com>
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
 .../bindings/i2c/atmel,at91sam-i2c.yaml       | 26 ++++++++++++-------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index a64b7d0ce6bf..ea2303c0e143 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -12,16 +12,21 @@ maintainers:
 
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
@@ -79,6 +84,7 @@ allOf:
               - atmel,sama5d4-i2c
               - atmel,sama5d2-i2c
               - microchip,sam9x60-i2c
+              - microchip,sama7g5-i2c
     then:
       properties:
         i2c-sda-hold-time-ns:
-- 
2.25.1

