Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6A6C190B41
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 11:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgCXKj2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 06:39:28 -0400
Received: from sauhun.de ([88.99.104.3]:48972 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727066AbgCXKj2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 06:39:28 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 5D60C2C08EF;
        Tue, 24 Mar 2020 11:39:27 +0100 (CET)
Date:   Tue, 24 Mar 2020 11:39:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: updates for v5.7
Message-ID: <20200324103926.GF1134@ninjato>
References: <20200324081253.881-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wtjvnLv0o8UUzur2"
Content-Disposition: inline
In-Reply-To: <20200324081253.881-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 09:12:53AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Wolfram,
>=20
> please pull the following change in at24 for v5.7. This time it's just
> a single new ACPI ID.
>=20
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v5.7
>=20
> for you to fetch changes up to 4837621cd61e6b81a182098889143c6c9a06b0f3:
>=20
>   eeprom: at24: add TPF0001 ACPI ID for 24c1024 device (2020-02-10 11:03:=
39 +0100)
>=20
> ----------------------------------------------------------------
> at24 updates for v5.7
>=20
> - add a new ACPI ID for 24c1024
>=20
> ----------------------------------------------------------------
> Markus Pietrek (1):
>       eeprom: at24: add TPF0001 ACPI ID for 24c1024 device
>=20
>  drivers/misc/eeprom/at24.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, pulled!


--wtjvnLv0o8UUzur2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl55414ACgkQFA3kzBSg
Kbb9qQ/+Kaj5u/l97n8Lg7nQLjzaHFAwcJvo6o8++sYzYFLuulKsO2uqvEncpS3i
106lqR7/G8KlARyol4DadP/t/9ezV7dGBgU8CQa/ymQe8ha1KCFk+8u5BHYPib+b
DRnYw6jmdR/uoDR/UsUBB+gcBQKbQzs+BUVAzz+0+O1asfaC/alg3eEF9Xp56GGA
k4tYgb0okfpES1wVg0Oh0DkvIZe/qe+q3Mls/zAOuD4k2jqSy6y3TXugFY4jZ4Pq
2ttEMm1kwtFLQHTyWvRYVJB8TIrLgoX8YKMNj5YEIJdpLrt+nE9CFGWYNMV7WTN1
89LQvHpO1tfktJBvYw6P/8Kp33QYD6iGNrYH+cDGvcZJJNA/w0QE73UPPGwMX2Uq
IqbOiHusp0z/CI4L5arVqPUhIZikWBU3TTHvXS98xd8qA++Q2lDJ/ypB1dAV7rcE
nTSFh6zXr2N7EaoT1KaPKx1puK9HEbvKuPdzPJkPHngp8qft96ewAJhC72R8npEi
v6W1fvzi/HAPj3D+rKSxVuqL7iYkOmh0C81yA7m1J50hz2moiITwEqSAhRlWGdEU
uQuuWmnfxxb4XwQqQgEQI0hdonC6e2Th2NQWKxHUhdqGtih5jI257J0yaStpz4JY
prn/ME5GaEPPAQuVdVU+9mXNhQD1Mi08x4bdYaQ6WY8aDs+QeJY=
=1e6Y
-----END PGP SIGNATURE-----

--wtjvnLv0o8UUzur2--
