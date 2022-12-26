Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B5B656435
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Dec 2022 17:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiLZQyr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Dec 2022 11:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbiLZQyp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Dec 2022 11:54:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4FB10A7;
        Mon, 26 Dec 2022 08:54:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58B3C74C;
        Mon, 26 Dec 2022 17:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672073681;
        bh=DoKtyUoObjPWlt/9rVCapOp/FYV2kaTGbH2l0JepNuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KectF7bJdp0Yp1H/3XzbxTtk5jVa5BmGJPqp6hvhEh2ksCMOnWxQcSrBhSf7NFub1
         /fE1LP6tk3yxL3J67Tv9fpe0DhGRfQvTxNKavcYSFmCLqqc+pteJW7KqqsSakdmEi+
         t+VK5iIofn3L2vLHYisq6D5RJWHz/iOkLIMM3oWE=
Date:   Mon, 26 Dec 2022 18:54:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
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
Message-ID: <Y6nRzXGm6ccvE6VM@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
 <Y5YLi2md2571NQrY@pendragon.ideasonboard.com>
 <20221219095143.4b49b447@booty>
 <Y6Azg9GJ/ntUlS+P@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y6Azg9GJ/ntUlS+P@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 11:48:51AM +0200, Andy Shevchenko wrote:
> On Mon, Dec 19, 2022 at 09:51:43AM +0100, Luca Ceresoli wrote:
> > On Sun, 11 Dec 2022 18:55:39 +0200 Laurent Pinchart wrote:
> > > On Thu, Dec 08, 2022 at 12:39:59PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
> > > This may be a stupid question, but couldn't you instead use the
> > > BUS_NOTIFY_ADD_DEVICE and BUS_NOTIFY_DEL_DEVICE bus notifiers ?
> > 
> > I'm not sure they would be the correct tool for this task. Bus
> > notifiers inform about new events on the 'struct bus_type, i.e. any
> > event on the global i2c bus type. In the i2c world this means being
> > notified about new _adapters_, which is exactly what
> > drivers/i2c/i2c-dev.c does.
> > 
> > Here, however, we need to be informed about new _clients_ being added
> > under a specific adapter.
> 
> This is for example exactly what ACPI integration in I2C framework does. But...
> 
> > I'm not sure whether the bus notifiers can
> > inform about new clients in addition of new adapters, but they at least
> > seem unable to provide per-adapter notification.
> 
> ...personally I don't like notifiers, they looks like overkill for this task.

But isn't this patch essentially implementing a custom notification
system ? If we need notifiers, why would it be better to add an ad-hoc
API for I2C instead of using bus notifiers ?

> > Does that seem correct?

-- 
Regards,

Laurent Pinchart
