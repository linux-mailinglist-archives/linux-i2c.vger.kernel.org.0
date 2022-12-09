Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D92648A04
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 22:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiLIV1u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 16:27:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiLIV1t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 16:27:49 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505DF1AA05;
        Fri,  9 Dec 2022 13:27:47 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id l8-20020a056830054800b006705fd35eceso3567789otb.12;
        Fri, 09 Dec 2022 13:27:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg694K3D9ZmeFmtJTziFy7CUnYwe7GhPbNHBCzwIFAo=;
        b=3bVC9+SobDt/Ug6RKCvoAPJxCwemOdtkKmiFppV+nE1iC7VxuKgMq3Ky87deZAuSV1
         VceDrSgG3f5aaG/UickWS3gpX7UMkewg0VOGRwsmBia+a5x1tm7GHXKROMWe+e7gprqN
         osTXXM1U+4cenLpzwXMo0bvD9+sy2gOkHqvfNy9DMjyUAhqzx1kdqVwM090TcEw4jE9D
         UpZokYeB5gTyJw/1tY+x0bfUObpRDCcx4bIp5miumyNlAao0OfkMEJvQoZIjNui/0swl
         3ukY39uEmeaCwLrUOErSECwzszgFSrW6y6kNO0hoegMRaJBoUpf0TuNyiA/CP/jPMolR
         a4yQ==
X-Gm-Message-State: ANoB5plXplwDYaaslOSDrUlMx0PXTDzS9zZ48/9IRbvIKEA84Ku4FFy5
        CDGhB3bThI3DN+iqGIfSMNfQ6c2kJQ==
X-Google-Smtp-Source: AA0mqf7Mx/2tFr/1LVrocIId/TLhmiuqE3gBBaSCf0SHEc1rD05Cv+ftg9fDY10BbGwSVUL1nCFAEQ==
X-Received: by 2002:a9d:178d:0:b0:66c:37a2:d87d with SMTP id j13-20020a9d178d000000b0066c37a2d87dmr4258041otj.26.1670621266516;
        Fri, 09 Dec 2022 13:27:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t21-20020a9d7495000000b006705829996fsm1003633otk.56.2022.12.09.13.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 13:27:45 -0800 (PST)
Received: (nullmailer pid 3875908 invoked by uid 1000);
        Fri, 09 Dec 2022 21:27:44 -0000
Date:   Fri, 9 Dec 2022 15:27:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
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
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 4/8] dt-bindings: media: add bindings for TI DS90UB953
Message-ID: <20221209212744.GA3868990-robh@kernel.org>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208104006.316606-5-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 08, 2022 at 12:40:02PM +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB953 FPDLink-3 Serializer.

Seems like this and DS90UB913 binding could be combined. I couldn't spot 
a difference.

In the subjects, drop 'binding for'. The prefix says this is a binding. 
Maybe add 'Serializer'.

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
> +
> +  gpio-controller: true
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
> -- 
> 2.34.1
> 
> 
