Return-Path: <linux-i2c+bounces-2682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14768892B93
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 15:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C0A1B21495
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 14:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961F42E3F7;
	Sat, 30 Mar 2024 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W815I/TG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B6827711;
	Sat, 30 Mar 2024 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711809968; cv=none; b=DskoifgZ2mOMoWMHLgcfxYExviDW0Sn2NdB7HLp3vmksMuuXBeMbbjO/QFnSW9XW4Yyr4MQX23FM1Ivgn1DIbwTMmvMRrUP0/FVDLfwFf+ilj8KNrV3E6xZDorxoCdHhNS2mKRdFT8MYVFT2I3Dgearp9QmMJdZK2rXRevvdff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711809968; c=relaxed/simple;
	bh=Hm3vyLmqxylf2Jw0JEjgkq4hQCohgBkKLkGekUibBn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P28hw0eaIMJaoIVAn3dhJwKCOniOIbK77ALPpmUmUYZNakEkov+RES4VY/lEU8NzfWG2HLKiM0vYUywxBavbc2OWlG9aWahjPdQ9Z7s6007OTSCTRi7R4RovJxxFRxuNZFCBNmxKBp2c3ELRZZkPhYxFTXaebStPV0b4w+M95qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W815I/TG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1617DC433F1;
	Sat, 30 Mar 2024 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711809967;
	bh=Hm3vyLmqxylf2Jw0JEjgkq4hQCohgBkKLkGekUibBn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W815I/TGLjkmnUfs5HpQ/pxoVOkoEpx6MOwyBNRLTrK6C2t/4eIxDS3ZBObC0IgDP
	 5I6fxo+J1i+bFC5lvSW9ldGD87cZldlHOyLu9If02H5QdxY+PftN+sHwNF4gd1nlQc
	 sPD94tcxSpURUM2xFDsRaXMf8tDXflowQoJBTtG1T/dio2XKx9gWjYyEZnQ70Vyh8j
	 /bF6K4XXSfEoC2iLNrSp2vv8uL6LEy9Ub2D6H2de/a1Gb5qJ7SxSVzJaXtYQK1QToW
	 lm/RXz6peZKk1hf1WkKFR7K3lHu6MMJyQbWqb4XSnHvkdapfOYw2o+L/ogn8qbV8IN
	 uKCfVoQFUUwYA==
Date: Sat, 30 Mar 2024 15:46:04 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc2
Message-ID: <ZgglrCY-lTTrANaO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Maxim Levitsky <mlevitsk@redhat.com>
References: <66u5tce25yh2zq26qclsn7to7kqp7muw5tbe4uuw7elb5daebw@6jvkpuy5yrm6>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j/7i/YHBm1T7iNvq"
Content-Disposition: inline
In-Reply-To: <66u5tce25yh2zq26qclsn7to7kqp7muw5tbe4uuw7elb5daebw@6jvkpuy5yrm6>


--j/7i/YHBm1T7iNvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 09:38:15PM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> a very quiet rc1 week with only one fix from Maxim.
>=20
> Thanks,
> Andi
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.9-rc2
>=20
> for you to fetch changes up to d1ef7a9ca867ab5c161d1647b2a8ec93a2ea155d:
>=20
>   i2c: i801: Fix a refactoring that broke a touchpad on Lenovo P1 (2024-0=
3-26 00:47:08 +0100)

Thanks, pulled!


--j/7i/YHBm1T7iNvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYIJacACgkQFA3kzBSg
KbYLTw//ei3wCIFGBPuHhiPjXqsioTSeINgsEw3xUDz6/w4fjnA8aiK5LXlCmT82
DlOE5yrLdU0s/c6FUUJWWiDRVpj7pmBQagn+Vuuaan6kw5bEwOyd0Atj5kp94EeA
iYZn4jisrDG50VyJSJIjSXk/QyJ4OPR9QnyfNiGLWd1pFNr+6juHs/d4WFgYnbM8
F5SUZQQqAR7ahotCXEf8RfDtPjgDbs2ozXoI6q4wm3N3tjRw9PNOXsp0vPfJY8YQ
c03jE52qOwPkNOq1JnaIfxmAf1ZgSB+shDUsA+3OlU+SBZTirRbvsajp3gVrJ3/Q
pDo/zXMDDi7GloTP8AMvgzLvFAyYgdg8saHX9kgUYLSNv/oMP1BvDGoTNxe8aTXk
5vLhb7yGOpW90Yc6FEgDGBg0CM9I+15+cPDqS4jE3o23NpOU5P43JBrqTH9Q6Ws5
SUOZ3nIFVy2IFjGwb7E6RKQNYmnlAsnFHHueJfbWI8ql5JcFrCCZOGlb3CRMW9Az
JMKXwa0znISpXC7ucBbE/Ya1YjRn6FGv6Dt54XY9GsbmjMi1tpLuIBMJC6y0cLuR
OJu12e+aDcfAAzZ0C7205vHH0aMBmIdgIqi+TC1JQB/tWQegKRev6OAoGfwm2Bm8
yGrr6neAX4sJtfX15H6l0Qt5AtFGuSVRuJEaCzSJj2/3CN7zixM=
=q1au
-----END PGP SIGNATURE-----

--j/7i/YHBm1T7iNvq--

