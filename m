Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCB048A2A0
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 23:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345351AbiAJWUU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 17:20:20 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:43555 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbiAJWUT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jan 2022 17:20:19 -0500
Received: by mail-ot1-f48.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so16606247otu.10;
        Mon, 10 Jan 2022 14:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PeSN20pAqVXP4xYBzjiPUsBcbTUXz/dWQ6gyplMQuyE=;
        b=qVIzmEijOh6M6H3OkSVR938px4TS7hXJBx1gAiPCZe8YGB8kZxhmnbTPcBGU9JIgqB
         EcZ83xwIwiZcwcaZ9FTj1UcJtP7dTb5cB669QeKH8WFLnUmUOWTd9I3oFBesQQIpdklt
         CiDFpEKY6QQJ0NPi4ttrQicGKlTodgbXIfos4kM0i1xT9BNbrng1J0gCsdexzypGqcNu
         gVMJC0UmNA1RNWyYhFGgX6Ic+VdBOGqyHx1yvdFJUTtDJF1yLi81PhSwubHoa+dWa6DP
         j7J9FDv7+QsFmGxKwfodPy5gSigxmXRkMTe77uDRjz+9V/wnEGD2AZfM42k3pXGowOVp
         rm5w==
X-Gm-Message-State: AOAM530/JyYvHVVSCunmG/3D986YiAOzTRYs9DIdQpAcLHcNj03JP+G9
        yD0qF4V+4xXggviLg3X11w==
X-Google-Smtp-Source: ABdhPJyN+jKWQcdvqhkAoi1UU6Ivt0enW/bd/9izyjbJ5wbc6a1QZbOfV7irZty6bawKnVKgiHiiww==
X-Received: by 2002:a05:6830:4488:: with SMTP id r8mr1486978otv.120.1641853218616;
        Mon, 10 Jan 2022 14:20:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f7sm1713213oti.35.2022.01.10.14.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 14:20:17 -0800 (PST)
Received: (nullmailer pid 1627949 invoked by uid 1000);
        Mon, 10 Jan 2022 22:20:17 -0000
Date:   Mon, 10 Jan 2022 16:20:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Li-hao Kuo <lhjeff911@gmail.com>
Cc:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, lh.kuo@sunplus.com,
        wells.lu@sunplus.com
Subject: Re: [PATCH v3 2/2] devicetree bindings I2C Add bindings doc for
 Sunplus SP7021
Message-ID: <YdyxIecMBQAf9Kyc@robh.at.kernel.org>
References: <cover.1641188699.git.lhjeff911@gmail.com>
 <9831c3acbbd34ad0d82eec67916f51bff68ae7fe.1641188699.git.lhjeff911@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9831c3acbbd34ad0d82eec67916f51bff68ae7fe.1641188699.git.lhjeff911@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 03, 2022 at 01:49:23PM +0800, Li-hao Kuo wrote:
> Add devicetree bindings I2C Add bindings doc for Sunplus SP7021

Please follow the subject format used by other files in the 
subsystem/directory. This should be clear with 'git log --oneline'.
'dt-bindings: i2c: ...' in this case.

> 
> Signed-off-by: Li-hao Kuo <lhjeff911@gmail.com>
> ---
> Changes in v3:
>  - Addressed all comments from Mr. Rob Herring.
>  - Modified the structure and register access method.
>  - Modifiedthe the YAML file.
> 
>  .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 72 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> new file mode 100644
> index 0000000..ac03041
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) Sunplus Co., Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-sunplus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sunplus I2C controller
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +maintainers:
> +  - Li-hao Kuo <lhjeff911@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sunplus,sp7021-i2cm
> +      - sunplus,q645-i2cm
> +
> +  reg:
> +    items:
> +      - description: I2C registers
> +      - description: I2C DMA registers
> +      - description: I2C DMA power registers
> +
> +  reg-names:
> +    items:
> +      - const: i2cm
> +      - const: i2cmdma
> +      - const: i2cdmapower
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
> +			reg = <0x9c004600 0x80>, <0x9c004680 0x80>, <0x9c000000 0x80>;
> +			reg-names = "i2cm", "i2cmdma", "i2cdmapower";
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
> index a06993b..2b8fa55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18246,6 +18246,7 @@ SUNPLUS I2C CONTROLLER INTERFACE DRIVER
>  M:	Li-hao Kuo <lhjeff911@gmail.com>
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
