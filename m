Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C18DFFCFAD
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 21:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfKNU3E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 15:29:04 -0500
Received: from sauhun.de ([88.99.104.3]:44688 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbfKNU3D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Nov 2019 15:29:03 -0500
Received: from localhost (x4db7660f.dyn.telefonica.de [77.183.102.15])
        by pokefinder.org (Postfix) with ESMTPSA id E001A2C03EE;
        Thu, 14 Nov 2019 21:29:01 +0100 (CET)
Date:   Thu, 14 Nov 2019 21:29:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: updates for v5.5
Message-ID: <20191114202901.GB3058@kunai>
References: <20191113155803.20630-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <20191113155803.20630-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 04:58:03PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Hi Wolfram,
>=20
> this release there's only a small but useful change from Jean fixing a
> confusing log message for read-only EEPROMs. Please pull.
>=20
> Bartosz
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
v5.5-updates-for-wolfram
>=20
> for you to fetch changes up to 285be87c79e173f08af5e1a6417a106fb14934b7:
>=20
>   eeprom: at24: Improve confusing log message (2019-10-04 10:46:39 +0200)

Thanks, pulled!


--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3NuQ0ACgkQFA3kzBSg
KbaJwg/8D7XNIuJRZaXE/QyYDY5W64qJNFnuXlAKPrZ9n5ca1k09iK+9UG2TjKS+
teIKLkRhTboN02/c8HryzuqYpqo+krxAWcgepPA8obK6fYqHCCQ9zHqSORpAUACd
UPWNaFb+25TMBhddhUgbhMRE57O78p0v964WLhOn4asxQFKqmEjFE9G/5EacL3uL
SfKeF3avr15d634UvBNd7pKy2P1PHLVPBxuqXCrJzUBWLunDcO/8CYzVmewTN9l5
J9pbDqqY4v9vVQ66khynMQ/fecMR+iTht2O3tE7UpXyaOnpf1RRLUher31fKGdrc
0neIGUB4XDNz0KA9QUQY18Q+eUUUv7L8Xdt2tYB36RK8UecsmOJOp6QNf/EQ8Lh/
WleY5tnPBVpKcERwaSN3gyFBLDqiA4u6vadueLxr9myDT5s48GJvXg9Ga6qEYu6o
ZPTcoFa7JCri0amiWdXwVSNkvVBCp9uCAy+BvQxkEiLEQq4U2ZCvluxIhw40dk8h
VLk67AkcP2N4mbJyAeYoh1IfEfn7DWdgrjnxTORzb7YQk+vidX2Huq87J9d9nbAu
rsbzOvxV2RnAqwggkmnEb/i4se5PM2+HjNHpE0gbGExB2xZHNj+4Ew9W7SMpihy6
3UJeBFZnAW/V4QXkzmAR8Mav07Ci8rCkL3+OQ2IGtB2XJo47xgc=
=IwBy
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
