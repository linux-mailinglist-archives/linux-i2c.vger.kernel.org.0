Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298701CA85C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 12:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgEHKbg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 06:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgEHKbf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 06:31:35 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F32C05BD43;
        Fri,  8 May 2020 03:31:35 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k12so9657814wmj.3;
        Fri, 08 May 2020 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kg9aP8gELD1tNocvYdrYcsSzaO8zSwVtNduIivfB63Y=;
        b=i44txd9PduGXa3reuzSrKAJdn5RJqgHsFJme1wTBn08a2MEclkQ0NrGo6T3TcGJavd
         JH1VQFbujwq+M/OFGDZBpv7GVRW/nw/18FgzdB/IC89FHzBj4qkcTiy3g5n2RCNGZF9J
         jYBiG+m8Y0CnzXqd9M4gqAasKQJii6hF6efjlteJro7Qwaju6esnkiFxCOLyCdqmKCL2
         tA6WFuqVA83tTmj18T/2eBtvI5PK3dNv7KAT5KutYTYrajCiDdd0ZyMbhKeknew6C8+c
         EC8daoSStf7LdpvzuNsl0h3Zt9g+tTpgp8u2N3mHOMNvIwku9PJH/BVc0HbHH1YE5s9s
         GtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kg9aP8gELD1tNocvYdrYcsSzaO8zSwVtNduIivfB63Y=;
        b=qYlp7cxHnsa7+LH1ey2Up9Pvbd7rStnVZ9cO30c3DjsQg7WZglgZ7DsSSKdUZq+LCU
         IZAsY0EuXX1eK+9B/v+BxRUr3J/3DPjgHb/RARFuPvjxH56M9xW7jhr5CI/LwhS4JD1t
         1WD9xxMiAjxS1Q+lYLi+E7ueOgtxQunTIua2QuTHST0L07/F1+qoJgicJGnH8K73K7NP
         qisi0aa8zuX/RhJbUMBne26QzrMoLaZoIbLfTSePUnvm94llicvfsQIiMLebEk6PksI2
         ++WodJq2Eu7Q1iptXKETe+rKLnnFrsMgjGKJgyZMWG2K+ImHbyHvPU8BkeE+37LepX/O
         iMTA==
X-Gm-Message-State: AGi0PubaDVb4hOat/sd9/BWAozJVzVv2UO02X4LWaa61Pf9wqvGq96QY
        jJIOHNYz70LdyxhH8GZHmkcBphyTrDo=
X-Google-Smtp-Source: APiQypJ5chONMw7Yk2G0XLHn5mlFVW4+lWcO/2MBSpFk/cWX+wKlrmna2Qh12UuIgYoFT90DwX4muw==
X-Received: by 2002:a05:600c:21d6:: with SMTP id x22mr16220720wmj.95.1588933894114;
        Fri, 08 May 2020 03:31:34 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id a8sm2288530wrg.85.2020.05.08.03.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 03:31:30 -0700 (PDT)
Date:   Fri, 8 May 2020 12:31:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Message-ID: <20200508103130.GB3030605@ulmo>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 12:50:09AM +0300, Dmitry Osipenko wrote:
> 06.05.2020 22:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Depending on the board design, the I2C controllers found on Tegra SoCs
> > may require pinmuxing in order to function. This is done as part of the
> > driver's runtime suspend/resume operations. However, the PM core does
> > not allow devices to go into runtime suspend during system sleep to
> > avoid potential races with the suspend/resume of their parents.
> >=20
> > As a result of this, when Tegra SoCs resume from system suspend, their
> > I2C controllers may have lost the pinmux state in hardware, whereas the
> > pinctrl subsystem is not aware of this. To fix this, make sure that if
> > the I2C controller is not runtime suspended, the runtime suspend code is
> > still executed in order to disable the module clock (which we don't need
> > to be enabled during sleep) and set the pinmux to the idle state.
> >=20
> > Conversely, make sure that the I2C controller is properly resumed when
> > waking up from sleep so that pinmux settings are properly restored.
> >=20
> > This fixes a bug seen with DDC transactions to an HDMI monitor timing
> > out when resuming from system suspend.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index 7c88611c732c..db142d897604 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_dev=
ice *pdev)
> >  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
> >  {
> >  	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> > +	int err =3D 0;
> > =20
> >  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> > =20
> > -	return 0;
> > +	if (!pm_runtime_status_suspended(dev))
> > +		err =3D tegra_i2c_runtime_suspend(dev);
> > +
> > +	return err;
> >  }
> > =20
> >  static int __maybe_unused tegra_i2c_resume(struct device *dev)
> > @@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struc=
t device *dev)
> >  	if (err)
> >  		return err;
> > =20
> > -	err =3D tegra_i2c_runtime_suspend(dev);
> > -	if (err)
> > -		return err;
> > +	if (pm_runtime_status_suspended(dev)) {
> > +		err =3D tegra_i2c_runtime_suspend(dev);
> > +		if (err)
> > +			return err;
> > +	}
> > =20
> >  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
> > =20
> >=20
>=20
> Is it legal to touch DPAUX registers while DPAUX is in a suspended state?

DPAUX is never runtime suspended and the dependency from the I2C
controller on DPAUX should ensure that they are suspended and resumed in
the right order during system sleep.

Thierry

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl61NQEACgkQ3SOs138+
s6GjtA//Q0nDwPEFe97oobpaRT2DP6tcG8oDw9mHJnLMqn8mNQr145SPgU0+lfCB
KM9HJz1OnKkyOgaCvnGOdWvb+dRD9embfUE1KPGA7/X3V4Hz9cmN1Keto/8JqlQ3
Xi+arMst7m3k930d2UFiH7HyAq0VzorCvkCzn96tLO5BctV/Y3VWcAIvo67tKqVX
mpjxYvd9YkScfrH1iaYBH9NvdLBCXZ/Env6iafAMHJB4+xr+UpMq6VotN2qJ0uny
EkSxyfzc9+anr+T6+dDms//4X+xVOyOXbDHQUaqC9WZPRmDnmvRxnAgGLtWM/pIR
IHUjg8Nrz+mvlX4Nc4o0KJsMUPoyLhL5nP0dtT6QAcZUe7FQaLDF51UGIufPfOCU
Xhde4FJtT6T5GHlFTlm+Yu7L5InYjr9QWG4UK2apl/2KrEya5hB4wj43sX++Dcrp
HdvzzMjjsuXAcpS0Rlj7mdAvMLi9AVfX4fanyMz6aHvrINbEUvHWKbESrToSooOg
Kr2intv9VgaaaRDZFudc50SQsQCtuerD8MG7xS4QLQTPFsvextiObtdYK6IQSyr3
n1Fw5g8y89HJ7NeiofpjHdS/PCRrkS6GIw7iP63K8O4JJRLHFppccb1ojsvWsJDD
cVr2Y64YLYiU/0rcDvR+oYIikcSJA1kRIiDvSBW7OKMgEp5Pu08=
=rWk2
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
