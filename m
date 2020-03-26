Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 430B9193D34
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 11:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbgCZKrB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 06:47:01 -0400
Received: from mga18.intel.com ([134.134.136.126]:11389 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727590AbgCZKrB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 06:47:01 -0400
IronPort-SDR: tuU6C6VMXswslFE2/vpNC1gL/qCYdVzgiT6WwIDmc5cooxd0JEsWIrBAYQARx2HyVZlU1obj8y
 3ulCDYFDgvTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 03:47:00 -0700
IronPort-SDR: 2XJdjLL7UuKeoerQpYx1WO93F32l+qvizCZvGU9cAiBYS7rR8bRWsofP7ARK0Gu2IbuqJiQrFI
 GU+fcfGl8OWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; 
   d="scan'208";a="265832192"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 26 Mar 2020 03:46:59 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jHQ2P-00D5mF-Tr; Thu, 26 Mar 2020 12:47:01 +0200
Date:   Thu, 26 Mar 2020 12:47:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: refactor parsing of timings
Message-ID: <20200326104701.GM1922688@smile.fi.intel.com>
References: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 11:16:47AM +0100, Wolfram Sang wrote:
> When I wanted to print the chosen values to debug output, I concluded
> that a helper function to parse one timing would be helpful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> I am not entirely happy because 'dev' and 'u' is the same for each call.
> Then again, we can't use a for-loop over an array of parameters, because
> some default values depend on previously obtained timings.
> 
> Looking for opinions here...

No objections. (We may bikeshed about namings, though)

However, looking into the code, I would go a bit further (perhaps as a separate
change) and export parsing of clock-frequency, because tons of drivers only
need one property, i.e. clock-frequency out of firmware.

> 
>  drivers/i2c/i2c-core-base.c | 78 ++++++++++++++++++-------------------
>  1 file changed, 38 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 474baaf8c9e7..60b0aa246af2 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1609,6 +1609,18 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>  }
>  EXPORT_SYMBOL(i2c_del_adapter);
>  
> +static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
> +			    u32 def_val, bool use_def)
> +{
> +	int ret;
> +
> +	ret = device_property_read_u32(dev, prop_name, cur_val_p);
> +	if (ret && use_def)
> +		*cur_val_p = def_val;
> +
> +	dev_dbg(dev, "%s: %u\n", prop_name, *cur_val_p);
> +}
> +
>  /**
>   * i2c_parse_fw_timings - get I2C related timing parameters from firmware
>   * @dev: The device to scan for I2C timing properties
> @@ -1627,49 +1639,35 @@ EXPORT_SYMBOL(i2c_del_adapter);
>   */
>  void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults)
>  {
> -	int ret;
> -
> -	ret = device_property_read_u32(dev, "clock-frequency", &t->bus_freq_hz);
> -	if (ret && use_defaults)
> -		t->bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
> -
> -	ret = device_property_read_u32(dev, "i2c-scl-rising-time-ns", &t->scl_rise_ns);
> -	if (ret && use_defaults) {
> -		if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ)
> -			t->scl_rise_ns = 1000;
> -		else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
> -			t->scl_rise_ns = 300;
> -		else
> -			t->scl_rise_ns = 120;
> -	}
> -
> -	ret = device_property_read_u32(dev, "i2c-scl-falling-time-ns", &t->scl_fall_ns);
> -	if (ret && use_defaults) {
> -		if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
> -			t->scl_fall_ns = 300;
> -		else
> -			t->scl_fall_ns = 120;
> -	}
> +	bool u = use_defaults;
> +	u32 d;
>  
> -	ret = device_property_read_u32(dev, "i2c-scl-internal-delay-ns", &t->scl_int_delay_ns);
> -	if (ret && use_defaults)
> -		t->scl_int_delay_ns = 0;
> +	i2c_parse_timing(dev, "clock-frequency", &t->bus_freq_hz,
> +			 I2C_MAX_STANDARD_MODE_FREQ, u);
>  
> -	ret = device_property_read_u32(dev, "i2c-sda-falling-time-ns", &t->sda_fall_ns);
> -	if (ret && use_defaults)
> -		t->sda_fall_ns = t->scl_fall_ns;
> -
> -	ret = device_property_read_u32(dev, "i2c-sda-hold-time-ns", &t->sda_hold_ns);
> -	if (ret && use_defaults)
> -		t->sda_hold_ns = 0;
> -
> -	ret = device_property_read_u32(dev, "i2c-digital-filter-width-ns", &t->digital_filter_width_ns);
> -	if (ret && use_defaults)
> -		t->digital_filter_width_ns = 0;
> +	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ)
> +		d = 1000;
> +	else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
> +		d = 300;
> +	else
> +		d = 120;
> +	i2c_parse_timing(dev, "i2c-scl-rising-time-ns", &t->scl_rise_ns, d, u);
>  
> -	ret = device_property_read_u32(dev, "i2c-analog-filter-cutoff-frequency", &t->analog_filter_cutoff_freq_hz);
> -	if (ret && use_defaults)
> -		t->analog_filter_cutoff_freq_hz = 0;
> +	if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
> +		d = 300;
> +	else
> +		d = 120;
> +	i2c_parse_timing(dev, "i2c-scl-falling-time-ns", &t->scl_fall_ns, d, u);
> +
> +	i2c_parse_timing(dev, "i2c-scl-internal-delay-ns",
> +			 &t->scl_int_delay_ns, 0, u);
> +	i2c_parse_timing(dev, "i2c-sda-falling-time-ns", &t->sda_fall_ns,
> +			 t->scl_fall_ns, u);
> +	i2c_parse_timing(dev, "i2c-sda-hold-time-ns", &t->sda_hold_ns, 0, u);
> +	i2c_parse_timing(dev, "i2c-digital-filter-width-ns",
> +			 &t->digital_filter_width_ns, 0, u);
> +	i2c_parse_timing(dev, "i2c-analog-filter-cutoff-frequency",
> +			 &t->analog_filter_cutoff_freq_hz, 0, u);
>  }
>  EXPORT_SYMBOL_GPL(i2c_parse_fw_timings);
>  
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


