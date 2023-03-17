Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39FC26BEA61
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 14:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjCQNoI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 09:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjCQNoG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 09:44:06 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDEB26B1;
        Fri, 17 Mar 2023 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679060645; x=1710596645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YnswIAVSAKSWgRwAObgdrkxFmz81bo8K0xCi5ASID54=;
  b=eglB+EvjOmy3hyWEaA9GTGixTHo1qjw1IteoZgku6Obh8k/h65v0kyr1
   VaZbW0cw17gkwrnhbJlFEy9TON77QQzDzpG9socn+Z7+IxRO5ui07HwrA
   NGlTdsV2s8TUyjcVUhPmy2pvCHN9M8FFyTw7INS9hNcs/8qPlIooSLQxK
   g8DaYS7z5iB50MaALKSwekNpqd4WqPOP7hVrMEmx9K+cifX+wfppYcX4E
   jh489ajAGhT9/eXgfS2N3Ys7NtTOyLg10ZT2hCEcCa9tdFwnKmOGCqi7k
   nXaoacfTuYHj8NtxNbbOie0ialvzUQgH3Oh+ovC0mYptK9vzGHlEe7U+w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318659214"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="318659214"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 06:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="680291092"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="680291092"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 17 Mar 2023 06:43:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pdAN9-0053qv-2j;
        Fri, 17 Mar 2023 15:43:55 +0200
Date:   Fri, 17 Mar 2023 15:43:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v10 1/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <ZBRumwIyINlZ/pzJ@smile.fi.intel.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
 <20230317101606.69602bba@booty>
 <b281b472-f911-1f04-2cc8-c3713e771bf6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b281b472-f911-1f04-2cc8-c3713e771bf6@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 17, 2023 at 02:36:25PM +0200, Tomi Valkeinen wrote:
> On 17/03/2023 11:16, Luca Ceresoli wrote:
> > On Wed, 22 Feb 2023 15:29:00 +0200
> > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

...

> > > +	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
> > 
> > This comment is identical to the one in the kerneldoc comments just
> > above, I'd just remove it.
> 
> checkpatch wants an explicit comment for each lock.

Checkpatch is a recommendation tool and not obligation.

What it does correctly is sending message that lock should be described.
The kernel doc is good format for that, checkpatch has to gain support
for this type of lock descriptions.

> > > +	struct mutex lock;


-- 
With Best Regards,
Andy Shevchenko


