Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7DC26508E3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 09:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbiLSIwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 03:52:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbiLSIwJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 03:52:09 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5A45F84;
        Mon, 19 Dec 2022 00:51:50 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 41C87E0006;
        Mon, 19 Dec 2022 08:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1671439909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HbRyta7URVFiHZkQ/3wT16z3vuZ6whKW9FlU4BbMDDs=;
        b=Garjuv8YQgSzRLR+nl4hAfxM3mUnwUz65bqUZmZQteWlNsp/AJcLSpLtlEuYXgXRGpuuOO
        pjG8EFlnBx2ePJ5AImzmHVRpOwbzy9Ipveh0tAr3iAvxfi3Sq2rnNZxioDOJTp/hUeRWNq
        sCekKS2kNX3+Ue0yyz4OI1jmUA/4QJ2Z/ekqVImD+97YI2yzLMND3eK32IiqWttX0bZzd1
        x1NV2xJm43wA3wmTCx3CATWVC6PdBW5cWNZW+qwLRdUyE8O8JLBs7nxb0LFCdpD2bpela7
        ARhl/+2hXlqNfbWPiVT4FjDuipOBNOCVpPBOjCDac257kkerVlcZmp1tleYZ7w==
Date:   Mon, 19 Dec 2022 09:51:43 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
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
        Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v5 1/8] i2c: core: let adapters be notified of client
 attach/detach
Message-ID: <20221219095143.4b49b447@booty>
In-Reply-To: <Y5YLi2md2571NQrY@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
        <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
        <Y5YLi2md2571NQrY@pendragon.ideasonboard.com>
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

Hello Laurent,

thanks for the feedback and apologies for the delayed reply.

On Sun, 11 Dec 2022 18:55:39 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Tomi and Luca,
> 
> Thank you for the patch.
> 
> On Thu, Dec 08, 2022 at 12:39:59PM +0200, Tomi Valkeinen wrote:
> > From: Luca Ceresoli <luca@lucaceresoli.net>
> > 
> > An adapter might need to know when a new device is about to be
> > added. This will soon bee needed to implement an "I2C address
> > translator" (ATR for short), a device that propagates I2C transactions
> > with a different slave address (an "alias" address). An ATR driver
> > needs to know when a slave is being added to find a suitable alias and
> > program the device translation map.
> > 
> > Add an attach/detach callback pair to allow adapter drivers to be
> > notified of clients being added and removed.  
> 
> This may be a stupid question, but couldn't you instead use the
> BUS_NOTIFY_ADD_DEVICE and BUS_NOTIFY_DEL_DEVICE bus notifiers ?

I'm not sure they would be the correct tool for this task. Bus
notifiers inform about new events on the 'struct bus_type, i.e. any
event on the global i2c bus type. In the i2c world this means being
notified about new _adapters_, which is exactly what
drivers/i2c/i2c-dev.c does.

Here, however, we need to be informed about new _clients_ being added
under a specific adapter. I'm not sure whether the bus notifiers can
inform about new clients in addition of new adapters, but they at least
seem unable to provide per-adapter notification.

Does that seem correct?

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
