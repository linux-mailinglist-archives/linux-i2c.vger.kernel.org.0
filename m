Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3572E2CDF99
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 21:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbgLCURj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 15:17:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:40826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726166AbgLCURj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 15:17:39 -0500
Date:   Thu, 3 Dec 2020 21:16:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607026618;
        bh=wwvkLgUFOYF86cvivgeVpKe+dXjmYA7IO6AstU46bYc=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=eCz6CXf3oH3BcrxAv1BOboQpAkzjg91RiLfnUtia42q3K/Bmi0TsbRr4itBbkaVxK
         mkDJBz1ZClBGklkLDPYJ2WoDCWBU4sfRLpsP6IDKTrKvQt21XWSi+zXVL2HqTgpizZ
         jeo1iyS3IJffoXH6SJOffbS5RDmmTaMQmRxJ3yfavD8Eji5aM2fk1nlufAXxBUWmu8
         P368olN177iCilDbwUEyw3Bt0n2yh4HEvcBeoAwB52IEK5AN2Yo2R8hQiAjV3tp106
         pHmjyt17CT4G6XEmcqxvXCQdBpSYLQVdzK39kLNhp497y1GttXJLLH4+emVMSWsBtd
         vJDxMMN4Q5VwA==
From:   Wolfram Sang <wsa@kernel.org>
To:     Stefan =?utf-8?Q?L=C3=A4sser?= <stefan.laesser@omicronenergy.com>
Cc:     peter@korsgaard.com, andrew@lunn.ch, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: Avoid false-positive error log message.
Message-ID: <20201203201654.GB3585@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stefan =?utf-8?Q?L=C3=A4sser?= <stefan.laesser@omicronenergy.com>,
        peter@korsgaard.com, andrew@lunn.ch, linux-i2c@vger.kernel.org
References: <6185f3fc-35ed-4de2-8bf7-fb991555580c@EXC03-ATKLA.omicron.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <6185f3fc-35ed-4de2-8bf7-fb991555580c@EXC03-ATKLA.omicron.at>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 04:02:52PM +0100, Stefan L=C3=A4sser wrote:
> Since commit 7723f4c5ecdb ("driver core: platform: Add an error message to
> platform_get_irq*()"), platform_get_irq() will call dev_err() on an error.
> In case of i2c ocores this leads to a false-positive error being logged:
>=20
> [ 4.173989] 007: ocores-i2c ocores-i2c: IRQ index 0 not found
>=20
> i2c ocores already handles the case when the IRQ cannot be found and
> therefore there is no benefit in having this error message being logged.
>=20
> This commit switches to platform_get_irq_optional(), which does not log
> in case the IRQ cannot be found.
>=20
> Signed-off-by: Stefan L=C3=A4sser <stefan.laesser@omicronenergy.com>

Applied to for-current, thanks!


--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/JR7YACgkQFA3kzBSg
KbbgxRAAjjOMgWp/XPMMdXJPYDdVuVvlUCuk9DoYHj+AMRfORlqQ00TWnJ1gsbbE
UuTESSibHTjpci5YnJOD1LLd1YOErjc7/OPyH0OJazVOdiiXtBiZWaNeKZM+xuvW
HuuCDckUPA67r8zLIR0miFOVigoZThaF6zRJKTEshjFeYNKHBQoXobPEygZqmWpk
CZdEMQD6SW0+UglpckzxBMVbUybR0BrYv5jLbrAnFdqV6hFybPtHffV5drc1nWAx
DrAv+KtgIydAoviDHNDCsHCOhZfHYJBq2hWFaUN3Orcu4/u0Bk1/+jK2bTjZ+bvu
PrgKT28Ncuex+Fg4hrocOPh8mvjay+d0HdVjOpRqN9oRo0sIpbI2wHYokDpSMxY2
jntbdPbsqNU+XCE4xBtAKYHs9XeCZPZt1pS5fBUTOXiR2w05OYuZoXyYpB5uIiyl
ZJbamkXLJhpNfuJ7v0KnSx7KdEeR/1s4K7RpAxsLBB0fHnCmlwlaOfy9xS/Fap69
MLXChxD+tsTxsM1rHcbisbp37e4I2XlZMK8zfgQrRRHwbB+uSpCXfotqYSPObMRH
4udZjhcdoCSnz8osxvsDCtSkUnL6NRY0+YLuC/OvkUBdtkXD62OjQWbJRWOCAzCi
0qnGjFGLqr3CwaXjd8xWLgFSGEJ0ZZNTmOwWWzk7rjdBOSK9EP4=
=rBm/
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
