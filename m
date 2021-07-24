Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8975D3D4730
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jul 2021 12:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbhGXJ6f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jul 2021 05:58:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:51764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234219AbhGXJ6e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 24 Jul 2021 05:58:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 309E560E9C;
        Sat, 24 Jul 2021 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627123146;
        bh=rd3agneBNGlYwrmFkKik3XEga91vS8fwDX0YJVTXZLQ=;
        h=Date:From:To:Cc:Subject:From;
        b=YHFF97OVw+Gsv6GlRKwBN2/c9Hm20zz1EjhbrHnJd/dEGiINf9tUAJJnKwQQ+UJcu
         3EE4DbOm4UUcOZa3+DdDmO8CKxUAgc0gMycf1CJfEzk8e8MufRlFyRid3l+lTSOza/
         fkcQgHMZVJRy8ibgton6IzU8xbYxnBfM+wQZDlTaquQWPckrEtOLl1D6pn9dsiH865
         qFRsRUonOtMCqbvXNgY4U8uW/KAFtA3iJ+jO2OtANrT0NG2jsO4maiPdnCHsxqk+WK
         SaEFYilH3Sbcyjfe5pdrZVvjUt7OI8ekQ8IEKXLkAhqHfpr+RudqPA01AGGv3vlaFa
         94fCyW+j9zlfA==
Date:   Sat, 24 Jul 2021 12:38:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.14
Message-ID: <YPvtwtk3wPtFnB8L@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bZPzLBFILEwfatwp"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bZPzLBFILEwfatwp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

here are two bugfixes for the I2C subsystem.

Please pull.

Thanks,

   Wolfram


The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to 4a8ac5e45cdaa88884b4ce05303e304cbabeb367:

  i2c: mpc: Poll for MCF (2021-07-20 22:32:01 +0200)

----------------------------------------------------------------
Chris Packham (1):
      i2c: mpc: Poll for MCF

J=C3=A9r=C3=B4me Glisse (1):
      misc: eeprom: at24: Always append device id even if label property is=
 set.

Wolfram Sang (1):
      Merge tag 'at24-fixes-for-v5.14' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/brgl/linux into i2c/for-current

 drivers/i2c/busses/i2c-mpc.c |  4 ++--
 drivers/misc/eeprom/at24.c   | 17 +++++++----------
 2 files changed, 9 insertions(+), 12 deletions(-)

--bZPzLBFILEwfatwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmD77b0ACgkQFA3kzBSg
KbZq5Q/7BJNq+cSooAV8zeZqPBqYf0LpwF4+7cMs6f6bTvxUJBIrVKxZh7M8lpTC
i8VSq+NWUWz/x5iuJtXlPFKdv5Bk7i2ozsfpkt86v/hmKgF0Uqf+RAIErYPrZTiy
Ks6qrq6h5WDguPUd+wigmml2fcLA7MoIwNCACYs9XW54rdMg5PaxMwDTz0vUYEWe
NKCXS+VPpqxM2M30/3HZkudRwE0jkR/QOtEVgEh2STCuh6FV0/foEC/dW7BiTtXK
b4PcvluF4L4j+AhA8FuDYy9OJk6y2chwiB3Fg/UNryVpX8f+H20ClzWFp8mkwxlp
xGDfGKnDkoK/pfih1i7dhZmYloQ2DKsUkovk6M0r06WIbHWy1Lci/IRA2fyXinPX
kErAj2m7c8BXQUm3KRUB0PIJe6E68r56I0ndyH7WOPyB7amucaXL/Ph0L7nwrs0a
IKMGHVzG3/2AVMVJ8dVvlnEau9ElBCIVoGJsoXobL5WerLh/OoDfmb38TU2DYwxV
KOLUuAuC4d9k2FoO2PGYlCc2xQdepFTNXbj123trNocomky9PbigqmqMniP8luEy
FMSkZxfPAouUCwfCEMMA4C/K2CYF10lbT865GwzACukpxVbNUoi7oNGVpz2jho0q
Y2mmPMYCtUJuzzb6nnPdETpfcFD1X7bcaMGlIkq/VY4cXN8lQB4=
=x9Bi
-----END PGP SIGNATURE-----

--bZPzLBFILEwfatwp--
