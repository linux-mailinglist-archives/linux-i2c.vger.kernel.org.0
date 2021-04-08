Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC7E3584C6
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 15:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhDHNcy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 09:32:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:12325 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231663AbhDHNcy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 09:32:54 -0400
IronPort-SDR: LxN7b9NIL3NSeZ0BB2aGqVJvcDMQtcy8/v5D4xwSnb68juQeZdS3m8kzeymgDm9Vw/LiZrMERk
 JwjE/biZSC5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="191385183"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="191385183"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 06:32:42 -0700
IronPort-SDR: uwm6pe0mLEo9F/hpm3lQEEJinHP61Dcamlfofjl4yNoQrDeM713UZCxdvTGa+Mle+PFxEY3gnP
 bBQGUouMF+6A==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="458826521"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 06:32:40 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lUUly-002IYq-5Z; Thu, 08 Apr 2021 16:32:38 +0300
Date:   Thu, 8 Apr 2021 16:32:38 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        prime.zeng@huawei.com, tiantao6@hisilicon.com, linuxarm@huawei.com
Subject: Re: [PATCH] i2c: core: simplify devm_i2c_new_dummy_device()
Message-ID: <YG8F9p7UWZfPxuc9@smile.fi.intel.com>
References: <1617884260-15461-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617884260-15461-1-git-send-email-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 08, 2021 at 08:17:40PM +0800, Yicong Yang wrote:
> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional change.

Nice!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/i2c/i2c-core-base.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 63ebf72..b883a59 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1016,15 +1016,9 @@ struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
> 
> -struct i2c_dummy_devres {
> -	struct i2c_client *client;
> -};
> -
> -static void devm_i2c_release_dummy(struct device *dev, void *res)
> +static void devm_i2c_release_dummy(void *client)
>  {
> -	struct i2c_dummy_devres *this = res;
> -
> -	i2c_unregister_device(this->client);
> +	i2c_unregister_device(client);
>  }
> 
>  /**
> @@ -1041,20 +1035,16 @@ struct i2c_client *devm_i2c_new_dummy_device(struct device *dev,
>  					     struct i2c_adapter *adapter,
>  					     u16 address)
>  {
> -	struct i2c_dummy_devres *dr;
>  	struct i2c_client *client;
> -
> -	dr = devres_alloc(devm_i2c_release_dummy, sizeof(*dr), GFP_KERNEL);
> -	if (!dr)
> -		return ERR_PTR(-ENOMEM);
> +	int ret;
> 
>  	client = i2c_new_dummy_device(adapter, address);
> -	if (IS_ERR(client)) {
> -		devres_free(dr);
> -	} else {
> -		dr->client = client;
> -		devres_add(dev, dr);
> -	}
> +	if (IS_ERR(client))
> +		return client;
> +
> +	ret = devm_add_action_or_reset(dev, devm_i2c_release_dummy, client);
> +	if (ret)
> +		return ERR_PTR(ret);
> 
>  	return client;
>  }
> --
> 2.8.1
> 

-- 
With Best Regards,
Andy Shevchenko


