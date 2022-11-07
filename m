Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54D961F20E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 12:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbiKGLlY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 06:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiKGLlH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 06:41:07 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7B01ADBB;
        Mon,  7 Nov 2022 03:41:01 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C0F6924000A;
        Mon,  7 Nov 2022 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667821260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qre1rLeivf2N8z9hTszuSOQhH5gotX01/ktN2uCkQ7k=;
        b=Ek6wMmTMsc8B1iNQRjQoRFSgj04u32H8jPLnEkyWW/LzsBenyR6EZNCTQPM+Y4sjy+OppM
        7t821vgQzQY0BbbCgGjdUiikw+Iv8n/VKmgxUcheg2DyR387r5tZNU09VPbuvlpif8wCKf
        4eT/JTL61eUopreMw9f2kTxA5Nv+/fHt8lt2o4yC+mQMFtdvCSZglYimpQmsTQ5obwgMrN
        peT0LVR1FlNhRHZzGeyYTby19zcu9ZrE/ta1/3u6geaq+DfleyxGUYTbUJMxnXcqciozMa
        tMjQ/+KQFJQTA1GG04QbJ7RbSlKvvDuMy9YEPTpASKMv0RzB0lPqoofG6clGCA==
Date:   Mon, 7 Nov 2022 12:40:55 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 2/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <20221107124055.0495031f@booty>
In-Reply-To: <cc510516-c961-9efb-bcdf-2abea795433a@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
        <20221101132032.1542416-3-tomi.valkeinen@ideasonboard.com>
        <Y2EtnSNqBOfGRDMO@smile.fi.intel.com>
        <cc510516-c961-9efb-bcdf-2abea795433a@ideasonboard.com>
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

On Fri, 4 Nov 2022 13:59:06 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi Andy,
> 
> On 01/11/2022 16:30, Andy Shevchenko wrote:
> > On Tue, Nov 01, 2022 at 03:20:26PM +0200, Tomi Valkeinen wrote:  
> >> From: Luca Ceresoli <luca@lucaceresoli.net>
> >>
> >> An ATR is a device that looks similar to an i2c-mux: it has an I2C
> >> slave "upstream" port and N master "downstream" ports, and forwards
> >> transactions from upstream to the appropriate downstream port. But is
> >> is different in that the forwarded transaction has a different slave
> >> address. The address used on the upstream bus is called the "alias"
> >> and is (potentially) different from the physical slave address of the
> >> downstream chip.
> >>
> >> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> >> implementing ATR features in a device driver. The helper takes care or
> >> adapter creation/destruction and translates addresses at each transaction.  

First of all, thank you for bringing this work on!

> > ...
> >   
> >> +I2C ADDRESS TRANSLATOR (ATR)
> >> +M:	Luca Ceresoli <luca@lucaceresoli.net>  
> > 
> > Hmm... Are you going to maintain this? Or Review? Why not?  
> 
> We haven't discussed with Luca if he wants to maintain this (this is 
> mostly his code). But, indeed, I should add my name there.

I think at this point you are probably in a better position to be the
maintainer, but I'm OK with being listed here as reviewer (R:).

Ah, would you please use my bootlin dot com address here?

> I'm not arguing against any of the comments you've made, I think they 
> are all valid, but I want to point out that many of them are in a code 
> copied from i2c-mux.
> 
> Whether there's any value in keeping i2c-mux and i2c-atr similar in 
> design/style... Maybe not.

Tomi is right, when I wrote this initially I tried to keep it as
similar as possible to i2c-mux.c. No problem in deviating from that
wherever it makes sense.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
