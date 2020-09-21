Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7BBA27232A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgIULxu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIULxu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:53:50 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1ABC061755;
        Mon, 21 Sep 2020 04:53:49 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z9so12326146wmk.1;
        Mon, 21 Sep 2020 04:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tnYdKbbs0v8cjRUa6+TQZR8WZS5M4KfLczxxoR92Ii4=;
        b=k9PsPNfv4RkoW9BlHFdHIf9xY2kBpx4aGy+LnFsfyk7MVKIGfajOKv1yRzBG1g9kRV
         p5vGoTuYp4sH7fDonoo3vDzOPUMd7BlEl+o7QkPoLDBJUlz5oWXszKWEObMkhiS53SpH
         wRn0yH+tOYm+0D0rtlQoYQAtrJo20zc9BQhRZCwQlIuisnKA+4NIrYDfj+kz9namaMkx
         HyFK6tUXueEbzI1XyPT6w+ZymeROdWDVBqT3LM/OgqsxRi/GfJgOY99kYRZFqfJK92Ir
         LxYTgdQHuFkeU532K8QHqqJUS5jkFiz0n9mcSUyyn5e+qWGwMVp8/B/R4bHG9oSJM374
         lufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tnYdKbbs0v8cjRUa6+TQZR8WZS5M4KfLczxxoR92Ii4=;
        b=Brwhx8ZjBoB7zDwF7t3xURMRZwlhhIuOrynb4S0ahgBSdNHvA0xAXlub74dQoQnOYJ
         W6sEyZUNt4k1B+uKL48HdzQ/O24V0G2LIfKjRPH7PaGELlZIgiqmLsGYl+nECwuM8RD1
         EIqkca/tmLJsLtlVqNV/puUMzP7439u/e/zG6OjWCsfOIGk4M0U3TQDLYsFaVb/X56Y3
         vck5EWTd5J4XFVqbQvXtbLXavxC2ZKeIQsqMnwTg51rw5auEJmGQs4Hw1eO6NHScgPbv
         Y6sq3o3cZnca5+d6d3mynrNSWSH69aycR5ccXjNwodZ1DVzwt88qFu/51qtnHyFFEu7F
         1s/A==
X-Gm-Message-State: AOAM531QGnI/Igy1bAoBgv7EGjmVzOP1rLt49BXv2hr1T3U41euxKuQ8
        lTC+pg6mpKjdKXCypilFvaA=
X-Google-Smtp-Source: ABdhPJx5aWLyT9FmZeJfWGXgN3NtrC5HfjdVYSlV8isUlvPJUARX+mcG8/Dj8AaoipCOjPw9vaznhw==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr30741819wmc.45.1600689228397;
        Mon, 21 Sep 2020 04:53:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l8sm20641084wrx.22.2020.09.21.04.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:53:47 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:53:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
Message-ID: <20200921115345.GP3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-13-digetx@gmail.com>
 <20200917113846.GX3515672@ulmo>
 <CAHp75Vd_B9WLM99LnN2YiZ045z8SUkD7KwY2wVEUeQ9Mx7fg5g@mail.gmail.com>
 <20200921110159.GD3950626@ulmo>
 <CAHp75VcpoZ-m2wkJGv4s+KthOVLQR1XBTzMFMmvj-Q82BEh7NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sj9mcRtP+pTWLOo"
Content-Disposition: inline
In-Reply-To: <CAHp75VcpoZ-m2wkJGv4s+KthOVLQR1XBTzMFMmvj-Q82BEh7NQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6sj9mcRtP+pTWLOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 02:15:09PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 21, 2020 at 2:02 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > On Thu, Sep 17, 2020 at 04:54:28PM +0300, Andy Shevchenko wrote:
> > > On Thu, Sep 17, 2020 at 2:38 PM Thierry Reding <thierry.reding@gmail.=
com> wrote:
> > > > On Wed, Sep 09, 2020 at 01:39:44AM +0300, Dmitry Osipenko wrote:
>=20
> ...
>=20
> > > > This is tempting from a diffstat point of view, but the downside is=
 that
