Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95260A7272
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbfICSRt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:17:49 -0400
Received: from sauhun.de ([88.99.104.3]:56918 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729661AbfICSRt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 14:17:49 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 0726D2C4F33;
        Tue,  3 Sep 2019 20:17:48 +0200 (CEST)
Date:   Tue, 3 Sep 2019 20:17:47 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     ard.biesheuvel@linaro.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: synquacer: Make synquacer_i2c_ops constant
Message-ID: <20190903181747.GK2171@ninjato>
References: <20190819075854.1960-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tBhgiDt8dP1efIIJ"
Content-Disposition: inline
In-Reply-To: <20190819075854.1960-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tBhgiDt8dP1efIIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 01:28:54PM +0530, Nishka Dasgupta wrote:
> Static structure synquacer_i2c_ops, of type i2c_adapter, is only used
> when it is copied into a field of another structure. It is not itself
> modified. Hence make it const to protect it from unintended
> modification.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied to for-next, thanks!


--tBhgiDt8dP1efIIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1urksACgkQFA3kzBSg
KbYfLA//ZOnjIzSW3QkyWqv2szDHzpXB3OLpAa7VdhhbHNX6v73ebYFxG5xpi5Sh
r7wQvLWiaZOop+mcqBM8bgM5OEnzA2be021/EyjNf8CQdvU3e6jpAXOOiKJjAPDq
cr0mu7jM5A4nTlf4V63K5CD+ig4TG8FRHaJ3+91kXHQoFCtXSGA3Q0bckNDktm9Q
IjBJ9hU7EIKFERxF+mG8BsYIfFVO7wi8/ofo5+sb4yfhBFu4kPoXM9x9z2jOBG2H
Zb5XXmmOTLJ2dhY3eWfe7bJaYMLjqUGFMEH5sSTrTcn/w1g8qd/4+7Ph5g+i6WGT
LBVJ0pmquEhPs8x68lZqDzyBRizt5IC8THdYy1Qy/BWp+S0t5EHVttTQxDx3l1ym
oM14aHdHLp5yAc5mJifKqmmNCdFkDKR5ryusD05QEXdcgNmtYSoC/K/g9rvSs1VO
4RWwu8BMVJYeuYxj0ixXFl+x3W3bzfWreQCjZdwqEhm8qic6rdDLzUNUkBjD29fn
ZrFbLNuSpbXdqCjAQXQdl04ZEcfyQ1u9aSayYdP8ei7ucipOjLVNhe6DIXqob10g
qhedJ/WYDAJ/D/kTiWyPi9JKFUExfNjPlQdwmwlAzqgIEqqiwlQuC7gJNp0E4vV8
qlUJiEs4ZqrqAge17liU9lsGVKmngsMclD/r1MaqjpNRaV9Riws=
=QJb+
-----END PGP SIGNATURE-----

--tBhgiDt8dP1efIIJ--
