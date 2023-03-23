Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA706C6102
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 08:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjCWHpA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 03:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjCWHo7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 03:44:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725D619C4E
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 00:44:57 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id y4so82802576edo.2
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1679557496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YULbMSYLxPrjOJbjLIiUT+ql5Bs2phIk+fP1mRdCa8=;
        b=IgY45ZgJbzhRcouu9Xzgcyuo8jp/lH1gx8jc3DHY2SBGfcc+xg2actR2vmkO8ILUQh
         HGJpn5gEZF+FXbiyCjQFxxMKBr15iT4z4Vx0EVSGGK0tGpEwzQIQ6C8SksNnq6qoI++5
         VKSYCGc9197ahFeyT8hnMyokQRAN0txSMNk80Uc70H+tzu5U9S83bkd+TZUcJm2xtX72
         zRq4EeV4QlMspo1LO75eLHzqlaXNlCtYBNhb1sxDxy98866LWvVPpFX4ndm5JDg5TZCw
         z1n2kkC2tDxHnjaCX1nhIkVOBMRfhh7rcSC2PV3tZE9/7yfh49v2oFwlbxbAOA9n1Lig
         PtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679557496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YULbMSYLxPrjOJbjLIiUT+ql5Bs2phIk+fP1mRdCa8=;
        b=w9eXYStc9yWB7BXMW7tr764J7T7Dyk0vDd4Nf2+PaY1wsmm3uuSHiQMZpO0VgzDCU7
         el+sHfz+MGArX/ge8gHfC+aw0jbY/RiRBGJ05vxgwDe02rD2HhLBkmNzI81XRwsc3+Vf
         5RYr8QMfNX2nbE/Xh/JwscORkhqT25sf6HhHD+lsJ3EEp7WeW7pTxPjomZesiD6AShB4
         pflXtpBCpdLydpAql9i+3sU6he23TpexWR8EsdF+IWMMKiYpdmR+6j/2Zx1id3VmWXhO
         4KTHV+MF+E8FfoqglFSufR2ytZ6fRIv0TjlRZ/KFaMtVMb4t+XiBzSMV+kxt17RBhDK5
         ujBw==
X-Gm-Message-State: AO0yUKVNsmRG8gnpwJloBX1o8olnyM2Sl7kaPZ5+zAr4lZpDetQgd6Np
        ZW5Wz+g+/rD3XlbII5/a6HeRmA==
X-Google-Smtp-Source: AK7set9Wow17nfNuYU7h+Mq5SWmj3ivpf4SuoLXpHKf+9t+uAqf+J3/NYIds/og+xyi0pqwqDxwsFQ==
X-Received: by 2002:a17:906:dc4c:b0:92b:4f8e:dde1 with SMTP id yz12-20020a170906dc4c00b0092b4f8edde1mr8731016ejb.20.1679557495789;
        Thu, 23 Mar 2023 00:44:55 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709061c8100b0092669fb4ba1sm8255405ejh.130.2023.03.23.00.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 00:44:55 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Thu, 23 Mar 2023 08:44:16 +0100
Message-Id: <20230323074419.2494609-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230323074419.2494609-1-patrick.rudolph@9elements.com>
References: <20230323074419.2494609-1-patrick.rudolph@9elements.com>
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

