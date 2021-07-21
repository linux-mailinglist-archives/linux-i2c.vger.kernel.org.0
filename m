Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179123D0B30
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jul 2021 11:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237189AbhGUIUX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jul 2021 04:20:23 -0400
Received: from mga12.intel.com ([192.55.52.136]:61881 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235916AbhGUIIq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 21 Jul 2021 04:08:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190980767"
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; 
   d="scan'208";a="190980767"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2021 01:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; 
   d="scan'208";a="576286338"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2021 01:42:27 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m67o5-00GYvS-Op; Wed, 21 Jul 2021 11:42:21 +0300
Date:   Wed, 21 Jul 2021 11:42:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: parport: Switch to use
 module_parport_driver()
Message-ID: <YPfd7aJfvH+NYtl1@smile.fi.intel.com>
References: <20210712141119.22426-1-andriy.shevchenko@linux.intel.com>
 <20210721102146.66a486bc@endymion>
 <YPfc2eBjc4I2ycKV@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPfc2eBjc4I2ycKV@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 21, 2021 at 11:37:45AM +0300, Andy Shevchenko wrote:
> On Wed, Jul 21, 2021 at 10:21:46AM +0200, Jean Delvare wrote:
> > On Mon, 12 Jul 2021 17:11:19 +0300, Andy Shevchenko wrote:
> > > Switch to use module_parport_driver() to reduce boilerplate code.
> > 
> > This has the downside of moving the sanity check of the type parameter
> > to run time, instead of driver load time. In particular this means that
> > loading the i2c-parport driver without specifying the type will no
> > longer fail.
> 
> And this is actually an advantage of the change if you think about it.
> Now we can have a module that won't fail at boot time and give the user
> a chance to amend parameter at run time if it was wrong at boot time.

Okay, for built-in driver it might require to check and fix permissions
of the parameter sysfs node (currently 0).

> > The driver will load successfully, but won't do anything.
> > 
> > While I prefer user errors to be reported as soon as possible, I don't
> > really mind here, as parallel port drivers are not something worth
> > debating over at this point in time. As a matter of fact, I can't
> > possibly test this change as I no longer have a parallel port on any of
> > my systems.

-- 
With Best Regards,
Andy Shevchenko


