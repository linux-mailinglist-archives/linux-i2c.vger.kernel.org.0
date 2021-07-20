Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60CE13D033A
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jul 2021 22:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbhGTUEf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jul 2021 16:04:35 -0400
Received: from sauhun.de ([88.99.104.3]:47718 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237360AbhGTTtk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Jul 2021 15:49:40 -0400
Received: from localhost (p5486cc6d.dip0.t-ipconnect.de [84.134.204.109])
        by pokefinder.org (Postfix) with ESMTPSA id E80CA2C011D;
        Tue, 20 Jul 2021 22:30:15 +0200 (CEST)
Date:   Tue, 20 Jul 2021 22:30:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [GIT PULL] at24: fixes for v5.14
Message-ID: <YPcyV6HAKV4Vzlzx@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org
References: <20210705093314.20322-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wHR8a9E9sxZ42SfM"
Content-Disposition: inline
In-Reply-To: <20210705093314.20322-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wHR8a9E9sxZ42SfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 05, 2021 at 11:33:14AM +0200, Bartosz Golaszewski wrote:
> Wolfram,
>=20
> Please pull the following fix for an issue that was raised recently on the
> list. If multiple eeproms would have the same labels in the system, the d=
river
> would refuse to bind any other than the first one.
>=20
> Best Regards,
> Bartosz Golaszewski
>=20
> The following changes since commit 62fb9874f5da54fdb243003b386128037319b2=
19:
>=20
>   Linux 5.13 (2021-06-27 15:21:11 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
fixes-for-v5.14
>=20
> for you to fetch changes up to c36748ac545421d94a5091c754414c0f3664bf10:
>=20
>   misc: eeprom: at24: Always append device id even if label property is s=
et. (2021-07-01 18:49:37 +0200)
>=20

Back from the holidays and merged to for-current, thanks!


--wHR8a9E9sxZ42SfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmD3MlcACgkQFA3kzBSg
Kbap/g//UOXuklDtNMrYRLYVE1v5MpqDK8Aw3gwtq6B+42vRxzeSQwQiD5GK6MuD
6/vbLqbdnhgHUxCpTUfn0Czt0Xt6Et9DMFgfLKIE2X09zkjX0jTn2ZAFNAsC6ier
z+NZ40VnGdPXOg1TEK+CHUFVTuxPS8cS6DDaevDMS860JI0DRfEZ6sQY93Nq7pUg
fSqpQtkZfVQqg0HZ6U24QguhAZEetVuc8Fs0fKC8lFA29LykDbj1OK/dvNXNeMX5
dtpART6MFz9QH+Us9M4fA/9zXgFaJTEauL/VdarxRnTxF/KsJKzu//MptPnFums6
n+sodQfEp8HLuTC3T8VoXIRHFlcOBnavQ5mf4wsAccTnw/7I0/stNab3M133NI8a
qgGoiX/kW2hDugSRB6PGKYbWxb5L7Ssa6+UdoK2hyJCA+ud1sOTrJEQ160IUcWqF
2krk87mn5wDrxUoKq8enV8Bt9t7SNcVqoH6hp6dbXZaH0UQyEtp/JNxju3S6DjI8
DKipK4ouGI/5kypbGeuDqt/ppzL1C8LTV4kzmXQo7/BmvgOdsKJuykqfW21zDBRz
Ti/JVbCff4KOpXfwSAr/66a2f2lTbAGfajylmRGAjXM/MDIv3Cx26VwCmWdeFKU8
XdOrQqHJ8kT+FBgsObq7c834jfMxmOw1n1SLY2HJzIy0hy9HJmI=
=Ni0o
-----END PGP SIGNATURE-----

--wHR8a9E9sxZ42SfM--
