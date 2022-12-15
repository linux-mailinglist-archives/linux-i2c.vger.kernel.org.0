Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8642A64DDD2
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 16:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiLOPaF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 10:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiLOPaE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 10:30:04 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D711706E;
        Thu, 15 Dec 2022 07:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671118203; x=1702654203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9I9dS8c034MSDg9tfftG+xXCC+6/p97CGRGk/kyHm3c=;
  b=JrjzWUGGM4H3ECJ81o7If1YxmEf6s0BwTh/TdtrVlMFbL7eyCy6za7bz
   e4Mh0p4pKvzb94M3gB4mDMW980UNWE69zhCwT6McjlI2kZmxPaWF/NAq3
   +eBk2ZIOgMKsSD2OKFeCvApGXdwfMcFmxR3tOAi8Isem4VkS1RqE9wNs5
   pFbtVpLps8uEBadhFJc26ELz6Hojis+heBsbSkP+BzwX6UkmFmis0Cozr
   KwZxamH7OrEwiZk0Q3ZVHOE1Bh/T+YvHCXG+7pfNtt97H/EtSxsDZg1cd
   arM+qCbs8yGVLplk145W207DX8jBXnCHT2dDz0jTZzaFoMlVbVP2fXOld
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="345791514"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="345791514"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 07:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="642955361"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="642955361"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 15 Dec 2022 07:22:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p5q3l-00AOIm-2R;
        Thu, 15 Dec 2022 17:22:09 +0200
Date:   Thu, 15 Dec 2022 17:22:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "Hawa, Hanna" <hhhawa@amazon.com>, Wolfram Sang <wsa@kernel.org>,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information
 from device pinctrl
Message-ID: <Y5s7ofYGaec8+zIA@smile.fi.intel.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
 <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
 <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
 <Y5r2pZhe17dVBMme@smile.fi.intel.com>
 <CACRpkdbawj+Wg2D75MdZavcfyjRa2JRAvqROnNLVH7oMcZTdMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbawj+Wg2D75MdZavcfyjRa2JRAvqROnNLVH7oMcZTdMg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 15, 2022 at 03:06:13PM +0100, Linus Walleij wrote:
> On Thu, Dec 15, 2022 at 11:28 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Dec 15, 2022 at 10:15:35AM +0200, Hawa, Hanna wrote:
> > > On 12/14/2022 6:09 PM, Andy Shevchenko wrote:

...

> > > > > +     if (dev->dev->pins && dev->dev->pins->p)
> > > > > +             rinfo->pinctrl = dev->dev->pins->p;
> > > > Hmm... I don't see how this field is being used.
> > > > Can you elaborate?
> > >
> > > This field is used in i2c_generic_scl_recovery(), if it's not NULL then the
> > > flow will set the state to GPIO before running the recovery mechanism.
> > >         if (bri->pinctrl)
> > >                 pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
> >
> > OK, but why that function doesn't use the dev->pins->p if it's defined?
> > (As a fallback when rinfo->pinctrl is NULL.)
> 
> I don't understand the context of these things so can't say much
> about it.

Main question here is that, is it possible that GPIOs that back up I�C bus are
on the different pin control device that the bus pins themselves?

And while writing above I think it may be the case if we use additional
GPIO pins over the I�C bus for purpose of recovery. In such case the pin control
device can be different.

At the same time, the fallback option might still work, in case the pinctrl not
overridden and I�C bus has backed GPIO function (on SCL/SDA).

...

> > > I saw that that the change failed in complication for SPARC architecture, as
> > > the pins field is wraparound with CONFIG_PINCTRL in device struct. I though
> > > on two options to solve the compilation error, first by adding wraparound of
> > > CONFIG_PINCTRL when accessing the pins field. And the second option is to
> > > add get function in pinctrl/devinfo.h file, which return the pins field, or
> > > NULL in case the PINCTRL is not defined. Which option you think we can go
> > > with?
> >
> > Getter with a stub sounds better to me, so you won't access some device core
> > fields.
> >
> > Linus, what do you think about all these (including previous paragraph)?
> 
> A getter may be a good solution, it depends, it can also be pushed
> somewhere local in the designware i2c driver can it not?

Yeah, but my point in the above paragraph that it uses the generic recovery
mechanism which may (or may not?) utilise the same pin control as I�C bus
sitting on).

> I am thinking that the rest of the code that is using that field is
> certainly not going to work without pinctrl either.

-- 
With Best Regards,
Andy Shevchenko


