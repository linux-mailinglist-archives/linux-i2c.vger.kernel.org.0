Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B51C366227B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 11:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbjAIKH5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 05:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236390AbjAIKHl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 05:07:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8EF175B0;
        Mon,  9 Jan 2023 02:07:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA65D6CF;
        Mon,  9 Jan 2023 11:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673258829;
        bh=MA3UIeIy29qHR4bO6RNUu05XnWNHU0OutnZKv3QwVwk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pjjjSCYSC8uDx+DkgNqThr6Ug7pgA+5GZd4RkvCh9ec2wiQgyWQA4/a53wez6N9ys
         NZKrsnL6YAfGmjqIC0qDDDJDUKaPMZVratlChAJGRwSrqgoBc7/wTf5ZZGhoWRz8KH
         xmQwm/HA9bllA23+ouY1hwQW3mw2mu1adHMqieTo=
Date:   Mon, 9 Jan 2023 12:07:06 +0200
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
        Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 5/8] dt-bindings: media: add TI DS90UB960 FPD-Link III
 Deserializer
Message-ID: <Y7vnSnQAh2nS9vXx@pendragon.ideasonboard.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-6-tomi.valkeinen@ideasonboard.com>
 <Y7o3QEq9utV8nswA@pendragon.ideasonboard.com>
 <a3857c78-c221-176f-b862-a0435b301c67@ideasonboard.com>
 <Y7vZzg6YyC2IaUso@pendragon.ideasonboard.com>
 <65e3ca66-a4ba-db9b-3640-c90a7bdee61b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <65e3ca66-a4ba-db9b-3640-c90a7bdee61b@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 09, 2023 at 11:53:22AM +0200, Tomi Valkeinen wrote:
