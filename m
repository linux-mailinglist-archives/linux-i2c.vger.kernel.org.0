Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F082A16BF10
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 11:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730353AbgBYKrJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 05:47:09 -0500
Received: from mga02.intel.com ([134.134.136.20]:40215 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729417AbgBYKrI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 05:47:08 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 02:47:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; 
   d="scan'208";a="410202926"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 25 Feb 2020 02:47:06 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j6Xk4-004dYU-Ph; Tue, 25 Feb 2020 12:47:08 +0200
Date:   Tue, 25 Feb 2020 12:47:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1 01/40] i2c: qup: Move bus frequency definitions to
 i2c.h
Message-ID: <20200225104708.GF10400@smile.fi.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200225102233.GA3677@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200225102233.GA3677@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 25, 2020 at 11:22:33AM +0100, Wolfram Sang wrote:
> On Mon, Feb 24, 2020 at 05:14:51PM +0200, Andy Shevchenko wrote:
> > Move bus frequency definitions to i2c.h for wider use.
> > 
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> A cover letter would have been nice so we could discuss the general
> appraoch there. And to read more about the motivation.

Motivation is simple:
 - Standardize the (small) set of mostly used bus frequences
 - Get rid of repetition of (subset) of above in many drivers
 - Reduce amount of potential typos

Let's discuss it here. I don't think new version of this would be good to have
without initial settlement.

> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -39,6 +39,13 @@ enum i2c_slave_event;
> >  typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
> >  			      enum i2c_slave_event event, u8 *val);
> >  
> > +#define HZ_PER_KHZ			1000
> 
> Unlike Jarkko, I think such macros help readability when calculating
> frequencies within drivers. However, they shouldn't be local to I2C if
> we agree on them. They should be available Linux-wide. There are some
> other (few) local implementations already.

I aware about that, but I would like to avoid I²C subsystem storming for
another change like this. So, let's consider this as a trampoline when in the
future we will switch entire subsystem to Linux wide header at once.

We have already same/similar definitions in the other drivers and I really
would like to avoid cross subsystem collisions.

> > +/* I2C Frequency Modes */
> > +#define I2C_STANDARD_MODE_FREQ		(100 * HZ_PER_KHZ)
> > +#define I2C_FAST_MODE_FREQ		(400 * HZ_PER_KHZ)
> > +#define I2C_FAST_MODE_PLUS_FREQ		(1000 * HZ_PER_KHZ)
> 
> For such a header, I'd prefer the plain number, though. There will be
> enough review to make sure we get it right ;)

No problem. I'm fine with either.

> Furthermore, I'd prefer to
> have 'MAX' in there, e.g. I2C_MAX_STANDARD_MODE_FREQ etc. Just to make
> clear that I2C can have other bus speeds as well.

Works for me.

Btw, what about Vladimir's comment WRT STANDARD -> STD? My personal opinion
that STD is a bit too short.

> And finally, I'd think all driver patches should be squashed into one,
> and all core ones into one etc. Or?

I'm fine with either. For reviewers it would be better I think to see only
their portion. Since I got a lot of tags already I consider I may squash it
together. So, what do you prefer?

-- 
With Best Regards,
Andy Shevchenko


