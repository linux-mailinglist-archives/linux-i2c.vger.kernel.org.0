Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FC94CB8E9
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiCCIcj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiCCIch (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:32:37 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B301517226C;
        Thu,  3 Mar 2022 00:31:52 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id z4so3888545pgh.12;
        Thu, 03 Mar 2022 00:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fQpyb1xRORaJV/DufaNl+38HQWPZYtiWclCn3fUkzf4=;
        b=PYzW0wLj9FixipL/QF2CIOANDUyFs1yK5UAbx00qEvtO2rBrWp1uzz3GssZ1ZW/KZ9
         slOoZQHUscZKFf+N1UPTrIcs2vSX5g6qyqADdu/OfTIuDDLFEpE+DQYsyC46goMGF1k9
         5hMdJdlHiTEdzTeaUJ9La9VOrSDATRSKhuJ6OD+vu/Y8jYpgytLosvEiYBhwIvNt7ZtZ
         aADob6EGXUPD3/txGdZX6LHssopScZvNtG1XZJW05eV1RL03wavRjRdzlCx8w5mckHi0
         WpGs3vtFMYQhqojtVsiidGgKCbBDHUW1+1AAZk75z/gV/NKk/lepLJ1h+RVfbmcgTRaY
         PqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fQpyb1xRORaJV/DufaNl+38HQWPZYtiWclCn3fUkzf4=;
        b=Q0hXLvKDgagEETpFRPdTGMTjfcburdU4E8i89z+RmIDzUxb6fPBbg+e9ERD3UxRB6h
         mrogzG8fT5nvKfsLhszcxsxjUrS8kU9fZeESehYLo+18lvNmV6QMPKIb0E3dldUUO4SK
         09kfbSAgeLlWDZvtUlRAUeNSNqwSAfajF+LBspFD7CkwJm6poz/VZgrqE1WhWLrrKOXT
         RJq3V1ptpxT6YJVb2TOJC/crceXLxGPfSDvc46yCNYq7cv5mU4ebgLRVz33v95GfLzOo
         7ewxVALubfrVqaa62jYGA6dF09rQLr2btPOEvXSNeGnKw534JC0a6ioXyq5GXOE1+Adi
         ITVw==
X-Gm-Message-State: AOAM532IP1/Dvx3oRYmNCxAngx7hqz44Z6zq+cqczCr2tH/OeEcVEiGL
        u/Sa35A1o6nCGaqRXEHYag==
X-Google-Smtp-Source: ABdhPJze89CGaMasQnOXZQIxTN/3aDGe/s8xXpxmQ391InTv4sf4WsJq91pwoniorPop+SUBVbaMaQ==
X-Received: by 2002:aa7:909a:0:b0:4e1:6d4:5905 with SMTP id i26-20020aa7909a000000b004e106d45905mr37141907pfa.34.1646296312106;
        Thu, 03 Mar 2022 00:31:52 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id k7-20020a63ff07000000b00372dc67e854sm1392521pgi.14.2022.03.03.00.31.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:31:51 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/11] dt-bindings: i2c: npcm: support NPCM845
Date:   Thu,  3 Mar 2022 16:31:32 +0800
Message-Id: <20220303083141.8742-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..37976ddcf406 100644
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
@@ -44,6 +49,16 @@ required:
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const:
+              - nuvoton,npcm845-i2c
+
+    then:
+      required:
+        - nuvoton,sys-mgr
 
 unevaluatedProperties: false
 
@@ -57,6 +72,7 @@ examples:
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
         compatible = "nuvoton,npcm750-i2c";
+        nuvoton,sys-mgr = <&gcr>;
     };
 
 ...
-- 
2.17.1

