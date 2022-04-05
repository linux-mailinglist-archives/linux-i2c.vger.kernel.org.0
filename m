Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117224F409A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 23:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbiDEOIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 10:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345594AbiDENFW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 09:05:22 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB4770F42
        for <linux-i2c@vger.kernel.org>; Tue,  5 Apr 2022 05:06:31 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d3so8154617wrb.7
        for <linux-i2c@vger.kernel.org>; Tue, 05 Apr 2022 05:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uuy/oSrqPfKVMfFVdZlb83GjMVmrKFP4k9YDPQWDMGE=;
        b=KlmKzPs++IYx5FTaDoGXSl1qs3hrr/00SCAaOP/FJu6mlkJaYvksrnCElB52Rloy6n
         zREeVaGKzvRBPgtlUd6+6t9vJiwIVUBwSHaijo2i/0mm9Kn6LVOzPLEp64RbyKaa6dHv
         dJWrvIzHcTjjEhwKj4PZVMGErl5caRKftsBQSj70/3Ifv+4PnjAahlkS/qhZU/yrbZam
         ItR7BKa65xH+yrgWSkbAeLHFYa8vuXGmESX66vo+7pp8uJc5Cte8U/KR+i7AFa9GvbxZ
         PXtl0McwO9Yy7MzaaDa7yinO2NxTk8JMRK4IrwcBV/U1Dtatzjly1HqyhddOV/XoGCt5
         YnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uuy/oSrqPfKVMfFVdZlb83GjMVmrKFP4k9YDPQWDMGE=;
        b=qUgZJk18RJvbgPBjADzUDtWNvAucYqrhRsUIXhCfY5poiORvm808fk9HysRIDxOJtI
         CXHif7KZLfG/HhQJjMv3n7vSD4rES/PPZ0DWwafIY+e0BWH5ztN9F4NKK33wOWOmhfjt
         Y9LBqbUtgRA1H36hiWLz68XvFhpP1mR90n41NWp9Wu65Md4yYtgf5jwxfYHMOY8bmV1R
         G9/UR45KFAMw2801YiVIp7lQenkD8IUGUFhTdFIAkTOn83RLOA/bVpvEA1YJ3L3sMDJ9
         SlUqNei74bSLutKKoBcxOtGY4+w+X3I2lugIsfzHSTBk5KCSk7D2N0tOBDB0CWYc124/
         XHTA==
X-Gm-Message-State: AOAM532Z2bWqef1yi7NuDq3EcC6NrH1P/dfxI/DThTcGrNYu2NMLsHC8
        886lzcD75c4RiswEnv3xBXbwmw==
X-Google-Smtp-Source: ABdhPJz97+aMaGG8He5+J24ubzUoWrE9dXq/VRTjoheWERDGZngEHr4Gy/Taci3KYvzSADEOUfE0YQ==
X-Received: by 2002:adf:dc41:0:b0:205:8df5:464c with SMTP id m1-20020adfdc41000000b002058df5464cmr2401463wrj.445.1649160390155;
        Tue, 05 Apr 2022 05:06:30 -0700 (PDT)
Received: from fedora.lab.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id r16-20020a7bc090000000b0038e73023334sm1994323wmh.2.2022.04.05.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 05:06:28 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v7 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Tue,  5 Apr 2022 14:05:49 +0200
Message-Id: <20220405120552.433415-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405120552.433415-1-patrick.rudolph@9elements.com>
References: <20220405120552.433415-1-patrick.rudolph@9elements.com>
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
index 9f1726d0356b..132c3e54e7ab 100644
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
+          maxItems: 1
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
2.35.1

