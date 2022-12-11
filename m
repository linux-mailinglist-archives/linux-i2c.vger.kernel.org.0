Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCED564956B
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Dec 2022 18:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiLKReb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Dec 2022 12:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiLKRe3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Dec 2022 12:34:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB927BF65;
        Sun, 11 Dec 2022 09:34:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93F936CF;
        Sun, 11 Dec 2022 18:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670780066;
        bh=BLAg6LgH4DZ7+JKv2ntt47tqc6o1pXruQL+UuppAm+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mmwNk9B5NACjJHW2Xa0CN8LP82vrNRJcnd4in/6M/4cqXluY8wV1kFlrgd7R2aIK+
         GPtUBPre/i172Dx9z7UAxBYYt0z3RniyeWpKcDia1SEo9cEwQy/WamD2KFgrmhHf1Z
         qYo06rnbCfhpkq37Q0uu7xBX2GZPpsZMIXMEU1EU=
Date:   Sun, 11 Dec 2022 19:34:24 +0200
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
Subject: Re: [PATCH v5 4/8] dt-bindings: media: add bindings for TI DS90UB953
Message-ID: <Y5YUoEWmHsUT8zgf@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221208104006.316606-5-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Dec 08, 2022 at 12:40:02PM +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB953 FPDLink-3 Serializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub953.yaml      | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> new file mode 100644
> index 000000000000..fd7d25d93e2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub953.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DS90UB953 FPD-Link 3 Serializer
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +
> +description:
> +  The TI DS90UB953 is an FPD-Link 3 video serializer for MIPI CSI-2.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ds90ub953-q1
> +      - ti,ds90ub971-q1
> +
> +  '#gpio-cells':
> +    const: 2

I would add a description here, to tell what the cells correspond to. In
particular, the first cell selects the GPIO_* pin number, it would be
nice to document that its value should be in the range [0, 3].

Same comment for patch 3/8 (DS90UB913 bindings). There you could also
mention that GPO2 and the output clock are mutually exclusive.

> +
> +  gpio-controller: true
> +

No need for clocks and clock-names for the reference input clock ? Or is
this because you support sync mode only for now ?

> +  '#clock-cells':
> +    const: 0
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 input port
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false

Should the data-lanes property be required for the CSI-2 input ?

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +        description: FPD-Link 3 output port
> +
> +  i2c:
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - '#gpio-cells'
> +  - gpio-controller
> +  - '#clock-cells'
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    serializer {
> +      compatible = "ti,ds90ub953-q1";
> +
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +
> +      #clock-cells = <0>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          ub953_in: endpoint {
> +            clock-lanes = <0>;
> +            data-lanes = <1 2 3 4>;
> +            remote-endpoint = <&sensor_out>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          endpoint {
> +            remote-endpoint = <&deser_fpd_in>;
> +          };
> +        };
> +      };
> +
> +      i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sensor@1a {
> +          compatible = "sony,imx274";
> +          reg = <0x1a>;
> +
> +          reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;

Maybe add

          clocks = <&serializer>;
	  clock-names = "inck";

to showcase the clock connection ?

> +
> +          port {
> +            sensor_out: endpoint {
> +              remote-endpoint = <&ub953_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +...

-- 
Regards,

Laurent Pinchart
