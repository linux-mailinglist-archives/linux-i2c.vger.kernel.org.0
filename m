Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D3A2805A2
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Oct 2020 19:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732795AbgJARk6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Oct 2020 13:40:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:13978 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732096AbgJARk5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Oct 2020 13:40:57 -0400
IronPort-SDR: /5bs0QYRhWBf2O+4m16ItWErilKLoaLqQBiiYB0m203ziEKOWAiTSaEPRE5Cnkg3kSQz1pAgf6
 n5Iz2LgIK3tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="163650045"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="163650045"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 10:40:56 -0700
IronPort-SDR: MCXDRqQZOepaqaV9bmXjhsE4cmN81J+zNy1QBx7+SBPTHHRgjL+yK4UxtywV436mpunpxcbP00
 NOF/rTiMO38g==
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="339633448"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 10:40:53 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kO2ZS-003H5E-LL; Thu, 01 Oct 2020 20:40:46 +0300
Date:   Thu, 1 Oct 2020 20:40:46 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Avi Fishman <avifishman70@gmail.com>
Cc:     Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Alex Qiu <xqiu@google.com>, Kun Yi <kunyi@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using
 debugfs.
Message-ID: <20201001174046.GK3956970@smile.fi.intel.com>
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 01, 2020 at 08:13:49PM +0300, Avi Fishman wrote:
> Hi Andy,
> 
> Customers using BMC with complex i2c topology asked us to support
> changing bus frequency at run time, for example same device will
> communicate with one slave at 100Kbp/s and another with 400kbp/s and
> maybe also with smae device at different speed (for example an i2c
> mux).
> This is not only for debug.

The above design is fragile to start with. If you have connected peripheral
devices with different speed limitations and you try to access faster one the
slower ones may block and break the bus which will need recovery.

> Can DT overlay support that?

Probably. DT overlay describes the update in the device topology, including
certain device properties.

P.S. Please do not top post.

> On Thu, Oct 1, 2020 at 6:40 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Oct 1, 2020 at 8:34 AM Tali Perry <tali.perry1@gmail.com> wrote:
> > > On Wed, Sep 30, 2020 at 12:31 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> > > > > Systems that can dinamically add and remove slave devices
> > > >
> > > > dynamically
> > > >
> > > > > often need to change the bus speed in runtime.
> > > >
> > > > > This patch exposes the bus frequency to the user.
> > > >
> > > > Expose the bus frequency to the user.
> > > >
> > > > > This feature can also be used for test automation.
> > > >
> > > > In general I think that DT overlays or so should be user rather than this.
> > > > If we allow to change bus speed settings for debugging purposes it might make
> > > > sense to do this on framework level for all drivers which support that (via
> > > > additional callback or so).
> > >
> > > Do you mean adding something like this:
> >
> > Nope. I meant to use DT description for that. I²C core should cope
> > with DT already.
> > I do not understand why you need special nodes for that rather than DT
> > overlay which will change the speed for you.

-- 
With Best Regards,
Andy Shevchenko


