Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F245E731D25
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 17:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239318AbjFOPws (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jun 2023 11:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343749AbjFOPwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jun 2023 11:52:46 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF3018D;
        Thu, 15 Jun 2023 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686844365; x=1718380365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hTjPvLrhpjH9sRdy6Q9p9cBPgeBY5Gueb8oOzCcA7U4=;
  b=LpnSwRE1S42eSVf4P+m8LoryX7Q4Izk3nWyLMpCkdv7Rp4Jk2czDeyS5
   dyvPC6Um5a2JSnHMwxezBZwnLuv+d62ajyrqgnsHNMyuXncxOGILTeT6N
   87kOX3nnxYq0H4NtGmsab/BoAzGEsfMzrCEnuYEF+eDKAH3D0pi3SmUvr
   iIvBC54roVFA0c1/hDjt+iLyfuUbDT1cfbtSdC4IOe43RIZhWhUB/lr0r
   vgvnKpd9GiTiYeJlxmub3G2QpUYGKcL1EESO6kQ1GzVvTUl6cKcdGALjQ
   7WjEV+OktMXWTZNHU9KGJwx0rCLneIOF5GMOoO6on42zVfwsMqoBb26FU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348652234"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="348652234"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 08:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="689818935"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="689818935"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2023 08:50:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q9pEb-003ye9-2S;
        Thu, 15 Jun 2023 18:50:05 +0300
Date:   Thu, 15 Jun 2023 18:50:05 +0300
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     Michael Brunner <michael.brunner@kontron.com>
Cc:     "josef@oderland.se" <josef@oderland.se>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ingmar Klein <Ingmar.Klein@kontron.com>
Subject: Re: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Message-ID: <ZIszLQ+Jv8YJr4Mu@smile.fi.intel.com>
References: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
 <Yxj1ZQjBfdG1u93d@shikoro>
 <23c8fafe-af56-afb0-1257-222705bc36f3@oderland.se>
 <b8eff79f-0be0-e6a5-64ba-e085b0ea52b2@oderland.se>
 <Yxm9tlb4H7fspRMZ@smile.fi.intel.com>
 <60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 15, 2023 at 07:51:55AM +0000, Michael Brunner wrote:
> On Thu, 2022-09-08 at 13:02 +0300, Andy Shevchenko wrote:
> > On Thu, Sep 08, 2022 at 09:48:29AM +0200, Josef Johansson wrote:
> > > On 9/8/22 08:07, Josef Johansson wrote:
> > > > On 9/7/22 21:47, Wolfram Sang wrote:
> > > > > On Tue, Sep 06, 2022 at 06:55:07PM +0300, Andy Shevchenko
> > > > > wrote:

First of all, sorry for so-o lo-o-ong delay. Too many emails in a backlog.

...

> > > I compiled with linux-6.0.0-rc4 with your patch on top.
> > > 
> > > Have been running flawless so far. Boot showed no problems.

> We just noticed that this change prevents the usage of the i2c-scmi
> driver on basically all Kontron COMe based boards.

Does this device have resources defined in DSDT? Can you show all variants?

> The reason is the patch "ACPI / platform: Add SMB0001 HID to
> forbidden_id_list" submitted in November 2018 by Hans de Goede.


> The
> patch blacklists the SMB0001 HID that is also used by the COMe boards.
> This was due to issues with HP AMD based laptops according to the
> commit message.
> Ironically the commit message there states that it is OK to blacklist
> the HID as the device directly binds to the acpi_bus and therefore the
> platform_device is not needed anyway. This changed with this patch.
> 
> As this affects all systems using this HID, applying a patch that
> whitelists specific boards again in the acpi-platform driver doesn't
> seem to be a good solution to me.
> Therefore I would request to remove this patch again, unless someone
> has a better idea.

I have a better idea if the DSDT has no resources. See the Q above.

-- 
With Best Regards,
Andy Shevchenko


