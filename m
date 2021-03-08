Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FCE331030
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 14:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhCHN5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 08:57:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:1940 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231355AbhCHN5O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 08:57:14 -0500
IronPort-SDR: Pwa/bL1bAo5fWRjaH9h1H2mveQFO8NwGxsf/CiKZXJxxHz8gfjOqDLKqZJOybkecKvf6YhRqVP
 ILcSlFOqQCjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="175140516"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="175140516"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 05:57:13 -0800
IronPort-SDR: y7vlO1ZA2ifHMhH+r9TWzkrV9NvFjAt1sBk3WHBE5e1lqHdlk6qXWckWfrSUFCrRF3XTbMxTIE
 N5f/lPC1De+Q==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="437486815"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 05:57:07 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lJGNc-00ApWj-AU; Mon, 08 Mar 2021 15:57:04 +0200
Date:   Mon, 8 Mar 2021 15:57:04 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>
Subject: Re: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
Message-ID: <YEYtME2AxpXBq6iF@smile.fi.intel.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-2-djrscally@gmail.com>
 <CAHp75VfPuDjt=ZfHkwErF7_6Ks6wpqXO8mtq-2KjV+mU_PXFtg@mail.gmail.com>
 <615bad5e-6e68-43c9-dd0b-f26d2832d52f@gmail.com>
 <CAHp75Vc2iwvh1RiYmQDPSvgNvGT_gBcGTK67F+MhWgXyoxqn0A@mail.gmail.com>
 <CAJZ5v0ijOhT3PVm6-gqnqycE-YZhD00dGbtK1UEV5nfrOF5Obw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ijOhT3PVm6-gqnqycE-YZhD00dGbtK1UEV5nfrOF5Obw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 08, 2021 at 02:36:27PM +0100, Rafael J. Wysocki wrote:
> On Sun, Mar 7, 2021 at 9:39 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Mar 7, 2021 at 3:36 PM Daniel Scally <djrscally@gmail.com> wrote:
> > > On 22/02/2021 13:34, Andy Shevchenko wrote:
> > > > On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
> > > >> The acpi_walk_dep_device_list() is not as generalisable as its name
> > > >> implies, serving only to decrement the dependency count for each
> > > >> dependent device of the input. Extend the function to instead accept
> > > >> a callback which can be applied to all the dependencies in acpi_dep_list.
> > > >> Replace all existing calls to the function with calls to a wrapper, passing
> > > >> a callback that applies the same dependency reduction.
> > > > The code looks okay to me, if it was the initial idea, feel free to add
> > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

...

> > > >> +void acpi_dev_flag_dependency_met(acpi_handle handle)

> > > > Since it's acpi_dev_* namespace, perhaps it should take struct acpi_device here?
> > >
> > > I can do this, but I avoided it because in most of the uses in the
> > > kernel currently there's no struct acpi_device, they're just passing
> > > ACPI_HANDLE(dev) instead, so I'd need to get the adev with
> > > ACPI_COMPANION() in each place. It didn't seem worth it...
> 
> It may not even be possible sometimes, because that function may be
> called before creating all of the struct acpi_device objects (like in
> the case of deferred enumeration).
> 
> > > but happy to
> > > do it if you'd prefer it that way?
> >
> > I see, let Rafael decide then. I'm not pushing here.
> 
> Well, it's a matter of correctness.

Looking at your above comment it is indeed. Thanks for clarification!
But should we have acpi_dev_*() namespace for this function if it takes handle?

For time being nothing better than following comes to my mind:

__acpi_dev_flag_dependency_met() => __acpi_flag_device_dependency_met()
acpi_dev_flag_dependency_met() => acpi_flag_device_dependency_met()

-- 
With Best Regards,
Andy Shevchenko


