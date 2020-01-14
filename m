Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9503139F03
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 02:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbgANBgz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 20:36:55 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33439 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgANBgz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 20:36:55 -0500
Received: by mail-lj1-f194.google.com with SMTP id y6so12424461lji.0;
        Mon, 13 Jan 2020 17:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uF6UZR9f3d7Yjfa9laRfwCmmuu+6naaxEbh0ObEw+mQ=;
        b=a1IOONMcSxwSEnPv31PMEX52cvRNGbv7QC0r74+O6Z4J/hTF/zARnxXVrWcjDmxEBv
         C2WmQnOFMM9qNfKr3I/0jNqDwukNTMY7MaTfbq4s6sQhqu6VEdN1ofb3PJQ8XJP0ASrt
         HVrIAB4s9e6oJ7Z15ly49Urj6isu4a4RyIBzY0zNYUeT32YPcAa/Fp2xZCu3qRV2IPo7
         dAkayLuXozFB+VqilSSDWBx/OdSK+z4LV6bV4C0yT3TMqzpGLe/F9LVN8g/T7VbY+k68
         oc54Vx1ZzX+2B3uH4nCne3ffNW6bMxXpS567JR3F/IfbiZJu6Bqdc92Ao4R3MqmYf0NF
         0d/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uF6UZR9f3d7Yjfa9laRfwCmmuu+6naaxEbh0ObEw+mQ=;
        b=Ms9Rkp/DNzvtMv1f6w0jToDvmF9ZSALf5MklUJhJl4lFyXLqJN/rhFOH2pZvJP+mc0
         9DFnXB2j73mqKvfDAbc8+mZPMMl0UH54wWA7XohopbcIO8YcH9qXh1ThtiL8iuUxisjG
         GCNSlfGY1hlXdN5OUgFlF0xUmf0uDkOJVdenwiyYDUwyNOyu7pp0Q9oSDz3eJfedpQ5W
         3l992lLnmet/PyPk5pZrBEYTVf/bZPcBtxusLsKa5pP5pY9YoT7JLbrLqZB9J1nD2l9N
         FS+YNQCZam9Qqmo6DE3Ub2+kfYiFm18NvcyaCb9DmeP6xzC5GCp4UcKdSUZC9iLI37BK
         l50Q==
X-Gm-Message-State: APjAAAUkO2FIVeZjyjA4/YOyi/1L8XjvFojZeTh1rRgja4SNeObPzkgX
        iYomYO2th3RkcYN12OPGNn4=
X-Google-Smtp-Source: APXvYqy47LEIr5xWPc77nLKWS+AxL6vpFOpdeIeKV/gicbCiBcQaR2/2WEpjBkuMjdSQuC5Mrf8btQ==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr11843091ljk.163.1578965813355;
        Mon, 13 Jan 2020 17:36:53 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m189sm6427627lfd.92.2020.01.13.17.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 17:36:52 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/8] NVIDIA Tegra I2C driver fixes and improvements
Date:   Tue, 14 Jan 2020 04:34:34 +0300
Message-Id: <20200114013442.28448-1-digetx@gmail.com>
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

v5: Improved commit message of the "Support atomic transfers" patch,
    thanks to Wolfram Sang.

    Added explicit stable tags to these patches:

      i2c: tegra: Fix suspending in active runtime PM state
      i2c: tegra: Properly disable runtime PM on driver's probe error

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

