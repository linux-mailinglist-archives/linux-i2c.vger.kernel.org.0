Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A267E7372
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 22:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjKIVQN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 16:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjKIVQM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 16:16:12 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF5BD62
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 13:16:09 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cc938f9612so10821385ad.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 Nov 2023 13:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1699564569; x=1700169369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkATN4wwZE6+H0LWBM3J8nfeagxSwway3jN9y5UmPbU=;
        b=IbfAaU8505DUvWNn+mcOyCFRXem4sMiWsPR7xvKwhsLm8wo7u6xUcr1wqEyqzo5DKC
         SG7YkpJ5+5QhjoWiQagdWdyATQUzYUlH+Ldx4Dm007z0o8Yc07+/6ZXIxq7hdkLBD0uq
         YwZWp3inMCGRJuwExjL3ZaSsd0mfo88UvMJfws5JvGxQzIFFjqTee5+O8KpJMdMYRx1L
         qTieedq5HHe+zjmari1IC5YZH2b5bTnbaEqtrxcw04IyZpQkDnX+2NP67zcKmDscaG5T
         950TSPbirBd3FQoPra1Li6Sg/UwGOozlmcESlx1txcOy0yoLAOelnHU9laQythJqoQhl
         Fefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699564569; x=1700169369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkATN4wwZE6+H0LWBM3J8nfeagxSwway3jN9y5UmPbU=;
        b=U78vSD0dGV40KCCoYwDOc6F7tzMkpyX4YE2M105r+4pvJPMZR8rFFP0fqRkbw/wdlT
         A7r/eb+kmXVtqAjInGLb4NJ8MMKsXWDrKGwPilRsK7wUh7aYlM+YdYnNioXn1DgUt7dg
         eUik/8i8eGsy++A9H6HaN69Ja4SzwBEXbMXWqCN/svmgczN6WRIN3F8hjUulr1bqMdqm
         JDoEI+exq0TpvtDMm2Z94JGqhX1j4EeJuGTGqKrTFEqeYmR44rlPGzbZa4ej3zGnsRaB
         MutXVk9SFechcBW1wsWvPEkVHNH7YwrKCqrr5xRUsVMB5hCa3eg7k9vabDOsxsCVuMjL
         4ceg==
X-Gm-Message-State: AOJu0Yw1/tmWhb3Gf/L8zwro5vMoFs645qYY3Pc23Lh9qj4lgidd2vXL
        Rj0LWubstqkmyWYqiPLmUjQyV8n9wYtQFPD4sgd3T1NaHGWHYokR
X-Google-Smtp-Source: AGHT+IFuFSvFDFIoIHsPanXhu+zG/WJWZIONx2EFtzj7wSPX1ldg1yfvWX7GDLFyCrp47j4e3XP+v3X6fxX8edKq+9g=
X-Received: by 2002:a17:90b:3843:b0:27c:ef18:d270 with SMTP id
 nl3-20020a17090b384300b0027cef18d270mr2430439pjb.20.1699564569375; Thu, 09
 Nov 2023 13:16:09 -0800 (PST)
MIME-Version: 1.0
References: <20230926160255.330417-1-robert.marko@sartura.hr>
 <CACRpkdZem9Gtd==gQM4EQ9R8MN2ZQ0JCyMCoTjg0kqCNDjuFMA@mail.gmail.com>
 <CA+HBbNFeVmc2CJeo+u9jbZrzsrDTOttW_4+aeLJFcOjDJ8DwyQ@mail.gmail.com>
 <CACRpkdYUW-mO6vhh-zkZAuqQOHpwMeJsNw=jSLzbgoEtoCTtNQ@mail.gmail.com>
 <ZU1BSmyD931BRwSD@shell.armlinux.org.uk> <CACRpkdZBR1ROkQ_w_QonVmvPB1nxh4c7BQksuP-k=hQG92FmDw@mail.gmail.com>
In-Reply-To: <CACRpkdZBR1ROkQ_w_QonVmvPB1nxh4c7BQksuP-k=hQG92FmDw@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 9 Nov 2023 22:15:58 +0100
Message-ID: <CA+HBbNFGKeX5x92aw=Skry5Qrpm4s2emv7-todX+iVFfaaRR+g@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: dont change pinmux state to GPIO during
 recovery setup
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>, wsa@kernel.org,
        codrin.ciubotariu@microchip.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 9, 2023 at 10:02=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Nov 9, 2023 at 9:30=E2=80=AFPM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Thu, Nov 09, 2023 at 09:04:29PM +0100, Linus Walleij wrote:
>
> > > > After it was converted to it, the I2C bus completely stopped workin=
g
> > > > on Armada 3720
> > > > if I2C recovery is enabled by making the recovery pinctrl available=
 in DTS.
> > >
> > > Shouldn't we just revert that patch until we can figure this out then=
?
> >
> > Note that when I wrote the i2c-pxa recovery code (which was developed
> > and tested on Armada 3720 - the uDPU) it had to work... when the
> > suggestion came up to implement generic recovery, I stated:
> >
> > http://archive.lwn.net:8080/linux-kernel/20200705210942.GA1055@kunai/T/=
#mf7f862fcd53245f14fb650d33c29cf139d41039d
>
> Makes me even more convinced that we should just revert this. i.e.
> commit 0b01392c18b9993a584f36ace1d61118772ad0ca
> i2c: pxa: move to generic GPIO recovery
>
> There is even:
> https://lore.kernel.org/linux-i2c/20201209204645.GF3499@kunai/
>
> "In case we missed a glitch, we can still revert the patch later."
> Well this is later.
>
> Robert can you see if it possible to revert, that things work after a
> revert and send a revert patch?

Hi,
Yes, a revert still applies and "fixes" things so I2C starts working as bef=
ore.

I can send the revert tomorrow, I was just hoping that there was an bug
that could be fixed instead of reverting, but seems its more complicated.

Regards,
Robert
>
> > > > I then spent quite a while trying to bisect the exact change that
> > > > causes this issue
> > > > in the conversion as code is almost identical to what the driver wa=
s
> > > > doing previously,
> > > > and have bisected it down to pinctrl_select_state(bri->pinctrl,
> > > > bri->pins_gpio) being
> > > > called before SDA and SCL pins are obtained via devm_gpiod_get().
> >
> > Yes, indeed. That's because the pinctrl internals get confused. I sent
> > you an email about it on 6th December 2019
> >
> > "pinctrl states vs pinmux vs gpio (i2c bus recovery)"
>
> I found it:
> https://lore.kernel.org/all/20191206173343.GX25745@shell.armlinux.org.uk/
>
> Sadly I had no good advice for any simple elegant solutions
> to the problem, but the more complicated solution does
> work so let's go for that.
>
> > which is why i2c-pxa did things the way it did in my commit
> > "i2c: pxa: implement generic i2c bus recovery".
>
> I think we need to go back to this.
>
> It's nice with the ambition to create generic code of course, but
> sometimes it is better to just roll something IP-unique.
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
