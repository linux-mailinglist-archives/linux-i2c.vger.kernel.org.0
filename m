Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7577F4A7A2B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 22:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347468AbiBBVVz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 16:21:55 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:42181 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbiBBVVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 16:21:54 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M1ZQT-1nCuEd2ox9-0034cF; Wed, 02 Feb 2022 22:21:52 +0100
Received: by mail-wr1-f48.google.com with SMTP id u15so998745wrt.3;
        Wed, 02 Feb 2022 13:21:52 -0800 (PST)
X-Gm-Message-State: AOAM532zB+zo8o95mEGw6P6yZjVHzs9iSsI52nX2RELW2SSAOILCjY3M
        EtbBsSxZIdSg+Ty40Jn6TpilUzZ1IafL27FlLZQ=
X-Google-Smtp-Source: ABdhPJyS0pXYjoI1KSj8v4HS5DRpiR5z8Z+MmivHV59Rfz0qHTXBAOHLhOORnhnqrVG7qMP59ls3cQTx3h8P+oStNX4=
X-Received: by 2002:a05:6000:3c6:: with SMTP id b6mr26662700wrg.12.1643836901999;
 Wed, 02 Feb 2022 13:21:41 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com> <20220202165315.18282-1-nick.hawkins@hpe.com>
 <20220202175635.GC2091156@minyard.net> <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
In-Reply-To: <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 2 Feb 2022 22:21:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3itj=nshdRCoFQQh5fg-RsEaqj1PdBxfeN2-TzqmoPpQ@mail.gmail.com>
Message-ID: <CAK8P3a3itj=nshdRCoFQQh5fg-RsEaqj1PdBxfeN2-TzqmoPpQ@mail.gmail.com>
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
To:     "Verdun, Jean-Marie" <verdun@hpe.com>
Cc:     "minyard@acm.org" <minyard@acm.org>,
        "Hawkins, Nick" <nick.hawkins@hpe.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        "soc@kernel.org" <soc@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hao Fang <fanghao11@huawei.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Wang Kefeng <wangkefeng.wang@huawei.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gK4kJGmaPJTnzdv7k98A4OSN3fUDOxO3RtoLu0egpenNGWFv/C5
 V995DjVYdC6dKk0g74OfUo06jH23jyDlPUHQwd1hB6grkGGwfA+TdnQgozHnYQJxZIZ49Cp
 4BHlThzvFN+VxmaurNMi6sCyiT1Zc0DukvJigPRvkYJnXB3/sm2Nm7/rcUygxIVbJqzS/jf
 4LHn5gZ5ZR9r/EKAlhlSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G76G9KO31wA=:3jOs4uOW8/8/lGzgYu1VlV
 MvHbzXiCqDYFYFWUuClTtKR83dVV9tzv7aRPgtsKrnkaKLm+jZBQpA92zbUzZ0uxEFlWbOq9U
 aaLzsEly+PtX+hWhP3dgBTVYdx06yPIQJu8u5UaMUwow+2SCH1MYFXTHkr42D/bifcHeCqq29
 hBbtAOqPW0yf4CfRBCO2wSrf47/62FHZsrujj68pyfs+0kBdHwkSVYAx/xw+5oRSeKgDDApZG
 95yoUw4xwVitmpEqID8DpkaXCQfIE+C5lAAYBbG2Oa+gCQT9jCS548JhtPe97hx5lP7vvXgTS
 MqW1mteqd8CRpPE3MJHXFITCYmHFsfGA6HVQsmsges4dDp+AFs/1buiWsBR9XQk/dpT+7t6he
 rt8FH7lLgmbpy3cmcX2+wUnZ++i7KIFYavZnwvGw1e+YRaHQpbqPaNWYLImQ4mPuTXn4KkMKa
 akg0ZZVEPHkrf7mQFQWBl7TMf1LFz+nqSiYLyX1jLxQf/pAX+RC7lTZSIpynIFLhvvkjrhW0L
 VyjxlFXgtPVyNJ1bUwRqUk/7o8XXj6lQ7XZVykhBO6u7Pjf6EZUwCdlJvikrZpXcvz+k1jMse
 wk9GTD4hGm1rfH+x84az5y+AHxM7nE8BBT9VuCZT5TK4tGB1HheFxLUfM0RqsGJOwWrhRIrJT
 Zo314l1vu9NPjZlvfYBjWxrFbMUN9JKgJPRI7FlwVDPd7/XetTBd8bQ1abkJckEwNdsBxySNr
 I87B9MMCKCcjY0R5YOA8Y2cnpEtVlDYfXQKN8tvAm3KH936xUfbFIM/ZEgPaSdUhmrltswLX7
 /EH16jCUq4vWAmmctq/C1ENYgbIcBBLR1WlSr4MQ/yGH2Z4ObI=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 2, 2022 at 7:14 PM Verdun, Jean-Marie <verdun@hpe.com> wrote:
>
> > This is far too big for a single patch.  It needs to be broken into
> > functional chunks that can be reviewed individually.  Each driver and
> > each device tree change along with it's accompanying code need to be
> > done in individual patches.  The way it is it can't be reviewed in any
> > sane manner.
>
> > -corey
>
> Thanks for your feedback. We are getting a little bit lost here, as our plan was to submit initial
>
> - bindings
> - dts for SoC and 1 board
> - initial platform init code
>
> Then drivers code avoiding to send many dts updates which might complexify the
> review. We wanted to send all drivers code to relevant reviewers by tomorrow.
>
> So, what you are asking ( do not worry I am not trying to negotiate, I just want
> to avoid English misunderstandings as I am French) is to send per driver
>
> - binding
> - dts update
> - driver code
>
> For each driver through different submission (with each of them containing the
> 3 associated parts) ?
>
> What shall be the initial one in our case as we are introducing a platform ?
> An empty dts infrastructure and then we make it grow one step at a time ?

Ideally, what I prefer to see is a series of patches for all "essential" drivers
and the platform code that includes:

- one patch for each new binding
- one patch for each new driver
- one patch that hooks up arch/arm/mach-hpe/, MAINTAINERS
  and any other changes to arch/arm/ other than dts
- one patch that adds the initial .dts and .dtsi files, with all the
  devices added that have a valid binding, no need to split this
  up any further

This should include everything you need to boot into an initramfs
shell, typically cpu, serial, timer, clk, pinctrl,  gpio, irqchip. We will
merge these as a git branch in the soc tree.

In parallel, you can work with subsystem maintainers for the
"non-essential" drivers to review any other driver and binding,
e.g. drm/kms, network, i2c, pci, usb, etc. The patches for
the corresponding .dts additions also go through the soc tree,
but to make things simpler, you can send those in for a later
release.

          Arnd
