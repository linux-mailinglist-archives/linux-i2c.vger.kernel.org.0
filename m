Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D80B2622BF
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgIHWk0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgIHWkZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:25 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6F2C061573;
        Tue,  8 Sep 2020 15:40:24 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so958715ljk.8;
        Tue, 08 Sep 2020 15:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZhZgovrBEqjDMGuHc+TPH0ScC1x2HmD3L5iIl67blo=;
        b=CBGvvX2ZVK7njTEwf5XdYS1rlV3av349nUDIEo7UgnwvtwU6hgsW3KbYwJGWaKKde5
         gk5jrCibijOSWBW0w+JFrQjK47DgC9Qbc1+bLoZrK4v6DPzHVEtXRW1ZjVuio6bW3FO+
         PfymoU/JkBV6qRoQjY8UAEHp8dUL29rvReWK+H8nEhPVdRPSuAoNNQA56Z/LYf4FZagr
         WbCp8jKkx9UEW9HJiYYYsPpHXsVQMCCAVR8eOWr3tMt2QKJo3NH502ymDtnQIV2QRrSr
         V5zGyXgK43FJaeQypjKRe67KpEPoVnar9pnX4xYNVRuyEQnRHCSQ6HQc+ZaTURv3oBjg
         PsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZhZgovrBEqjDMGuHc+TPH0ScC1x2HmD3L5iIl67blo=;
        b=s8f7mwFSNcmQ1DMgb38FREiDQ/RMnN0HV6EwEHY5H5xr7B0Sl8ZGx2xnbESy8gFw2D
         7totsieTnFFRC+Yvykcf9ZWKL6TbCKkWI3gQZ/Km2P2KppbohEwGoLbCP8wjnVZFverv
         T2expCLUasOXDb5OgGSAleFE9FUwWMlyujTChqRQ1JNOFbFwquO8atLFIHNQOd6HNaQp
         pM8iSH8Kf2hLc8YHjFOMJqLcf7SJf/1bw9MZX2PeGIEuuhbk7xYibDeEgq3kD3MZlzs3
         50W547mAvondlIOGYOXsxHwojtGp3p+ZO8RuZW/4Z23zs7/L7/QYUWtrhHEc6nPj5fat
         85Lw==
X-Gm-Message-State: AOAM53170cRJqV0Zf/PA+XyM6hpp8iUKndoA/b+x6NoXMOeqReqwEvwZ
        RLusYTtlDyY7caK+6Nv50po=
X-Google-Smtp-Source: ABdhPJypFAkAKq4OPAowG5XOkQA77tt1XsDZ/6uavdRVBhE5PEBaAoEVyvigBh2iKq3GjCN0m34gAQ==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr390931ljg.164.1599604823116;
        Tue, 08 Sep 2020 15:40:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/34] Improvements for Tegra I2C driver
Date:   Wed,  9 Sep 2020 01:39:32 +0300
Message-Id: <20200908224006.25636-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello!

This series performs refactoring of the Tegra I2C driver code and hardens
the atomic-transfer mode.

Changelog:

v7: - Reworked the "Clean up probe function" patch by moving out all
      variable renamings into the "Clean up variable names" patch.
      This results in a nicer diff, which was asked by Andy Shevchenko.

    - Squashed "Improve coding style of tegra_i2c_wait_for_config_load()"
      patch into "Factor out register polling into separate function" in
      order avoid unnecessary ping-pong changes, which was asked by
      Andy Shevchenko.

    - Added more indentation improvements, it should be ideal now.

    - I haven't changed order of the "Clean up variable types" patch,
      which was suggested by Andy Shevchenko, because I already moved
      that patch multiple times and we decided to sort patches starting
      with more important cleanups and down to less important. The type
      changes are more important than shuffling code around, IMO.

v6: - Added new patch that adds missing RPM puts, thanks to Andy Shevchenko
      for the suggestion.

    - Improved commit messages by extending them with more a more detailed
      explanation of the changes.

    - Added clarifying comment to the "Use reset_control_reset()" change,
      which was asked by Andy Shevchenko.

    - Refactored the "Clean up probe function" patch by moving the
      dev_err_probe() change into the "Use clk-bulk helpers" patch,
      which was suggested by Andy Shevchenko.

    - Improved ordering of the patches like it was suggested by
      Andy Shevchenko.

    - Added Andy Shevchenko to suggested-by of the "Use clk-bulk helpers"
      patch.

    - Improved "Remove i2c_dev.clk_divisor_non_hs_mode member" patch by
      making the case-switch to use "fast plus mode" timing if clock rate
      is out-of-range. Just to make it more consistent.

    - The "Improve tegra_i2c_dev structure" patch is squashed into
     "Improve formatting of variables" and "Clean up types/names" patches.

    - All variable-renaming changes are squashed into a single "Clean up
      variable names" patch.

    - Made extra minor improvement to various patches, like more comments
      and indentations improved.

