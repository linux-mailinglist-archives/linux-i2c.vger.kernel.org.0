Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2C26130B1F
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 02:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgAFBEi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 20:04:38 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34319 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgAFBEi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 20:04:38 -0500
Received: by mail-lj1-f193.google.com with SMTP id z22so44450094ljg.1;
        Sun, 05 Jan 2020 17:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QxF8C0j9F49gnuQnqiXYtzEnYCy8UEVeDogjGha9Yck=;
        b=uuIx2EBwoqFST1NYsHXBHvRXW5xqvyvly8yOpweMd2yLLSsLqS0pvgsjYKgeGpsr0t
         XgnnkX+FA1FiqsplnCH28FUDFq2Fq39385Cvuyw84RX2xDF8GSVONY9WDgk6agFtlvlR
         f8swnKVoihPMrHwOy4OjGO69FufyvEQpAomgsPVu/ROPFpH0q+miGbFNnkCe0QO7E5b9
         1NDusaR15BtNHS577X/3EpeKT5fDTE4bWPRJxcmqmbcC5VDaXNYG0qYWT9bTpO9rVer6
         DKwtxVlSfRmu59Ql/qIPtRO+7mr99olGcWK8URVPgHBTKxVy+B2kHGutAI/j5YUbYx06
         h2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QxF8C0j9F49gnuQnqiXYtzEnYCy8UEVeDogjGha9Yck=;
        b=A3xdTZ4W5bEzWxuofznqRLM8xvCs6wYGOoLFTGKCJhBihk3I9WjRnwH5mg5EJqGWn/
         dXLYDwCqvU7k0XDCUF5sYN/cpHiwyGCLmpseVES+ou/47JVpRVcCDDWHKbA0NHqpd3Ju
         7RLYR7srdc68LV2qGkyXUuEebh5m5YQ5tc8d3xUizwUXz0EcX8uBXysoySWOsz+jIl3b
         TK/IPRmK2OJPizv6cWQ+1193/DYLNtN7WD3i9n/6jddMRPnhMBSXMAt8NXv/uxTAj5xO
         RkvZC/nZh1Z8FZJ9PbVRcqKSuoznv9hA7q43NjEnojYWqXZSs/0V+gxMFeKQf8snd+17
         NWNQ==
X-Gm-Message-State: APjAAAWL7jsnFO4F4CUJcTzGiuVblEhMNPx6rAjVb4c9gDRwckFLaD4M
        x1/PJ7A37z6ST4j8rlKIbzMqdeXa
X-Google-Smtp-Source: APXvYqyv0Lk57XfSlq6yKa9c3shlzDOX5JRBVr4/t344WMkf8y2uwsxOUcVO3elYPcxy4967fhFC7w==
X-Received: by 2002:a2e:2e12:: with SMTP id u18mr32480900lju.36.1578272675987;
        Sun, 05 Jan 2020 17:04:35 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a19sm28245910ljb.103.2020.01.05.17.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:04:35 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] NVIDIA Tegra I2C driver fixes and improvements
Date:   Mon,  6 Jan 2020 04:04:14 +0300
Message-Id: <20200106010423.5890-1-digetx@gmail.com>
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

Dmitry Osipenko (9):
  i2c: tegra: Fix suspending in active runtime PM state
  i2c: tegra: Properly disable runtime PM on driver's probe error
  i2c: tegra: Prevent interrupt triggering after transfer timeout
  i2c: tegra: Support atomic transfers
  i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
  i2c: tegra: Use relaxed versions of readl/writel
  clk: tegra: Fix double-free in tegra_clk_init()
  i2c: tegra: Always terminate DMA transfer
  i2c: tegra: Check DMA completion status in addition to left time

 drivers/clk/tegra/clk.c        |   4 +-
 drivers/i2c/busses/i2c-tegra.c | 216 ++++++++++++++++++++++-----------
 2 files changed, 147 insertions(+), 73 deletions(-)

-- 
2.24.0

