Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2914319A28
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Feb 2021 08:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhBLHSa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 02:18:30 -0500
Received: from sauhun.de ([88.99.104.3]:33334 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhBLHS3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Feb 2021 02:18:29 -0500
Received: from localhost (p54b333a8.dip0.t-ipconnect.de [84.179.51.168])
        by pokefinder.org (Postfix) with ESMTPSA id 539C02C04D3;
        Fri, 12 Feb 2021 08:17:47 +0100 (CET)
Date:   Fri, 12 Feb 2021 08:17:43 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: updates for v5.12
Message-ID: <20210212071743.GA1013@ninjato>
References: <20210210123919.20033-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20210210123919.20033-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This is a single trivial commit for at24 for the v5.12 merge window.
> Please pull.
>=20
> Bartosz
>=20
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e=
5e:
>=20
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v5.12
>=20
> for you to fetch changes up to 5366c48f327ec9e0261333a876384a26da91c854:
>=20
>   dt-bindings: eeprom: at24: Document ROHM BR24G01 (2021-02-09 19:19:09 +=
0100)

Pulled, thanks!


--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAmK5QACgkQFA3kzBSg
KbbArw//WqhGfMq0Bm5KdbSWk3K/ZuqvK0MYOFwsBT06FnXKjiGcdscsnE0dCkM8
vkMWZxIDTT4AFJLIOeJnSeBHa91joAemYHQvgwYD56pz4KTGydl660mU3L9fFfqH
5Js5/lAv1Za2+C2HwApZpWl378Gk1d/MdTY1TFMGFc0aZrkUULxhMB18yIwRiRKX
C3jewnrliWIUCSdNFe5l8QC5zCnPjS/5OYbdlbVysvP+Fgx3Gk08EdE5QJJYSj1S
sfrr/zrOdtsGw9Q9PPTC08aCr+xz4keyClKojYtckODcDR80LrPIjEh2DMSpOB1+
iFMSKbhoOZcbiHPhAT0J+KPV13XoUpK+JcytukBfewR4mR6ptOgc1NQJqgeiJV+0
ExJxS47gV/IsBkfszxAzfiHlQcMNKAgawIWyxUnXRVP4/3H3to7Bv0m2r6y/GHb6
AirUHwguvBnAnKaPFB7ZCFb5U/3vZilZ9MHbVNLSgcEZi3w6EyjsUnZDSN6fwMYV
ODsp3efOL1Zb7IlpIBbkoC7qxOHJK5LcnlrCJblhHW8yrgT/HH2racvAhPAVvq6c
nYFACwlXqcpKLDcGKohhHp9OfUmr75VnCigbg/oBWIE0YY8/vMF8dr3Kbx3/O/Zk
09dhp3myFK4OXnf+N00NJEbdfC6KqMXz2zh6VqigGKb/So23OF8=
=BLCz
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
