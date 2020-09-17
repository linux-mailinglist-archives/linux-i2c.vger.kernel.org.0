Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD8B26DBDE
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgIQMod (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgIQMoX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:44:23 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E88C06174A;
        Thu, 17 Sep 2020 05:44:22 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so1939324wrn.0;
        Thu, 17 Sep 2020 05:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WPlmUK6xwfYIFf3eWa41i7jGBkJm7AGo8SuUlHspOHo=;
        b=oNVzEkwh40IxzO/aY6JQzbYAPpqvISEzTYDWD2bUR4qN45wRoNgiHxyBi9jWKdo3Hk
         4axmalkFJNo/1tKG7y7Ww0FlAJhF4I+TpP/IYsn9URi9FnzSVAA30Ekrrmxf1qi9gQ5Y
         sLLzb+MKBTcpSj2RGjEYn864kGGMgOAL7BXcgoySg6fjY6SefDMklVOiKcL9wvgnFBau
         /r15uSaU0tE41865RuC4H+V4GLCTrdSltEAwXcjVnsmWbRpjcO1Qfv0kIO8Ugw+LQber
         JoLlcrPxHQMh8oS1AShVm2Caxy0OyYCKT0DHQWhwQeCOCPE5l9ukwpGhRZJko1pY5avO
         YLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WPlmUK6xwfYIFf3eWa41i7jGBkJm7AGo8SuUlHspOHo=;
        b=bHzNgd0+g0tE/CC/ezfuSyjEXbMcZMQD7pnBgkeVIBsU537P/vb7Kbm3ZpSB3NyWRF
         2aIr4dw8Liy/Ie8L8xvBOz264Xw+Vdb8wolq4EEZbgFTWD8Woa020quR/tC3iYwElCvm
         A0m5zdjsVwVVwIH1KFxgIFW5swQzJ+adPjw0L1UR1eCDBzrl4cl5eduQUC89UhZvykSp
         5UqCR/dp6hZqPSssocnYbngZYliHRe7nYybBu59a001fO/2q1PM7cniBCKm83TMuc6l5
         n01LEC/LpyVF6v5n0KCkI8OZmNAapcce/aZDnI+cXWLHGV3uCsT1/5mNwTCF3T4Y0Rn8
         q4nQ==
X-Gm-Message-State: AOAM532VOe3a+mcwBiJdNvmR/C1jYikR04PG65Kf9xVA9HNi5/J0VqFV
        vDekFWKysUMuUUTG7TkvHIY=
X-Google-Smtp-Source: ABdhPJxC+ACx1y00LV9cPUIOkPlWKgy7JaEDqL3m8hrxOjM4ZoCyav9AC2Gv/4UV9aLYz9cWRi0Xgw==
X-Received: by 2002:adf:fe42:: with SMTP id m2mr31464066wrs.367.1600346661188;
        Thu, 17 Sep 2020 05:44:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id h2sm39945128wrp.69.2020.09.17.05.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:44:20 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:44:18 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/34] Improvements for Tegra I2C driver
Message-ID: <20200917124418.GU3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <CAHp75Vdh6bErqeO-ki2xsS9jEeoy4mKF1h0Jw_HM6UpukqH_BQ@mail.gmail.com>
 <854a0ed8-35dd-0b25-6c53-4915be0e33e9@gmail.com>
 <20200909154902.GA916@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KCGU/3tJP9FZjbY4"
Content-Disposition: inline
In-Reply-To: <20200909154902.GA916@kunai>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KCGU/3tJP9FZjbY4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 05:49:02PM +0200, Wolfram Sang wrote:
> On Wed, Sep 09, 2020 at 06:36:50PM +0300, Dmitry Osipenko wrote:
> > 09.09.2020 12:11, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Wed, Sep 9, 2020 at 1:40 AM Dmitry Osipenko <digetx@gmail.com> wro=
te:
> > >>
> > >> Hello!
> > >>
> > >> This series performs refactoring of the Tegra I2C driver code and ha=
rdens
> > >> the atomic-transfer mode.
> > >=20
> > > I think there is still room for improvement, but let not block it, FW=
IW,
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >=20
> > Thank you and Micha=C5=82 for helping with the review! Very appreciate =
this!
>=20
> Yes, thanks everyone so far!
>=20
> Is there some internal testfarm where this should be regression tested?
> Otherwise, I'd trust Dmitry, Andy, and Micha=C5=82 here and would apply it
> this week after some generic high-level review.

I'll queue this for a run on the test farm. I had a couple of minor
comments, but after going through the full series I'm pretty happy
overall with the result, so I'll go over my comments again and will
reevaluate.

Thierry

--KCGU/3tJP9FZjbY4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWiIACgkQ3SOs138+
s6GyBQ//eTPEG9XrbiSZuZ/pokmEuYx3ZKqv/WXycZTlqx7dXe0FAqHrwGm0id00
IqlDYhim9YMkjsCREzyevGrEW2Joua02DCLyMEasJrZIFb82ttFTZ7kthKsr+iqN
AYx1tmsfo7LhRbRciW/QPUDunWVjrvBW7ts95hv6/3Dg89wSscpJYSjba1scfZjV
lwxgvYRN//RmpTgiln+yWVlAgF4tkZPcRBAVeH0b0DJkuIGRDAbawl9n0rLkTk2Y
nC9PahvrSX8Z100WXmIxEeBNDSYJq9mGAU7ZG/muHmd5eiAKS6y7Ck6SpQj+9QbT
euIMgQTO/B3/rYJ6KAIsS3Dt+jjkp5K/oMGvBamyzQZkgpia1GduaqkjEaCvBF4c
IzRyKuxMxU6DJk2yMM7sMxVNMpySlXPeNHB+q4bWjQkD3pATfuu/GYmYpzGuNX7R
dU8FgmmbbnjIfzABLKBqfJh4njke/ppWZAOhqzV1o4mGU60r9ReN59E24rzGrW2H
lHlkpZbgr04yV3QpW22mG4GX0aRQxz851uVqcUZTWnYGfI2DVIa/mEyHqXOLFRsN
Yh+HdBeVx3oTkL2myo5MrVG4yGZsJX5D6c1n8uLPJWyuDaR0ydb1tZMNaJB2LbgU
3Ded33GREKwK6yKLzqoPS3tnfiWGUzRGP8bsZf+dVR55JkcbvZ0=
=fNMv
-----END PGP SIGNATURE-----

--KCGU/3tJP9FZjbY4--
