Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B033617BE3
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 12:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiKCLuw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 07:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiKCLuv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 07:50:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658A812610;
        Thu,  3 Nov 2022 04:50:49 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC859589;
        Thu,  3 Nov 2022 12:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667476247;
        bh=ppvC5YXRsAbBAqn1q/GmSN9B9YazpDNA2LjXLWMhHD0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KhmrHv4Acw5wPTJx2UqJKfyefJd+AOP5ANQ5y/GToXVqJIUX06XqAKhAfTnHwydZo
         zHe4dGUMwnXhuWa25gveCi5TxcELNJ2So2ji8JVLMmIliOm9cOTJbbOeGC0WV7mUo4
         UyP65G1nB4AMRIueaiL4w6jCaT8wzEl1VTjslcqE=
Message-ID: <6c254d5f-9fa1-b06a-4edb-7e58e4b33101@ideasonboard.com>
Date:   Thu, 3 Nov 2022 13:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 3/8] dt-bindings: media: add bindings for TI DS90UB960
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
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
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
 <20221102172630.GA4140587-robh@kernel.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221102172630.GA4140587-robh@kernel.org>
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

Hi Rob,

On 02/11/2022 19:26, Rob Herring wrote:
> On Tue, Nov 01, 2022 at 03:20:27PM +0200, Tomi Valkeinen wrote:
>> Add DT bindings for TI DS90UB960 FPDLink-3 Deserializer.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   .../bindings/media/i2c/ti,ds90ub960.yaml      | 392 ++++++++++++++++++
>>   1 file changed, 392 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> new file mode 100644
>> index 000000000000..4456d9b3e2c7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> @@ -0,0 +1,392 @@
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
>> +description: |
> 
> Don't need '|'

Hmm, ok... But why does that work? I can only find yaml examples for 
multi-line with either | or >.

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
>> +    description:
>> +      i2c addresses for the deserializer and the serializers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: main
> 
> 'reg-names' is not all that useful with only 1 entry.

True.

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
> 
> Something common or could be? If not, then needs a vendor prefix.

I'll have to think about this. It is related to the i2c-atr, so I think 
it might be a common thing.

>> +    $ref: /schemas/types.yaml#/definitions/uint16-array
>> +    description:
>> +      i2c alias pool for remote devices.
> 
> Needs a better description. What's an 'alias pool'?

Right.

"i2c alias pool is a pool of i2c addresses on the main i2c bus that can 
be used to access the remote peripherals. Each remote peripheral is 
assigned an alias from the pool, and transactions to that address will 
be forwarded to the remote peripheral, with the address translated to 
the remote peripheral's real address."

> 0-0xffff are valid values?

They are i2c addresses, and linux i2c uses u16 for addresses. Then 
again, the fpdlink devices only support 7-bit addresses, so maybe this 
could be an uint8 array. I am not sure what's the best way to define this.

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
>> +      manual-strobe:
>> +        type: boolean
>> +        description:
>> +          Enable manual strobe position and EQ level
>> +
>> +    patternProperties:
>> +      '^link@[0-9a-f]+$':
>> +        type: object
>> +        additionalProperties: false
>> +        properties:
>> +          reg:
>> +            description: The link number
>> +            maxItems: 1
>> +
>> +          i2c-alias:
> 
> Vendor prefix.
> 
>> +            description: |
>> +              The i2c address used for the serializer. Transactions to this
>> +              address on the i2c bus where the deserializer resides are
>> +              forwarded to the serializer.
>> +
>> +          rx-mode:
> 
> Vendor prefix. And so on...

Yes, I totally missed these.

>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            enum:
>> +              - 0 # RAW10
>> +              - 1 # RAW12 HF
>> +              - 2 # RAW12 LF
>> +              - 3 # CSI2 SYNC
>> +              - 4 # CSI2 NON-SYNC
>> +            description: FPD-Link Input Mode
>> +
>> +          cdr-mode:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            enum:
>> +              - 0 # FPD3
>> +              - 1 # FPD4
>> +            description: FPD-Link CDR Mode
>> +
>> +          strobe-pos:
>> +            $ref: /schemas/types.yaml#/definitions/int32
>> +            minimum: -13
>> +            maximum: 13
>> +            description: Manual strobe position, from -13 to 13
> 
> No need to put constraints in free form text.

Ok.

