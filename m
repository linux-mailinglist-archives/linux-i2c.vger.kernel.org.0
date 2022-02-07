Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9278F4AB7D7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 10:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbiBGJhz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 04:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351381AbiBGJ3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 04:29:04 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78678C0401CA
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 01:29:03 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id m4so40231397ejb.9
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 01:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bo43NL5WgxumOcYzft9YAYcZtXZd3PhX1zRfnI8bjDk=;
        b=S7RBonqahTYRFKv7WG0mmEYJJUzc1lgwjVMm8b+J3T/EUN6iZ8uhtXgqlWMh/1b02H
         ziD4Jceqsrha8UsKrCqJLi6sYRh3v0gX03YdSTgjoYTGIFrTkz4d8NsCzgrZmMvLkhSS
         IJFIIqbi2s4GUNqR4ybTImL1wVgby+8h+spx97Hjjnzw+uoE+8haTHw246kq6cKBJa2m
         EO3tp78lnmVbiKHkTbGRKyfaaIx+BOPYpje3NoZIi/x3Im8yggUgGsrUI4dj0oD189Lk
         isHgXScgpluL5s1p2TdqTuZYiLN1MDPjLN2bzfRw8b/HCb0xMyn8N6Z+3sGdjoN6cX03
         BNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bo43NL5WgxumOcYzft9YAYcZtXZd3PhX1zRfnI8bjDk=;
        b=mGhPwGauLbeGJe6as7S/3PIc5UFeko/S+VQtSS99IZcuikQfK9YrFnDlUsAVSbqpo7
         os7aRXqCKtrDS2wiz/PXmbltW6orAz5ekvNSsZSLjHeuhxMKd96oS5eqHte4aoOEaV7J
         wmfkflxPjCTpr3EtDFF0l/2rI55QfIMu0+3v8KRfQZsrXcHmv2YIzGo7TXW8UHk42E1v
         40pkHVcQNDQdrmduprdmbSA3EFs3uk/N2KRHi4siRS3nXFTy+QhcrFQslkbZeBUxS/eR
         VgtFfm9WjHRl23WKFHK+AnHBc5kZhaZ2sw2Sd1WlKsfBMBL4r9ecsQJiRJhmcjiv5yPY
         nMtg==
X-Gm-Message-State: AOAM530Ptv7xXLyfwEvKX+rW4CNEgQdJLWNmYwSJz5+O5OaS5bHUcJJx
        RJIZS9uYiSs7qOTXyH87qHWPrw==
X-Google-Smtp-Source: ABdhPJwCNcxbMgelqPsgWm8NLd9TU9xw8/NWgJ2eG5AoiN83uWaWirK6U4CMqrjTGzjaanZoefwM7g==
X-Received: by 2002:a17:906:2bd9:: with SMTP id n25mr9298896ejg.359.1644226142042;
        Mon, 07 Feb 2022 01:29:02 -0800 (PST)
Received: from fedora.. (ip-088-153-139-166.um27.pools.vodafone-ip.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id g9sm3487059ejm.152.2022.02.07.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 01:29:01 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v4 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Mon,  7 Feb 2022 10:28:24 +0100
Message-Id: <20220207092827.104978-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207092827.104978-1-patrick.rudolph@9elements.com>
References: <20220207092827.104978-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
chips. The functionality will be provided by the exisintg pca954x driver.

While on it make the interrupts support conditionally as not all of the
existing chips have interrupts.

For chips that are powered off by default add an optional regulator
called vdd-supply.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 44 ++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9f1726d0356b..8d90127b06ce 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -4,21 +4,48 @@
 $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: NXP PCA954x I2C bus switch
+title: NXP PCA954x I2C and compatible bus switches
 
 maintainers:
   - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 
 description:
-  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
+  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
+  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
 
 allOf:
   - $ref: /schemas/i2c/i2c-mux.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max7367
+              - maxim,max7369
+              - nxp,pca9542
+              - nxp,pca9543
+              - nxp,pca9544
+              - nxp,pca9545
+    then:
+      properties:
+        interrupts:
+          maxitems: 1
+
+        "#interrupt-cells":
+          const: 2
+
+        interrupt-controller: true
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - maxim,max7356
+          - maxim,max7357
+          - maxim,max7358
+          - maxim,max7367
+          - maxim,max7368
+          - maxim,max7369
           - nxp,pca9540
           - nxp,pca9542
           - nxp,pca9543
@@ -38,14 +65,6 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    maxItems: 1
-
-  "#interrupt-cells":
-    const: 2
-
-  interrupt-controller: true
-
   reset-gpios:
     maxItems: 1
 
@@ -59,6 +78,9 @@ properties:
     description: if present, overrides i2c-mux-idle-disconnect
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
 
+  vdd-supply:
+    description: A voltage regulator supplying power to the chip.
+
 required:
   - compatible
   - reg
@@ -79,6 +101,8 @@ examples:
             #size-cells = <0>;
             reg = <0x74>;
 
+            vdd-supply = <&p3v3>;
+
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
-- 
2.34.1

