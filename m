Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF3D39DEE0
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 16:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhFGOhE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 10:37:04 -0400
Received: from mga18.intel.com ([134.134.136.126]:32147 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230269AbhFGOhD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 10:37:03 -0400
IronPort-SDR: YHus5ZZzPt5RsI8lgm/Z+XWoGpEkWJN4P6hKwuDudl6LEP4KhqVXeL73D5Ki8T4505GmX8MxAM
 HHqoOdXwmJ1g==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="191959861"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="191959861"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 07:35:09 -0700
IronPort-SDR: lP96tSyzQjCd5f+8yCXUz1wRB/pPr/tGbKxcrARGSRDxd2Q/BLgej5NK5IkiqbXRJi+oZPq3Ct
 lijFHHJEdQ9g==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="447501697"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 07:35:07 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lqGLJ-000HE8-7E; Mon, 07 Jun 2021 17:35:05 +0300
Date:   Mon, 7 Jun 2021 17:35:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: Re: [PATCH resend v1 1/3] units: Add SI metric prefix definitions
Message-ID: <YL4umVT+TMPuNx+/@smile.fi.intel.com>
References: <20210603160433.35816-1-andriy.shevchenko@linux.intel.com>
 <0466dab7-f2d2-3b7c-52a6-a12a6b09a67f@linux.intel.com>
 <YL4sLLQ/Y+GafaeH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YL4sLLQ/Y+GafaeH@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 05:24:44PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 07, 2021 at 03:33:31PM +0300, Jarkko Nikula wrote:
> > On 6/3/21 7:04 PM, Andy Shevchenko wrote:
> > > Sometimes it's useful to have well-defined SI metric prefix to be used
> > > to self-describe the formulas or equations.
> > > 
> > > List most popular ones in the units.h.
> 
> ...
> 
> > > +/* Metric prefixes in accordance with Système international (d'unités) */
> > > +#define PETA	1000000000000000LL
> > > +#define TERA	1000000000000LL
> > > +#define GIGA	1000000000L
> > > +#define MEGA	1000000L
> > > +#define KILO	1000L
> > > +#define HECTO	100L
> > > +#define DECA	10L
> > > +#define DECI	10L
> > > +#define CENTI	100L
> > > +#define MILLI	1000L
> > > +#define MICRO	1000000L
> > > +#define NANO	1000000000L
> > > +#define PICO	1000000000000LL
> > > +#define FEMTO	1000000000000000LL
> > 
> > For me milli is always 1/1000.
> 
> For me as well. Kernel does not operate with float point numbers.
> That's why it's ordered like this.
> 
> > Might lead to confusion with these defines if
> > idea is to multiply with KILO but divide with MILLI?
> 
> If the author of the hypothetical driver doesn't understand this, maybe
> they can ask first, but I am an optimist here and I assume that whoever
> writes the driver for a sensor / etc has a minimum education to see
> what's needed for the certain case.

Writing this, I think that I'm not so educated :-)

What we have in I²C case is kHz * ns = 10^3 * 10^-9, so we need to divide by
10^-6 to normalize the numbers. Sounds like MICRO is the correct thing to use
there.

-- 
With Best Regards,
Andy Shevchenko


