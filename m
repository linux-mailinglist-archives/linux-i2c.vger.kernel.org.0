Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53F46506CA0
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Apr 2022 14:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243398AbiDSMnr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Apr 2022 08:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243423AbiDSMnq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Apr 2022 08:43:46 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A42935DF6
        for <linux-i2c@vger.kernel.org>; Tue, 19 Apr 2022 05:41:00 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id b24so21052352edu.10
        for <linux-i2c@vger.kernel.org>; Tue, 19 Apr 2022 05:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dFjjMvsqq7b2yA8bGP5tTnOGcb+Gng0k+gEX/WjWfCQ=;
        b=WeyHKNjyfPNi01d1dQprscoxppa9eOZMVUal5I84WVPQGqyjugb3G2lj1+jV5RXat5
         MXPERM7P+t6DRDWjcvHBtYJiCPajQDqbMjG7xfWn1F3YXkaaUfa6lw/TM2h/E40bSwtD
         q2YQE5czRNJKCUly2nFV+5VBqPbMKWc7/V+TzzAzjlsGHo1RPXXPnb0XBOgmmYwJ0eEI
         NyU4MCkagHJTltvjRenUgU4o0rE+46fisEXAOLF8qaprOESeUdHg5yMioplBgRW5bTba
         IVLdsK45NYUEz6U+DNYByeq74Jedcal3GCc2KdFzvdI2kr2AdVtzgAbOap8ixt/DQSd9
         5SLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dFjjMvsqq7b2yA8bGP5tTnOGcb+Gng0k+gEX/WjWfCQ=;
        b=fnGUz46JkTRykf1CtjcMeZLrB8QcWZkneWwjaN+qlZqSSeGZdD75ISM8H63jTwM/WO
         ZkGMysd/GX09z8F6MoLpMbs2K8z+mHWROA1UUmF7Ak8J6J2fSKZiAUOpEAYxmlzYF1HJ
         cMIjoLsT8WgHaQi+Scryj15tOjwkFOkdBwK86k1wBqrtDnDmFsbJrB8E4hhjC1QI8y5z
         rmYHsf/fxndVu+snmft5TQj3Ln47Di2mJDAsD+xQSbiVsRWSMLJUuXWvQ2hp2k0AeYPm
         +nBCSlX3i1nRW0wcLKD6Nab6+iDmnxp4Pij7hTkPlb6p3cmq46akrrfRlTuOzIR+1MH8
         U50Q==
X-Gm-Message-State: AOAM531V82LC+ydUsDrEkNHZ0RUiiULXbhaHZFeUOsdLawncvex3tw6k
        Gn9sTRXV5KaZnc0QUAcjpRifTg==
X-Google-Smtp-Source: ABdhPJx659JfC09WdVbA8JxLM2QNhguItcwDj4boycocwoWIY1ZBbpSoij6kP6Oug7yLrDdbPjGVhw==
X-Received: by 2002:a05:6402:d0e:b0:413:3d99:f2d6 with SMTP id eb14-20020a0564020d0e00b004133d99f2d6mr17442373edb.189.1650372058590;
        Tue, 19 Apr 2022 05:40:58 -0700 (PDT)
Received: from fedora.lab.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n27-20020a1709062bdb00b006da975173bfsm5709274ejg.170.2022.04.19.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 05:40:57 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v8 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Tue, 19 Apr 2022 14:40:22 +0200
Message-Id: <20220419124025.1733230-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419124025.1733230-1-patrick.rudolph@9elements.com>
References: <20220419124025.1733230-1-patrick.rudolph@9elements.com>
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
index 9f1726d0356b..21ab286c74f2 100644
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
+      then:
+        properties:
+          interrupts: false
+          "#interrupt-cells": false
+          interrupt-controller: false
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
2.35.1

