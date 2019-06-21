Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF3384E731
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 13:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfFULen (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 07:34:43 -0400
Received: from mga02.intel.com ([134.134.136.20]:24788 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbfFULen (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jun 2019 07:34:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jun 2019 04:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,400,1557212400"; 
   d="scan'208";a="151232195"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga007.jf.intel.com with ESMTP; 21 Jun 2019 04:34:41 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1heHoW-00041A-Gc; Fri, 21 Jun 2019 14:34:40 +0300
Date:   Fri, 21 Jun 2019 14:34:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 2/2] i2c: i801: Remove linux/init.h and sort headers
Message-ID: <20190621113440.GK9224@smile.fi.intel.com>
References: <20190619151248.75618-1-andriy.shevchenko@linux.intel.com>
 <20190619151248.75618-2-andriy.shevchenko@linux.intel.com>
 <20190620152410.627ec14b@endymion>
 <20190620173256.GS26627@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620173256.GS26627@windriver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 20, 2019 at 01:32:56PM -0400, Paul Gortmaker wrote:
> [Re: [PATCH v2 2/2] i2c: i801: Remove linux/init.h and sort headers] On 20/06/2019 (Thu 15:24) Jean Delvare wrote:
> 
> > Hi Andy,
> > 
> > On Wed, 19 Jun 2019 18:12:48 +0300, Andy Shevchenko wrote:
> > > There is no need to include linux/init.h when at the same time
> > > we include linux/module.h.
> > > 
> > > Remove redundant inclusion.
> > > 
> > > For more details, refer to the commit
> > >   0fd972a7d91d ("module: relocate module_init from init.h to module.h")
> > > where the split had been introduced.
> > 
> > I've read it. It's not a split, it's a move. A move which makes sense
> > because, as explained in the commit message, module_init() is only
> > needed by modular code, so including it in init.h was slowing down the
> > pre-processing of non-modular code.
> > 
> > That being said, this alone does not imply that explicit inclusion of
> > both linux/init.h and linux/module.h in the same file is wrong. The
> 
> Agreed.  If one looks at all the many follow-on changes that relocation
> enabled, they will see that related changes are a "downgrade" of
> module.h to init.h inclusion - to reduce CPP overhead as stated above.
> 
> To be clear, that kind of change does NOT introduce any implicit header
> use, but the reverse:  init.h ---> module.h DOES introduce implicit use.
> 
> I've never intentionally removed init.h from a file just because
> module.h was already present.
> 
> I don't think implicit header inclusion is a good thing.  It leads to
> random compile failures that pop up depending on what is in your .config
> file and/or what architecture you are building for, etc etc.
> 
> Those issues wont happen from the patch proposed here, since module.h
> does explictly draw in init.h -- but that still doesn't make it right.
> 
> Note that solving all cases of implicit use of init.h is a totally
> different problem space than what I set out to tackle, as it doesn't
> impact CPP loading, and as Jean implies, it might not be worth tackling
> that problem - definitely not with 4000 individual commits!

Thank you for explanation.

-- 
With Best Regards,
Andy Shevchenko


