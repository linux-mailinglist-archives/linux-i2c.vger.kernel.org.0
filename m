Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92954462226
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbhK2U3i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:29:38 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:38827 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbhK2U0e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:26:34 -0500
Received: by mail-oi1-f180.google.com with SMTP id r26so36809085oiw.5;
        Mon, 29 Nov 2021 12:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lDk8BlneSuRVeKSf5grrrIRYXl1VbeT1udhOyG1OtVk=;
        b=Dn0HbFSXMVpM8g6TPx9ce76jmgRiR5Pm8r3oRIbCj2W/MNB87naj3CYoT1KvRfBVHv
         XU5N84CuUAnnWKU97nA3CaKQKkpvS4BZ0M5yF5qqaEoVEPMjrOK1KUUHAhoVlGYVBfbN
         2YRcmRsH+VhP/FDmg2KTQfgsQ76AP7SZPElqJ76g6Nvkk5sxEKxKUz1N9AVaPyK/V5FH
         nZqG74h97ILvQRViBCAvYlpf1EIgEVmZVoWDC3AyDyj/zsuBc2QxDSy0blG/kkjycM5W
         lGKjhvzVWqyQPbSqnwOkLbI9NU8GWpF4i9lTyyA2MnoEHgbQgr1x5T9mUTKueU/FnZoF
         jnIA==
X-Gm-Message-State: AOAM532XcQyvSgRi2OFLuXmCX4UfMjqHIOJexDjs/cKCKt1C/yF6XBPd
        SdIVDAM1s3M1QqnR96neSw==
X-Google-Smtp-Source: ABdhPJwF7Y+9YhXyqxZGUYPifOjP+P5BOlnWsiZCV4rCVdjToGw+1EGueSoksyzSxVFXxzRBg793XQ==
X-Received: by 2002:aca:ab86:: with SMTP id u128mr271578oie.41.1638217396125;
        Mon, 29 Nov 2021 12:23:16 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x17sm2419929oot.30.2021.11.29.12.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 12:23:15 -0800 (PST)
Received: (nullmailer pid 540951 invoked by uid 1000);
        Mon, 29 Nov 2021 20:23:14 -0000
Date:   Mon, 29 Nov 2021 14:23:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     "LH.Kuo" <lhjeff911@gmail.com>
Cc:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, qinjian@cqplus1.com,
        wells.lu@sunplus.com, "LH.Kuo" <lh.kuo@sunplus.com>
Subject: Re: [PATCH v2 2/2] devicetree bindings I2C Add bindings doc for
 Sunplus SP7021
Message-ID: <YaU2snDw5KiGjgjJ@robh.at.kernel.org>
References: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
 <1636441166-8127-1-git-send-email-lh.kuo@sunplus.com>
 <1636441166-8127-3-git-send-email-lh.kuo@sunplus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636441166-8127-3-git-send-email-lh.kuo@sunplus.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 09, 2021 at 02:59:26PM +0800, LH.Kuo wrote:
> Add devicetree bindings I2C Add bindings doc for Sunplus SP7021
> 
> Signed-off-by: LH.Kuo <lh.kuo@sunplus.com>

As with other SunPlus patches, author and S-o-b must match.

> ---
> Changes in v2:
>  - Addressed all comments from Mr. Rob Herring.
>  - Modified the structure and register access method.
>  - Modifiedthe path about MAINTAINERS. ( wrong messages PATH in v1).
>  - Modifiedthe the YAML file.
> 
>  .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 82 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> new file mode 100644
> index 0000000..af860ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) Sunplus Co., Ltd. 2021
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-sunplus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sunplus's I2C controller
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +maintainers:
> +  - lh.kuo <lh.kuo@sunplus.com>

Full name here please.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - sunplus,sp7021-i2cm
> +      - sunplus,q645-i2cm
> +
> +  reg:
> +    items:
> +      - description: Base address and length of the I2C registers
> +      - description: Base address and length of the I2C DMA registers

Drop 'Base address and length of the '.

> +
> +  reg-names:
> +    items:
> +      - const: i2cm
> +      - const: i2cmdma
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    enum: [ 100000, 400000 ]

You can't support other frequencies?

> +
> +  pinctrl-names:
> +    description:
> +      A pinctrl state named "default" must be defined.
> +    const: default
> +
> +  pinctrl-0:
> +    description:
> +      A phandle to the default pinctrl state.

You don't have to define pinctrl properties when there's only 'default'.


> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - resets
> +  - pinctrl-names
> +  - pinctrl-0
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sp-sp7021.h>
> +    #include <dt-bindings/reset/sp-sp7021.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c@9C004600 {
> +        compatible = "sunplus,sp7021-i2cm";
> +        reg = <0x9c004600 0x80>, <0x9c004680 0x80>;
> +        reg-names = "i2cm", "i2cmdma";
> +        interrupt-parent = <&intc>;
> +        interrupts = <174 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clkc I2CM0>;
> +        resets = <&rstc RST_I2CM0>;
> +        clock-frequency = <100000>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&i2cm0_pins>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b7a8a2..575a8e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18193,6 +18193,7 @@ SUNPLUS I2C CONTROLLER INTERFACE DRIVER
>  M:	LH Kuo <lh.kuo@sunplus.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
>  F:	drivers/i2c/busses/i2c-sunplus.c
>  
>  SUPERH
> -- 
> 2.7.4
> 
> 
