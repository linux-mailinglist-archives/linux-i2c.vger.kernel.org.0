Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1734C56A30
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfFZNRO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:17:14 -0400
Received: from sauhun.de ([88.99.104.3]:56028 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726242AbfFZNRO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:17:14 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id 8D69D2C0114;
        Wed, 26 Jun 2019 15:17:12 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:17:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: core: add sysfs header
Message-ID: <20190626131712.GF801@ninjato>
References: <20190619170245.28380-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline
In-Reply-To: <20190619170245.28380-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 07:02:45PM +0200, Wolfram Sang wrote:
> We are using sysfs functions directly, so we should include the header.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TcFgACgkQFA3kzBSg
Kbb37hAAlRvTRz0kIdeWrKyhb/vRoXhXVjpH1AIrosHFk7UmM0y+5FSMet8DShn9
CpmGPI39zMGkv8sxr3GYRR1bdUCchwqZDAp0UOXeOsUxaG3VLwl3A0CgUmLEcX7i
vqH6I1SDtzEdvVZertITZZve3wwRH1JFY1ZsLOQdu7+lEQ2dZpw+OZyUbyxv6lVa
E+N9Qwa1nHeCMQbCFWWjmiM2iuJaM/65UgX1K3ZFI9ljXlV8O3xsgEt5D5j5BzTT
XlrAIcM5LtXHChnvyJeaM0nfCUNJjxuDh4iTqAgHjh4W63jZLzbxGG5tt5RiFp6p
bDkuxkXqkWE45UJHJlb2WffGOZYUWIJf0KHOviazKPz4OtBlIUoifSEwTSAgo/L4
qKoPrqmpU1FAdzJliQL4b7bnoKzSi14yhWPqP0PhRDJDI5V1i/RQw1Bs90eVT9eX
+oILYeV9Xg4xM6til5k7LsCer8x3eTgf8dfqKv60EMy3S9NC+BoF7j5HDFScva5Y
kB/QUC81dsWnSzQ2XZtMkKwNmHN7UyHvR+FEFnM0ifRJ9CnQ5Frb6xi3AS4cmNV7
e1ezpIgztHZBOxbjIqQdOTS0uRLvMIPjp3CEMCQ8SHqHsZ6Z22oueqjBjQaCXgHE
1DUqFnCe9TzVEkXCiDbYw8f368Qy5DzOp6E+1TLhHoBiz7u3d0Q=
=7Knv
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
