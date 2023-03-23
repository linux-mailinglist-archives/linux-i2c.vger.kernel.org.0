Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5686C672E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 12:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjCWLyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 07:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbjCWLyJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 07:54:09 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830CC36452
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 04:54:01 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id i5so38340418eda.0
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1679572439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YULbMSYLxPrjOJbjLIiUT+ql5Bs2phIk+fP1mRdCa8=;
        b=TcFd8Nn6UiFY2VCXT9hRi1VRvlS9rzcPIZ9VSygplc26HIB8Q845qFGBv9S/Sbv5uI
         U3IPgSdjxWT5/SEaaLciLC085M551nRTV8lkIcC653aPiG9Tetrdw5Q0jgOvdErIYnBd
         PQz1tPKFDhXEmNDDFKoHpUGQRdeC+QHJ6Jqgs5D/8VzzOkaXgVQr6xX/8+5exxmVwg3f
         GSviUDHe1sF3lIX2Bz6l4cGnobXxP8FGqB1zxDnfd8PicwlYelVbYYdtAe7N5dm9L7zw
         bNWeQWcBzxPNPahryTzLKafTPiUlNEIxXO9wA6Cv7z+9rInKmbxTPsMy88o5w07TLmev
         vBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679572439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YULbMSYLxPrjOJbjLIiUT+ql5Bs2phIk+fP1mRdCa8=;
        b=fDHxEmcBcLG9alkAHKJfDDwR8b02tkt/IyID2zqc0G5PGZuwv/uIY0mgeXIlaFlo8u
         Rk7b9DLEGefcT3JQx0wf2+2MJ215hjrA3MNvF4jxIEKAXLyjZbQK6UKviuNSEUAnZfw+
         wshnxrxc4wUyvBCLDLf4w9OcWgZYfwvYfkJQ+vDaUVKSW3jsNWFN4/4o6J2xAmY5/o6s
         9FzeuvAC22HP4+EYgkbRZi+PliQJcLTHvaz881VCR7hCp19qYLpHJEaWgOBw5dbf6oiX
         9D7462D2cSLnb08t0e0mXUnFwTpVsOFy7XuQGKebx5H2hJu95QkkKhxyxNvWYTYQYAH8
         USLA==
X-Gm-Message-State: AO0yUKVYQ+fxI8GxvRH664Iy/YWUjZpImwb2GzYHcGbR0mosvMF9HVW8
        3PwqtaYcaW6FF8ZiOyTcySTLxxT8gaVqeZST08M=
X-Google-Smtp-Source: AK7set+KfW62sGRq9jKKBIhbGi/lkFTcIO7ljUkykhExWTWlCT0N//uDSZm0V7NN7RVIW8DXstqQ3Q==
X-Received: by 2002:a05:6402:64e:b0:4af:63a7:7474 with SMTP id u14-20020a056402064e00b004af63a77474mr8943128edx.17.1679572439591;
        Thu, 23 Mar 2023 04:53:59 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709064d0500b00923f05b2931sm8510047eju.118.2023.03.23.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 04:53:59 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Thu, 23 Mar 2023 12:53:53 +0100
Message-Id: <20230323115356.2602042-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
References: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 43 ++++++++++++++++---
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9f1726d0356b..696fdb647f89 100644
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
@@ -79,6 +110,8 @@ examples:
             #size-cells = <0>;
             reg = <0x74>;
 
+            vdd-supply = <&p3v3>;
+
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
-- 
2.39.1

