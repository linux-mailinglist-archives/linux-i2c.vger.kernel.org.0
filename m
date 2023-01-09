Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF57E662005
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 09:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236303AbjAIIb0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 03:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236623AbjAIIaf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 03:30:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5317F8FF0;
        Mon,  9 Jan 2023 00:30:21 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3BAD6CF;
        Mon,  9 Jan 2023 09:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673253018;
        bh=sdVspnhyF91px8Uo85ASpiXoNUN4uleKcRqMugs9VBo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ce6Um9vr8SCNk9BuEKWX5nBF6JWZh4gWOm7K8DZumxOzwKEHxTEWVISnbLE+cP5z4
         m4IB/NXyJ3gjVFBIyuoLFeeHLvNf0CBX2M+6jAz9kEgaXRZnUFpDxYHmGa7+E4zkE4
         IYj1PpvTyiKU5uEHSkWgoYpHdB6sBfyoVaguEGMc=
Message-ID: <a3857c78-c221-176f-b862-a0435b301c67@ideasonboard.com>
Date:   Mon, 9 Jan 2023 10:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 5/8] dt-bindings: media: add TI DS90UB960 FPD-Link III
 Deserializer
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-6-tomi.valkeinen@ideasonboard.com>
 <Y7o3QEq9utV8nswA@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y7o3QEq9utV8nswA@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/01/2023 05:23, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Jan 05, 2023 at 04:03:04PM +0200, Tomi Valkeinen wrote:
>> Add DT bindings for TI DS90UB960 FPD-Link III Deserializer.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../bindings/media/i2c/ti,ds90ub960.yaml      | 402 ++++++++++++++++++
>>   1 file changed, 402 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> new file mode 100644
>> index 000000000000..664799ae55be
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> @@ -0,0 +1,402 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub960.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
>> +
>> +maintainers:
>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> +
>> +description:
>> +  The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
>> +  forwarding.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,ds90ub960-q1
>> +      - ti,ds90ub9702-q1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description:
>> +      Reference clock connected to the REFCLK pin.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: refclk
>> +
>> +  powerdown-gpios:
>> +    maxItems: 1
>> +    description:
>> +      Specifier for the GPIO connected to the PDB pin.
>> +
>> +  i2c-alias-pool:
>> +    $ref: /schemas/types.yaml#/definitions/uint16-array
>> +    description:
>> +      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
>> +      used to access the remote peripherals on the serializer's I2C bus. The
>> +      addresses must be available, not used by any other peripheral. Each
>> +      remote peripheral is assigned an alias from the pool, and transactions to
>> +      that address will be forwarded to the remote peripheral, with the address
>> +      translated to the remote peripheral's real address. This property is not
>> +      needed if there are no I2C addressable remote peripherals.
>> +
>> +  links:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 0
>> +
>> +      ti,manual-strobe:
>> +        type: boolean
>> +        description:
>> +          Enable manual strobe position and EQ level
>> +
>> +    patternProperties:
>> +      '^link@[0-3]$':
>> +        type: object
>> +        additionalProperties: false
>> +        properties:
>> +          reg:
>> +            description: The link number
>> +            maxItems: 1
>> +
>> +          i2c-alias:
>> +            description:
>> +              The I2C address used for the serializer. Transactions to this
>> +              address on the I2C bus where the deserializer resides are
>> +              forwarded to the serializer.
>> +
>> +          ti,rx-mode:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            enum:
>> +              - 0 # RAW10
>> +              - 1 # RAW12 HF
>> +              - 2 # RAW12 LF
>> +              - 3 # CSI2 SYNC
>> +              - 4 # CSI2 NON-SYNC
>> +            description:
>> +              FPD-Link Input Mode. This should reflect the hardware and the
>> +              default mode of the connected camera module.
> 
> As the remote device may not be a camera, I'd write "of the connected
> device" or "of the connected serializer".

I was trying to include the sensor also in the "camera module", as the 
sensor's "normal" pixel cloud would affect RAW modes (HF/LF). Perhaps 
"connected device" covers this.

>> +
>> +          ti,cdr-mode:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            enum:
>> +              - 0 # FPD-Link III
>> +              - 1 # FPD-Link IV
>> +            description:
>> +              FPD-Link CDR Mode. This should reflect the hardware and the
>> +              default mode of the connected camera module.
>> +
>> +          ti,strobe-pos:
>> +            $ref: /schemas/types.yaml#/definitions/int32
>> +            minimum: -13
>> +            maximum: 13
>> +            description: Manual strobe position
>> +
>> +          ti,eq-level:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            maximum: 14
>> +            description: Manual EQ level
>> +
>> +          serializer:
>> +            type: object
>> +            description: FPD-Link Serializer node
>> +
>> +        required:
>> +          - reg
>> +          - i2c-alias
>> +          - ti,rx-mode
>> +          - serializer
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: FPD-Link input 0
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            description:
>> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> +              hsync-active and vsync-active must be defined.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: FPD-Link input 1
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            description:
>> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> +              hsync-active and vsync-active must be defined.
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: FPD-Link input 2
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            description:
>> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> +              hsync-active and vsync-active must be defined.
>> +
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: FPD-Link input 3
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            description:
>> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> +              hsync-active and vsync-active must be defined.
>> +
>> +      port@4:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: CSI-2 Output 0
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +      port@5:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: CSI-2 Output 1
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +            required:
>> +              - data-lanes
> 
> I think you need
> 
>      required:
>        - port@0
>        - port@1
>        - port@2
>        - port@3
>        - port@4
>        - port@5

Is that needed? I think often some of the ports are unused (e.g. the 
example in this yaml file). Is it customary to still require empty port 
nodes in the DT?

  Tomi

