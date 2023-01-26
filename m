Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7617667C928
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jan 2023 11:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbjAZKvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Jan 2023 05:51:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbjAZKvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Jan 2023 05:51:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BFF45F45;
        Thu, 26 Jan 2023 02:51:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 127222B3;
        Thu, 26 Jan 2023 11:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674730294;
        bh=+PfsfHyLWhCatjzWDNhxpQaIrl5B/XJVdTmRgf6Njdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R5BaBqjvwgTFzVDK2Aa2Li6JQDcOo0DLdDE+pdrkVZG4CQMRlaZD6XzCEKEtqL5XP
         EMRN5ecbZJ3eQbSFFanEzTSWM499vOirXIwx7KnO/Eb9+xwRObeqe6ww+7sEEPvZ/o
         p86M0muxFq2M2VT0UdH7ziatX3egnn6CFTiCgFTo=
Date:   Thu, 26 Jan 2023 12:51:30 +0200
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
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Message-ID: <Y9JbMjPM3Ea3RVzH@pendragon.ideasonboard.com>
References: <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
 <Y8rFh6zO7Hp9mLxE@smile.fi.intel.com>
 <4286abe2-f23f-d4c9-ef18-f351af7a3a8b@ideasonboard.com>
 <Y9EcRlooHwIjOqiZ@smile.fi.intel.com>
 <cad92dbb-43ef-fa8c-1962-13c4a8578899@ideasonboard.com>
 <Y9FBlMl4b3l1zVck@smile.fi.intel.com>
 <5d208710-f284-e6e9-18dc-f5ef63a9ea44@ideasonboard.com>
 <Y9FKcoVlgUWR4rhn@smile.fi.intel.com>
 <04a82b08-524f-8d03-ac47-73d826907fc3@ideasonboard.com>
 <Y9JUEv66Gze8FjMZ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y9JUEv66Gze8FjMZ@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 26, 2023 at 12:21:06PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 26, 2023 at 10:41:47AM +0200, Tomi Valkeinen wrote:
> > On 25/01/2023 17:27, Andy Shevchenko wrote:
> 
> ...
> 
> > > But I probably don't understand the ATR structure and what exactly we need to
> > > pass to it, perhaps it also can be replaced with properties (note, that we have
> > > some interesting ones that called references, which is an alternative to DT
> > > phandle).
> > 
> > Well, maybe this needs a Linux bus implementation. I'm not that familiar
> > with implementing a bus, but I think that would make it easier to share data
> > between the deserializer and the serializer. A bus sounds a bit like an
> > overkill for a 1-to-1 connection, used by a few drivers, but maybe it
> > wouldn't be too much code.
> 
> Have you looked at auxiliary bus (appeared a few releases ago in kernel)?

As far as I understand, the auxiliary bus infrastructure is meant for
use cases where a single hardware device needs to be split into multiple
logical devices (as in struct device). Platform devices were
historically (ab)used for this, and the auxiliary bus is meant as a
cleaner solution. I'm not sure if it would be a good match here, or if
it would be considered an abuse of the auxiliary bus API.

-- 
Regards,

Laurent Pinchart
