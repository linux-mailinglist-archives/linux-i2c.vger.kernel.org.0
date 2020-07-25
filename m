Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485A022D769
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 14:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgGYMHS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 08:07:18 -0400
Received: from www.zeus03.de ([194.117.254.33]:52370 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbgGYMHS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 08:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Hq9VTuxvTgUiG/fMilb0aDzAVfOZ
        B5oiRS54tXxoln8=; b=pQ/IfYaDksx93wicx6OOK+ilKI2AJRA/BID9iAKOUKmH
        th9Oqf+iHJkPaQAOxlnW0k8x0DZz3PCOedpaGtHtcDLx2C/R/ul5C+r1j2r4jk6A
        ffaY0gvAFfdsKyCrM7tQAL4muecCuiiJbpV8FPAFeRvhZC2qr3XJutUawYgSqPo=
Received: (qmail 3979851 invoked from network); 25 Jul 2020 14:07:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2020 14:07:15 +0200
X-UD-Smtp-Session: l3s3148p1@61Uf7kKryqMgAwDPXyGYANurB2J6Dh5y
Date:   Sat, 25 Jul 2020 14:07:00 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH] i2c: add binding to mark a bus as SMBus
Message-ID: <20200725120700.GA1734@kunai>
References: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
 <20200715203843.GA776042@bogus>
 <20200724193635.GC1227@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20200724193635.GC1227@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 09:36:35PM +0200, Wolfram Sang wrote:
> Hi Rob,
>=20
> > > SMBus is largely compatible with I2C but there are some specifics. In
> > > case we need them on a bus, we can now use this new binding.
> > >=20
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >  Documentation/devicetree/bindings/i2c/i2c.txt | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Document=
ation/devicetree/bindings/i2c/i2c.txt
> > > index 438ae123107e..d1f8cf3bd236 100644
> > > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > > @@ -77,6 +77,11 @@ wants to support one of the below features, it sho=
uld adapt these bindings.
> > >  	this information to detect a stalled bus more reliably, for example.
> > >  	Can not be combined with 'multi-master'.
> > > =20
> > > +- smbus
> >=20
> > This is a boolean?
>=20
> Yes.
>=20
> >=20
> > > +	states that additional SMBus restrictions and features apply to thi=
s bus.
> > > +	Examples of features are SMBusHostNotify and SMBusAlert. Examples of
> >=20
> > Do features need to be enumerated separately?
>=20
> They could be, do you think this is of advantage? For now, we would then
> need "host-notify" and "smbus-alert". Maybe later things like "timeout"
> could show up.

I also recall now that I thought that "smbus" fits better the
"describing hardware" aspect, i.e. "this bus is an SMBus and not I2C".
Enumerating features felt more like configuration to me.

>=20
> >=20
> > > +	restrictions are more reserved addresses and timeout definitions.
> > > +
>=20
> All the best,
>=20
>    Wolfram
>=20



--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8cIF8ACgkQFA3kzBSg
KbbmRg/9FBgAHudWFccM3bFISmt0oQlevbT894j/nHd8u8MU1JW9oj+G3VWzBRv3
O5Bk2pgueRMwcJWcQGTmCYS/gCKgq0OzG8bX4YVa7+1+uoJJbph/t+Gn+QyETk8l
PUHK0w4zk5IAVxgbaN50E+hq+/X3jkrhq9nEe9MIdrGi93CX9WoSrUGydl1zf25D
eUkttUakrkCYicglglSw1hbkc/oYNXCQ5WdJtCODG4OaFxPwhVoxOkCcoG+jcH9Y
k6af9IlFnNbv3loppRdJz5CRAJ7A5vGGLSsurmvXXN/Zjh4cv2jZIHucswW8/PyV
5cCpxdUIMKinyhdaCxIirx1DsxexkKba5NP/S7lRwIWJI3k3/bmEbGTmJ2qEGxVA
gkdGklWSiShETZ7iA+Y80kBmi52nI8qW0943U6gsmkkgvOCEHnSxIC1P7puw598b
lmJ8EAsioxz1OU9qS+Weppw8f2g7V56mmcSzgB+l/xYAdim7E3oQTXWgh3HKYG5S
+ZXbw1RXC6cDZQjiJEqw+Rtr4icbz0SVgVwb3mgRYS2IbhrD5qvbn+PCSOoSL+vL
DEwqVq3WUXYYRq1Jpjip4s87IuJy1NBXGfbDr0Zu1Wk73VpfhRVV5sjjzzUOgitf
qzIAZjMzHIbnSPdR9ZGtZZSvuwcFbPoDRFpo54lvMxb7j0f42kk=
=8DcT
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
