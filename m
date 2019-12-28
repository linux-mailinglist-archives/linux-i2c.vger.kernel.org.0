Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684B512BF61
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2019 23:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfL1WRV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Dec 2019 17:17:21 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42736 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfL1WRV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Dec 2019 17:17:21 -0500
Received: by mail-lf1-f65.google.com with SMTP id y19so22970119lfl.9;
        Sat, 28 Dec 2019 14:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nuzguGEp6SKMhRITuf55WAAlQaxvWsawjdi2BZH0byQ=;
        b=rQ01ZU88r62UWd1XanHqIJQT3RnLqG73mGPzPxRd13qwo79fx5hkaj5MLFgpI9YYLe
         akNrp+R6QJ6vR4hjLapriLtqZSh0YsNPhDAlK9DSlBjrYjUNY/EUMpqG25vmovGzoB5E
         MhdIDEAlIbdweooE0uOxyyrR/2hZhCZzhvI8cCnnw4WckZyPGS1qaZXEIxqMIHkoGB6F
         zV2qDSAJVYD8nEIXjdComNhUP/+x006GRcpJ7vmU+fQR4yRbzDhHOboz6SIY45mQZ4k7
         1cXIt7+aYpZOB95vYuEcpLj5+yM7L3N6D+mHnLdLnqp85KU3mscvhEKFyTBqB+CW2x4i
         QlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nuzguGEp6SKMhRITuf55WAAlQaxvWsawjdi2BZH0byQ=;
        b=i+Oj5uyG+OyBWOSZNFFnRvx4OTA8oucFQrGkb2BBWHNBhDtLF9phIpBgWap0nqNDFe
         dXQfvpS2oj/KwK0B2b2QJr2nRMiKPwwbQNhsKRTsits/WT7JJWip/dOqm88qnqeSxCoN
         vZtTDk2L40t++gnQxP+CoMfuMiMtjk+o0j/UL2HL+Ragcwy8RqVjwuhTTTQFkK4FUuMX
         kTAZknXV1IjdV5rgYwqR222lVZApEXxNftMSowLklEjiqrD2AMeDCMGYZlawHp3cGKJj
         3T3dFY1sMjvx9yoQaUOzh3V0iTo47hPsv1hFxgKESmCg0BY3RpJXbY0cYc3jPeze716P
         4VOA==
X-Gm-Message-State: APjAAAUNShxwdTFnjzPbGdMoo3svgefgu2pLu+dagZgcMI36SE2I+0JR
        gh3o1+4T3a3cWHK2jyfuTZY=
X-Google-Smtp-Source: APXvYqyMZiBPobZnJA5MXR9Yn9ejRgoVYfpNWWV8bzsy3V4gVjHfdnkLWBnZJ1nN8q7bPcTJtfRs1Q==
X-Received: by 2002:a19:7604:: with SMTP id c4mr33768997lff.101.1577571439197;
        Sat, 28 Dec 2019 14:17:19 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y10sm15209584ljm.93.2019.12.28.14.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 14:17:18 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] NVIDIA Tegra I2C driver fixes and improvements
Date:   Sun, 29 Dec 2019 01:16:48 +0300
Message-Id: <20191228221654.28842-1-digetx@gmail.com>
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

Dmitry Osipenko (6):
  i2c: tegra: Fix suspending in active runtime PM state
  i2c: tegra: Properly disable runtime PM on driver's probe error
  i2c: tegra: Prevent interrupt triggering after transfer timeout
  i2c: tegra: Support atomic transfers
  i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
  i2c: tegra: Use relaxed versions of readl/writel

 drivers/i2c/busses/i2c-tegra.c | 198 ++++++++++++++++++++++-----------
 1 file changed, 134 insertions(+), 64 deletions(-)

-- 
2.24.0

