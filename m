Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B20EC18CB9F
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 11:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgCTKaB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 06:30:01 -0400
Received: from mga01.intel.com ([192.55.52.88]:57221 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726704AbgCTKaA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 06:30:00 -0400
IronPort-SDR: +hkpP6s4COR7KE+yLY0Zihocz3bEiPO5dkbU2H5ETNnETavxwacyEwaiq/P0JEwKR9UI+CtDdW
 Fprkrvda6vlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 03:30:00 -0700
IronPort-SDR: mlW5cCC1BNRW5546nmj0T8zbqIiq2OQB3KdmwI9frRFdpOt8cWT08PTwF/i2GmjRwWaa+NRC9I
 1p2H2oEqYlYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; 
   d="scan'208";a="239190409"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 20 Mar 2020 03:29:58 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jFEuf-00BKkN-5L; Fri, 20 Mar 2020 12:30:01 +0200
Date:   Fri, 20 Mar 2020 12:30:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v3 4/6] i2c: =?iso-8859-1?Q?stm?=
 =?iso-8859-1?Q?32f7=3A_switch_to_I=B2C?= generic property parsing
Message-ID: <20200320103001.GU1922688@smile.fi.intel.com>
References: <20200316154929.20886-4-andriy.shevchenko@linux.intel.com>
 <20200320082342.GA30425@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320082342.GA30425@gnbcxd0016.gnb.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 20, 2020 at 09:23:42AM +0100, Alain Volmat wrote:
> On Mon, Mar 16, 2020 at 05:49:27PM +0200, Andy Shevchenko wrote:
> > Switch to the new generic functions: i2c_parse_fw_timings().
> > 
> > While here, replace hard coded values with standard bus frequency definitions.

...

> >  static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
> >  				    struct stm32f7_i2c_setup *setup)
> >  {

> > +	i2c_parse_fw_timings(&pdev->dev, t, false);
> 
> Andy, thanks for the patch.
> Looks fine overall, apart from the above line which should be
> 
>         i2c_parse_fw_timings(i2c_dev->dev, t, false);

Oh, good catch!

If I read the code correctly it's an equivalent, but I see that we don't supply pdev.

I will fix it for v4.

-- 
With Best Regards,
Andy Shevchenko


