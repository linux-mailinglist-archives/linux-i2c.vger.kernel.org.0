Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734EA450687
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 15:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhKOOWV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 09:22:21 -0500
Received: from mga02.intel.com ([134.134.136.20]:36029 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232130AbhKOOWE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 09:22:04 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220657292"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="220657292"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 06:19:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="494034756"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 06:19:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mmcoy-00779T-QA;
        Mon, 15 Nov 2021 16:18:56 +0200
Date:   Mon, 15 Nov 2021 16:18:56 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
Message-ID: <YZJsUHVhGFsImNvt@smile.fi.intel.com>
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
 <e62bf878-03df-1b93-2177-7b8a3be293c4@infradead.org>
 <CAHp75Vd71WPosA8Sy999Mb5ZiGEGg-y3vxYsYz3st5Ng2PJ98A@mail.gmail.com>
 <07932f56-ec2d-46a5-7c8e-3f4aab7afd35@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07932f56-ec2d-46a5-7c8e-3f4aab7afd35@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 12, 2021 at 08:43:16AM -0800, Randy Dunlap wrote:
> On 11/12/21 8:26 AM, Andy Shevchenko wrote:
> > On Fri, Nov 12, 2021 at 6:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > On 11/12/21 4:34 AM, Andy Shevchenko wrote:

...

> > > > + * @rinfo: I²C GPIO recovery information
> > > 
> > > Preferably:   "I2C"
> > 
> > Why?
> 
> See below vvvvvvvvvvvvvvvvv:
> > > like it is in thousands of places in the kernel source tree.

When is it good point to start following the spec?

> > UTF-8 has been established for more than a decade. I prefer to use the
> > proper form of the abbreviation (*).
> > 
> > *) Check UM10204.pdf.
> 
> Yes, I am aware of what is in the spec.

Wolfram, what do you prefer?

-- 
With Best Regards,
Andy Shevchenko


