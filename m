Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F04FB13874A
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2020 18:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732957AbgALRRl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jan 2020 12:17:41 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36390 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728734AbgALRRl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jan 2020 12:17:41 -0500
Received: by mail-lf1-f68.google.com with SMTP id n12so5139868lfe.3;
        Sun, 12 Jan 2020 09:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zXWAvdz7wW5k7arXqaVV09f4qfYqBHJ7yY/UDQRK7X0=;
        b=JBysCpnLo//cdrc9SODmOZD6XDhnggf53eRtTtC/uXjx681/uN+3Ydxn5kuzy14PQE
         myE58cY5FRYUPm0Y/97CBW+VpkLtYzga0MODttCHKLMm4MnNTZwNLrKmuvhWCQkd9erZ
         U86wRW4AUB+aE5wYZWxLKlx1RZBu4v5+28ygxCEaiDn7niCMHc3D6oAkGUjsBJNVbd6D
         36lTZ6BNqweB/fZLfXk9ZgXHul7meYAOVRU1UU6DMXaRpsarnXYseFmGyYfsOdV4MQde
         00GWma/Id017fTS9J4O3gCivzUcNKNvPJewCK0x2puT197e2LWfBSJP/qL8927Gve4I/
         z3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zXWAvdz7wW5k7arXqaVV09f4qfYqBHJ7yY/UDQRK7X0=;
        b=E5wVWwXOuqKedWekNnadUy8bu4bvNtSDNt0he6Jw2QuqvC5mG5pe9w9bSBYtxog74U
         ZKb1YLycxArVI8VfAf5X0sJp5RnUDEh6a1ZhcDFZyqX9SpIO/1ub8ez3v5GxOsLyP/Lx
         aIeMV3f1Ddoe/lILbUtZQ62CERntLoDizeDOSJKcoL9h7xwliijHmqPJqOho3Q1gYtft
         bhlXiuivn10D8TjqfA0dWCuU6JXYEPbGOunABl5xx8hZrEe5dTlwMpdKdVkgZ4jKsAAu
         denyh3vRWXALp+bhBEd531sCp0Mn5nLjsmUtHQewezowjZk71PCMWSE2nT3ySg+pHehy
         u++A==
X-Gm-Message-State: APjAAAW+7lp+ut20WsoeUOGogAUC75m/yZ5IvtwyoQslucApBwCzJ8tU
        Pr1sQLNFx+WxxeyteNKy+1o=
X-Google-Smtp-Source: APXvYqwcktwCb23rk+XJigyB1hKLrKjpp4iMqIKMmaF8yZ7ruzyZDuOAVKQPNEUDkF3CQREGWrq5Fg==
X-Received: by 2002:ac2:59dc:: with SMTP id x28mr7480599lfn.38.1578849459358;
        Sun, 12 Jan 2020 09:17:39 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id i13sm4506628ljg.89.2020.01.12.09.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 09:17:38 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/8] NVIDIA Tegra I2C driver fixes and improvements
Date:   Sun, 12 Jan 2020 20:14:22 +0300
Message-Id: <20200112171430.27219-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

This patchset adds support for atomic transfers which are required for
shutting down machine properly. Secondly, a (not)suspending I2C and some
other things are fixed/improved by this small series as well. Please review
and apply, thanks in advance!

Changelog:

v4: Removed the "clk: tegra: Fix double-free in tegra_clk_init()" patch
    from this series, which was added by accident in v3.

    Added Thierry's tested-by to the patches.

v3: The "Prevent interrupt triggering after transfer timeout" and "Support
    atomic transfers" patches got extra very minor improvements. The
    completion now is passed directly to tegra_i2c_poll_completion_timeout(),
    for consistency.

    Added two new patches that firm up DMA transfer handling:

      i2c: tegra: Always terminate DMA transfer
      i2c: tegra: Check DMA completion status in addition to left time

v2: The series is renamed from "Tegra I2C: Support atomic transfers and
    correct suspend/resume" to "NVIDIA Tegra I2C driver fixes and
    improvements" because it now contains some more various changes.

    New patches in v2:

      i2c: tegra: Correct unwinding order on driver's probe error
      i2c: tegra: Prevent interrupt triggering after transfer timeout
      i2c: tegra: Use relaxed versions of readl/writel

    The "Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN" got an
    improved wording for the code's comment to I2C_PIO_MODE_PREFERRED_LEN.

    The "Support atomic transfers" also got some very minor tuning, like
    s/in_interrupt()/i2c_dev->is_curr_atomic_xfer/ in dvc_writel() that was
    missed in v1.

v1: The "i2c: tegra: Support atomic transfers" previously was sent out as
    a separate patch, but later I spotted that suspend/resume doesn't
    work properly. The "i2c: tegra: Fix suspending in active runtime PM
    state" patch depends on the atomic patch because there is a need to
    active IRQ-safe mode for the runtime PM by both patches.

    I fixed a missed doc-comment of the newly added "is_curr_atomic_xfer"
    structure field and added additional comment that explains why IRQ needs
    to be disabled for the atomic transfer in the "Support atomic transfers"
    patch.

    Lastly, I added a minor "i2c: tegra: Rename .." patch that helps to
    follow driver's code.

Dmitry Osipenko (8):
  i2c: tegra: Fix suspending in active runtime PM state
  i2c: tegra: Properly disable runtime PM on driver's probe error
  i2c: tegra: Prevent interrupt triggering after transfer timeout
  i2c: tegra: Support atomic transfers
  i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
  i2c: tegra: Use relaxed versions of readl/writel
  i2c: tegra: Always terminate DMA transfer
  i2c: tegra: Check DMA completion status in addition to left time

 drivers/i2c/busses/i2c-tegra.c | 216 ++++++++++++++++++++++-----------
 1 file changed, 144 insertions(+), 72 deletions(-)

-- 
2.24.0

