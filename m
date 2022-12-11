Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41AC164952B
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Dec 2022 18:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiLKRNQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Dec 2022 12:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiLKRNP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Dec 2022 12:13:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916F8BE0B;
        Sun, 11 Dec 2022 09:13:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABAFF6CF;
        Sun, 11 Dec 2022 18:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670778790;
        bh=nMxnkQlF2Kw2OKGtkSrbO4fz2lb/VmSVH+9BXA3jdmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qbu2/vP/gn8m/W/ceqez8rfSG0LoplXBhVE9Ebck1EXI2vXiEtIxXOLRoaRuk+bGq
         F8H6JzSaFxaXroXJCh9dxx6bG4IF+YSplTfPGMFWPKQCF5ke2QiDrlg58DID+qw+iF
         MKlxr0/bvkga4xIzsPmNcHHtiz/5MIl1pd4gFIFA=
Date:   Sun, 11 Dec 2022 19:13:08 +0200
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
Message-ID: <Y5YPpGVJxAhkNJmC@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221208104006.316606-4-tomi.valkeinen@ideasonboard.com>
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

On Thu, Dec 08, 2022 at 12:40:01PM +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB913 FPDLink-3 Serializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub913.yaml      | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
> new file mode 100644
> index 000000000000..3a5b34c6bb64
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub913.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DS90UB913 FPD-Link 3 Serializer

I think TI consistently writes it "FPD-Link III". If you rename it,
please do so through the whole series.

> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +
> +description:
> +  The TI DS90UB913 is an FPD-Link 3 video serializer for parallel video.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ds90ub913a-q1

Is the -q1 suffix needed, are there other variants ?

> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Reference clock connected to the CLKIN pin.
> +
> +  clock-names:
> +    items:
> +      - const: clkin
> +
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
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +        description: FPD-Link 3 output port

I'd add

    required:
      - port@0
      - port@1

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> +      compatible = "ti,ds90ub913a-q1";
> +
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +
> +      clocks = <&clk_cam_48M>;
> +      clock-names = "clkin";
> +
> +      #clock-cells = <0>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          ub913_in: endpoint {
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
> +        sensor@48 {
> +          compatible = "aptina,mt9v111";
> +          reg = <0x48>;
> +
> +          clocks = <&fixed_clock>;
> +
> +          port {
> +            sensor_out: endpoint {
> +              remote-endpoint = <&ub913_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +...

-- 
Regards,

Laurent Pinchart
