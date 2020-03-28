Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F6019637A
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Mar 2020 05:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgC1EDh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Mar 2020 00:03:37 -0400
Received: from sauhun.de ([88.99.104.3]:46618 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgC1EDh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Mar 2020 00:03:37 -0400
Received: from localhost (p5486CEA0.dip0.t-ipconnect.de [84.134.206.160])
        by pokefinder.org (Postfix) with ESMTPSA id 787572C1F87;
        Sat, 28 Mar 2020 05:03:35 +0100 (CET)
Date:   Sat, 28 Mar 2020 05:03:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     allison@lohutok.net, info@metux.net, linus.walleij@linaro.org,
        tglx@linutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: pca-platform: Use platform_irq_get_optional
Message-ID: <20200328040335.GC1017@kunai>
References: <20200326224422.31063-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline
In-Reply-To: <20200326224422.31063-1-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 11:44:22AM +1300, Chris Packham wrote:
> The interrupt is not required so use platform_irq_get_optional() to
> avoid error messages like
>=20
>   i2c-pca-platform 22080000.i2c: IRQ index 0 not found
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to for-current, thanks!


--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5+zJcACgkQFA3kzBSg
KbYgcA//Zpp/xig5704q/Ep9uojvbhSCw2gS2PY9qhGBcL8cdlHwhpdd4wQlswfX
oWG72RbZ/HbLoHpFBUuNaWp+OjohPUmSYJ6MyXnAOb3oALtGCtuMU36PPgjRJYkF
coh5sq7FaYEhkTMXpcVOAB+NyTJJCo/MKb8BJr1hBOmFPg4Fhzk0cg610YT0FCF9
IS+DIx0rkNKqziBhyxP5Fvh1kX9+xvJaRDFVh3xcmGAFiqfIjPpC3I3604bG845Z
hgaxt9Bp6kunj2WVIX0ATNRyLEjHi4qaJ6lSq9YW6/gTLvt8dW3sD8seI4fWkpGR
GoV39XgEbMi2DUIJ+bdI6cxOOdpA3vhOAhBzHt4zvGv2OOUI1DgIK0SoUh/nPmEe
hx/U/WoL5ku1ydIWKAxy/WLTC/KrcHalDUCe9GbJFFjP6bUD7l9xFb9lrQwmr5XB
u6n7p6aubZwEV9QN3DZObtxveOKwNxxkPJmOwfFxO6LAKbhkjd5d5/ZDz8g10sDs
cZirQAFFji6Vhui3L5gq18KdFLIc/LPYjIoKGeOAT9DHtxVSghXvLp8oahuJYlvm
x/My43bCKPpuvkSOjabRCFGYLutCXbHRnV4y803xdBgDfManUOAVzYR7zjeRtw+W
7mMoNxh9eNkSo5ERYWK5hgsuj9yFEiEjrR4WXc6xZxiTRoheoUU=
=ZWKa
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
