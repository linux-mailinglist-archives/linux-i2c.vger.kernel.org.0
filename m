Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9F41900D7
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 23:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgCWWDw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 18:03:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:19436 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgCWWDw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 18:03:52 -0400
IronPort-SDR: LJ/YVtBB6a2sdhrtHB5kqo/sckj+tDEkV0KofiTP0BFQB+mwSDRaquWxP2KzVhU7AIL4A21PC+
 gKqNpqYiPyQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 15:03:51 -0700
IronPort-SDR: c1pCOKA8bo9ibpc+o3RBgcASIXDoioZ4r+nxHOtgnT/sam0vsTOZd6uuPSWwuIBgn/qx1LBgyC
 jBio7WUH8g2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; 
   d="scan'208";a="270025545"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2020 15:03:50 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGVAn-00CMZC-KF; Tue, 24 Mar 2020 00:03:53 +0200
Date:   Tue, 24 Mar 2020 00:03:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] i2c: rcar: Consolidate timings calls in
 rcar_i2c_clock_calculate()
Message-ID: <20200323220353.GZ1922688@smile.fi.intel.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-3-andriy.shevchenko@linux.intel.com>
 <20200323215420.GA10635@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323215420.GA10635@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 23, 2020 at 10:54:21PM +0100, Wolfram Sang wrote:
> 
> > +	struct i2c_timings i2c_t, *t = &i2c_t;
> >  
> >  	/* Fall back to previously used values if not supplied */
> > -	t->bus_freq_hz = t->bus_freq_hz ?: 100000;
> > -	t->scl_fall_ns = t->scl_fall_ns ?: 35;
> > -	t->scl_rise_ns = t->scl_rise_ns ?: 200;
> > -	t->scl_int_delay_ns = t->scl_int_delay_ns ?: 50;
> > +	t->bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
> > +	t->scl_fall_ns = 35;
> > +	t->scl_rise_ns = 200;
> > +	t->scl_int_delay_ns = 50;
> 
> Here, the initialization to 0 is missing, so some values are broken.

Yes, and this is fine. They are not being used. So, the idea is, whenever we
pass "false" as a parameter to the function we must take care of all fields we
are using.

> Why don't we just drop the pointer and init the array directly?
> 
> 	struct i2c_timings t = {
> 		.bus_freq_hz = ...
> 		...
> 	}

I can do it if you think it's better. I have no strong opinion here.
From code prospective I guess it will be something similar anyway.

-- 
With Best Regards,
Andy Shevchenko


