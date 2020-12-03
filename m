Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329222CDFA4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 21:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgLCUUx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 15:20:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:41830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgLCUUw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 15:20:52 -0500
Date:   Thu, 3 Dec 2020 21:20:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607026812;
        bh=FQJymvUIptWxInBICiSFHQ9esEcjv5dtNw9LyWpKfyI=;
        h=From:To:Subject:References:In-Reply-To:From;
        b=Ns9b5hxLCWH4ENWQb+LdRCMNzWI/jc3QIn83R0BYFd0LiRRl00iyYOaEUi0WUGs3e
         8zrGAbnwWlpK/ii9KBFevV1ivCev8rUnsUM6gzmWq5e6aHm77Xnbm2U2/vtf3v0PRf
         NB+Ewh676xr16o76pytWt2nWKrU3GwXg2pkpnH4jMJp3cODBZXHX39PFDaQAtIyGLl
         UWrFMrsU4rD5bhtGCOTKAfgm7bj6IZW2aqXPrFaBSFZhje9ML3Z/MRVvgSDpTkm8+l
         fa47bnsovz++2o0G2hbQwNzE56SRGeA6T1EVGMYxCFM7QuCTWXZ3v8dKL1SXXu7KO2
         Iy4Bl1P+k+hRQ==
From:   Wolfram Sang <wsa@kernel.org>
To:     Stefan =?utf-8?Q?L=C3=A4sser?= <stefan.laesser@omicronenergy.com>,
        peter@korsgaard.com, andrew@lunn.ch, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: Avoid false-positive error log message.
Message-ID: <20201203202008.GC3585@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stefan =?utf-8?Q?L=C3=A4sser?= <stefan.laesser@omicronenergy.com>,
        peter@korsgaard.com, andrew@lunn.ch, linux-i2c@vger.kernel.org
References: <6185f3fc-35ed-4de2-8bf7-fb991555580c@EXC03-ATKLA.omicron.at>
 <20201203201654.GB3585@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline
In-Reply-To: <20201203201654.GB3585@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Signed-off-by: Stefan L=C3=A4sser <stefan.laesser@omicronenergy.com>
>=20
> Applied to for-current, thanks!

I meant for-next (because of a dependency), sorry for the noise.


--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/JSHgACgkQFA3kzBSg
KbY2VA//ReasovekFVREex9FNoytjUeiG+sA2TtkDy6p0oe/sjumjPgTl2obUVk9
iO+N/ITF5SSCnP5ZXdXIHiL4m2BRTSWDPnVM9tgxzbXuNoIY8xy8W84mTDWN99U2
W9RNXMmFeojQFMjlL0jiLA0xuMd4sBkqREV3wgm0K25mLvXzj5fZNDpqjoKncRDs
Ezj4IQ8SDJp/SeqmhqMF6/Txu1QJmRfHjxTT56a4vcFHdL7ik9FCvwbRjIkTwtF/
+kf7YMky4oB8w93zI2UW3QMUWOFzfjQQSAXQHvJ2xCskkhb3D/Rk3RN0yYUnN9Px
rKxXWiRbQiNLqEFzL6cp5hEub+C+Gzwv27zS+XKNJeSELMyI9fCnn8ddwyMY6yqU
ZlDuc3gSABnGaBB+NKK3oABgHed3fhmBV0GmttWFTo7zp2b77O5DRiUcPIfjH1DC
ePqNmfVN2J5awgzUywhr1ubfXY7n76v02Eh8/GKDXgOznYrWKoN/MpwmO+7MREQO
7ZrvMDH3I5EDn9ZVKgiqOa9b2a/kWo1IxBlouc9bJha35nALb55Hy2Oy+K7s1vC8
/DfBfd53o5FfJKWBWMo0OafrFrF0kZeVa0GmbfLl7MRVFh7bD+y1+GzDhGHQtDyn
IA8sjMKroclsdSDtH+9Xmh1HEB9djZvSY0H39VreWkJvs0gezMg=
=FWy+
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
