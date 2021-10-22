Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E242143762E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 13:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhJVLxX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 07:53:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:52331 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232670AbhJVLxX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Oct 2021 07:53:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="210078066"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="210078066"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2021 04:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="663160687"
Received: from mylly.fi.intel.com (HELO [10.237.72.159]) ([10.237.72.159])
  by orsmga005.jf.intel.com with ESMTP; 22 Oct 2021 04:50:55 -0700
Subject: Re: [PATCH 0/3] i2c: Enable async resume for i2c devices
To:     Rajat Jain <rajatja@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dtor@google.com
Cc:     rajatxjain@gmail.com, dbasehore@chromium.org
References: <20211022022859.1888836-1-rajatja@google.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <f3bdb094-cd7d-dc44-e5f2-808395c42932@linux.intel.com>
Date:   Fri, 22 Oct 2021 14:50:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022022859.1888836-1-rajatja@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/22/21 5:28 AM, Rajat Jain wrote:
> PM Core allows buses and drivers to specify if they'd like their devices
> to suspend/resume synchronously or asynchronously. When resuming:
> 
> 1) SYNCHRONOUS DEVICES:
>   - All synchronous devices (system wide!) are resumed in a single thread,
>     serially i.e. one after the other. So their resume latencies add up,
>     and also, this results in unnecessary and unnatural waiting order.
> 
>     In my current system (total resume time ~895ms) and this is the trend
>     on almost all chromebooks in the past 3-4 years (we carry patch3 in
>     our tree already, without which it would be even more worse):
>     https://rajatxjain.github.io/public_shared/resume_before_patches.html
>     As you can see I2C devices do not even begin to resume until 450ms,
>     waiting unnaturally for another device i915 to finish resuming:
> 
>     I2C touchscreen device (resume latency = 374 ms) - asynchronous
>     -> (waiting on) I2C adapter resume (synchronous)
>       -> (waiting on) Designware resume (synchronous)
>         -> (waiting on) intel_backlight resume (synchronous)
>           -> (waiting on) its PARENT i915 resume (asynchronous resume
>                                                         time = 376ms)
>     As you can see the two biggest resume routines are both run serially
>     after one another (even though they don't have any real dependency)
>     thus increasing the system critical resume path. If we can run them
>     concurrently, we can cut down the system resume time considerably.
>   
> 2) ASYNCHRONOUS DEVICES:
> - On the other hand, all asynchronous devices's resume routines are
>    scheduled so they can run in parallel with other asynchronous
>    routines. PM core still ensures for both async/sync devices that:
>     - All parent child relations are honored.
>     - Any device dependencies are honored. Device dependencies between
>       any 2 unrelated devices can be specified using device_link_add().
>     - Async resume devices are sychnronized at the end of each
>       suspend/resume phase, before moving onto next.
> 
>     With these patches in place, the I2C devices can resume in parallel
>     with i915:
>     https://rajatxjain.github.io/public_shared/resume_after_patch.html
> 
> As far as I understand, the only reason we might not want a device to be
> marked for asynchronous resume is if we suspect it cannot handle
> concurrent resume with other devices, which does not look to be the
> case.
>      
> This patchset marks the designware, the I2c adapters, and the i2c
> clients for asynchronous suspend/resume. In case it helps to gain any
> confidence, the patch 3 (for i2c clients) has been included and shipping
> on all our chromebooks for the past 3+ years, and has not shown any
> issues. The designware and i2c adapters should be easier.
> 
> Derek Basehore (1):
>    i2c: enable async suspend/resume on i2c client devices
> 
> Rajat Jain (2):
>    i2c: designware: Enable async suspend / resume of designware devices
>    i2c: enable async suspend/resume for i2c adapters
> 
I did a quick test to these three patches on one system. It has i2c-hid 
compatible touchpanel and touchpad on separate I2C buses. Nothing 
exploded but I don't know does it qualify as comprehensive test for 
Tested-by. Perhaps it's good idea to try do changes here expose any 
regressions on some use cases and systems? At least it brings good 
improvements to resume time according to your measurements.

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
