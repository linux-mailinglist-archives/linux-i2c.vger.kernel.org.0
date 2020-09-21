Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D9A2722C7
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgIULlE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIULlE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:41:04 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E575BC061755;
        Mon, 21 Sep 2020 04:41:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id s13so11787938wmh.4;
        Mon, 21 Sep 2020 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xIc63N2vBXLRvgf8EopXgjghKJ+UG6gCroB4GgmxgNE=;
        b=MOuFR+IQbBZA4dtVp9EIk16lUdBFMGiUt8GFPGCGHbKxjmle3h34AMbEmfPIjqTdpk
         SuQaVeVm2jmL1d7FdEj/n4xc8ypfEJ1Z35zjFI1mS0YTstGA5LAmj8Qc+rGFWogno5Ky
         iovaA2nsOdWLhgw/xvpYqyj5DkVYvapBc7N7FN+SEsWiY9r3q8Sq8dlbyJ9XskXOVxg4
         cr0S1ETuSIQZy4opzCLy+JegVvs9A4ANn+P0M/M5WueKa28zZX2szP5QG/tHOXz3ga3S
         w18tlitfrgqDRYBs+WJKlasXZ3QrvJhooj0bmWr+Wa3NNStO1LgZAWGuTSAwLGt6WYgi
         t72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xIc63N2vBXLRvgf8EopXgjghKJ+UG6gCroB4GgmxgNE=;
        b=CaO9kM5vCGkweRq1RW0mqdjoX/Cgq0IuVTM4Zjt2otjgk0oyz6YGnMzlMlJ7Zxxgb+
         Ujpz/BNLe1NmkuHty4zuLi3ahhXMXi+RhjWmBbgPYbGNFjP3V+r73spu/dXfN2/y137J
         C7fULDy0Vs9EaEjB2vBPFLhCI8ZY0VWjB4tTEP1HJmm0hjTfDC64ut8PVP8oJidQDXHG
         zHOyXKMaClaFPcC5bKe/jXyIecIkDBPNHnqsy3lKaqJ5Xr5XGmSdz/86Ki23U21GAFgZ
         7R0FbY/mWJBs+eVPIXgBHGOFdRfpEVs2D77FomLrDH24zcoO8rJF+MA5b8fdWfwP9ywJ
         zj9w==
X-Gm-Message-State: AOAM530zSPaHexVSHCUf9zOEQHHuHi04UL+O3ADxzyTUNVmQQwf+1N5z
        gOovDbOpV2pjiL4LzYuy7rw=
X-Google-Smtp-Source: ABdhPJyhwW61iosPZm1tOLN+J8qbND1CyFWDXnFrK2KyF5zNV9OIHDe5p2wMtyDt1KyYyfnCG0CjIA==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr28082422wma.41.1600688462468;
        Mon, 21 Sep 2020 04:41:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c14sm21095112wrm.64.2020.09.21.04.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:41:01 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:40:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 30/34] i2c: tegra: Clean up variable names
Message-ID: <20200921114059.GM3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-31-digetx@gmail.com>
 <20200917122105.GI3515672@ulmo>
 <49498b9c-3b75-ad97-1859-5d6442b27b0c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bPrm2PuLP7ysUh6c"
Content-Disposition: inline
In-Reply-To: <49498b9c-3b75-ad97-1859-5d6442b27b0c@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bPrm2PuLP7ysUh6c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 06:43:28PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 15:21, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 09, 2020 at 01:40:02AM +0300, Dmitry Osipenko wrote:
> >> Rename "ret" variables to "err" in order to make code a bit more
> >> expressive, emphasizing that the returned value is an error code.
> >> Same vice versa, where appropriate.
> >>
> >> Rename variable "reg" to "val" in order to better reflect the actual
> >> usage of the variable in the code and to make naming consistent with
> >> the rest of the code.
> >>
> >> Use briefer names for a few members of the tegra_i2c_dev structure in
> >> order to improve readability of the code.
> >>
> >> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uni=
form
> >> code style across the driver.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 173 ++++++++++++++++-----------------
> >>  1 file changed, 86 insertions(+), 87 deletions(-)
> >=20
> > That's indeed a nice improvement. One thing did spring out at me,
> > though.
> >=20
> >> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-t=
egra.c
> > [...]
> >> @@ -1831,20 +1830,20 @@ static int __maybe_unused tegra_i2c_runtime_su=
spend(struct device *dev)
> >> =20
> >>  	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
> >> =20
> >> -	return pinctrl_pm_select_idle_state(i2c_dev->dev);
> >> +	return pinctrl_pm_select_idle_state(dev);
> >>  }
> >> =20
> >>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
> >>  {
> >>  	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> >> -	int err =3D 0;
> >> +	int ret =3D 0;
> >> =20
> >>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> >> =20
> >>  	if (!pm_runtime_status_suspended(dev))
> >> -		err =3D tegra_i2c_runtime_suspend(dev);
> >> +		ret =3D tegra_i2c_runtime_suspend(dev);
> >> =20
> >> -	return err;
> >> +	return ret;
> >>  }
> >=20
> > Isn't this exactly the opposite of what the commit message says (and the
> > rest of the patch does)?
>=20
> This change makes it to be consistent with the rest of the code. You may
> notice that "Factor out hardware initialization into separate function"
> made a similar change.
>=20
> The reason I'm doing this is that the "err" suggests that code returns a
> error failure code, while it could be a success too and you don't know
> for sure by looking only at the part of code. Hence it's cleaner to use
> "err" when error code is returned.

I don't follow that reasoning. Every error code obviously also has a
value for success. Otherwise, what's the point of even having a function
if all it can do is fail. Success has to be an option for code to be any
useful at all, right?

The "err" variable here transports the error code and if that error code
happens to be 0 (meaning success), why does that no longer qualify as an
error code?

Thierry

--bPrm2PuLP7ysUh6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9okUkACgkQ3SOs138+
s6E6Fg/+IRNaYSygkE1VNTF0PempWZTdU3ZFrdIlkRTIh6JS3staq1FrhXFtSJ32
ElYWEVT24z/pXjtdk97S4FgcjR/eKR/LX09ryfJT2+npnM7PZvKKOi2703H8CA32
E4M/EcRiq2CBM1d/yuNM9rF7gKbG6qAL47Hlkg3KrmCX90MqP7mIi+O/AlhjUArA
ixn/OqN4NQUsJaW0VLg58ha3xioZ1oZ2Z65Ox1d5OWizlD6/D5YiC82ErqfYGUbG
U3z+ZazBCqmBniNEIypMDcSe5irlMDKu12fAzmzGb3AXN2LBwWR9SrtKlHsFY26Y
Zl6t4quPJiq+MVQT7mbV4siUgwwFxQywvSM77a/cYalT0H4ebjdDPT237Hs9ludQ
tKciRDly5NKbQRftGJaPzvtyz8RnNe++61ERaOXg9Z3VbZnhO8E7MCADiH9nDmiI
Z28+JYm30dt347551W4EPmhdRl+EjJMSiIT3z2Getr0w7SflkTxcfNxvNocFmK9a
a8niadwNbIgsTJxMDlZAFq3Gbq5Ket6o4mCjv2+SnmyGYz3jgDfmPU3b1FdNlkWV
WitovATWX0xiCZ63n6fWcK/4CTIaW2oxeqqOAr+F7Xy/NSn5BiUac094tV17f0V4
RNyGyw/dd0io4SVdIRdKYeEzwS/Yw9uuNnDiN72VHZYrfTspOd8=
=QE6A
-----END PGP SIGNATURE-----

--bPrm2PuLP7ysUh6c--
