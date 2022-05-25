Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4787F5335B3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 05:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238013AbiEYDYV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 23:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbiEYDYT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 23:24:19 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD019644C4;
        Tue, 24 May 2022 20:24:18 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id pq9-20020a17090b3d8900b001df622bf81dso3878072pjb.3;
        Tue, 24 May 2022 20:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MM5thYIrVi5i+cbkS2jxRX5IeuN8MkqxSCa5bh/mFUY=;
        b=Hm5LlEOqZKRdMEJ7rR3UUsd0kmUPrw/9YZ1mxm2xfajaeZt9jGE8zamIJlJdCAPkt3
         VfMesPwd2acs2hYX1HTcVCeOD9Dii0Krkg+zZ44JxkTanTuzVi6In3rKxfqlDcsp+Z/2
         c5huv57tYpvfCtJandPFSMQg4bxP+WVoh+T4sa8T4zz+TXsLqPMCBFbmgV8KFSfebYDv
         7Lf8Y9x41x/0e5pIe+YaBr2PZCs+3A0rFVwPrztTRdjUaBErkl6xbzbjE2Vvgg7wQUeZ
         q1FgA+B0TTjlp7N/DiB1ojDVJ7J5gC4/P5vQenBgbTn+SiTEgJvOPFnZGqtRN9elaq+6
         nDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MM5thYIrVi5i+cbkS2jxRX5IeuN8MkqxSCa5bh/mFUY=;
        b=RjC/FcCd2HoA9SphMQMXrxaRAkAlU30Wg0L1jlsiP5S5r81z7O8EFcckj6fDLQEcCd
         W3brubxiHTRs3hcM7Bmu78ZQaKN4/MkI/AM/MG2rSxOgOHONnFb7UPhAcQXGZQRnH0kL
         GRpnFfjhuFRlb4Zdn1ZQtZ4C/vIubmKLI1YD3MfsaLVCfoKrpP6aJ3TVKeMHy4vYXoXS
         tK5c7rsfltzeI0fzIOqekNY0rdaSS59tjhITOaPaU/FEbUwT8+yfMBhaZrN36bmodcxm
         FHrxSrLwqMNzqeme6LcfSEtRQRlohSzwgIVbm9RB0WVDghRVfL8kFzVoDl/TTzTKKg7c
         YN7A==
X-Gm-Message-State: AOAM531RNpF85NWCZ8b4FkkxL3ElGUI1HODGUUbs3yk3kdXc1YG0EAP8
        BjZRLdAGWKIyfsFIbkGT+Q==
X-Google-Smtp-Source: ABdhPJzJfJSQYDPh4Yk/ZMRkRZvA2bfaM9uQZ22E296JR5L5v5r+FkeTB87jGcpTcqLEzIUMainZ/A==
X-Received: by 2002:a17:90a:4803:b0:1dc:b4c9:1958 with SMTP id a3-20020a17090a480300b001dcb4c91958mr7872647pjh.61.1653449058229;
        Tue, 24 May 2022 20:24:18 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090a178e00b001df3a251cc2sm322188pja.4.2022.05.24.20.24.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 20:24:17 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        jie.deng@intel.com, jsd@semihalf.com, sven@svenpeter.dev,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] dt-bindings: i2c: npcm: support NPCM845
Date:   Wed, 25 May 2022 11:23:37 +0800
Message-Id: <20220525032341.3182-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525032341.3182-1-warp5tw@gmail.com>
References: <20220525032341.3182-1-warp5tw@gmail.com>
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

