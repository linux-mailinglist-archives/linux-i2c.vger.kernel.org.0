Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4F4190866
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 10:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgCXJCA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 05:02:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:1664 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgCXJCA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 05:02:00 -0400
IronPort-SDR: GAGj3M5W4uZTY/y74SERVxj7ckZiWc26YQnU1pjXJ9WIVA1VUFE8zIzQYtZynfRhjKImjskbU1
 roRz4TJPm5Lw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 02:01:59 -0700
IronPort-SDR: Gq+fBo+de6VwHGLYuipptn19/WUoGSQanE5ZXcDKKZrPna7ecQOTE8SYlxGbptgpgd/itJPZXM
 +PEEXLfUvpiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,299,1580803200"; 
   d="scan'208";a="235524456"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2020 02:01:57 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGfRg-00CU56-Ii; Tue, 24 Mar 2020 11:02:00 +0200
Date:   Tue, 24 Mar 2020 11:02:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] i2c: rcar: Consolidate timings calls in
 rcar_i2c_clock_calculate()
Message-ID: <20200324090200.GC1922688@smile.fi.intel.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-3-andriy.shevchenko@linux.intel.com>
 <20200323215420.GA10635@ninjato>
 <20200323220353.GZ1922688@smile.fi.intel.com>
 <20200324081328.GA1134@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324081328.GA1134@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 24, 2020 at 09:13:28AM +0100, Wolfram Sang wrote:
> Hi Andy,
> 
> > > Here, the initialization to 0 is missing, so some values are broken.
> > 
> > Yes, and this is fine. They are not being used. So, the idea is, whenever we
> > pass "false" as a parameter to the function we must take care of all fields we
> > are using.
> 
> Can be argued. Still, uninitialized values look a little sloppy IMO. I
> had a patch on top of this series to print the generated values as debug
> output, and '0' looks much more intentional there.
> 
> > > Why don't we just drop the pointer and init the array directly?
> > > 
> > > 	struct i2c_timings t = {
> > > 		.bus_freq_hz = ...
> > > 		...
> > > 	}
> > 
> > I can do it if you think it's better. I have no strong opinion here.
> > From code prospective I guess it will be something similar anyway.
> 
> I like it better. Easier to read in the code, no need for a seperate
> pointer. I can fix it locally here, though.

I already sent v4 the other day, but can update since I have got new tags to
pick up.

-- 
With Best Regards,
Andy Shevchenko


