Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F483B7E30
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 09:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbhF3Hex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 03:34:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232842AbhF3Hew (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Jun 2021 03:34:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0665861D01;
        Wed, 30 Jun 2021 07:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625038343;
        bh=X5jXIi0hMbuYYhLNMM51uog9E6tkcBuqORflc5XFg2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aPbr0McAEcUcdU3AzaufW7YNuH2bB6WmHYBhquTL2LBmwNydMWFJk8glVBsFK+Gy3
         chVdUh2g+4eoFCLuB0asCmLrZ3Ym5PiQImcr6NaAt7d7D45lZMJ3lpT0oH9puFH/9U
         Yf+P3+0keERdsSmYl0aglEdoiJMLIxhXwNWYXztwCayKvjJcFa0/YXFRsBWiyiyVbq
         eYd700zUb2G/FaDMf83u1FBLl6LSMSaFqpcX7E6QgPSpGd7wbpzegqxeHpMo3QjKNI
         YsYwmirC4OvftrAG5siZNaAibPZnIOxcL+DvsTfYTHb0djCtkY64AKFoaWw7NC1BbY
         zzR49tfneWe1Q==
Date:   Wed, 30 Jun 2021 09:32:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNwd/t3DMKSOrTAT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
        Sergey.Semin@baikalelectronics.ru, rppt@kernel.org,
        loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <05cc9484-f97b-0533-64fe-ff917c6b87ee@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DWOH7naunSXy4KGH"
Content-Disposition: inline
In-Reply-To: <05cc9484-f97b-0533-64fe-ff917c6b87ee@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DWOH7naunSXy4KGH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +	snprintf(vi->adap.name, sizeof(vi->adap.name), "Virtio I2C Adapter"=
);
> > Is there something to add so you can distinguish multiple instances?
> > Most people want that.
>=20
>=20
> I find the I2C core will set a device name "i2c-%d" for this purpose, rig=
ht?
>=20
> I think this name can be used to distinguish the adapter types while
> "i2c-%d" can be used to
>=20
> distinguish instances. Does it make sense ?

That alone does not help. See the 'i2cdetect -l' output of my Renesas
board here:

i2c-4	i2c       	e66d8000.i2c                    	I2C adapter
i2c-2	i2c       	e6510000.i2c                    	I2C adapter
i2c-7	i2c       	e60b0000.i2c                    	I2C adapter

Notice that the third column carries the base address, so you know which
i2c-%d is which physical bus. I don't know if it makes sense in your
"virtual" case, but so far it would always print "Virtio I2C Adapter".
Maybe it makes sense to add some parent device name, too?

And if this is not reasonable, just skip it. As I said, it can be
helpful at times, but it is definately not a show stopper.

> > > +	vi->adap.timeout =3D HZ / 10;
> > Why so short? HZ is the kinda default value.
>=20
>=20
> Ah... I didn't know the I2C core had already set a default value.
> I will remove this line to use the default one.

Sounds good.

Looking forward to the next version!

Happy hacking,

   Wolfram


--DWOH7naunSXy4KGH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDcHfoACgkQFA3kzBSg
KbaBZg/+LebS2vtnOuXXL+JNLT4U3azGRQSOFDKdnixnyxF2Lqb/d3UeSrXYcvBX
oaOVkY0EvyH0/evazJmnI4AFXZIWgQ2ktXMeEqU+bnyERd0JjiQBQILxaAhCopzm
8JhJZBcfR2AINfOX81cqi7qMG/aqXeJh2JbyOujNWNhOApvnEHaooDwHYpVVRwet
YKg3q48kNJ/OaKjxeigHm9dMNK8inJ9Naf0HE5XkK43r+3irp49OXSFf9H1o8MXx
4uy8yrnc8V25RHl5FtfpWV07yonrxcrer+JZlwyUae1fpviYavUeCgPgdQ13e3zY
ysLA459SWIiwM+6FVgAXewQUqvBDp911j7N9+y1jDQ5n/IGE4TW2J/jzI1AjOfsm
2u91Rb1uH3mC5pUe5bMP45Yu+EAYG6/rDyMERKWM0qskZN8WKROTeL9U3grmKOlz
iVoPDggoriHtvpD5HDeDOA6QU9gbeiNBL1LCP/CiZU7a7JYG2Dp02O60pqXRDgCU
DujtkqALKOkw34vDTA08AYxpnPLnT1z4qbieFvptbo8HfFZ6V5mPMYzmmvKRoo46
Ez7yfghYktZzMP8LzWVjrDULTkJb2xN3XcEQGSlwaZx/B1Kco9u25E9W7LSnraxZ
0FzML2greL6BgA9Bjkb8yJSjBoCQrOp/hBi3k1+vItCIHbrPc0g=
=uDlm
-----END PGP SIGNATURE-----

--DWOH7naunSXy4KGH--
