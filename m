Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A06B6E45A5
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Apr 2023 12:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjDQKue (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 06:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjDQKud (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 06:50:33 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994D81FC3
        for <linux-i2c@vger.kernel.org>; Mon, 17 Apr 2023 03:49:45 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id kt6so24729427ejb.0
        for <linux-i2c@vger.kernel.org>; Mon, 17 Apr 2023 03:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681728497; x=1684320497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9iHIbSak9nSUV5ZOt5jZPoisxCx1VMSh5mAnS7nnfM=;
        b=OlcvyTsuhh2rBj7Us6n6yqnEc9GRxW3SjMm9TEKCgR4tdv8gOO9G0B5M7f/eUtfEaT
         VuCD3g/SzLHwaGSCutn6aaVEba3wSPbHG2HeBh/sy1zAWugjiS/V2ElHRJGDV7T3+Rtb
         DqA4amyoocTCZUV/D9xrTRL93IXSSEtqsYmLB585dpCUcTq50AvC1K46zwxN/MOh673c
         Hj0/QkIMJ5CcGW1e4e9Yom7EFeIxYRJmWsFIsl3PZ9CXMAF5pBOdwR624S6vy3p7HKcA
         630mEGEAqS+WVg1M1ddQzyDuJCmUNJiZ7j8az19DJNoUdma9SXuMLpJGbmPvQC6BNuYA
         Z8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681728497; x=1684320497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9iHIbSak9nSUV5ZOt5jZPoisxCx1VMSh5mAnS7nnfM=;
        b=KVvQ3j8Yi43zb5gIsg7f0fs8dbOh0RF4KAbe6xnHlpWCeS8GC0cNJu4+PK2Kw65Xg6
         n2YSDKwuV9JdBbLtx1FlUN07NZXe+JNnZM5Tr/zJlXeKSqBHrZoCnNQTus327SdXbltU
         FJ76iwR7/qinmYXtpPClB3X3TED5poubgAZcFz1p8RRk28FfT+i9cbKW57G2RlTRFHJ1
         xK8AoXo0TRfWrTZOnzNGGVuSUE0O2E3PFq76aN97gxH1GyQvLTGziOB0ZvXTw4yJkJiI
         R+T6lR9m7A1G7465ynVoKkXXx3MX1npATLp7+rpjJ656H+nnqnxUe1yRh0uXV15oanUp
         JY9Q==
X-Gm-Message-State: AAQBX9fSz79QLe1dWllJ2mWN+Px9pDoOzMhQDyz4JfYD+Sv7R3ZPUKZB
        8cAL859rvObc4yHR8N5wYTgf6g==
X-Google-Smtp-Source: AKy350YR0VBYn5fdrMYuoVzSWv9e2HXJbGfK3uJjGluMIvIe8PzWyuSA1ExgonebbI+IbWlEiti31g==
X-Received: by 2002:a17:907:a4a:b0:94f:2916:7d6 with SMTP id be10-20020a1709070a4a00b0094f291607d6mr6304638ejc.19.1681728497400;
        Mon, 17 Apr 2023 03:48:17 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id j25-20020a1709062a1900b0094f614e43d0sm1953842eje.8.2023.04.17.03.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:48:17 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v12 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Mon, 17 Apr 2023 12:47:58 +0200
Message-Id: <20230417104801.808972-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417104801.808972-1-patrick.rudolph@9elements.com>
References: <20230417104801.808972-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
chips. The functionality will be provided by the existing pca954x driver.

For chips that are powered off by default add a regulator called vdd-supply.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 93ffa67d0d9c..6fed6eae9c9b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -4,21 +4,29 @@
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
+  The NXP PCA954x and compatible devices are I2C bus
+  multiplexer/switches that share the same functionality
+  and register layout.
+  The devices usually have 4 or 8 child buses, which are
+  attached to the parent bus by using the SMBus "Send Byte"
+  command.
 
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
@@ -59,6 +67,9 @@ properties:
     description: if present, overrides i2c-mux-idle-disconnect
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
 
+  vdd-supply:
+    description: A voltage regulator supplying power to the chip.
+
 required:
   - compatible
   - reg
@@ -71,6 +82,8 @@ allOf:
           compatible:
             contains:
               enum:
+                - maxim,max7367
+                - maxim,max7369
                 - nxp,pca9542
                 - nxp,pca9543
                 - nxp,pca9544
@@ -97,6 +110,8 @@ examples:
             #size-cells = <0>;
             reg = <0x74>;
 
+            vdd-supply = <&p3v3>;
+
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
-- 
2.39.2

