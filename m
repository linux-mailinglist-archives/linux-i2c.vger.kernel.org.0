Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910AE30CD92
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 22:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbhBBVET (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 16:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbhBBVEP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Feb 2021 16:04:15 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED71EC061573;
        Tue,  2 Feb 2021 13:03:34 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id t25so11157446otc.5;
        Tue, 02 Feb 2021 13:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dh+UCeMx3bCw8J1Ju7frN8CdYa7M22g16iTHqWnacQM=;
        b=K6cAEqmsQxgFheE/2hF3io8g2b7S1wFmAuzG8H5yG7uaJ4lEMlzH6fh2kjOyWbTV00
         WgNA9cpnkefkittEGWm7E86AcWkWBJ6XdqoGvXqDaJJG2crmJl8RmhgY99j9tnqa+jgy
         kAPij3/YsGoWvHzgEaQy8LqI34pI4Qn8e/Iz4n6twCL7znOiWVZAW59MutD2iyJqzpLT
         z1RuyImvvRB++Ns7ksy4Bc4DURb2oETUqY4+fhokQLTL1OifBwc90ZAMhQ5NN1MKOhor
         njnG2wUdRLUeGzjzAFKgvVsMgP+NcaICfQfEu1+sjFCM6jabLI+WGKiOM/rPTmNxn78F
         O6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Dh+UCeMx3bCw8J1Ju7frN8CdYa7M22g16iTHqWnacQM=;
        b=E7QloQXPVC3l1MB7Kacnf80y7ED8/O5rvndaw1oBAWaKfLeNU/e4TgkZS/o5m5zpKM
         74U2Skuwb0IWTuYlEAGZ5WAmaEoEpHuQgs44nrm6one2u3hzaCwJuWQnqEQMBC1ZIUpo
         UyxIBqMep0zwxNPl5vfnS/YIYUyw0s2hKj+8aZOaqbW8YAc8HlpG5PbNvI7GNa+kG8WR
         xYaT3iwjOR74IG9noqEqeJNtnMMubONng459Dhmd7CI6q9z3BocECohkEAQOhchFyTZ0
         Ss3uCGGd78RsicXkbH9VQR16pXYjwPhPY+hegfnPgLozRbPJ6lq4KES4WlGDSjw0LfM/
         Jpgg==
X-Gm-Message-State: AOAM530jbIwhniJO538iksnSfpOFialwTcn3wHdQhgo4KZwmwK58WntT
        g7bq0bxnOxE6D+frQj7l1p6ojHVtTLw=
X-Google-Smtp-Source: ABdhPJwOUk0iE2KLqrIog8fkXS2qveVg/NNaXF8ksPIB/DmjNtB6WY0l3vSJDSjLUOze2gmC0gEI8Q==
X-Received: by 2002:a05:6830:154d:: with SMTP id l13mr16847363otp.72.1612299811115;
        Tue, 02 Feb 2021 13:03:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g14sm5115898oon.23.2021.02.02.13.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 13:03:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in
 examples
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-watchdog@vger.kernel.org
References: <20210202205544.24812-1-robh@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e002a691-2b79-47d1-8602-a40a8e9dfcb6@roeck-us.net>
Date:   Tue, 2 Feb 2021 13:03:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/2/21 12:55 PM, Rob Herring wrote:
> Running 'dt-validate -m' will flag any compatible strings missing a schema.
> Fix all the errors found in DT binding examples. Most of these are just
> typos.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Daniel Palmer <daniel@thingy.jp>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Vincent Cheng <vincent.cheng.xh@renesas.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-watchdog@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml        | 2 +-
>  Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml  | 4 ++--
>  Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml        | 2 +-
>  Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml | 2 +-
>  .../devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml          | 2 +-
>  .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml         | 2 +-
>  .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   | 2 +-
>  .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   | 2 +-
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   | 2 +-
>  Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml          | 4 +---
>  Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml    | 4 ++--
>  11 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
> index fa0ee03a527f..53cc6df0df96 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
> @@ -18,7 +18,7 @@ properties:
>      const: 1
>  
>    compatible:
> -    const: allwinner,sun9i-a80-usb-clocks
> +    const: allwinner,sun9i-a80-usb-clks
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> index eb241587efd1..118c5543e037 100644
> --- a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> +++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> @@ -66,8 +66,8 @@ properties:
>        - arm,syscon-icst525-integratorcp-cm-mem
>        - arm,integrator-cm-auxosc
>        - arm,versatile-cm-auxosc
> -      - arm,impd-vco1
> -      - arm,impd-vco2
> +      - arm,impd1-vco1
> +      - arm,impd1-vco2
>  
>    clocks:
>      description: Parent clock for the ICST VCO
> diff --git a/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml b/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
> index 1465c9ebaf93..1d48ac712b23 100644
> --- a/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
> +++ b/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml
> @@ -66,7 +66,7 @@ examples:
>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>  
>      main_crypto: crypto@4e00000 {
> -        compatible = "ti,j721-sa2ul";
> +        compatible = "ti,j721e-sa2ul";
>          reg = <0x4e00000 0x1200>;
>          power-domains = <&k3_pds 264 TI_SCI_PD_EXCLUSIVE>;
>          dmas = <&main_udmap 0xc000>, <&main_udmap 0x4000>,
> diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> index 1f2ef408bb43..fe1e1c63ffe3 100644
> --- a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> @@ -46,7 +46,7 @@ examples:
>      #include <dt-bindings/gpio/msc313-gpio.h>
>  
>      gpio: gpio@207800 {
> -      compatible = "mstar,msc313e-gpio";
> +      compatible = "mstar,msc313-gpio";
>        #gpio-cells = <2>;
>        reg = <0x207800 0x200>;
>        gpio-controller;
> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> index e3ef2d36f372..128444942aec 100644
> --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> @@ -17,7 +17,7 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: nuvoton,npcm7xx-i2c
> +    const: nuvoton,npcm750-i2c
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> index cde1afa8dfd6..349633108bbd 100644
> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -93,7 +93,7 @@ examples:
>      #include <dt-bindings/power/r8a7791-sysc.h>
>  
>      ipmmu_mx: iommu@fe951000 {
> -        compatible = "renasas,ipmmu-r8a7791", "renasas,ipmmu-vmsa";
> +        compatible = "renesas,ipmmu-r8a7791", "renesas,ipmmu-vmsa";
>          reg = <0xfe951000 0x1000>;
>          interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> index 54631dc1adb0..5dbb84049ff6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> @@ -63,7 +63,7 @@ examples:
>          reg = <0x1e6e2000 0x1a8>;
>  
>          pinctrl: pinctrl {
> -            compatible = "aspeed,g4-pinctrl";
> +            compatible = "aspeed,ast2400-pinctrl";
>  
>              pinctrl_i2c3_default: i2c3_default {
>                  function = "I2C3";
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> index a90c0fe0495f..ad1c33364b38 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> @@ -81,7 +81,7 @@ examples:
>              reg = <0x1e6e2000 0x1a8>;
>  
>              pinctrl: pinctrl {
> -                compatible = "aspeed,g5-pinctrl";
> +                compatible = "aspeed,ast2500-pinctrl";
>                  aspeed,external-nodes = <&gfx>, <&lhc>;
>  
>                  pinctrl_i2c3_default: i2c3_default {
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> index c78ab7e2eee7..ad91c0bc54da 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> @@ -95,7 +95,7 @@ examples:
>          reg = <0x1e6e2000 0xf6c>;
>  
>          pinctrl: pinctrl {
> -            compatible = "aspeed,g6-pinctrl";
> +            compatible = "aspeed,ast2600-pinctrl";
>  
>              pinctrl_pwm10g1_default: pwm10g1_default {
>                  function = "PWM10";
> diff --git a/Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml b/Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml
> index 239b49fad805..658cec67743e 100644
> --- a/Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml
> +++ b/Documentation/devicetree/bindings/ptp/ptp-idtcm.yaml
> @@ -59,9 +59,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    i2c@1 {
> -        compatible = "abc,acme-1234";
> -        reg = <0x01 0x400>;
> +    i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
>          phc@5b {
> diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> index c1348db59374..054584d7543a 100644
> --- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> @@ -57,8 +57,8 @@ examples:
>       */
>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>  
> -    watchdog0: rti@2200000 {
> -        compatible = "ti,rti-wdt";
> +    watchdog@2200000 {
> +        compatible = "ti,j7-rti-wdt";
>          reg = <0x2200000 0x100>;
>          clocks = <&k3_clks 252 1>;
>          power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
> 

