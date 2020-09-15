Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686B926ADD3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 21:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgIOTmH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 15:42:07 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39362 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbgIOTmA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Sep 2020 15:42:00 -0400
Received: by mail-io1-f67.google.com with SMTP id b6so5474580iof.6;
        Tue, 15 Sep 2020 12:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KoMBD7bZ7/04a7spyIzL/jABF0GGBoCw3/93FOBmre4=;
        b=UdCdDmw42KQnN2lwDV7tvd2cS2lpXbgmzKrb1mGysv6BwzEoxu6X22sx/niOQ+dn3D
         HjnubO1TuwynxR37zvBzbHSf/+utSahgea9EuyAIb05qA8CIpq2Xy5gLbQ41e3nnf0PV
         /is/h6YxmMwstV/Mtb4e3jNL10mF8ceAyAl3B63W+buX/g2/uQnerzoHlsuPHE8bLYiQ
         L/SudGdVQC4EXPylUT50riQTUHqgQ/zD6zdaRKY8/jFbcK2t/j30xviL0Sb0HszUJCPv
         yS0td3sAp05SsFh6o4ivyDdC6dy+bPU4nNx3YcJPJ4tvZ5dccaHGtliYxAlnAf/9lJH8
         1CiQ==
X-Gm-Message-State: AOAM531LsowLCigbnbA0Cdi8mEfojWj0cNkk8vFHy7PhO0gRW3YPxSgM
        x9NGlsI5Q5tcKizdwlDLhA==
X-Google-Smtp-Source: ABdhPJxqHEezzhn9NZakudm0c7bkFStWclj5gAvuy/jB4WnxJpwrisZHOrKO0Yx62rktPyobQBmN2g==
X-Received: by 2002:a6b:d606:: with SMTP id w6mr16186811ioa.89.1600198919002;
        Tue, 15 Sep 2020 12:41:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p9sm8125532iov.18.2020.09.15.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 12:41:58 -0700 (PDT)
Received: (nullmailer pid 2379577 invoked by uid 1000);
        Tue, 15 Sep 2020 19:41:57 -0000
Date:   Tue, 15 Sep 2020 13:41:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: i2c: imx-lpi2c: Add properties and
 use unevaluatedProperties
Message-ID: <20200915194157.GA2377739@bogus>
References: <20200910182244.5815-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910182244.5815-1-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 10, 2020 at 08:22:41PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so
> describe all typical properties, reference generic i2c schema and use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: i2c@5a800000:
>     'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: i2c@5a800000:
>     'touchscreen@2c' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Add assigned-clock-parents
> 
> Changes since v1:
> 1. Add more properties and include /schemas/i2c/i2c-controller.yaml#
> ---
>  .../bindings/i2c/i2c-imx-lpi2c.yaml           | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index ac0bc5dd64d6..918535b33384 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -9,6 +9,9 @@ title: Freescale Low Power Inter IC (LPI2C) for i.MX
>  maintainers:
>    - Anson Huang <Anson.Huang@nxp.com>
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -16,29 +19,42 @@ properties:
>        - fsl,imx8qxp-lpi2c
>        - fsl,imx8qm-lpi2c
>  
> +  '#address-cells': true
> +  '#size-cells': true

Can drop these as they are in i2c-controller.yaml.

> +
>    reg:
>      maxItems: 1
>  
>    interrupts:
>      maxItems: 1
>  
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true
> +  assigned-clocks: true
> +  clock-frequency: true
> +
> +  clock-names:
> +    maxItems: 1
> +
>    clocks:
>      maxItems: 1
>  
> +  power-domains: true

How many?

> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
>      #include <dt-bindings/clock/imx7ulp-clock.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -    lpi2c7@40a50000 {
> +    i2c@40a50000 {
>          compatible = "fsl,imx7ulp-lpi2c";
>          reg = <0x40A50000 0x10000>;
>          interrupt-parent = <&intc>;
> -- 
> 2.17.1
> 
