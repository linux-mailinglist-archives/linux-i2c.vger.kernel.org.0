Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D88D9656414
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Dec 2022 17:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiLZQqu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Dec 2022 11:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiLZQqs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Dec 2022 11:46:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C1260ED;
        Mon, 26 Dec 2022 08:46:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC3CB74C;
        Mon, 26 Dec 2022 17:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672073205;
        bh=tymU+9oaT3DlRP52T9kKDH9739McwyQei6aFVO6yYLI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EMKCIIfZyVSzN7kH6nntk9WL6EeYoVgwh+mztZXIRamYx4kp2ixIG0MQPXqYuk4mB
         HTc/M4vG7FgtdFAsn30qJhb8RfayYWoyNAyxIwBuFJTLzSG3uLEPFnnGf+j7MGkkfB
         zVaYFzY0fzSY9ewGxbhcW7s3qaURjeBqksuYISw0=
Date:   Mon, 26 Dec 2022 18:46:40 +0200
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
Subject: Re: [PATCH v5 3/8] dt-bindings: media: add bindings for TI DS90UB913
Message-ID: <Y6nP8CDhR1idHyNl@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-4-tomi.valkeinen@ideasonboard.com>
 <Y5YPpGVJxAhkNJmC@pendragon.ideasonboard.com>
 <Y5YRj8emzJsB1BgK@pendragon.ideasonboard.com>
 <d39841c6-868c-408b-4142-5f9a4bd4e3c6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d39841c6-868c-408b-4142-5f9a4bd4e3c6@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Tue, Dec 13, 2022 at 03:36:49PM +0200, Tomi Valkeinen wrote:
> On 11/12/2022 19:21, Laurent Pinchart wrote:
> > On Sun, Dec 11, 2022 at 07:13:10PM +0200, Laurent Pinchart wrote:
> >> On Thu, Dec 08, 2022 at 12:40:01PM +0200, Tomi Valkeinen wrote:
> >>> Add DT bindings for TI DS90UB913 FPDLink-3 Serializer.
> >>>
> >>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>> ---
> >>>   .../bindings/media/i2c/ti,ds90ub913.yaml      | 121 ++++++++++++++++++
> >>>   1 file changed, 121 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
> >>> new file mode 100644
> >>> index 000000000000..3a5b34c6bb64
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
> >>> @@ -0,0 +1,121 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub913.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Texas Instruments DS90UB913 FPD-Link 3 Serializer
> >>
> >> I think TI consistently writes it "FPD-Link III". If you rename it,
> >> please do so through the whole series.
> >>
> >>> +
> >>> +maintainers:
> >>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>> +
> >>> +description:
> >>> +  The TI DS90UB913 is an FPD-Link 3 video serializer for parallel video.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - ti,ds90ub913a-q1
> >>
> >> Is the -q1 suffix needed, are there other variants ?
> >>
> >>> +
> >>> +  '#gpio-cells':
> >>> +    const: 2
> >>> +
> >>> +  gpio-controller: true
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +    description:
> >>> +      Reference clock connected to the CLKIN pin.
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: clkin
> >>> +
> >>> +  '#clock-cells':
> >>> +    const: 0
> >>> +
> >>> +  ports:
> >>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>> +
> >>> +    properties:
> >>> +      port@0:
> >>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>> +        unevaluatedProperties: false
> >>> +        description: CSI-2 input port
> > 
> > This should be "Parallel input port".
> 
> Oops...
> 
> >>> +
> >>> +        properties:
> >>> +          endpoint:
> >>> +            $ref: /schemas/media/video-interfaces.yaml#
> >>> +            unevaluatedProperties: false
> > 
> > Should at least the bus-width property be mandatory, as the device
> > supports both 10- and 12-bit inputs ?
> 
> Hmm... It supports 10-bit, 12-bit HF and 12-bit LF modes. If we need to 
> configure the mode based on DT, we need one more property for the HF/LF. 
> Then again, the HF/LF is separate from the input port, it's more about 
> internal operation and the link to the deserializer.
>
> However, this (the mode) should always be set in the HW via the MODE 
> pins. And the driver can read the HW's MODE from the registers. Only in 
> some very odd circumstances should the mode be configured by hand (and 
> then carefully, as the link to the deserializer will drop).

Both the DS90UB913A and DS90UB913Q datasheets state that the MODE pin on
the serializer only selects between PCLK and external oscillator modes.

The DS90UB913A datasheet seems to hint in documentation of the mode
select register (0x05) that the mode is selected on the deserializer and
transmitted to the serializer through the back-channel, as the
MODE_OVERRIDE bit is documented as "Allows overriding mode select bits
coming from back-channel" and the MODE_UP_TO_DATE bit as "Status of mode
select from Deserializer is up-to- date". Bits 2 and 3 are however named
"Pin_MODE_12-bit High Frequency" and "Pin_MODE_10-bit mode", which hint
that their value could come from a mode pin, but I see no trace of that
anywhere.

The DS90UB913Q datasheet is similar, with a notable difference in that
it documents bits 1 and 0 as reserved, where the DS90UB913A datasheet
documents them as mode override selection. In the same document, the
DS90UB914Q MODE pin is documented as selecting the 10-bit, 12-bit LF or
12-bit HF operation mode. The datasheet also states that "The
deserializer automatically configures the serializer to correct mode
through the back-channel".

Th DS90UB953 datasheet also hints in the documentation of the
BC_MODE_SELECT register (0x04) that the mode is configured automatically
for backward-compatible DVP mode. For CSI-2 mode, I assume the mode is
strapped from the MODE pin and not configured through the back-channel.

The DS90UB960 datasheet documents how to configure the mode on the
deserializer side, but doesn't state whether the serializer is then
automatically configured through the back-channel (in RAW/DVP mode). I
assume it is, do you have any information about this ?

> So the bus-width is not something that the driver would normally use. If 
> we would need to define the bus-width and HF/LF in the DT for some 
> reason in the future, I think an "old" DT without those specified should 
> continue working fine, as the mode can be read from a register.
> 
> That said, to complicate matters, the deserializer needs to know the 
> serializer's mode before it can communicate with it (and thus, before we 
> can read the mode). This is set with the deserializer's "ti,rx-mode" 
> property, where you find RAW10, RAW12LF and RAW12HF modes (and for 
> ub953, CSI-2 sync and non-sync modes).
> 
> So if we would define the bus-width and HF/LF in ub913's properties, the 
> deserializer could go peeking the mode from there. But is that a good 
> idea... I'm not so sure.

Peeking into another device's DT node isn't great. It looks like the
best option for the DS90UB913 is to specify the mode on the
deserializer's side (either through the MODE strap or with a software
override through DT). In case the serializer mode would need to be
manually overridden in the future, we could add an optional DT property.

-- 
Regards,

Laurent Pinchart
