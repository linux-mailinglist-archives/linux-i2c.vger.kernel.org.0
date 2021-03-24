Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7083476E6
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 12:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbhCXLPp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 07:15:45 -0400
Received: from mga04.intel.com ([192.55.52.120]:18789 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230307AbhCXLPh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Mar 2021 07:15:37 -0400
IronPort-SDR: XO/saoMvCbBWiWbv7FAl5WIXexQYf0IReBYFznPK46ujPNktHQpnS9w/H+DFSZNHa304GTgYkA
 tM8Wb0KGfDIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188375067"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="188375067"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 04:15:37 -0700
IronPort-SDR: XLKJNpvFUsbR35vCLEwOhp3G4jerqnVfnT8+AFsYTe/yR6JpAis8J2ExGwLlV2hehbore39och
 SlNmLAGjCurw==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="415438964"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 04:15:34 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lP1U2-00FeQQ-Tw; Wed, 24 Mar 2021 13:15:30 +0200
Date:   Wed, 24 Mar 2021 13:15:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
Message-ID: <YFsfUizT5I2qBnXZ@smile.fi.intel.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
 <YFjNAvVTavCRt/C8@smile.fi.intel.com>
 <67500acc-860b-5a00-4c2a-566ee9be4a6a@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67500acc-860b-5a00-4c2a-566ee9be4a6a@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 24, 2021 at 06:07:17PM +0800, Yicong Yang wrote:
> On 2021/3/23 0:59, Andy Shevchenko wrote:
> > On Mon, Mar 22, 2021 at 07:10:12PM +0800, Yicong Yang wrote:

...

> > Missed mod_devicetable.h.
> > Probably missed property.h, but not sure.>
> 
> i think this has been included implicitly as the module compilation worked well.

The rule of thumb is to include headers you are direct user of. The implicit
inclusion is allowed if and only if there is a guarantee by explicit inclusion
that an implicit one will be included no matter what. I don't remember we have
such guarantee for mod_devicetable.h.

On top of that, it's performance wise to explicitly include, otherwise it's an
additional burden for compiler and thus on electrical plant and hence not
environment friendly. And all this for peanuts.

...

> >> +#define HISI_I2C_STD_SPEED_MODE		0x0
> >> +#define HISI_I2C_FAST_SPEED_MODE	0x1
> >> +#define HISI_I2C_HIGH_SPEED_MODE	0x2
> > 
> > Why not plain decimal numbers?
> 
> it's something will be written to the register, so i make them
> hexadecimal to better corresponding to the register fields.

Are they bits? No. Why hex numbers? Please, give a better justification.

...

> >> +	ctlr->bus_freq_hz = t.bus_freq_hz;
> > 
> >> +	ctlr->scl_fall_time = t.scl_fall_ns;
> >> +	ctlr->scl_rise_time = t.scl_rise_ns;
> >> +	ctlr->sda_hold_time = t.sda_hold_ns;
> > 
> > Why not simply to have the timings structure embedded into hisi_i2c_controller
> > one?
> > 
> 
> not all the fields of the timing structures are needed to be stored, only three
> of them are necessary.

Four as far as I see. But for the sake of standardization I would keep a whole
structure. It will be easier to grep and find users of it (looking into data
structures only).

...

> >> +	ctlr->dev = dev;
> > 
> > Would it make sense to assign aster getting IRQ resource...
> > 
> >> +	ctlr->iobase = devm_platform_ioremap_resource(pdev, 0);
> >> +	if (IS_ERR(ctlr->iobase))
> >> +		return PTR_ERR(ctlr->iobase);
> >> +
> >> +	ctlr->irq = platform_get_irq(pdev, 0);
> >> +	if (ctlr->irq < 0)
> >> +		return ctlr->irq;
> > 
> > ...somewhere here?
> 
> i cannot see any differences and some other drivers also assign the 'dev' before getting IRQ
> resources.
> 
> are there any considerations on this?

Of course. The rule of thumb: be lazy. Why do you assign earlier if
a) there are no users;
b) in between it may bail out with error
?

Give a better justification why it should be there.

...

> >> +	ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(ctlr->clk_rate_khz, 1000);
> > 
> > HZ_PER_KHZ ?
> 
> the macro is not public. seems it's redundant to have this macro which
> will only be used once.

It will be easier to see how many users of it we have. It's not needed to make
it public right now, but keeping something like

#define HZ_PER_KHZ  1000L

in this file will be helpful.

Give a better justification why it should not be there.

-- 
With Best Regards,
Andy Shevchenko


