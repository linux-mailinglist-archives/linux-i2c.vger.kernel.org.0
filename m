Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E2879F15F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 20:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbjIMStm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 14:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjIMStl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 14:49:41 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CFA1B8
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 11:49:36 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-565e395e7a6so68777a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 11:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1694630976; x=1695235776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amClRN/VUv0+/E7NKSkW+OQty+wplVkcs/ReeLsV3aM=;
        b=fnfPP2GoK3OzCWhNQ5loGTLdVXGUu9CAbAnRDWhyxuuTesF2XjjCTw1pxxQSfAhGfo
         jTbG285tRPXuHfL8qz8/TUfkcSs4CWBPusbgPVFdbhH8b18E8/o89abC8PxYZaENQhvk
         8vqcH3AmdJv8dyAVz2kKg4LeH3DE4w3V0+soliwrx8+9szWXfx81/T9P7biVOt70HZHx
         2/3F/bW4OmQPW1vm/J/aaEgsirKR0QNsI6Uk27D1uE5EbcmycXRRHHtZRvLD9xN1hWOk
         CMEzzKsMjFeZ+HKIFwc7UHZ8OTeqYY9pMqAgOBU+lEq9Br/08vbAIg7aADmg2R2sAlbU
         H0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694630976; x=1695235776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amClRN/VUv0+/E7NKSkW+OQty+wplVkcs/ReeLsV3aM=;
        b=edDdqaP7pvunqV+HhPlbT9vr2cr8DW+IIvW5C6RP1/gGqgKgfA0UyZCzY6qTBAfrdZ
         yNYRqFBNX7RATsm1LFB7161fdRKZB3TnVW8QLXqtnUC4DyPX34i1qWPhknSxB7lJ8vmA
         OFceoenlF/IjtsgYW830FdL3akj0QxNxNpo9E9KaaJk4WtSpNoBEAWemMYYVmVQIbEGQ
         MSwBsVNceQiZ8H65eisM58d4tOEaJNG831zFiu1EB3LZNIklHOvCYhHHeYp4ML9RVwg8
         YdRnNhGnB897FvswiVynaoFHAXOCMmPIoVdPwjgWb3+aU5pYq9X32QgtEQv06fwhCIl9
         r/gQ==
X-Gm-Message-State: AOJu0Yx805Eps66nkIeZ1gExwpx3lg3WVx4z54cG7t+3c034Ekzyx5Kh
        +RIX6Jl0+rdtUu3+ngqlUKiTnTXyMAHrZ0Yo4AtzMA==
X-Google-Smtp-Source: AGHT+IEdOY9pPgankq2/rE9MCXo+P1HVEeCrNPN9oS48Z6z1ENvqB3cGPyhl0gjGbkJtvw/IaYfx3831MZzDQLYdsp4=
X-Received: by 2002:a17:90a:8b0d:b0:269:621e:a673 with SMTP id
 y13-20020a17090a8b0d00b00269621ea673mr3178462pjn.1.1694630976379; Wed, 13 Sep
 2023 11:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230901114936.1319844-1-robert.marko@sartura.hr>
 <CA+HBbNEM6AfwX87DLRNAuJSWPKboGuuJJDRK_E+G3sJDF73oZA@mail.gmail.com> <ZPivHKd0LWWnhPr/@shell.armlinux.org.uk>
In-Reply-To: <ZPivHKd0LWWnhPr/@shell.armlinux.org.uk>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 13 Sep 2023 20:49:25 +0200
Message-ID: <CA+HBbNG9uXEhYjaKR6ixhN1uESmypgjqmCTayvWknUt03BYQNg@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: core: dont change pinmux state to GPIO during
 recovery setup
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     wsa@kernel.org, codrin.ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 6, 2023 at 6:55=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Sep 06, 2023 at 04:41:33PM +0200, Robert Marko wrote:
> > On Fri, Sep 1, 2023 at 1:49=E2=80=AFPM Robert Marko <robert.marko@sartu=
ra.hr> wrote:
> > >
> > > Ever since PXA I2C driver was moved to the generic I2C recovery, I2C =
has
> > > stopped working completely on Armada 3720 if the pins are specified i=
n DTS.
> > >
> > > After a while it was traced down to the only difference being that PX=
A
> > > driver did not change the pinmux state to GPIO before trying to acqui=
re the
> > > GPIO pins.
> > > And indeed as soon as this call is removed I2C starts working.
> > >
> > > To me it seems that this call is not required at all as devm_gpiod_ge=
t()
> > > will result in the pinmux state being changed to GPIO via the pinmux
> > > set_mux() op.
> > >
> > > Fixes: 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery")
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > > I am aware this probably isnt the correct fix, so I am sending it as =
RFC
> > > cause I have ran out of ideas.
> >
> > CC-ing Russel as well since I forgot him.
>
> So the generic recovery decided to set the pinmux state before calling
> devm_gpiod_get(), where as the driver (and my code) originally did this
> after calling devm_gpiod_get():
>
> -       /*
> -        * Claiming GPIOs can change the pinmux state, which confuses the
> -        * pinctrl since pinctrl's idea of the current setting is unaffec=
ted
> -        * by the pinmux change caused by claiming the GPIO. Work around =
that
> -        * by switching pinctrl to the GPIO state here. We do it this way=
 to
> -        * avoid glitching the I2C bus.
> -        */
> -       pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
> -
> -       return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);
>
> I'd suggest re-implementing my original scheme in the generic code
> because this _does_ work on Armada 3720 hardware.
>
> Removing the pinmux frobbing is likely to break stuff.

Hi Russel,
Sorry for the late reply, its been a busy week.

I have tried doing exactly that and calling:

if (bri->pinctrl)
pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
/* change the state of the pins back to their default state */
if (bri->pinctrl)
pinctrl_select_state(bri->pinctrl, bri->pins_default);

However doing that in the generic code does not work, only thing that has
worked so far is removing the GPIO pinctrl call completely.

Regards,
Robert
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
