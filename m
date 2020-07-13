Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF72421E358
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jul 2020 01:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgGMXBf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 19:01:35 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35525 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgGMXBf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 19:01:35 -0400
Received: by mail-io1-f65.google.com with SMTP id v8so15347354iox.2;
        Mon, 13 Jul 2020 16:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rEM2k8uDu6wNpoJYOHurqvj/7if6gaGt94wx89r0Kh8=;
        b=lAfKnpXEr3WfP+2wUNJVEDLzJub/bHUvv0Je9YsEHrPxwya2zi0IogKtuku1QLKXi1
         ylL7w41LuWc1V8mKPTAF7e3iW1nukwX4mFdoUApyjv8taNbtyi/t1Xsi15F0UCprhfm3
         ZA0D1zrASo8xqL2bbkiHjocb1iuIMOprQammmmaI8PP9YeuhSgWpzYjPSzOovvRCXM63
         RRWfNIVjkBq0cZoH8O4mEwtSSzaNJhKRVVQYowAb1NTJnDiRbh7TSXKqfjOTgo4tgKOC
         otOs93e6w/6rdNrieWCS3gNNjWtpVSy1a2boJ2kl8G0KCjLO89p+npUMiutSj6+Ivkq/
         DF9Q==
X-Gm-Message-State: AOAM5315V8GkLoWxVs1uEX8J0YUvN1ZQI70xaVcntK+pJH0RJliIdp3n
        bpfHnrOzDRHpkDm/Li9/uHiFDDu5Ym1G
X-Google-Smtp-Source: ABdhPJzitorPXcF0bFX7xRNpmgTS4ftYPc0PfK6f0HOeq7fu4Bmtfs4az6Nwch3uwiUL5xTcLGCWcA==
X-Received: by 2002:a05:6602:2fd5:: with SMTP id v21mr2073969iow.41.1594681293949;
        Mon, 13 Jul 2020 16:01:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t1sm8482566iob.16.2020.07.13.16.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 16:01:33 -0700 (PDT)
Received: (nullmailer pid 883186 invoked by uid 1000);
        Mon, 13 Jul 2020 23:01:29 -0000
Date:   Mon, 13 Jul 2020 17:01:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     mripard@kernel.org, wens@csie.org, mturquette@baylibre.com,
        sboyd@kernel.org, gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, megous@megous.com, stefan@olimex.com,
        bage@linutronix.de, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        huangshuosheng@allwinnertech.com, liyong@allwinnertech.com
Subject: Re: [PATCH v3 03/16] dt-bindings: pinctrl: sunxi: Add A100 pinctrl
 bindings
Message-ID: <20200713230129.GA875173@bogus>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-4-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708071942.22595-4-frank@allwinnertech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 08, 2020 at 03:19:29PM +0800, Frank Lee wrote:
> Add device tree binding Documentation details for A100 pinctrl driver,
> whic has an r pin controller and a pin controller with more irq lines.

s/whic/which/

'an r pin controller'?

> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       | 74 +++++++++++++---------
>  1 file changed, 44 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index bfefd09..226aba0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -48,6 +48,8 @@ properties:
>        - allwinner,sun9i-a80-r-pinctrl
>        - allwinner,sun50i-a64-pinctrl
>        - allwinner,sun50i-a64-r-pinctrl
> +      - allwinner,sun50i-a100-pinctrl
> +      - allwinner,sun50i-a100-r-pinctrl
>        - allwinner,sun50i-h5-pinctrl
>        - allwinner,sun50i-h6-pinctrl
>        - allwinner,sun50i-h6-r-pinctrl
> @@ -59,7 +61,7 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 7
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -144,75 +146,87 @@ allOf:
>    # FIXME: We should have the pin bank supplies here, but not a lot of
>    # boards are defining it at the moment so it would generate a lot of
>    # warnings.
> -
>    - if:
>        properties:
>          compatible:
>            enum:
> -            - allwinner,sun9i-a80-pinctrl
> +            - allwinner,sun50i-a100-pinctrl
>  
>      then:
>        properties:
>          interrupts:
> -          minItems: 5
> -          maxItems: 5
> +          minItems: 7
> +          maxItems: 7
>  
>      else:
>        if:

This diff is hard to follow. Rather than a continual nesting of 'else' 
clauses, just make each 'if' a new entry under 'allOf' and get rid of 
the else. Perhaps do that in a separate patch first, then this change 
will be easier to review.

>          properties:
>            compatible:
>              enum:
> -              - allwinner,sun6i-a31-pinctrl
> -              - allwinner,sun6i-a31s-pinctrl
> -              - allwinner,sun50i-h6-pinctrl
> +              - allwinner,sun9i-a80-pinctrl
>  
>        then:
>          properties:
>            interrupts:
> -            minItems: 4
> -            maxItems: 4
> +            minItems: 5
> +            maxItems: 5
>  
>        else:
>          if:
>            properties:
>              compatible:
>                enum:
> -                - allwinner,sun8i-a23-pinctrl
> -                - allwinner,sun8i-a83t-pinctrl
> -                - allwinner,sun50i-a64-pinctrl
> -                - allwinner,sun50i-h5-pinctrl
> -                - allwinner,suniv-f1c100s-pinctrl
> +                - allwinner,sun6i-a31-pinctrl
> +                - allwinner,sun6i-a31s-pinctrl
> +                - allwinner,sun50i-h6-pinctrl
>  
>          then:
>            properties:
>              interrupts:
> -              minItems: 3
> -              maxItems: 3
> +              minItems: 4
> +              maxItems: 4
>  
>          else:
>            if:
>              properties:
>                compatible:
>                  enum:
> -                  - allwinner,sun6i-a31-r-pinctrl
> -                  - allwinner,sun8i-a33-pinctrl
> -                  - allwinner,sun8i-h3-pinctrl
> -                  - allwinner,sun8i-v3-pinctrl
> -                  - allwinner,sun8i-v3s-pinctrl
> -                  - allwinner,sun9i-a80-r-pinctrl
> -                  - allwinner,sun50i-h6-r-pinctrl
> +                  - allwinner,sun8i-a23-pinctrl
> +                  - allwinner,sun8i-a83t-pinctrl
> +                  - allwinner,sun50i-a64-pinctrl
> +                  - allwinner,sun50i-h5-pinctrl
> +                  - allwinner,suniv-f1c100s-pinctrl
>  
>            then:
>              properties:
>                interrupts:
> -                minItems: 2
> -                maxItems: 2
> +                minItems: 3
> +                maxItems: 3
>  
>            else:
> -            properties:
> -              interrupts:
> -                minItems: 1
> -                maxItems: 1
> +            if:
> +              properties:
> +                compatible:
> +                  enum:
> +                    - allwinner,sun6i-a31-r-pinctrl
> +                    - allwinner,sun8i-a33-pinctrl
> +                    - allwinner,sun8i-h3-pinctrl
> +                    - allwinner,sun8i-v3-pinctrl
> +                    - allwinner,sun8i-v3s-pinctrl
> +                    - allwinner,sun9i-a80-r-pinctrl
> +                    - allwinner,sun50i-h6-r-pinctrl
> +
> +            then:
> +              properties:
> +                interrupts:
> +                  minItems: 2
> +                  maxItems: 2
> +
> +            else:
> +              properties:
> +                interrupts:
> +                  minItems: 1
> +                  maxItems: 1
>  
>  additionalProperties: false
>  
> -- 
> 1.9.1
> 
