Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA8A3A042
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 16:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbfFHOWP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 10:22:15 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37815 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfFHOWN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jun 2019 10:22:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id m15so3685105lfh.4
        for <linux-i2c@vger.kernel.org>; Sat, 08 Jun 2019 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aIUAKPG6L/Uk7RNnahoThkSWUC4nrgmZui5o+1IQtNk=;
        b=a8zCjMPgP8flEe8AX4DYltakrbTeXlf4HJdUBQFer/b0IPJPCfVav33LROaOIvkRBh
         d/ezKZe+qMrAcg+2zaULmB+dIX8setyM8Dw/amQKtBtuGvpqfUZdtCABo4QaT5ZFUGGd
         fksqElAG9w2gwbE6Q6S46627rrHHqLiRDCA8eScKkVkurpN9O6Dge+avOCJxW9CwIBjE
         vWmpOGwdimteMBWpy3R6+1wtE1HyS9jIIsl6y+9pjv6itruHNG55mTSg6Qzlisw2u1sl
         d/rKG06wFYR5828vG892iuyGTPq8CV75uQK3Cx8ndRZlvQhTZTCv/wvDzZyIGlw+oOwZ
         bmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aIUAKPG6L/Uk7RNnahoThkSWUC4nrgmZui5o+1IQtNk=;
        b=pVfgkb2dZjwfEp0+lVOusG/MTNOuTn535ImfJ8l9ueIhrBQtnffgRzWHjZttJkP2YZ
         AF3rEBqrtIMxWXSdaYzWjJhJT0vVYFnBpUpVr+qOytCFNswDXx9yE5Itnh65sZ54Ytmw
         mv9VnP9ckSVLH3QxMVuOXjVsLUPkrcHlw14zvWHzX1RsCYLAh8kTkGM1WZI2YBHUd0s2
         La9xhp6aY+NPkToLpi9ktr7G1tXRpMBE9CqGEB0P4RgsFuTNnNxrFqtlWTikQ4vU38uM
         BSKtOFXIuGKJTjxYZGP5aHuKNJHiSQ/U3gcdg4+gTffFcY/ZN3b5nqix1OjejX+t1WRk
         60yA==
X-Gm-Message-State: APjAAAWpzkFu9kIkInCqESKUlgpyr1/zec2z+d/LbHvvXqNio5wN6lx8
        8K6ZdNDhTtemRUFhGC74TPqhCyEWBJbjNepFLmq1Dg==
X-Google-Smtp-Source: APXvYqx2MoGtkoQjUm5Wa5IOCM/k/orM6EKwAwZG7AXIo8rcqREn8WTPkR2Fc2Pbt++tRSEdz7xZS6GOynFOOaZSLRQ=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr28511822lfn.165.1560003730786;
 Sat, 08 Jun 2019 07:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190607082901.6491-1-lee.jones@linaro.org> <20190607082901.6491-3-lee.jones@linaro.org>
 <CAKv+Gu-1QhX-9aNhFJauc9NVe6ceQQueE8Kd14031XJ-2yaupA@mail.gmail.com>
In-Reply-To: <CAKv+Gu-1QhX-9aNhFJauc9NVe6ceQQueE8Kd14031XJ-2yaupA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 16:22:03 +0200
Message-ID: <CACRpkdZmBe6ucmekLUNkypDKx=eAXqtwdYNpZzwByzuWb-sjDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] pinctrl: msm: Add ability for drivers to supply a
 reserved GPIO list
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, alokc@codeaurora.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 7, 2019 at 1:10 PM Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On Fri, 7 Jun 2019 at 10:29, Lee Jones <lee.jones@linaro.org> wrote:
> >
> > When booting MSM based platforms with Device Tree or some ACPI
> > implementations, it is possible to provide a list of reserved pins
> > via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
> > However some ACPI tables are not populated with this information,
> > thus it has to come from a knowledgable device driver instead.
> >
> > Here we provide the MSM common driver with additional support to
> > parse this informtion and correctly populate the widely used
> > 'valid_mask'.
> >
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> I'm not sure if this is the correct approach. Presumably, on ACPI
> systems, all the pinctl stuff is already set up by the firmware, and
> so we shouldn't touch *any* pins unless they have been requested
> explicitly. Is there any way we can support this in the current
> framework?

I don't suppose anything but the GPIO portions of the pinctrl
driver is ever used under ACPI. I guess in an ideal ACPI world
noone (like userspace) would ever use a GPIO because ACPI
would have all GPIOs assigned a particular purpose, so accessing
any of them would lead to a crash.

But in practice it seems a lot of GPIOs are available and used
for example by userspace hacks, so just blacklisting the ones
that cannot be accessed by the GPIO subsystem seems like
a viable compromise.

Then we have the ACPI paradigm of pin control being controlled
by ACPI: this is also great in theory, but it seems like the ACPI
firmware has in cases forgot or omitted to implement some of
it and people need to access it anyways. The people writing the
default firmware cannot think out or test all usecases, so some
will be left open-ended to non-firmware authoring users. This is why
drivers/pinctrl/intel/* exists despite being for exclusively
ACPI platforms. Being able to control pins also from the kernel
has become a viable compromise.

Yours,
Linus Walleij
