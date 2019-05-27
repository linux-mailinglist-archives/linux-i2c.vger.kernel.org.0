Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF1F62BB62
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 22:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfE0UUQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 16:20:16 -0400
Received: from sauhun.de ([88.99.104.3]:36608 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbfE0UUQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 16:20:16 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id AAA472C04C2;
        Mon, 27 May 2019 22:20:14 +0200 (CEST)
Date:   Mon, 27 May 2019 22:20:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Annaliese McDermond <nh6z@nh6z.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        NWDR Team <team@nwdigitalradio.com>
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
Message-ID: <20190527202014.GA20304@kunai>
References: <20190508071227.18609-1-nh6z@nh6z.net>
 <4174B26B-4E3A-4CCA-A5ED-BE62A3B5E66A@nh6z.net>
 <20190516075848.GA1033@kunai>
 <2E6EDCD1-E0B1-4859-BD75-EF411D3D4C6B@nh6z.net>
 <20190527191534.GD8808@kunai>
 <E711B8C3-85B8-435C-97FD-E62BCB88B679@nh6z.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <E711B8C3-85B8-435C-97FD-E62BCB88B679@nh6z.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 01:00:00PM -0700, Annaliese McDermond wrote:
>=20
> > On May 27, 2019, at 12:15 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> >=20
> > Regardless which solution is favoured, I am going to apply this patch in
> > a minute:
> >=20
> > http://patchwork.ozlabs.org/patch/1097688/
> >=20
> > It enables this driver for ARCH_BRCMSTB. So, the solution should work
> > for this as well. (I don't know any of these platforms well)
>=20
> I did some looking the other day, and I had forgotten that the RPi has 3
> of the i2c-bcm2835 devices each with their own divider that sits in their
> register space.  This makes me think the correct solution would be for
> the divider to be controlled in the driver as was in my original patch.
> Otherwise we=E2=80=99d have to make three different dividers in the bcm28=
35-clk
> driver, and the i2c driver would no longer work for other platforms.

I am getting more and more convinced of the original patch even without
CCF acks. Others?


--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsRnoACgkQFA3kzBSg
KbZ3Ig//bhLKH92dCBPaAdPCOobKJXl0WATDzHS3BEtr6DP1TTNBsUD5wBwUt7Rc
gsfQF+nupWjX/ZzIMLFYhSA3UPz3G+F0WfeGXlHPKU3AWaCworIXr19ueovykBsI
gF4JxmeWLIhjnogATB0ATUTPMiBiVtQYsfNjyzkTCwBNQaZKy8EKeSpV0Lo1pY4R
3We7Ly8uFMyZpI6Xa9Q39rhuEpP3XMEQ3ex346eVdkSFVsn/GtlW79yJcYPuE2iH
gk0HJarmM5UVuCQJwq2XKxhk7TTMc1cYLpWhRMkMqbR/7++WKjEX1ugSt/bSzyEW
4rhv5tTpErXAUngtr/v21eXVvQ3to0mffd181t2qmMJjdCivLrj46usB5o64LgRW
D/jvT6eDeTPpor7eGGfd6KJgzgLHDcEN/PB/61U0f82k31zT93flvZueZa12JO4R
9zTU4YmG4qwO/coflGIwkgytmFVoKakQAtCkuylH9YqhKay51scrlbvZtVTLn87f
Wy1H7cgotBXKQtA4NtOj20UKp0g0FTdT0fZBQlaCJeSsChEvjBR7y4xXvxl4sEQO
GCBwu4sGvqfueTi0bl1W4kuTJLsHQiw7uB2a4wtj6kFZ6blsolODrUyO6hkIM4XR
38nY4771iZVDSQHApx7VwIcmTEIsdVgrVs62c521ybNcbFV7ZH0=
=eW6M
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
