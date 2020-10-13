Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB7028CCB5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 13:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgJMLt1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 07:49:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:12818 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgJMLt0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Oct 2020 07:49:26 -0400
IronPort-SDR: GIR88rKzu6XEi2xkA/TcSAv4EI3xrX9CusWWQCt+mL3VpGCod2OzSu6cZnJW9TSgoWTnU3Jm9W
 n0SFYCyivB6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="250589292"
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="250589292"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 04:49:25 -0700
IronPort-SDR: fKI1CIVL3TQGd0i33Ir236iwYH6hYmucZP/YzxKQuSuYVNcZs5we04sss9kdiEzuaA2shv9ihM
 IHGwFF2cH4Gg==
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; 
   d="scan'208";a="313770836"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 04:49:21 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kSIox-005n54-Sf; Tue, 13 Oct 2020 14:50:23 +0300
Date:   Tue, 13 Oct 2020 14:50:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     wsa@kernel.org, xqiu@google.com, kunyi@google.com,
        benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au,
        tmaimon77@gmail.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: npcm7xx: Support changing bus speed using
 debugfs.
Message-ID: <20201013115023.GL4077@smile.fi.intel.com>
References: <20201013100314.216154-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013100314.216154-1-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 13, 2020 at 01:03:14PM +0300, Tali Perry wrote:
> Systems that can dynamically add and remove slave devices
> often need to change the bus speed in runtime.
> This patch expose the bus frequency to the user.
> This feature can also be used for test automation.

> --
> v2 -> v1:
> 	- Fix typos.
> 	- Remove casting to u64.
> 	
> v1: initial version

Above block should go after cutter '---' (see below) line...

> Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---

...here.

>  drivers/i2c/busses/i2c-npcm7xx.c | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

As we discussed previously I'm not a fan of the functionality this gives and a
way it's done, but this is debugfs and not anyhow an ABI. Also it's localized
inside one driver. In the future we may come up with better approach.

That said, no objections from me.

> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2ad166355ec9..633ac67153e2 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2208,6 +2208,40 @@ static const struct i2c_algorithm npcm_i2c_algo = {
>  /* i2c debugfs directory: used to keep health monitor of i2c devices */
>  static struct dentry *npcm_i2c_debugfs_dir;
>  
> +static int i2c_speed_get(void *data, u64 *val)
> +{
> +	struct npcm_i2c *bus = data;
> +
> +	*val = bus->bus_freq;
> +	return 0;
> +}
> +
> +static int i2c_speed_set(void *data, u64 val)
> +{
> +	struct npcm_i2c *bus = data;
> +	int ret;
> +
> +	if (val < I2C_FREQ_MIN_HZ || val > I2C_FREQ_MAX_HZ)
> +		return -EINVAL;
> +
> +	if (val == bus->bus_freq)
> +		return 0;
> +
> +	i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	npcm_i2c_int_enable(bus, false);
> +
> +	ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> +
> +	i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	if (ret)
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%llu\n");
> +
>  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>  				  struct npcm_i2c *bus)
>  {
> @@ -2223,6 +2257,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>  	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
>  	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
>  	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +	debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
>  
>  	bus->debugfs = d;
>  }
> 
> base-commit: 865c50e1d279671728c2936cb7680eb89355eeea
> -- 
> 2.22.0
> 

-- 
With Best Regards,
Andy Shevchenko


