Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 469AA46177
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 16:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728503AbfFNOrr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 10:47:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:28694 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729008AbfFNOrr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 10:47:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jun 2019 07:47:46 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga004.jf.intel.com with ESMTP; 14 Jun 2019 07:47:44 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hbnUV-0007wU-RO; Fri, 14 Jun 2019 17:47:43 +0300
Date:   Fri, 14 Jun 2019 17:47:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 3/3] i2c: i801: Remove linux/init.h and sort headers
Message-ID: <20190614144743.GP9224@smile.fi.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
 <20190613164529.63482-3-andriy.shevchenko@linux.intel.com>
 <20190614163041.13d5ee68@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614163041.13d5ee68@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 14, 2019 at 04:30:41PM +0200, Jean Delvare wrote:
> On Thu, 13 Jun 2019 19:45:29 +0300, Andy Shevchenko wrote:
> > There is no need to include linux/init.h when at the same time
> > we include linux/module.h.
> > 
> > Remove redundant inclusion.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index 03100f5fc0e9..5613c1ef1af4 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -85,7 +85,6 @@
> >  #include <linux/stddef.h>
> >  #include <linux/delay.h>
> >  #include <linux/ioport.h>
> > -#include <linux/init.h>
> >  #include <linux/i2c.h>
> >  #include <linux/i2c-smbus.h>
> >  #include <linux/acpi.h>
> 
> In my books, you should never rely on a header including for you
> another header you need. Is there a reason for not following that
> principle here?

init.h vs. module.h is a special case. Otherwise I agree with you.

-- 
With Best Regards,
Andy Shevchenko


