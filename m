Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F987727D6
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 16:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbjHGOel (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 10:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjHGOek (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 10:34:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D1710DC;
        Mon,  7 Aug 2023 07:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691418879; x=1722954879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v4xqKW8p2viTjPZQBKfB1fbP8M/LmC87fd1WQSSQbrU=;
  b=hEpbQOIMfmBqF1Z4yWPewwLErbpkeX78uFjKKJuU/T34c+ZZ0RnmxmMp
   Rew44FeTK1DTHpusxA1DBGZtfwsg9dtugW+o+eVKbqEpV5tvUYUKIcwMN
   aQJxNQUIzKjB8n7l65sLLBA4noHN+qi+BOFqsUJ/E6pKymi0y+EfESLk8
   YIL6NuGQOKd2UxcvNomTO9IKGef8TYZpmMc39u2NqYWFFBKixgUvNzhlM
   oMuiVpgSZByp+ErF2shTbAdGTzgiHKqS4j3hM64sRwvSXq/vGFIr7gWxx
   l2vbWfZyShQvfO8l9MPTScr3R0TRh4ySs3MTrEktZuQ7tl/nkYk7X8Hlc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="436889884"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="436889884"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 07:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845047448"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="845047448"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2023 07:34:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qT1J9-00FWTt-2h;
        Mon, 07 Aug 2023 17:34:07 +0300
Date:   Mon, 7 Aug 2023 17:34:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 5/9] i2c: designware: Always provide ID tables
Message-ID: <ZNEA3w2DEbK+e+my@smile.fi.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-6-andriy.shevchenko@linux.intel.com>
 <7be19d99-b197-662c-5157-dfdd9c793e3c@linux.intel.com>
 <ZMgT8bYGnGwTSAPf@smile.fi.intel.com>
 <20230804210055.i4hnjsr4ltfak53e@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804210055.i4hnjsr4ltfak53e@intel.intel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 04, 2023 at 11:00:55PM +0200, Andi Shyti wrote:
> On Mon, Jul 31, 2023 at 11:05:05PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 28, 2023 at 03:33:59PM +0300, Jarkko Nikula wrote:
> > > On 7/25/23 17:30, Andy Shevchenko wrote:

...

> > > > +/* Work with hotplug and coldplug */
> > > > +MODULE_ALIAS("platform:i2c_designware");
> > > 
> > > Perhaps this comment can be retired, i.e. dropped.
> > 
> > Then it needs to be done in a separate patch, because in the other file the
> > comment will be left untouched.
> 
> You are being a bit too religios here...

No, it's being consistent. Either we remove them both or don't touch.

> if you want to stick to
> this, then you need to send a patch for sorting by ID, a patch
> for grouping together MODULE_*, a patch to remove this comment
> and a patch to always provide the id table.
> 
> I think, "while at it", you can safely remove the redundant
> comment :)
> 
> It doesn't make too much difference to me anyway:
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


