Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C095A16AA9D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 17:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgBXQB5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 11:01:57 -0500
Received: from mga03.intel.com ([134.134.136.65]:18224 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727895AbgBXQB5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 11:01:57 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 08:01:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="435947191"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2020 08:01:54 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j6GBA-004RCY-Ex; Mon, 24 Feb 2020 18:01:56 +0200
Date:   Mon, 24 Feb 2020 18:01:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Vladimir Zapolskiy <vz@mleia.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 19/40] i2c: lpc2k: Use generic definitions for bus
 frequencies
Message-ID: <20200224160156.GB10400@smile.fi.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-19-andriy.shevchenko@linux.intel.com>
 <db95daf2-bccf-1073-91d5-5e827e011645@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db95daf2-bccf-1073-91d5-5e827e011645@mleia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 05:35:54PM +0200, Vladimir Zapolskiy wrote:
> On 2/24/20 5:15 PM, Andy Shevchenko wrote:
> > Since we have generic definitions for bus frequencies, let's use them.

> > -		bus_clk_rate = 100000; /* 100 kHz default clock rate */
> > +		bus_clk_rate = I2C_STANDARD_MODE_FREQ; /* 100 kHz default clock rate */
> 
> The line above becomes longer than 80 symbols, please fix it by simply
> removing the comment, note that it might be an issue through the series.

Will do.

> Could I2C_STD_MODE_FREQ be a shorter and still acceptable name?

I/m fine with it, but I will wait for Wolfram and others to comment.

> After the requested fix:
> 
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