>> +
>> +          eq-level:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            maximum: 14
>> +            description: Manual EQ level, from 0 to 14
>> +
>> +          serializer:
>> +            type: object
>> +            description: FPD-Link Serializer node
>> +
>> +        required:
>> +          - reg
>> +          - i2c-alias
>> +          - rx-mode
>> +          - serializer
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> 
>             additionalProperties: false

This gives me check errors about the port's 'reg' property. Using 
'unevaluatedProperties' works fine. Is 'unevaluatedProperties' correct, 
or am I missing something here?

>> +        description: FPD-Link input 0
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
> 
>                 unevaluatedProperties: false
> 
> Same for the other port nodes

Yep.

>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: FPD-Link input 1
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: FPD-Link input 2
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: FPD-Link input 3
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +
>> +      port@4:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: CSI-2 Output 0
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +
>> +            properties:
>> +              clock-lanes:
>> +                maxItems: 1
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
> 
> Why the constraints on this endpoint? Are the other ones actually using
> properties from video-interfaces.yaml? If not, then just reference
> /properties/port and drop 'endpoint' instead.

The ports 0-3 do not use any properties from video-interfaces.yaml, so 
I'll drop the endpoint.

Ports 4,5 are CSI-2 ports and need the clock-lanes and data-lanes to be 
defined.

Is there something wrong with the constraints, or were you just 
wondering about the difference between ports 0-3 and 4,5

>> +
>> +      port@5:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: CSI-2 Output 1
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +
>> +            properties:
>> +              clock-lanes:
>> +                maxItems: 1
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +      clock-frequency = <400000>;
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      deser@3d {
>> +        compatible = "ti,ds90ub960-q1";
>> +
>> +        reg-names = "main";
>> +        reg       = <0x3d>;
>> +
>> +        clock-names = "refclk";
>> +        clocks = <&fixed_clock>;
>> +
>> +        powerdown-gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
>> +
>> +        i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
>> +
>> +        ports {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          /* Port 0, Camera 0 */
>> +          port@0 {
>> +            reg = <0>;
>> +
>> +            ub960_fpd3_1_in: endpoint {
>> +              remote-endpoint = <&ub953_1_out>;
>> +
>> +              rx-mode = <0>;
> 
> Looks like this is not defined under 'endpoint'.

Indeed, and after adding the 'unevaluatedProperties' I do get a warning 
here.

>> +            };
>> +          };
>> +
>> +          /* Port 0, Camera 1 */
>> +          port@1 {
>> +            reg = <1>;
>> +
>> +            ub960_fpd3_2_in: endpoint {
>> +              remote-endpoint = <&ub913_2_out>;
>> +
>> +              rx-mode = <0>;
>> +            };
>> +          };
>> +
>> +          /* Port 4, CSI-2 TX */
>> +          port@4 {
>> +            reg = <4>;
>> +            ds90ub960_0_csi_out: endpoint {
>> +              clock-lanes = <0>;
>> +              data-lanes = <1 2 3 4>;
>> +              link-frequencies = /bits/ 64 <800000000>;
>> +              remote-endpoint = <&csi2_phy0>;
>> +            };
>> +          };
>> +        };
>> +
>> +        links {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          /* Link 0 has DS90UB953 serializer and IMX390 sensor */
>> +
>> +          link@0 {
>> +            reg = <0>;
>> +            i2c-alias = <68>;
>> +
>> +            rx-mode = <3>;
>> +
>> +            serializer1: serializer {
>> +              compatible = "ti,ds90ub953-q1";
>> +
>> +              gpio-controller;
>> +              #gpio-cells = <2>;
>> +
>> +              #clock-cells = <0>;
>> +
>> +              ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                  reg = <0>;
>> +                  ub953_1_in: endpoint {
>> +                    clock-lanes = <0>;
>> +                    data-lanes = <1 2 3 4>;
>> +                    remote-endpoint = <&sensor_1_out>;
>> +                  };
>> +                };
>> +
>> +                port@1 {
>> +                  reg = <1>;
>> +
>> +                  ub953_1_out: endpoint {
>> +                    remote-endpoint = <&ub960_fpd3_1_in>;
>> +                  };
>> +                };
>> +              };
>> +
>> +              i2c {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                sensor@21 {
>> +                  compatible = "sony,imx390";

DT_CHECKER_FLAGS=-m gives a warning here, as sony,imx390 is not in 
upstream. The sensor details are not really relevant here, but I used 
the data for the setup I have.

Should I instead use some sensor here that is in upstream, which I think 
should work with the fpdlink ICs?

  Tomi

