Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87252186F41
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 16:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732114AbgCPPvR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 11:51:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:50340 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732107AbgCPPvQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 11:51:16 -0400
IronPort-SDR: oa3mzxqr2BxVDul0NPrSfSSuorHVXNmY6p2KSdc+E3TCvTT1CQeToj1H+ykwpr8ezDH8yPtoDG
 kdExAfLGWZ9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 08:51:16 -0700
IronPort-SDR: Ii+GkPr2VA5Cq+NnKoLabbvlVUVXlHsUn1Hz9eQuneQitvpU9qiXl5KJXAuEfWa8obrNwySjiB
 jq4j3aTqtm+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; 
   d="scan'208";a="247494599"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 16 Mar 2020 08:51:14 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jDs1N-00A6XA-6A; Mon, 16 Mar 2020 17:51:17 +0200
Date:   Mon, 16 Mar 2020 17:51:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/3] i2c: core: Provide generic definitions for bus
 frequencies
Message-ID: <20200316155117.GR1922688@smile.fi.intel.com>
References: <20200227122129.65516-1-andriy.shevchenko@linux.intel.com>
 <73b9a005-e4b1-5dbf-5769-ee0866ba8c4e@axentia.se>
 <20200306101049.GT1224808@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306101049.GT1224808@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 06, 2020 at 12:10:49PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 05, 2020 at 09:58:29PM +0000, Peter Rosin wrote:
> > On 2020-02-27 13:21, Andy Shevchenko wrote:

...

> > > +/* I2C Frequency Modes */
> > > +#define I2C_MAX_STANDARD_MODE_FREQ	100000
> > > +#define I2C_MAX_FAST_MODE_FREQ		400000
> > > +#define I2C_MAX_FAST_PLUS_MODE_FREQ	1000000
> > > +#define I2C_MAX_TURBO_MODE_FREQ		1400000
> > > +#define I2C_MAX_HIGH_SPEED_MODE_FREQ	3400000
> > > +#define I2C_MAX_ULTRA_SPEED_MODE_FREQ	5000000

> > I can't seem to
> > remember what frequency TURBO, HIGH, etc are and their ordering is
> > difficult. It's all sounds like marketing buzz to me and my brain shuts
> > off instantly.
> > 
> > This feels a lot like moving away from octal permissions for files, which
> > is frowned upon...
> > 
> > Can we include some kind of indication of the actual frequency in the
> > names as well please?
> > 
> > Perhaps something like I2C_MAX_STANDARD_MODE_100KHZ?
> 
> It's definitely a duplicate information here.
> 
> In I²C we have quite established range of frequencies (4 out of 6 in above
> list), so, their names already implying very well defined frequencies.

Actually 5 out of 6. In new version (just sent) I put a link to Wiki.

-- 
With Best Regards,
Andy Shevchenko


