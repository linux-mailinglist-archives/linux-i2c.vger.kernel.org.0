Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71086739D8
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 14:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbjASNUa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 08:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbjASNUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 08:20:05 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010935CE64;
        Thu, 19 Jan 2023 05:19:19 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id F12681BF205;
        Thu, 19 Jan 2023 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1674134357;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q8pOiSqHpljeGPJE7VLy887atVfOgK9uVlRZiZMg1f4=;
        b=YHoDW21VNayHw1DlffyMTBOwJcj4G0mt5e7B9im/wuEToEhfLAvw6x37fc7Pr6KLV286pG
        Zyx6yv11+50ygEMDgIFEVzsa0WHWmVtFuITN5dzdYod8qSysbhP6Gv/Y37TL3E/uix/MiB
        9bjIWReO+Z4sZXPGP9E7BKmY7yFGGv0MIZgZSZaYHdRVpBrSKeoKpkO5Qb0kw/51GwnrS6
        q2enMHr1aNmPNUatl2quMGqLQVBgA9plJart749jKtky5jqUxDSAMSxDIAVsKtJL42kFOT
        he2RmN00DnEp2Z3T3iaht+UrVZvkcnzHQqBiH2P8d90YGKXSUyjbDsOWqtIf9g==
Date:   Thu, 19 Jan 2023 14:19:12 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
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
        Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v7 0/7] i2c-atr and FPDLink
Message-ID: <20230119141912.7ad2997a@booty>
In-Reply-To: <024c8127-5109-3ea5-efa0-8c0a8763e8b3@ideasonboard.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
        <Y8gX0krXayfOa4Hi@smile.fi.intel.com>
        <bd6d6cc0-4e70-fa31-4b5e-e6bcddf62d36@ideasonboard.com>
        <Y8gvu/E5EoPqo8J1@smile.fi.intel.com>
        <20230119094358.010bc826@booty>
        <024c8127-5109-3ea5-efa0-8c0a8763e8b3@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Thu, 19 Jan 2023 14:40:24 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> On 19/01/2023 10:43, Luca Ceresoli wrote:
> > Hi Andy,
> > 
> > On Wed, 18 Jan 2023 19:43:23 +0200
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> >   
> >> On Wed, Jan 18, 2023 at 07:28:20PM +0200, Tomi Valkeinen wrote:  
> >>> On 18/01/2023 18:01, Andy Shevchenko wrote:  
> >>>> On Wed, Jan 18, 2023 at 02:40:24PM +0200, Tomi Valkeinen wrote:  
> >>>>> Hi,
> >>>>>
> >>>>> You can find the v6 from:
> >>>>>
> >>>>> https://lore.kernel.org/all/20230105140307.272052-1-tomi.valkeinen@ideasonboard.com/
> >>>>>
> >>>>> Main changes:
> >>>>>
> >>>>> * i2c-atr: Use bus notifier. This allows us to drop the patch that adds
> >>>>>     the attach_client/detach_client callbacks. On the downside, it removes
> >>>>>     the option for error handling if the translation setup fails, and also
> >>>>>     doesn't provide us the pointer to the i2c_board_info. I belive both
> >>>>>     are acceptable downsides.
> >>>>>
> >>>>> * Use fwnode in the fpdlink drivers instead of OF
> >>>>>
> >>>>> * Addressed all the review comments (I hope)
> >>>>>
> >>>>> * Lots of cosmetic or minor fixes which I came up while doing the fwnode
> >>>>>     change  
> >>>>
> >>>> I believe my comments to the first driver applies to the next two, so please
> >>>> address them whenever you are agree / it's possible / it makes sense.
> >>>>
> >>>> About ATR implementation. We have the i2c bus (Linux representation of
> >>>> the driver model) and i2c_adapter and i2c_client objects there. Can't we
> >>>> have an i2c_client_aliased in similar way and be transparent with users?  
> >>  
> >>> Can you clarify what you mean here?
> >>>
> >>> The i2c_clients are not aware of the i2c-atr. They are normal i2c clients.
> >>> The FPD-Link drivers are aware of the ATR, as the FPD-Link hardware contains
> >>> the ATR support.  
> >>
> >> Can't that hardware be represented as I2C adapter? In such case the ATR specifics
> >> can be hidden from the client (drivers).
> >>
> >> I'm worrying about code duplication and other things that leak into drivers as
> >> ATR callbacks.  
> > 
> > Which callbacks do you refer to? i2c_atr_ops? I don't think we can do
> > without the attach/detach_client ones, it's where the driver-specific
> > implementation is hooked for the generic ATR infra to call it.
> > 
> > However now I noticed the select/deselect ops are still there. IIRC
> > they are not used by any driver and in the past the plan was to just
> > remove them. Tomi, do you think there is a good reason to keep them?  
> 
> I thought you had a reason to add them, so I didn't remove them =). I 
> can drop them.

Yes, please drop them.

It's the usual "it looked like a good idea" situation... :)

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
