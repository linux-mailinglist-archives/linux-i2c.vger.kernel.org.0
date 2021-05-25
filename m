Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E9A390934
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 20:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhEYSvI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 14:51:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhEYSvI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 14:51:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6444761249;
        Tue, 25 May 2021 18:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621968578;
        bh=LKdcmj5xf+yFErAth6zsRB6/eMGCN48nWrCCNpMz7iY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UXf/KkIUPu3dHjYGzOcDXQus+geltLjUHC+6VZZnILWWtcA8W+HRyrFWL53f7LEuf
         +sZxUmygs50hlc1IXsROKvZ5GMbsuxOzNCYBLLgkcCeDvl9bSQZr4Iw38rwUTpYANX
         Z7Ki5YOuiQyqteQ46O/1Ma8ZXjeE70LxQU9ijzzujrl97SNbu6Ia6NrQB7SnAPvwNm
         w+uQU5LJtsc0ZgNAvFwIEDlvhvgQlEwnmz0mcNlucx79ZIMspmY8FOFZg4LOn5+gck
         UVuuCPw/cBctPG68SEIVvEQQjNmZGbvvQ3Bkm00BvfGa5wCB1HYpsdunu8WgC5JceL
         HR4cjXTqIVEkw==
Date:   Tue, 25 May 2021 20:49:28 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Message-ID: <YK1GuD8o7k+jDLFZ@kunai>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <b90f48cfdc31af08190e7a8eaa71b7bd488fcbaa.camel@infinera.com>
 <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M6Zv91vJLKCj4+lw"
Content-Disposition: inline
In-Reply-To: <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M6Zv91vJLKCj4+lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> For those reading along the v2 mentioned in that thread was posted as=20
> https://lore.kernel.org/linux-i2c/20170511122033.22471-1-joakim.tjernlund=
@infinera.com/=20
> there was a bit of discussion but it seemed to die out without reaching=
=20
> a conclusion.
>=20
> The i2c-mpc driver is now using the generic recovery mechanism so that=20
> addresses one bit of feedback from the original thread.

Yes, and the generic recovery has been improved since then. There is an
"incomplete_write_byte" fault injector now and the generic recovery
handles it correctly meanwhile. Before, it actually could cause a write
to happen but we are sending STOPs now.


--M6Zv91vJLKCj4+lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtRrQACgkQFA3kzBSg
KbaY4Q//Z/AUf2L648u1FyKxiUMz7Bk1yhGNT95n1p3QU0z2pK4egbXmcfJWxU7p
zNQDFUFeMDROP4kSlnVz/xbY2Y1DHX+aarmFmIxWq7m5OJs+PErShPp8mpoWaexW
xoBieaadYbjZtcA46sQd4gxr3WI+Vl404/4wWTkQgIEUj5WttH0WvfbzPdBwt1Rg
laG97k4NbeZaf7IPTkQnjbQvxOeWtLRQSD6PBJETlIin+Dygecv55jFnoVd+fm3+
l1k9trK+rnpekqyopIxr2mXK/6821FmZZI8isHX6FKtW8HRdXJwZH6lkIh1AJ4/m
V89xF65s/PDkP8rFT0U9dOsVX35cdF9FJlQRedm3y5V7OkpOIi+1wC7TxyCC680s
DdUw3yFO+UwV+iPfQRBTGbDrfcSPNX1GLsImJ8mniK/NcV+Dll8+Q8ShsIKWqFYo
N8G/fgL1QVkQM3RYGB2+MIfg8AJ4oXlWZSMc5fDNgxx5MYGDBxMswSncO4PlWELq
NFfG1Q9X02KY4JQLNtVYm1v07JVXOTt6oLTLYqI1yRGCAYoKaXeRamwykoHPvikh
S1WiM2CtfCVG+OJB3S+q8JEhJYyYmSSvgFrAzVA3K93NoujpoA4w4TWHY6DUjOoM
3h19gXeeWLKRF8AUqjG2dX9hkTQJ23vW15NZR17apyh70FgbusU=
=kqR6
-----END PGP SIGNATURE-----

--M6Zv91vJLKCj4+lw--
