Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215B844ED8C
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 20:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbhKLTyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 14:54:15 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:40593 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhKLTyO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 14:54:14 -0500
Received: by mail-oi1-f173.google.com with SMTP id bk14so19855810oib.7;
        Fri, 12 Nov 2021 11:51:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wnYxAuGAMyIVD/s8arSghnQlkopMtZnXmDifjgRoSDw=;
        b=y3FPABCyA48Zy0Hz2aLfcJIXtFAGTqh+Ugc/wJnqhzwL3uP6qZuphiDndHxW8nDY8o
         i1Ldompo1m8xCPO2E4uY5alB4uKLuuyRGW3l7prcC+u/OMpYYqm9ELpMMuUPa+venw+p
         aBbklez6WYXnrCu1IOad/+UZkihm1NMFLSgXsJ7Wwh0oGRhy9BThiK0xjlScA4QGAkqq
         vtiWDMk3MVA8fG1EYYLj3fgN2vEAA3UEhANccc8ucsGbDmAeGu3isqMY1VjEJ5Mdv9Ib
         YDlHitNf5Ok9Okn4DurGSBPls/h6aP6/WxnJVSUJ/JuCvgkglqOW5/eIcz26lzHhozmP
         0rsw==
X-Gm-Message-State: AOAM532vpyzQt7lQnnrw85zewv9J5a9p91p8LwgZHz3u+c1QvDxhUxq1
        RjdGzti35JAxj/O3Lb9FPzGibJ8hfg==
X-Google-Smtp-Source: ABdhPJziN3WHLy8iLfxC+mSQM4EDSEx6IrWAnqNiTbvF8ew+XPeJLaXQ4OwMmHynX10XvHhFjErqLA==
X-Received: by 2002:a05:6808:3097:: with SMTP id bl23mr15403219oib.0.1636746683394;
        Fri, 12 Nov 2021 11:51:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bf17sm1812139oib.27.2021.11.12.11.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:51:22 -0800 (PST)
Received: (nullmailer pid 3258902 invoked by uid 1000);
        Fri, 12 Nov 2021 19:51:21 -0000
Date:   Fri, 12 Nov 2021 13:51:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c-mux: Add property for settle time
Message-ID: <YY7FuUKIyZn5892i@robh.at.kernel.org>
References: <20211103091839.1665672-1-horatiu.vultur@microchip.com>
 <20211103091839.1665672-2-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103091839.1665672-2-horatiu.vultur@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 03, 2021 at 10:18:38AM +0100, Horatiu Vultur wrote:
> Some HW requires some time for the signals to settle after the muxing is
> changed. Allow this time to be specified in device tree.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> index 24cac36037f5..4c81e56d02f7 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> @@ -19,6 +19,11 @@ description: |+
>    populating the i2c child busses.  If an 'i2c-mux' subnode is present, only
>    subnodes of this will be considered as i2c child busses.
>  
> +  Optional properties may not be supported by all drivers. However, if a driver
> +  wants to support one of the below features, it should adopt these bindings.

What drivers? Bindings are independent. I don't think you need the 
comment, but this should be a separate change with an explanation along 
the lines of what we discussed.

> +
> +select: false
> +
>  properties:
>    $nodename:
>      pattern: '^(i2c-?)?mux'
> @@ -29,6 +34,11 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  settle-time-us:
> +    default: 0
> +    description:
> +      The time required for the signals to settle.
> +
>  patternProperties:
>    '^i2c@[0-9a-f]+$':
>      $ref: /schemas/i2c/i2c-controller.yaml
> @@ -41,6 +51,10 @@ patternProperties:
>  
>  additionalProperties: true
>  
> +required:
> +  - '#address-cells'
> +  - '#size-cells'
> +

This too is a separate change.

>  examples:
>    - |
>      /*
> -- 
> 2.33.0
> 
> 
