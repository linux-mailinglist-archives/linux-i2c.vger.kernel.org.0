Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39C2E4D557
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 19:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732036AbfFTRgE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 13:36:04 -0400
Received: from mail5.windriver.com ([192.103.53.11]:51744 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726530AbfFTRgE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jun 2019 13:36:04 -0400
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
        by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5KHX7Pf013234
        (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
        Thu, 20 Jun 2019 10:33:17 -0700
Received: from yow-pgortmak-d1.corp.ad.wrs.com (128.224.56.57) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.439.0; Thu, 20 Jun 2019 10:32:56 -0700
Received: by yow-pgortmak-d1.corp.ad.wrs.com (Postfix, from userid 1000)        id
 7F69A2E1475; Thu, 20 Jun 2019 13:32:56 -0400 (EDT)
Date:   Thu, 20 Jun 2019 13:32:56 -0400
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Jean Delvare <jdelvare@suse.de>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 2/2] i2c: i801: Remove linux/init.h and sort headers
Message-ID: <20190620173256.GS26627@windriver.com>
References: <20190619151248.75618-1-andriy.shevchenko@linux.intel.com>
 <20190619151248.75618-2-andriy.shevchenko@linux.intel.com>
 <20190620152410.627ec14b@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190620152410.627ec14b@endymion>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Re: [PATCH v2 2/2] i2c: i801: Remove linux/init.h and sort headers] On 20/06/2019 (Thu 15:24) Jean Delvare wrote:

> Hi Andy,
> 
> On Wed, 19 Jun 2019 18:12:48 +0300, Andy Shevchenko wrote:
> > There is no need to include linux/init.h when at the same time
> > we include linux/module.h.
> > 
> > Remove redundant inclusion.
> > 
> > For more details, refer to the commit
> >   0fd972a7d91d ("module: relocate module_init from init.h to module.h")
> > where the split had been introduced.
> 
> I've read it. It's not a split, it's a move. A move which makes sense
> because, as explained in the commit message, module_init() is only
> needed by modular code, so including it in init.h was slowing down the
> pre-processing of non-modular code.
> 
> That being said, this alone does not imply that explicit inclusion of
> both linux/init.h and linux/module.h in the same file is wrong. The

Agreed.  If one looks at all the many follow-on changes that relocation
enabled, they will see that related changes are a "downgrade" of
module.h to init.h inclusion - to reduce CPP overhead as stated above.

To be clear, that kind of change does NOT introduce any implicit header
use, but the reverse:  init.h ---> module.h DOES introduce implicit use.

I've never intentionally removed init.h from a file just because
module.h was already present.

I don't think implicit header inclusion is a good thing.  It leads to
random compile failures that pop up depending on what is in your .config
file and/or what architecture you are building for, etc etc.

Those issues wont happen from the patch proposed here, since module.h
does explictly draw in init.h -- but that still doesn't make it right.

Note that solving all cases of implicit use of init.h is a totally
different problem space than what I set out to tackle, as it doesn't
impact CPP loading, and as Jean implies, it might not be worth tackling
that problem - definitely not with 4000 individual commits!

Thanks,
Paul.
--

> only case where this commit would directly lead to the removal of
> #include <linux/init.h> from i2c-i801.c is if module_init() was the
> only thing from linux/init.h that this driver was using. Which is not
> the case, as I see various occurrences of __init and __exit left, and
> these are declared in linux/init.h.
> 
> As a matter of fact I still count 3921 driver files which include both
> linux/init.h and linux/module.h. And I see no comment in either header
> file that including one exempts you from including the other.
> 
> So I'm not taking this change, sorry. If this is really the direction
> you want us to take (and I'm not convinced, but my opinion does not
> necessarily matter), then it must be documented first, and I believe it
> should then be addressed tree-wide. 3921 individual commits do not seem
> to be the most efficient to get it done.
> 
> > Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index b9c5d7933d12..69c3ccb69669 100644
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
> -- 
> Jean Delvare
> SUSE L3 Support
