Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A3B4BCBFD
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 04:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237865AbiBTD51 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237572AbiBTD50 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:26 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5195E40E6C;
        Sat, 19 Feb 2022 19:57:05 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id l8so10241852pls.7;
        Sat, 19 Feb 2022 19:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EHVv67KSR6zDSWz8cwXw0lmEsHGkvf35iFMIN1Dv6lw=;
        b=eUWV62m2mWgNEygve3r4gAQGgbtJC8vfCn8Je+GAOVzGcyLmyzaKr/KtgkITk1/SgQ
         wz0ZBYFcfP8mPxXg1cUEI5eQbbqSYZxwOGYQTaw1agnvUU1e/3IrfGCdnkvfCRxzuVFp
         hX/6JGhzM9IQ3x/zvcwma7WNSs3S7z9wvj0X7MfvuwoGNlW/v1xgjlnWN0RNUFBdUyMN
         CVmX5D7OvoH4AWi1gIH2kawP3FTsroqNJpwmbUUVs8+yiZmjH8AR+CXcjO06FYJpwrmt
         bxfJeniM0d9Jxc0Ni+ut/UbhGE6wyysqJYp0P/00HKEMAPGMTNCBJshwTsn4Qpz+OO0j
         l8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EHVv67KSR6zDSWz8cwXw0lmEsHGkvf35iFMIN1Dv6lw=;
        b=QCOTD7WIpR0KyDhQKEvm0Q7ByEBj6BL6Hb5/qG3HqoPrXOgcokVONhHy0m8wq+38Ns
         OP6CaCKSHEWp+pctg9Mhl8URpqNbSyoSgMb43opNr0KnECnbLd8VYiKoQf9O5dTQclYc
         CnxOn27FShABioTZe4oZLWNwXrR/wZEQV719HK3Fc5yo1J1FQkTfXifBbs5dZv9ov9dP
         QyPJtIJbkVC+R76IDqP3GBvYa64PNtvqS4NSHPnX3oaMS87NgbW9pT4QfhLZhhkQEdAd
         M1mATRI3sVq5cr5K67gAOV/xrF/JMP4r50mxbZMJPB98s7gW31tr+oB1SMdqn8M2PT02
         Ighg==
X-Gm-Message-State: AOAM533MdLvXibuk2O+ftO/rKUlpqsI0iKVEdFUE93ccCk9sNjHrN0Xm
        GRxvAY8D84K6x+qyZHeczw==
X-Google-Smtp-Source: ABdhPJz9OY16LTtX2vHBLEbctEpEm6VpfzTvfP02ftY0JmhIZEclV4d9bO7Bmto1PlmWqBBW9TkJlg==
X-Received: by 2002:a17:90b:4a85:b0:1b9:d80d:bff with SMTP id lp5-20020a17090b4a8500b001b9d80d0bffmr19706270pjb.67.1645329424649;
        Sat, 19 Feb 2022 19:57:04 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id ck20sm3497136pjb.27.2022.02.19.19.57.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:57:04 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
Date:   Sun, 20 Feb 2022 11:53:12 +0800
Message-Id: <20220220035321.3870-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
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
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..809c51ac32fe 100644
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
+     enum:
+      - nuvoton,npcm750-i2c
+      - nuvoton,npcm845-i2c
 
   reg:
     maxItems: 1
@@ -36,11 +37,16 @@ properties:
     default: 100000
     enum: [100000, 400000, 1000000]
 
+  nuvoton,sys-mgr:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of system manager register node.
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
+  - nuvoton,sys-mgr
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
@@ -57,6 +63,7 @@ examples:
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
         compatible = "nuvoton,npcm750-i2c";
+        nuvoton,sys-mgr = <&gcr>;
     };
 
 ...
-- 
2.17.1

