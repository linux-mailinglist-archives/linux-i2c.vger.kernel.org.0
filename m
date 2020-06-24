Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39ED5207171
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jun 2020 12:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388516AbgFXKq4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jun 2020 06:46:56 -0400
Received: from mga09.intel.com ([134.134.136.24]:1078 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388421AbgFXKq4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jun 2020 06:46:56 -0400
IronPort-SDR: v+/mzFRInUJW9/XhRGVNxWEKBbt16zrXQFcgUk+rJ5rtnfZU/g+qfiO6zmprYB020voZpQzLbV
 Sf0w3x5jprAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="145923314"
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="145923314"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2020 03:46:55 -0700
IronPort-SDR: ZchnAPrf6QB9CaYav3uX/mqqkYIaY+CaxF1hDTEi3IPLz1kVejZUDK1TXTF8byLjsgijRfhVLK
 8LLPtJm1J08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="423325885"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 24 Jun 2020 03:46:54 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jo2vg-00FZ4a-0N; Wed, 24 Jun 2020 13:46:56 +0300
Date:   Wed, 24 Jun 2020 13:46:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ricardo Ribalda <ribalda@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: platdrv: Set class based on dmi
Message-ID: <20200624104655.GD3703480@smile.fi.intel.com>
References: <20200624091239.802218-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624091239.802218-1-ribalda@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 24, 2020 at 11:12:39AM +0200, Ricardo Ribalda wrote:
> Current AMD's zen-based APUs use this core for some of its i2c-buses.
> 
> With this patch we re-enable autodetection of hwmon-alike devices, so
> lm-sensors will be able to work automatically.
> 
> It does not affect the boot-time of embedded devices, as the class is
> set based on the dmi information.

Hmm... Do we really need to have DMI? I mean wouldn't be safe just always
provide this to be compatible with HWMON class?

...

> +static bool dw_i2c_hwmon_bus(void)
> +{
> +	if (strstr(dmi_get_system_info(DMI_PRODUCT_NAME), "QT5222"))
> +		return true;
> +	return false;
> +}

I don't like this. Perhaps for now you may simple use dmi_get_system_info()
directly below.

...

> +	adap->class = dw_i2c_hwmon_bus() ? I2C_CLASS_HWMON
> +					 : I2C_CLASS_DEPRECATED;

It's one line.

-- 
With Best Regards,
Andy Shevchenko


