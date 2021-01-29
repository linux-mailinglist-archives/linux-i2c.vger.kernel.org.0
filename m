Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568D1308A9C
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 17:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhA2Qsx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 11:48:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:45979 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231897AbhA2QrR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Jan 2021 11:47:17 -0500
IronPort-SDR: B59/eXfjBJ3CIayct6v8RglgwXoZu2XzaB/R4nspEyMMnK1P8xC8wQ2A5teBY3xdarNqxnWjLc
 nKjS6/Gn8/XA==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="159619157"
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="159619157"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 08:45:30 -0800
IronPort-SDR: R+iCT9/eHAZoyBswcVkY+gn5ALakrwvbm1Mm0e7rm3Fq+StKMNrRoZIfjqXwYkzob0Imw93dTz
 yBXqum8CJU+w==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="394834063"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 08:45:25 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 549D2208FD; Fri, 29 Jan 2021 18:45:22 +0200 (EET)
Date:   Fri, 29 Jan 2021 18:45:22 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v9 1/7] ACPI: scan: Obtain device's desired enumeration
 power state
Message-ID: <20210129164522.GJ32460@paasikivi.fi.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20210128232729.16064-1-sakari.ailus@linux.intel.com>
 <CAJZ5v0hdG1W0D5E6GbrTDiAjMyC0mSgb3Z2WEBy3hhb4iJhDNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hdG1W0D5E6GbrTDiAjMyC0mSgb3Z2WEBy3hhb4iJhDNw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rafael,

Thanks for the comments.

On Fri, Jan 29, 2021 at 03:07:57PM +0100, Rafael J. Wysocki wrote:
> On Fri, Jan 29, 2021 at 12:27 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Store a device's desired enumeration power state in struct
> > acpi_device_power_flags during acpi_device object's initialisation.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/acpi/scan.c     | 6 ++++++
> >  include/acpi/acpi_bus.h | 3 ++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> > index 1d7a02ee45e05..b077c645c9845 100644
> > --- a/drivers/acpi/scan.c
> > +++ b/drivers/acpi/scan.c
> > @@ -987,6 +987,8 @@ static void acpi_bus_init_power_state(struct acpi_device *device, int state)
> >
> >  static void acpi_bus_get_power_flags(struct acpi_device *device)
> >  {
> > +       unsigned long long pre;
> > +       acpi_status status;
> >         u32 i;
> >
> >         /* Presence of _PS0|_PR0 indicates 'power manageable' */
> > @@ -1008,6 +1010,10 @@ static void acpi_bus_get_power_flags(struct acpi_device *device)
> >         if (acpi_has_method(device->handle, "_DSW"))
> >                 device->power.flags.dsw_present = 1;
> >
> > +       status = acpi_evaluate_integer(device->handle, "_PRE", NULL, &pre);
> > +       if (ACPI_SUCCESS(status) && !pre)
> > +               device->power.flags.allow_low_power_probe = 1;
> 
> While this is what has been discussed and thanks for taking it into
> account, I'm now thinking that it may be cleaner to introduce a new
> object to return the deepest power state of the device in which it can
> be enumerated, say _DSE (Device State for Enumeration) such that 4
> means D3cold, 3 - D3hot and so on, so the above check can be replaced
> with something like
> 
> status = acpi_evaluate_integer(device->handle, "_PRE", NULL, &dse);

s/_PRE/_DSE/

?

> if (ACPI_FAILURE(status))

ACPI_SUCCESS?

>         device->power.state_for_enumeratin = dse;
> 
> And then, it is a matter of comparing ->power.state_for_enumeratin
> with ->power.state and putting the device into D0 if the former is
> shallower than the latter.
> 
> What do you think?

Sounds good. How about calling the function e.g.
acpi_device_resume_for_probe(), so runtime PM could be used to resume the
device if the function returns true?

-- 
Kind regards,

Sakari Ailus
