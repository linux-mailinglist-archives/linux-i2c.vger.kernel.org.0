Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71658207463
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jun 2020 15:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388287AbgFXNZb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jun 2020 09:25:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:41090 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387687AbgFXNZb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jun 2020 09:25:31 -0400
IronPort-SDR: FgLiXFSXoG6YiE7NZ8SDQFuL9bTJzMeO9T6CpGYGH90mR7ShyCvihAlcptF2sn7b8VMgZlmyfC
 6PusuWA8OIOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="132897614"
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="132897614"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2020 06:25:30 -0700
IronPort-SDR: 2nTST7gedUufpuTnjYDFePSxCKCUtUJl17C99hVsLDtUgrmX1bRtTUUzGd43nz1RKWEORxivRo
 1aaHvoNY5LrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="452634485"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 24 Jun 2020 06:25:28 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jo5MF-00FaVg-SZ; Wed, 24 Jun 2020 16:22:31 +0300
Date:   Wed, 24 Jun 2020 16:22:31 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ricardo Ribalda <ribalda@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2] i2c: designware: platdrv: Set class based on dmi
Message-ID: <20200624132231.GF3703480@smile.fi.intel.com>
References: <20200624112530.852254-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624112530.852254-1-ribalda@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 24, 2020 at 01:25:30PM +0200, Ricardo Ribalda wrote:
> Current AMD's zen-based APUs use this core for some of its i2c-buses.
> 
> With this patch we re-enable autodetection of hwmon-alike devices, so
> lm-sensors will be able to work automatically.
> 
> It does not affect the boot-time of embedded devices, as the class is
> set based on the dmi information.

I think it misses Fixes tag. And...

...

> +static bool dw_i2c_hwmon_bus(void)
> +{

> +	const char *product_name = dmi_get_system_info(DMI_PRODUCT_NAME);

Split this, so the assignment will be attached to the check below.

> +	if (!product_name)
> +		return false;
> +

> +	if (strstr(product_name, "QT5222"))
> +		return true;

I don't like this part at all. Why do you need strstr()? Can you provide in the
commit message relevant fields from dmidecode (or sysfs)?

> +	return false;
> +}

In general it's not how we do DMI based quirks, rather using table and call
match function. In that case you can take class as a driver_data. Much more
flexible in case we need to extend.

...

> -	adap->class = I2C_CLASS_DEPRECATED;
> +	adap->class = dw_i2c_hwmon_bus() ? I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;

...since the patch has it unconditionally, I would go unconditionally. But if
Wolfram insists, then see above.


-- 
With Best Regards,
Andy Shevchenko


