Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664E6437618
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 13:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbhJVLj6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 07:39:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:41676 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232539AbhJVLj6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Oct 2021 07:39:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="226741401"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="226741401"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2021 04:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="663153590"
Received: from mylly.fi.intel.com (HELO [10.237.72.159]) ([10.237.72.159])
  by orsmga005.jf.intel.com with ESMTP; 22 Oct 2021 04:37:37 -0700
Subject: Re: [PATCH 1/3] i2c: designware: Enable async suspend / resume of
 designware devices
To:     Rajat Jain <rajatja@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dtor@google.com
Cc:     rajatxjain@gmail.com, dbasehore@chromium.org
References: <20211022022859.1888836-1-rajatja@google.com>
 <20211022022859.1888836-2-rajatja@google.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <7d94d015-ebff-ee46-3726-9091fe3cdff4@linux.intel.com>
Date:   Fri, 22 Oct 2021 14:37:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022022859.1888836-2-rajatja@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/22/21 5:28 AM, Rajat Jain wrote:
> Mark the designware devices for asynchronous suspend. With this, the
> resume for designware devices does not get stuck behind other unrelated
> devices (e.g. intel_backlight that takes hundreds of ms to resume,
> waiting for its parent devices).
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 21113665ddea..2bd81abc86f6 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -293,6 +293,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   					DPM_FLAG_MAY_SKIP_RESUME);
>   	}
>   
> +	device_enable_async_suspend(&pdev->dev);
> +
>   	/* The code below assumes runtime PM to be disabled. */
>   	WARN_ON(pm_runtime_enabled(&pdev->dev));
>   
I guess same can be done to i2c_dw_pci_probe() too. I don't have any 
strong opinion should it be done in this patch or somewhere in the future.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
