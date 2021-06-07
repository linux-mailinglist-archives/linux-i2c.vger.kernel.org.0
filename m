Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334CA39E492
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 18:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhFGQ5n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 12:57:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:19124 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230250AbhFGQ5n (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 12:57:43 -0400
IronPort-SDR: HJUWde+KnLhLwVPxlQjIFxtFEmatFn5nONiLPyLErv/oOK5bwiICeXTR4RUtmlCFsYCq8wCMFH
 GVapl37Gi6WQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="184344400"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="184344400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 09:55:48 -0700
IronPort-SDR: w7321Y0by9hBWrMjP8VMMQ6whsw8We7vxDuXYvcBCy0xUWLCDBUYx5LQyh5GovCjjJrhcsslz/
 xkdc2e2AUgPQ==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="484842525"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 09:55:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lqIXO-000JBP-OX; Mon, 07 Jun 2021 19:55:42 +0300
Date:   Mon, 7 Jun 2021 19:55:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Joe Perches <joe@perches.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: Re: [PATCH v2 1/3] units: Add SI metric prefix definitions
Message-ID: <YL5PjhvfTXhUavSa@smile.fi.intel.com>
References: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
 <dbcd926e934dc66e17cc35c4c0d2b867474379e5.camel@perches.com>
 <YL5B1tIPNpQiWrQ/@smile.fi.intel.com>
 <e84d2094a6fc3c827e157b325addce4aa10b871f.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e84d2094a6fc3c827e157b325addce4aa10b871f.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 09:00:41AM -0700, Joe Perches wrote:
> On Mon, 2021-06-07 at 18:57 +0300, Andy Shevchenko wrote:
> > On Mon, Jun 07, 2021 at 08:43:02AM -0700, Joe Perches wrote:
> > > On Mon, 2021-06-07 at 18:23 +0300, Andy Shevchenko wrote:
> > > > Sometimes it's useful to have well-defined SI metric prefix to be used
> > > > to self-describe the formulas or equations.
> -=
> > > The only use of any of these seems to be:
> > > 
> > > sound/pcmcia/vx/vxp_ops.c:      [VX_MICRO]      = 0x0c,         // MICRO
> > > sound/pcmcia/vx/vxp_ops.c:              vx_outb(chip, MICRO, level);
> > > sound/pcmcia/vx/vxp_ops.c:                      vx_outb(chip, MICRO, vx_compute_mic_level(chip->mic_level));
> > > 
> > > and these vx_outb uses are themselves macros that prepend VX_ to the 2nd arg.
> > 
> > Is it a real issue there?
> 
> No, it's all good.

Thanks for confirming!

So, I will send v3 (I guess tomorrow) with L->UL and LL accordingly.

-- 
With Best Regards,
Andy Shevchenko


