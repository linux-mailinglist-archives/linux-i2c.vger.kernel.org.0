Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03D91CDAD9
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 15:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgEKNML (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 09:12:11 -0400
Received: from mga02.intel.com ([134.134.136.20]:47951 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726687AbgEKNMK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 May 2020 09:12:10 -0400
IronPort-SDR: c/o8dtTOn6nIlHG4oL32Z0Gw+5NQREL3rbSe1zozJbWM6wFbS0wSg150lJ6YJI/FShvkxz+WNV
 L/J0mpQCCBRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 06:11:59 -0700
IronPort-SDR: HUs4SWACZyJh4TNngtK/W3ltZDxjn6O6zQmcy7spvgXpvmhXd7zhiNy2oyRGtTbG29ipI1CMoW
 QKO6NGuLJYmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; 
   d="scan'208";a="286268053"
Received: from mylly.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2020 06:11:58 -0700
Subject: Re: [PATCH v1 1/4] i2c: designware: Split out i2c_dw_validate_speed()
 helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <228e9c62-60b9-e5b8-ea5e-e012df83479b@linux.intel.com>
Date:   Mon, 11 May 2020 16:11:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/7/20 4:51 PM, Andy Shevchenko wrote:
> In order to export array supported speed for wider use,
> split out them along with i2c_dw_validate_speed() helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-core.h    | 31 +++++++++++++++++++++
>   drivers/i2c/busses/i2c-designware-platdrv.c | 29 ++++---------------
>   2 files changed, 36 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 1674caf277451..626959573f894 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -9,6 +9,7 @@
>    * Copyright (C) 2009 Provigent Ltd.
>    */
>   
> +#include <linux/errno.h>
>   #include <linux/i2c.h>
>   
>   #define DW_IC_DEFAULT_FUNCTIONALITY (I2C_FUNC_I2C |			\
> @@ -351,3 +352,33 @@ extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
>   #else
>   static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
>   #endif
> +
> +static const u32 i2c_dw_supported_speeds[] = {
> +	I2C_MAX_HIGH_SPEED_MODE_FREQ,
> +	I2C_MAX_FAST_MODE_PLUS_FREQ,
> +	I2C_MAX_FAST_MODE_FREQ,
> +	I2C_MAX_STANDARD_MODE_FREQ,
> +};
> +
> +static inline int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
> +{
> +	struct i2c_timings *t = &dev->timings;
> +	unsigned int i;
> +
> +	/*
> +	 * Only standard mode at 100kHz, fast mode at 400kHz,
> +	 * fast mode plus at 1MHz and high speed mode at 3.4MHz are supported.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(i2c_dw_supported_speeds); i++) {
> +		if (t->bus_freq_hz == i2c_dw_supported_speeds[i])
> +			break;
> +	}
> +	if (i == ARRAY_SIZE(i2c_dw_supported_speeds)) {
> +		dev_err(dev->dev,
> +			"%d Hz is unsupported, only 100kHz, 400kHz, 1MHz and 3.4MHz are supported\n",
> +			t->bus_freq_hz);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

This header is included by every i2c-designware-*.c file and this inline 
function is not tiny. Would it be better to have this in 
i2c-designware-common.c instead?

-- 
Jarkko
