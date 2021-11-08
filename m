Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C082A449C53
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 20:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237104AbhKHTZy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 14:25:54 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:33566 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236881AbhKHTZy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 14:25:54 -0500
Received: by mail-ot1-f51.google.com with SMTP id h12-20020a056830034c00b0055c8458126fso8252565ote.0;
        Mon, 08 Nov 2021 11:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lKW7MiMs8UBNSc0+Id3Jzt86LaF6KHkklaDg7NR6Atc=;
        b=e4IlxVji7H3yvEQp1fuXFl3BFGgpB5NINVxo+4c2MMdr5uh5uUVttC2n/dHg84Sgxr
         gEXWD60bGYWoPV6/sSOlacCHBRly4RbN/h9nLPcEvREk0ya0z9ZJ0OdvEE8i3OSQ5t5W
         9hoJqiOspHUBBrCEPtC0O2NDiZ/XWsjgrNxQBYe7Hkd29f7VQDgOM46nJFOt+IJ2IF/C
         G+zsQV5wXIN72i65RVXsTs5e5jlWieLmb/DF7jefdpIzt3KxsvAojSs3mwSPMs4YTMtI
         DbKvdX0qgxlpBgtilaMMS9Xvdz7RQCpA3dHEQfdircAdkwPmEt+Yi/F8BJ05K7EDVFrg
         X6cg==
X-Gm-Message-State: AOAM5305QVvQTAz41LrE5c/q11nvLmIzsEKKaYO5Ok8xb/ZcffD1KGOJ
        Du0c6dOE+Iet4iseBq9okA==
X-Google-Smtp-Source: ABdhPJy1eyr8WBBmXN911K1XxYXoMreyckMSEidOkO468v/qY5IWEe+ypOxAdR32K8rTOPN1pyapjw==
X-Received: by 2002:a05:6830:1014:: with SMTP id a20mr1156520otp.63.1636399389311;
        Mon, 08 Nov 2021 11:23:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z7sm2170359oib.0.2021.11.08.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 11:23:08 -0800 (PST)
Received: (nullmailer pid 4061582 invoked by uid 1000);
        Mon, 08 Nov 2021 19:23:07 -0000
Date:   Mon, 8 Nov 2021 13:23:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     "LH.Kuo" <lhjeff911@gmail.com>
Cc:     p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        dvorkin@tibbo.com, qinjian@cqplus1.com, wells.lu@sunplus.com,
        "LH.Kuo" <lh.kuo@sunplus.com>
Subject: Re: [PATCH 2/2] devicetree bindings I2C Add bindings doc for Sunplus
 SP7021
Message-ID: <YYl5GwqE7aMvoXDo@robh.at.kernel.org>
References: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
 <1635496955-13985-3-git-send-email-lh.kuo@sunplus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635496955-13985-3-git-send-email-lh.kuo@sunplus.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 29, 2021 at 04:42:35PM +0800, LH.Kuo wrote:
> Add devicetree bindings I2C Add bindings doc for Sunplus SP7021

Please follow the subject convention used by the subsystem. This will 
be evident running 'git log --oneline'. For this one: 

'dt-bindings: i2c: ...'

> 
> Signed-off-by: LH.Kuo <lh.kuo@sunplus.com>
> ---
>  .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 82 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> new file mode 100644
> index 0000000..7e2f827
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
> +
> +  pinctrl-names:
> +    description:
> +      A pinctrl state named "default" must be defined.
> +    const: default
> +
> +  pinctrl-0:
> +    description:
> +      A phandle to the default pinctrl state.
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
> +additionalProperties: false

This means you can't have any child nodes which I'd assume you want. You 
need 'unevaluatedProperties: false' instead.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sp-sp7021.h>
> +    #include <dt-bindings/reset/sp-sp7021.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2cm0: i2c@9C004600 {

Drop unused labels.

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
> index c89a3b1..7dc9bea 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17951,6 +17951,7 @@ SUNPLUS I2C CONTROLLER INTERFACE DRIVER
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
