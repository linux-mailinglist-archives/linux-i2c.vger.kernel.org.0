Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E461E47FC
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730455AbgE0Pqg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:46:36 -0400
Received: from mga06.intel.com ([134.134.136.31]:45290 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgE0Pqd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 11:46:33 -0400
IronPort-SDR: 4anh1tWjKAoOK6sRYRp3u0B2A6CvgDqzoSp9YPEZ7BeQaJCH9VcPrcXJtY6YKLtJNEBrgroIR2
 9pwWMaYhbHvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 08:46:32 -0700
IronPort-SDR: x0KzQX8doPmc5abiGPoifvo/cn4wkVL0PLxbY5Ar24ahXvjzF4TVVrd9+1gVcjyz40O/xJ3l3P
 mQHUmisvffjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="302139535"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2020 08:46:29 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdyGG-009FoD-CK; Wed, 27 May 2020 18:46:32 +0300
Date:   Wed, 27 May 2020 18:46:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/11] i2c: designware: Add Baytrail sem config DW I2C
 platform dependency
Message-ID: <20200527154632.GG1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-7-Sergey.Semin@baikalelectronics.ru>
 <20200527134220.GX1634618@smile.fi.intel.com>
 <20200527142406.jzdtkbdb2q6st7e6@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527142406.jzdtkbdb2q6st7e6@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 05:24:06PM +0300, Serge Semin wrote:
> On Wed, May 27, 2020 at 04:42:20PM +0300, Andy Shevchenko wrote:
> > On Wed, May 27, 2020 at 03:01:06PM +0300, Serge Semin wrote:
> > > Currently Intel Baytrail I2C semaphore is a feature of the DW APB I2C
> > > platform driver. It's a bit confusing to see it's config in the menu at
> > > some separated place with no reference to the platform code. Let's move the
> > > config definition to be below the I2C_DESIGNWARE_PLATFORM config and mark
> > > it with "depends on I2C_DESIGNWARE_PLATFORM" statement. By doing so the
> > > config menu will display the feature right below the DW I2C platform
> > > driver item and will indent it to the right so signifying its belonging.

...

> > >  config I2C_DESIGNWARE_BAYTRAIL
> > >  	bool "Intel Baytrail I2C semaphore support"
> > >  	depends on ACPI
> > > +	depends on I2C_DESIGNWARE_PLATFORM
> > >  	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
> > >  		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
> > 
> > I didn't get this. What is broken now with existing dependencies?
> 
> With no explicit "depends on I2C_DESIGNWARE_PLATFORM" the entry isn't right
> shifted with respect to the I2C_DESIGNWARE_PLATFORM config entry in the kernel
> menuconfig. So it looks like a normal no-yes driver without it. 

I didn't get. Is there problems with current case? (I don't see it).
If there is a problem, it should have a separate patch and commit message.

As for now above excerpt seems redundant and unneeded churn.

-- 
With Best Regards,
Andy Shevchenko


