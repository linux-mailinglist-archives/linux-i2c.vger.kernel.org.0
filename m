Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F345625F88
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 17:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbiKKQc6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 11:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233900AbiKKQc4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 11:32:56 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E354833BE;
        Fri, 11 Nov 2022 08:32:54 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 95434FF807;
        Fri, 11 Nov 2022 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668184371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wgc2UscBxQyAYAXrJN8RcraDeaI9E8edo80ir5Onbh0=;
        b=Mzqld/0SJYzM5PZkgOkhiTH1ClLXZLn9gcr0oU5QADybDqDBmks6/nN4GmcSx8L0aX2XdB
        M80ak5muKGOyGrQey+yqKL1VU3nksqXQbSHjX3VMcITpQ83znrqL09BczdrLg3iLWp62O0
        bcrT3rdqWlZuA01hq2PaA+QcPgQv9tJ80oUN5XXji0PdVWcQPCP0C+Ae7NWbpk/0IYUnV8
        F2j4u2m2wfvQaneJngcVkD6AYCMp7kU6ukoKmatzNupIpttFV1NYcykopdrg4ZXkRrpRt+
        DVxCA778W2p3atJ+PHHwUiWHUP9baqhZgQhbOmmN+dA1ROOutdeGICUmZ+X5Tg==
Date:   Fri, 11 Nov 2022 17:32:46 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 3/8] dt-bindings: media: add bindings for TI
 DS90UB960
Message-ID: <20221111173246.17d49e2d@booty>
In-Reply-To: <6c254d5f-9fa1-b06a-4edb-7e58e4b33101@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
        <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
        <20221102172630.GA4140587-robh@kernel.org>
        <6c254d5f-9fa1-b06a-4edb-7e58e4b33101@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Thu, 3 Nov 2022 13:50:43 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi Rob,
> 
> On 02/11/2022 19:26, Rob Herring wrote:
> > On Tue, Nov 01, 2022 at 03:20:27PM +0200, Tomi Valkeinen wrote:  
> >> Add DT bindings for TI DS90UB960 FPDLink-3 Deserializer.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   .../bindings/media/i2c/ti,ds90ub960.yaml      | 392 ++++++++++++++++++
> >>   1 file changed, 392 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> >> new file mode 100644
> >> index 000000000000..4456d9b3e2c7
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> >> @@ -0,0 +1,392 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub960.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
> >> +
> >> +maintainers:
> >> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> +
> >> +description: |  
> > 
> > Don't need '|'  
> 
> Hmm, ok... But why does that work? I can only find yaml examples for 
> multi-line with either | or >.
> 
> >> +  The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
> >> +  forwarding.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - ti,ds90ub960-q1
> >> +      - ti,ds90ub9702-q1
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +    description:
> >> +      i2c addresses for the deserializer and the serializers
> >> +
> >> +  reg-names:
> >> +    items:
> >> +      - const: main  
> > 
> > 'reg-names' is not all that useful with only 1 entry.  
> 
> True.
> 
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +    description:
> >> +      Reference clock connected to the REFCLK pin.
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: refclk
> >> +
> >> +  powerdown-gpios:
> >> +    maxItems: 1
> >> +    description:
> >> +      Specifier for the GPIO connected to the PDB pin.
> >> +
> >> +  i2c-alias-pool:  
> > 
> > Something common or could be? If not, then needs a vendor prefix.  
> 
> I'll have to think about this. It is related to the i2c-atr, so I think 
> it might be a common thing.
> 
> >> +    $ref: /schemas/types.yaml#/definitions/uint16-array
> >> +    description:
> >> +      i2c alias pool for remote devices.  
> > 
> > Needs a better description. What's an 'alias pool'?  
> 
> Right.
> 
> "i2c alias pool is a pool of i2c addresses on the main i2c bus that can 
> be used to access the remote peripherals. Each remote peripheral is 
> assigned an alias from the pool, and transactions to that address will 
> be forwarded to the remote peripheral, with the address translated to 
> the remote peripheral's real address."

Good description, but I think re-adding this sentence from my v2 would
be useful:

  list of I2C addresses that are known to be available on the"local"
  (SoC-to-deser) I2C bus

> > 0-0xffff are valid values?  
> 
> They are i2c addresses, and linux i2c uses u16 for addresses. Then 
> again, the fpdlink devices only support 7-bit addresses, so maybe this 
> could be an uint8 array. I am not sure what's the best way to define this.

In DT the Linux implementation is irrelevant. Also if we want the ATR
code to be generic we must prepare DT bindings for future devices.
Thus, being these I2C addresses, they could be 7 or 10 bits, thus the
need for at least 16 bits.

All the above will become irrelevant in case the alias pool will
disappear, though.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
