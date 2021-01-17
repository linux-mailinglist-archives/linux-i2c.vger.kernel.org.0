Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B893F2F91F6
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jan 2021 12:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbhAQLZd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 06:25:33 -0500
Received: from sauhun.de ([88.99.104.3]:35480 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728146AbhAQLZa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Jan 2021 06:25:30 -0500
Received: from localhost (p54b3344f.dip0.t-ipconnect.de [84.179.52.79])
        by pokefinder.org (Postfix) with ESMTPSA id F0DF72C04D8;
        Sun, 17 Jan 2021 12:24:46 +0100 (CET)
Date:   Sun, 17 Jan 2021 12:24:46 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: tegra: Create i2c_writesl_vi() to use with VI
 I2C for filling TX FIFO
Message-ID: <20210117112446.GC1983@ninjato>
References: <1610478161-4877-1-git-send-email-skomatineni@nvidia.com>
 <1610478161-4877-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline
In-Reply-To: <1610478161-4877-2-git-send-email-skomatineni@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 11:02:41AM -0800, Sowjanya Komatineni wrote:
> VI I2C controller has known hardware bug where immediate multiple
> writes to TX_FIFO register gets stuck.
>=20
> Recommended software work around is to read I2C register after
> each write to TX_FIFO register to flush out the data.
>=20
> This patch implements this work around for VI I2C controller.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-current, thanks!


--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAEHn4ACgkQFA3kzBSg
KbauDQ//WWf4l+IGkmljJgqCl0gS+WfQEGYVDnreh1bK7jKXzmGsB6WJ1eshsiFf
UKTDVx0lbOSEo724D6Fix/AjIx1LCKXUwUV3jvDk9OxQol8e5S4w/McWN3qQKhrH
dGfLoFfvDWg1kRnFctk9wrjxQyi+jzkY7mT0i1+9ZcDntPew7pxHBqxQhlrk9Wnt
ehzkXahoTlPDYzrQ+lnNVZj0s28TB3SiU+PAlc/KKwuLi+v2GwkpQSfccD7DarMK
tpWHT3N3OHJBg8PsNQwP1B5gX33HZ+OX/LgJUKntfWfLzK5UyM82t3T328tGzN3u
2w4/jHXXXbWFaz23Da0hjDc5ETTte96beocPKWxDBtRwnf3IIty+6KoHBjL+oCrF
GWcgvEvo7cKXFhKNzs5plmHvYrP3EaHd7W++GG4W3GvMa8vanwNO5d2HWyaO1p/N
PvHl61Mko/+OadFYHNb+IW7qQtpKgvh6q6x+kDJ9OV14itfZxK+d6xVYIe/dilAo
rv1HIa3TWjKiwiA5wVsP4wpFf1UGI+mbNtRO54Pd3UZXlWni6qaUk/ubD+a5pN60
llTEbHOt4eie5yJM99DtLVki6KYCLRrh4m11AoKxDHyNFlWJumpDEH6nqQNOmVF0
MqYB/mxDUoPSLCn3MmoPYKh5nO0r8MKZ5DFv7xuN1HR9PT/wP0I=
=1/hR
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
