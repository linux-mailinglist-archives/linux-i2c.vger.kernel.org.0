Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F7A22CEBB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgGXTgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:36:38 -0400
Received: from www.zeus03.de ([194.117.254.33]:55936 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbgGXTgi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=mFPNGxnSoQUdb6k/VzG0fz/rutu6
        dTuAHUYpm/qxMqs=; b=v/Zrt837fn9ovjusIoYahQIybEM8GANvNGOpwv7cd4vO
        C7RRvJG/dSKd8IsuUcOx74ymvyw2dWLZ8LYLD70KqqTmVrlSzYptlSRSLKsWFl+0
        iho2L4Nd9KQPI+I7gDJVd9QlXNNb+2beAxt6fAs0ire4bYSalxVLVZmuTKo7INs=
Received: (qmail 3783945 invoked from network); 24 Jul 2020 21:36:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2020 21:36:36 +0200
X-UD-Smtp-Session: l3s3148p1@1flQFzWrsp4gAwDPXwcRAJKYSnl1dekZ
Date:   Fri, 24 Jul 2020 21:36:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH] i2c: add binding to mark a bus as SMBus
Message-ID: <20200724193635.GC1227@ninjato>
References: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
 <20200715203843.GA776042@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline
In-Reply-To: <20200715203843.GA776042@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> > SMBus is largely compatible with I2C but there are some specifics. In
> > case we need them on a bus, we can now use this new binding.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentat=
ion/devicetree/bindings/i2c/i2c.txt
> > index 438ae123107e..d1f8cf3bd236 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > @@ -77,6 +77,11 @@ wants to support one of the below features, it shoul=
d adapt these bindings.
> >  	this information to detect a stalled bus more reliably, for example.
> >  	Can not be combined with 'multi-master'.
> > =20
> > +- smbus
>=20
> This is a boolean?

Yes.

>=20
> > +	states that additional SMBus restrictions and features apply to this =
bus.
> > +	Examples of features are SMBusHostNotify and SMBusAlert. Examples of
>=20
> Do features need to be enumerated separately?

They could be, do you think this is of advantage? For now, we would then
need "host-notify" and "smbus-alert". Maybe later things like "timeout"
could show up.

>=20
> > +	restrictions are more reserved addresses and timeout definitions.
> > +

All the best,

   Wolfram


--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bOEMACgkQFA3kzBSg
KbZ8LxAAsQVic9wW1K+JiiY5IUC/9AEZNfjH9v02Kc5eTqm4Ib6Kg++h4Csv7FVp
hzRn2gOdgbM84Ea7pyWPHWe3+n2pEjU4F3yuRmMBV8+8A2A3vz1nhJvzaayfIV2t
L0yrQVJfY9AUUbyZZ0mxPUuHe3+SYv1usKhgpvJhnbx8bqeZfFhTpkmfzDTZVExf
psl8PWjJo841vFzfyxiqn4kqNUg9k9IqZDJpPql1nXUzvhVeURG9KHyoG6owUEDH
4pTM1rNYZt9X7izrGmj9p0VWOXzQQVtafqPVdK/mcThuaKi36Tragwl821ReA3vK
OBNMeneCmc6T55F7SFPLzdC/LW/WvgaXxBrPkjmVIK7K/KRwea+Jm0Ky2Jo5UGfb
Gw6kov9QrQ3EJKmwZyGnMOAiB7i03M4W4bQTmFBKzW1jmlHUCaPh+pQeGXqVCY/u
6xAkTEujNIUlyVXUQYQJQG1hkKFIfdSUVtJkCkCnc/wXtXvvnMiWNLgt6LYIwt9o
PEyw+hzjBbZOnMK0+SutYEyAQ/yGjYrDhBeK/T/vkEFy27WjWCaR0v8SqgYNY0Dm
K9egVpxhaEdedq76lKG4LKABzqDR//k59s5P1yOQuyL6ciBhDyURd1c1uF4XEtvi
CxyHoy065TEzITzk7MMt87Wvo7jADfko/lMYrHLDNacI7EAr7l8=
=lFJs
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
