Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A3F73DC66
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 12:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjFZKom (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 06:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjFZKol (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 06:44:41 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DA4E60;
        Mon, 26 Jun 2023 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687776280; x=1719312280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ulzjEKt9TPFPosS7yZEKwHAFl3FmcOd566vv02OR1+8=;
  b=CGnOFrUvzSsjhnlwDqr1GevFin4FsUEoAdqimQEJhNcrwNWcFdCbYdCz
   zKQ7SF4l/eZz2qNp5BdqKeRyNX+zVyYjJRNpRmauWH01yZpjFTSPdV2Io
   G7VIEpH6L543UucYBzveR4xQ/Qrp9Gg+k3YsqLw0JZXEIrgRgVkMG4YLf
   MGrc42owf0l56q7hJqIo2R2wiMmXrrOxPPig9akiBf4DAABzYKG58rV/a
   TjP9tIqY6YoCLN4DY9VZwCK0sCpeF4l/j+1WL9q0wkNmDAuIE/flS/k97
   CP8tqYdfATlN2MNe5FoK57F0MeZc3VyZkZVzRirs60kfZp5Sg79xIkRZJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361278902"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="361278902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 03:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693441712"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="693441712"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 03:44:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qDjhy-006jkH-2a;
        Mon, 26 Jun 2023 13:44:34 +0300
Date:   Mon, 26 Jun 2023 13:44:34 +0300
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
Message-ID: <ZJlsEggaJZc9u15T@smile.fi.intel.com>
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jt8XCzUxQaBXLz0zXezih1Urq=dt-K9PWVY1JpN=Go6Q@mail.gmail.com>
 <ZJSQf07cO6qmNyCn@smile.fi.intel.com>
 <CAJZ5v0iKLtQpUnhMqB6zgwbURXGFZkje5rNORS9MLqYN=13nWg@mail.gmail.com>
 <ZJlJFtsXoC6JyLxY@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZJlJFtsXoC6JyLxY@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 26, 2023 at 11:15:19AM +0300, Andy Shevchenko wrote:
> On Fri, Jun 23, 2023 at 04:43:55PM +0200, Rafael J. Wysocki wrote:
> > On Thu, Jun 22, 2023 at 8:19 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Jun 22, 2023 at 05:53:13PM +0200, Rafael J. Wysocki wrote:
> > > > On Wed, Jun 21, 2023 at 5:16 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > BTW, this doesn't need to increment the count even.  It could just
> > terminate the walk on the first valid resource found and tell the
> > caller to return true in that case.
> 
> Indeed, thank you for the hint!

Actually it's doesn't matter if we count them or not, we still must use the
context of the call to set up a flag or whatever. With the current code in mind
I prefer to count resources and compare that to be non-zero. This will help to
read and understand code better.

That said, I will go with (*counter)++;

-- 
With Best Regards,
Andy Shevchenko


