Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E793702C0
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 23:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhD3VOf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Apr 2021 17:14:35 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:42628 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhD3VOf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Apr 2021 17:14:35 -0400
Received: by mail-oi1-f172.google.com with SMTP id v24so3675736oiv.9;
        Fri, 30 Apr 2021 14:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZoGE/qRaxEZUIqyf3vqexb9wxuutBvRZWgAehutLKvg=;
        b=DYWYXkqOkIm6qBnXCZL93LothFwVAa4/QCRQxJCgHTE+mfgTZWKGBkhW1X4uG74VIj
         I+KAXYnZlGVfsLLOdw4f3TcK7n0AVFQ7y4K6duPzvGcOY8AcDMjnLvRVtVAPSLen7c5K
         pxCaGEU946ogIHbH+y94VXXTD6VH4E+PdHQu+lDzM4Zdx9YzmXkF2zZlRTohDI4PejHh
         IUrFMX0tsDRewCbVU1gTAl4Drvv/av3e/cC9n2l3MuKGM+3h0/rhAlXlApQdRTEemetS
         i2A5Un9Sx1B5LDSU9OSXo3fqQg5s4QLxM8x7Y+EUeAWHjJU09JfSz0ELHKw78/l30NbF
         hU3A==
X-Gm-Message-State: AOAM531cZ8dc7Fo2o7iiRIow7iOgRKMhneJbzRh0A1hm4xf7y6H/7DAB
        k01fOZ3a0qpx/5GG4Zw6wQ==
X-Google-Smtp-Source: ABdhPJxtf62483mldzmwxA9gvaVuMLo07/iGg2YzmtUAgcS5EYE0LWsNzf9lqQcShVCwo6Vx9MPrHA==
X-Received: by 2002:a54:419a:: with SMTP id 26mr5563131oiy.157.1619817225858;
        Fri, 30 Apr 2021 14:13:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 21sm1008680otg.4.2021.04.30.14.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:13:45 -0700 (PDT)
Received: (nullmailer pid 3904574 invoked by uid 1000);
        Fri, 30 Apr 2021 21:13:43 -0000
Date:   Fri, 30 Apr 2021 16:13:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     heiko@sntech.de, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH v4 03/10] dt-bindings: mmc: rockchip-dw-mshc: add
 description for rk3568
Message-ID: <20210430211343.GA3900779@robh.at.kernel.org>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081151.17558-4-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429081151.17558-4-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 29, 2021 at 04:11:44PM +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> add "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc" for mmc nodes on
> a rk3568 platform to rockchip-dw-mshc.yaml.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/mmc/rockchip-dw-mshc.yaml        | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index 3762f1c8de96..eaa3b0ef24f6 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -29,21 +29,14 @@ properties:
>        - const: rockchip,rk3288-dw-mshc
>        - items:
>            - enum:
> -            # for Rockchip PX30
>                - rockchip,px30-dw-mshc
> -            # for Rockchip RK3036
>                - rockchip,rk3036-dw-mshc
> -            # for Rockchip RK322x
>                - rockchip,rk3228-dw-mshc
> -            # for Rockchip RK3308
>                - rockchip,rk3308-dw-mshc
> -            # for Rockchip RK3328
>                - rockchip,rk3328-dw-mshc
> -            # for Rockchip RK3368
>                - rockchip,rk3368-dw-mshc
> -            # for Rockchip RK3399
>                - rockchip,rk3399-dw-mshc
> -            # for Rockchip RV1108

I find these comments redundant, so I'm fine with the change. But please 
state why you are removing them in the commit msg.

Acked-by: Rob Herring <robh@kernel.org>

> +              - rockchip,rk3568-dw-mshc
>                - rockchip,rv1108-dw-mshc
>            - const: rockchip,rk3288-dw-mshc
>  
> -- 
> 2.17.1
> 
> 
> 
