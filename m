Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6C53B01D7
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jun 2021 12:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhFVK4E convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 22 Jun 2021 06:56:04 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42486 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhFVK4A (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Jun 2021 06:56:00 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lve26-0003AI-SA; Tue, 22 Jun 2021 12:53:30 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
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
Subject: Re: [PATCH v5 1/4] dt-bindings: pwm: rockchip: add description for rk3568
Date:   Tue, 22 Jun 2021 12:53:29 +0200
Message-ID: <4912561.MVdQ21Qd56@diego>
In-Reply-To: <20210622020517.13100-2-cl@rock-chips.com>
References: <20210622020517.13100-1-cl@rock-chips.com> <20210622020517.13100-2-cl@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liang,

Am Dienstag, 22. Juni 2021, 04:05:14 CEST schrieb cl@rock-chips.com:
> From: Liang Chen <cl@rock-chips.com>
> 
> add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
> a rk3568 platform to pwm-rockchip.yaml.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>

$ scripts/get_maintainer.pl drivers/pwm

returns

Thierry Reding <thierry.reding@gmail.com> (maintainer:PWM SUBSYSTEM)
"Uwe Kleine-König" <u.kleine-koenig@pengutronix.de> (reviewer:PWM SUBSYSTEM)
Lee Jones <lee.jones@linaro.org> (maintainer:PWM SUBSYSTEM)
linux-pwm@vger.kernel.org (open list:PWM SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)


though I only see Uwe in the lists of recipients. You may want to resend
the binding and maybe pick up the pwm node patch with it to keep them
together.


Heiko

> ---
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> index 5596bee70509..81a54a4e8e3e 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> @@ -29,6 +29,7 @@ properties:
>            - enum:
>                - rockchip,px30-pwm
>                - rockchip,rk3308-pwm
> +              - rockchip,rk3568-pwm
>            - const: rockchip,rk3328-pwm
>  
>    reg:
> 




