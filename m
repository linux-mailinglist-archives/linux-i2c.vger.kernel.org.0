Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C11A7E71FC
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 20:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjKITKJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 14:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345112AbjKITKG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 14:10:06 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009B83C21
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 11:10:03 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2802d218242so1133335a91.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 Nov 2023 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1699557003; x=1700161803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGIHHIyIj/eQKklLFt+o4EC73VgMtqD7AwmKgpBlOOs=;
        b=ZrXeMrLMk/DpvkWwQft0y1/i2cj2Mz133uHSnJ/xQwN35n4nBoSiEmdRR7x4QNaSVm
         j+sMy9gsPFJxmis6QeVdwIr0ugj9fztOzehA0mTKC9a1SGFo5JZb3hWfB8lyC1DV5SGS
         /V/IerznE1hdrkKmIGWHV58wmT8H71RbG+Sggv2sKGO/gxtYgMLa1d76Wahk9v1RZdO/
         idShgEQnTi6z/Vp0PWzy+RS7dzplKIs21KPc2U0YNnumC1cvRDsOlD0DRGM3AjjzxIpq
         gZEQ/g1P0cMvqahRQjHTZ7j4yVdDkXNticT1evChhVBp6/VVXA9Im8i4II3WNGjvNTdc
         wY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699557003; x=1700161803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGIHHIyIj/eQKklLFt+o4EC73VgMtqD7AwmKgpBlOOs=;
        b=qvxKANMwHcrWlNnldQO2Eu4SPEXeAI5t9Oqb6j7yeBvsEptzDDxk+yUXlp7MY5IhpU
         yCs0lRfkGSfq7Jh5fs7r+hqdm6CkR+5wdXRQva5QwOp73EgvAw1CmfrOxSCI9SL45g9c
         ms93PoH57eos8rfLpQd4100eC3qnLjepxLqUvuLBltgVtHkL6epDjHSAEsgLvAW7/PYt
         sof2zhiXy5Gde20lHxmyRksIX/Y1RD0eqSv5DV+IsT+6LCm1j+iums55//9dujj2FQHW
         Pcr/QS8hycnhuQVfDfVNyOMRQyczhb1EOk+JBWAxJzB4S1QGIlVVkGuE15uhJXguMq5E
         vXZA==
X-Gm-Message-State: AOJu0Yx5cxT/DHpkM+BFqAbdJquYOWof6XCWpwwPGdD5U/w4H0SC5WUx
        rWIEvKORFOdI1BPQfFeHgsc2zGTIDVtLdAhv7c86kQ==
X-Google-Smtp-Source: AGHT+IF9rha3ZSgE/rr2Azs/075zCXghyG37VPOmh3714TVhwE0iJCVtFlVvOvJABF3bbGC33AZ04bGX6NegZNkuZGk=
X-Received: by 2002:a17:90b:3b8b:b0:280:3772:5c2e with SMTP id
 pc11-20020a17090b3b8b00b0028037725c2emr2345785pjb.25.1699557003421; Thu, 09
 Nov 2023 11:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20230926160255.330417-1-robert.marko@sartura.hr> <CACRpkdZem9Gtd==gQM4EQ9R8MN2ZQ0JCyMCoTjg0kqCNDjuFMA@mail.gmail.com>
In-Reply-To: <CACRpkdZem9Gtd==gQM4EQ9R8MN2ZQ0JCyMCoTjg0kqCNDjuFMA@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 9 Nov 2023 20:09:52 +0100
Message-ID: <CA+HBbNFeVmc2CJeo+u9jbZrzsrDTOttW_4+aeLJFcOjDJ8DwyQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: dont change pinmux state to GPIO during
 recovery setup
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     wsa@kernel.org, codrin.ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@armlinux.org.uk, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 28, 2023 at 11:11=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Tue, Sep 26, 2023 at 6:03=E2=80=AFPM Robert Marko <robert.marko@sartur=
a.hr> wrote:
>
> > @@ -359,13 +359,6 @@ static int i2c_gpio_init_generic_recovery(struct i=
2c_adapter *adap)
> >         if (bri->recover_bus && bri->recover_bus !=3D i2c_generic_scl_r=
ecovery)
> >                 return 0;
> >
> > -       /*
> > -        * pins might be taken as GPIO, so we should inform pinctrl abo=
ut
> > -        * this and move the state to GPIO
> > -        */
> > -       if (bri->pinctrl)
> > -               pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
> > -
>
> But this might be absolutely necessary for other i2c drivers and this is
> set in generic code.
>
> My first question is: why is this platform even defining the "gpio" pin
> control state for this i2c device if it is so dangerous to use?
> If it can't be used, you just give it too much rope, delete the "gpio"
> state for this group from the device tree: problem solved.
>
> (This can be done with the specific /delete-node/ directive if
> necessary, e.g. if you want to use the "gpio" state on other boards.)

