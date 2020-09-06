Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FC825EFDC
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgIFSvw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729094AbgIFSvp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:45 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08694C061573;
        Sun,  6 Sep 2020 11:51:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so13616700ljd.1;
        Sun, 06 Sep 2020 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVBjU4DFMR/Fo2W2cBTCdy0mIXGRqVHK48trniDB2M8=;
        b=pmSuOmgseubrFzn3V7pyRQwf6Cwug5bUwjYCa9oKzCnEP4QPnnKI1vHf07QqjcADSv
         dWhaA0mjYp2SginOqghmgjhU87nPLmKPAKTmMzKSuGunXgjWggoZ/F7ZLsJAQa1q6dUb
         UYqElOY2miKTisOQ2lNr3jF4aQZf7bonxab0cxQF1z2wYeawtUE/LOm7HmcEKhfxrHV6
         vSMsxyP6bVuKzEpnPuioj0yJqtiZGiXLnj0YAyP1odAKxT10HN72xDi/sSA8IgJbhY0F
         nNx7JUL7XfUJzOQ2VMUv70e6/E9VKFQQgAHnC/DLbkxKK41nwvy7TOx6HGHa2Z3jLr/J
         N+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVBjU4DFMR/Fo2W2cBTCdy0mIXGRqVHK48trniDB2M8=;
        b=DYzKzVOG3WlN+VnVT+JYF+BPy0GTMtGK5/2/lBRLFWhE6p3DL7XjIrrGw+F4ffkYFN
         Q734uQ9dL1X5spRxeAgL9jqEkIB8hrSnsmwN/poZzTOWiIEVeyU828huDECAnaFj8D3Q
         fFhE61YjrNcBpCmmxAFQ+eW0iRS1GBeqkQP96LiVB07DtzAw58k14kGOP+TijH8PudsF
         LLCP6SpuipaTHgxUhTnU2tbj05Ge1p751n9Rsfcd34wSIWdDDWjTCYehZwdNw+MM19Le
         D/btnaoVXMxNtOdsM9VMsWITpjAfd3luEqpnPiC9HkjLW6GHOkLnDTV1gGkRrlHWvzqr
         4HbA==
X-Gm-Message-State: AOAM532lz+xFmOsh2tVOGnUYxisN0wTcc23FhXh6jCe0UF4CaPr+LbDf
        U1Yckwa6R3tlVVEC+t54ODs=
X-Google-Smtp-Source: ABdhPJwZ8OHtC4SYnWW+CAoU/4Zy26Uw9BxbIeaW1rPe8UaeklVeQKevhBUu3FXKij1EHr6v9IIvSA==
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr8484152ljb.423.1599418299287;
        Sun, 06 Sep 2020 11:51:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/36] Improvements for Tegra I2C driver
Date:   Sun,  6 Sep 2020 21:50:03 +0300
Message-Id: <20200906185039.22700-1-digetx@gmail.com>
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

Dmitry Osipenko (36):
  i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
  i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
  i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
  i2c: tegra: Initialization div-clk rate unconditionally
  i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
  i2c: tegra: Runtime PM always available on Tegra
  i2c: tegra: Remove error message used for devm_request_irq() failure
  i2c: tegra: Use reset_control_reset()
  i2c: tegra: Use devm_platform_get_and_ioremap_resource()
  i2c: tegra: Use platform_get_irq()
  i2c: tegra: Use clk-bulk helpers
  i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
  i2c: tegra: Clean up probe function
  i2c: tegra: Remove likely/unlikely from the code
  i2c: tegra: Remove outdated barrier()
  i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
  i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
  i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
  i2c: tegra: Improve formatting of function variables
  i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
  i2c: tegra: Rename wait/poll functions
  i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
  i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
  i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
  i2c: tegra: Factor out register polling into separate function
  i2c: tegra: Factor out hardware initialization into separate function
  i2c: tegra: Reorder location of functions in the code
  i2c: tegra: Check errors for both positive and negative values
  i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
  i2c: tegra: Clean up printk messages
  i2c: tegra: Clean up whitespaces, newlines and indentation
  i2c: tegra: Clean up and improve comments
  i2c: tegra: Clean up variable types
  i2c: tegra: Improve driver module description
  i2c: tegra: Rename couple "ret" variables to "err"
  i2c: tegra: Improve tegra_i2c_dev structure

 drivers/i2c/busses/i2c-tegra.c | 1396 ++++++++++++++++----------------
 1 file changed, 677 insertions(+), 719 deletions(-)

-- 
2.27.0

