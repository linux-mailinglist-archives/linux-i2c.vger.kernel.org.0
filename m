Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6958421A53C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jul 2020 18:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgGIQyM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jul 2020 12:54:12 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:36804 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGIQyL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jul 2020 12:54:11 -0400
Received: by mail-il1-f195.google.com with SMTP id x9so2636624ila.3;
        Thu, 09 Jul 2020 09:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PYLytS/oWWCtfdZl0ukyeN58mBmQoAvrBsrSPk9dsp8=;
        b=cdhNp3tXQ2CnFNBoV5Q6GasmQp+fc332gEoLpnT0hZR0BbcGBUfTgVqwMgVQXhBV/I
         d/CWIQgQrP9PudDLmhLa3z7JUg7uALDfq0QvjF4wLFkHR97Ms/EJTxpRV99AYG+VOy3c
         2xiSIxA1MlJ3we7+u8jlmqGjTZSRMnd0AmSRBz9ST4NcweZWIgFrBoK1cXMl52eqD6N1
         NlYdaLH9n2CNLjOKnqkICwu8A4wWS4WnLBpc1THexclCjQfuH3XVPWI6pqcKMPEvnWGu
         H5s6mSOxrg2cXoF54LyI6QYxeV3VNd1VYSj/zfhDrhOAc2lUZujnsVGYg6luzOz35YOE
         WaDg==
X-Gm-Message-State: AOAM532MRacJailnZ9wyo6hrFroghicNYDEuJ0+fhOsY/YjF0y7ILVCy
        2ilqz/xaiKTY+DQ0h2kclg==
X-Google-Smtp-Source: ABdhPJwZjM5E/jtGqAKcAl99z4cH7aigQ39ILZREy5I4jzUBBpdXXlqfbuVJgqUtLS330n9N8+zsdw==
X-Received: by 2002:a05:6e02:11a6:: with SMTP id 6mr29568985ilj.64.1594313650690;
        Thu, 09 Jul 2020 09:54:10 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id f9sm2080644ilq.9.2020.07.09.09.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 09:54:10 -0700 (PDT)
Received: (nullmailer pid 509410 invoked by uid 1000);
        Thu, 09 Jul 2020 16:54:04 -0000
Date:   Thu, 9 Jul 2020 10:54:04 -0600
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
Subject: Re: [PATCH v3 04/16] dt-bindings: pinctrl: sunxi: make gpio banks
 supplies required
Message-ID: <20200709165404.GB506534@bogus>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-5-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708071942.22595-5-frank@allwinnertech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 08, 2020 at 03:19:30PM +0800, Frank Lee wrote:
> Since we don't really have to care about the existing DT for boards,
> it would be great to make the gpio banks supplies required.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  .../devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index 226aba0..c30a7b7 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -134,6 +134,7 @@ patternProperties:
>  required:
>    - "#gpio-cells"
>    - "#interrupt-cells"
> +  - "^vcc-p[a-hlm]-supply$"

Patterns aren't supported here. It's something the json-schema folks 
are working on. For now, You have to list out the specific properties.

>    - compatible
>    - reg
>    - interrupts
> -- 
> 1.9.1
> 
