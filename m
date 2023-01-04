Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8A165D745
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jan 2023 16:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234370AbjADPcW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Jan 2023 10:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjADPcV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Jan 2023 10:32:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363C61B9D6;
        Wed,  4 Jan 2023 07:32:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A0D4A16;
        Wed,  4 Jan 2023 16:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672846337;
        bh=yKSmdm+JkNCC/zelXC0/m5mbL7/v+Rt6f44V0yse8gk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kzDkr2em0T+eszSyTIq5zC4hfox4eOSQy9RfJzMq6Wa50fS3TGgEy8JYUxo55aoC4
         F4WD/vrN01zPxGI9FuZyJotneId+z61mECD7QSAhQTJ7GjNYPtdcRPyTfPixBeUywW
         rVjyaMPCkqWllZ53B1wDNQ0vRr4i64Ox9Ya8KAbo=
Date:   Wed, 4 Jan 2023 17:32:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
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
Message-ID: <Y7Wb/Z3627D3HQJb@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-8-tomi.valkeinen@ideasonboard.com>
 <Y5YiazDtaxtLJyL0@pendragon.ideasonboard.com>
 <4d349785-ca37-d930-db3c-2581bba9fde0@ideasonboard.com>
 <7ddd576f-6e8a-7581-178c-2e8575227811@ideasonboard.com>
 <Y6nSVlmlweUuUwJf@pendragon.ideasonboard.com>
 <61729020-0977-521a-6137-3bd89f300652@ideasonboard.com>
 <Y7WFaR5+NNSXLLow@pendragon.ideasonboard.com>
 <dddcfe51-5dec-2826-61c3-12edaf04da4e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dddcfe51-5dec-2826-61c3-12edaf04da4e@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 04, 2023 at 04:13:17PM +0200, Tomi Valkeinen wrote:
> On 04/01/2023 15:55, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > On Mon, Dec 26, 2022 at 09:25:34PM +0200, Tomi Valkeinen wrote:
> >> On 26/12/2022 18:56, Laurent Pinchart wrote:
> >>> On Wed, Dec 14, 2022 at 08:36:47AM +0200, Tomi Valkeinen wrote:
> >>>> On 14/12/2022 08:29, Tomi Valkeinen wrote:
> >>>>
> >>>>>> wondering if the struct device of the DS90UB913 could be passed instead
> >>>>>> of the port, to avoid passing the port throught
> >>>>>> ds90ub9xx_platform_data.
> >>>>>
> >>>>> Interesting thought. That would limit the number of remote i2c busses to
> >>>>> one, though. Not a problem for FPD-Link, but I wonder if that's assuming
> >>>>> too much for the future users. Then again, this is an in-kernel API so
> >>>>> we could extend it later if needed. So I'll try this out and see if I
> >>>>> hit any issues.
> >>>>
> >>>> Right, so the issue with this one would be that it would prevent a
> >>>> single device uses. E.g. a single chip which acts as an ATR (similar to
> >>>> i2c-mux chips), i.e. it contains both the main and the remote i2c busses.
> >>>
> >>> I don't think I understand this, sorry.
> >>
> >> What you are suggesting above means that we'd have a separate device for
> >> each port of the ATR. Which is fine in our current case, as the i2c
> >> master busses are behind separate remote devices.
> >>
> >> But if you consider a case similar to i2c-mux, where we have a single
> >> chip with the slave bus and, say, 4 master busses. We would probably
> >> have only a single device for that.
> > 
> > Hmmm... Yes you're right, it won't work in that case. Maybe we could
> > have two functions, the existing i2c_atr_add_adapter(), and another one
> > that wraps it ? It would be nice if we could get rid of the platform
> > data for the UB913 and UB953 drivers.
> 
> I wouldn't mind that at all, but we already have the bc_rate there. And 
> I have a feeling that we might need more if we implement more features.

Indeed. I feel that platform data is a bit of a hack here, but maybe
it's not that bad.

> And we also have the atr pointer there. Or do you think that could be 
> dropped also? In your mail above you only mention the port, but maybe 
> the deser could register the serializer device and port to the ATR, and 
> then the ser could just use its device pointer instead of atr & port.

I was wondering if we could drop the atr pointer too, yes. I'm not sure
how, and there's no urgency to fix this. My main concern is that new
drivers should ideally not be forced to use platform data just for ATR
support, if they don't use it already for something else.

-- 
Regards,

Laurent Pinchart
