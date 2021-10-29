Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A4F440347
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 21:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhJ2Tgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 15:36:38 -0400
Received: from sauhun.de ([88.99.104.3]:37664 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230215AbhJ2Tgi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 15:36:38 -0400
Received: from localhost (p5de04e1e.dip0.t-ipconnect.de [93.224.78.30])
        by pokefinder.org (Postfix) with ESMTPSA id 802442C00AC;
        Fri, 29 Oct 2021 21:34:07 +0200 (CEST)
Date:   Fri, 29 Oct 2021 21:34:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [GIT PULL] at24: updates for v5.16
Message-ID: <YXxMr3X5Cs3zZnYA@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org
References: <20211021180413.8942-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O9uerB/dqyWQxpaD"
Content-Disposition: inline
In-Reply-To: <20211021180413.8942-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--O9uerB/dqyWQxpaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 08:04:13PM +0200, Bartosz Golaszewski wrote:
> Wolfram,
>=20
> Please pull the following changeset for the v5.16 merge window.
>=20
> Best Regards,
> Bartosz Golaszewski
>=20
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd=
8f:
>=20
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v5.16
>=20
> for you to fetch changes up to 7629254054820bead6e18f8c3ae65c2bb01a5ae2:
>=20
>   dt-bindings: at24: add ON Semi CAT24C04 and CAT24C05 (2021-09-13 09:28:=
57 +0200)
>=20
> ----------------------------------------------------------------
> at24 updates for v5.16
>=20
> - add two new compatible entries to the DT bindings
>=20
> ----------------------------------------------------------------
> Raag Jadav (1):
>       dt-bindings: at24: add ON Semi CAT24C04 and CAT24C05
>=20
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Pulled, thanks!


--O9uerB/dqyWQxpaD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmF8TK8ACgkQFA3kzBSg
KbZwMBAAg6jJQyxzcTOt9hfcVPZNrrP3PxtTSy4i7aulV2bKSt5LdQqR6DQhinK5
yb7nTSvx0s4XN9nQLDptkt8cebT75t7mj1rKsTqPPBCJ5BCPeo1R6jrHfB35GLuk
WBvzyUFU5R3nYdl1ONfac4mAGUOoLKrKqUoum/46vDwfb3ElWCgfoEnV5d3iWbDJ
wCZADpp6bhSDy8kHL23oQ5dWEneHACLFJnV4kx70Yc0KkKNNeeR18UfIpqk8PSL3
Cp6aKKFXl2gbThUlEYvEvZkO5kyi1fzEY4mfrzfkY7sKmvbcb+85233ybUs8LEW2
5m8g3g8H7gpqKe4rzq8FLQCJ6kQVVkQ6nBEfyu9uLbNkkDBCq6Gh3y2WtelaA5HS
kQEq8YGyOn45jlkpUSdIhlFaiEAvw5S0Red/AuAb3KqUHYLkVab/Ag9vn/RHtRhx
escS1H+i45h/v786uhTQQ2zJUnb/Y52MmzbSa0mjNkI9eVbEgDS/ZpNxTagrjqew
B6W7n9nUMAxun7w7Hv+QIKIIroKwJYXq1PAap8uLfKSsYyCVI3IQKE+Aiw1umDzL
jI32iKHB3KiLgmz9jZhBh0tPPg/ZQ5T2VLSd6S6QIy9/pExBAo05iNyl28fLf2qM
QmlFssZG6R6APoyXNhWR5aaAB/3Vry/jk59MAArrkYuAc3b3Ezk=
=I2VJ
-----END PGP SIGNATURE-----

--O9uerB/dqyWQxpaD--
