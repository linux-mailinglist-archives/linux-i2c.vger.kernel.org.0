Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9089025B7BE
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgICAx6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgICAxy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:53:54 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99866C061244;
        Wed,  2 Sep 2020 17:53:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so1389518ljk.8;
        Wed, 02 Sep 2020 17:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qylbbxDeujcNpZUTYAjA2yZlUNQWDGVnkYFR/BCLA8E=;
        b=aDfGKi273R2hdEUH5U08izM8jrgDxe+4nXW0/YxP8seZbeemJsKDm6MJ6Y8etuOyoZ
         89L0CeDv+diO/PPoHv2X6dNnKCqHt7MUNTZgdiAfPa/mPBkx7HM1hcO6DrUjFqFr1szj
         70OiGIQb8/2/OrNrnd4YznCI2XcIxnSsAcz9MrSrXbSz8o2z4DD8cLcboxd6+KDXEd6b
         uEj1ehP7T9nI6AKOCpW5jaSpyexpO/8Zf3Iw2kuL9i2vKJSbQtk8+QrbUf8SbguEAWXp
         +ZCPOSEYgmUCfcN5g6PXxfD+1g6LtiMQLmYiObdOxdEt3LUEohnJJ5nJRJaDCpFUyb5E
         C5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qylbbxDeujcNpZUTYAjA2yZlUNQWDGVnkYFR/BCLA8E=;
        b=RHeUuhvtCK7aeemT6tS34uMFKa1RzZ/UfTrVVJaIx8M/x/k+KXDjHjxvwTMkDGKl/D
         1+TdPnbINhcJ8Vz1NgwRAh0dgHaKmzzaxFGwEZQpJ2nAlNPIWDuZdODBVlvCVB/ThaFY
         7LxEIKyfYyQEvnXdUVl8pGvIkBtXh9SSGRTzfbtcprPQGsTMkk6CLCffvGurbIxtFg/G
         09Soxdsau7WFN0foY4nwZIjDWoIzjI7xGD6encF5CdQCk9JWa9rl9OwgFE4Mbl156KqD
         9J02xO9xUb3QFMFxFFSL7X5WG5F7+9n2lj87Nw/1fKSw9bhlCEBOqVUEhBnoTghEtAZe
         H/Yw==
X-Gm-Message-State: AOAM533sfMqouQSIqiCQBuDOTM6jZqZN6LjQ3BedaZIsfiN1sqNplNrH
        I/fimw5bOJvGBgwTnqdzOKY=
X-Google-Smtp-Source: ABdhPJzqcI+SEmxok8UGThkgXfQR0Kd6Eu2hoPFU41SGTwuYvYs/ZO4TkJ3aiBd7hAc6pV4llYNLWg==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr283482ljl.426.1599094430437;
        Wed, 02 Sep 2020 17:53:50 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/22] Improvements for Tegra I2C driver
Date:   Thu,  3 Sep 2020 03:52:38 +0300
Message-Id: <20200903005300.7894-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello!

This series performs a small refactoring of the Tegra I2C driver code and
hardens the atomic-transfer mode.

Changelog:

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

Dmitry Osipenko (22):
  i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
  i2c: tegra: Add missing newline before returns
  i2c: tegra: Clean up messages in the code
  i2c: tegra: Don't ignore tegra_i2c_flush_fifos() error
  i2c: tegra: Use reset_control_reset()
  i2c: tegra: Improve formatting of function variables
  i2c: tegra: Use dev_err_probe()
  i2c: tegra: Runtime PM always available on Tegra
  i2c: tegra: Clean up probe function
  i2c: tegra: Drop '_timeout' from wait/poll function names
  i2c: tegra: Remove likely/unlikely from the code
  i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
  i2c: tegra: Check errors for both positive and negative values
  i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
  i2c: tegra: Clean up whitespaces and newlines
  i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
  i2c: tegra: Improve driver module description
  i2c: tegra: Reorder location of functions in the code
  i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
  i2c: tegra: Remove "dma" variable
  i2c: tegra: Initialization div-clk rate unconditionally
  i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member

 drivers/i2c/busses/i2c-tegra.c | 1327 ++++++++++++++++----------------
 1 file changed, 684 insertions(+), 643 deletions(-)

-- 
2.27.0

