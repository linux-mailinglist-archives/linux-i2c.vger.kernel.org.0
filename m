Return-Path: <linux-i2c+bounces-889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D288191DF
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 22:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D74011F2356B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 21:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3E43B187;
	Tue, 19 Dec 2023 21:03:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA5E3A1AD
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 21:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (27-123-142-46.pool.kielnet.net [46.142.123.27])
	by pokefinder.org (Postfix) with ESMTPSA id DDC89A49C7E;
	Tue, 19 Dec 2023 21:58:21 +0100 (CET)
Date: Tue, 19 Dec 2023 21:58:20 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24: updates for v6.8
Message-ID: <ZYID7D0irShQRonJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231219145737.30325-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mRBQjIK9exWVMWWQ"
Content-Disposition: inline
In-Reply-To: <20231219145737.30325-1-brgl@bgdev.pl>


--mRBQjIK9exWVMWWQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 03:57:37PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Wolfram,
>=20
> Please pull the following changes for the next merge window. Details are
> in the signed tag.

Thanks, pulled!


--mRBQjIK9exWVMWWQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWCA+wACgkQFA3kzBSg
KbYPag/+K0XicqJ9kL75st03125p1zVTVlWpc6XoibK62M2jNaKXC5etuAQ/bNC7
j8Uq+wP3ZOAw+5x1+knmu3B0VdfyyM9SO6ee5p8NwHKCHk22/DOJcB2HRN7bRpQM
pj87eiZWufNKlOFLkUbKa2uGpWQlDnnCGpXjtnIBwQEj5xRFqb7wPW2qFXJqvqe5
gjNiT2wUgeYm0CKhkrRDuZ7I8IaID3xptrbk8PG3kx0HTDtxmxoPQimlgsVvheM1
jcMe42Oeokh/8cK+zpCteBgKzYouC95jcxvbz8XwPMvPmoQoUuWicYqwWM9J+m7a
gan/q1rKY0LYIJbziI3jQcHIXkiqVRgHjGyLa5ybXQpLF9yzMyuhLex9hAyigQUb
z5kCmsi02yU7Idemg3yUdkMZtybniJ2bjpEK/CDC+ifv7eZoS5qQOme2BozgLmmF
vbbkMjUuV151iu4d44rusKaNYn1dCK7Uwtpsg4oGjfvfhyAJHKKvPACwcUner9LC
QrS0ni24tvWQWHK+PVMpB9XZ2EyRAxr7wBRFLF/sFaqvuD0HUVRzHsQDWCJVVxeU
U7ti8Q1Vu6sA72BqDGZCbGEzSUOGvcRl/WXxHXwEZ1UbPW+9xOMVTZA6DI/uObJC
+cTz4WIQTV0hAID0wr7wtWWoc2znlde9dXu2HMI4Hbri8ve5PEs=
=0lb5
-----END PGP SIGNATURE-----

--mRBQjIK9exWVMWWQ--

