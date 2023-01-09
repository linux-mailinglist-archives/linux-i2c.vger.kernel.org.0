Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE38F6627DF
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 14:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbjAIN6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 08:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237130AbjAIN62 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 08:58:28 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D66D138;
        Mon,  9 Jan 2023 05:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673272707; x=1704808707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EFIeQp6uECf0+1f/Iuo156tsEA9puTtW3jNhyTO8xBc=;
  b=OTXb1wVJqHKDeFxQ7Dc6ZOjw/nuy76QyWqm22+ijk8P7GUY58llzXbfD
   WVMux/Wn24LcpLSMVkZA5G6g7o2J/0xXjaQgPzn/fepP3zVC8Z4lgr/No
   JYKNL/2tM66syx5mzWTNntmo68A+mhZ4US1r5Kd0DIceWsOECb9mSo493
   2yQduGCEriaB8YWHr9qfAM5GDpbh+/1X0UC45pzGIxAwUrWSz23gluFEo
   1LqwnZMeZXjiEf49UVVFBXqOD24PYCZB53lrKtKw+D95rMnQ3ekdd1KjQ
   Ytfe1gHkTNNq9cKq3fzIhOhXWW4z8pu48GUzslIk0IRsjkjbmUU0kM9WA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="350089598"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="350089598"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 05:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="606614901"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="606614901"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 09 Jan 2023 05:58:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pEsfI-006VTV-1I;
        Mon, 09 Jan 2023 15:58:16 +0200
Date:   Mon, 9 Jan 2023 15:58:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: Re: [PATCH v6 7/8] media: i2c: add DS90UB913 driver
Message-ID: <Y7wdePnmFx1XDGvB@smile.fi.intel.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-8-tomi.valkeinen@ideasonboard.com>
 <Y7pBSq49dL8Fzxsc@pendragon.ideasonboard.com>
 <Y7v1Wrma/Ev8KEzy@smile.fi.intel.com>
 <5173a16a-83c5-5cfe-f6ce-03e1c90e8790@ideasonboard.com>
 <Y7wc2lX8eGPITx30@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7wc2lX8eGPITx30@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 09, 2023 at 03:55:39PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 09, 2023 at 02:59:01PM +0200, Tomi Valkeinen wrote:
> > On 09/01/2023 13:07, Andy Shevchenko wrote:
> > > On Sun, Jan 08, 2023 at 06:06:34AM +0200, Laurent Pinchart wrote:
> > > > On Thu, Jan 05, 2023 at 04:03:06PM +0200, Tomi Valkeinen wrote:

...

> > > > > +	gc->of_node = priv->client->dev.of_node;
> > > 
> > > We don't have of_node anymore in gc. And if the parent device is set, you can
> > > drop this line (it will work with older and newer kernels. Otherwise, use
> > > fwnode.
> > 
> > What do you mean "we don't have of_node anymore"?

Just to add that you missed "gc" in the quote which is crucial to get
what I meant.

> There is no of_node member of struct gpio_chip anymore. This will fail
> to compile.

-- 
With Best Regards,
Andy Shevchenko


