Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DE03F8A2A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Aug 2021 16:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhHZOfn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Aug 2021 10:35:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:27248 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231458AbhHZOfn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Aug 2021 10:35:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="197322028"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="197322028"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:34:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="684954512"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:34:53 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mJGSt-00E0BU-Hl; Thu, 26 Aug 2021 17:34:47 +0300
Date:   Thu, 26 Aug 2021 17:34:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Jean Delvare <jdelvare@suse.de>, Tony Lindgren <tony@atomide.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
Message-ID: <YSemhwn5gS7GA3sA@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <10690555-2317-4916-70b8-870708858f9b@gmail.com>
 <YRPvtPid3EeMylSr@smile.fi.intel.com>
 <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
 <YRTubuupevq0JMbW@smile.fi.intel.com>
 <YRwY/q2y3eIjc/nr@kunai>
 <20210826160021.67b7ed92@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826160021.67b7ed92@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 26, 2021 at 04:00:21PM +0200, Jean Delvare wrote:
> On Tue, 17 Aug 2021 22:15:58 +0200, Wolfram Sang wrote:

Jean, thanks for your response. My 2 cents below.

> > > > > I dunno if it's being discussed, but with this you effectively allow user to
> > > > > override the setting. It may screw things up AFAIU the comment above.
> > > >
> > > > No, this hasn't been discussed. At least not now. Thanks for the hint.
> > > > This attribute is writable for the root user, so we could argue that
> > > > the root user has several options to break the system anyway.
> 
> This is something we hear frequently when people don't want to address
> problems in their code, but that's not enough to convince me ;-)
> 
> > > But it will mean the side effect on this driver and typical (root-run) system
> > > application (systemd like?) should care now the knowledge about this
> > > side-effect. I do not think it is desired behaviour. But I'm not a maintainer
> > > and I commented here just to make everybody understand the consequences of the
> > > change.
> 
> Is systemd going to actually make any change to that attribute? I'm no
> systemd expert, but I can't see any option in the configuration files
> that would be related to autosuspend.
> 
> > Jean, are you still fine with this patch then?
> 
> My original position was that there are a few other drivers already
> doing "this". It's not like we are doing something completely new and
> using an API in a way it had never been used before, so it can't be
> that bad.
> 
> On the other hand, after taking a closer look, I'm not fully certain
> that "this" is exactly the same in all these drivers. For example, in
> blk-pm.c, pm_runtime_set_autosuspend_delay() is being called with value
> -1 initially, but with the idea that someone else (device driver, user)
> may set a positive value later. It's not a permanent disable.

Correct, it's expected that either system wide tool or user with enough
privileges may enable it.

> The 8250_omap driver,

Oh, no, please, do not use that driver as an example for runtime PM. It's
(somehow) broken there! I Cc'ed Tony in case you have more Q:s about it.
It's on a healing curve, though.

The idea behind I believe is the same, i.e. to allow user to turn it on
and off.

> however, seems to match the i2c-i801 driver here (I
> say "seems" because honestly I'm not sure I fully understand the
> comments there, but my understanding is that at least in some
> situations, enabling autosuspend later would cause problems).
> 
> That being said, it starts looking like a problem for the PM subsystem
> maintainers. Basically Heiner is trying to move away from an API which
> requires cleaning up on driver removal. This is definitely the
> direction we are collectively taking for years now (the whole devm_*
> family of functions is about exactly that). So it's considered a good
> thing.
> 
> If pm_runtime_set_autosuspend_delay() is not suitable for the task then
> maybe we need a better API. I will admit I'm at a loss when it comes to
> the many pm_runtime_* calls, I'm not going to claim I fully understand
> what each of them is doing exactly. But don't we want to simply call
> pm_runtime_dont_use_autosuspend() here?
> 
> If not and there's no suitable API for the task at the moment, then
> better do not apply this patch, and instead ask the PM subsystem
> maintainers if they would be willing to implement what we need.

-- 
With Best Regards,
Andy Shevchenko


