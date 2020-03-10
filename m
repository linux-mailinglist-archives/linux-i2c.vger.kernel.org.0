Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C10AF17F359
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 10:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgCJJTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 05:19:38 -0400
Received: from sauhun.de ([88.99.104.3]:46356 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgCJJTh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 05:19:37 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 36CBA2C1EB6;
        Tue, 10 Mar 2020 10:19:36 +0100 (CET)
Date:   Tue, 10 Mar 2020 10:19:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] i2c: powermac: correct comment about custom handling
Message-ID: <20200310091935.GB1987@ninjato>
References: <20200225142613.7169-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <20200225142613.7169-1-wsa@the-dreams.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 03:26:13PM +0100, Wolfram Sang wrote:
> The comment had some flaws which are now fixed:
> - the prefix is 'MAC' not 'AAPL'
> - no kernel coding style and too short length
> - 'we do' instead of 'we to'
>=20
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Applied to for-next, thanks!


--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nW6cACgkQFA3kzBSg
KbZo7RAAlKU05fSDBuu5f+b9c5Ayd8ND1JVgOFlLm7CrMI729HVJSnWoPYJA53hr
IzunFX0sVieS4TF3UAG4yePmJ1ZQ+vdPnXR3LrhqSBQTCKVGEogvHF8sI6AsESkg
s+4G7b9sWdgsU6dcVbpOyze1tH694TK2I0h581cMMSnCXyoSIQcVHRr3Oy3QfeQF
vYYRv6Ew+Ag5dkBGIoqbCm0DHvLzaU2CI5Ni3cIADUmHZ8IRU4rhR04Cj29TT3jt
dKHEWybzfJO01GFMa5vlvRfgE5bTlNlM7z3bmj+7QZO/F6GvqH7h0sl/tLBgGoRU
ALoT0EkjttmnzH73bMwDt/WKWMSR8wnJs1Mp9sEPnefraBvZBSRDydz6ZynT895P
s6OtWv7QdfuOnktj+zHxYyduVHSWh8U6QS+kPRls5KV5ohDCSpomAHOnq41RMvk5
JJFlPxivN17td07xM2Th9Vd4uO+iNEvowIKjzTcFRzm8K8JZ1Vu55Bc6liN9dpIb
yJl9OSHKO5q60b0s/OMgUqmnGdGesELnnr/w5OqO7rdvWlnxuW+XIrw1ZGubKGzq
6+vXbuXcXIFzZiYc4TDvAlTvkcFp5QCHRniCcrXSXUhCJlNUJvqmxi1jpFzR92GC
ekniJBTj/ZNmbtGCtg8GUz/s1TWhYICTmmzFGOfhHfGy14Ne5f0=
=2z/6
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
