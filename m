Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71FB27E52A
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 11:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgI3Jb1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Sep 2020 05:31:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:32507 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgI3Jb1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Sep 2020 05:31:27 -0400
IronPort-SDR: FG60x8jxEubEureGBMSuX/y0AkhoaMW8eV1y2gHwsPCgWi6VzYmb/R7UVEVlQQK/xN+lYzJqxF
 5oVxRE3+WkiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="162462304"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="162462304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 02:31:26 -0700
IronPort-SDR: xM4l5HUa0fzsNcmwYCuoLVFZ4VJugXXLFy+dgQtO9JiJE1j1t0MlMojIv7DqrAByHNDoXmalVX
 FooC7wFH5Zdg==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="308096666"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 02:31:23 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kNYSD-002z0o-I0; Wed, 30 Sep 2020 12:31:17 +0300
Date:   Wed, 30 Sep 2020 12:31:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     wsa@kernel.org, xqiu@google.com, kunyi@google.com,
        benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au,
        tmaimon77@gmail.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using
 debugfs.
Message-ID: <20200930093117.GY3956970@smile.fi.intel.com>
References: <20200930071342.98691-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930071342.98691-1-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> Systems that can dinamically add and remove slave devices

dynamically

> often need to change the bus speed in runtime.

> This patch exposes the bus frequency to the user.

Expose the bus frequency to the user.

> This feature can also be used for test automation.

In general I think that DT overlays or so should be user rather than this.
If we allow to change bus speed settings for debugging purposes it might make
sense to do this on framework level for all drivers which support that (via
additional callback or so).

> Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2ad166355ec9..44e2340c1893 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2208,6 +2208,41 @@ static const struct i2c_algorithm npcm_i2c_algo = {
>  /* i2c debugfs directory: used to keep health monitor of i2c devices */
>  static struct dentry *npcm_i2c_debugfs_dir;
>  
> +static int i2c_speed_get(void *data, u64 *val)
> +{
> +	struct npcm_i2c *bus = data;
> +
> +	*val = (u64)bus->bus_freq;
> +	return 0;
> +}
> +
> +static int i2c_speed_set(void *data, u64 val)
> +{
> +	struct npcm_i2c *bus = data;
> +	int ret;
> +
> +	if (val < (u64)I2C_FREQ_MIN_HZ || val > (u64)I2C_FREQ_MAX_HZ)
> +		return -EINVAL;
> +
> +	if (val == (u64)bus->bus_freq)
> +		return 0;
> +
> +	i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	npcm_i2c_int_enable(bus, false);
> +
> +	ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> +
> +	i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);

While all these explicit castings?

> +
> +	if (ret)
> +		return -EAGAIN;
> +
> +	return 0;
> +}

> +

No need to have this blank line

> +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%lld\n");
> +
>  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>  				  struct npcm_i2c *bus)
>  {
> @@ -2223,6 +2258,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>  	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
>  	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
>  	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +	debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
>  
>  	bus->debugfs = d;
>  }

-- 
With Best Regards,
Andy Shevchenko


