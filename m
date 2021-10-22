Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C65436FF4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 04:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhJVCbW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Oct 2021 22:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbhJVCbW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Oct 2021 22:31:22 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D52CC061348
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 19:29:05 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id k1-20020a170902c40100b0013f47bac4d8so1018350plk.14
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 19:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5ZMpMtjR+wLOolLwIfiGLGJ0aQUfB1I4d9AgzhjDlQE=;
        b=SMUDcX7nCULVnXJiTLztKbrv7nsnJyfQto4brqP12SZrZqIDlHUN7HpIfWrxUNAuof
         VNuf9o+sJsUy89BJbqJYJSh88KZVFT7oA7scSZgdfuHoMysrOskKowt22ya+H+bNE2bt
         7qsqNuAd8mXQyQPPBG4nLL7Pty+MZtKECe9FrIOxjzSpKMDx+kWKn+3C3lm6aV6OHW7d
         tgf9493Vi78nzGjs9ieoPjidtrct3BeAisWlxFhmqW7BUhixVWMIE32jbK+EFLWgQ8Yh
         ka5jsqSWrcygTUVRW2aMsbQGwFtJfdZu9zgwhvwlObW9Eub+Xb341Eoh1rlkHi0FfpLu
         vmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5ZMpMtjR+wLOolLwIfiGLGJ0aQUfB1I4d9AgzhjDlQE=;
        b=3gzmeVO7NiaKOlO23WubDHl1q7l8ng795qEhMqjp6tsA70CCdXGCurY9rJCzX70Vm/
         nR4C02MtV+irQBmj2vzGlMRhSNZPGAcENNLE7cQpnCVH6NZRh34joiK+dSWoFwezx3ac
         4VpPeLKAtLsQZkAPum1XCl4LRNtu/x6nBEMlJnsTN2h53Q0sK6WwVor3OenpB9JjRLX3
         9oEK8WLskRye29oB2Ds4ZZc4Bnm+UBKt7up+h7G49LdqYQqYbiytsa2a81gEAX2u/NLy
         PzIW+bWzqILUcBMfQWic00Eo58mXd9keN/J0Oz3LK4y6srsssBpBT9MZ6seD5DvvFreU
         6YoQ==
X-Gm-Message-State: AOAM5305CBMaVDuMxfd05x5BA2G6/x5YOZ6sYNyM2wlHVfmKiNHu9g9t
        Wt7CPWTP4AdC4I4OQACkwOofnJDMJ2eB
X-Google-Smtp-Source: ABdhPJwtLEwAqBwXo0oxWaUpZCjXEkUjOPQSDHYzyzqFzbJOeWVgvxOVF7Io8wGY6faM+UgPKsjXdcI6RGOG
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:cc25:d9a3:4b5:37b9])
 (user=rajatja job=sendgmr) by 2002:aa7:8bd3:0:b0:44c:68b3:a52e with SMTP id
 s19-20020aa78bd3000000b0044c68b3a52emr9578300pfd.74.1634869744744; Thu, 21
 Oct 2021 19:29:04 -0700 (PDT)
Date:   Thu, 21 Oct 2021 19:28:56 -0700
Message-Id: <20211022022859.1888836-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH 0/3] i2c: Enable async resume for i2c devices
From:   Rajat Jain <rajatja@google.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dtor@google.com
Cc:     Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com,
        dbasehore@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PM Core allows buses and drivers to specify if they'd like their devices
to suspend/resume synchronously or asynchronously. When resuming:

1) SYNCHRONOUS DEVICES:
 - All synchronous devices (system wide!) are resumed in a single thread,
   serially i.e. one after the other. So their resume latencies add up,
   and also, this results in unnecessary and unnatural waiting order.

   In my current system (total resume time ~895ms) and this is the trend
   on almost all chromebooks in the past 3-4 years (we carry patch3 in
   our tree already, without which it would be even more worse):
   https://rajatxjain.github.io/public_shared/resume_before_patches.html
   As you can see I2C devices do not even begin to resume until 450ms,
   waiting unnaturally for another device i915 to finish resuming: 

   I2C touchscreen device (resume latency = 374 ms) - asynchronous
   -> (waiting on) I2C adapter resume (synchronous)
     -> (waiting on) Designware resume (synchronous)
       -> (waiting on) intel_backlight resume (synchronous)
         -> (waiting on) its PARENT i915 resume (asynchronous resume
                                                       time = 376ms)
   As you can see the two biggest resume routines are both run serially
   after one another (even though they don't have any real dependency)
   thus increasing the system critical resume path. If we can run them
   concurrently, we can cut down the system resume time considerably. 
 
2) ASYNCHRONOUS DEVICES: 
- On the other hand, all asynchronous devices's resume routines are
  scheduled so they can run in parallel with other asynchronous
  routines. PM core still ensures for both async/sync devices that:
   - All parent child relations are honored.
   - Any device dependencies are honored. Device dependencies between
     any 2 unrelated devices can be specified using device_link_add().
   - Async resume devices are sychnronized at the end of each
     suspend/resume phase, before moving onto next.

   With these patches in place, the I2C devices can resume in parallel
   with i915: 
   https://rajatxjain.github.io/public_shared/resume_after_patch.html

As far as I understand, the only reason we might not want a device to be
marked for asynchronous resume is if we suspect it cannot handle
concurrent resume with other devices, which does not look to be the
case. 
    
This patchset marks the designware, the I2c adapters, and the i2c 
clients for asynchronous suspend/resume. In case it helps to gain any
confidence, the patch 3 (for i2c clients) has been included and shipping
on all our chromebooks for the past 3+ years, and has not shown any
issues. The designware and i2c adapters should be easier.

Derek Basehore (1):
  i2c: enable async suspend/resume on i2c client devices

Rajat Jain (2):
  i2c: designware: Enable async suspend / resume of designware devices
  i2c: enable async suspend/resume for i2c adapters

 drivers/i2c/busses/i2c-designware-platdrv.c | 2 ++
 drivers/i2c/i2c-core-base.c                 | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.33.0.1079.g6e70778dc9-goog

