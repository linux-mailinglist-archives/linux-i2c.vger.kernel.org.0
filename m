Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35FB2672553
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 18:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjARRpQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 12:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbjARRos (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 12:44:48 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1522844BD8;
        Wed, 18 Jan 2023 09:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674063813; x=1705599813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nSD1CrtMl3VnpY5BRty9Cid/KcF3iWB6zYqGYpxL7S4=;
  b=EDTwHBYksTZYvmE0uNitrnfGlR4QJSwaliwmfLdNqWobmPRi9VAdrpg6
   InOUbeM7hIL1bXp93XmTsGWJpROKfs0m/Dk0LimGo4/QLb0dGzNucQXg/
   45Cg0BtqZH6/cBmCQ8RB9TEh+qYEICc3nhcZ8lAYNccQUiau20G1q3MY6
   DYh09ItVXyRayXAXEJ+/B9ab+IeVOGzWnXHx8UDcwaiZSuqezwXUxng5T
   RShY1PAE2GFYvMr8Ic+fSppaBFUImVAsOUB2HAlxr3mUcTCw4m62c6GmT
   iLYr6SNqFiYVzZ9L1TBiTWjQCqUl7pMOeAkq3QMHZFVqGZ3q4nApg7orx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411286871"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411286871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 09:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609738290"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609738290"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 09:43:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pICT5-00BInz-2H;
        Wed, 18 Jan 2023 19:43:23 +0200
Date:   Wed, 18 Jan 2023 19:43:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Subject: Re: [PATCH v7 0/7] i2c-atr and FPDLink
Message-ID: <Y8gvu/E5EoPqo8J1@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <Y8gX0krXayfOa4Hi@smile.fi.intel.com>
 <bd6d6cc0-4e70-fa31-4b5e-e6bcddf62d36@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd6d6cc0-4e70-fa31-4b5e-e6bcddf62d36@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 18, 2023 at 07:28:20PM +0200, Tomi Valkeinen wrote:
> On 18/01/2023 18:01, Andy Shevchenko wrote:
> > On Wed, Jan 18, 2023 at 02:40:24PM +0200, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > You can find the v6 from:
> > > 
> > > https://lore.kernel.org/all/20230105140307.272052-1-tomi.valkeinen@ideasonboard.com/
> > > 
> > > Main changes:
> > > 
> > > * i2c-atr: Use bus notifier. This allows us to drop the patch that adds
> > >    the attach_client/detach_client callbacks. On the downside, it removes
> > >    the option for error handling if the translation setup fails, and also
> > >    doesn't provide us the pointer to the i2c_board_info. I belive both
> > >    are acceptable downsides.
> > > 
> > > * Use fwnode in the fpdlink drivers instead of OF
> > > 
> > > * Addressed all the review comments (I hope)
> > > 
> > > * Lots of cosmetic or minor fixes which I came up while doing the fwnode
> > >    change
> > 
> > I believe my comments to the first driver applies to the next two, so please
> > address them whenever you are agree / it's possible / it makes sense.
> > 
> > About ATR implementation. We have the i2c bus (Linux representation of
> > the driver model) and i2c_adapter and i2c_client objects there. Can't we
> > have an i2c_client_aliased in similar way and be transparent with users?

> Can you clarify what you mean here?
> 
> The i2c_clients are not aware of the i2c-atr. They are normal i2c clients.
> The FPD-Link drivers are aware of the ATR, as the FPD-Link hardware contains
> the ATR support.

Can't that hardware be represented as I2C adapter? In such case the ATR specifics
can be hidden from the client (drivers).

I'm worrying about code duplication and other things that leak into drivers as
ATR callbacks. It might be that I didn't get how hw exactly functioning on this
level and why we need those callbacks.

-- 
With Best Regards,
Andy Shevchenko