> > > > we can now no longer validate that all of the necessary clocks are =
given
> > > > in device tree.
> > > >
> > > > Previously the driver would fail to probe the I2C controller if any=
 of
> > > > the expected clocks were not defined in device tree, but now it's j=
ust
> > > > going to continue without it and not give any indication as to what=
's
> > > > wrong.
> > >
> > > You may print an error in the error path as previously. Since both
> > > clocks are mandatory (as far as I understood the code) user will need
> > > to check DT in any case.
> >
> > The problem is that the number of required clocks depends on the variant
> > of the IP block that's implemented. Some require just one clock and
> > others require two or three. With this patch the driver is just going to
> > pick whatever clocks are given in device tree, but it removes any
> > possibility of detecting whether the device trees contain the correct
> > clocks. So we may very well run into a situation where the driver now
> > successfully probes but then malfunctions because one or more of the
> > clocks were not specified in device tree.
> >
> > Thierry
>=20
> I still failed to get this. Are you suggesting that CCF bulk
> operations are fundamentally broken?

No, I'm not suggesting that. All I'm saying is the way that they are
used here is causing the driver to behave differently that it was
before.

Taking for example the VI I2C controller instantiation. That requires
the "slow" clock to be specified. Previously if the VI I2C device tree
node didn't have that "slow" clock specified, the I2C driver probe would
exit with an error code. After this change it will simply not see the
"slow" clock and then just continue without it as if it was optional.

In other words, after this patch we have no way of saying which clocks
are required and which are optional. They all become optional, basically
and the driver would attempt to continue (and most likely hang) if no
clocks at all had been specified in device tree.

> In the above case one may add more checks. AFAICS is_vi won't be
> removed, so can be easily checked.
> Basically that for-loop for div_clk is questionable. I agree on that.

But we need that one to find which of the clocks is the divider clock so
that we can call clk_set_rate() on it later on. It's a bit odd that we'd
just continue even if we didn't find the divider clock. I think the CCF
does handle this transparently and will just no-op all the calls for
NULL clocks, but it still means that we won't be running the I2C bus at
the right frequency if the divider clock was not specified in device
tree.

Thierry

--6sj9mcRtP+pTWLOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9olEkACgkQ3SOs138+
s6E3RRAAicgwoUZ3itSlxAQ4dLKrDOobCDxoEwECgY1PncljTtqyP6aPCuvy9UnV
QfJe0iXyK25n3oOFmpX2LEYtoBYHko87xRkII3JESAZLtXrUBdVbvyds4IqXBILR
RYSVtkfh8Bl5pZggF5HwHpDnZaaQBPtK57c1da8CO2xROJBoXX+l6oiaNQwNkJy7
n/qbWpBq5X4MMHnISa5YayuxGr0YQbDvFSPZeeWaU7KDBbwwSJPLiknBtQs0dNaB
Ojm5SMM1aaaFbv15mY9OyK7X4fQ6AENpgAks+GcmZ/bQnFvtgXheMDKBDqFt7q2V
JxzwXv273wT3qKHvt8yf1IMG2JlNu5OHeTckdMuynn5VIw07TY1xCGKDDL2T9z0P
yXy3YMv0MunYCTSdjk8LJa4eVNBuEikAQTpN4AJsMTrYFCHH/z0OibRdAjuPbJc/
SOZMlGwms02fhEiG7MqjI8JYIWdUhKuYiaJ1nfZkYcQnlhvgH+jDWBeJYyR2HzuK
t/I+waWK6jfach6YbgSbQawvcekpioz1JbQKfqx+WxUtriEEOmHpYDgZolvtO/pI
YEb/RDepVeQIlutFXAhSmQxa3LTXYcpxghMwnEpmYGJrz4jYc+8jnn3BdurqLAHI
MYTd3VGD73ikxVgj4d3uzdyBbewjYvMUca7HWn+/YWRceBbCwdw=
=iz+4
-----END PGP SIGNATURE-----

--6sj9mcRtP+pTWLOo--
