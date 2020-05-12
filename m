Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919711CFBAC
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 19:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgELRKw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 13:10:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38922 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELRKv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 May 2020 13:10:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 2BE132A2240
Received: by earth.universe (Postfix, from userid 1000)
        id C90F63C08C6; Tue, 12 May 2020 19:10:47 +0200 (CEST)
Date:   Tue, 12 May 2020 19:10:47 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] power: supply: bq24190_charger: convert to use
 i2c_new_client_device()
Message-ID: <20200512171047.gyk6zze46ow6i3yy@earth.universe>
References: <20200326210954.12931-1-wsa+renesas@sang-engineering.com>
 <20200326210954.12931-2-wsa+renesas@sang-engineering.com>
 <20200512162723.GI13516@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tefe22k3doyhs66g"
Content-Disposition: inline
In-Reply-To: <20200512162723.GI13516@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tefe22k3doyhs66g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, May 12, 2020 at 06:27:23PM +0200, Wolfram Sang wrote:
> On Thu, Mar 26, 2020 at 10:09:54PM +0100, Wolfram Sang wrote:
> > Move away from the deprecated API in this comment.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Can we have this now so I can remove the old API in the next merge
> window?

Thanks for the ping. The patch is now queued into power-supply's
for-next branch.

-- Sebastian

> > ---
> >  drivers/power/supply/bq24190_charger.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/sup=
ply/bq24190_charger.c
> > index 453d6332d43a..4540e913057f 100644
> > --- a/drivers/power/supply/bq24190_charger.c
> > +++ b/drivers/power/supply/bq24190_charger.c
> > @@ -673,7 +673,7 @@ static int bq24190_register_reset(struct bq24190_de=
v_info *bdi)
> >  	 *   { .type =3D "bq24190", .addr =3D 0x6b, .properties =3D pe, .irq =
=3D irq };
> >  	 * struct i2c_adapter ad =3D { ... };
> >  	 * i2c_add_adapter(&ad);
> > -	 * i2c_new_device(&ad, &bi);
> > +	 * i2c_new_client_device(&ad, &bi);
> >  	 */
> >  	if (device_property_read_bool(bdi->dev, "disable-reset"))
> >  		return 0;
> > --=20
> > 2.20.1
> >=20



--tefe22k3doyhs66g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl662JEACgkQ2O7X88g7
+pq+2A//VuwHDZl3QCyXTOsEqiULP9UPbP2WhUE2b/J8/JRSx8/UeDtan1n8CG7u
JOGrFqxU3W+i7iy5xbY83FOtocw/4yocAAe50I9lJDqxwgns7nnfyMRGT28OHxEY
haAhxTBn6yxL/Ve2mhoW3oJAiR5b/FZ1BGczxkBj0iyzQfgwhrqgbrapAVUNFvP9
/Rc2WUkCQWEg/6Gr20vI7WQLtCnMINMN8VhU0W2d7YWLnSPC9OucWMiDSdocGLU8
zrb9FhrkaAfqqCJgn/Ze/REdal874SIFi1hy7lepSoOw1irnOCQpczIsvLerjr3V
Djpg2DHERhQsAKQAbPIugKbTUo98xylu6uxbCZCOTLCtfrMJb0mrwjA4b/C5gvlD
EahQcOLLalQJx7gKdmgVdFWfebopbVENF8rcyMGt1BVE4ws7SczEAHKow5g0L06H
aqVW6rgEF+fHfgaGpD6A2TIhv3EeFry1T9gcxaWZqX3M8aSqW7c1BV/y22/4tycK
gqml5/HCfLAD9y2KpcED5y3mHZuTPKOh5U9h07cy99atMVK35NhFGadEkauNgoUH
q09d8KoaqvWkofJf3o0I75OPetkHCpMx4zD1kYsS8gBhBWeSdaHv1/xyttW5jb6+
+h1HxszputoLIM5HpC5kiNgjWg40WNhRGQpEo/26lMbOtLJ+830=
=57sD
-----END PGP SIGNATURE-----

--tefe22k3doyhs66g--
