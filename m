Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719406E7F50
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Apr 2023 18:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbjDSQNs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Apr 2023 12:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjDSQNr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Apr 2023 12:13:47 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F3B92;
        Wed, 19 Apr 2023 09:13:44 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7F938C000B;
        Wed, 19 Apr 2023 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1681920822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N/4vh+ZK/L/2udwlY6VrQJKEJLZ0t9WAYjnDkg1vBZ4=;
        b=d6sFS7fGp2NpR2dY9bhcGf4TwHwqw1ObtI+TZBCi/nc1U0sA+OjPFzXCe2Rofi9l4oD/Ha
        4RE8vrIawaxAR4Bo6+m4sGQKF4T76N78uJBeQw9nJyLdmHdeWJP2uNLVDnIptlV2CJSxu+
        YohJun2xcYhRIGfpYO8zKYgPV3+Xx2QzdG5euDGmJ5ivPA8wOPvs1q7ORPgQb5fnJaSzR7
        6x8XAO3pTvSyKmJJ4iCwrC9461BkxLWz2QfXx8j/X571yChGFMWlpic8xZCqkm0UxZnVwl
        KHNkdHD52Q3kqxhY7kXpbQaKc1cRddEWWWeg0+tWa0NNYLIjp+Qu+Szu1d0DlA==
Date:   Wed, 19 Apr 2023 18:13:37 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v10 5/8] dt-bindings: media: add TI DS90UB960 FPD-Link
 III Deserializer
Message-ID: <20230419181337.2448179d@booty>
In-Reply-To: <ZD+g4j7jEg2AETNe@ninjato>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
        <20230222132907.594690-6-tomi.valkeinen@ideasonboard.com>
        <ZD6VwpRya6SGBAt5@shikoro>
        <20230419091336.4e10ba65@booty>
        <ZD+g4j7jEg2AETNe@ninjato>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, 19 Apr 2023 10:05:54 +0200
Wolfram Sang <wsa@kernel.org> wrote:

> > > Why is "i2c-alias-pool" in the drivers binding and not a regular i2c
> > > binding? Same question for the implementation of the alias-pool
> > > handling. Shouldn't this be in the i2c-atr library? I'd think managing
> > > the list of aliases would look all the same in the drivers otherwise?  
> > 
> > I think that this _was_ the plan, as it looks obviously cleaner, but
> > then we agreed that we should remove the pool entirely, so I didn't
> > bother moving it.  
> 
> Ah, you mean we agreed on that at the Plumbers BoF? I think we can
> conclude this is obsolete meanwhile. GMSL encodes the target addresses
> in DT. Rob is also fine with the binding here to encode the pool in DT.
> Let's follow that road, I'd say.

Sure, I'm not questioning that. Apologies if it did look like. I was
just trying to explain (to myself as well) why this hadn't been done
previously.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
