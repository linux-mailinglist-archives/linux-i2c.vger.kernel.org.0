Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349093C5E24
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jul 2021 16:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbhGLOTp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jul 2021 10:19:45 -0400
Received: from mga18.intel.com ([134.134.136.126]:35363 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234096AbhGLOTo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Jul 2021 10:19:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="197260743"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="197260743"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 07:16:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="412601806"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 07:16:53 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m2wjo-00CFs2-2P; Mon, 12 Jul 2021 17:16:48 +0300
Date:   Mon, 12 Jul 2021 17:16:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Joe Perches <joe@perches.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: Re: [PATCH v2 1/3] units: Add SI metric prefix definitions
Message-ID: <YOxO0C2JaFeExLry@smile.fi.intel.com>
References: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
 <ae919bae6c21e23b0a1ed0c9327738e59dd90aa0.camel@perches.com>
 <a6f0677c-70b0-2a51-a01b-f84bcacfc0bd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6f0677c-70b0-2a51-a01b-f84bcacfc0bd@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 08, 2021 at 11:42:46AM +0300, Jarkko Nikula wrote:
> On 6/7/21 10:09 PM, Joe Perches wrote:
> > On Mon, 2021-06-07 at 18:23 +0300, Andy Shevchenko wrote:
> > > +#define HECTO 100L
> > > +#define DECA 10L
> > 
> > Should it be DECA or DEKA or both?
> > 
> > https://www.nist.gov/pml/weights-and-measures/metric-si-prefixes
> > deka Example: dekameter da 	10**1 	Ten
> > 
> > > +#define DECI	10L
> > > +#define CENTI	100L
> > > +#define MILLI	1000L
> > > +#define MICRO	1000000L
> > > +#define NANO	1000000000L
> > > +#define PICO	1000000000000LL
> > > +#define FEMTO	1000000000000000LL
> > 
> > IMO: Might as well include all the prefixes up to 10**24
> > 
> > EXA ZETTA YOTTA, ATTA ZEPTO YOCTO
> > 
> > And how do people avoid using MILLI for KILO, MEGA for MICRO, etc...
> > The compiler won't care but usage could look odd.
> > I find this patch creates more confusion than solves a real problem
> (typo where one zero is missing or one extra) and adds potentially needless
> churn. For instance I don't assume much use for the HECTO now or in the
> future.
> 
> How about if absolutely necessary just adding only KILO, MEGA and GIGA and
> questionable defines only after when the real needs arises and can see does
> "1/1000L" etc define cause any troubles to real calculations?

You are probably looking to the I2C codebase, while I based my choice on other
sightings. I agree about the usage count for DECI/CENTI et al., but having them
defined targets at least the following:

 1) occupies namespace so if we need them in the future there will be no
    ambiguity;
 2) provides a name for multipliers for the code to read and understand the
    semantics better.

-- 
With Best Regards,
Andy Shevchenko


