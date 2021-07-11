Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939073C3E7C
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jul 2021 19:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhGKRra convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Sun, 11 Jul 2021 13:47:30 -0400
Received: from gloria.sntech.de ([185.11.138.130]:53612 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230353AbhGKRra (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 11 Jul 2021 13:47:30 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m2dV2-0008H7-WF; Sun, 11 Jul 2021 19:44:17 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Lee Jones <lee.jones@linaro.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     cl@rock-chips.com, thierry.reding@gmail.com, robh+dt@kernel.org,
        jagan@amarulasolutions.com, wens@csie.org, uwe@kleine-koenig.org,
        mail@david-bauer.net, jbx6244@gmail.com,
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
        linux-watchdog@vger.kernel.org, maz@kernel.org,
        linux-pwm@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/4] dt-bindings: pwm: rockchip: add description for rk3568
Date:   Sun, 11 Jul 2021 19:44:12 +0200
Message-ID: <5069193.2yuIWEeYC1@diego>
In-Reply-To: <20210705074405.uj62h4evd6htftf3@pengutronix.de>
References: <20210622020517.13100-1-cl@rock-chips.com> <YOK1+pMy+N64eR75@dell> <20210705074405.uj62h4evd6htftf3@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Montag, 5. Juli 2021, 09:44:05 CEST schrieb Uwe Kleine-König:
> Hello Lee,
> 
> On Mon, Jul 05, 2021 at 08:34:18AM +0100, Lee Jones wrote:
> > On Mon, 05 Jul 2021, Uwe Kleine-König wrote:
> > > On Wed, Jun 23, 2021 at 10:13:03AM +0800, cl@rock-chips.com wrote:
> > > > From: Liang Chen <cl@rock-chips.com>
> > > > 
> > > > add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
> > > > a rk3568 platform to pwm-rockchip.yaml.
> > > 
> > > [...]
> > > 
> > > Who is supposed to apply this patch? Does this need blessing by Rob?
> > 
> > There is no standard. [...]
> 
> I'm aware of that. That's why I asked to prevent that everybody thinks
> some other maintainer will care for it.

I suppose Thierry would be the one responsible?

I.e. bindings normally go through the subsystem tree and
	$ scripts/get_maintainer.pl drivers/pwm
returns:

Thierry Reding <thierry.reding@gmail.com> (maintainer:PWM SUBSYSTEM)
"Uwe Kleine-König" <u.kleine-koenig@pengutronix.de> (reviewer:PWM SUBSYSTEM)
Lee Jones <lee.jones@linaro.org> (maintainer:PWM SUBSYSTEM)
linux-pwm@vger.kernel.org (open list:PWM SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)


See my reply to the original pwm binding patch from 2021-06-21.

Heiko


