Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92D13AE074
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFTU4C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:56:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhFTU4C (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:56:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD112610A3;
        Sun, 20 Jun 2021 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624222429;
        bh=8inU7eQ1OtyZRKsjx26IlpMBMI+uspehUyz3W8X1zrI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ibfaLhC+H0S/WhyTN1tfKE6U+hQkR3aTdrHRCIv9u1GGDxHk5PyqBNMd/Z2GxTvhW
         1EEwln0zQ1c7+BP9E7BWATBL+715hgfYgPkD8kg+v0+bQmj8vguz07MI6kN9xee8pU
         GP1EL/Xli885bdaHY1rc41baHaSLmet4ahQkKZKFBfzMGqnBGRAr4kZbFmZXaUp3q3
         /gG30SzVwiC9xYOXi1dtsZR7OiNbK2TJ9EJsuYPY5H9yPmsnU5nZ+LY3jHEqLpkZbN
         hrj2Cq11ZPmdX0TLjImIvUFMcjVxs+dqhqMxfNCM38opP3XPcOp7933XUCJ58bOcSK
         4CyrxUYVaJB/Q==
Date:   Sun, 20 Jun 2021 22:53:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Simplify initialization of i2c_board_info in
 i801_probe_optional_slaves
Message-ID: <YM+q2gTYePDOB+7C@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c2c797f9-7c5c-9545-0cac-675a191c7e40@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tR0BJDfvNHugKDDm"
Content-Disposition: inline
In-Reply-To: <c2c797f9-7c5c-9545-0cac-675a191c7e40@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tR0BJDfvNHugKDDm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 10:01:31PM +0200, Heiner Kallweit wrote:
> Why shall we bother to open-code something that the compiler can do for u=
s.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!

> +			.type =3D "fujitsu_apanel"

I added the "," here.


--tR0BJDfvNHugKDDm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPqtkACgkQFA3kzBSg
KbZYJA/8Cp+bKTG/VFUj8lv762u6w+lT3fWfzhrBQHCRGHof4rKSvUBY2vLU4sY1
Th3zGGgQFryoq6ILvdasnwgYx2+40DqTP9j+FImYIoR8c+O6Ey35bRLufhu4DO/b
IHC6Zo3GClV6cERZUG909G7CPHQ3vdGHNfI3s0D8a99q8+8Le/zWtYH+FlOcKH05
oz9VmCWistJ0JfaRno2cJYaBNespFdrPl5eAPIR0n7akcg7sBxRlI1vxUYjAKabO
Omf4xDgWAvUfLOgTeRvkq05voDfs5S1tpd2oxTtpADc42Bl4CfVXtDImQDtIbWks
qKrwNi28UHUznFV1V9kklw2whsGmhAz/sW2P3TolWL06qLdPXR2bwI89HVXJlFdk
0A/sdR+9j9Eo1lE54IRiiUB38wFNLXqD+WrH/Lj1Y8vaSrHr/JpF+gAEc0DKqnJc
IUElFkCTfuI2sDf7O66SVG4e7FIKW4tCmQRzG/lSkwEg3fv3GuJ/Y2N+z+PC9VNT
uZlSqDDSV6fhA0tYhCxuugFK+070QBa/okYSkco6NdqhpRgOYrIJxv5ZvbUgkpET
/XZPg59ZgMvvPm23LPCsXcPA7IVpfKNtJ5ZO4AvQ9vNwHbKV4nxTxqzsLvKsUGeV
e8QMaBS6LShcSk3canZuB21z4O63zrkgJRLazkrFAkNTmfBqI3w=
=DaK7
-----END PGP SIGNATURE-----

--tR0BJDfvNHugKDDm--
