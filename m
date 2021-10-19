Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE94E43354B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 14:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhJSMDv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 08:03:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:13690 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230337AbhJSMDu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 08:03:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="208590522"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; 
   d="scan'208";a="208590522"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 05:01:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; 
   d="scan'208";a="594210343"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 05:01:33 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mcnnu-000THp-DU;
        Tue, 19 Oct 2021 15:01:14 +0300
Date:   Tue, 19 Oct 2021 15:01:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v4 1/3] driver core: Provide device_match_acpi_handle()
 helper
Message-ID: <YW6ziqiIgioxDjq3@smile.fi.intel.com>
References: <20211014134756.39092-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jqXqhV1FSyuoVwbgwhte7Q4KUQMozggcxCHGPf+Mfw=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jqXqhV1FSyuoVwbgwhte7Q4KUQMozggcxCHGPf+Mfw=A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 15, 2021 at 01:42:37PM +0200, Rafael J. Wysocki wrote:
> On Thu, Oct 14, 2021 at 3:48 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > We have a couple of users of this helper, make it available for them.
> >
> > The prototype for the helper is specifically crafted in order to be
> > easily used with bus_find_device() call. That's why its location is
> > in the driver core rather than ACPI.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> OK, please feel free to add
> 
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> to all of the patches in this series.

Thank you, Rafael!

Greg, can it be applied now?

-- 
With Best Regards,
Andy Shevchenko


