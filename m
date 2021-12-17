Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94ECE4789EA
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 12:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhLQLa5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 06:30:57 -0500
Received: from mga05.intel.com ([192.55.52.43]:27145 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229771AbhLQLa5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Dec 2021 06:30:57 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="326024635"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="326024635"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 03:30:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="465095078"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 03:30:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1myBR2-007OJ1-KC;
        Fri, 17 Dec 2021 13:30:00 +0200
Date:   Fri, 17 Dec 2021 13:30:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 4/6] i2c: designware-pci: Group MODULE_*() macros
Message-ID: <Ybx0uPds3auwqO7a@smile.fi.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
 <20211215151205.584264-4-jarkko.nikula@linux.intel.com>
 <YbutJCYnoMwjV6Zn@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbutJCYnoMwjV6Zn@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 10:18:28PM +0100, Wolfram Sang wrote:
> On Wed, Dec 15, 2021 at 05:12:03PM +0200, Jarkko Nikula wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > For better maintenance group MODULE_*() macros together.

> Removed an empty line and applied to for-next, thanks!

Agree on the change and thanks!

> > +MODULE_ALIAS("i2c_designware-pci");
> > +
> 
> This one.
> 
> >  MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");

-- 
With Best Regards,
Andy Shevchenko


