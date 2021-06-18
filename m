Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7195D3AC477
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jun 2021 09:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhFRHEe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Jun 2021 03:04:34 -0400
Received: from gloria.sntech.de ([185.11.138.130]:41946 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231826AbhFRHEe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Jun 2021 03:04:34 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lu8Vs-00006s-P5; Fri, 18 Jun 2021 09:02:00 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     cl <cl@rock-chips.com>,
        "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
Cc:     robh+dt <robh+dt@kernel.org>, jagan <jagan@amarulasolutions.com>,
        wens <wens@csie.org>, uwe <uwe@kleine-koenig.org>,
        mail <mail@david-bauer.net>, Johan Jonker <jbx6244@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        jensenhuang <jensenhuang@friendlyarm.com>,
        michael <michael@amarulasolutions.com>,
        cnsztl <cnsztl@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        "ulf. hansson" <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        gregkh <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        =?utf-8?B?5p6X5rabKOW6leWxguW5s+WPsCk=?= <shawn.lin@rock-chips.com>,
        =?utf-8?B?5ZC06L6+6LaF?= <david.wu@rock-chips.com>,
        zhangqing <zhangqing@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>, cl <cl@rock-chips.com>,
        wim <wim@linux-watchdog.org>, linux <linux@roeck-us.net>,
        jamie <jamie@jamieiles.com>,
        linux-watchdog <linux-watchdog@vger.kernel.org>,
        maz <maz@kernel.org>
Subject: Re: [RESEND PATCH v4 06/10] dt-bindings: gpio: change items restriction of clock for rockchip,gpio-bank
Date:   Fri, 18 Jun 2021 09:01:59 +0200
Message-ID: <3493815.vrqWZg68TM@diego>
In-Reply-To: <2021061814414460293612@rock-chips.com>
References: <20210429081151.17558-1-cl@rock-chips.com> <5026524.44csPzL39Z@phil> <2021061814414460293612@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jay,

Am Freitag, 18. Juni 2021, 08:41:45 CEST schrieb jay.xu@rock-chips.com:
> Hi Heiko
> 
> --------------
> jay.xu@rock-chips.com
> >Hi,
> >
> >Am Donnerstag, 13. Mai 2021, 08:46:06 CEST schrieb cl@rock-chips.com:
> >> From: Liang Chen <cl@rock-chips.com>
> >>
> >> The clock property need 2 items on some rockchip chips.
> >>
> >> Signed-off-by: Liang Chen <cl@rock-chips.com>
> >
> >this patch should definitly move over to Jianquns gpio driver series,
> >as it introduces the usage of these new clocks.
> >
> >Also while the single-clock variant definitly doesn't need it,
> >I think we may want clock-names "apb_pclk", "debounce-ref" for the
> >2-clock variants?
> > 
> Okay, I think it's very good idea, 
> but is it possible to post the reg-name patch after these dts serial and gpio serial patches ?

You're already creating a new binding when changing the max-items.
So when we change that again later, in theory you'd need to support both
cases (with and without clock-names)

So I'd really prefer to get the binding right the first time and
identifying multiple clocks by clock-names instead of an implicit ordering
is way better in the long run as well.

Heiko




> 
> >
> >Heiko
> >
> >> ---
> >>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> >> index d993e00..0d62c28 100644
> >> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> >> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> >> @@ -22,7 +22,10 @@ properties:
> >>      maxItems: 1
> >> 
> >>    clocks:
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    items:
> >> +      - description: APB interface clock source
> >> +      - description: GPIO debounce reference clock source
> >> 
> >>    gpio-controller: true
> >> 
> >>
> >
> >
> >
> >
> >
> >
> >
> 




