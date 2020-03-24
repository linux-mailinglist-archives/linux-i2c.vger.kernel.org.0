Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 302CA191156
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 14:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXNlY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 09:41:24 -0400
Received: from mga04.intel.com ([192.55.52.120]:8751 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726802AbgCXNlY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 09:41:24 -0400
IronPort-SDR: DU0LTOeq3tLdy7iIGhhd4TZlUgi5cj6DNHqozCkmoIclTWQrTjGeFX+726GIgFLdKDRt4/jZpQ
 tePHbYYT0R3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 06:41:23 -0700
IronPort-SDR: mz4Xnpew8gNVf+t4WQ9755WbYnquKE1Ph32fKffj+U9M+/J22iThmQ/spidK0K23LR84Rrtekq
 OIfjF4WVqWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; 
   d="scan'208";a="250044696"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 24 Mar 2020 06:41:21 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGjo4-00CXaN-90; Tue, 24 Mar 2020 15:41:24 +0200
Date:   Tue, 24 Mar 2020 15:41:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     ajayg@nvidia.com, Wolfram Sang <wsa@the-dreams.de>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Message-ID: <20200324134124.GL1922688@smile.fi.intel.com>
References: <20200324130712.12289-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324130712.12289-1-kai.heng.feng@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 24, 2020 at 09:07:12PM +0800, Kai-Heng Feng wrote:
> Nvidia card may come with a "phantom" UCSI device, and its driver gets
> stuck in probe routine, prevents any system PM operations like suspend.
> 
> When the target time equals to jiffies, it's not included by
> time_is_before_jiffies(). So let's use a boolean to make sure the
> operation is done or timeout.

Thank you for an update, my comments below.

>  	unsigned long target = jiffies + msecs_to_jiffies(1000);
>  	u32 val;
> +	bool done = false;
>  
>  	do {
>  		val = readl(i2cd->regs + I2C_MST_CNTL);
> -		if (!(val & I2C_MST_CNTL_CYCLE_TRIGGER))
> -			break;
> -		if ((val & I2C_MST_CNTL_STATUS) !=
> -				I2C_MST_CNTL_STATUS_BUS_BUSY)

> +		if (!(val & I2C_MST_CNTL_CYCLE_TRIGGER)
> +		    || (val & I2C_MST_CNTL_STATUS) !=
> +				I2C_MST_CNTL_STATUS_BUS_BUSY) {

Bad formatting. But see below.

> +			done = true;
>  			break;
> +		}
>  		usleep_range(500, 600);
>  	} while (time_is_after_jiffies(target));
>  
> -	if (time_is_before_jiffies(target)) {
> +	if (!done) {
>  		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
>  		return -ETIMEDOUT;
>  	}


Overall it can use simple tries since you already have sleep inside, but
moreover, you may simple switch to readl_poll_timeout() this entire
loop.

-- 
With Best Regards,
Andy Shevchenko


