Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0C44AA5A7
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Feb 2022 03:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378959AbiBECVx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 21:21:53 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:39803 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240608AbiBECVw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 21:21:52 -0500
Received: by mail-oi1-f176.google.com with SMTP id s24so2993370oic.6;
        Fri, 04 Feb 2022 18:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x01t8Em5FbScKdEl6NTYvjfFK/JKC2XROUz3tUIaZiA=;
        b=5MkdsD+VPTY18dfupGhUnfR0p2DKo2P+cP4N0IEv3suHSk2rYAfvkCJ2CBnV6H7fjo
         K8GTKS0THnByw0G6Ml4D6WFbaflHW/TE/vXtj7bCGAgaeMe8oex9Gt4jq2bx8Tf+HaJL
         iJWIxJ3X2y8HBji2XTYi0RG6CpZA6QL4UcuflDD7FCvrkJJ/8DIvJQ1sY44yn4OHI/qh
         ic1lgcVfgPPq4cKozn2yiRJsTPfhPvMVq8zvz400XQovBuAAx7Rg4pE3JNo0xjWTxIs1
         +4PnXmBrEaUC+5VABbdwFx8+6XQ0YI/U+r93OcCSwjKpBhXi9iJGyqlWVR9yFKFeaR25
         yKnQ==
X-Gm-Message-State: AOAM532HhWBjoBHQgCzXk0lOyjeq0Zh2wZCKZWk7U5WJhCxRHOH9Y2M4
        fT+luYOsMJh96M5+qaPAQl1WbdhlZA==
X-Google-Smtp-Source: ABdhPJwaCW2JlKmM1j4e+8o9k+dZOzXdZmkWT3Y9RpLjzqp0tqfiOSWWCn1nu2hItqJRMDxALj69pw==
X-Received: by 2002:a05:6808:2002:: with SMTP id q2mr862579oiw.71.1644027712076;
        Fri, 04 Feb 2022 18:21:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n128sm1489830oia.6.2022.02.04.18.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 18:21:51 -0800 (PST)
Received: (nullmailer pid 3629269 invoked by uid 1000);
        Sat, 05 Feb 2022 02:21:50 -0000
Date:   Fri, 4 Feb 2022 20:21:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v3 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <Yf3fPmoqTukCVM8w@robh.at.kernel.org>
References: <20220120121314.463944-1-patrick.rudolph@9elements.com>
 <20220120121314.463944-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120121314.463944-2-patrick.rudolph@9elements.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 01:13:11PM +0100, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the exisintg pca954x driver.
> 
> While on it make the interrupts support conditionally as not all of the
> existing chips have interrupts.
> 
> For chips that are powered off by default add an optional regulator
> called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 43 ++++++++++++++-----
>  1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9f1726d0356b..e7650e2a777e 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -4,21 +4,47 @@
>  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NXP PCA954x I2C bus switch
> +title: NXP PCA954x I2C and compatible bus switches
>  
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  
>  description:
> -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
> +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-mux.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max7367
> +              - maxim,max7369
> +              - nxp,pca9542
> +              - nxp,pca9543
> +              - nxp,pca9544
> +              - nxp,pca9545
> +    then:
> +      properties:
> +        interrupts: true

Now any number of interrupts are valid and undefined.

> +
> +        "#interrupt-cells":
> +          const: 2
> +
> +        interrupt-controller: true
>  
>  properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - maxim,max7356
> +          - maxim,max7357
> +          - maxim,max7358
> +          - maxim,max7367
> +          - maxim,max7368
> +          - maxim,max7369
>            - nxp,pca9540
>            - nxp,pca9542
>            - nxp,pca9543
> @@ -38,14 +64,6 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    maxItems: 1
> -
> -  "#interrupt-cells":
> -    const: 2
> -
> -  interrupt-controller: true
> -
>    reset-gpios:
>      maxItems: 1
>  
> @@ -59,6 +77,9 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vdd-supply:
> +    description: A voltage regulator supplying power to the chip.
> +
>  required:
>    - compatible
>    - reg
> @@ -79,6 +100,8 @@ examples:
>              #size-cells = <0>;
>              reg = <0x74>;
>  
> +            vdd-supply = <&p3v3>;
> +
>              interrupt-parent = <&ipic>;
>              interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>              interrupt-controller;
> -- 
> 2.34.1
> 
> 
