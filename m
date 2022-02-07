Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBAF14AB545
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 07:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbiBGG4M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 01:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241627AbiBGGds (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 01:33:48 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B081C043181;
        Sun,  6 Feb 2022 22:33:47 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id t4-20020a17090a510400b001b8c4a6cd5dso1169324pjh.5;
        Sun, 06 Feb 2022 22:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=5w4/ennwCAEEkQywko6dYbRCf/YpCkpMTELAq3SETZ0=;
        b=Hh53y7v9NqRMkLkoNG8j78dhkJPtGq5sFnpbaHmwv98uBLw3f32oI311L5p3FsJKJ3
         IgrPn3pu9YeOnJzCeFAgfkY9+N8XVvBodUNzDn+qfjnrk/4nx0g/L9pyLyBsTMjfrZ/D
         34Eb2vBm+bm+FF7/WxOe/zU/utjATQBnpvQiEf1XRkuAyaDtQXGOSRla9Rx36lSnSFCl
         Kz/cEyzX+XqzrcnXtwAMRKwYkscyU0U+9pzEy23Rd0t7zzMfFKAAKNA/iop5FskRk39L
         JOk5Ut+nY244dW4vzbXVIg8BJiCeT1yfuxCNAR7SEZi5s6zwM30kAYnVHR0rD06KNikt
         Bhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5w4/ennwCAEEkQywko6dYbRCf/YpCkpMTELAq3SETZ0=;
        b=dCt7ZUL5730M22Et2LAnpJRsHW0fccyGP29nPWAIGB7m3oRGQ50+70+BAsz0dkVlge
         uHIlq3LnN/DFby+03Ns1uMVbSrpGzWHjzdH8hv0FzfzH1LGj7imlJtsbrSFwCzSN/5wK
         HeVtwUQ6eLcgONkvppzUL6xlPZj6h1XbobFh9XzdZvCd8yWitcUUksZ6PVjMosmUeG5x
         PGq3gv9zrtOZpjRFUqVPSEgnghMYFOwFSe1scdGDxnXIlELdGpK2QYxbcWAJnTwKVhdC
         FG98TRErmjNUajm47UVPorw2J6wvS0dDkY0NbJJUkxwsbvZLPC5vvtED950q4ERqzGUS
         okGg==
X-Gm-Message-State: AOAM530qgtik2pOVBfIyA9C3e5p6bwA8r8Q5df1ZQW8Su4ZYQs8sNDS8
        At+ZAFnaHHq3Sx8xSUweEg==
X-Google-Smtp-Source: ABdhPJwAH1K+CWgey8aVJCIHJ53hQkGzwDi9PAMPA/2HOH43X+MSCDHXYztTHNJXL8NB9GZijsI3XQ==
X-Received: by 2002:a17:90b:351:: with SMTP id fh17mr5008108pjb.28.1644215627026;
        Sun, 06 Feb 2022 22:33:47 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
        by smtp.gmail.com with ESMTPSA id d13sm2803452pfj.205.2022.02.06.22.33.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Feb 2022 22:33:46 -0800 (PST)
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
Subject: [PATCH v1 0/6] i2c: npcm: Bug fixes timeout, spurious interrupts
Date:   Mon,  7 Feb 2022 14:33:32 +0800
Message-Id: <20220207063338.6570-1-warp5tw@gmail.com>
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

Tali Perry (4):
  i2c: npcm: Fix timeout calculation
  i2c: npcm: Add tx complete counter
  i2c: npcm: Handle spurious interrupts
  i2c: npcm: Remove own slave addresses 2:10

Tyrone Ting (2):
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Support NPCM845

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  21 +-
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 191 ++++++++++++------
 4 files changed, 149 insertions(+), 73 deletions(-)

-- 
2.17.1

