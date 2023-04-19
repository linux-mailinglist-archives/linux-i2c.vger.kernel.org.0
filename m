Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60EE06E73BC
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Apr 2023 09:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbjDSHNr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Apr 2023 03:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbjDSHNp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Apr 2023 03:13:45 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B89959FB;
        Wed, 19 Apr 2023 00:13:43 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 603041BF211;
        Wed, 19 Apr 2023 07:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1681888422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xViPwui2V2INwWz4a6zCPiRO3Q6gRw7wmbsayresJqU=;
        b=YiK2JyXm5djqU98UUeEy4mY5W4C1ZjQjb9kt2r3nB382rkfXE8tprE5s/Df2bAvC5yF1AS
        T3bxp6b2wA8sOiAzwMP6kUpiU7d9PL7Lqvdyq8szL+IoA5DM2ZS/zcqFq7mmTqFHDxDK4Q
        zDuvpbev+AZgPCkJhJY+NrMDExi+lcrevlhRqHKS+VT0cFkBgh17x5rpkhKH8KZ6OgpmLo
        JioMwhqBWRCVkEz2/LtaJ4Ph7A/Q3kOBpHHskKcKdZ97vntv4iluVafIOcV9lbKH9B2k5Z
        5OGm21FziLhEDKIcun4n7ukDSMI3J6p4gQFMQe/ZwHuvDo1xrInAGDOunsAd+Q==
Date:   Wed, 19 Apr 2023 09:13:36 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
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
Message-ID: <20230419091336.4e10ba65@booty>
In-Reply-To: <ZD6VwpRya6SGBAt5@shikoro>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
        <20230222132907.594690-6-tomi.valkeinen@ideasonboard.com>
        <ZD6VwpRya6SGBAt5@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram, Tomi,

On Tue, 18 Apr 2023 15:06:10 +0200
Wolfram Sang <wsa@kernel.org> wrote:

> > +  i2c-alias-pool:
> > +    $ref: /schemas/types.yaml#/definitions/uint16-array
> > +    description:
> > +      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
> > +      used to access the remote peripherals on the serializer's I2C bus. The
> > +      addresses must be available, not used by any other peripheral. Each
> > +      remote peripheral is assigned an alias from the pool, and transactions to
> > +      that address will be forwarded to the remote peripheral, with the address
> > +      translated to the remote peripheral's real address. This property is not
> > +      needed if there are no I2C addressable remote peripherals.  
> 
> After some initial discussion with Tomi on IRC, this question is
> probably more for Luca:
> 
> Why is "i2c-alias-pool" in the drivers binding and not a regular i2c
> binding? Same question for the implementation of the alias-pool
> handling. Shouldn't this be in the i2c-atr library? I'd think managing
> the list of aliases would look all the same in the drivers otherwise?

I think that this _was_ the plan, as it looks obviously cleaner, but
then we agreed that we should remove the pool entirely, so I didn't
bother moving it.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
