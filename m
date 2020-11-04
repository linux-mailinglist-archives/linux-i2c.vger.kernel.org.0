Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3FE2A61B2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 11:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgKDKfi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Nov 2020 05:35:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgKDKfi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Nov 2020 05:35:38 -0500
Received: from localhost (p54b3309e.dip0.t-ipconnect.de [84.179.48.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A25CD2072C;
        Wed,  4 Nov 2020 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604486137;
        bh=wAgrnJv0Y8O8Q8w96HJSFnamkXIXbNsF0cRRMzjiJos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jy8Z9WrgEhPJ+Lo3CO62HKjjn0KLyvApe3e3B4GK9LR/KZ0Q4y0ogREVwgTVWQxnu
         LcF+d7trNR3u6wsFbYrhnIxXl+r7WRYqF+pC0xjfhS/3apZTo+qIaVtfWpk1rHXckO
         wOSLO9mjTM6EzKxaDJf3yTLsTRlScgqwxMI5TlOY=
Date:   Wed, 4 Nov 2020 11:35:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Michael.Wu@vatics.com
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, morgan.chang@vatics.com
Subject: Re: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED
 before WRITE_RECEIVED
Message-ID: <20201104103531.GA3984@ninjato>
References: <20201030080420.28016-1-michael.wu@vatics.com>
 <20201030080420.28016-3-michael.wu@vatics.com>
 <20201103210349.GE1583@kunai>
 <5DB475451BAA174CB158B5E897FC1525B1295560@MBS07.vivotek.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <5DB475451BAA174CB158B5E897FC1525B1295560@MBS07.vivotek.tw>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Not exactly. There're an interrupt state name "RD_REQ" but no one named
> like "WR_REQ".
>=20
> For read-request, the slave will get a RD_REQ interrupt.=20
> For write-request, the slave won't be interrupted until data arrived to
> trigger interrupt "RX_FULL".
>=20
> I tried to use GPIO to simulate an I2C master. I only sent its own
> address + W bit without any data and then I got only a STOP_DET interrupt.
> If I sent its own address + W bit + one byte data and then I got one
> RX_FULL and a STOP_DET.
>=20
> It seems the controller doesn't interrupt when RW bit is W, but R does.

Thanks for the detailed explanation! Okay, then what you do looks
correct to me (from a high level perspective without really knowing the
HW): when RX is full, you first send the state WRITE_REQUESTED when
there is no other transfer on-going. Then you send WRITE_RECEIVED
immediately. I think this is the way to do it.


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+ig+8ACgkQFA3kzBSg
KbasRhAAjD4nGj2H2f7HEpuc0N6DG+ylX22AblwdraC6uDmLYH9uBcWlpAC+Hm21
BnABcvEeq6Bo4PdjoNQa5wtKOPkwWqtYFngWlFMMJBMpwgiGe+TFDNduspLxQHa3
TPmmBDITU5gdHOOifjr6XmdHnoMw47fiLqt5fxsRVHxrPoJBkicAT3wkmg/KCKms
AdOKX9bloPoInFUlp/XIsVwxiDobTx6/OWPX1p6wecOFu2Uf1+xpdC+3dXzVvjnW
SE+22AwoFtDwujSrmQPIRSMGQ2uoVX7i5ibIBJaDrShRguYwEz2Y+/K69b17CBy5
YcAH4e4YHt7dUy9WJGhrlJ71A1ssNRdKWHKxZbw2s64q4T2UPQZZZtj8sVGz5dCI
O9tOaLGt9ZdIdesWiygsVmf119RWYX7T0/TKfZ1ps7dlG4A53gLz82UNw70Frguh
39ypPw4XJKqdi0RGuzbGjM1WcvSPoO6a16kKsIFZrnHO1VfAlfTq6PEo0kbd9m4s
wSm8jHWtufXIlpDtzJkR2MuQj/j0O5H6P7co7bF2ai07hH9nury5ZCvSt0bkkDmH
o7iy2s1KHm7IBy05JIhk+ThTxjFtbX46uyuxrURMbosPiZR2Lh9tmnsW84SFwRAX
u9Zwrhtz3N6aVQmu4DEpm+J6KipyCz8uyePm509cAEB7nt6OTiY=
=Gnqr
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
