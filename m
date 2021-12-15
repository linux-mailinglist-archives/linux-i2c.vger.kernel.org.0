Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F104759EA
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 14:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242978AbhLONtv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 08:49:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:26531 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231757AbhLONtu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 08:49:50 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239180073"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="239180073"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 05:49:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="482393680"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 05:49:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mxUeI-006cY3-1G;
        Wed, 15 Dec 2021 15:48:50 +0200
Date:   Wed, 15 Dec 2021 15:48:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/6] i2c: designware-pci: Use temporary variable for
 struct device
Message-ID: <YbnyQcpAXxSs9R2K@smile.fi.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
 <3d67442c-87a7-e05b-7f69-de501fc0ad29@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d67442c-87a7-e05b-7f69-de501fc0ad29@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 15, 2021 at 09:51:10AM +0200, Jarkko Nikula wrote:
> On 12/13/21 20:00, Andy Shevchenko wrote:
> > Use temporary variable for struct device to make code neater.

...

> > +	dev->suspended = true;
> > +	dev->disable(dev);
> In my opinion this brings more mess than removes. If I see dev->something
> I'll immediatelly think "struct device" and get confused. x_dev->something
> or dev_y->something not so much. And this change adds in my opinion more
> confusion than removes.

Either way it will be inconsistent. If you wish to fix, I can build something
on top of your fix, but currently I drop this patch.

> >   	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers)) {
> > -		dev_err(&pdev->dev, "%s: invalid driver data %ld\n", __func__,
> > -			id->driver_data);
> > +		dev_err(d, "%s: invalid driver data %ld\n", __func__, id->driver_data);
> >   		return -EINVAL;
> 
> Honestly, what's is the value of this change?

What is the value of the changes in general? :-)

> Yet another differently named
> "device" pointer more to the mess (Inconsistent naming use of struct
> dw_i2c_dev *dev, struct dw_i2c_dev *i_dev and struct device *dev in the
> i2c-designware-*).

As I said, please fix this inconsistency yourself how you find it better
and I will use that in the future contributions.

-- 
With Best Regards,
Andy Shevchenko


