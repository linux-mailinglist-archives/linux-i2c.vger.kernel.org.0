Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2EB39E14D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhFGP7I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:59:08 -0400
Received: from mga18.intel.com ([134.134.136.126]:40134 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230197AbhFGP7H (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 11:59:07 -0400
IronPort-SDR: x2OkIVTSiRqXAUxR4TbRXg6dqvlr8d9Tzg9zWXTRKTKOPrLI/9ynccbyspHe02SlHAU6RcJRMG
 QXh7wwmnHnaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="191976191"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="191976191"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 08:57:15 -0700
IronPort-SDR: Mjg2ogYAsPiGswkaDtMJ8xZZa5NW5nWMk2JGKsvQc1jmoc2pVOR5/TX8TS1B4Vlt1OStTfaGP5
 I884SzezzcwA==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="449136178"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 08:57:13 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lqHck-000INZ-MJ; Mon, 07 Jun 2021 18:57:10 +0300
Date:   Mon, 7 Jun 2021 18:57:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Joe Perches <joe@perches.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: Re: [PATCH v2 1/3] units: Add SI metric prefix definitions
Message-ID: <YL5B1tIPNpQiWrQ/@smile.fi.intel.com>
References: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
 <dbcd926e934dc66e17cc35c4c0d2b867474379e5.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbcd926e934dc66e17cc35c4c0d2b867474379e5.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 08:43:02AM -0700, Joe Perches wrote:
> On Mon, 2021-06-07 at 18:23 +0300, Andy Shevchenko wrote:
> > Sometimes it's useful to have well-defined SI metric prefix to be used
> > to self-describe the formulas or equations.

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

> Somewhat surprisingly to me, this seems safe.
> 
> (though I suggest using UL and ULL rather than L and LL)

Okay.

> The only use of any of these seems to be:
> 
> sound/pcmcia/vx/vxp_ops.c:      [VX_MICRO]      = 0x0c,         // MICRO
> sound/pcmcia/vx/vxp_ops.c:              vx_outb(chip, MICRO, level);
> sound/pcmcia/vx/vxp_ops.c:                      vx_outb(chip, MICRO, vx_compute_mic_level(chip->mic_level));
> 
> and these vx_outb uses are themselves macros that prepend VX_ to the 2nd arg.

Is it a real issue there?

(Yes, I saw it, but I didn't check compilation in the assumption that units.h
 is not anyhow included in that file).

Okay, I have compiled it, no problems registered.

-- 
With Best Regards,
Andy Shevchenko


