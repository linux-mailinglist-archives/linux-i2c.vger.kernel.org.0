Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198532721B8
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgIULCH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgIULCE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:02:04 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CE4C061755;
        Mon, 21 Sep 2020 04:02:04 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so12259645wrx.7;
        Mon, 21 Sep 2020 04:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2nTV7QKpvZE9DEfKp354re2XrcIxmHOtNBkXiILWcMk=;
        b=eFh9r3Zbz0qFSJxkguPu2OJ8u+w/7fhzBT6FCb9XPQf/0B+rlg97vTjUJVQt5mLmdc
         zPaLIQVIq7nWGxi1rgg5k+A1Erm/FgHVhALNOqG5BwkrwEZfzujxpm30kgso3NEbNRmY
         IWPGJPABqrziaVA6FxgeatxCK6BStQTskR6sn6GCGnWCh5EeysQvyxF9uXHFOZpFufAg
         qTjKFTi8Nw88DyuXyvMjsLd/H6sgMDMjH3fMfR9HxOXKcab3fFrCR6YSuDkoABEjVcCA
         aqwFiND2DOhT7eTvd4960QXzeWQLulRB7VAksm480OaNsoE+7L1Rnnhbqn8haeUwVDUr
         m/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2nTV7QKpvZE9DEfKp354re2XrcIxmHOtNBkXiILWcMk=;
        b=FMKGx2O+E5UJC1wYLF5lCNk3l71/iAa0+vgALXpaNXONqqF/FYnMjET/CCrGDHlLNd
         O88yXMFwJ4wBBkTqP2bStdTzN2L5uTg6dMgcpkVisaUA+bQp8W3EyCOlgBombwzjwZCp
         +RC03rtXBbOVry2usztM9r61cDm/iAyniC7FE0jONmZ6QUzl8t3gUAPDL5sxK6f6sVHB
         guIJejmisnkHpanbSEyL3Y+qx/P6ldzX7jvqqRXhqjXN27DTgkd5SY4+iPpxUEiFm1Kp
         EkoN/1Oj1bEtcBE5XLzRqbB3x4eiqYjxgbVvzsn/aW+Za/KfoSLbO11SsLVzKKj1ExLP
         LZYA==
X-Gm-Message-State: AOAM530shmsGej1gU3yu5B3ApyGcKJpVh97jYoat9s9SF0Mbo6n4fOaS
        vndMVlNcp+tMpT6ku0IDzjk=
X-Google-Smtp-Source: ABdhPJxTAbigikmGAfPF2GvBIkLVJVNb8p9gr1Npq2cv9W9fshxeW4IezHH57C7Mg8zRMhjOolt3vg==
X-Received: by 2002:adf:f190:: with SMTP id h16mr52680199wro.202.1600686122794;
        Mon, 21 Sep 2020 04:02:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 9sm18744475wmf.7.2020.09.21.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:02:01 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:01:59 +0200
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
Message-ID: <20200921110159.GD3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-13-digetx@gmail.com>
 <20200917113846.GX3515672@ulmo>
 <CAHp75Vd_B9WLM99LnN2YiZ045z8SUkD7KwY2wVEUeQ9Mx7fg5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline
In-Reply-To: <CAHp75Vd_B9WLM99LnN2YiZ045z8SUkD7KwY2wVEUeQ9Mx7fg5g@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 04:54:28PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 2:38 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > On Wed, Sep 09, 2020 at 01:39:44AM +0300, Dmitry Osipenko wrote:
> > > Use clk-bulk helpers and factor out clocks initialization into separa=
te
> > > function in order to make code cleaner.
> > >
> > > The clocks initialization now performed after reset-control initializ=
ation
> > > in order to avoid a noisy -PROBE_DEFER errors on T186+ from the clk-b=
ulk
> > > helper which doesn't silence this error code. Hence reset_control_get=
()
> > > now may return -EPROBE_DEFER on newer Tegra SoCs because they use BPMP
> > > driver that provides reset controls and BPMP doesn't come up early du=
ring
> > > boot. Previously rst was protected by the clocks retrieval and now th=
is
> > > patch makes dev_err_probe() to be used for the rst error handling.
> > >
> > > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > ---
> > >  drivers/i2c/busses/i2c-tegra.c | 187 ++++++++++++-------------------=
--
> > >  1 file changed, 67 insertions(+), 120 deletions(-)
> >
> > This is tempting from a diffstat point of view, but the downside is that
> > we can now no longer validate that all of the necessary clocks are given
> > in device tree.
> >
> > Previously the driver would fail to probe the I2C controller if any of
> > the expected clocks were not defined in device tree, but now it's just
> > going to continue without it and not give any indication as to what's
> > wrong.
>=20
> You may print an error in the error path as previously. Since both
> clocks are mandatory (as far as I understood the code) user will need
> to check DT in any case.

The problem is that the number of required clocks depends on the variant
of the IP block that's implemented. Some require just one clock and
others require two or three. With this patch the driver is just going to
pick whatever clocks are given in device tree, but it removes any
possibility of detecting whether the device trees contain the correct
clocks. So we may very well run into a situation where the driver now
successfully probes but then malfunctions because one or more of the
clocks were not specified in device tree.

Thierry

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9oiCcACgkQ3SOs138+
s6HRLRAAqudWD8fZOoMwPwHlt5QeVrLryYwiP3koFDLCqhq7vF3gY8jr2HqwiQGg
Hf7z1iDwNdIzA0r6VsP03PnF7IwJD85xLMZedcvmDAxqVvVJzb+lEfQnY2ECeOAb
vKZI+XrAnXoksC4pAPYBzrfZpx8Sc81AMEUK6T9nhhc6UC3i1xfXsmPFdZx1S7wG
qsKAjFXzgxLFQ6rfdEUnuoU+vunl6K5f+fHAl9fHbNt2dlAjdvvcm3uT3D4cgbly
Bo7qtaqg0Zl5nJUCg0bdibW5y10Ea+3JqH0+O1MvZMMQk5oX42AZktoWby34sDEX
lM3TcFj6gDmdB0+PnKlegkH5M3MfxLAiYaAgs3gIfGlNnPWpX0LmDN+LEVQavZzp
S7aVSqY2tLplNLLyCiFd2X1kEAimkSqbUUxm+9BEANQww1Ib/LlHda42aMDEMjQL
mawgAASVt7I0t0e0r7/t99opEHETFlJAn+2G/HDx1Xpjio08ZYVYiIqzGB31jKFz
CmJqVbqAOuJSFb7ajiDE890T2XGMNOBj3N4TVjRi7BzBBEL6bk0dIS8g6hdVNiU4
IbcQzDt1ZDYE4rN7RSThJo/BhMc/PCNSoj2xZehiw2pjij+q9nlJnD9SUyT5ceSU
kItzaiXbL0QjsN3nIOxlh0+GIIX/UlvEDAIIN0j/NYvcWSDQmIY=
=9ExH
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
