Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE2F6E2198
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 13:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjDNLCz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 07:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbjDNLCn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 07:02:43 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF45AAD10
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 04:02:14 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id i3so7765683wrc.4
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681470121; x=1684062121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drtUIssb1CGOLLzb1iNu2NktxzzQjkjET6wfRo3ULQ0=;
        b=ZVf0C5RZUcc3dfGIT00g2MVd62RUeTFDg/qOSctGwyBpEoyY6SqieG1aBXhfGMZXhW
         6HVOwaDcCnEG7EinJTjOaZbld3lJpZ0N5JSCLNFtU6/EJQHPbT+MoSmLpunAaigpGSia
         G1RAVKgZl/WdlM6AUogIvy1zXPJNa1YwW7hekwKn9xX/ve1UM6IoO2zPQ1ADcRxC0+Cy
         I2dw6NhzZlGyYNh7wBX9d0AmHAcIuK9qBoO1OW9qoM+5JsUce2vxC+k4sUOayjCttkHL
         JuSGiMK5a84Oajov0UY70BxEN/V6DM1gMdQeUYko99wVLUxfpS6fjXmjUNSbmfMhN+a0
         ZznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681470121; x=1684062121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drtUIssb1CGOLLzb1iNu2NktxzzQjkjET6wfRo3ULQ0=;
        b=XztXokgxK4M84P0claeSMWgX3f5kn3qzYIGJ7sMYeQbmpOgY8V3LYDZME08GkIVIrJ
         XEREYfqCKoiueOf8oFCW02w4vnIV5+CB+ZLgoIarwVa1JvFsAnLvmHLO71yKbsAos1PX
         Fy23eThCciZ/dkTPrmvy4/kfRc5/s+MzxcKA0Cl4T31IOlWsTnw9rP9Ayfx/ZU4daZKS
         qQ7WhMHkP3SAbL3Fv4pGgKc7TVhs1LhwzU1yCoU00y/q1Qc+vJCa0nDFHTQ4x8P/Vsjd
         Auin7Y598y435szv9J0hQHbK6AhCPefe1BpNh5ICxRmNk8VfGXQ/xKkNWSXIGXjt4THu
         XhRQ==
X-Gm-Message-State: AAQBX9dhGw3D9/8UXlSzp1i79iXougQmTNtgH6ACTIVDqzSXI8rfNVVm
        XDuVNhZCiD22MRav6kJWV+KCWA==
X-Google-Smtp-Source: AKy350YxhAwczRVNf8zLXq31EgnzAk4snTfSVhuNe5B/eRD4EbWUH0SA6y3VfSnxWp8t3yxmRUF+mw==
X-Received: by 2002:a05:6000:118c:b0:2f5:c399:b299 with SMTP id g12-20020a056000118c00b002f5c399b299mr4183889wrx.46.1681470120828;
        Fri, 14 Apr 2023 04:02:00 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id u6-20020a5d6ac6000000b002f2789d1bcfsm3328830wrw.21.2023.04.14.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:02:00 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Fri, 14 Apr 2023 13:01:34 +0200
Message-Id: <20230414110137.401356-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414110137.401356-1-patrick.rudolph@9elements.com>
References: <20230414110137.401356-1-patrick.rudolph@9elements.com>
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
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 45 ++++++++++++++++---
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9f1726d0356b..6fed6eae9c9b 100644
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
@@ -59,10 +67,33 @@ properties:
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
@@ -74,11 +105,13 @@ examples:
         #size-cells = <0>;
 
         i2c-mux@74 {
-            compatible = "nxp,pca9548";
+            compatible = "nxp,pca9545";
             #address-cells = <1>;
             #size-cells = <0>;
             reg = <0x74>;
 
+            vdd-supply = <&p3v3>;
+
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
-- 
2.39.2

