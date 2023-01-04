Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59A165D43B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jan 2023 14:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbjADNcI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Jan 2023 08:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239407AbjADNbf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Jan 2023 08:31:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EB6FAD9;
        Wed,  4 Jan 2023 05:30:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 740336F0;
        Wed,  4 Jan 2023 14:30:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672839001;
        bh=uhRldtdvTek1dhMsrtnOwymgShLrF7W4WbCLB82sKks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ThWjBZs06NtjhtmTCo7Z/VtV6lx8RKIlyGrcoZQ5Yp4ecSP9jpHamz4WC3MjpRbaj
         7iQgPFS1EQbvKkZLWzxfvTmlnvjiDz2dDoIa0UF5j+Lx0Dwwai6yD9sV1C6GcWI35c
         AoTGN6gNMSppceoxpXS5w/IoSzrzerXpcI1TrD3Y=
Date:   Wed, 4 Jan 2023 15:29:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
Subject: Re: [PATCH v5 7/8] media: i2c: add DS90UB913 driver
Message-ID: <Y7V/VQAol+pMwKje@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-8-tomi.valkeinen@ideasonboard.com>
 <Y5YiazDtaxtLJyL0@pendragon.ideasonboard.com>
 <4d349785-ca37-d930-db3c-2581bba9fde0@ideasonboard.com>
 <Y6nTV16me9aQL3iT@pendragon.ideasonboard.com>
 <Y6tRB6DckOKWYHTv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y6tRB6DckOKWYHTv@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 27, 2022 at 10:09:43PM +0200, Andy Shevchenko wrote:
> On Mon, Dec 26, 2022 at 07:01:11PM +0200, Laurent Pinchart wrote:
> > On Wed, Dec 14, 2022 at 08:29:48AM +0200, Tomi Valkeinen wrote:
> > > On 11/12/2022 20:33, Laurent Pinchart wrote:
> > > > On Thu, Dec 08, 2022 at 12:40:05PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
> > > >> +	dev_dbg(dev, "Bind %s\n", source_subdev->name);
> > > > 
> > > > I'd drop this message.
> 
> +1 here.
> 
> > > Why is that? Do we get this easily from the v4l2 core? These debug 
> > > prints in the bind/unbind process have been valuable for me.
> > 
> > Because debug messages are not meant to be a tracing infrastructure, and
> > because, if we want to keep this message, it would be best handled in
> > the v4l2-async core instead of being duplicated across drivers. Same for
> > the messages at the end of the function.
> 
> I don't think v4l2 needs debug prints. If we consider the above case, the
> ftrace already provides that. If we consider something specific to v4l2 to
> trace only critical parts, then trace events should be implemented.

V4L2 has no support for trace events, and I agree that they would be
useful. It doesn't mean that dev_dbg() is entirely useless though, and
sometimes the line between the two isn't very clear. In any case, for
this very specific debug message, I don't think it should be printed in
individual drivers, but it should be handled in the V4L2 core, either as
a debug message or a trace event.

-- 
Regards,

Laurent Pinchart
