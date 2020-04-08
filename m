Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB2E31A1B5B
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 07:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgDHFGq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 01:06:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37503 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbgDHFGp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 01:06:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id w10so6289357wrm.4
        for <linux-i2c@vger.kernel.org>; Tue, 07 Apr 2020 22:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RVqYLzvz5LKqumC9icZHSiO0RIIhX7YU71aDHaxaFJE=;
        b=mt2UO1ksFUf2Wqcy/GXaoOoCVWX2OeRgET0TvIwM1qEhWK0CR1YeHqkacSxJv/P8fU
         VRA2yUT2pdNNBlBgUjtuWicF7bp7SIQxCJV403Pr1MDRJ0rxyUehQKnlOvLM1Ut+1qbD
         YDyaE7xaFAI8xHJ4/UwY5fE1ZAG0sWOpBgYTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RVqYLzvz5LKqumC9icZHSiO0RIIhX7YU71aDHaxaFJE=;
        b=UKy7+J1RiV+9dbTRohdS9MN8Uun6mOj6R3178KXKUtwHFBebzWdJh6OGF4D31b8EPP
         LQZD8n3L07sS1xk8eM9rXflStnU0Gmrz6IJ1mSTh/Vsda0AKswbIWRc8HsFCw/EGNqC0
         5PN1UWvU2Xfg3UxA3K6m1udVnnT3oWH6JOasTT1FW9L8dX1XEQr2CRcP/4xJBfZBQvBE
         QrJqpMiSsIdSEefyVusURooEVvB6jt8pugs9/PACqbF/6bJaIjauhg87OB/yS7Bp1Fir
         QVdyMvWKajP1VnLI7kCdIejGmzX4QTprF2wsQOOUGm8sgkSf7Ff7uL90FqewEk5RU7uP
         Fk1Q==
X-Gm-Message-State: AGi0PubV452X+1Bc8owhFziBGzHgzXueD9PkdOq2LbqmH1jbOwDpzckN
        uFTNuqbmHHw3gEGRrDXZMAaQzXWSCyK2o2RTTkDfug==
X-Google-Smtp-Source: APiQypIN18iGe7EO2INUCjO7GQKpI0EzzwmN1Z1k8o9aPCwEQGXb3Iysg/a12d8h4jfUDp3v4FHpOhNbFw6kY+d81vI=
X-Received: by 2002:adf:fa51:: with SMTP id y17mr6697995wrr.358.1586322403655;
 Tue, 07 Apr 2020 22:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200327151951.18111-1-ricardo.canuelo@collabora.com>
 <20200327154345.GA3971@ninjato> <CAGAzgsqJznZi83ijxCgQg463Q4AnwiNX-a0Q9+Og9MW5OJ4Vew@mail.gmail.com>
 <CAAEAJfCzquaiCkjxXYOJRH8tpGRkHJBSWnFD--S=C7uAvHwqUg@mail.gmail.com>
In-Reply-To: <CAAEAJfCzquaiCkjxXYOJRH8tpGRkHJBSWnFD--S=C7uAvHwqUg@mail.gmail.com>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Tue, 7 Apr 2020 22:06:32 -0700
Message-ID: <CAGAzgsqCasNOFtP6Yk+HQAn_EiYVQApohmmjrGRukGukua9GyA@mail.gmail.com>
Subject: Re: [PATCH] i2c: enable async suspend/resume on i2c devices
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        Linux-pm mailing list <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 29, 2020 at 5:49 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Derek,
>
> On Fri, 27 Mar 2020 at 17:26, dbasehore . <dbasehore@chromium.org> wrote:
> >
> > On Fri, Mar 27, 2020 at 8:43 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > >
> > > On Fri, Mar 27, 2020 at 04:19:51PM +0100, Ricardo Ca=C3=B1uelo wrote:
> > > > This enables the async suspend property for i2c devices. This reduc=
es
> > > > the suspend/resume time considerably on platforms with multiple i2c
> > > > devices (such as a trackpad or touchscreen).
> > > >
> > > > (am from https://patchwork.ozlabs.org/patch/949922/)
> > > >
> > > > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > > > Reviewed-on: https://chromium-review.googlesource.com/1152411
> > > > Tested-by: Venkateswarlu V Vinjamuri <venkateswarlu.v.vinjamuri@int=
el.com>
> > > > Reviewed-by: Venkateswarlu V Vinjamuri <venkateswarlu.v.vinjamuri@i=
ntel.com>
> > > > Reviewed-by: Justin TerAvest <teravest@chromium.org>
> > > > Signed-off-by: Guenter Roeck <groeck@chromium.org>
> > > > Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> > > > ---
> > >
> > > Adding linux-pm to CC. I don't know much about internals of async
> > > suspend. Is there a guide like "what every maintainer needs to know
> > > about"?
> >
> > For more details, you can look at the function dpm_resume in the
> > drivers/base/power/main.c file and follow from there.
> >
> > I can't find anything in Documentation/, so here's a short overview:
> > Async devices have suspend/resume callbacks scheduled via
> > async_schedule at every step (normal, late, noirq, etc.) for
> > suspending/resuming devices. We wait for all device callbacks to
> > complete at the end of each of these steps before moving onto the next
> > one. This means that you won't have a resume_early callback running
> > when you start the normal device resume callbacks.
> >
> > The async callbacks still wait individually for children on suspend
> > and parents on resume to complete their own callbacks before calling
> > their own. Because some dependencies may not be tracked by the
> > parent/child graph (or other unknown reasons), async is off by
> > default.
> >
> > Enabling async is a confirmation that all dependencies to other
> > devices are properly tracked, whether through the parent/child
> > relationship or otherwise.
> >
>
> Have you noticed the async sysfs attribute [1]?
>
> Given this allows userspace to enable the async suspend/resume,
> wouldn't it be simpler to just do that in userspace, on the
> platforms you want to target (e.g. Apollolake Chromebook devices, and so =
on) ?

I don't remember much since I attempted this a long time ago. That
sounds like it would be reasonable under many circumstances though.

>
> Thanks,
> Ezequiel
>
> [1] Documentation/ABI/testing/sysfs-devices-power
>
> > >
> > > > This patch was originally created for chromeos some time ago and I'=
m
> > > > evaluating if it's a good candidate for upstreaming.
> > > >
> > > > By the looks of it I think it was done with chromebooks in mind, bu=
t
> > > > AFAICT this would impact every i2c client in every platform, so I'd=
 like
> > > > to know your opinion about it.
> > > >
> > > > As far as I know there was no further investigation or testing on i=
t, so
> > > > I don't know if it was tested on any other hardware.
> > > >
> > > > Best,
> > > > Ricardo
> > > >
> > > >  drivers/i2c/i2c-core-base.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-bas=
e.c
> > > > index cefad0881942..643bc0fe0281 100644
> > > > --- a/drivers/i2c/i2c-core-base.c
> > > > +++ b/drivers/i2c/i2c-core-base.c
> > > > @@ -769,6 +769,7 @@ i2c_new_client_device(struct i2c_adapter *adap,=
 struct i2c_board_info const *inf
> > > >       client->dev.of_node =3D of_node_get(info->of_node);
> > > >       client->dev.fwnode =3D info->fwnode;
> > > >
> > > > +     device_enable_async_suspend(&client->dev);
> > > >       i2c_dev_set_name(adap, client, info);
> > > >
> > > >       if (info->properties) {
> > > > --
> > > > 2.18.0
> > > >
