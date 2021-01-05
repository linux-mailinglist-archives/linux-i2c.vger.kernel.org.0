Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7C02EA874
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 11:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbhAEKTB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 05:19:01 -0500
Received: from sauhun.de ([88.99.104.3]:41202 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728905AbhAEKTB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 05:19:01 -0500
Received: from localhost (p5486cfc1.dip0.t-ipconnect.de [84.134.207.193])
        by pokefinder.org (Postfix) with ESMTPSA id 9E3EF2C0A03;
        Tue,  5 Jan 2021 11:18:19 +0100 (CET)
Date:   Tue, 5 Jan 2021 11:18:19 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 2/3] i2c: mlxcpld: Decrease polling time for
 performance improvement
Message-ID: <20210105101819.GE2000@ninjato>
References: <20201210165113.6130-1-vadimp@nvidia.com>
 <20201210165113.6130-3-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline
In-Reply-To: <20201210165113.6130-3-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 06:51:12PM +0200, Vadim Pasternak wrote:
> Decrease polling time 'MLXCPLD_I2C_POLL_TIME' from 2000 usec to 400
> usec. It greatly improves performance of I2C transactions.
>=20
> Reliability of setting polling time to 400 usec has been thoroughly
> validated across all the supported systems.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to for-next, thanks!


--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0POsACgkQFA3kzBSg
KbZfUA/+KWkCa48+/fz20hDNivG/aW5j6drh5c6LAdXv+x4SHvrrxcmFERuyRG2A
hxJT3fFg7RD9/WE1OqB1jSgEJqLdgkZNmQMGbNuQp73fmLj/VJ9BLKHLnqU0fl8u
nVcEOTkT+LifnkDKZIp3MW9ULF1dLvF06TGY7haq9IOq7lW6pLEGOGjuW+6SEfxH
ELzL87WRfHgYpcVWZ1FT4xNwqqwFb5jiHgKwXjRhpxFLvFYyBMZkRL1qyqZOnfO/
RCi+tLwDemY6SaPS1QYPjF6nBloUJXnRg+xBc75/BXLpebwEghwrOeEZaMSyYHgx
fGxTzq6XgAKZGawAgdT3/Ilh6qMJ0B+WvpwpnkCkD5sr12foFqwi96M1dvfBPLHt
3xkFxzr0VtPMW+8rEvl1jHBQHuByLlOgRMrPjlYQMHdrHsP+iMoUvyA9NeDjazQS
vfJtyPuCcVBSbV1qEw1PUMq1iwgD0hnvB9FKhCZhGE8hH/Ckp9nUck+TlWjeJKv1
71PYdpZ8siMFHMEOUKD7ZMnl/W1jQqWPd/C0wtKKMvbHfzmaC7Yo5Csc7/vNLrZF
io5b7ZwKyFAj/a+s4ex362GQowVlo6Fwr1llNPgoHImtu0xN+85vxk2HcBYLmA8L
SLfONH9ACz8uFZjZpIQNjwlu6Wmh+l6bS67okVXKkhSNHM3qAjk=
=Oi6l
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
