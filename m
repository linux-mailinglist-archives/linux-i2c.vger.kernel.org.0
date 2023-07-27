Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C79765075
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 11:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbjG0J7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 05:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbjG0J7k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 05:59:40 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7B510B;
        Thu, 27 Jul 2023 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690451979; x=1721987979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OCXm02Zod6VyNif3Q3EV8aonYhegGQT68qvk/fnFMSw=;
  b=Q2pvB5vw6rNqE8oIbBkb06ShPrshz3thvsKskIS1A0lebj0B++i06flI
   +f9+U7t0wTj37q6JmSI0mndLHXnETMPDLbxzuL/AW1ybXEiz2J9ZrNgjd
   S/uMxcenkrkfbsnqZClRdA+/IqzlGi7KNE5KnAWxcBvHlvLRJdh6Z2+zf
   Y9646bgREiNpVE8kZycgmsWJM1aG6xJGRW7XwGqOVm34+a40h/FPHoAsj
   s7fXXt11vxR+Y79Pvsz8FNvSCqYjbR//hUa+SjFc/+nUidr1SEvW9J7r3
   xJ0cqFHgH7LgqTYrxVVDH/JvYTLaqc/+ch/cnJY8tTGEPeFDsMlE7p6sP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347878951"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="347878951"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 02:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796912408"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="796912408"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2023 02:59:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qOxmS-00GFf6-0D;
        Thu, 27 Jul 2023 12:59:36 +0300
Date:   Thu, 27 Jul 2023 12:59:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMJAB7RcICd9wjdv@smile.fi.intel.com>
References: <20230726130804.186313-1-biju.das.jz@bp.renesas.com>
 <20230726130804.186313-3-biju.das.jz@bp.renesas.com>
 <ZMFNYQHqWrS+zSXQ@smile.fi.intel.com>
 <CAKdAkRT1Zdut28YYG9PxOQXfvMGZuXD8=qG9q4KtHKNvsxy76A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKdAkRT1Zdut28YYG9PxOQXfvMGZuXD8=qG9q4KtHKNvsxy76A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 26, 2023 at 10:56:41AM -0700, Dmitry Torokhov wrote:
> On Wed, Jul 26, 2023 at 07:44:17PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 26, 2023 at 02:08:04PM +0100, Biju Das wrote:

...

> > > +static const void *i2c_device_get_match_data(const struct device *dev)
> > > +{
> > > +   const struct i2c_client *client = (dev->type == &i2c_client_type) ?
> > > +                                     to_i2c_client(dev) : NULL;
> >
> > There is an API i2c_verify_client() or something like this, I don't remember
> > by heart.
> 
> It's been discussed in a separate thread. i2c_verify_client() needs a
> non-const pointer. It would be nice to clean up i2c_verify_client() to
> accept both variants, but that can be done later.

Then this code needs a TODO comment:

	/* TODO: use i2c_verify_client() when it accepts const pointer */


> > > +   if (!dev->driver)
> > > +           return NULL;
> > > +
> > > +   return i2c_get_match_data_helper(to_i2c_driver(dev->driver), client);
> > > +}

...

> > Side question, what is the idea for i2c_of_match_device()? Shouldn't you also
> > take it into consideration?
> 
> Good call. I think we need to add something like
> 
>         if (!data && driver->driver.of_match_table) {
>                 match =
> i2c_of_match_device_sysfs(driver->driver.of_match_table, client);
>                 if (match)
>                         data = match->data;
>         }
> 
> to i2c_device_get_match_data().

Haven't checked myself, by I trust your suggestion. Let's see it in v3 then.

-- 
With Best Regards,
Andy Shevchenko


