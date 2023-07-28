Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405F2766A63
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 12:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235878AbjG1K0O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 06:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbjG1KZq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 06:25:46 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C8A3AA9;
        Fri, 28 Jul 2023 03:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690539919; x=1722075919;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sXObJvFOIGK/mqhYpuwAgl4c9CSw6fuF7YraS2BMD6g=;
  b=vU9cF4V9SJPimPydujYeblaKIwX0QK/fvZrWLQORXK07itfEemy5CP2T
   8nLxvTvNXtnoRk+yYXXkJzF4/OMZdeznDvQrHnVOqc5ThERptXvVzHEP5
   SpWaDzMQR369I0D0PJW8IPOsQcUkPS1mmJ3CAw5vx8cE7JM8MdoRF47Tu
   ird5sASlIq/9LKRJ1P1lBft8yYAkgVgv62OkuLQ/7rUKbgnGj4gb/OrYE
   WThHx+3m0HtZ1bk/Ls/EKnBKTZ7oEvr3a975XUFp9x6VUUevBwZEpxDHQ
   Pkmp1fb4Xtd9ivHFUOjI9JTfOvvTKRpqu9ooCv7wsZwbsLYnfH900zDkB
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="163712550"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 03:25:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 03:25:14 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 03:25:10 -0700
From:   Varshini Rajendran <varshini.rajendran@microchip.com>
To:     <andi.shyti@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <varshini.rajendran@microchip.com>
Subject: [PATCH v3 13/50] dt-bindings: i2c: at91: Add sam9x7 compatible string
Date:   Fri, 28 Jul 2023 15:55:06 +0530
Message-ID: <20230728102506.265917-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add compatible string for sam9x7.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index 6adedd3ec399..6f3158604d02 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -27,6 +27,9 @@ properties:
       - items:
           - const: microchip,sama7g5-i2c
           - const: microchip,sam9x60-i2c
+      - items:
+          - const: microchip,sam9x7-i2c
+          - const: microchip,sam9x60-i2c
 
   reg:
     maxItems: 1
@@ -84,6 +87,7 @@ allOf:
               - atmel,sama5d4-i2c
               - atmel,sama5d2-i2c
               - microchip,sam9x60-i2c
+              - microchip,sam9x7-i2c
               - microchip,sama7g5-i2c
     then:
       properties:
-- 
2.25.1

