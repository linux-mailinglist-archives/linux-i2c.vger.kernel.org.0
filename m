Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977013806E0
	for <lists+linux-i2c@lfdr.de>; Fri, 14 May 2021 12:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbhENKI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 May 2021 06:08:29 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42638 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232431AbhENKI3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 May 2021 06:08:29 -0400
Received: from p5b127fa9.dip0.t-ipconnect.de ([91.18.127.169] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lhUia-0001yI-9m; Fri, 14 May 2021 12:06:52 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     cl@rock-chips.com
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
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
        cl@rock-chips.com, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: Re: [RESEND PATCH v4 06/10] dt-bindings: gpio: change items restriction of clock for rockchip,gpio-bank
Date:   Fri, 14 May 2021 12:06:51 +0200
Message-ID: <5026524.44csPzL39Z@phil>
In-Reply-To: <20210513064606.18397-1-cl@rock-chips.com>
References: <20210429081151.17558-1-cl@rock-chips.com> <20210513064606.18397-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Am Donnerstag, 13. Mai 2021, 08:46:06 CEST schrieb cl@rock-chips.com:
> From: Liang Chen <cl@rock-chips.com>
> 
> The clock property need 2 items on some rockchip chips.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>

this patch should definitly move over to Jianquns gpio driver series,
as it introduces the usage of these new clocks.

Also while the single-clock variant definitly doesn't need it,
I think we may want clock-names "apb_pclk", "debounce-ref" for the
2-clock variants?


Heiko

> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index d993e00..0d62c28 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -22,7 +22,10 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: APB interface clock source
> +      - description: GPIO debounce reference clock source
>  
>    gpio-controller: true
>  
> 




