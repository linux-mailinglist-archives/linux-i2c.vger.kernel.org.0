Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20B634E924
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 15:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhC3Nac (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 09:30:32 -0400
Received: from mga02.intel.com ([134.134.136.20]:46460 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231924AbhC3Na3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Mar 2021 09:30:29 -0400
IronPort-SDR: ruYYUtQ8IyXUMptB0RzME9GLcMEgMh5eQfdhRZAGskKdnkGoRgIDTamJ8ZOjWu9vD5vhKtHH8F
 9ILulcZMFh1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="178896658"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="178896658"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 06:30:29 -0700
IronPort-SDR: A2wk+C0R48vMT+bJBk9kuBX7NgeFTSBndVW/nG9arapSHMKd9xsykUtN5apntb8DUUM8mjckKR
 i/+E1q0Lwy8Q==
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="415814211"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 06:30:26 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRERr-00HL2o-85; Tue, 30 Mar 2021 16:30:23 +0300
Date:   Tue, 30 Mar 2021 16:30:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v4 2/4] i2c: core: add api to provide frequency mode
 strings
Message-ID: <YGMn71ePF3N03IkW@smile.fi.intel.com>
References: <1617109549-4013-1-git-send-email-yangyicong@hisilicon.com>
 <1617109549-4013-3-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617109549-4013-3-git-send-email-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 30, 2021 at 09:05:47PM +0800, Yicong Yang wrote:
> Some I2C drivers like Designware and HiSilicon will print the
> bus frequency mode information, so add a public one that everyone
> can make use of.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  include/linux/i2c.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 10bd0b0..6837e64 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -47,6 +47,26 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
>  #define I2C_MAX_HIGH_SPEED_MODE_FREQ	3400000
>  #define I2C_MAX_ULTRA_FAST_MODE_FREQ	5000000
>  
> +static inline const char *i2c_freq_mode_string(u32 bus_freq_hz)
> +{
> +	switch (bus_freq_hz) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		return "Standard Mode(100KHz)";
> +	case I2C_MAX_FAST_MODE_FREQ:
> +		return "Fast Mode(400KHz)";
> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
> +		return "Fast Mode Plus(1.0MHz)";
> +	case I2C_MAX_TURBO_MODE_FREQ:
> +		return "Turbo Mode(1.4MHz)";
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
> +		return "High Speed Mode(3.4MHz)";
> +	case I2C_MAX_ULTRA_FAST_MODE_FREQ:
> +		return "Ultra Fast Mode(5.0MHz)";
> +	default:
> +		return "Unknown Mode";
> +	}
> +}
> +
>  struct module;
>  struct property_entry;
>  
> -- 
> 2.8.1
> 

-- 
With Best Regards,
Andy Shevchenko


