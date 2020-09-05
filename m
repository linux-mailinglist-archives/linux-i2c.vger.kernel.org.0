Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2EA25EADA
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbgIEUrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbgIEUmb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:31 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B23C061244;
        Sat,  5 Sep 2020 13:42:28 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z19so5615096lfr.4;
        Sat, 05 Sep 2020 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/2Yi9oA04Gn2zXLl91qyD7H5oBjTtrtpwfVnvjh2FA=;
        b=kedm53ZIacgGuBr6hF16jt18gyFz9AyEc0Ys4PpdlkPLHe01gvzOALH3YtUprh45p6
         fDdu40+bixZyanjgKCnqjgBAfWG664a5Ct73wMsrbktvDDbAxr8QX4FeN/rPAR8UoTkM
         74XmpefXordV8xoobxDAntA8LGCXzSNCNtDQp2wgR57WgQ2b57K4PTvpFe4thuE7PXcX
         FgNBSdG4niDOpWmlRQNw+LbF/oaERoqObX4ixMEY8C1t8mDy2e/QprbeqB6lNtswkeNn
         fGWEMsrhyuJU4HTaxPlkc0MTO90zmbPcV/1eEw5xDdL1tiekmyDq4YZGO3lR5dIWYB+g
         sXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/2Yi9oA04Gn2zXLl91qyD7H5oBjTtrtpwfVnvjh2FA=;
        b=cAB1Isp1pbNATw91j4BzMr+UvCWQbe5HcpClSErr6S6dQL0wE7OihAnpMSRfDJ0nKA
         YRixl0FgD3vkAsOX6YK58QrSj1EjYDPg4ZCNKDmwnVNztynpJWpeUiU+LFP7rOs1Ot47
         K6OkdegTLq3ShXOgnxSuraEuzz5bpu/anFgiYxkEyDUArkSpfypwh/8T+Z/dE1DJtSps
         KDyNyfds9kNm9jl40EZetWj5xkwq1zANqmoSmgvBi+Y6u5Pfdn8alWiMBf+TBrhDIqgo
         6G/tVwUNQ3AajNZlnnZc2px9d/B+fdjbDWuht4jBecULmQrAqAY/q8DXC5JE1p5CQ483
         66iw==
X-Gm-Message-State: AOAM532krWW7pxyiDOo00e8mCCYJhxGDhUGxTvOLaYuDk10doJgecpzs
        MaKUnyWMtuqHND4lsVtTifVYPHKLGn8=
X-Google-Smtp-Source: ABdhPJyakU5Ph9sxkfrNWT7+VQ+knnK/r6Y/uEC5lTQ5dWbgCvH+UGdn7KiwspRoPeTlo2aJLIBHyw==
X-Received: by 2002:a19:f510:: with SMTP id j16mr6635793lfb.169.1599338545035;
        Sat, 05 Sep 2020 13:42:25 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:24 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/31] Improvements for Tegra I2C driver
Date:   Sat,  5 Sep 2020 23:41:20 +0300
Message-Id: <20200905204151.25343-1-digetx@gmail.com>
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

Dmitry Osipenko (31):
  i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
  i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
  i2c: tegra: Initialization div-clk rate unconditionally
  i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
  i2c: tegra: Runtime PM always available on Tegra
  i2c: tegra: Remove error message used for devm_request_irq() failure
  i2c: tegra: Use reset_control_reset()
  i2c: tegra: Use devm_platform_get_and_ioremap_resource()
  i2c: tegra: Use platform_get_irq()
  i2c: tegra: Use clk-bulk helpers
  i2c: tegra: Factor out runtime PM and hardware initialization
  i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
  i2c: tegra: Clean up probe function
  i2c: tegra: Remove likely/unlikely from the code
  i2c: tegra: Remove bogus barrier()
  i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
  i2c: tegra: Improve formatting of function variables
  i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
  i2c: tegra: Rename wait/poll functions
  i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
  i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
  i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
  i2c: tegra: Factor out register polling into separate function
  i2c: tegra: Reorder location of functions in the code
  i2c: tegra: Check errors for both positive and negative values
  i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
  i2c: tegra: Clean up printk messages
  i2c: tegra: Clean up whitespaces, newlines and indentation
  i2c: tegra: Improve driver module description
  i2c: tegra: Clean up and improve comments
  i2c: tegra: Rename couple "ret" variables to "err"

 drivers/i2c/busses/i2c-tegra.c | 1272 +++++++++++++++-----------------
 1 file changed, 612 insertions(+), 660 deletions(-)

-- 
2.27.0

