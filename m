Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDDB473380
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 19:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbhLMSFi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 13:05:38 -0500
Received: from mga09.intel.com ([134.134.136.24]:52054 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233197AbhLMSFh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 13:05:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238605714"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="238605714"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 10:04:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="582992664"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 10:04:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mwpdB-005iN1-Sv;
        Mon, 13 Dec 2021 20:00:57 +0200
Date:   Mon, 13 Dec 2021 20:00:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v1 01/11] i2c: Introduce common module to instantiate
 CCGx UCSI
Message-ID: <YbeKWScx1HwCYJTs@smile.fi.intel.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
 <a0ac314f-9e9d-7749-6f22-fd3e44372288@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0ac314f-9e9d-7749-6f22-fd3e44372288@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 08, 2021 at 02:29:04PM +0200, Jarkko Nikula wrote:
> On 12/7/21 21:21, Andy Shevchenko wrote:
> > Introduce a common module to provide an API to instantiate UCSI device
> > for Cypress CCGx Type-C controller. Individual bus drivers need to select
> > this one on demand.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >   drivers/i2c/busses/Kconfig         |  7 +++++++
> >   drivers/i2c/busses/Makefile        |  3 +++
> >   drivers/i2c/busses/i2c-ccgx-ucsi.c | 27 +++++++++++++++++++++++++++
> >   drivers/i2c/busses/i2c-ccgx-ucsi.h | 11 +++++++++++
> >   4 files changed, 48 insertions(+)
> >   create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.c
> >   create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.h
> > 
> I've mixed feelings about this set. I'd either put patches 3-8 first since
> e.g. 6/11 and 8/11 are fixing existing issues or even better to split CCGx
> UCSI stuff into another set.

I have sent v2 with DesignWare patches only and no conversion part included.

-- 
With Best Regards,
Andy Shevchenko


