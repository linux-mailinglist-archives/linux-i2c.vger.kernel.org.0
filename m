Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A082BEBA
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 07:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfE1FsO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 01:48:14 -0400
Received: from sauhun.de ([88.99.104.3]:39674 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfE1FsN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 May 2019 01:48:13 -0400
Received: from localhost (p5486CE8D.dip0.t-ipconnect.de [84.134.206.141])
        by pokefinder.org (Postfix) with ESMTPSA id EE7F12C7BEC;
        Tue, 28 May 2019 07:48:11 +0200 (CEST)
Date:   Tue, 28 May 2019 07:48:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Masahisa Kojima <masahisa.kojima@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Satoru Okamoto <okamoto.satoru@socionext.com>,
        Yoshitoyo Osaki <osaki.yoshitoyo@socionext.com>
Subject: Re: [PATCH] i2c: synquacer: fix synquacer_i2c_doxfer() return value
Message-ID: <20190528054811.GA2250@kunai>
References: <20190521013350.8426-1-masahisa.kojima@linaro.org>
 <20190527193418.GI8808@kunai>
 <CADQ0-X8s8=bDBY+OiytNbEtf_cZV7Mf7U9NQKb+arMk8WhUcjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <CADQ0-X8s8=bDBY+OiytNbEtf_cZV7Mf7U9NQKb+arMk8WhUcjQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Masahisa,

> > I just noticed you have an open coded loop in synquacer_i2c_xfer() which
> > should not be needed because the I2C core does that?
>=20
> I'm not sure I correctly understand the meaning of "open coded loop",

It means the driver has the same loop which is already present in the
I2C core.

> > Your code does a HW
> > reset, though, but is it really needed for a lost arbitration?
>=20
> Other than handling lost arbitration, this loop also handles following er=
rors.
>  - transfer fails(expected size and actual transferred size is not matche=
d)
>  - transfer timeout
> I think it is reasonable to reset the I2C controller before xfer() retrie=
s.

Resetting may be OK, but retrying is not correct. Retrying is only for
lost arbitration. For the above errors, we return the error without
retrying and let the upper layers decide what to do.

Kind regards,

   Wolfram

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsy5YACgkQFA3kzBSg
KbY8Og//eb3UxBacYQvm5Woh0R/rCdVgQe+eCHPzdJYTnzgT4klrYnKuGp7eZzmV
kdMcMB45j3MOuBE4JQuOIa74qz7UX3wxBEZA91kqG2NBH78SPlpOBu2x3dImHNvr
hV9iE/Nr/i/0EWH5wsDZiYitbmwMKoTkbJE1QP3X3rOGE+KxU5kEiFdZhvBuM9da
UhyhCweKYy73EwTFj3i1Thc71r6IdlMpEpTnZfIX0PKO9yzJ4CDVTauNtwofQxMl
5gzn+6TUrTWe0VR6NWoXGXQm8Q0+mpgB9yNDqdqmIk3XTsNRe/SLC5LNlyb/Bb4e
yUNVbrfG6v0Sw28oORGCA2I5x3hFLbqqkCXbLjDclKle05NGjtwPHCOwweUmAdRi
6jzPW0TIxD3OtaCjcMvPbS3XddUen+frc97IZiD80iLn7ZmTukaX2MTk9oPKHG72
Huu10/xJom1eSCNl59X4rRN9yauOotl0TmpDSKHjTjVrPtlSS1oZzmuVlyzM7JWV
t9ZNLLdZ/fBrXn2u5psvbAamwR/j2/7TdmGbBCii/uOGf3dO84aajka4yN9o8NZM
h6Oy75j2ZJ/xDPO/gPi8Qgllt+eFJmH8ypuMAwJMdNQnIXcDDQJC7S9KR4g9KBg3
0o+pGgRH0utWrvK745fV75ZLXDjn8ZF/xvffPnkC3eAnDCiSXFM=
=lfbP
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
