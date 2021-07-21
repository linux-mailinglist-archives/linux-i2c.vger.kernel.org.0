Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF963D0B2E
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jul 2021 11:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbhGUIUW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jul 2021 04:20:22 -0400
Received: from mga04.intel.com ([192.55.52.120]:29425 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236899AbhGUH5g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 21 Jul 2021 03:57:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209494670"
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; 
   d="scan'208";a="209494670"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2021 01:37:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; 
   d="scan'208";a="470087364"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2021 01:37:51 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m67jd-00GYqL-0s; Wed, 21 Jul 2021 11:37:45 +0300
Date:   Wed, 21 Jul 2021 11:37:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: parport: Switch to use
 module_parport_driver()
Message-ID: <YPfc2eBjc4I2ycKV@smile.fi.intel.com>
References: <20210712141119.22426-1-andriy.shevchenko@linux.intel.com>
 <20210721102146.66a486bc@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721102146.66a486bc@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 21, 2021 at 10:21:46AM +0200, Jean Delvare wrote:
> Hi Andy,
> 
> On Mon, 12 Jul 2021 17:11:19 +0300, Andy Shevchenko wrote:
> > Switch to use module_parport_driver() to reduce boilerplate code.
> 
> This has the downside of moving the sanity check of the type parameter
> to run time, instead of driver load time. In particular this means that
> loading the i2c-parport driver without specifying the type will no
> longer fail.

And this is actually an advantage of the change if you think about it.
Now we can have a module that won't fail at boot time and give the user
a chance to amend parameter at run time if it was wrong at boot time.

> The driver will load successfully, but won't do anything.
> 
> While I prefer user errors to be reported as soon as possible, I don't
> really mind here, as parallel port drivers are not something worth
> debating over at this point in time. As a matter of fact, I can't
> possibly test this change as I no longer have a parallel port on any of
> my systems.
> 
> So if that's the direction we want to take then so be it.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks!

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: fixed compilation error (Jean, LKP)
> >  drivers/i2c/busses/i2c-parport.c | 36 ++++++++++----------------------
> >  1 file changed, 11 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
> > index a535889acca6..231145c48728 100644
> > --- a/drivers/i2c/busses/i2c-parport.c
> > +++ b/drivers/i2c/busses/i2c-parport.c
> > @@ -267,6 +267,16 @@ static void i2c_parport_attach(struct parport *port)
> >  	int i;
> >  	struct pardev_cb i2c_parport_cb;
> >  
> > +	if (type < 0) {
> > +		pr_warn("adapter type unspecified\n");
> > +		return;
> > +	}
> > +
> > +	if (type >= ARRAY_SIZE(adapter_parm)) {
> > +		pr_warn("invalid type (%d)\n", type);
> > +		return;
> > +	}
> > +
> >  	for (i = 0; i < MAX_DEVICE; i++) {
> >  		if (parport[i] == -1)
> >  			continue;
> > @@ -392,32 +402,8 @@ static struct parport_driver i2c_parport_driver = {
> >  	.detach = i2c_parport_detach,
> >  	.devmodel = true,
> >  };
> > -
> > -/* ----- Module loading, unloading and information ------------------------ */
> > -
> > -static int __init i2c_parport_init(void)
> > -{
> > -	if (type < 0) {
> > -		pr_warn("adapter type unspecified\n");
> > -		return -ENODEV;
> > -	}
> > -
> > -	if (type >= ARRAY_SIZE(adapter_parm)) {
> > -		pr_warn("invalid type (%d)\n", type);
> > -		return -ENODEV;
> > -	}
> > -
> > -	return parport_register_driver(&i2c_parport_driver);
> > -}
> > -
> > -static void __exit i2c_parport_exit(void)
> > -{
> > -	parport_unregister_driver(&i2c_parport_driver);
> > -}
> > +module_parport_driver(i2c_parport_driver);
> >  
> >  MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
> >  MODULE_DESCRIPTION("I2C bus over parallel port");
> >  MODULE_LICENSE("GPL");
> > -
> > -module_init(i2c_parport_init);
> > -module_exit(i2c_parport_exit);
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support

-- 
With Best Regards,
Andy Shevchenko


