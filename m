Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536EB47635D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 21:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhLOUdk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 15:33:40 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:44793 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbhLOUdk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Dec 2021 15:33:40 -0500
Received: by mail-ot1-f43.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso26325446otj.11;
        Wed, 15 Dec 2021 12:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PNasZti3EJAcUjmghAAyjrnvtl+di8xU5grpOnCBmyg=;
        b=r/Os1Kd4WaahbBlEUwTmFvMz0jGMaEf5GyRAEsQcwXDHvAEx8OY3O+2FmcKTk5s8F9
         DUG/r3/ozWdtYWboXX0729eGeT5AbDBr/TzjUitOsNKZVfKT9RfzAef9v+p6zKCuMLR7
         71uF2hb9HrY8tyaSurfycruRmbn22eWBzarDSG53P9CMaKOnAnApA0GX9NimBoHWfr0j
         yLvQNpya2WGAe5epcHRkxpc/mqisF8rr8uOCSa3yZllujU6j9sehV7VLwvBOXveWgUMj
         zJO74zz5ILlgCOzxXs+Kwl/70JpFWjFIeWoAZH2e5NOSLJxC5hnqyevRugxC9JgcbhRl
         RyOg==
X-Gm-Message-State: AOAM531a51wj4QoqprZHGHNfczzKVFqVZW6xuoWWrXwGZsf04NOznj9F
        KvZSs08XXpx+hSkZqhZVeyQsfEm8dg==
X-Google-Smtp-Source: ABdhPJzYfl8+giEp7MlljEoKVlDCMkHWhKVi6Os4fWSTlT/WQhPPg1r7k7uJ2jVEdD343rJGGqFJOw==
X-Received: by 2002:a05:6830:3499:: with SMTP id c25mr10508450otu.206.1639600419551;
        Wed, 15 Dec 2021 12:33:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bh12sm534362oib.25.2021.12.15.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 12:33:39 -0800 (PST)
Received: (nullmailer pid 1790368 invoked by uid 1000);
        Wed, 15 Dec 2021 20:33:38 -0000
Date:   Wed, 15 Dec 2021 14:33:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: i2c Update PCA954x
Message-ID: <YbpRIjHgfPvHq/zR@robh.at.kernel.org>
References: <20211214095021.572799-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214095021.572799-1-patrick.rudolph@9elements.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 14, 2021 at 10:50:18AM +0100, Patrick Rudolph wrote:
> Add the Maxim MAX735x as supported chip to PCA954x and add an
> example how to use it.

The subject needs some work. Every change is an 'update' and you should 
say something about Maxim. 'Add Maxim MAX735x variants' or something.

> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9f1726d0356b..bd794cb80c11 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -11,6 +11,7 @@ maintainers:
>  
>  description:
>    The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> +  Compatible with Maxim MAX7356 - MAX7358 I2C mux/switch devices.
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-mux.yaml#
> @@ -19,6 +20,9 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - maxim,max7356
> +          - maxim,max7357
> +          - maxim,max7358
>            - nxp,pca9540
>            - nxp,pca9542
>            - nxp,pca9543
> @@ -40,6 +44,7 @@ properties:
>  
>    interrupts:
>      maxItems: 1
> +    description: Only supported on NXP devices. Unsupported on Maxim MAX735x.

You can express that as an if/then schema.

Just 'interrupts: false' for maxim compatibles. There's lots of 
examples in the tree.

>  
>    "#interrupt-cells":
>      const: 2
> @@ -100,6 +105,41 @@ examples:
>                  #size-cells = <0>;
>                  reg = <4>;
>  
> +                rtc@51 {
> +                    compatible = "nxp,pcf8563";
> +                    reg = <0x51>;
> +                };

Unrelated change.

> +            };
> +        };
> +    };
> +
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;

Really need another example?

> +
> +        i2c-mux@74 {
> +            compatible = "maxim,max7357";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0x74>;
> +
> +            i2c@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +
> +                eeprom@54 {
> +                    compatible = "atmel,24c08";
> +                    reg = <0x54>;
> +                };
> +            };
> +
> +            i2c@7 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <7>;
> +
>                  rtc@51 {
>                      compatible = "nxp,pcf8563";
>                      reg = <0x51>;
> -- 
> 2.33.1
> 
> 
