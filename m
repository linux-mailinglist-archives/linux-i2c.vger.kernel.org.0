Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A137E43A5F0
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 23:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhJYVh7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 17:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233569AbhJYVh6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 17:37:58 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD37C061767
        for <linux-i2c@vger.kernel.org>; Mon, 25 Oct 2021 14:35:36 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id f9-20020a056a001ac900b0044c4f04a6b1so7170253pfv.23
        for <linux-i2c@vger.kernel.org>; Mon, 25 Oct 2021 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=IsG+1m99AvoR1yZKJQrlzvDKdWHsv+YhZuLrk/U7nqM=;
        b=nb3VuU7Ntj1eqgLyfUJOmSueS+kzxRn5xRwY2HECFl95yc1ZFK+33rTVSGkm5KfuYY
         adNJ7rNi0AiA209QwvG6tbsGzzvPOVTZZKPdFHfXOEllvEjM4Bx5sGSe4m+euxR6plwK
         oZPIfDsk8DuutC6BSByCbYpo1UVU5yYINtqZWEwqmK4sKpPskC0y4DR9tLLWCo1c+Qa4
         gxa9PwtlkKpe+ke0HbEqiUVMJQgWdCM4me3E3AZMBF4Jxkz9irB8lW4RExijrsIx8a2p
         AYlatBnzdMBxWZZY3O4urwqHW561D0s7fUlKTosWiWk4pr8fgUKCpj079qfn/6vCizpO
         6Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=IsG+1m99AvoR1yZKJQrlzvDKdWHsv+YhZuLrk/U7nqM=;
        b=yKq9EeIaAbrU2sGSw25Rq/7B6/s8CVL+94rn3HHTWuLw68l1UJXZIo8eyFh/KrK0rS
         Qba5XKEnusV5szULM7fprmAZ2vNSDV1CnfaOvfR/EAvN5IqwVE7eclJCcfljNk32uMoe
         5+EnEsEiuLDdi8FCutya4eOd6pei2FSdl4vmN/M3WwuccDGaXS2sliq07pyasB2zF7uD
         jWkpqukugcDAxEjoeu/HsPrG5jxlu18TqLXbcxnbDBBK8tfMAAw8hSDUw3ojWXc76hSe
         8Iag/u6DQh0VKgMOs2pgT9HaoBP4CMCkzY6cmBHgeCjxpv2ZxF80911Eu5Y+k60mRIF3
         woyQ==
X-Gm-Message-State: AOAM532hqkutwy8ZIeN84ZqsSbwGZLk9iJIzNbhP6Wvq/gklLnYHDCzD
        j1ZSpQVUPvsDxKImm2LhVI6+cOUHCFGx
X-Google-Smtp-Source: ABdhPJzES92KcEzUjQonpDW/7/i9OxpiiGezgo7YKMv28uo46LmDd7nvnKJGsZ+zBG+xuEvbLNeZmcJFh/+9
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:5478:3d15:6893:1074])
 (user=rajatja job=sendgmr) by 2002:a17:90a:eb18:: with SMTP id
 j24mr22613368pjz.196.1635197735729; Mon, 25 Oct 2021 14:35:35 -0700 (PDT)
Date:   Mon, 25 Oct 2021 14:35:28 -0700
Message-Id: <20211025213532.2349161-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 0/3] i2c: Enable asynchronous suspend/resume
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

(The only change in v2 is to add Jarkko's ack / tested-by)

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

