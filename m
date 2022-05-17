Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1FA7529EFC
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343936AbiEQKM6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343865AbiEQKMl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:12:41 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1211C11F;
        Tue, 17 May 2022 03:11:58 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id bo5so16461949pfb.4;
        Tue, 17 May 2022 03:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MM5thYIrVi5i+cbkS2jxRX5IeuN8MkqxSCa5bh/mFUY=;
        b=pFloAIsahv1LwGSPVFyN6dinFSmhbMza4Vj8W2MJNhWmxS2b9/L6hWtqpbRrWkaTVI
         /KJ7EX8tq2oiwEpZA1GT1FCRreo8J8rZ57OjbOk+r2oIV0tJozfD2UGqQ9MVFBbxMv4u
         pat9rZAwUgwEnR3M7OIzK2z1LI3trsh6u5wHkGtla9OnrTpzuHkAPQS/2ilDPm2+vcnt
         pkx+fL20/OuALewWgpgaB00fxyLRIWvAwtLpkMDMC3sE3OehpYT3IgTiS/GchsV0rg5S
         QsniY+nwgp56xJGCMdHNzAZiF/rlqsYysxJAt2D3FP98kCwzem8qI8XzLIk2+vDmcZPl
         B6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MM5thYIrVi5i+cbkS2jxRX5IeuN8MkqxSCa5bh/mFUY=;
        b=lFpRxsoKRjfska6D+jHLGvLjnULd0pOvp3x41C21P9/o+4DcBu6MTLncr9cCq1mm50
         hn5x9SQw//Ug5NTkbd+k3DiRdhkqEqGBgtbyQVFi1nCPZRmg0RzTbXFchQc7lX16TA5U
         sDoE6mLL+0FoAzBPaIg0ec/rsx5EdvWBqSJ5IngOf8RdoUDViZwUMbM/5ClE2KuAhKTV
         4z6beICtv1hxLnymJiJZPhubzi4KWvoQLa5BXkPlFuZPSt2Nsi1RuaHBOZlqa4qP/TiA
         jhBGwQ+QEdJ6B1/bNS+7sornspasIYn4IQu9YlkyI/znmTfApb7+Pkedr2Vd9Vw17SNk
         AG/w==
X-Gm-Message-State: AOAM531I25CVgPdCV9OVaQdb03TRkYliTQ5TFyNMnQ2KyO+Pm3dyGhU3
        hz5IGEJTTQkDb5tqaux3iw==
X-Google-Smtp-Source: ABdhPJzxvdrgUgkR++3q5wIQdY+NCisWO/v8qM2lIGnIGECEDfN/2e7awdGf+ibdbfFc5k3MyvQKrg==
X-Received: by 2002:a05:6a00:996:b0:505:b6d2:abc8 with SMTP id u22-20020a056a00099600b00505b6d2abc8mr21562749pfg.11.1652782317854;
        Tue, 17 May 2022 03:11:57 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id br22-20020a17090b0f1600b001df82551cf2sm1225548pjb.44.2022.05.17.03.11.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 03:11:57 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        rafal@milecki.pl, sven@svenpeter.dev, jsd@semihalf.com,
        jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/10] dt-bindings: i2c: npcm: support NPCM845
Date:   Tue, 17 May 2022 18:11:33 +0800
Message-Id: <20220517101142.28421-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tyrone Ting <kfting@nuvoton.com>

Add compatible and nuvoton,sys-mgr description for NPCM i2c module.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..09d2591e1fa3 100644
--- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
@@ -7,17 +7,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
 
 description: |
-  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
-  both master and slave mode. Each controller can switch between master and slave
-  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
-  RX.
+  I2C bus controllers of the NPCM series support both master and
+  slave mode. Each controller can switch between master and slave at run time
+  (i.e. IPMB mode). HW FIFO for TX and RX are supported.
 
 maintainers:
   - Tali Perry <tali.perry1@gmail.com>
 
 properties:
   compatible:
-    const: nuvoton,npcm750-i2c
+    enum:
+      - nuvoton,npcm750-i2c
+      - nuvoton,npcm845-i2c
 
   reg:
     maxItems: 1
@@ -36,6 +37,10 @@ properties:
     default: 100000
     enum: [100000, 400000, 1000000]
 
+  nuvoton,sys-mgr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of system manager register node.
+
 required:
   - compatible
   - reg
@@ -44,6 +49,15 @@ required:
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,npcm845-i2c
+
+    then:
+      required:
+        - nuvoton,sys-mgr
 
 unevaluatedProperties: false
 
@@ -57,6 +71,7 @@ examples:
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
         compatible = "nuvoton,npcm750-i2c";
+        nuvoton,sys-mgr = <&gcr>;
     };
 
 ...
-- 
2.17.1

