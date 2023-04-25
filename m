Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974D96EE660
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 19:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbjDYRLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 13:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjDYRLQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 13:11:16 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803FC10EF;
        Tue, 25 Apr 2023 10:11:15 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-541b60e0a7fso3275841eaf.1;
        Tue, 25 Apr 2023 10:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682442675; x=1685034675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JznrFddSiXYl35RQkX1Ob+FXcZh2odFUGHhxyWsmz3U=;
        b=RbMplnaojXWnzlmjJYqOYUdqzNFq7JKF1tyDGGKvg8O7O6+LkyapAo2NdKZuEx96yR
         pcu1FHLmDXSUvPwXsqrskS4TX3y5aeTmr62FPscV8bNH6npJ35uuBIYk6N0HLUO6UMS2
         Zn/9yiBA2fMrLZbIK0XMWSdn5d9ExrK8AZjkoxV9ToVOc0+GCqoz2771XzKL2SqJJpbt
         BDqqipXyBBNExZHywnTZbta90Od4KWnbVH+OvIWk+pYrbZQom9ArchcwwWOCiAEff8OT
         ie69Yy5bH7Ze4u7zKqR8csgM7fsxI9gt3h3xGqzOHMA+hSFW530Yr0MLt07zab/lvxyN
         MsCg==
X-Gm-Message-State: AAQBX9dX6wAfrI4BGedfZoVCk63bxAhBPKou0uP5bfxH1QzgE+yyih1O
        /r2pOmc0it1CSrRAZJld4g==
X-Google-Smtp-Source: AKy350bgOPl+oy4SaF+mpNjV5TrXeqbf2NPWQoPRYCoX+lQDmvJLqcdERM7wdTosZkSr2nyPqt/LgA==
X-Received: by 2002:a05:6820:553:b0:545:2420:2a77 with SMTP id n19-20020a056820055300b0054524202a77mr6961340ooj.6.1682442674596;
        Tue, 25 Apr 2023 10:11:14 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dk10-20020a0568303b0a00b006a60606de62sm5888288otb.52.2023.04.25.10.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 10:11:14 -0700 (PDT)
Received: (nullmailer pid 1963762 invoked by uid 1000);
        Tue, 25 Apr 2023 17:11:13 -0000
Date:   Tue, 25 Apr 2023 12:11:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 4/7] dt-bindings: media: add TI DS90UB960 FPD-Link
 III Deserializer
Message-ID: <20230425171113.GA1957523-robh@kernel.org>
References: <20230421101833.345984-1-tomi.valkeinen@ideasonboard.com>
 <20230421101833.345984-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421101833.345984-5-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 21, 2023 at 01:18:30PM +0300, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB960 FPD-Link III Deserializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 423 ++++++++++++++++++
>  1 file changed, 423 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> new file mode 100644
> index 000000000000..1d5362bea09a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> @@ -0,0 +1,423 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +
> +description:
> +  The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
> +  forwarding.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ds90ub960-q1
> +      - ti,ds90ub9702-q1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Reference clock connected to the REFCLK pin.
> +
> +  clock-names:
> +    items:
> +      - const: refclk
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the PDB pin.
> +
> +  i2c-alias-pool:
> +    $ref: /schemas/i2c/i2c-atr.yaml#/properties/i2c-alias-pool

This is not how we handle common properties (usually). Just reference 
'/schemas/i2c/i2c-atr.yaml#' at the top level and use 
unevaluatedProperties.

Is there a limit to the number of entries for this device? If so, add 
that here.

Rob
