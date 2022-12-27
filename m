Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDD9656E83
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Dec 2022 21:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbiL0UIA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Dec 2022 15:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiL0UH7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Dec 2022 15:07:59 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1301C9;
        Tue, 27 Dec 2022 12:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672171677; x=1703707677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gg2AQb1KnbSVrP3AF/cIh3eWxSHnE8y345OXW+33f/0=;
  b=Qnex1ckGBdan6R00P2dpC/RYhUbf9fYqUabwtCW57jAW8wg94ECiz2ST
   i6eUY/yvJezNlPIJMcEs2OgcvULgDENpvdDZrYbks4F3JdWrcGK5qqihv
   9SfwjzWsV+fsUkTUhqTarnh2Zo2KCym4wj+0NkLPXidpnXHka2Phfk8BO
   pvWt/dFG2gTU1xgxJD+tfBrKkfKZjyScb2hhKl/9PxcJw8DxcCFDdMG2S
   qnfnOP0V0Cbo77ZtwB3ZoXIG4xrwAVtAmrTT40e2o2aRr/tOcI/dvpkto
   hherbKXZYYZbDkzJjN435QXVdTOmsKPSVsTGVW/Is2hyJyuPZaTZqX82Y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="318428778"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="318428778"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 12:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="683713877"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="683713877"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 27 Dec 2022 12:07:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pAGEm-000DfF-2L;
        Tue, 27 Dec 2022 22:07:48 +0200
Date:   Tue, 27 Dec 2022 22:07:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
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
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v5 1/8] i2c: core: let adapters be notified of client
 attach/detach
Message-ID: <Y6tQlDZ//8xhwfNu@smile.fi.intel.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
 <Y5YLi2md2571NQrY@pendragon.ideasonboard.com>
 <20221219095143.4b49b447@booty>
 <Y6Azg9GJ/ntUlS+P@smile.fi.intel.com>
 <Y6nRzXGm6ccvE6VM@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6nRzXGm6ccvE6VM@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 26, 2022 at 06:54:37PM +0200, Laurent Pinchart wrote:
> On Mon, Dec 19, 2022 at 11:48:51AM +0200, Andy Shevchenko wrote:
> > On Mon, Dec 19, 2022 at 09:51:43AM +0100, Luca Ceresoli wrote:
> > > On Sun, 11 Dec 2022 18:55:39 +0200 Laurent Pinchart wrote:
> > > > On Thu, Dec 08, 2022 at 12:39:59PM +0200, Tomi Valkeinen wrote:

...

> > > > This may be a stupid question, but couldn't you instead use the
> > > > BUS_NOTIFY_ADD_DEVICE and BUS_NOTIFY_DEL_DEVICE bus notifiers ?
> > > 
> > > I'm not sure they would be the correct tool for this task. Bus
> > > notifiers inform about new events on the 'struct bus_type, i.e. any
> > > event on the global i2c bus type. In the i2c world this means being
> > > notified about new _adapters_, which is exactly what
> > > drivers/i2c/i2c-dev.c does.
> > > 
> > > Here, however, we need to be informed about new _clients_ being added
> > > under a specific adapter.
> > 
> > This is for example exactly what ACPI integration in I2C framework does. But...
> > 
> > > I'm not sure whether the bus notifiers can
> > > inform about new clients in addition of new adapters, but they at least
> > > seem unable to provide per-adapter notification.
> > 
> > ...personally I don't like notifiers, they looks like overkill for this task.
> 
> But isn't this patch essentially implementing a custom notification
> system ? If we need notifiers, why would it be better to add an ad-hoc
> API for I2C instead of using bus notifiers ?

Notifiers (as implemented in the Linux kernel) have some drawbacks IIUC.
For example, it's not easy to pass the data over it. Another example is
the context (you wouldn't know when the notifier be called and if it can
hold some locks or not).

That said, each case should be discussed individually despite the generic
approach being present (i.o.w. do not consider notifiers as a silver
bullet in _any_ notification scheme).

> > > Does that seem correct?

-- 
With Best Regards,
Andy Shevchenko


