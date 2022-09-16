Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137C65BADF8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 15:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbiIPNTg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 09:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbiIPNTd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 09:19:33 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5386DDB7
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 06:19:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z25so35590033lfr.2
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=OaypWP/IxlHhG1Kx4aDr1Q5K0a9Anqf01PLYalSrVCo=;
        b=mq3JbMh11ee0Td9M2zQC6K//p9ytv7XheGu/zc/RTSsxwG05ni+X18R4SVKDSxecV9
         qjfi8hTwyS1KV0MutpqHstd6CbHSgNcgK2pSiHhgOWIsMc5mEVmtI6rlSOKrqz7HC9YU
         KxtBUj5mhgOT73/hF4H8RxwzWdj2yZx0IoumQ5d7lVIgcZGVzQdmaDh0Cd9xHj39tF6E
         e4HX3U5bk28EwhKfRA5shj3qaZRb30J5mBvfiuu3Y02Y7SbBEFmoTwkeuheRvbApJpU2
         TQ3cOvdj01JuerO1qKMk0t5GGwiuCXV5ai2PuG0Vzo2biI2IOp5f5GDpGoaWl8H/jDaH
         M3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=OaypWP/IxlHhG1Kx4aDr1Q5K0a9Anqf01PLYalSrVCo=;
        b=6OsDr4otienThkBfyW/7+qPw08mqUjqL/VsxUZt+ziWe9JAUK3MpxQvh/BU+I8kz2e
         qPEWG+QuLIMSeqlSTVj5Ny5kUAaz290JKefdjqV/rJQipCd3Z3bHoOBcoUJwsmeVcww+
         kA+pgcgLGGL8f/FtBDOifWZwLB6aKxjYQQniogYR+3CXCTnzluCVpJPqL6JiqPabJXsH
         dffMokcWogDepYJYaRiizGQqFbU8R6u8/WM1gUPMRZl0svBUfJ5I1qTmS9W9B3fn5fVf
         PcYTK4zN0Sut5UR3rTyH68hnT7+DLWRFC39uJWHvZU6V7Sb20XRJO+xzKGdLmYVxIEsp
         zfcA==
X-Gm-Message-State: ACrzQf0w9EFnhA4/xieLQUA31y8LUHQxhsCk/qovCmIoUaNphsKxcoTv
        rz9HI4lioAcpqHwQWzN3k4ytBg==
X-Google-Smtp-Source: AMsMyM6uah9ha3qExCMZeorZmSh0Jd6ZlB8Vni6OkPnTZNHGOGWV8wlQpL0aCQj6UWpc52FxE9ISaw==
X-Received: by 2002:ac2:5d25:0:b0:497:a280:9825 with SMTP id i5-20020ac25d25000000b00497a2809825mr1630139lfb.409.1663334367682;
        Fri, 16 Sep 2022 06:19:27 -0700 (PDT)
Received: from dabros-l.wifi.semihalf.net ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id f3-20020a05651c02c300b0025fdf1af42asm3650847ljo.78.2022.09.16.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 06:19:27 -0700 (PDT)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        mario.limonciello@amd.com, jsd@semihalf.com
Subject: [PATCH -next 0/2] Add i2c arbitration support for new SoCs
Date:   Fri, 16 Sep 2022 15:18:52 +0200
Message-Id: <20220916131854.687371-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patchset comprises changes into i2c-designware-amdpsp.c module
which aims to add support for new SoCs, while keep backward
compatibility with Cezanne platforms.

Beside new algorithm introduced for the PSP-x86 communication, it also
switches from MSR/MMIO access to SMN (System Management Network) since
only the latter is working on both old new revisions of SoCs.

Jan Dabros (2):
  i2c: designware: Switch from using MMIO access to SMN access
  i2c: designware: Add support for new SoCs in AMDPSP driver

 arch/x86/include/asm/amd_nb.h               |   1 +
 arch/x86/kernel/amd_nb.c                    |   3 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 199 +++++++++++++-------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 5 files changed, 134 insertions(+), 71 deletions(-)

-- 
2.37.3.968.ga6b4b080e4-goog

