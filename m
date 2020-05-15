Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5E51D51B4
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 16:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgEOOj2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 10:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727853AbgEOOj1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 May 2020 10:39:27 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6CFC061A0C;
        Fri, 15 May 2020 07:39:27 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l18so3837120wrn.6;
        Fri, 15 May 2020 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c0AI7exajo6fiVUs6s7O45O24ivjL3JaDYf6aB0WxVU=;
        b=cfm5u0zCY8qcsXUUBw7I6yPO91GXVNJFqK9rROLdykDwkL2YYdC150kyi052qkkQrS
         84fzm02Wg1h4vOsepFm1Q30ZYGUolcxmU1IB31boZ55N/T+6V4fpM13tZnVpeMqYaAfQ
         6rDvdpIsIKL/MffuG6VXsl72zC/KQggEp4Jo4nbpBZw44dHRKqRxOiC4jH5qYyKlwBwm
         FCtQOmEuw5YsZo0u9AVCHJ3fPv43NTtsSP6IdeuM+LYxvnmk0EwU+GTwCoYcyB8qx3Dr
         YPVQSA3vPW+h5odF7yea0lpxEXvDFbBlyj4nBDQiSo28phzTv3YetPzmqdsOHNhYhqev
         n2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c0AI7exajo6fiVUs6s7O45O24ivjL3JaDYf6aB0WxVU=;
        b=W58qTjDZFsrn+7YpD9tULbUiFGtlj3X7u7QYju9hYDA77110FY78Z15jegOVCoDM06
         4PDDwTHDQA2+p0IrT1kSE/RIOx9PhrYUcuUEMyl3e1TudsnQvXMjWhb82HUXfBlYXqZA
         IBrmTxr3NEt/pbfxGmwz6uT0PYSjm82eTWfoSkssZH9+76OLGdNWnPf49fDc4ilOukrZ
         BKO7CtcRA1giHEtncuxCgV46Y2Vu8bY9nnBYrk0EegBBc5/1Flq7N/Fctr8CVv6+m7jf
         oEaC7Pyv/QMPHghrmj+268UzNowoNRl3azrX0zCfC76kY3PgYDkfSTZy8/NNx1u7lNKw
         Qb6Q==
X-Gm-Message-State: AOAM530uTY6HWy5+HvHU/Oo4csgaOIeP3fOqKexrMI/EEhkqxFIUNlSt
        TTwlAy2O3+sGJ/6PDkL77XDrH2Lr
X-Google-Smtp-Source: ABdhPJyA83VNwFV91fTnPw0hn3TM4MdL8y4a46EV7ISjdOJ8jS4WjWDHqQcCdszaljQp2E3iekEyUw==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr4543232wrv.35.1589553565875;
        Fri, 15 May 2020 07:39:25 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id 81sm4338355wme.16.2020.05.15.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:39:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:39:24 +0200
Message-Id: <20200515143924.1579055-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:

  Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-i2c

for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:

  i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:52 +0200)

Thanks,
Thierry

----------------------------------------------------------------
i2c: tegra: Changes for v5.8-rc1

This includes a few improvements to make the Tegra I2C controller behave
properly on suspend/resume, does a bit of cleanup and adds support for
the VI-variant of the I2C controller that is used primarily for video
capture purposes.

----------------------------------------------------------------
Dmitry Osipenko (2):
      i2c: tegra: Better handle case where CPU0 is busy for a long time
      i2c: tegra: Synchronize DMA before termination

Thierry Reding (5):
      Revert "i2c: tegra: Fix suspending in active runtime PM state"
      i2c: tegra: Restore pinmux on system resume
      i2c: tegra: Keep IRQs enabled during suspend/resume
      i2c: tegra: Use FIELD_PREP/FIELD_GET macros
      i2c: tegra: Add support for the VI I2C on Tegra210

 drivers/i2c/busses/i2c-tegra.c | 248 +++++++++++++++++++++++++++++------------
 1 file changed, 179 insertions(+), 69 deletions(-)
