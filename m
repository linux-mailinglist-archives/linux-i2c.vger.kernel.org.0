Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CD0425944
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 19:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbhJGRWo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 13:22:44 -0400
Received: from mga14.intel.com ([192.55.52.115]:8047 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233662AbhJGRWk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Oct 2021 13:22:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="226606451"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; 
   d="scan'208";a="226606451"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 10:02:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; 
   d="scan'208";a="458863397"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 10:01:57 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mYWmH-009bZU-OW;
        Thu, 07 Oct 2021 20:01:53 +0300
Date:   Thu, 7 Oct 2021 20:01:53 +0300
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
Subject: Re: [PATCH v2 3/3] gpiolib: acpi: Replace custom code with
 device_match_acpi_handle()
Message-ID: <YV8oAThCe2dR6K1n@smile.fi.intel.com>
References: <20211006173125.84423-1-andriy.shevchenko@linux.intel.com>
 <20211006173125.84423-3-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0iN+28gccy00_Ces9bYsLCNJaHaTZGMUwRrPA6TpY3H8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iN+28gccy00_Ces9bYsLCNJaHaTZGMUwRrPA6TpY3H8A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 07, 2021 at 06:50:46PM +0200, Rafael J. Wysocki wrote:
> On Wed, Oct 6, 2021 at 7:31 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > +       return gc->parent ? device_match_acpi_handle(gc->parent, data) : false;
> 
> return gc->parent && device_match_acpi_handle(gc->parent, data);
> 
> would work too if I'm not mistaken.

Seems so.

Thanks for review, I will update for v3.
Any other comments to the series?

-- 
With Best Regards,
Andy Shevchenko


