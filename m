Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5EA42C89D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 20:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbhJMS0s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 14:26:48 -0400
Received: from mga17.intel.com ([192.55.52.151]:59191 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229814AbhJMS0r (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 13 Oct 2021 14:26:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="208300343"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="208300343"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 11:24:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="441751910"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 11:24:41 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1malje-0002nh-H5;
        Thu, 14 Oct 2021 00:24:26 +0300
Date:   Thu, 14 Oct 2021 00:24:26 +0300
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
Subject: Re: [PATCH v3 1/3] driver core: Provide device_match_acpi_handle()
 helper
Message-ID: <YWdOilxGqREXPBAm@smile.fi.intel.com>
References: <20211007171815.28336-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0h2=LZ8YX9MP6_dcyyybRQC6rii-r1Lc_Ss1XFFBUiSGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0h2=LZ8YX9MP6_dcyyybRQC6rii-r1Lc_Ss1XFFBUiSGQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 13, 2021 at 07:47:37PM +0200, Rafael J. Wysocki wrote:
> On Thu, Oct 7, 2021 at 7:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > We have couple of users of this helper, make it available for them.
> 
> "a couple"?

Yep.

> >  EXPORT_SYMBOL(device_match_acpi_dev);
> >
> > +int device_match_acpi_handle(struct device *dev, const void *handle)
> 
> Hmmm.  Should the second arg be of type acpi_handle?

acpi_handle is not defined as struct and it means the header, where the
prototype is declared, will require acpi.h to be included. Besides that the
whole set of device_match_*() is done by the same prototype, so it can be used
in bus_find_device() calls.

> And doesn't this function belong to the ACPI core?  It is related to
> acpi_bus_get_device() and such which are located there.

Same as above. I don't think so.

-- 
With Best Regards,
Andy Shevchenko


