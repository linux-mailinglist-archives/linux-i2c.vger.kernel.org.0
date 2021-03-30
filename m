Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F8B34E925
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 15:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbhC3Nab (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 09:30:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:46435 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232017AbhC3NaG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Mar 2021 09:30:06 -0400
IronPort-SDR: VEjJAOG0j283q9DS41tzC31cYO/fIC1YbeU2LtfH0J18dUiR82uWOus/Zh23LpKZUfSmXnqM0r
 DahI3nsWSC4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="178896612"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="178896612"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 06:30:05 -0700
IronPort-SDR: bEjDNVtZiJu7Ky5eRhGJkNAOB0QEJ43nWMf28WHyf1USEbAKRfu2cIf/N/NN7VBXrgOQDgtHC+
 FcjbckLXhBpg==
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="445130469"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 06:30:02 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRERU-00HL2J-0Y; Tue, 30 Mar 2021 16:30:00 +0300
Date:   Tue, 30 Mar 2021 16:30:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v4 1/4] i2c: core: add managed function for adding i2c
 adapters
Message-ID: <YGMn2N5bWz4OV34Y@smile.fi.intel.com>
References: <1617109549-4013-1-git-send-email-yangyicong@hisilicon.com>
 <1617109549-4013-2-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617109549-4013-2-git-send-email-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 30, 2021 at 09:05:46PM +0800, Yicong Yang wrote:
> Some I2C controller drivers will only unregister the I2C
> adapter in their .remove() callback, which can be done
> by simply using a managed variant to add the I2C adapter.
> 
> So add the managed functions for adding the I2C adapter.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/i2c/i2c-core-base.c | 26 ++++++++++++++++++++++++++
>  include/linux/i2c.h         |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 63ebf72..de9402c 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1703,6 +1703,32 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>  }
>  EXPORT_SYMBOL(i2c_del_adapter);
>  
> +static void devm_i2c_del_adapter(void *adapter)
> +{
> +	i2c_del_adapter(adapter);
> +}
> +
> +/**
> + * devm_i2c_add_adapter - device-managed variant of i2c_add_adapter()
> + * @dev: managing device for adding this I2C adapter
> + * @adapter: the adapter to add
> + * Context: can sleep
> + *
> + * Add adapter with dynamic bus number, same with i2c_add_adapter()
> + * but the adapter will be auto deleted on driver detach.
> + */
> +int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter)
> +{
> +	int ret;
> +
> +	ret = i2c_add_adapter(adapter);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_i2c_del_adapter, adapter);
> +}
> +EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
> +
>  static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
>  			    u32 def_val, bool use_def)
>  {
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 5662265..10bd0b0 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -844,6 +844,7 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
>   */
>  #if IS_ENABLED(CONFIG_I2C)
>  int i2c_add_adapter(struct i2c_adapter *adap);
> +int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter);
>  void i2c_del_adapter(struct i2c_adapter *adap);
>  int i2c_add_numbered_adapter(struct i2c_adapter *adap);
>  
> -- 
> 2.8.1
> 

-- 
With Best Regards,
Andy Shevchenko


