Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A99B619655
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 13:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbiKDMjB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 08:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbiKDMiw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 08:38:52 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2080C25E1;
        Fri,  4 Nov 2022 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667565530; x=1699101530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NHtoi7Gggy94oj28EJ6rXJUUNVzupmtF6MVG47LlqR4=;
  b=Glv/0ncmt93ywfXRh2b6iPFxnjGr6RswHpFZj37MHhiKHIvimz+bv690
   jRjdUT8bQ/1a/Okqm4xbkU1tcsTYRB+K3sG2BqBWlWQSeduJ1HOIWr6Hc
   vhUD7vDd0B0GGbfkWWcGnZTW655YlRewiPMmO1MHkNB98cBINZIVeIlZU
   BbH9LXrzCItAAFFL2FbFzJpaMGADywlk8mXpK26r01LDbObvYqdUdjk/e
   CemPLwW2ihChHTd9NI6sq7dLYh3/9NJ3E41lrTRhXGG1IX0O4KKRqseLn
   Dccs1tMNLMygeznQZE9I2BIlRHpDDuwVxxPqIIJGATisG/1R7o9sa/bJ1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="311076771"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="311076771"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 05:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="704068044"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="704068044"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2022 05:38:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oqvy6-007N6B-0W;
        Fri, 04 Nov 2022 14:38:42 +0200
Date:   Fri, 4 Nov 2022 14:38:41 +0200
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
Message-ID: <Y2UH0Wqp6R52tObC@smile.fi.intel.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-3-tomi.valkeinen@ideasonboard.com>
 <Y2EtnSNqBOfGRDMO@smile.fi.intel.com>
 <cc510516-c961-9efb-bcdf-2abea795433a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc510516-c961-9efb-bcdf-2abea795433a@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 04, 2022 at 01:59:06PM +0200, Tomi Valkeinen wrote:
> On 01/11/2022 16:30, Andy Shevchenko wrote:
> > On Tue, Nov 01, 2022 at 03:20:26PM +0200, Tomi Valkeinen wrote:

...

> > > +	ret = atr->ops->attach_client(atr, chan->chan_id, info, client,
> > > +				      &alias_id);
> > 
> > On one line looks better.
> 
> I agree, but it doesn't fit into 80 characters. I personally think that's a
> too narrow a limit, but some maintainers absolutely require max 80 chars, so
> I try to limit the lines to 80 unless it looks really ugly.

OK.

...

> > > +	WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
> > > +	     "can't create symlink to atr device\n");
> > > +	WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
> > > +	     "can't create symlink for channel %u\n", chan_id);
> > 
> > Why WARNs? sysfs has already some in their implementation.
> 
> True, and I can drop these if required. But afaics, sysfs_create_link only
> warns if there's a duplicate entry, not for other errors.

The problem with WARN that it can be easily converted to real Oops. Do you
consider other errors are so fatal that machine would need a reboot?

...

> > > +	atr_size = struct_size(atr, adapter, max_adapters);
> > 
> > > +	if (atr_size == SIZE_MAX)
> > > +		return ERR_PTR(-EOVERFLOW);
> > 
> > Dunno if you really need this to be separated from devm_kzalloc(), either way
> > you will get an error, but in embedded case it will be -ENOMEM.
> 
> Yep. Well... I kind of like it to be explicit. Calling alloc(SIZE_MAX)
> doesn't feel nice.

Yeah, but that is exactly the point of returning SIZE_MAX by the helpers from
overflow.h. And many of them are called inside a few k*alloc*() APIs.

So, I don't think it's ugly or not nice from that perspective.

> > > +	atr = devm_kzalloc(dev, atr_size, GFP_KERNEL);
> > > +	if (!atr)
> > > +		return ERR_PTR(-ENOMEM);

...

> > > +EXPORT_SYMBOL_GPL(i2c_atr_delete);
> > 
> > I would put these to their own namespace from day 1.
> 
> What would be the namespace? Isn't this something that should be
> subsystem-wide decision? I have to admit I have never used symbol
> namespaces, and don't know much about them.

Yes, subsystem is I2C, but you introducing a kinda subsubsystem. Wouldn't be
better to provide all symbols in the I2C_ATR namespace from now on?

It really helps not polluting global namespace and also helps to identify
users in the source tree.

...

> > > +struct i2c_atr {
> > > +	/* private: internal use only */
> > > +
> > > +	struct i2c_adapter *parent;
> > > +	struct device *dev;
> > > +	const struct i2c_atr_ops *ops;
> > > +
> > > +	void *priv;
> > > +
> > > +	struct i2c_algorithm algo;
> > > +	struct mutex lock;
> > > +	int max_adapters;
> > > +
> > > +	struct i2c_adapter *adapter[0];
> > 
> > No VLAs.
> 
> Ok.
> 
> I'm not arguing against any of the comments you've made, I think they are
> all valid, but I want to point out that many of them are in a code copied
> from i2c-mux.
> 
> Whether there's any value in keeping i2c-mux and i2c-atr similar in
> design/style... Maybe not.

You can address my comment by simply dropping 0 in the respective member.

> > > +};

-- 
With Best Regards,
Andy Shevchenko


