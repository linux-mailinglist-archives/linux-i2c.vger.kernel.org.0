Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7DE365A3A
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Apr 2021 15:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhDTNe7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Apr 2021 09:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbhDTNe0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Apr 2021 09:34:26 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5C3C06174A
        for <linux-i2c@vger.kernel.org>; Tue, 20 Apr 2021 06:33:53 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id v13so16004972ilj.8
        for <linux-i2c@vger.kernel.org>; Tue, 20 Apr 2021 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xgfc7mO4E1wXWUmekqC8sEt5bIbUy15Zn+YoHQva8NI=;
        b=PYyvqtFzdzRakpUOqbunR4I7/Lj/8HDyE7lqd9tAm0PNx6Uh1yOIHCDmuaqBR1ViP4
         mmStHq4YHDIb9iNLpswctc4T/0gjz0QMypKb9sh/woNGTQHvzByI8qY89af1f2aYk6+S
         wieFezmrOmmKh35TaWQ/tU2N5mVDzf8HRzVYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xgfc7mO4E1wXWUmekqC8sEt5bIbUy15Zn+YoHQva8NI=;
        b=qHhhtgda8GouFnmpO5S/ZP9T2zamFE1/gryMre6JHIp9YFP5a86slgs8KYnu+C5bC2
         PHbNCJ2pRD+ir/rEqtz9qTvEY9I5GEJZYZyZEHC5CFYMNDf90UhWiIRr3RnIPxZQew+F
         OY0odEeqtMt/2/dNzwSv+gUdMUD4HmGzg1hKjCT3/nQ5a2HiinXMPFzoAaqAwmedKEqP
         IMcn6Dfc2f7nDzXa7A3TowEYTB3s5qaS1VzVpSg7iA8YSNlbDevS7J4LhLJTMFIv2dfa
         g72VyOCwaVryt6VYDnugH391DQ/ccJAdRlPMfNwlApdZzTqew7KPOepeLUcgmcjOqlsa
         PDzw==
X-Gm-Message-State: AOAM53287C0qbml3YcRp+ZdSi8ivQavGLqs17cMfgT0GOg0zWsykKLS0
        KUBeVazgLWbxQ61i4QWqXDuyN5bmoyYUUumtKXjTdA==
X-Google-Smtp-Source: ABdhPJy6RgMFJUk30o3Bp+6VqEWzChzCOkzvaHDVug4JPECZShpDcemglkoDMMwZ/VXKrU9wV09fLSo20xOiZ0XVnHs=
X-Received: by 2002:a92:d684:: with SMTP id p4mr22468413iln.150.1618925632435;
 Tue, 20 Apr 2021 06:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210414172916.2689361-1-hsinyi@chromium.org> <20210414172916.2689361-5-hsinyi@chromium.org>
 <CAMpxmJUGxUPYC9NEnJDHYq7Nu=akP5GTpU0ts9htf1vELhK15Q@mail.gmail.com>
In-Reply-To: <CAMpxmJUGxUPYC9NEnJDHYq7Nu=akP5GTpU0ts9htf1vELhK15Q@mail.gmail.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Tue, 20 Apr 2021 21:33:25 +0800
Message-ID: <CAJMQK-huKTYepZ+xCZDG01RBGB5Tu4ic=Hs03=remLii0WBTaQ@mail.gmail.com>
Subject: Re: [PATCH v19 4/6] misc: eeprom: at24: check suspend status before
 disable regulator
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Qii Wang <qii.wang@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 16, 2021 at 10:09 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Wed, Apr 14, 2021 at 7:29 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > cd5676db0574 ("misc: eeprom: at24: support pm_runtime control") disables
> > regulator in runtime suspend. If runtime suspend is called before
> > regulator disable, it will results in regulator unbalanced disabling.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Please add the Fixes tag.
>

Hi,

I resend the patch with the fix tag separately since other patches in
this series are not changed.

https://patchwork.ozlabs.org/project/linux-i2c/patch/20210420133050.377209-1-hsinyi@chromium.org/

Thanks

> > ---
> >  drivers/misc/eeprom/at24.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 926408b41270..7a6f01ace78a 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -763,7 +763,8 @@ static int at24_probe(struct i2c_client *client)
> >         at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
> >         if (IS_ERR(at24->nvmem)) {
> >                 pm_runtime_disable(dev);
> > -               regulator_disable(at24->vcc_reg);
> > +               if (!pm_runtime_status_suspended(dev))
> > +                       regulator_disable(at24->vcc_reg);
> >                 return PTR_ERR(at24->nvmem);
> >         }
> >
> > @@ -774,7 +775,8 @@ static int at24_probe(struct i2c_client *client)
> >         err = at24_read(at24, 0, &test_byte, 1);
> >         if (err) {
> >                 pm_runtime_disable(dev);
> > -               regulator_disable(at24->vcc_reg);
> > +               if (!pm_runtime_status_suspended(dev))
> > +                       regulator_disable(at24->vcc_reg);
> >                 return -ENODEV;
> >         }
> >
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
>
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