> On 09/01/2023 11:09, Laurent Pinchart wrote:
> > On Mon, Jan 09, 2023 at 10:30:13AM +0200, Tomi Valkeinen wrote:
> >> On 08/01/2023 05:23, Laurent Pinchart wrote:
> >>> Hi Tomi,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Thu, Jan 05, 2023 at 04:03:04PM +0200, Tomi Valkeinen wrote:
> >>>> Add DT bindings for TI DS90UB960 FPD-Link III Deserializer.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>>> ---
> >>>>    .../bindings/media/i2c/ti,ds90ub960.yaml      | 402 ++++++++++++++++++
> >>>>    1 file changed, 402 insertions(+)
> >>>>    create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..664799ae55be
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> >>>> @@ -0,0 +1,402 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub960.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
> >>>> +
> >>>> +maintainers:
> >>>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>> +
> >>>> +description:
> >>>> +  The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
> >>>> +  forwarding.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    enum:
> >>>> +      - ti,ds90ub960-q1
> >>>> +      - ti,ds90ub9702-q1
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clocks:
> >>>> +    maxItems: 1
> >>>> +    description:
> >>>> +      Reference clock connected to the REFCLK pin.
> >>>> +
> >>>> +  clock-names:
> >>>> +    items:
> >>>> +      - const: refclk
> >>>> +
> >>>> +  powerdown-gpios:
> >>>> +    maxItems: 1
> >>>> +    description:
> >>>> +      Specifier for the GPIO connected to the PDB pin.
> >>>> +
> >>>> +  i2c-alias-pool:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint16-array
> >>>> +    description:
> >>>> +      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
> >>>> +      used to access the remote peripherals on the serializer's I2C bus. The
> >>>> +      addresses must be available, not used by any other peripheral. Each
> >>>> +      remote peripheral is assigned an alias from the pool, and transactions to
> >>>> +      that address will be forwarded to the remote peripheral, with the address
> >>>> +      translated to the remote peripheral's real address. This property is not
> >>>> +      needed if there are no I2C addressable remote peripherals.
> >>>> +
> >>>> +  links:
> >>>> +    type: object
> >>>> +    additionalProperties: false
> >>>> +
> >>>> +    properties:
> >>>> +      '#address-cells':
> >>>> +        const: 1
> >>>> +
> >>>> +      '#size-cells':
> >>>> +        const: 0
> >>>> +
> >>>> +      ti,manual-strobe:
> >>>> +        type: boolean
> >>>> +        description:
> >>>> +          Enable manual strobe position and EQ level
> >>>> +
> >>>> +    patternProperties:
> >>>> +      '^link@[0-3]$':
> >>>> +        type: object
> >>>> +        additionalProperties: false
> >>>> +        properties:
> >>>> +          reg:
> >>>> +            description: The link number
> >>>> +            maxItems: 1
> >>>> +
> >>>> +          i2c-alias:
> >>>> +            description:
> >>>> +              The I2C address used for the serializer. Transactions to this
> >>>> +              address on the I2C bus where the deserializer resides are
> >>>> +              forwarded to the serializer.
> >>>> +
> >>>> +          ti,rx-mode:
> >>>> +            $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +            enum:
> >>>> +              - 0 # RAW10
> >>>> +              - 1 # RAW12 HF
> >>>> +              - 2 # RAW12 LF
> >>>> +              - 3 # CSI2 SYNC
> >>>> +              - 4 # CSI2 NON-SYNC
> >>>> +            description:
> >>>> +              FPD-Link Input Mode. This should reflect the hardware and the
> >>>> +              default mode of the connected camera module.
> >>>
> >>> As the remote device may not be a camera, I'd write "of the connected
> >>> device" or "of the connected serializer".
> >>
> >> I was trying to include the sensor also in the "camera module", as the
> >> sensor's "normal" pixel cloud would affect RAW modes (HF/LF). Perhaps
> >> "connected device" covers this.
> >>
> >>>> +
> >>>> +          ti,cdr-mode:
> >>>> +            $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +            enum:
> >>>> +              - 0 # FPD-Link III
> >>>> +              - 1 # FPD-Link IV
> >>>> +            description:
> >>>> +              FPD-Link CDR Mode. This should reflect the hardware and the
> >>>> +              default mode of the connected camera module.
> >>>> +
> >>>> +          ti,strobe-pos:
> >>>> +            $ref: /schemas/types.yaml#/definitions/int32
> >>>> +            minimum: -13
> >>>> +            maximum: 13
> >>>> +            description: Manual strobe position
> >>>> +
> >>>> +          ti,eq-level:
> >>>> +            $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +            maximum: 14
> >>>> +            description: Manual EQ level
> >>>> +
> >>>> +          serializer:
> >>>> +            type: object
> >>>> +            description: FPD-Link Serializer node
> >>>> +
> >>>> +        required:
> >>>> +          - reg
> >>>> +          - i2c-alias
> >>>> +          - ti,rx-mode
> >>>> +          - serializer
> >>>> +
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description: FPD-Link input 0
> >>>> +
> >>>> +        properties:
> >>>> +          endpoint:
> >>>> +            $ref: /schemas/media/video-interfaces.yaml#
> >>>> +            unevaluatedProperties: false
> >>>> +            description:
> >>>> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> >>>> +              hsync-active and vsync-active must be defined.
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description: FPD-Link input 1
> >>>> +
> >>>> +        properties:
> >>>> +          endpoint:
> >>>> +            $ref: /schemas/media/video-interfaces.yaml#
> >>>> +            unevaluatedProperties: false
> >>>> +            description:
> >>>> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> >>>> +              hsync-active and vsync-active must be defined.
> >>>> +
> >>>> +      port@2:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description: FPD-Link input 2
> >>>> +
> >>>> +        properties:
> >>>> +          endpoint:
> >>>> +            $ref: /schemas/media/video-interfaces.yaml#
> >>>> +            unevaluatedProperties: false
> >>>> +            description:
> >>>> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> >>>> +              hsync-active and vsync-active must be defined.
> >>>> +
> >>>> +      port@3:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description: FPD-Link input 3
> >>>> +
> >>>> +        properties:
> >>>> +          endpoint:
> >>>> +            $ref: /schemas/media/video-interfaces.yaml#
> >>>> +            unevaluatedProperties: false
> >>>> +            description:
> >>>> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> >>>> +              hsync-active and vsync-active must be defined.
> >>>> +
> >>>> +      port@4:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description: CSI-2 Output 0
> >>>> +
> >>>> +        properties:
> >>>> +          endpoint:
> >>>> +            $ref: /schemas/media/video-interfaces.yaml#
> >>>> +            unevaluatedProperties: false
> >>>> +
> >>>> +            properties:
> >>>> +              data-lanes:
> >>>> +                minItems: 1
> >>>> +                maxItems: 4
> >>>> +
> >>>> +            required:
> >>>> +              - data-lanes
> >>>> +
> >>>> +      port@5:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description: CSI-2 Output 1
> >>>> +
> >>>> +        properties:
> >>>> +          endpoint:
> >>>> +            $ref: /schemas/media/video-interfaces.yaml#
> >>>> +            unevaluatedProperties: false
> >>>> +
> >>>> +            properties:
> >>>> +              data-lanes:
> >>>> +                minItems: 1
> >>>> +                maxItems: 4
> >>>> +
> >>>> +            required:
> >>>> +              - data-lanes
> >>>
> >>> I think you need
> >>>
> >>>       required:
> >>>         - port@0
> >>>         - port@1
> >>>         - port@2
> >>>         - port@3
> >>>         - port@4
> >>>         - port@5
> >>
> >> Is that needed? I think often some of the ports are unused (e.g. the
> >> example in this yaml file). Is it customary to still require empty port
> >> nodes in the DT?
> > 
> > Ports are an intrinsic property of a device, they don't depend on the
> > device integration in the system. In this case, the UB960 has four
> > FPD-Link inputs and two CSI-2 outputs, that's a property of the chip.
> > They don't have to be connected to anything on the board, so endpooints
> > are optional.
> 
> Yes, but why do they have to be required? A missing port node implies 
> that it's not used, doesn't it? I don't mind much, it just feels a bit 
> extra to add multiple almost empty "port@X { reg = <X>; };" style nodes 
> to the dts file.

Lots of them are in .dtsi files, so it's not that bad. The main reasons I
push for making ports mandatory are uniformity (lots of bindings do so,
albeit some because I wrote them or asked for changes during review
:-)), and simplified port handling on the driver side. 

-- 
Regards,

Laurent Pinchart
