Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662111A8483
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 18:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391358AbgDNQUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 12:20:07 -0400
Received: from mga02.intel.com ([134.134.136.20]:27603 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391350AbgDNQUD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 12:20:03 -0400
IronPort-SDR: kkkaiB6aLwuvVfXxiw3XdN1r2NqNNYtk192KTKHTgHTJfOmjaChSXBR1hLm0PhHflJioQk1aWM
 vG9xq0iOc+hA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 09:20:02 -0700
IronPort-SDR: Uniw8aGwRafgMnt1epVZYXNJEIi43xLU5pP2a7ReUD9Sdw64p0IbrG8Yt5LV5yitn+JxWUCdFs
 s5zU6Zf4hW/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="454609288"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2020 09:20:00 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOOI6-000ZC3-Bp; Tue, 14 Apr 2020 19:20:02 +0300
Date:   Tue, 14 Apr 2020 19:20:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     linus.walleij@linaro.org, patrice.chotard@st.com, info@metux.net,
        allison@lohutok.net, nehal-bakulchandra.shah@amd.com,
        tglx@linutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: img-scb: remove duplicate dev_err()
Message-ID: <20200414162002.GX34613@smile.fi.intel.com>
References: <20200414142650.29359-1-zhengdejin5@gmail.com>
 <20200414143837.GV34613@smile.fi.intel.com>
 <20200414155047.GA10848@nuc8i5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414155047.GA10848@nuc8i5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 14, 2020 at 11:50:47PM +0800, Dejin Zheng wrote:
> On Tue, Apr 14, 2020 at 05:38:37PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 14, 2020 at 10:26:50PM +0800, Dejin Zheng wrote:
> > > it will print an error message by itself when platform_get_irq()
> > > goes wrong. so don't need dev_err() in here again.
> > 
> > In the future, please use something like this
> > 	scripts/get_maintainer.pl --git --git-min-percent=67
> > when retrieve Cc list for the mail.
> >
> Andy, Thank you for reminding me again, if I used it, There are only two
> email addresses. 
> 
> scripts/get_maintainer.pl --git --git-min-percent=67 v1-0001-i2c-img-scb-remove-duplicate-dev_err.patch
> linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS)
> linux-kernel@vger.kernel.org (open list)

Nice, you found a bug in MAINTAINERS database.

> > FWIW,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> Thanks very much for your review.

I recommend to resend a new version with those mailings lists followed by
Wolfram included in the Cc list. Don't forget to add my tag in the commit
message and bump the version.

-- 
With Best Regards,
Andy Shevchenko


