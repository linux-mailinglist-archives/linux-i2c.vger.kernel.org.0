Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89213702D4
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 23:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236031AbhD3VQH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Apr 2021 17:16:07 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:34331 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbhD3VQH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Apr 2021 17:16:07 -0400
Received: by mail-ot1-f50.google.com with SMTP id x54-20020a05683040b6b02902a527443e2fso14548307ott.1;
        Fri, 30 Apr 2021 14:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VxUW5OdCWJGNzSLfVlPjiWNNaJCqr+3fTpTcrVSH4ZY=;
        b=PZZB09/iegdW85PRkrkiqjtGX4AXDr1XX1zxIxa6thIjfelTqKu0M8cY9nKtS2s3Za
         lqG14U0YXLU9yVIzXoCxFKtQA+szX4+EJSMhg7309YQXazVLfmjO3SXPU2YS2UNPJD8y
         yaFxbkUn0rKk1VNIOCLRhQTBIhTBKrBB521n6poDpcK08G/JbOKKO8we99EWAaVuS0TA
         v3ampVwcxGwmH3YTLeFH4nDibqRgpaylALNTILt9DpidEs3DgOqPTyg5sUoNQMZx4UFL
         QDLVHBWwUCqTzHGXoRUP5TSMtQ2Yv1C7bdXgVFOg1S6djNCdsvUMp6LRkV+5X5jIx9MP
         wDGA==
X-Gm-Message-State: AOAM531SERGEv8iIEZCEgaucm1vR304QJoXq2OUpEDFPaZSyi3Lj3MOW
        iXMW1rE4vCW+5FzfrMNyow==
X-Google-Smtp-Source: ABdhPJw7SRe7qPCQI/wcVuiwivDcq25XvfKU7E097UGMjVGG4wUzYEUfjYOOtZwSlRM3zkSLsuyZFQ==
X-Received: by 2002:a9d:630e:: with SMTP id q14mr5179477otk.69.1619817317126;
        Fri, 30 Apr 2021 14:15:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w140sm1098248oif.42.2021.04.30.14.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:15:16 -0700 (PDT)
Received: (nullmailer pid 3907199 invoked by uid 1000);
        Fri, 30 Apr 2021 21:15:14 -0000
Date:   Fri, 30 Apr 2021 16:15:14 -0500
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
Subject: Re: [PATCH v4 06/10] dt-bindings: gpio: change items restriction of
 clock for rockchip,gpio-bank
Message-ID: <20210430211514.GA3905898@robh.at.kernel.org>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081306.17784-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429081306.17784-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 29, 2021 at 04:13:06PM +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> The clock property need 2 items on some rockchip chips.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index d993e002cebe..7b3fd2975c74 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -22,7 +22,8 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

Need to define what they are:

minItems: 1
items:
  - description: ...
  - description: ...

>  
>    gpio-controller: true
>  
> -- 
> 2.17.1
> 
> 
> 
