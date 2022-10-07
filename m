Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7BE5F74F0
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Oct 2022 09:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiJGHzV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Oct 2022 03:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiJGHzT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Oct 2022 03:55:19 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FD99F750
        for <linux-i2c@vger.kernel.org>; Fri,  7 Oct 2022 00:55:17 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id d26so2480540eje.10
        for <linux-i2c@vger.kernel.org>; Fri, 07 Oct 2022 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tipzJfhoPrPCegKX++Rgd/gqgDZoB8bwOjI9b3+6wlM=;
        b=EKaWKLNPo2nQO3u8MiVwHe5jcphecx07+dFdDbvuksLwA9koPd04uiqcwt9itNfA1C
         ni8+Z6jvMyWicfrkNHGGXNaay5A1rN71frAkx7aVSJp5ZeMUYbrv7V/mv/gpryACwiQl
         U+quLN9o347sazffUsDHkD8t6rriy0Ozi0fbmUqoZApmDuxyBHdF3HK5S35vCzWVninj
         6xuBH7uJZcbuIE1CkB2WCCcIRZtXP2EsiKFkOBC9/SF0m+HMiWXrows0pxm27Ly6OdZ/
         z3KzlQ2wAoKRi3/eplsX7o0iS+LtWhuV+eckGgDUnMwSS0/Cvrgm+R0ZaFp626RJaAlB
         m8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tipzJfhoPrPCegKX++Rgd/gqgDZoB8bwOjI9b3+6wlM=;
        b=TNlUyKwpjPA1dKdj5u2KpoC48GTI8AlyMwLgOLO+OKdS5Ih5XZcXaN2CLI/zJGLZew
         WgvUl0c8mGaUmZW/d2m0/PdS0uYei1rheUWP4cWZ6Eu0tCN5FUYmoEfOxtJFDgPMFAR2
         Y78CDg0HzrJMcxDeTR+JBfdg0kz19uc664C/q96U3h7bM9OrBCUyGs9zdo1l7w0UTGy/
         euMYXC6equWedVDGE9c73+9dubWdgi1/In223xn9cMLfzj5k34ESR3BP61x8iYs72qFW
         NuRGlF9j7BXfynt3y49P03XxtfQdSpOqAbNdMORKCAS7sHMtxnfAG+5WVsz+ziPG0QJS
         jTkQ==
X-Gm-Message-State: ACrzQf00nioTAlyK0c5pYCCGARzHq++ojwZEp3Bqkgi2fi8EN+SdswQ0
        ANK7Vdg1PDCg6CBkWlO7QDg/7jxcALlB8w==
X-Google-Smtp-Source: AMsMyM7revYPkS3AA8AdrLnBhuq07TxztXSu70zQWk/sqHIiSqMyEXRNFEKZyZg4jG894S4UHgPbYg==
X-Received: by 2002:a17:907:d07:b0:72e:ec79:ad0f with SMTP id gn7-20020a1709070d0700b0072eec79ad0fmr3229360ejc.296.1665129316138;
        Fri, 07 Oct 2022 00:55:16 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-094-114-232-236.um31.pools.vodafone-ip.de. [94.114.232.236])
        by smtp.gmail.com with ESMTPSA id hv13-20020a17090760cd00b00741a0c3f4cdsm782281ejc.189.2022.10.07.00.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 00:55:15 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     robh@kernel.org, wsa@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [v9 1/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Fri,  7 Oct 2022 09:53:50 +0200
Message-Id: <20221007075354.568752-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007075354.568752-1-patrick.rudolph@9elements.com>
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 39 ++++++++++++++++---
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9f1726d0356b..efad0a95806f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -4,21 +4,25 @@
 $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: NXP PCA954x I2C bus switch
+title: NXP PCA954x I2C and compatible bus switches
 
 maintainers:
   - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 
 description:
-  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
-
-allOf:
-  - $ref: /schemas/i2c/i2c-mux.yaml#
+  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
+  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
 
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
@@ -59,10 +63,33 @@ properties:
     description: if present, overrides i2c-mux-idle-disconnect
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
 
+  vdd-supply:
+    description: A voltage regulator supplying power to the chip.
+
 required:
   - compatible
   - reg
 
+allOf:
+  - $ref: /schemas/i2c/i2c-mux.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - maxim,max7367
+                - maxim,max7369
+                - nxp,pca9542
+                - nxp,pca9543
+                - nxp,pca9544
+                - nxp,pca9545
+    then:
+      properties:
+        interrupts: false
+        "#interrupt-cells": false
+        interrupt-controller: false
+
 unevaluatedProperties: false
 
 examples:
@@ -79,6 +106,8 @@ examples:
             #size-cells = <0>;
             reg = <0x74>;
 
+            vdd-supply = <&p3v3>;
+
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
-- 
2.37.3

