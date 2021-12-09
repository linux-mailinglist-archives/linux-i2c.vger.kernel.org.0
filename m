Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA7746E64F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 11:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbhLIKNN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 05:13:13 -0500
Received: from mga11.intel.com ([192.55.52.93]:35039 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232430AbhLIKNN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Dec 2021 05:13:13 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235576815"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; 
   d="scan'208";a="235576815"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 02:09:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; 
   d="scan'208";a="503435978"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 02:09:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mvGLv-0042kM-Jd;
        Thu, 09 Dec 2021 12:08:39 +0200
Date:   Thu, 9 Dec 2021 12:08:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: core: Do not dereference fwnode in struct
 device
Message-ID: <YbHVpwl5uGpV+Lei@smile.fi.intel.com>
References: <20211207162457.18450-1-andriy.shevchenko@linux.intel.com>
 <YbHCAURU5bR3XFL2@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbHCAURU5bR3XFL2@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 09, 2021 at 09:44:49AM +0100, Wolfram Sang wrote:
> 
> >  	client->dev.parent = &client->adapter->dev;
> >  	client->dev.bus = &i2c_bus_type;
> >  	client->dev.type = &i2c_client_type;
> > -	client->dev.of_node = of_node_get(info->of_node);
> > -	client->dev.fwnode = info->fwnode;
> >  
> >  	device_enable_async_suspend(&client->dev);
> >  	i2c_dev_set_name(adap, client, info);
> >  
> > +	device_set_node(&client->dev, info->fwnode);
> > +	client->dev.of_node = of_node_get(info->of_node);
> > +
> 
> I am basically OK with this change. I'd just move the code block a
> little to have the same behaviour as before. Something like this
> (hand-edited preview version):

And this is exactly what have been done.

> >  	client->dev.bus = &i2c_bus_type;
> >  	client->dev.type = &i2c_client_type;
> >  	client->dev.of_node = of_node_get(info->of_node);
> > -	client->dev.fwnode = info->fwnode;
> >  
> > +	device_set_node(&client->dev, info->fwnode);
> >  	device_enable_async_suspend(&client->dev);
> >  	i2c_dev_set_name(adap, client, info);
> 
> Are you okay with that?

It will be broken in this case. There is subtle detail about device_set_node(),
it sets both fwnode and of_node at once. More thinking about this, I admit that
the best strategy now is to drop this change for now.

-- 
With Best Regards,
Andy Shevchenko


