Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E55361374
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 22:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234764AbhDOU13 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 16:27:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:38418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234662AbhDOU12 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 16:27:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B04361107;
        Thu, 15 Apr 2021 20:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618518425;
        bh=pLNucmabUrGL+ANjKLqWZvSCPdLNF4dDHj2Mh1+m8Gg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rBzb3Rd8ggUL0FqIvHq/EH9funIG+bDV4rzCa7fzB18qDcjqdOkUNODGPkud00X46
         thp+Y4mkUcoPJ8Sh1tu3oeToXM5vITmwgG+yeua41KvyLyi6X3+2VpI+w7JoSXTc17
         /gfuQOVyz/XtUbtqv4RkjdWkZgjtgVRT/tRihP7OdxeIThzowUdVsyvfs/7kyz34F9
         7dGbtpWGisZeuNxt9C703CNEZDdQV4Iq79py4j5iNTVU5mQXugP4j6jX0Mtd/vmQ1T
         0CJlaB+rCRSM74kZc8FpqKCKqA1FdPVz9MfqfEcSvqAjtDGRMmJK+nZJZNjOQPNhcR
         S66yyKieiEZgQ==
Date:   Thu, 15 Apr 2021 22:27:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH drivers/i2c 2/3] i2c: iop3xx: Fix coding style issues
Message-ID: <20210415202702.GB6471@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>, linux-i2c@vger.kernel.org
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
 <1617613430-11921-3-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
In-Reply-To: <1617613430-11921-3-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 05:03:49PM +0800, Tian Tao wrote:
> Fix 20 checkpatch errors.
>=20
> Among these errors, 18 of them are incorrect space usage, such as:
>=20
>   ERROR: space prohibited after that open parenthesis '('
>   #128: FILE: drivers/i2c/busses/i2c-iop3xx.c:128:
>   +               if ( !rc ) rc =3D -I2C_ERR_BERR
>=20
> The remaining two errors are trailing statements should be on next line,
> such as:
>=20
>   ERROR: trailing statements should be on next line
>   #128: FILE: drivers/i2c/busses/i2c-iop3xx.c:128:
>   +               if ( !rc ) rc =3D -I2C_ERR_BERR;
>=20
> No functional changes.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>

Applied to for-next, thanks!


--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB4oZYACgkQFA3kzBSg
KbaYUhAApLfiPPyedeGZw9kE5NUTM2rr22nIMrd33+ERc3h6m8ed/qufxjwMkvI9
SnC/k+f4rhq0Msmgg487zjTo+vIhR/Sn2wtvhEsm9szfe3Dq+roTHi0AaXrvpLF7
RVsPQIJdap53ovqDCCrDh5/B6sq/AS03xjR3BO973/W2OyvszcJm+GQuX8wgu2tt
U+ykRvIrptxczGL9d3kUy4yGzFcuZ62/Ewp1x+8WXIwhkbe/U2PDkuU38n3X7wzF
ZmX6LTrkJaXasfkvuKaPHwC2EZvOGKQG2ht1Jz6olc8vs5BGJQ8/JZ2MDUcFrNA2
TVNXVVxIBNRjbl0UynC5WNtYrJWm8TyvUsHxvX566iQZ5y15VfLBvV4jdtV7n3ni
6Y4rHwW8s8P6lwd8GJvap0g9gBzG2l9mldpOXpqgybTbWsuDE+jKsL9FDO4WN028
WwCKY4KlA2o1/Vd/7kzJzeV2y0gweb8i3vRPFoH93KddewG0BrJmoZGuhNGyAwrg
jW8+ljhD+JYnRx7v4RtrQRKuOeWta10KiOKWO2rlwaWgdJgh5j95mR/CJv50RK72
BKkFWpfaB0YU8k+622G0lo1PsHvP2s8wbqcNAsY6OYYvUCa6v2OBtNgyqCHHvttM
KmmvS0DcZMdU1aeUgVZIcCLsinpnxf1lUpxdJ91VkmElxjzoZy4=
=L9Ic
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
