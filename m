Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB0AB17B99C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 10:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgCFJyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 04:54:15 -0500
Received: from mga12.intel.com ([192.55.52.136]:53346 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbgCFJyO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 04:54:14 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 01:54:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,521,1574150400"; 
   d="scan'208";a="413840715"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 06 Mar 2020 01:54:11 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jA9gL-007K40-RV; Fri, 06 Mar 2020 11:54:13 +0200
Date:   Fri, 6 Mar 2020 11:54:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 2/5] i2c: mux: pca954x: Make use of device properties
Message-ID: <20200306095413.GQ1224808@smile.fi.intel.com>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <20200305155352.39095-2-andriy.shevchenko@linux.intel.com>
 <cf0cf14f-4e43-2a9c-63ed-f5f03ea7b114@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf0cf14f-4e43-2a9c-63ed-f5f03ea7b114@axentia.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 05, 2020 at 09:05:56PM +0000, Peter Rosin wrote:
> On 2020-03-05 16:53, Andy Shevchenko wrote:
> > Device property API allows to gather device resources from different sources,
> > such as ACPI. Convert the drivers to unleash the power of device property API.

...

> >  static const struct i2c_device_id pca954x_id[] = {
> > -	{ "pca9540", pca_9540 },
> > -	{ "pca9542", pca_9542 },
> > -	{ "pca9543", pca_9543 },
> > -	{ "pca9544", pca_9544 },
> > -	{ "pca9545", pca_9545 },
> > -	{ "pca9546", pca_9546 },
> > -	{ "pca9547", pca_9547 },
> > -	{ "pca9548", pca_9548 },
> > -	{ "pca9846", pca_9846 },
> > -	{ "pca9847", pca_9847 },
> > -	{ "pca9848", pca_9848 },
> > -	{ "pca9849", pca_9849 },
> > +	{ "pca9540", .driver_data = (kernel_ulong_t)&chips[pca_9540] },
> > +	{ "pca9542", .driver_data = (kernel_ulong_t)&chips[pca_9542] },
> > +	{ "pca9543", .driver_data = (kernel_ulong_t)&chips[pca_9543] },
> > +	{ "pca9544", .driver_data = (kernel_ulong_t)&chips[pca_9544] },
> > +	{ "pca9545", .driver_data = (kernel_ulong_t)&chips[pca_9545] },
> > +	{ "pca9546", .driver_data = (kernel_ulong_t)&chips[pca_9546] },
> > +	{ "pca9547", .driver_data = (kernel_ulong_t)&chips[pca_9547] },
> > +	{ "pca9548", .driver_data = (kernel_ulong_t)&chips[pca_9548] },
> > +	{ "pca9846", .driver_data = (kernel_ulong_t)&chips[pca_9846] },
> > +	{ "pca9847", .driver_data = (kernel_ulong_t)&chips[pca_9847] },
> > +	{ "pca9848", .driver_data = (kernel_ulong_t)&chips[pca_9848] },
> > +	{ "pca9849", .driver_data = (kernel_ulong_t)&chips[pca_9849] },
> 
> It feels odd/wrong to specifically name .driver_data when .name is not there.
> None or both...

I will add .name as well.

> > +	data->chip = device_get_match_data(dev);
> >  	if (!data->chip)
> >  		data->chip = &chips[id->driver_data];
> 
> These two lines no longer make any sence.

Please elaborate.

IIRC Javier explained once that I²C ID table is still good to have to allow
enumeration from user space.

-- 
With Best Regards,
Andy Shevchenko


