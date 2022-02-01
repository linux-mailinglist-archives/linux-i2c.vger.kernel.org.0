Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B241D4A6590
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 21:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238839AbiBAUUF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 15:20:05 -0500
Received: from mga18.intel.com ([134.134.136.126]:3651 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230400AbiBAUUE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Feb 2022 15:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643746804; x=1675282804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fiY3yiDt5X2wwa/6G2MvYGBBH/76OgCsDl6RxLQLt6s=;
  b=BlnEVfSTJpF483lGoD0hnk9XVbiJmQhlllCCUFS0FdA0R58WBQs6VyX0
   fiy7uaB6InK1yBaEsCIOM2JIhWdUJdUp2pW7jYJZKqWQUif4SsUF8xrIZ
   z3iQro6BCcUpY/XjT3Es8m0gGsQnRqHLVEdEf6bXTJ+QWwpI4iA7MgLsC
   c6o9eT/NST8LgBetpDSaOujxQtW0hwABsUGbnytHp72ccT0mmXIKojuMH
   fRC4yPErqLkRrlydVHgbZ1GgnwQ/xTv8EWhIFaFxH3OsH6HfPNuDWHfSe
   SlSSmZPteT8SD/Uz865JErF0YGrb920UH5Pg8+IhJcufjqzBbu4S3SsHO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="231350983"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="231350983"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 12:20:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="534635874"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 12:20:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nEzcB-00HSOz-Vo;
        Tue, 01 Feb 2022 22:18:59 +0200
Date:   Tue, 1 Feb 2022 22:18:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Wolfram Sang <wsa@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: ACPI: Replace acpi_bus_get_device()
Message-ID: <YfmVs3SUKpMFM/da@smile.fi.intel.com>
References: <4374434.LvFx2qVVIh@kreacher>
 <Yfl/Sneg9/HPOjBe@smile.fi.intel.com>
 <CAJZ5v0jFBFKMcjYieYCL1LTvRPuM7b8_5nBx0_wnPtobzg==fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jFBFKMcjYieYCL1LTvRPuM7b8_5nBx0_wnPtobzg==fw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 01, 2022 at 08:01:46PM +0100, Rafael J. Wysocki wrote:
> On Tue, Feb 1, 2022 at 7:44 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Feb 01, 2022 at 07:00:42PM +0100, Rafael J. Wysocki wrote:
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Replace acpi_bus_get_device() that is going to be dropped with
> > > acpi_fetch_acpi_dev().
> > >
> > > No intentional functional impact.
> >
> > ...
> >
> > > +     if (!adev || i2c_acpi_get_info(adev, &info, adapter, NULL))
> >
> > AFAICS the !adev check is redundant since acpi_device_enumerated() does it.
> 
> No.
> 
> acpi_device_enumerated() returns false if adev is NULL, so without
> this extra check i2c_acpi_get_info() will end up passing NULL to
> i2c_acpi_do_lookup().

I see now.

The patch LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> > >               return AE_OK;
> >
> > ...
> >
> > > +     struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
> > >
> > > -     if (i2c_acpi_do_lookup(adev, lookup))
> > > +     if (!adev || i2c_acpi_do_lookup(adev, lookup))
> > >               return AE_OK;
> >
> > Here we need it indeed.
> > Dunno, if acpi_dev_ready_for_enumeration() can gain the check itself.
> 
> Well, acpi_bus_get_status() would need it too.

-- 
With Best Regards,
Andy Shevchenko


