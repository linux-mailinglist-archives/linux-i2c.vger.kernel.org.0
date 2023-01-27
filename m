Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0247267DFCA
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 10:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbjA0JPM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 04:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjA0JPL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 04:15:11 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1098BBB3;
        Fri, 27 Jan 2023 01:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674810910; x=1706346910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N+LSpDops/iyKSXkHdWpx0JMTo+7ZKjnCIzKpZlbtxQ=;
  b=nL1U7IxvbYhoPIj/Iw0N87MjGKiuUe7OP4QrNx/Ef8wjOcCElODanGhl
   tuJe31ARs2317ihC6HBOU5pR413gwTJNJKl/ADnRU6Fbodz1XUhzQkQBI
   wm5qNAXor/+vAaLpB6fW4artUEG51DkpsiE5WuH1hV/nHF0hgScz/fauM
   IRkyjL6EMC4JNHmBZ6P1Qu5bDdqyKdTMdVYBv4crane19gf9M+72Ot8DD
   dz0F6P3rGwfrw3SV6lt2N3XL37bVaEU2+2wlcCWBYZXpUaC9FNEVhrtEg
   7j+giW2u+7UougfMGGP2H4C+1uOygWnxibB40tNAcL17VSs6swW+fAhXE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="329175766"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; 
   d="scan'208";a="329175766"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 01:15:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="908610468"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; 
   d="scan'208";a="908610468"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 01:15:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pLKp3-00FtEu-2r;
        Fri, 27 Jan 2023 11:15:01 +0200
Date:   Fri, 27 Jan 2023 11:15:01 +0200
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
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Message-ID: <Y9OWFSxs9ev9hfp2@smile.fi.intel.com>
References: <4286abe2-f23f-d4c9-ef18-f351af7a3a8b@ideasonboard.com>
 <Y9EcRlooHwIjOqiZ@smile.fi.intel.com>
 <cad92dbb-43ef-fa8c-1962-13c4a8578899@ideasonboard.com>
 <Y9FBlMl4b3l1zVck@smile.fi.intel.com>
 <5d208710-f284-e6e9-18dc-f5ef63a9ea44@ideasonboard.com>
 <Y9FKcoVlgUWR4rhn@smile.fi.intel.com>
 <04a82b08-524f-8d03-ac47-73d826907fc3@ideasonboard.com>
 <Y9JUEv66Gze8FjMZ@smile.fi.intel.com>
 <Y9JbMjPM3Ea3RVzH@pendragon.ideasonboard.com>
 <0c13eac3-cadb-b923-d475-7851dbef0c4e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c13eac3-cadb-b923-d475-7851dbef0c4e@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 27, 2023 at 10:24:04AM +0200, Tomi Valkeinen wrote:
> On 26/01/2023 12:51, Laurent Pinchart wrote:
> > On Thu, Jan 26, 2023 at 12:21:06PM +0200, Andy Shevchenko wrote:
> > > On Thu, Jan 26, 2023 at 10:41:47AM +0200, Tomi Valkeinen wrote:
> > > > On 25/01/2023 17:27, Andy Shevchenko wrote:

...

> > > > > But I probably don't understand the ATR structure and what exactly we need to
> > > > > pass to it, perhaps it also can be replaced with properties (note, that we have
> > > > > some interesting ones that called references, which is an alternative to DT
> > > > > phandle).
> > > > 
> > > > Well, maybe this needs a Linux bus implementation. I'm not that familiar
> > > > with implementing a bus, but I think that would make it easier to share data
> > > > between the deserializer and the serializer. A bus sounds a bit like an
> > > > overkill for a 1-to-1 connection, used by a few drivers, but maybe it
> > > > wouldn't be too much code.
> > > 
> > > Have you looked at auxiliary bus (appeared a few releases ago in kernel)?
> > 
> > As far as I understand, the auxiliary bus infrastructure is meant for
> > use cases where a single hardware device needs to be split into multiple
> > logical devices (as in struct device). Platform devices were
> > historically (ab)used for this, and the auxiliary bus is meant as a
> > cleaner solution. I'm not sure if it would be a good match here, or if
> > it would be considered an abuse of the auxiliary bus API.
> 
> The aux bus docs say "A key requirement for utilizing the auxiliary bus is
> that there is no dependency on a physical bus, device, register accesses or
> regmap support. These individual devices split from the core cannot live on
> the platform bus as they are not physical devices that are controlled by
> DT/ACPI.", which doesn't sound like a good fit.

Thanks for checking!

> The deserializer and serializers are currently independent devices and
> drivers (the pdata is the only shared thing), but I think we may need
> something better here. The devices are more tightly tied together than
> "normal" video devices, in my opinion, as the serializer is fully controlled
> by the deserializer (including power).
> 
> And if we ever want to implement something like power management, we
> probably need something more than what we have now. Although I don't know
> how that would be done, as all the peripherals behind the serializer would
> also lose power...

I believe you have to create a power domain for them and when such device
is added, the power domain of it should belong to the serialized.

-- 
With Best Regards,
Andy Shevchenko


