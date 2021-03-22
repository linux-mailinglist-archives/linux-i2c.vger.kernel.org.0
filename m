Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357E8344B8B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 17:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbhCVQfw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 12:35:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:37245 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229647AbhCVQfk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 12:35:40 -0400
IronPort-SDR: Ky3Mtlu2828sPr50JKHk/qucf2MZSNeGR2hvdTjHdU5XW//MPtWDzsl0/TTFmlz8rmFqVuDorb
 I0owaBKOswLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="186987407"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="186987407"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 09:35:39 -0700
IronPort-SDR: 7mdNA1N6gOXbTKwr5TfWo8TOgUbd0JGV8bycfK5SJm6a0dyO2RFkNJo0lEC5elGfGcYC+rMgOX
 KU/Uha4GtkKA==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="524509705"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 09:35:36 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lONWf-00Emdc-1u; Mon, 22 Mar 2021 18:35:33 +0200
Date:   Mon, 22 Mar 2021 18:35:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v3 1/3] i2c: core: add managed function for adding i2c
 adapters
Message-ID: <YFjHVQlbygLljCvp@smile.fi.intel.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 22, 2021 at 07:10:11PM +0800, Yicong Yang wrote:
> Some I2C controller drivers will only unregister the I2C
> adapter in their .remove() callback, which can be done
> by simply using a managed variant to add the I2C adapter.
> 
> So add the managed functions for adding the I2C adapter.

...

> +static void devm_i2c_del_adapter(struct device *dev, void *ptr);

Can we instead of forward declaration simply move below to be after
devm_i2c_del_adapter()?

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
> +	struct i2c_adapter **ptr;
> +	int ret;
> +
> +	ptr = devres_alloc(devm_i2c_del_adapter, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	ret = i2c_add_adapter(adapter);
> +	if (!ret) {
> +		*ptr = adapter;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


