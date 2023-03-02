Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E996A8646
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 17:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjCBQYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 11:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjCBQYS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 11:24:18 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572E746156;
        Thu,  2 Mar 2023 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677774246; x=1709310246;
  h=date:from:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=TFwgDL0789xDmjxNmBV6y3MQ4MQjbev1D7zf/lwGBDY=;
  b=F/Q5YX8kVlV9itSa+QdarfP5M860KIrLUYfD43Frugv7wdmWE77FMWki
   sgCl/k1GLxRYe2v0AfvePITrzTNT1Sgrc4Gi6WhalZ//zkgzx4aM89Yz9
   xmaDJ6eobMtWIBcuX+j+bbZPZsTmZeksfmwVvyu+wBCuC4M7ah4tpnaZH
   My1xEvbrf3o4m9uCjeq2PHt2/3CmvfEczrPozD5MaD3T9P/WQ7ubOns28
   XjgjsjgzuxLUty5acVyLdrhJmlZ2Y3zu9+vFOQV/ZvHQwF6xNFy39Ia6M
   PzmeTDg40N/1Ns9WTGMwAjQKxB+oBLKgrmEg9k+vtrltfcpo5UQYE6UOW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397354061"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="397354061"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 08:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739140687"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="739140687"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2023 08:16:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pXlbo-00EQJk-0m;
        Thu, 02 Mar 2023 18:16:44 +0200
Date:   Thu, 2 Mar 2023 18:16:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
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
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v9 0/8] i2c-atr and FPDLink
Message-ID: <ZADL62W6Mv6uNjKf@smile.fi.intel.com>
References: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
 <Y+5Rb17FTG4IxcE0@smile.fi.intel.com>
 <e4141652-53c0-fce1-dac7-5da5368e2240@ideasonboard.com>
 <Y+9j3cYOG+Z0zmyC@smile.fi.intel.com>
 <9f3f0744-f771-cd2c-3b8e-5b79f7a430c7@ideasonboard.com>
 <Y++E+Rr54p3vd8Jn@smile.fi.intel.com>
 <96f8e0f9-d8cf-fa9b-a224-a5caad445992@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96f8e0f9-d8cf-fa9b-a224-a5caad445992@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Cc: Saravana (for devlink issues)

On Thu, Mar 02, 2023 at 05:52:24PM +0200, Tomi Valkeinen wrote:
> On 17/02/2023 15:45, Andy Shevchenko wrote:
> > On Fri, Feb 17, 2023 at 02:57:02PM +0200, Tomi Valkeinen wrote:
> > > On 17/02/2023 13:24, Andy Shevchenko wrote:
> > > > On Fri, Feb 17, 2023 at 08:57:32AM +0200, Tomi Valkeinen wrote:
> > > > > On 16/02/2023 17:53, Andy Shevchenko wrote:
> > > > > > On Thu, Feb 16, 2023 at 04:07:39PM +0200, Tomi Valkeinen wrote:

...

> > > > > > >     	struct i2c_board_info ser_info = {
> > > > > > > -		.of_node = to_of_node(rxport->remote_fwnode),
> > > > > > > -		.fwnode = rxport->remote_fwnode,
> > > > > > 
> > > > > > > +		.of_node = to_of_node(rxport->ser.fwnode),
> > > > > > > +		.fwnode = rxport->ser.fwnode,
> > > > > > 
> > > > > > Why do you need to have both?!
> > > > > 
> > > > > I didn't debug it, but having only fwnode there will break the probing (no
> > > > > match).
> > > > 
> > > > This needs to be investigated. The whole fwnode approach, when we have both
> > > > fwnode and legacy of_node fields in the same data structure, is that fwnode
> > > > _OR_ of_node initialization is enough, when both are defined the fwnode
> > > > should take precedence.
> > > > 
> > > > If your testing is correct (and I have no doubts) it means we have a serious
> > > > bug lurking somewhere.
> > > 
> > > Having both defined or only of_node defined works for me.
> > 
> > But of_node is _legacy_ stuff. We should not really consider this option in the
> > new code.
> > 
> > > Perhaps the issue is that these drivers only add of_match_table, and thus
> > > having only .fwnode above is not enough.
> > 
> > No, the code should work with fwnode that carrying DT node or another.
> > The matching table shouldn't affect this either.
> > 
> > > Looking at i2c_device_match(), i2c_of_match_device() only uses of_node, so
> > > perhaps I would need CONFIG_ACPI for acpi_driver_match_device to do matching
> > > with of_node? Although I don't see the acpi code using fwnode, just of_node.
> > > Well, I have to say I have no idea without spending more time on this.
> > 
> > Again, there is a bug and that bug seems nasty one as it would allow to
> > work the device in one environment and not in another.
> > 
> > Since it's about I²C board files, I believe that an issue is in I²C core.
> 
> I don't know if this is related in any way, but I see these when probing:

I believe this is for devlink (Saravana Cc'ed).

> [   36.952697] i2c 4-0044: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@0/serializer/i2c/sensor@21/port/endpoint
> [   36.969268] i2c 4-0044: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/ports/port@0/endpoint
> [   36.983001] i2c 4-0044: Failed to create device link with 4-0044
> [   36.992828] ds90ub953 4-0044: Found ub953 rev/mask 0x20
> [   37.017761] i2c 5-0021: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@0/serializer/ports/port@0/endpoint
> [   37.033843] i2c 5-0021: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@0/serializer
> [   37.117492] i2c 4-0045: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@1/serializer/i2c/sensor@21/port/endpoint
> [   37.134033] i2c 4-0045: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/ports/port@1/endpoint
> [   37.147735] i2c 4-0045: Failed to create device link with 4-0045
> [   37.156097] ds90ub953 4-0045: Found ub953 rev/mask 0x20
> [   37.186584] i2c 6-0021: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@1/serializer/ports/port@0/endpoint
> [   37.202636] i2c 6-0021: Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@0/target-module@7c000/i2c@0/deser@3d/links/link@1/serializer
> 
> Then again, I see similar warnings/errors for some other devices too, when booting up (TI's DRA76 EVM).

-- 
With Best Regards,
Andy Shevchenko


