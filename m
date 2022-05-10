Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C495521083
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 11:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238250AbiEJJV2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 05:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238556AbiEJJV0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 05:21:26 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3D520B54B;
        Tue, 10 May 2022 02:17:29 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id s16so4061290pgs.3;
        Tue, 10 May 2022 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ohWrWKhb7DH4mWT2Vpbml6C/Yi2zU4//OgZmCLMHe0=;
        b=DId4zWWENPDBe803yDU0EgPlkAgQ9UTEmkZciNnfJlpTHSpfNoJI95GDoIEYDdCzwF
         YHykbhHXb2XRKqHpB7aVx36MRJIKNAptpmJv7s0vpEscKjGUS5eeqq8Ggj1ime0uBxdp
         rrSZVmNe84M0w85Bfp5hZMGBiBDkbYHQMlOLZA5mb/LSNAEv5nRnjnjJpoJX7Qw76f/3
         341Xvdhnm58Kr6i73uqCXDy3gwhmLHeYz/YDNhmuxC7BIvXIwm0NIYuGjh8XbS2e/rEe
         RGDcCUdqNhloApQSLjHHVPd4avvJ6ISxRxdsL5fogqd8Q2Zkgj2JWm+0kbuSl+y4xe0I
         U5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ohWrWKhb7DH4mWT2Vpbml6C/Yi2zU4//OgZmCLMHe0=;
        b=Je3qa3lxopGzK2G+iklrr9JmYE0nH7JU02SHygmdXBcQZ7bzgrhaKzbMmIW4LSJS6e
         sQcIwCDJPyhNGRjUp6omNYN7mSMF3zf7bW8vKLOTWS+7fNm0QnudacwgCFJtDU+tLe+s
         DpT/GsCEDO8VdzRPaHSVL+llY1A0rn4abjrH5I3b/1nYRcidDWiB/5M+9lZQr3NERKmW
         opnT1LuvG92BbjqWgXiEdnvI+dvSYDqqg2cC7X+aeiwn1gBjlLDb8vHDVf49HgaiCUSn
         +Kb3qa568OWG0lLlDjwrPEUUxtE0uALAKNqUvxPvl/aWObpLb4+9aoOC4SICjI6yPFLF
         2mpA==
X-Gm-Message-State: AOAM530HXu9TJnRIG0jMd0vMhb/ocnnCmouzUG6u7EexrH34WUsO9qJh
        JwX/VgE4wi4QE0iyxto4zA==
X-Google-Smtp-Source: ABdhPJzWUJ6bTi6v+qZvP1Qcqb96Ilp/dJd0/Q4FsknFBWSeSF9G2Go/2vlTzyKn+anKaKWYXTo9Ow==
X-Received: by 2002:a63:d312:0:b0:3c6:74a2:da72 with SMTP id b18-20020a63d312000000b003c674a2da72mr12651836pgg.16.1652174248702;
        Tue, 10 May 2022 02:17:28 -0700 (PDT)
Received: from localhost (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net. [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
        by smtp.gmail.com with ESMTPSA id 20-20020a17090a035400b001dcf49d92a1sm1283670pjf.28.2022.05.10.02.17.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:17:28 -0700 (PDT)
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
Subject: [PATCH v4 0/9] i2c: npcm: Bug fixes timeout, spurious interrupts
Date:   Tue, 10 May 2022 17:16:45 +0800
Message-Id: <20220510091654.8498-1-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This patchset includes the following fixes:

- Add dt-bindings description for NPCM845.
- Bug fix for timeout calculation.
- Better handling of spurious interrupts.
- Fix for event type in slave mode.
- Removal of own slave addresses [2:10].
- Support for next gen BMC (NPCM845).

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Addressed comments from:
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/3/289
 - Andy Shevchenko : https://lkml.org/lkml/2022/3/3/286
 - Andy Shevchenko : https://lkml.org/lkml/2022/4/5/140
 - Andy Shevchenko : https://lkml.org/lkml/2022/3/3/295

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

Tali Perry (6):
  i2c: npcm: Change the way of getting GCR regmap
  i2c: npcm: Remove unused variable clk_regmap
  i2c: npcm: Fix timeout calculation
  i2c: npcm: Add tx complete counter
  i2c: npcm: Handle spurious interrupts
  i2c: npcm: Remove own slave addresses 2:10

Tyrone Ting (3):
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Correct register access width
  i2c: npcm: Support NPCM845

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 +-
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 277 +++++++++++-------
 4 files changed, 196 insertions(+), 116 deletions(-)

-- 
2.17.1

