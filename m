Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF68E619EB4
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 18:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiKDR13 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 13:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiKDR11 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 13:27:27 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED496330;
        Fri,  4 Nov 2022 10:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667582845; x=1699118845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dBDcCJRwsummNA5htuNbi6RZrV/KMkAr0IeBNTIJUhs=;
  b=kYDX2E07rtBsF4y577qydZ5Z34cXtzpyR7oxRMO0QiSxJanVIEuwQBcS
   hwUMPjuXurljUQnkPqfjg5XlATbypKH7WYw5PHC+4lF/Dn8VOh+UwJHp7
   4Qg+YP+rDB7+e6cCXrSkmpGa46VaJClwjHu7hB6VXJ5FUmqIcVf6VDoKI
   KDmoL8yB/KDe/HAlUeP84JXIx8lxumPPXAzhPmt9YwUFhT6yYO0eybd2W
   NBWXS8GF9iJbiG0QgeU3qglCBP7bJZ5oEs6lW8iAU7h2+/H1cN1RONnvP
   GoNazdi3uyN8nO1Nr0/goEdmZn+q1+DaGlmc34y+KNCNKqQHujPBhoxkU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="290412411"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="290412411"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 10:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="637658417"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="637658417"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2022 10:27:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1or0TO-007T4G-0C;
        Fri, 04 Nov 2022 19:27:18 +0200
Date:   Fri, 4 Nov 2022 19:27:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 2/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <Y2VLddPpfjJd/yN2@smile.fi.intel.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-3-tomi.valkeinen@ideasonboard.com>
 <Y2EtnSNqBOfGRDMO@smile.fi.intel.com>
 <cc510516-c961-9efb-bcdf-2abea795433a@ideasonboard.com>
 <Y2UH0Wqp6R52tObC@smile.fi.intel.com>
 <c0f0a5a3-c4bd-97e2-2047-da33bd896310@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0f0a5a3-c4bd-97e2-2047-da33bd896310@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 04, 2022 at 05:26:24PM +0200, Tomi Valkeinen wrote:
> On 04/11/2022 14:38, Andy Shevchenko wrote:
> > On Fri, Nov 04, 2022 at 01:59:06PM +0200, Tomi Valkeinen wrote:
> > > On 01/11/2022 16:30, Andy Shevchenko wrote:
> > > > On Tue, Nov 01, 2022 at 03:20:26PM +0200, Tomi Valkeinen wrote:

...

> > > > > +	WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
> > > > > +	     "can't create symlink to atr device\n");
> > > > > +	WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
> > > > > +	     "can't create symlink for channel %u\n", chan_id);
> > > > 
> > > > Why WARNs? sysfs has already some in their implementation.
> > > 
> > > True, and I can drop these if required. But afaics, sysfs_create_link only
> > > warns if there's a duplicate entry, not for other errors.
> > 
> > The problem with WARN that it can be easily converted to real Oops. Do you
> > consider other errors are so fatal that machine would need a reboot?
> 
> Yes, WARNs are bad, especially as the error here is not critical. I'll
> change these to dev_warn(). (also, I didn't know WARN could be made to
> oops).

panic_on_warn

-- 
With Best Regards,
Andy Shevchenko