Hi,
Sorry for the late reply.

GPIO function is being defined as I2C recovery itself requires it, it
will switch
the pins to GPIO mode and then pulse SCL for a predefined number of pulses
in order to try and recover the bus.
So we cannot remove it from DTS and have I2C recovery working.

Also, GPIO is a fully valid option for this pin group according to the
datasheet,
it is even the default until you switch them to I2C.

>
> Second: do you even want to do recovery on this platform then?
> Is it necessary? What happens electronically in this case, if we don't
> switch the pins to GPIO mode? Is it something akin to the "strict"
> property in struct pinmux: that the GPIO block and the device can
> affect the same pins at the same time? That warrants an explanation
> and a comment.

Yes, I2C recovery is required on this board as otherwise the I2C bus will
get stuck after a certain number of SFP module plug/unplug events or
sometimes even just randomly, I2C recovery allows the bus to recover
and continue working.

Maybe my commit message was confusing, so I will try and explain further.
I2C recovery did work on Armada 3720 just fine until the driver was convert=
ed
to use the generic I2C recovery which is now part of the I2C core.

After it was converted to it, the I2C bus completely stopped working
on Armada 3720
if I2C recovery is enabled by making the recovery pinctrl available in DTS.

I then spent quite a while trying to bisect the exact change that
causes this issue
in the conversion as code is almost identical to what the driver was
doing previously,
and have bisected it down to pinctrl_select_state(bri->pinctrl,
bri->pins_gpio) being
called before SDA and SCL pins are obtained via devm_gpiod_get().

Then I thought that maybe there was a HW bug in the Armada 3720 as the
pin function
was being set to GPIO twice via register write so I made sure the
register was being
written to only if the desired value is different than the current one
but that did not help
at all.
For whatever reason calling pinctrl_select_state(bri->pinctrl,
bri->pins_gpio) causes
the pins to basically lock up, but the weird thing is that calling
devm_gpiod_get() will
also end up with the kernel changing the pin function to GPIO and this
works, hence
this patch.

This is basically the only change in the old driver behavior which would do=
:

pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);

After obtaining the SDA and SCL pins via devm_gpiod_get() and this somehow
works while the generic I2C code will first call:
pinctrl_select_state(bri->pinctrl, bri->pins_gpio)
Then it obtains the SDA and SCL pins via devm_gpiod_get() and
eventually at the end of i2c_gpio_init_generic_recovery() call
pinctrl_select_state(bri->pinctrl, bri->pins_default);
to return the pins back to I2C state.

Hopefully, this all makes more sense.

>
> If you can't delete the "gpio" pin control state, I would add a
> bool pinctrl_stay_in_device_mode;
> to
> struct i2c_bus_recovery_info
> in include/linux/i2c.h
>
> And just:
>
> if (bri->pinctrl && !bri->pinctrl_stay_in_device_mode)
>     pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
>
> (Also the switch to the "default" state further down could be
> contitional !bri->pinctrl_stay_in_device_mode)
>
> But mostly I wonder why the "gpio" pin control state is defined, if it's
> not to be used.

Well, that is the thing, it is being used, it just somehow got broken with
the move to generic I2C recovery.

I hope to have explained the issue and symptoms more clearly now
as I have ran out of ideas why a call to pinctrl_select_state() to
change to GPIO
state breaks things, but then devm_gpio_get() also eventually makes a call =
to
the pinctrl driver to change the pin function to GPIO but that works.

Regards,
Robert
>
> Yours,
> Linus Walleij



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
