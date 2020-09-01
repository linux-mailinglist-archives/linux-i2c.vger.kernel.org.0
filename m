Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEAC25A0AA
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgIAVL3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbgIAVL1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:27 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C105C061244;
        Tue,  1 Sep 2020 14:11:26 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b12so465793lfp.9;
        Tue, 01 Sep 2020 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=84MPreMuR2/T3yIOiZ/2P9Fj1HLxAFnVjtsguhtVnHk=;
        b=jZO9hYcymOzuenDVMRBEJxSwecPQAP9LrYB5scHsZVAR+SqLC1rNtGtRXEBwH1f/Cp
         UW5PQJdA3aA+6OxbegLO6K7YaW+wFxycI9/jDwz/M4B8MVG2pEml41g1J5ZcUw11mLCt
         EBxrGpmNDJBLKCbcXnE+2ZkKrJKh1obCgNipXb4mwglYjyL/kdmW9EJwdQv9uqUZ1YRT
         jp8MRuXR6+wHi6hkMDlosCM1R4TAinP7ZHgb8Nhx/53XAx39ukkBCv8n9u7n0tcCkhMX
         /BteBL8BhbgJYZDIfKZDf76Bx3bvQJ7zivpOweYXFDVBviE5grHoRBXztc/0RQyyzLqg
         TK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=84MPreMuR2/T3yIOiZ/2P9Fj1HLxAFnVjtsguhtVnHk=;
        b=PbkMAIiyCxPedV4VOvBDGmaG2ubR6uMPWiW+hpGIQs+Mi3SZETXZjrZgpRzQuzdq6b
         +JidjcaBOycHiAEO4+AWtKtihTC6YGCX20POqoVNFz1G9uh0xcE7tUZXU6Vvps1jKzyr
         MfheGQzaXMmGkXAyPPINJ9+z8SKkoGfPA6zolEVPz2Ix5rSBt76vEJLK7PUmb6hqyEsB
         Gby0PChBah1PtSR+UZTPFwJ1AGWC7SzKh+i7HrMON5WLTksHoG0Nu4WCrp/tNSG26a2I
         7z+zrkKO518QMTaXefK/yoU+Dud5F0RdPKW0XJRxCnFHRo7OrJX3BByXp5byh/IACOar
         RNhQ==
X-Gm-Message-State: AOAM533OQe3+Tin9a1m1SjCOUWC4fYI2GmjjtEUYGPYgxfA7RRz0ZvFo
        rF9jK2fyIsf09EBVW9fZGjs=
X-Google-Smtp-Source: ABdhPJx6UYt5kPQ7boJpEv3lj8V4IiEwS52R1CZ2imLoJEADp0rp1OMFFh89lPObOv8y0TbZftqmwg==
X-Received: by 2002:a19:f245:: with SMTP id d5mr1545418lfk.97.1598994683653;
        Tue, 01 Sep 2020 14:11:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/17] Improvements for Tegra I2C driver
Date:   Wed,  2 Sep 2020 00:10:45 +0300
Message-Id: <20200901211102.11072-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello!

This series performs a small refactoring of the Tegra I2C driver code and
hardens the atomic-transfer mode.

Changelog:

v2: - Cleaned more messages in the "Clean up messages in the code" patch.

    - The error code of reset_control_reset() is checked now.

    - Added these new patches to clean up couple more things:

        i2c: tegra: Check errors for both positive and negative values
        i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
        i2c: tegra: Remove unnecessary whitespaces and newlines
        i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
        i2c: tegra: Improve driver module description

Dmitry Osipenko (17):
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
  i2c: tegra: Remove unnecessary whitespaces and newlines
  i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
  i2c: tegra: Improve driver module description

 drivers/i2c/busses/i2c-tegra.c | 686 ++++++++++++++++++---------------
 1 file changed, 379 insertions(+), 307 deletions(-)

-- 
2.27.0

