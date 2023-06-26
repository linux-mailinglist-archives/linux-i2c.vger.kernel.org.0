Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1925D73E09B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 15:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjFZN1K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 09:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjFZN1J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 09:27:09 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A41E1AB;
        Mon, 26 Jun 2023 06:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687786027; x=1719322027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9ng5AnCmQfRGGBiaPFf18ARsNicr/v2JOScpItK0kq0=;
  b=dv08GUdu+H1yXapZ2AwoIyQQAKh8kap1hR07H+nnJ0qTW+mL5OGlgvb2
   NwNi3F4Uqz6nRA/5OsJBwxGh2rwAacpISLKntB8Lij9V1keCpSthsbvci
   74QnZbLcSM9UuJjyM1nqm76yukEakIDO8WIXMTUygMBG+C0Zo2srzRnMI
   rBDBO71BfFocnyfzfjLqN37EnjrAuwI0DAzdKIpS1/N/umVIaBa7G32/E
   EyoyGlAgs9T35rkjrHt5mUz8T/+gv9r1IZoVkYxhkqViY9vgMggan0Acb
   kURQCDpPnpWLy9hvoqVBYDZJaIkbJo85FG3naoCFWEPozAxiGn8GIDWg0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="340856231"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="340856231"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 06:27:07 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="751095173"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="751095173"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 26 Jun 2023 06:27:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qDmFD-0002iG-0w;
        Mon, 26 Jun 2023 16:27:03 +0300
Date:   Mon, 26 Jun 2023 16:27:03 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Brunner <michael.brunner@kontron.com>
Subject: Re: [PATCH v2 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Message-ID: <ZJmSJ83Hvm+A9pK6@smile.fi.intel.com>
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jt8XCzUxQaBXLz0zXezih1Urq=dt-K9PWVY1JpN=Go6Q@mail.gmail.com>
 <ZJSQf07cO6qmNyCn@smile.fi.intel.com>
 <CAJZ5v0iKLtQpUnhMqB6zgwbURXGFZkje5rNORS9MLqYN=13nWg@mail.gmail.com>
 <ZJlJFtsXoC6JyLxY@smile.fi.intel.com>
 <ZJlsEggaJZc9u15T@smile.fi.intel.com>
 <CAJZ5v0iU5LXcjG8j+S1VZbBmTWGdOdM2W4Yf8HMou2=HQW0-nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0iU5LXcjG8j+S1VZbBmTWGdOdM2W4Yf8HMou2=HQW0-nA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 26, 2023 at 02:11:10PM +0200, Rafael J. Wysocki wrote:
> On Mon, Jun 26, 2023 at 12:44 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Jun 26, 2023 at 11:15:19AM +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 23, 2023 at 04:43:55PM +0200, Rafael J. Wysocki wrote:
> > > > On Thu, Jun 22, 2023 at 8:19 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Jun 22, 2023 at 05:53:13PM +0200, Rafael J. Wysocki wrote:
> > > > > > On Wed, Jun 21, 2023 at 5:16 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > BTW, this doesn't need to increment the count even.  It could just
> > > > terminate the walk on the first valid resource found and tell the
> > > > caller to return true in that case.
> > >
> > > Indeed, thank you for the hint!
> >
> > Actually it's doesn't matter if we count them or not, we still must use the
> > context of the call to set up a flag or whatever.
> 
> No, it is sufficient to pass a pointer to a bool variable.
> 
> > With the current code in mind I prefer to count resources and compare that
> > to be non-zero. This will help to read and understand code better.
> 
> I'm not sure.  The condition is "if there is at least one valid
> resource, skip the device".  Counting them all will make casual
> readers wonder why IMO.

Okay, Can you check v3 for the rest and I can send a v4 if nothing else there?

-- 
With Best Regards,
Andy Shevchenko


