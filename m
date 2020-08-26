Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE587252BC2
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 12:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgHZKyd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 06:54:33 -0400
Received: from mga11.intel.com ([192.55.52.93]:18502 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727122AbgHZKyb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 06:54:31 -0400
IronPort-SDR: Ye1IpGSoaXH7e/xOJojUxbcCgcQsGh4QcYufxD19OJqdGHRQkmm0/l0qC+H6s7gtYGoGzbUwUt
 jzX4SSIe6QCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="153841061"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="153841061"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 03:54:31 -0700
IronPort-SDR: mgEodjz+6d20xaZrH90nyEZMnEV3Ido8z0JxOQ8gjYPl982Y2KFBIbdrnOx+wWwfggbwMoaIbg
 2IDBuNrdvfag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="329182251"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2020 03:54:28 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kAt4U-00BXuN-RC; Wed, 26 Aug 2020 13:54:26 +0300
Date:   Wed, 26 Aug 2020 13:54:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826105426.GJ1891694@smile.fi.intel.com>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
 <20200826095356.GG1891694@smile.fi.intel.com>
 <20200826095617.GH1891694@smile.fi.intel.com>
 <20200826102411.GC8849@jagdpanzerIV.localdomain>
 <20200826103807.GD8849@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826103807.GD8849@jagdpanzerIV.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 26, 2020 at 07:38:07PM +0900, Sergey Senozhatsky wrote:
> On (20/08/26 19:24), Sergey Senozhatsky wrote:
> > > But then the question is why we have this code in the ->probe() at all?
> > > ->match() is run before probe by bus core, no?
> > 
> > That's a good question.
> 
> Everything seem to be working OK on my test board with this patch:

I'm okay with it, but I want to hear Wolfram about this.
If it gets a green light to go, feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> ---
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5ec082e2039d..77eea5c0bc71 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -475,17 +475,6 @@ static int i2c_device_probe(struct device *dev)
>  
>  	driver = to_i2c_driver(dev->driver);
>  
> -	/*
> -	 * An I2C ID table is not mandatory, if and only if, a suitable OF
> -	 * or ACPI ID table is supplied for the probing device.
> -	 */
> -	if (!driver->id_table &&
> -	    !acpi_driver_match_device(dev, dev->driver) &&
> -	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
> -		status = -ENODEV;
> -		goto put_sync_adapter;
> -	}
> -
>  	if (client->flags & I2C_CLIENT_WAKE) {
>  		int wakeirq;
>  

-- 
With Best Regards,
Andy Shevchenko


