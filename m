Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1819C656E86
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Dec 2022 21:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiL0UJz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Dec 2022 15:09:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiL0UJy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Dec 2022 15:09:54 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECEA1C9;
        Tue, 27 Dec 2022 12:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672171792; x=1703707792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3sBZGyq73ZD2hku2pLOI+6amo8ZCX9wNt+AZ72j6k9o=;
  b=QhyHeC07prThXtod2ewQVSUELuXWeWuHAuZVsZAPsikchOTuyFnOhiQG
   pU4TsPTjlvOHhm4vmQjyAvUZ46Ne0/mQNA4U6hIdf/lKweja34NfF0cQ3
   ZOMPxzaFOcH4Mas9nRlkptkf2nPTnldZtRn0KsGmSAXDDHdPiHywEfjOn
   hmY4IhJskrrbS1GPxmQtutgP430t07PTxddXh6BRM+Evyp6wBIvwzIH3F
   qEnD6QE1TvM4sEbzMigDaQ2brVR6yirYohfOlX3TUgCpIHrmiAK+zfMzh
   WFbQ5oioa2POw+fqwg0QhQo8FyXKclt7HDjxRlNhi613pZmQ8dBBMf3y2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="318428997"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="318428997"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 12:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="716423485"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="716423485"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 27 Dec 2022 12:09:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pAGGe-000DiC-0K;
        Tue, 27 Dec 2022 22:09:44 +0200
Date:   Tue, 27 Dec 2022 22:09:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 7/8] media: i2c: add DS90UB913 driver
Message-ID: <Y6tRB6DckOKWYHTv@smile.fi.intel.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-8-tomi.valkeinen@ideasonboard.com>
 <Y5YiazDtaxtLJyL0@pendragon.ideasonboard.com>
 <4d349785-ca37-d930-db3c-2581bba9fde0@ideasonboard.com>
 <Y6nTV16me9aQL3iT@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6nTV16me9aQL3iT@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 26, 2022 at 07:01:11PM +0200, Laurent Pinchart wrote:
> On Wed, Dec 14, 2022 at 08:29:48AM +0200, Tomi Valkeinen wrote:
> > On 11/12/2022 20:33, Laurent Pinchart wrote:
> > > On Thu, Dec 08, 2022 at 12:40:05PM +0200, Tomi Valkeinen wrote:

...

> > >> +	dev_dbg(dev, "Bind %s\n", source_subdev->name);
> > > 
> > > I'd drop this message.

+1 here.

> > Why is that? Do we get this easily from the v4l2 core? These debug 
> > prints in the bind/unbind process have been valuable for me.
> 
> Because debug messages are not meant to be a tracing infrastructure, and
> because, if we want to keep this message, it would be best handled in
> the v4l2-async core instead of being duplicated across drivers. Same for
> the messages at the end of the function.

I don't think v4l2 needs debug prints. If we consider the above case, the
ftrace already provides that. If we consider something specific to v4l2 to
trace only critical parts, then trace events should be implemented.

-- 
With Best Regards,
Andy Shevchenko


