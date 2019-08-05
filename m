Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54CD4816E5
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2019 12:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbfHEKVY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Aug 2019 06:21:24 -0400
Received: from mga18.intel.com ([134.134.136.126]:18915 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbfHEKVY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Aug 2019 06:21:24 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Aug 2019 03:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; 
   d="scan'208";a="202410739"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2019 03:20:49 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hua6h-0005fH-Le; Mon, 05 Aug 2019 13:20:47 +0300
Date:   Mon, 5 Aug 2019 13:20:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH -next] i2c: designware: Fix unused variable warning
Message-ID: <20190805102047.GH23480@smile.fi.intel.com>
References: <1564997468-48538-1-git-send-email-zhangshaokun@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564997468-48538-1-git-send-email-zhangshaokun@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 05, 2019 at 05:31:08PM +0800, Shaokun Zhang wrote:
> drivers/i2c/busses/i2c-designware-master.c: In function ‘i2c_dw_init_recovery_info’:
> drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused variable ‘r’ [-Wunused-variable]
>   int r;
>       ^

Thanks,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 33eb09a02e8d ("i2c: designware: make use of devm_gpiod_get_optional")
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com> 
> Cc: Uwe Kleine-König <uwe@kleine-koenig.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 867787dade43..e8b328242256 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -655,7 +655,6 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>  	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
>  	struct i2c_adapter *adap = &dev->adapter;
>  	struct gpio_desc *gpio;
> -	int r;
>  
>  	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
>  	if (IS_ERR_OR_NULL(gpio))
> -- 
> 2.7.4
> 

-- 
With Best Regards,
Andy Shevchenko


