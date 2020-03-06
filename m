Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 188EB17C13B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 16:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgCFPHD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 10:07:03 -0500
Received: from mga11.intel.com ([192.55.52.93]:6358 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726958AbgCFPHD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 10:07:03 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 07:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,522,1574150400"; 
   d="scan'208";a="234877023"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2020 07:07:01 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jAEZ5-007OE5-L0; Fri, 06 Mar 2020 17:07:03 +0200
Date:   Fri, 6 Mar 2020 17:07:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 2/5] i2c: mux: pca954x: Make use of device properties
Message-ID: <20200306150703.GO1748204@smile.fi.intel.com>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <20200305155352.39095-2-andriy.shevchenko@linux.intel.com>
 <cf0cf14f-4e43-2a9c-63ed-f5f03ea7b114@axentia.se>
 <20200306095413.GQ1224808@smile.fi.intel.com>
 <b19fb2ed-054a-3fc5-41d4-6ecf3ae1597b@axentia.se>
 <20200306135850.GF1748204@smile.fi.intel.com>
 <db6c657b-6b9c-77f9-f990-90e47f48688e@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db6c657b-6b9c-77f9-f990-90e47f48688e@axentia.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 06, 2020 at 03:57:50PM +0100, Peter Rosin wrote:
> On 2020-03-06 14:58, Andy Shevchenko wrote:
> > On Fri, Mar 06, 2020 at 12:48:14PM +0100, Peter Rosin wrote:
> >> On 2020-03-06 10:54, Andy Shevchenko wrote:
> >>> On Thu, Mar 05, 2020 at 09:05:56PM +0000, Peter Rosin wrote:
> >>>> On 2020-03-05 16:53, Andy Shevchenko wrote:
> >>>>> Device property API allows to gather device resources from different sources,
> >>>>> such as ACPI. Convert the drivers to unleash the power of device property API.
> >>>
> >>> ...
> >>>
> >>>>>  static const struct i2c_device_id pca954x_id[] = {
> >>>>> -	{ "pca9540", pca_9540 },
> >>>>> -	{ "pca9542", pca_9542 },
> >>>>> -	{ "pca9543", pca_9543 },
> >>>>> -	{ "pca9544", pca_9544 },
> >>>>> -	{ "pca9545", pca_9545 },
> >>>>> -	{ "pca9546", pca_9546 },
> >>>>> -	{ "pca9547", pca_9547 },
> >>>>> -	{ "pca9548", pca_9548 },
> >>>>> -	{ "pca9846", pca_9846 },
> >>>>> -	{ "pca9847", pca_9847 },
> >>>>> -	{ "pca9848", pca_9848 },
> >>>>> -	{ "pca9849", pca_9849 },
> >>>>> +	{ "pca9540", .driver_data = (kernel_ulong_t)&chips[pca_9540] },
> >>>>> +	{ "pca9542", .driver_data = (kernel_ulong_t)&chips[pca_9542] },
> >>>>> +	{ "pca9543", .driver_data = (kernel_ulong_t)&chips[pca_9543] },
> >>>>> +	{ "pca9544", .driver_data = (kernel_ulong_t)&chips[pca_9544] },
> >>>>> +	{ "pca9545", .driver_data = (kernel_ulong_t)&chips[pca_9545] },
> >>>>> +	{ "pca9546", .driver_data = (kernel_ulong_t)&chips[pca_9546] },
> >>>>> +	{ "pca9547", .driver_data = (kernel_ulong_t)&chips[pca_9547] },
> >>>>> +	{ "pca9548", .driver_data = (kernel_ulong_t)&chips[pca_9548] },
> >>>>> +	{ "pca9846", .driver_data = (kernel_ulong_t)&chips[pca_9846] },
> >>>>> +	{ "pca9847", .driver_data = (kernel_ulong_t)&chips[pca_9847] },
> >>>>> +	{ "pca9848", .driver_data = (kernel_ulong_t)&chips[pca_9848] },
> >>>>> +	{ "pca9849", .driver_data = (kernel_ulong_t)&chips[pca_9849] },
> >>>>
> >>>> It feels odd/wrong to specifically name .driver_data when .name is not there.
> >>>> None or both...
> >>>
> >>> I will add .name as well.
> >>>
> >>>>> +	data->chip = device_get_match_data(dev);
> >>>>>  	if (!data->chip)
> >>>>>  		data->chip = &chips[id->driver_data];
> >>>>
> >>>> These two lines no longer make any sence.
> >>>
> >>> Please elaborate.
> >>>
> >>> IIRC Javier explained once that I�C ID table is still good to have to allow
> >>> enumeration from user space.
> >>
> >> id->driver_data is no longer an integer index into chips[].
>>> So, for the I2C
> >> ID table case, either device_get_match_data returns the .driver_data as-is
> >> from the pca954x_id array,
>>> or it returns NULL (I don't know which it is).
> > No, you took it wrong. device_get_match_data() operates with ACPI/DT tables.
> 
> <rant-mode>
> 
> What do you mean wrong? 

I meant that A is wrong.

> I said that either A or B holds but did not know which
> (with these definitions):
> 
> A. device_get_match_data() digs in the i2c_device_id table and returns the
>    .driver_data of the matching entry.
> B. device_get_match_data() behaves as of_device_get_match_data() and does not
>    dig in the i2c_device_id table, and therefore returns NULL when the driver
>    is probed that way.
> 
> And that in either of these cases your patch made no sense.
> 
> At least that was what I tried to say, using less words...
> 
> And then, according to you, B holds. So, I was right: either A or B holds. BTW,
> I obviously meant the either/or construct to be in the exclusive sense where
> both cannot hold (but my statement is also correct in the inclusive-or sense).
> 
> I would only have been wrong if the correct description had been some third
> option, which I had not mentioned. But that was apparently not the case.

-- 
With Best Regards,
Andy Shevchenko


