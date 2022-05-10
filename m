Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9661521087
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 11:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238571AbiEJJVk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 05:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238609AbiEJJVj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 05:21:39 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4082415F1;
        Tue, 10 May 2022 02:17:40 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so1634957pjm.1;
        Tue, 10 May 2022 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=shmi7ND9fR66WvWBxG9J4t0FsEK855sUikZM1vvu/TI=;
        b=WK+1dCxQ6uDMCB8QzgTr4qQijeHD39WkX9/fvL6LzB2jp3LG4rH6ynCbYQ2j7yfTb+
         Q9eL9FP2/bPEB6Pzq/QTEzzeIMJ69xpg/n4v4DWI2cQQxjFldH6Zb6hTueRKd2WDP5i4
         wGKPklCrwXo67U8JdFbSceIPLVCltP/lEPBzLuyax6Yvwih40fqUR6KYf6WaDZB6r/4q
         YjCyhGXBaYOWo6tNTdxD4xLrsJnLMWdruxct+9vspN5fl8+SNFUWjuE889IpmT5LwdxV
         MmG5boc9Am/GdfyU8AriItMOpAhqvvpPjgWWhkpqOHPi4KXoue+MOZ6LyoWyHm5ZK63A
         9eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=shmi7ND9fR66WvWBxG9J4t0FsEK855sUikZM1vvu/TI=;
        b=cwq8+wBpDMcg47BoKTt7hqORT11uKcY1y5hV8h5LpyfLAgpMxxKIQMKQh5fLoNsphW
         0YPBj0eRdFTdz0KV7gx4FZAzLxYtRa6xNjL+IW2EklibfvMzt0CKdWfYDc2wjA8fVHrZ
         nxpjls6p9nSdif2VJ/E7j8pgeCFL3oU/zyqaNw3nObzdfFgh7eZsrM4RGfNfQg9f/3pi
         uSBtri2HdJ7LaLG0X8XL0AOVi51aIEq0hsIazXmF79jsXoOODHvMXiPa74nqYwp+0l2O
         AHCKTzjE8AvPY21Gw9bi7U8NRmNuxxGhztmVFCVhOSQJhsro18BorPA/ijFrOvkc2ehe
         meUQ==
X-Gm-Message-State: AOAM533kVO7ZWCice7quKItsL7p/FGY+YrVXQl8zk836IBpca5XA/IwU
        r6LEib+CjQJHYFnFhEFa8A==
X-Google-Smtp-Source: ABdhPJzr0tXNMS0wKDerD01zsfSs4v7SZyhKYvmEIBtwzDgIEcsrGnZUYSdfPsgWx9hD1aeHlTF4bA==
X-Received: by 2002:a17:902:ce8d:b0:15e:a95d:b4b0 with SMTP id f13-20020a170902ce8d00b0015ea95db4b0mr20350284plg.153.1652174260237;
        Tue, 10 May 2022 02:17:40 -0700 (PDT)
Received: from localhost (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net. [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902d2cf00b0015ee60ef65bsm1474149plc.260.2022.05.10.02.17.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:17:39 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        sven@svenpeter.dev, jie.deng@intel.com, jsd@semihalf.com,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
Date:   Tue, 10 May 2022 17:16:46 +0800
Message-Id: <20220510091654.8498-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tyrone Ting <kfting@nuvoton.com>

Add compatible and nuvoton,sys-mgr description for NPCM i2c module.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..99fae8489771 100644
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
+    $ref: "/schemas/types.yaml#/definitions/phandle"
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

