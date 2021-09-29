Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748BD41CDCA
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 23:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345622AbhI2VJz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 17:09:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:43558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345479AbhI2VJy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 17:09:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C386C61462;
        Wed, 29 Sep 2021 21:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632949693;
        bh=8RfE8LObIehoOay7RuxzMwSriklUkd1h6TG0ki7LQ28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C7NWTS+/EqEP6uGJ4NwOETaP+26tLkOucCUNdnU1RDGptPpZqIkoe2xYd7W1c9Yd3
         1HoN9bWuC4fwQHHM+WisD+U/aurrwjsyxbaIgrTFculs+7Mu0/0GuQNiapyCKQMOAa
         6ylv/+kJ+U4g0AZG7yUWOV5XYZ1yfDWmR1eXXfMo0xEjELK4+WJ5Obai7uow85Fbt9
         +nIPgvDvIKQEse062EAkQ5EUG25yW4JxPBTXdvY+SPwoRLJ/71ahkCFGA6HYq9QqyW
         EXDR9tLzCNoQAAs9HC1n8njfL9laLYD5hhB/juubF8RQ/ecfhys7c+jTUb7b8kQNQv
         x5b7Os4ILCtBQ==
Date:   Wed, 29 Sep 2021 23:08:10 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Michael Brunner <Michael.Brunner@kontron.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "sameo@linux.intel.com" <sameo@linux.intel.com>,
        "mibru@gmx.de" <mibru@gmx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ingmar Klein <Ingmar.Klein@kontron.com>
Subject: Re: [PATCH] i2c: i2c-kempld: deprecate class based instantiation
Message-ID: <YVTVuufRQoZwP/Cx@kunai>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Michael Brunner <Michael.Brunner@kontron.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "sameo@linux.intel.com" <sameo@linux.intel.com>,
        "mibru@gmx.de" <mibru@gmx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ingmar Klein <Ingmar.Klein@kontron.com>
References: <823bd555e13a3c62be199d4e23c352a5535aad85.camel@kontron.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/V+eDJhj/KJ/bhCu"
Content-Disposition: inline
In-Reply-To: <823bd555e13a3c62be199d4e23c352a5535aad85.camel@kontron.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/V+eDJhj/KJ/bhCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 10:29:36AM +0000, Michael Brunner wrote:
> Warn users that class based instantiation is going away soon in favour
> of more robust probing and faster bootup times.
>=20
> Class based instantiation has already been removed for other controllers
> and it makes absolutely sense to do it for this one too.
>=20
> Signed-off-by: Michael Brunner <michael.brunner@kontron.com>
> Acked-by: Ingmar Klein <ingmar.klein@kontron.com>

Applied to for-next, thanks!


--/V+eDJhj/KJ/bhCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFU1boACgkQFA3kzBSg
KbanYw//ce3qRSiQefbKdk5YDnlVEnJrNa0aIzfPZfudFg7dFAh5urC8aPFk4zOr
sh00aARRR0nRVgcFS908rv2237EhPEFZH+l0ajhBeoE3Yw8mDHqvs2LHndWbIZdf
8Ntp0CiBd5BrHUYZ13Gb/uQdBLZ/lFGUgqw4TFEO9AoLc5NNhglF8Oz8odq8Nydj
2zA9MbYXLV2V/047ogpew2C/5lvERl1wY7m7LLX7sCb2RCXIBJe2WQnHqiNU3EtN
MOGMa83zYFIYy2+bO8q4r4te4C/VQajaEjKCHnx0cP8qgw/ui9HXGw6orLY2a9fe
sxeOzwurgg4nKjY7h9Ax4jj4Deg9bnKdjgJ3kHp758Jul1xP2RP8UP18Fe4sWMgs
AmxM/DTVmnGIAfi4xUEsI9Pa0CRVVqupGmbEOTnlUhT0lElVlfbMmpbwiqaL6Imy
qNc3B6M1HmYRmq5ZYsefGQ2Ztv0QvWvRFzniGAxnO+XDR6vHhTctkLVII9VBQPRT
zOvhPiayuA5mbgL3Kh2szA2LT4ygfIyzr3dciSkYvF0ZjghCw+I1JIjnWIwuUPFZ
hWoOkuL00YuaN1O+88Fn/KHYRjUhNgCN6POXgWGljjaAUlnZtmwyLVq0bzsthyAn
F5NIlm7Iih5Y7hiCajsXD2LvPA/jZKpfvS2PVndD0ddPAb5ADeU=
=VemB
-----END PGP SIGNATURE-----

--/V+eDJhj/KJ/bhCu--
