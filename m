Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E0430BD23
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 12:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhBBLbe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 06:31:34 -0500
Received: from mga17.intel.com ([192.55.52.151]:6959 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230319AbhBBL3e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Feb 2021 06:29:34 -0500
IronPort-SDR: Mfg/488EZG1NsiXVMVGwbHvLj29W8WOYlWqewBIsz83yGGVMvRAYZC7J62+9bJmDdvYcO3YXe/
 928gBCh2FJJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="160603654"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="160603654"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 03:27:43 -0800
IronPort-SDR: 2Rc0Ikw4v3gdbwgcJwco0+nR1oatilf8/ryPGdXG7K+2H+4ey6rP6I8ScbsETZ+vR3T1kOCBEy
 GN/VDhaWLS0Q==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370573944"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 03:27:39 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l6tqK-001NPV-2X; Tue, 02 Feb 2021 13:27:36 +0200
Date:   Tue, 2 Feb 2021 13:27:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
Message-ID: <YBk3KDs5FCffkQp1@smile.fi.intel.com>
References: <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com>
 <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
 <e2d7e5e9-920f-7227-76a6-b166e30e11e5@gmail.com>
 <CAJZ5v0gg5oXG3yOO9iDvPKSsadYrFojW6JcKfZcQbFFpO78zAQ@mail.gmail.com>
 <85ccf00d-7c04-b1da-a4bc-82c805df69c9@gmail.com>
 <CAJZ5v0jO9O1zhBMNRNB5kRt1o86BTjr1kRuFUe=nNVTDwBQhEg@mail.gmail.com>
 <0fac24d2-e8fc-7dc8-0f2f-44c7aadb1daf@gmail.com>
 <CAJZ5v0jVxMMGh6k-vXeBRsCtD0L14poNUrg4kZOpCfOz2sZGZQ@mail.gmail.com>
 <ee8f6b58-55c8-e0a0-c161-bdef361f9e0a@gmail.com>
 <d9ec0439-4323-51a2-70e7-c258fe63cd86@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9ec0439-4323-51a2-70e7-c258fe63cd86@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 02, 2021 at 09:58:17AM +0000, Daniel Scally wrote:
> On 21/01/2021 21:06, Daniel Scally wrote:
> > On 21/01/2021 18:08, Rafael J. Wysocki wrote:

...

> > No problem;  I'll tweak that then
> 
> Slightly walking back my "No problem" here; as I understand this there's
> kinda two options:
> 
> 1. Walk over the (locked) list, when a match is found unlock, run the
> callback and re-lock.
> 
> The problem with that idea is unless I'm mistaken there's no guarantee
> that the .next pointer is still valid then (even using the *_safe()
> methods) because either the next or the next + 1 entry could have been
> removed whilst the list was unlocked and the callback was being ran, so
> this seems a little unsafe.

It's easy to solve.
See an example in deferred_probe_work_func().

https://elixir.bootlin.com/linux/latest/source/drivers/base/dd.c#L75

> 2. Walk over the (locked) list twice, the first time counting matching
> entries and using that to allocate a temporary buffer, then walk again
> to store the matching entries into the buffer. Finally, run the callback
> for everything in the buffer, free it and return.
> 
> Obviously that's a lot less efficient than the current function, which
> isn't particularly palatable.
> 
> Apologies if I've missed a better option that would work fine; but
> failing that do you still want me to go ahead and change
> acpi_walk_dep_device_list() to do this (I'd choose #2 of the above), or
> fallback to using acpi_dev_get_next_dependent_dev() described above? If
> the latter, does acpi_walk_dep_device_list() maybe need re-naming to
> make clear it's not a generalised function?

-- 
With Best Regards,
Andy Shevchenko


