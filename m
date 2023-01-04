Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06A4065D4C1
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jan 2023 14:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239321AbjADN4B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Jan 2023 08:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbjADN4A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Jan 2023 08:56:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118C3260;
        Wed,  4 Jan 2023 05:55:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0B1B6F0;
        Wed,  4 Jan 2023 14:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672840557;
        bh=upbq8ae2FZJb0op+c7L/iVvpVZ0tuSM70IZxIgj4xxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Adk7SiicoFw4s0rpd9scAI6FTP/uQw8Qt0zilZLE2i/Pl25jYLs0NzHb+8G1KC0q+
         3b8aNyZ4EPJ88t8t2QIaPAr24jDv17upSMXrcAgBe7lSUwMQKAylJcV1OjcbSNbX8n
         38JVUUuB32nRNRWCDEit1hY/rNFC03oLAkFO+6MY=
Date:   Wed, 4 Jan 2023 15:55:53 +0200
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
Message-ID: <Y7WFaR5+NNSXLLow@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-8-tomi.valkeinen@ideasonboard.com>
 <Y5YiazDtaxtLJyL0@pendragon.ideasonboard.com>
 <4d349785-ca37-d930-db3c-2581bba9fde0@ideasonboard.com>
 <7ddd576f-6e8a-7581-178c-2e8575227811@ideasonboard.com>
 <Y6nSVlmlweUuUwJf@pendragon.ideasonboard.com>
 <61729020-0977-521a-6137-3bd89f300652@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <61729020-0977-521a-6137-3bd89f300652@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Mon, Dec 26, 2022 at 09:25:34PM +0200, Tomi Valkeinen wrote:
> On 26/12/2022 18:56, Laurent Pinchart wrote:
> > On Wed, Dec 14, 2022 at 08:36:47AM +0200, Tomi Valkeinen wrote:
> >> On 14/12/2022 08:29, Tomi Valkeinen wrote:
> >>
> >>>> wondering if the struct device of the DS90UB913 could be passed instead
> >>>> of the port, to avoid passing the port throught
> >>>> ds90ub9xx_platform_data.
> >>>
> >>> Interesting thought. That would limit the number of remote i2c busses to
> >>> one, though. Not a problem for FPD-Link, but I wonder if that's assuming
> >>> too much for the future users. Then again, this is an in-kernel API so
> >>> we could extend it later if needed. So I'll try this out and see if I
> >>> hit any issues.
> >>
> >> Right, so the issue with this one would be that it would prevent a
> >> single device uses. E.g. a single chip which acts as an ATR (similar to
> >> i2c-mux chips), i.e. it contains both the main and the remote i2c busses.
> > 
> > I don't think I understand this, sorry.
> 
> What you are suggesting above means that we'd have a separate device for 
> each port of the ATR. Which is fine in our current case, as the i2c 
> master busses are behind separate remote devices.
> 
> But if you consider a case similar to i2c-mux, where we have a single 
> chip with the slave bus and, say, 4 master busses. We would probably 
> have only a single device for that.

Hmmm... Yes you're right, it won't work in that case. Maybe we could
have two functions, the existing i2c_atr_add_adapter(), and another one
that wraps it ? It would be nice if we could get rid of the platform
data for the UB913 and UB953 drivers.

-- 
Regards,

Laurent Pinchart
