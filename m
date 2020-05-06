Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290021C7A53
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgEFTeG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgEFTeF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:34:05 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4CAC061A0F;
        Wed,  6 May 2020 12:34:05 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u16so4052619wmc.5;
        Wed, 06 May 2020 12:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9D6oNG0nQTVus9s0l31f/0wkiUo4Y4bT1cP0LflnM98=;
        b=u9F0q4tWO0oAD/hbl9EEEnA7HTrIi7lOUTxqlyTgZSNpIy8MuI59YsEo5345QcuWtc
         pdp3xOuudx/yY3EtZGQdwOiv5i+rLKNBlt90KAJmc/8fG3I1doO7wWOKqHkHXvjw9lHJ
         eGijsGQH8Y7k313e4jdsr9yjBctCPFCmyAXsGku4ZBGI/lHObyiaVwacHJfYnM83t41O
         JTnG52bGj61ML6QTes9FJZgtqenkoSVNgTRjg1kwpRP9c4A31BH6s6B0bAhzLH27czfE
         bkHRRxX0WN2ax9GVYdSGD1NZx9qFI0cUIAXwiw3U/Z/mzmRTjVDoc7QQFcv4747Obbu6
         5+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9D6oNG0nQTVus9s0l31f/0wkiUo4Y4bT1cP0LflnM98=;
        b=l/N3if6GtYkxuukR900z9PpGBW/8uhIkFHvBo1NwIeV59MrwHzuXb7+OeJVpTHcaHL
         MOVHmGBja/YA1toTbv91ZyM3tltpEKzWQztlsVTRGfXDPwg2Y3/ldtb3LcP7agrKgxQn
         oqeQMm4i9zuQO29ge1pkaBYdv/Q+M/HeK3qF2aGEYGD2ypVdMxwDBpFx3HY7Z06WjRay
         OH1jQoCD2QL7jF84WYZVEXJmjXZaRl73N46MU7yIIGwwkQ8yWG/B9tlTTYnSASGKM+aJ
         13Kfci0pVUo0+G7QpQnTEydGtbectUhWHiCN9br4tYr6LnnROXxjjLJSlJMJw2+89mQ6
         /riQ==
X-Gm-Message-State: AGi0PuYC4MUNrLKE35/79u09s4dFiBUloAxp4GgHE4YdRhy7toNymJTH
        y5BmPUoJBKQMZ49vKanhrSI=
X-Google-Smtp-Source: APiQypL83OjpJgf1PxNj2UNXSsAfKHX0G2w2G8/q3qjQRANwtCTbUiI8iwYzy1kcq+z9Rp2xhJ751g==
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr5820803wmi.57.1588793643902;
        Wed, 06 May 2020 12:34:03 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id u127sm4549430wme.8.2020.05.06.12.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:34:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 0/5] i2c: tegra: Various fixes and improvements
Date:   Wed,  6 May 2020 21:33:53 +0200
Message-Id: <20200506193358.2807244-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Wolfram, Dmitry,

here's the full set of patches that I've been running local tests on and
which looks like it has no other issues. I'm going to run this through
our internal test system to make sure there aren't any regressions. I
can carry these in the Tegra tree for a little bit until we're
reasonable sure that these patches are all safe to apply and then send a
pull request sometime next week.

I've also included a patch as suggested by Dmitry to keep I2C interrupts
enabled during suspend/resume and I'm currently checking if that may be
a fix for a suspend/resume issue that I've seen on Jetson Nano where we
don't have working suspend/resume yet.

Thierry

Dmitry Osipenko (2):
  i2c: tegra: Better handle case where CPU0 is busy for a long time
  i2c: tegra: Synchronize DMA before termination

Thierry Reding (3):
  Revert "i2c: tegra: Fix suspending in active runtime PM state"
  i2c: tegra: Restore pinmux on system resume
  i2c: tegra: Keep IRQs enabled during suspend/resume

 drivers/i2c/busses/i2c-tegra.c | 61 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 26 deletions(-)

-- 
2.24.1

