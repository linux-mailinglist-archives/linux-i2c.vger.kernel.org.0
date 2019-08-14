Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E15B8D3FB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 14:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfHNM6K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 08:58:10 -0400
Received: from sauhun.de ([88.99.104.3]:48676 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfHNM6K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 08:58:10 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 99FD42C311C;
        Wed, 14 Aug 2019 14:58:08 +0200 (CEST)
Date:   Wed, 14 Aug 2019 14:58:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: stm32: Use the correct style for SPDX License
 Identifier
Message-ID: <20190814125808.GD9716@ninjato>
References: <20190803141331.GA3588@nishad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline
In-Reply-To: <20190803141331.GA3588@nishad>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 03, 2019 at 07:43:35PM +0530, Nishad Kamdar wrote:
> This patch corrects the SPDX License Identifier style
> in header file related to STM32 Driver for I2C hardware
> bus support.
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used)
>=20
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46
>=20
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

Pierre-Yves is on holiday and this patch is obviously correct, so
applied to for-current, thanks!


--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UBWAACgkQFA3kzBSg
KbZgmBAArH8glfhLKtTkL5UWa4RdGvAUOavsDcYcimkOpgqU9Lbh4CG7AqxoohDc
4SqzUm4dZTlC5snKoTVPnO5vmsNouyjD85xud37NhdWYX1k4HTnKEpo2k8N/vop1
ryZkczi52PVtxZSoIsfKNnAGB3wkyXSvGM7UnmTmc6PFnIQDTpGOSzgrV1HnXjFu
YdTk301hifcdaHc/+JyvXL+arw30iwBgerzUlS3fAPURippr5qScbFR4Xevyozdu
xJSzmc03vaniJ5KqYT6zhp3yik+NaZzc6zoqHk3B5XmQvM3VO4xK14TxbPK1exXS
g8j7KsfoSjK/jidf/6pSTMoCp5+GnyQCBhzK0hcTTLxjcsKltICA+5sE2OjYdYSY
4dG8vAZNOagcYPUyRD7J4sT1PHK+27O6n0k03et8pU8Lg+8IhWNcz8PfRpLVvkOr
jIW6dzLHzZmtRJoa3CFIrWSTFfChd68u0O7EFxkqRfzqVLOfIZfS1kwK21LsXM6i
uF7jLgs2F4fEOzdktw0NapEDVbVYS2AQbL9B+keiBdWpR9nfKJPjPiodpPeYxntn
lnSCiiOTAWlVE5WxF+F+1ONza0M16uh5H9FM7dkHp5SpvJskxRrxDzG6rkGhI/SN
Gxh3BXLtyVjUs4FlfqcZsm87aX4AGBy/zwEmpKpYqaRNe/ZKftM=
=W0pC
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
