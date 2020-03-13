Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3731183397
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 15:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbgCLOrs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 10:47:48 -0400
Received: from mga07.intel.com ([134.134.136.100]:38245 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727463AbgCLOrs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Mar 2020 10:47:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="236651471"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2020 07:47:36 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jCP7b-0090pO-2a; Thu, 12 Mar 2020 16:47:39 +0200
Date:   Thu, 12 Mar 2020 16:47:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [RFC PATCH] i2c: acpi: put device when verifying client fails
Message-ID: <20200312144739.GW1922688@smile.fi.intel.com>
References: <20200312133244.9564-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312133244.9564-1-wsa@the-dreams.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 12, 2020 at 02:32:44PM +0100, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> i2c_verify_client() can fail, so we need to put the device when that
> happens.

NAK, this will do double put and messing up with reference counters.
Besides the fact, that device may disappear after looking up which leads us to
even more problems.

See how i2c_acpi_find_client_by_adev() is used in callers.

> 
> Fixes: 525e6fabeae2 ("i2c / ACPI: add support for ACPI reconfigure notifications")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> RFC because I don't know if it can be that the returned dev is not an
> i2c_client. Yet, since it can happen theoretically, I think we should
> have the checks.
> 
>  drivers/i2c/i2c-core-acpi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 8f3dbc97a057..8b0ff780919b 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -394,9 +394,17 @@ EXPORT_SYMBOL_GPL(i2c_acpi_find_adapter_by_handle);
>  static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
>  {
>  	struct device *dev;
> +	struct i2c_client *client;
>  
>  	dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
> -	return dev ? i2c_verify_client(dev) : NULL;
> +	if (!dev)
> +		return NULL;
> +
> +	client = i2c_verify_client(dev);
> +	if (!client)
> +		put_device(dev);
> +
> +	return client;
>  }
>  
>  static int i2c_acpi_notify(struct notifier_block *nb, unsigned long value,
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


