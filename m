Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2266945AC0A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 20:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237879AbhKWTMv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 14:12:51 -0500
Received: from mga17.intel.com ([192.55.52.151]:53975 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235934AbhKWTMu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 14:12:50 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="215817155"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="215817155"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 11:09:42 -0800
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="497395793"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 11:09:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mpbAf-009sJq-4D;
        Tue, 23 Nov 2021 21:09:37 +0200
Date:   Tue, 23 Nov 2021 21:09:36 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
Message-ID: <YZ08cAbJ7MYuPq8h@smile.fi.intel.com>
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
 <e62bf878-03df-1b93-2177-7b8a3be293c4@infradead.org>
 <CAHp75Vd71WPosA8Sy999Mb5ZiGEGg-y3vxYsYz3st5Ng2PJ98A@mail.gmail.com>
 <07932f56-ec2d-46a5-7c8e-3f4aab7afd35@infradead.org>
 <767f36e9-e043-06dd-f847-7405524b432e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <767f36e9-e043-06dd-f847-7405524b432e@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 15, 2021 at 07:46:42AM -0800, Randy Dunlap wrote:
> On 11/12/21 8:43 AM, Randy Dunlap wrote:
> > On 11/12/21 8:26 AM, Andy Shevchenko wrote:
> > > On Fri, Nov 12, 2021 at 6:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > > On 11/12/21 4:34 AM, Andy Shevchenko wrote:
> > > 
> > > ...
> > > 
> > > > > + * @rinfo: I²C GPIO recovery information
> > > > 
> > > > Preferably:   "I2C"
> > > 
> > > Why?
> > 
> > See below vvvvvvvvvvvvvvvvv:
> > > > like it is in thousands of places in the kernel source tree.
> > 
> > 
> > > UTF-8 has been established for more than a decade. I prefer to use the
> > > proper form of the abbreviation (*).
> > > 
> > > *) Check UM10204.pdf.
> 
> 
> > > Yes, I am aware of what is in the spec.
> > 
> > Wolfram, what do you prefer?
> 
> > I prefer I2C. But it is more a reading habit. I would neither enforce
> > I2C nor I²C.
> 
> OK, let's leave it as Andy sent it then.
> 
> Acked-by: Randy Dunlap <rdunla@infradead.org>

Thanks!
Wolfram, can it be applied now or should I resend?

-- 
With Best Regards,
Andy Shevchenko


