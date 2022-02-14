Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08A34B4D61
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 12:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349861AbiBNLEo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 06:04:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349896AbiBNLEQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 06:04:16 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C099BF42
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 02:32:24 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id p9so13525260ejd.6
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 02:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bo43NL5WgxumOcYzft9YAYcZtXZd3PhX1zRfnI8bjDk=;
        b=PwKUejzP04bJB9L/Xde/ppijUOqMNVBq9vZlUz8ZRPTY1pYD15Qe45sYIb0L4FtYjb
         IyHnd2MnK/h2O2Tgfk/gptsiXpiVPFmpyOiMIYZ3h3GbbMT/zThfR804PQhY1IP7zIdJ
         aMQnJLR8dJcolWGL9V1jh44yloHcNd2XxkIMe4SSC2qDHeTUVItjzrlvlA7Au4Vgr7cU
         Zato8b5lzV8arQ0jk1QCL32j3v8TLC6ia37OUo60O5jGLZj5GiSQCyrH4oAjLMK42LG+
         n4E4U7nK62f6MkYa12GS9HsWkddfGsrl5IgLk6bOn73UlNxOHunebmRMBirlqw7M/v83
         2AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bo43NL5WgxumOcYzft9YAYcZtXZd3PhX1zRfnI8bjDk=;
        b=K3vacvBn+Y99GetUnpnTPTEK7b3oAyk/e7JuU4zgmmYl9BU8RtIVRglBZv+p7GSvUs
         zlhDmg+az2eobIwgvqMh9tYxzD7Wi7mR9NyK+NWvSPgtgU2spUrcmcmNbuFVlhTCwuyy
         KalYbmRv9WhUO6nbuSY1LTb0laoE4yBzuX2Sb+b8y09spSpEzprAFjhdXL9CVCnEqi99
         SHSV9XNcSstu7GSDTeX9rJrA2YiBtTceGHXQByXdKh5oSgpMYvaUjpFhNaGUJNBLK0ss
         3wLEH7hfA8b1OCZNeIqKH4nPjMES3Ck2Bk07dh3cmhTkPuWXViOFjfLUvp2T0zjc3AKp
         TjDQ==
X-Gm-Message-State: AOAM533r5m/YWFzVLg2mM3FepVhQQlDYp9l14m9bouFkUo+BkwI82SjJ
        aSL33KkitCCiLPXRrGc/TRwxSg==
X-Google-Smtp-Source: ABdhPJzudq88kL+Iol19BJzjrgl1fm4cOkIenjo5ffzfo2Cq+RmmG6+GIBXvUdT1/FwGqrO8PNu6hA==
X-Received: by 2002:a17:907:a42a:: with SMTP id sg42mr11159538ejc.723.1644834742774;
        Mon, 14 Feb 2022 02:32:22 -0800 (PST)
Received: from fedora.lab.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id b19sm1857940ede.37.2022.02.14.02.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 02:32:22 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v5 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Mon, 14 Feb 2022 11:31:14 +0100
Message-Id: <20220214103116.68472-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214103116.68472-1-patrick.rudolph@9elements.com>
References: <20220214103116.68472-1-patrick.rudolph@9elements.com>
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

