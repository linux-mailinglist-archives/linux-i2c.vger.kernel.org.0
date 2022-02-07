Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7E4AB549
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 07:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234575AbiBGG4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 01:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241645AbiBGGdw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 01:33:52 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5C2C043185;
        Sun,  6 Feb 2022 22:33:49 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso2168771pjg.0;
        Sun, 06 Feb 2022 22:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QBjevVYgAFUaqu2ou5cnYl7E+U1e8F1wDuqgm7AMw48=;
        b=LBn9w0cSUzERiY6ujaumE79mxBrkeyAje0CePw/59SYwNqP8/Vzp4jaG1rQQcB1lSO
         b7e2Q2tysdOwBH3ZrXcnYHcpmKVORWxuFw/UQx6zUesXziUED8UOeKgAIcuk5UEW6xE0
         L5EO/CU6H2aIvqh53wVzDen6K5qrcK33Hs5BB7wCqT0vSbWYIlTl2gtOPC2YFZtY8Mec
         mSFErbcz+h2sIwLr50YE2rMZJ9SefQvEsCK03T42+m5xbnfJ1gOIGQU/q4E3+cuovEP3
         RCvquvxvLIgLFqeWZImqOQ6qXCETok7U9akCecv0i1cQUjuM7p7oyCcJDHyMlmS2o1hy
         qgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QBjevVYgAFUaqu2ou5cnYl7E+U1e8F1wDuqgm7AMw48=;
        b=O68W3NwPOM6JcaB97VS+gJtr3UYcQdxW4BjeGdff4hb0fEKXuapfEn7U6+EMThNw7v
         vybe0f/FtTFM8Fgu++xwxeTHYZSvibwYT1q4/IPm5FwZ9qQum0HnNgTvZ3jo8FrTFSTH
         D3ERCtB9vCq+ZKl5jFXKioci10Icmq7ZT5x2pbmOe+mIzdzOYilN1NFN0XQNAyZCUD2a
         cam3JsNowgSeKcQqz4D65TT5CmjGHEONorK2Kxx3LEYgxfBuX6MpbgzyuJ83mWJIVGMs
         UkfBL56JPcblKNoh2x5fKdjVqTsOhBU8xoAAtYqpV7EQ+8VB1T/LEFyF/mqWbBrdQvIG
         DR7A==
X-Gm-Message-State: AOAM533GRbofSlgckTI0fTLHMZkWdMS4YqtPSgAhyARQT3CVGNlxWt+g
        EKhs/FEB5R4xq7DXG+C0rw==
X-Google-Smtp-Source: ABdhPJwHh6DxuukPHPzXF5UTpQFRyEmYEcTqkhT3otIl+T/man141s1iK/4Ndqw6yd0EMoacpqdoVg==
X-Received: by 2002:a17:902:e54c:: with SMTP id n12mr14424plf.60.1644215629404;
        Sun, 06 Feb 2022 22:33:49 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
        by smtp.gmail.com with ESMTPSA id g8sm10666389pfc.193.2022.02.06.22.33.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Feb 2022 22:33:49 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Date:   Mon,  7 Feb 2022 14:33:33 +0800
Message-Id: <20220207063338.6570-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207063338.6570-1-warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
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

This commit adds compatible and syscon description for NPCM845 i2c module.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..05e58f44b03a 100644
--- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
@@ -7,17 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
 
 description: |
-  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
-  both master and slave mode. Each controller can switch between master and slave
-  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
-  RX.
+  The NPCM7XX includes sixteen I2C bus controllers and the NPCM8XX includes
+  twenty-seven I2C bus controllers. NPCM8XX controllers 24-26 are connected on I2C
+  pins in parallel to controllers 8-10.
+  All controllers support both master and slave mode.
+  Each controller can switch between master and slave at run time (i.e. IPMB mode).
+  NPCM7XX I2C controller has two 16 byte HW FIFO for TX and RX and NPCM8XX I2C
+  controller has two 32 byte HW FIFO for TX and RX.
 
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
@@ -36,11 +41,16 @@ properties:
     default: 100000
     enum: [100000, 400000, 1000000]
 
+  syscon:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of system manager register node.
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
+  - syscon
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
@@ -57,6 +67,7 @@ examples:
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
         compatible = "nuvoton,npcm750-i2c";
+        syscon = <&gcr>;
     };
 
 ...
-- 
2.17.1

