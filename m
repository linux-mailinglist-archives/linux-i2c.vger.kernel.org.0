Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18656942FD
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Feb 2023 11:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjBMKgC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Feb 2023 05:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjBMKgB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Feb 2023 05:36:01 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92303EC4F
        for <linux-i2c@vger.kernel.org>; Mon, 13 Feb 2023 02:35:35 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so8630058wms.1
        for <linux-i2c@vger.kernel.org>; Mon, 13 Feb 2023 02:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jh20yxcHSdZBwxQBlSNdL3Noxa3Z+zLPdupxE6lrD6U=;
        b=CUfm3MndktzDwU8/VCdj7qlSPfNHuQ3D7NQypUHhEF7GTYFmvPX0UXUKdknJQKuNdD
         tCNY8pu8EBWtarQqUgfRVw3jIXsbVxlVC8eP1ex4E++WcSH8YlR1PHEOXqY31Xd8T960
         McebotN++hi259Bdaol8/eVWwz4abxWi9vtwQHRtUqvcRbzLs14AC67tqW39Ild2w48g
         hKsg9MnvACL42o73BQnMtB8U0YG3y1R38FUOZZIuWpljf9k+FDY6V99Levx9S3xtIptO
         XEd96vQo4vAb7Ysiox9GTJshPey+/89kuMLCkI8ZjsprvnJRcg+ENsmDj7Y+BUBIwyDn
         /rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh20yxcHSdZBwxQBlSNdL3Noxa3Z+zLPdupxE6lrD6U=;
        b=TUC5Xj7bPlY/y+EiH5Je9+MK0KadiKxMc7giosAW9+zNwFkMlr74uK5E+HqoMehj2R
         oQYA+v5RUqLtkcAkqT+df71dwGeZRkORaQ2AK81zm18Ig0lXhB4y5mX6IWXqOhUF3p6e
         1BpnDzSL4NeH5PlYMjF2PJ0PEiq8j9sM2bwaA/9gGb1FQYaGsWdVnY25Oa342dWHWuGr
         /QQFV8bS8aTz4wLuFgBIzBeTQ7XfsmsJSayERNRwOt2J5rAr4B4b6xpuhoI7VtmRE0/3
         NL/jfLH+EBwIyibyGmHZhPP9Oje1Mbo1IuQwIsenEAoUYwISAz5IJd5TnkYIBfv1ZZ26
         7QtA==
X-Gm-Message-State: AO0yUKVlHbkQuZQTSHOGpepTkrYfT07JTLYUiedgf7zLSgw7tzrnyw4i
        2uEk20IjTm4eQ64voyMH85Aiyg==
X-Google-Smtp-Source: AK7set+T5ukrGnvjSBHhY4SRF72EJKLS6yvjcr+Z4yOI0RZPgIRlt1um996gE0ZyhghzjxXgNfG2Yw==
X-Received: by 2002:a05:600c:1607:b0:3df:f85a:472f with SMTP id m7-20020a05600c160700b003dff85a472fmr21045399wmn.13.1676284532532;
        Mon, 13 Feb 2023 02:35:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003e1df9bc86csm6905640wmz.3.2023.02.13.02.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:35:32 -0800 (PST)
Message-ID: <c5df077e-7ce1-0b59-bff0-847301c96d56@linaro.org>
Date:   Mon, 13 Feb 2023 11:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: i2c: conversion of i2c-st into DT schema
 YAML
Content-Language: en-US
To:     Alain Volmat <avolmat@me.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230210101218.14529-1-avolmat@me.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210101218.14529-1-avolmat@me.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/02/2023 11:12, Alain Volmat wrote:
> File st,i2c.yaml replaces i2c-st.txt for the i2c-st driver.

Subject: dt-bindings: i2c: st,sti-i2c: convert to DT schema
(same reasoning as for SPI patch and maybe others)

> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  .../devicetree/bindings/i2c/i2c-st.txt        | 41 -----------
>  .../devicetree/bindings/i2c/st,sti-i2c.yaml   | 72 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 73 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-st.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-st.txt b/Documentation/devicetree/bindings/i2c/i2c-st.txt
> deleted file mode 100644
> index 4c26fda3844a..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-st.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -ST SSC binding, for I2C mode operation
> -
> -Required properties :
> -- compatible : Must be "st,comms-ssc-i2c" or "st,comms-ssc4-i2c"
> -- reg : Offset and length of the register set for the device
> -- interrupts : the interrupt specifier
> -- clock-names: Must contain "ssc".
> -- clocks: Must contain an entry for each name in clock-names. See the common
> -  clock bindings.
> -- A pinctrl state named "default" must be defined to set pins in mode of
> -  operation for I2C transfer.
> -
> -Optional properties :
> -- clock-frequency : Desired I2C bus clock frequency in Hz. If not specified,
> -  the default 100 kHz frequency will be used. As only Normal and Fast modes
> -  are supported, possible values are 100000 and 400000.
> -- st,i2c-min-scl-pulse-width-us : The minimum valid SCL pulse width that is
> -  allowed through the deglitch circuit. In units of us.
> -- st,i2c-min-sda-pulse-width-us : The minimum valid SDA pulse width that is
> -  allowed through the deglitch circuit. In units of us.
> -- A pinctrl state named "idle" could be defined to set pins in idle state
> -  when I2C instance is not performing a transfer.
> -- A pinctrl state named "sleep" could be defined to set pins in sleep state
> -  when driver enters in suspend.
> -
> -
> -
> -Example :
> -
> -i2c0: i2c@fed40000 {
> -	compatible	= "st,comms-ssc4-i2c";
> -	reg		= <0xfed40000 0x110>;
> -	interrupts	=  <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks		= <&clk_s_a0_ls CLK_ICN_REG>;
> -	clock-names	= "ssc";
> -	clock-frequency = <400000>;
> -	pinctrl-names	= "default";
> -	pinctrl-0	= <&pinctrl_i2c0_default>;
> -	st,i2c-min-scl-pulse-width-us = <0>;
> -	st,i2c-min-sda-pulse-width-us = <5>;
> -};
> diff --git a/Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml
> new file mode 100644
> index 000000000000..dd6ff18b9ed7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/st,sti-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C controller embedded in STMicroelectronics STi platform
> +
> +maintainers:
> +  - Patrice Chotard <patrice.chotard@foss.st.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,comms-ssc-i2c
> +      - st,comms-ssc4-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    enum: [ 100000, 400000 ]

default: 100000

> +
> +  st,i2c-min-scl-pulse-width-us:
> +    description:
> +      The minimum valid SCL pulse width that is allowed through the
> +      deglitch circuit. In units of us.
> +    maxItems: 1

maxItems should not be needed.

> +
> +  st,i2c-min-sda-pulse-width-us:
> +    description:
> +      The minimum valid SDA pulse width that is allowed through the
> +      deglitch circuit. In units of us.
> +    maxItems: 1

Ditto

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stih407-clks.h>
> +    i2c@fed40000 {
> +        compatible	= "st,comms-ssc4-i2c";

Drop unnecessary spaces before =


Best regards,
Krzysztof

