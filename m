Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47111CDB83
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 15:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbgEKNmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 09:42:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:8051 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729724AbgEKNmg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 May 2020 09:42:36 -0400
IronPort-SDR: qTsgd0Kb7lsE/pGIWJXJjNdRd+vTY8dZsQ3BAkrnGALVSVa5oNSt82SaHi9pkoH5Y+9ob07SKv
 btU17oqpEagg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 06:42:36 -0700
IronPort-SDR: mhRBRvFnL7+SUgxWEN4Hk8Mc6yzGTp6BTla5bTZWA972/Ozn6jOq/2Z/diI303hS/Lg6/4QyNn
 awEVaM9RwiTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; 
   d="scan'208";a="408920834"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 11 May 2020 06:42:35 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jY8ha-005z7K-Bd; Mon, 11 May 2020 16:42:38 +0300
Date:   Mon, 11 May 2020 16:42:38 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 1/4] i2c: designware: Split out
 i2c_dw_validate_speed() helper
Message-ID: <20200511134238.GI185537@smile.fi.intel.com>
References: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
 <228e9c62-60b9-e5b8-ea5e-e012df83479b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <228e9c62-60b9-e5b8-ea5e-e012df83479b@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 11, 2020 at 04:11:57PM +0300, Jarkko Nikula wrote:
> On 5/7/20 4:51 PM, Andy Shevchenko wrote:
> > In order to export array supported speed for wider use,
> > split out them along with i2c_dw_validate_speed() helper.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-core.h    | 31 +++++++++++++++++++++
> >   drivers/i2c/busses/i2c-designware-platdrv.c | 29 ++++---------------
> >   2 files changed, 36 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> > index 1674caf277451..626959573f894 100644
> > --- a/drivers/i2c/busses/i2c-designware-core.h
> > +++ b/drivers/i2c/busses/i2c-designware-core.h
> > @@ -9,6 +9,7 @@
> >    * Copyright (C) 2009 Provigent Ltd.
> >    */
> > +#include <linux/errno.h>
> >   #include <linux/i2c.h>
> >   #define DW_IC_DEFAULT_FUNCTIONALITY (I2C_FUNC_I2C |			\
> > @@ -351,3 +352,33 @@ extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
> >   #else
> >   static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
> >   #endif
> > +
> > +static const u32 i2c_dw_supported_speeds[] = {
> > +	I2C_MAX_HIGH_SPEED_MODE_FREQ,
> > +	I2C_MAX_FAST_MODE_PLUS_FREQ,
> > +	I2C_MAX_FAST_MODE_FREQ,
> > +	I2C_MAX_STANDARD_MODE_FREQ,
> > +};
> > +
> > +static inline int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
> > +{
> > +	struct i2c_timings *t = &dev->timings;
> > +	unsigned int i;
> > +
> > +	/*
> > +	 * Only standard mode at 100kHz, fast mode at 400kHz,
> > +	 * fast mode plus at 1MHz and high speed mode at 3.4MHz are supported.
> > +	 */
> > +	for (i = 0; i < ARRAY_SIZE(i2c_dw_supported_speeds); i++) {
> > +		if (t->bus_freq_hz == i2c_dw_supported_speeds[i])
> > +			break;
> > +	}
> > +	if (i == ARRAY_SIZE(i2c_dw_supported_speeds)) {
> > +		dev_err(dev->dev,
> > +			"%d Hz is unsupported, only 100kHz, 400kHz, 1MHz and 3.4MHz are supported\n",
> > +			t->bus_freq_hz);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> This header is included by every i2c-designware-*.c file and this inline
> function is not tiny. Would it be better to have this in
> i2c-designware-common.c instead?

Yes, but then we will need to export i2c_dw_supported_speeds as well as its
array size.

-- 
With Best Regards,
Andy Shevchenko


