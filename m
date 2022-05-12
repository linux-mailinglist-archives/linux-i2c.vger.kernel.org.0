Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABDC524A2A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 May 2022 12:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352551AbiELKV0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 May 2022 06:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352561AbiELKVX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 May 2022 06:21:23 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2064956C05;
        Thu, 12 May 2022 03:21:22 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="295207716"
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="295207716"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 03:21:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="624344471"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 03:21:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1np5wV-00FAGx-Ve;
        Thu, 12 May 2022 13:21:11 +0300
Date:   Thu, 12 May 2022 13:21:11 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v5 0/8] platform/x86: introduce p2sb_bar() helper
Message-ID: <Ynzfl9u4v6/JjwLM@smile.fi.intel.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
 <eff9907f-e92b-9115-bea7-b1093d1dc28e@redhat.com>
 <CAHp75Vcnq=Ou6QNyPjwC+HR9wJ2BheonTqmkGvQU0qFtHO2BDw@mail.gmail.com>
 <YnzaxiNBU1awfLoG@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnzaxiNBU1awfLoG@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 12, 2022 at 11:00:38AM +0100, Lee Jones wrote:
> On Wed, 11 May 2022, Andy Shevchenko wrote:
> > On Wed, May 11, 2022 at 6:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > On 5/10/22 17:14, Andy Shevchenko wrote:

...

> > > I must admit I have lost track of all the Ack-s / Reviewed-by-s a bit.
> > >
> > > So from the above I take it that the Ack-s resp. Reviewed-by-s on the
> > > other non drivers/platform/x86 bits also signal an Ack to merge the entire
> > > series through the pdx86 tree?
> > >
> > > Lee, any chance you can take a look at patches 3-5 and give your Ack
> > > for merging these through the pdx86 tree together with the rest?
> > 
> > Actually I misinterpreted Lee's different tags again. Acked-by is
> > normal for routing MFD code via other subsystems, while
> > Acked-for-MFD-by is for Lee (scripts?) to route the code via MFD tree.
> > Lee, is it the correct interpretation now?
> 
> Yes, that is correct.

Thanks for clarification. I'm learning hard way :-)

> I just replied to your 0th patch (before I saw this, sorry).

Thanks for the tag.

So, it seems we all set to route this via MFD then. Do you think we can go?
Or do need to postpone this to be after v5.19-rc1?

-- 
With Best Regards,
Andy Shevchenko


