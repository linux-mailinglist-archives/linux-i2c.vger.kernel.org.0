Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA0865335B2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 05:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233904AbiEYDYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 23:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiEYDYS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 23:24:18 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF508644C4;
        Tue, 24 May 2022 20:24:16 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id w3so10850658plp.13;
        Tue, 24 May 2022 20:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=PD/tHInjczHNg1z5c2Rt4gIr9ddVptl5dYEtEWg2i74=;
        b=pTRYfyFXhq/G+vSbxKuMwUW7CnBZ32P4Wn9QlcVYVGOoFNd1K6gKhrSJtdXn0lVJo3
         iYx+MKkAFty1i9Phz+dA7MvrC8KdIGyXgSHKAoKAPaQK3ZpJPRrCPKcZd2nOE7PXuVcI
         UiFTVEO7llLES5/ir+e+sqDEvNCzgyTOOpSc+Kh8+gnAHJtHwFeJOgfpoAI9MXUx1dCJ
         EQWtbdDdens1n9aIyk0WQ2KrqOchieLgRlbwEM3nCw0KJjn29Pg0tZ4ThfpvxZpaV19a
         npY5YgxsEXltuO4peEvH+4WzNcId3njzgCwWk4qQ9CFKQibm+Zz4qtv6TUtGI4P8lmyU
         cXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PD/tHInjczHNg1z5c2Rt4gIr9ddVptl5dYEtEWg2i74=;
        b=kjFHzQW1IShoqnuBJTVyOOuzq358CfRpGo8ti+TZEHHECxmaP6BvIB6G5/l/+BLHgN
         StQAfn6gJUwpnu+LTUQqYbCm0Fazj+YFhbWrCqyr4bfL19rtq+2a1BbUlswPvEwCpNdA
         6eclfuaoWErbFNCt18iuBu8PX4KTUE6WztYkRhMyqTwYBIPvNupx7Ssc8jUJYUGQEcuC
         wGjhCbuWAgKDQuQNDqX9MAlpwIs5738+O17/dre1ktfPxfnDGqFiJxLiTq7FaGwouKKA
         uPYtyn5O/YAqm+QRJPEFTFZGStvGHUW75fGmxZwiOWdm4pizXLDnq1mcpRLfsE6ffTo4
         cKyg==
X-Gm-Message-State: AOAM5336OHpjKdqHxi+3Nonlh21Dam1cBs/IiboAUS2vebRrpcvXJPsQ
        1dKYCk7VRTs9KGwddnw4NAO2t1i3nrzL
X-Google-Smtp-Source: ABdhPJzOpq43xVt30v0+isBkmtEzD9PzbUElFki3AfULSLo+QTIwioOU1s2IKqehPpZszN9/3tdQGA==
X-Received: by 2002:a17:903:230e:b0:163:5942:164f with SMTP id d14-20020a170903230e00b001635942164fmr1033608plh.160.1653449056058;
        Tue, 24 May 2022 20:24:16 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id c78-20020a621c51000000b0050dc76281fdsm10012126pfc.215.2022.05.24.20.24.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 20:24:15 -0700 (PDT)
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
Subject: [PATCH v6 0/5] i2c: npcm: Bug fixes timeout, spurious interrupts
Date:   Wed, 25 May 2022 11:23:36 +0800
Message-Id: <20220525032341.3182-1-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
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

This patchset includes the following fixes:

- Add dt-bindings description for NPCM845.
- Bug fix for timeout calculation.
- Better handling of spurious interrupts.
- Fix for event type in slave mode.
- Removal of own slave addresses [2:10].
- Support for next gen BMC (NPCM845).

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Addressed comments from:
 - Wolfram Sang : https://lkml.org/lkml/2022/5/21/51

Changes since version 5:
 - Shorten npcm_i2caddr array since the number of supported i2c slave
   addresses is reduced.
 - Create a new patch from the original PATCH v5 08/10 to modify the slave
   transaction logic.

Changes since version 4:
 - Remove quotes around ref handle to nuvoton,sys-mgr in i2c binding
   document.
 - Keep the "longer line first" order.
 - Correct the SoB chain.
 - Modify the if statement in one line and add new line characters.
 - Modify the commit message format in the patch Remove own slave
   addresses 2:10. Correct the if statement in one line and shorten the
   debug messages.
 - Create a new patch to capitalize the one-line comment in the driver.

Changes since version 3:
 - Correct the const format in if condition in i2c binding document.
 - Add the oops message statement and register information in register
   access width patch.
 - Add the occurring rate of the i2c spurious interrupt issue and more
   details in driver's behavior to overcome this issue.
 - Address Andy's comments in the patch to support NPCM845.
 
Changes since version 2:
 - Keep old code as fallback, if getting nuvoton,sys-mgr property fails.
 - Fix the error reported by running 'make DT_CHECKER_FLAGS=-m 
   dt_binding_check'.
 - Make nuvoton,sys-mgr required for nuvoton,npcm845-i2c.
 - Correct the patch's subject about changing the way of getting GCR
   regmap and add the description about keeping old code as fallback
   if getting nuvoton,sys-mgr property fails.
 - Correct the patch title and description about removing the unused 
   variable clk_regmap.
 - Use the data field directly instead of the macros since macros are
   not constants anymore in this patch.
 
Changes since version 1:
 - Add nuvoton,sys-mgr property in NPCM devicetree.
 - Describe the commit message in imperative mood.
 - Modify the description in i2c binding document to cover NPCM series.
 - Add new property in i2c binding document.
 - Create a new patch for client address calculation.
 - Create a new patch for updating gcr property name.
 - Create a new patch for removing unused clock node.
 - Explain EOB in the commit description.
 - Create a new patch for correcting NPCM register access width.
 - Remove some comment since the corresponding logic no longer exists.
 - Remove fixes tag while the patch adds an additional feature.
 - Use devicetree data field to support NPCM845.

Tali Perry (2):
  i2c: npcm: Remove own slave addresses 2:10
  i2c: npcm: Correct slave role behavior

Tyrone Ting (3):
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Support NPCM845
  i2c: npcm: Capitalize the one-line comment

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 ++-
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 176 ++++++++++--------
 4 files changed, 124 insertions(+), 87 deletions(-)

-- 
2.17.1

