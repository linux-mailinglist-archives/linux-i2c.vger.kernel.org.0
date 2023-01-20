Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39760675964
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 17:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjATQAO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 11:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjATQAN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 11:00:13 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2945E522;
        Fri, 20 Jan 2023 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674230412; x=1705766412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WRsyLGOahjzjt6kpSNh9GKMvG+H+i5eITtoKdM1H0Zk=;
  b=EE3gOSkkR3ardASQQfhOrYpPbphD88W4DAPjVsWFPl1m2cDgazcRvH5p
   wAMcqZ5/AT0/BWUJjCA/g0B+/ucRXFkS+ejUCX5RBBbhvOS6cvmbGs+Pc
   YcbMDl5fJFQYOFmQ4l+s77ELBKHmQPOgUwnduvzeRitvyxhiXapfT4poZ
   PcRxkDDC0D6ZQuo7RqMZMOyKBFXRCer3e2H+v2Ur+Hl4VWP24xhYG3zHB
   LJefgzHpslfg3CwedhEyNoQH/6UlegLiBo9TorqHfle0Z7UouPWY0q1SG
   k+yhr2FPHCxBUglHW0i+uh4sT/lpUcMOlljQ0sp36SPCfmP156yXA6B5T
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313495260"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="313495260"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 08:00:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749380190"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="749380190"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 08:00:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pItoA-00CIej-1G;
        Fri, 20 Jan 2023 18:00:02 +0200
Date:   Fri, 20 Jan 2023 18:00:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
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
Message-ID: <Y8q6ggmOsygyVdTT@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <Y8gX0krXayfOa4Hi@smile.fi.intel.com>
 <bd6d6cc0-4e70-fa31-4b5e-e6bcddf62d36@ideasonboard.com>
 <Y8gvu/E5EoPqo8J1@smile.fi.intel.com>
 <20230119094358.010bc826@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119094358.010bc826@booty>
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

On Thu, Jan 19, 2023 at 09:43:58AM +0100, Luca Ceresoli wrote:
> On Wed, 18 Jan 2023 19:43:23 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Wed, Jan 18, 2023 at 07:28:20PM +0200, Tomi Valkeinen wrote:
> > > On 18/01/2023 18:01, Andy Shevchenko wrote:  
> > > > On Wed, Jan 18, 2023 at 02:40:24PM +0200, Tomi Valkeinen wrote:  

...

> > > Can you clarify what you mean here?
> > > 
> > > The i2c_clients are not aware of the i2c-atr. They are normal i2c clients.
> > > The FPD-Link drivers are aware of the ATR, as the FPD-Link hardware contains
> > > the ATR support.  
> > 
> > Can't that hardware be represented as I2C adapter? In such case the ATR specifics
> > can be hidden from the client (drivers).
> > 
> > I'm worrying about code duplication and other things that leak into drivers as
> > ATR callbacks.
> 
> Which callbacks do you refer to? i2c_atr_ops? I don't think we can do
> without the attach/detach_client ones, it's where the driver-specific
> implementation is hooked for the generic ATR infra to call it.
> 
> However now I noticed the select/deselect ops are still there. IIRC
> they are not used by any driver and in the past the plan was to just
> remove them. Tomi, do you think there is a good reason to keep them?
> 
> > It might be that I didn't get how hw exactly functioning on this
> > level and why we need those callbacks.
> 
> As far as "how hw exactly works", in case you haven't seen that, the
> best explanation I was able to give is in my ELCE 2019 talk, at minute
> ~22. It's a 2-3 minute watch. The slides have pointers to other talks
> and discussion.

Probably I have missed the URL in the discussion, care to resend?

-- 
With Best Regards,
Andy Shevchenko


