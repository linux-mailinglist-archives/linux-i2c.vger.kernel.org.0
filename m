Return-Path: <linux-i2c+bounces-12041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18581B12708
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jul 2025 01:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E7E81CC266E
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 23:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3538324BD1A;
	Fri, 25 Jul 2025 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hrdxQm+P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523E51E9B22
	for <linux-i2c@vger.kernel.org>; Fri, 25 Jul 2025 23:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753484512; cv=none; b=ABfDmfmV+SyoSC1jAzZl5LEzr2NFU+mdXMjwFBipxae/GO2DXxu3BpgfAdGdNR7byA9Ux2UJM4iQygVKjHvJyX0s4cz4DfeKhuEMtR00gPPMUZkvEhD1yvTDvvHVpt73ju8Q1ayzJVGHHvSpYE9ZmO1srW6OETw9IU9aYBqbCC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753484512; c=relaxed/simple;
	bh=IfPfnA1aYpRW04A7kq/nqC2+YCF1WrRpEHCLH0fUGVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlPXo9Ea1CzAWkmPY1vyOEhzw2tYNxcBl2AIkSAM0zaH1b0edy5wO3fldlvZueBcNB9wLafR2pAZsOTGGVtKKhij1PEhw46S50NQlTYO28LAPXLUw3RnIfQy44k/ywZhGK7uiT7udB8kSkIsFCdGnO8dX5wuH1DvPmckNX1DUcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hrdxQm+P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IfPf
	nA1aYpRW04A7kq/nqC2+YCF1WrRpEHCLH0fUGVc=; b=hrdxQm+Ph36heDn1LojV
	ep3ZkZQybR/WH1HvhlpkQvbGhnesex5WBdJ04d2fDEKRwOW/YrNMYHVMlJIEePN/
	JPJ7rEt+xAUTQm1d3vPRa1F5Gt6xW2jbefV2ZyZUFE8hLUFw+UgCwh4Lyn1syiGs
	h6hGmHnY1Uxm8HMylgMUF3oVP633XPVM3vCTSHaghxtr2hH3N15otdTBAT6kAbu8
	jXLxS3GGIvpexdeIBtY2fQuonH2/FeiRe9cXP/p/Q20LuLPlgcXLonWaGW8FgClj
	IIDdwkhLPhCZExRI0LPvzS/0/EaSezwzBAh57G3pkL7NtcXAfAf10Q82vT5BdDBk
	oQ==
Received: (qmail 2580095 invoked from network); 26 Jul 2025 01:01:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2025 01:01:45 +0200
X-UD-Smtp-Session: l3s3148p1@vDoO7cg6iosujntZ
Date: Sat, 26 Jul 2025 01:01:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc8
Message-ID: <aIQM19nIx5nIMZg9@shikoro>
References: <ql4g7pi5fk2zedld3d4oq43iqk75pgqvshpmu7awj4et4tf6pg@q4z22o2icwip>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Puh9uDa0vdMYzJk"
Content-Disposition: inline
In-Reply-To: <ql4g7pi5fk2zedld3d4oq43iqk75pgqvshpmu7awj4et4tf6pg@q4z22o2icwip>


--/Puh9uDa0vdMYzJk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 06:55:17PM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> Here is last week's pull request. No new fixes have been sent
> over the past few days.
>=20
> Everything is rebased on top of rc7.
>=20
> See you later for the merge window pull request.

Thanks, pulled!


--/Puh9uDa0vdMYzJk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiEDNMACgkQFA3kzBSg
KbaTfhAAlF6AS+zJFVEQeNznjHwCIAXxYnbkixcAujFaw6o0C0xoEnOOGvQqASWv
MDNwJXVB+0gSAxDax+SQTvDKOprtppx8pQf3dqPRZljlXiUOTZ7BmGnDOoPo7BC2
4S0hzV1bMLGDj1Ab2Rohl1dz4fTJHKoy8B+deBJHQd8pZWDxWM3UY98e8RplWv0+
/F65VNSZBTQHI7s8VoYGXHlKEWZesWo91nM/xE+PmtrXFYYCSVfvxY0MzD+LhmnA
dYqqwHb6lgXJx/bTNwrBT4AuelkbweTIy7eQudGgURuHi4spDmYKG1JNp5fFgtq/
nPbIsVLLkw7tYMmWMqqPs4zts2wkSs8O4BBcp/Xd87QwQR3dOvSJF+R2vCnb/Vh5
NsLl/58GCiL4DCLaxXqVasLqIVfaq1UrfAFjIflewdcZi4EzeZcYxgrdrS6ZrN66
OD66PUo40LdHrPpD+ETTN7ChskZ9+qPMWasqPKv/HS1HnvE+TofRegLN4ENc4h0Y
oLDkzNksI9BwUVvsgoO64j7my7eKCYXvQj7SgcPgyz5aZVNTRfqYJ5GyJH4nER+B
1+P2QPgDPYjsS3NVnccq3Gv9+TuyuXEAAsbvSJXa2IzIECCh7OSVRzpgBzB4qUcR
gx8HQYKaY3gYi+bAfwRyg8wyOWnzO/rZVAVmLTpj3YhNbR7BxvY=
=/qDP
-----END PGP SIGNATURE-----

--/Puh9uDa0vdMYzJk--