v5: - Dropped the "Factor out runtime PM and hardware initialization"
      patch, like it was suggested by Michał Mirosław. Instead a less
      invasive "Factor out hardware initialization into separate function"
      patch added, it doesn't touch the RPM initialization.

    - The "Remove outdated barrier()" patch now removes outdated comments.

    - Updated commit description of the "Remove "dma" variable" patch,
      saying that the transfer mode may be changed by a callee. This was
      suggested by Michał Mirosław.

    - Reworked the "Clean up and improve comments" patch. Couple more
      comments are corrected and reworded now.

    - Added r-b's from Michał Mirosław.

    - New patches:

        i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
        i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
        i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
        i2c: tegra: Clean up variable types
        i2c: tegra: Improve tegra_i2c_dev structure

v4: - Reordered patches in the fixes/features/cleanups order like it was
      suggested by Andy Shevchenko.

    - Now using clk-bulk API, which was suggested by Andy Shevchenko.

    - Reworked "Make tegra_i2c_flush_fifos() usable in atomic transfer"
      patch to use iopoll API, which was suggested by Andy Shevchenko.

    - Separated "Clean up probe function" into several smaller patches.

    - Squashed "Add missing newline before returns" patch into
      "Clean up whitespaces, newlines and indentation".

    - The "Drop '_timeout' from wait/poll function names" is renamed to
      "Rename wait/poll functions".

    - The "Use reset_control_reset()" is changed to not fail tegra_i2c_init(),
      but only emit warning. This should be more friendly behaviour in oppose
      to having a non-bootable machine if reset-control fails.

    - New patches:

        i2c: tegra: Remove error message used for devm_request_irq() failure
        i2c: tegra: Use devm_platform_get_and_ioremap_resource()
        i2c: tegra: Use platform_get_irq()
        i2c: tegra: Use clk-bulk helpers
        i2c: tegra: Remove bogus barrier()
        i2c: tegra: Factor out register polling into separate function
        i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
        i2c: tegra: Clean up and improve comments
        i2c: tegra: Rename couple "ret" variables to "err"

v3: - Optimized "Make tegra_i2c_flush_fifos() usable in atomic transfer"
      patch by pre-checking FIFO state before starting to poll using
      ktime API, which may be expensive under some circumstances.

    - The "Clean up messages in the code" patch now makes all messages
      to use proper capitalization of abbreviations. Thanks to Andy Shevchenko
      and Michał Mirosław for the suggestion.

    - The "Remove unnecessary whitespaces and newlines" patch is transformed
      into "Clean up whitespaces and newlines", it now also adds missing
      newlines and spaces.

    - Reworked the "Clean up probe function" patch in accordance to
      suggestion from Michał Mirosław by factoring out only parts of
      the code that make error unwinding cleaner.

    - Added r-b from Michał Mirosław.

    - Added more patches:

        i2c: tegra: Reorder location of functions in the code
        i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
        i2c: tegra: Remove "dma" variable
        i2c: tegra: Initialization div-clk rate unconditionally
        i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member

v2: - Cleaned more messages in the "Clean up messages in the code" patch.

    - The error code of reset_control_reset() is checked now.

    - Added these new patches to clean up couple more things:

        i2c: tegra: Check errors for both positive and negative values
        i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
        i2c: tegra: Remove unnecessary whitespaces and newlines
        i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
        i2c: tegra: Improve driver module description

Dmitry Osipenko (34):
  i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
  i2c: tegra: Add missing pm_runtime_put()
  i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
  i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
  i2c: tegra: Initialize div-clk rate unconditionally
  i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
  i2c: tegra: Runtime PM always available on Tegra
  i2c: tegra: Remove error message used for devm_request_irq() failure
  i2c: tegra: Use reset_control_reset()
  i2c: tegra: Use devm_platform_get_and_ioremap_resource()
  i2c: tegra: Use platform_get_irq()
  i2c: tegra: Use clk-bulk helpers
  i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
  i2c: tegra: Clean up probe function
  i2c: tegra: Reorder location of functions in the code
  i2c: tegra: Clean up variable types
  i2c: tegra: Remove outdated barrier()
  i2c: tegra: Remove likely/unlikely from the code
  i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
  i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
  i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
  i2c: tegra: Rename wait/poll functions
  i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
  i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
  i2c: tegra: Factor out register polling into separate function
  i2c: tegra: Factor out hardware initialization into separate function
  i2c: tegra: Check errors for both positive and negative values
  i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
  i2c: tegra: Improve formatting of variables
  i2c: tegra: Clean up variable names
  i2c: tegra: Clean up printk messages
  i2c: tegra: Clean up and improve comments
  i2c: tegra: Clean up whitespaces, newlines and indentation
  i2c: tegra: Improve driver module description

 drivers/i2c/busses/i2c-tegra.c | 1435 ++++++++++++++++----------------
 1 file changed, 701 insertions(+), 734 deletions(-)

-- 
2.27.0

