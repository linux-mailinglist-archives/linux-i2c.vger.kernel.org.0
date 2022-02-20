Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 989EF4BCBFC
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 04:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiBTD5U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiBTD5U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:20 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836F43EABD;
        Sat, 19 Feb 2022 19:56:59 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id m11so6679786pls.5;
        Sat, 19 Feb 2022 19:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VGpYslQLZPwISm1nPTwx+q6e8M94h8NxJolstJ+8zQM=;
        b=P9X9sMyI7X93Ba8SNlRossbnpsMILrGKyaJrgVRXG/RSlV5ONnsyZsco/sXQbmZwhG
         wBJMF2PpkVn7aWFaQygvPLr/IXjyIkh42fd5ziaE5LnsJw0jSAYN29LPgk5vJpN+S2mo
         D8Png8rM+rMH4zh6IBRe2SUnYwVgSqAm/xplXvGxpFtLlZ7xhTK2N7LuKso+LCAdboqv
         pRcj+jups7UYUp1RSCTNmAN4F2LxmVDtHnTSWeg5L7sxpuTWY0B1cDaoHCKWHbJZosqO
         f4Gn8r7SvybllTAObt8VHoEMpB/AbsHjr+jMNse9EQR6eqaaA8P9lWI7rFTJoM7y+1rD
         BfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VGpYslQLZPwISm1nPTwx+q6e8M94h8NxJolstJ+8zQM=;
        b=qQbOKn1Ttv16fYtR7aj2NiZXTJqwn/f2w6MqLRYH7PQwbtIepv807JwbwgCB6JPgTO
         SeMWA/QGA4cs3J7wJPAog+Y47IuaHLwhytFX5OIvn+I3xzT6K50rxqgmGaXGK1L41sGV
         oq5jgV0/q6aSccIKOc6ucgKapR7MHwuzToEUjpj/sL3IfO7rf5xplVVlX3VaSxKW+gN2
         jibSBA6bEQT7hVL9mbGbFdFeCJ/ZpNrazcrh3BubcHrABeWkoOe5dcU3TmgG+UXm+AnZ
         5MYTgY7oT9Hnc0X8taqZZkoa7Im/jxDfa7up1Y8A3rQLqsG3i605q0ioWWA3/9c3/v3q
         1vwA==
X-Gm-Message-State: AOAM530GBZ6Bz6EMGZ7vCRuOBafo+pkOejNEgvssyqVv9KxYtYCUPcNo
        W5xbEY7T9XCIUe336ogrIg==
X-Google-Smtp-Source: ABdhPJwGgQQH415hnEbc4rho2GZhnPF17sXaRpaHqfTkpT+EBgslDBF0FKkp3zbIQ+e3Wj/O715rfw==
X-Received: by 2002:a17:903:24d:b0:14f:84dd:babb with SMTP id j13-20020a170903024d00b0014f84ddbabbmr6823923plh.47.1645329418805;
        Sat, 19 Feb 2022 19:56:58 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id k21sm2687921pff.25.2022.02.19.19.56.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:56:58 -0800 (PST)
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
Subject: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
Date:   Sun, 20 Feb 2022 11:53:10 +0800
Message-Id: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/670
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760
 - Rob Herring : https://lkml.org/lkml/2022/2/7/1166
                 https://lkml.org/lkml/2022/2/11/711
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/742
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/934
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/947
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/1057
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/1192
 - kernel test robot : https://lore.kernel.org/all/
                       202202072020.toQ349pg-lkp@intel.com/
 
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

Tali Perry (7):
  i2c: npcm: Fix client address calculation
  i2c: npcm: Update gcr property name
  i2c: npcm: Remove unused clock node
  i2c: npcm: Fix timeout calculation
  i2c: npcm: Add tx complete counter
  i2c: npcm: Handle spurious interrupts
  i2c: npcm: Remove own slave addresses 2:10

Tyrone Ting (4):
  arm: dts: add new property for NPCM i2c module
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Correct register access width
  i2c: npcm: Support NPCM845

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  17 +-
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  16 ++
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 251 +++++++++++-------
 5 files changed, 193 insertions(+), 101 deletions(-)

-- 
2.17.1

