Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B10039DEA5
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 16:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFGO0o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 10:26:44 -0400
Received: from mga09.intel.com ([134.134.136.24]:19330 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230198AbhFGO0o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 10:26:44 -0400
IronPort-SDR: sbMYfQTA+IAwvhJDTDVb+E5viHmbCFJO2mooUQjklefImMa4b5FFVSepFmFoDD0KDJr7zap6Js
 XFvvThv5TQAw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204599635"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="204599635"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 07:24:49 -0700
IronPort-SDR: 3B2pL0UoeC87KJNkTDSWxwQc9k2MwVDXcmwJIidvMEs4Vz39dLyXrg6Ugd9hk9PFwdsiGKnqZJ
 E3Nintv3vikA==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="551901946"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 07:24:47 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lqGBI-000H6N-Ok; Mon, 07 Jun 2021 17:24:44 +0300
Date:   Mon, 7 Jun 2021 17:24:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: Re: [PATCH resend v1 1/3] units: Add SI metric prefix definitions
Message-ID: <YL4sLLQ/Y+GafaeH@smile.fi.intel.com>
References: <20210603160433.35816-1-andriy.shevchenko@linux.intel.com>
 <0466dab7-f2d2-3b7c-52a6-a12a6b09a67f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0466dab7-f2d2-3b7c-52a6-a12a6b09a67f@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 03:33:31PM +0300, Jarkko Nikula wrote:
> On 6/3/21 7:04 PM, Andy Shevchenko wrote:
> > Sometimes it's useful to have well-defined SI metric prefix to be used
> > to self-describe the formulas or equations.
> > 
> > List most popular ones in the units.h.

...

> > +/* Metric prefixes in accordance with Système international (d'unités) */
> > +#define PETA	1000000000000000LL
> > +#define TERA	1000000000000LL
> > +#define GIGA	1000000000L
> > +#define MEGA	1000000L
> > +#define KILO	1000L
> > +#define HECTO	100L
> > +#define DECA	10L
> > +#define DECI	10L
> > +#define CENTI	100L
> > +#define MILLI	1000L
> > +#define MICRO	1000000L
> > +#define NANO	1000000000L
> > +#define PICO	1000000000000LL
> > +#define FEMTO	1000000000000000LL
> 
> For me milli is always 1/1000.

For me as well. Kernel does not operate with float point numbers.
That's why it's ordered like this.

> Might lead to confusion with these defines if
> idea is to multiply with KILO but divide with MILLI?

If the author of the hypothetical driver doesn't understand this, maybe
they can ask first, but I am an optimist here and I assume that whoever
writes the driver for a sensor / etc has a minimum education to see
what's needed for the certain case.

-- 
With Best Regards,
Andy Shevchenko


