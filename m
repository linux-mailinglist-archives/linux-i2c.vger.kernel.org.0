Return-Path: <linux-i2c+bounces-10013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C71A6F45B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 12:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C4B11886AA0
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 11:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01942561C5;
	Tue, 25 Mar 2025 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Fs8WdXg5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B613255E3E
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902694; cv=none; b=Xx8YoI9YEkUriNsaNtfQzR3PN5aBv1S9jsRaNYbtmRxNkHE2RbCxRW5YRN0o4vcq2wnS9AXDkZM4V4VWjyxg7IYiuj+lufR2yBugvVVElUoj7e6liwGzXbOP46dBX5KWmmE/gdSceZsFxiFu+HtqusPrkxiW7O1y3Y7vtQgq/+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902694; c=relaxed/simple;
	bh=FA6d2dRVk8LxnzwIHtQlX5bcI9YBfV2aFKyu05XfbPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVVa8iiTximhx+n3oJtk0KbGniILYjuvz0gZn+P9p+0Uls6NmcwDf6STXo6dDQSFEueLQAcPmKuXp+SVxMP3x5P0SwUjzqCqfwZS297EoY4S/SGz1Vm+6xbeNAW79R4k1dKQqVEUzdndI+ZflHsKcID1RoDOuxnQxfy4I+p9+0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Fs8WdXg5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=K3xC
	bq1aSNfvAgcHKhHmE6cyJzpFHMkkBmPR4tehSj8=; b=Fs8WdXg5zgf3QXSDvskj
	jPLkKvQCbpC6DzjVMeCCCadDQwpFjBLjVlm7V1DOM7TsZ+Bu52Grsr9QsHAvmdDO
	4iANkHpo71hNwLNSxOIslp+/FUMg+VE+wjyvfveuzS4NGtEUnyzUE/YeRPefleeZ
	StNmVyWqZhdlr3MiGrK4vnrVw+TjePiuOMQuMxUCcRSjplHUlzB1d26uvVAJ1tne
	lnAAaa8vovXAAEwdsbddPAabe4BTOpkB9+tuY7xq0Yg2LUtyTOys+Ar+I4AUaB1d
	MzvythRs1wmDnod/ht7l+JDDj120SOjo5wWnoO7h5beojc4LXDynLMW42wVc0GwQ
	5g==
Received: (qmail 3031330 invoked from network); 25 Mar 2025 12:38:09 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 12:38:09 +0100
X-UD-Smtp-Session: l3s3148p1@JR2pJykx3KAgAwDPXyTHAJp038nK7dx+
Date: Tue, 25 Mar 2025 12:38:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.15
Message-ID: <Z-KVoRCm0fd-tLBs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <u2isvs32qv53rrkmhwqfex25zeegyb4slbelxk42hpfkun2ruv@274wvt44675k>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kAmn8II20RhuryIa"
Content-Disposition: inline
In-Reply-To: <u2isvs32qv53rrkmhwqfex25zeegyb4slbelxk42hpfkun2ruv@274wvt44675k>


--kAmn8II20RhuryIa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 04:45:15PM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> Here we go with the pull request for the merge window.
>=20
> It's not a huge batch in terms of patch count, but a few pieces
> of long standing work finally reached the finish line.
>=20
> Some patches are refreshed from the past, something I plan to do
> more often going forward.
>=20
> One new driver was added: Spacemit K1.
>=20
> Andy has also been very active, contributing the new
> i2c_10bit_addr_*_from_msg() helper, which is now being adopted
> across several drivers.
>=20
> I don't think I've missed anything from the recent submissions,
> and I'm happy to have caught up with the pending work. So I
> don't expect the need for a part 2 pull request next week.
>=20
> Thanks, and I wish you a great weekend!
> Andi
>=20
> The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1a=
e1:
>=20
>   Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-6.15
>=20
> for you to fetch changes up to 39f8d63804505222dccf265797c2d03de7f2d5b3:
>=20
>   i2c: iproc: Refactor prototype and remove redundant error checks (2025-=
03-22 13:11:53 +0100)

Thank you, Andi, pulled!


--kAmn8II20RhuryIa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfilZ0ACgkQFA3kzBSg
KbaJNxAAiw2IYuXOZ4iujuQ4hKbBePi+DKpVj07DMg2pYHuMtHU9Dxg1nUBhl/Nh
VpgPwqt3Cs9fWLTbijE93lSLh2lObX4mTiW9rrxyzPEQ8Sho8sjJ5XalDE3598Q/
xOddYkrdQL/nw4gYPm8hrxJai6O14vSK1BwajnNA8AS940htxh82IW0SxXLVCOKn
1EpF9cdRs4aSbZJC+0ih2+jaoS4Q+3zgfJh71gMksnwaZnTmS/c1zMcorBn7utTg
TULG3wmz0aQu2N2Z6YPqnFgNai8rUK1odrTfIRXmbnckVW5cSfgA+sihycziz47Y
fLAdKPEtgHTiBZgPo2BHMxYfzPQeSq2AVgtbaKMNI39PRJQhLwMLrjkNfSrsdLys
I9FCB+psiEGUnoTwMnAL+Mvx+B3JhEqoi9iQnLIXX63Gsq9FVyOsDMcnimtpa4ii
h/+ICgg0QK+/AjYYdPKXsCTuUJcZcCiNnF7OBIo9lnXmgWL49H4C7+HieUO/6fol
60x0SyOPXLyKpaCkEJAaU2u17DACbfodbnV/roItYyGDC3X4gHQJRmGsdxPhQjEO
5SFYG8KzhagUutbeTAB+KvfV40Y/XCveaX7rGLb6JAS40R6hvz+c7yn8QPe8Me/O
Wwk2z0/Vfe7yv1t4l7Hd0MagBXZ2WLbGCVPKUD0rHYCy4Fbku2k=
=lptR
-----END PGP SIGNATURE-----

--kAmn8II20RhuryIa--

