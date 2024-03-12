Return-Path: <linux-i2c+bounces-2332-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B154878F58
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 08:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9BE1282D6F
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 07:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2A269D01;
	Tue, 12 Mar 2024 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmKmuylA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F66997D;
	Tue, 12 Mar 2024 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710230269; cv=none; b=teHI+OH8oqGh8gcILggrWpEaoYrPjKY31krVJjHgtAzOuAUGA23siLHIg/ddeW0bf401M2oFZAKlRUa26iyuRh9X2Pnq+ojtA6Uh6Ga3yY7bMZg9o+Ltww3sOOtAP2hfFiL+BNZ1AyWC1qEixYOM+FkZojSf2oTntXYbK8v665Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710230269; c=relaxed/simple;
	bh=cacs2Jt4ZZ0dvkFXoC1qebJOCEF+199mqo0KtPGeTC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PY4HN7qhSQ+9/T5WZGdpBcHBfkYMHbQjb7LjUHumRAjj4bnzM8/JRwrrOqg7tuSsplVn1D7OF53/5/JzaX7so6IwFRz2i3Du0HG834kGTQkV/C1lnzUWDxdNYG1vNCdI3JawlVO45mRWBP0E7VXtZSFiemLtIz2zjGvonHlJC/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmKmuylA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9C5C433C7;
	Tue, 12 Mar 2024 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710230268;
	bh=cacs2Jt4ZZ0dvkFXoC1qebJOCEF+199mqo0KtPGeTC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmKmuylAHXJmrjhC8DRx1gr99UBHDtJkNqIN0o61enUAWzIDk8AvbFB3AQdvILosI
	 i77W/Dru+BSl2LE00zIKW5SjR3YzcQ6xeFskn7Du5KDa8moLL/VNRIIEjLxegSMohO
	 gL7mkpfTcvxaJ2qbgBvkknV1bltcuRJ6GSdLLvIxUYdKd/DGHM92gwRt8JK1rpiPoB
	 XBm7fC1YhCW55svLW9B+rnpnnfxRtdTC0E+3ExK+YcSUj/R4bFj/yA34LsG3E4+doX
	 9pmtMcUKdO7NjG62XdsmmDn2NAEf4hsmZS8gHtYsogrUIgO9BrkJNJNJ8UoQyojOuT
	 3VH5K2m8ohQfA==
Date: Tue, 12 Mar 2024 08:57:45 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host changes for v6.9
Message-ID: <ZfAK-dY2AIlodrXy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <jdepgjva4pciwws5hep6xuf3ibokjy2oqwmak6tztnr5cprrfg@eb7t5nm3zyns>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l83ZCX4NHePxP+uj"
Content-Disposition: inline
In-Reply-To: <jdepgjva4pciwws5hep6xuf3ibokjy2oqwmak6tztnr5cprrfg@eb7t5nm3zyns>


--l83ZCX4NHePxP+uj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2024 at 01:19:46PM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> It has been quite an adrenaline filled last week.
>=20
> Here is my first pull request for the next merge window.
>=20
> I still have changes from Hans Hu for the Zhaoxin I2C controller,
> but, as you know, this has some conflicts with a fix from
> Christophe. Therefore, I need to send it separately.
>=20
> If there is more time, there is a series from Theo that is ready
> to go, and, if possible, I can also queue up a last-minute patch
> from Mukesh.
>=20
> From the next release I will also rebase the i2c-host on top of
> the latest RC.
>=20
> Thanks,
> Andi
>=20
> The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba4=
78:
>=20
>   Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-6.9
>=20
> for you to fetch changes up to 06d0cb6c824c7df736e66060b8c63b0100259d3f:
>=20
>   i2c: sprd: Convert to platform remove callback returning void (2024-03-=
08 08:02:47 +0100)

Thanks, pulled!


--l83ZCX4NHePxP+uj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXwCvkACgkQFA3kzBSg
KbZy6Q//TpH4RE5R0FcH7NKjNgIedbkNEPHDUUQFB+g7obP5C97xzDA1FN0X4kJz
wHgFIJ+rTFJzavYvLaAUAJwFWq05Hp1zmtMpiY8MS4WL3aLTSVYCfyTsh+6cUJQD
tGTLJkIXBVkdhZVI1L4NOrAlSqzpBqvTzWdDPl7A2iTMecyzIpTaYizNu7tqo6Lt
nlwSnYq5UeF8o62bsVZ5O7b3R9MCIOZXP8QiAr2ayTm3MXahNVxki6ScGdps0hz3
Wtm+qK5WKQp4Kwcm796coiBGD+o4RDPgzVlFkDSWvBZ7SUFyneHwgaSRXvKs/V5P
lksgz/TeGN8gaugmd3s/OxCnm58Dd9aXob9UtuWbpIDRSgY6GFatZvlIAZmcpurP
5xsSAHxk+vUTZBztIrqx/y24pFCWtsvbDIcAZJS1Pinj2QN0+c/6g5YQsK/8VW0v
OLxCx5a8rp6CkiYm3mxSZQ2ltZUHmMZFJrKQS/AvGzAcMgw5VB74sOSOt0uqLtxW
FUUnRW/PORe/MDetqNpQwE8kh/0leLMcqX4yP8HZk8Yzy+1quCBZvCopjpk0OcXh
spCPtAFYz6+bMjHZqZSDyxOjFLZff7w+x3l2zlbKSJw8MkBpThJv4JFIy188WhEf
4PwZrcKSzYpFmHJQhm/QFif7vJr1us3qiiS0LOCXsMDe6iDUSO8=
=qo+V
-----END PGP SIGNATURE-----

--l83ZCX4NHePxP+uj--

