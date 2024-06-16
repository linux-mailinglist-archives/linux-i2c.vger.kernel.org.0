Return-Path: <linux-i2c+bounces-4046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC38909D09
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 12:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26FDA1C20982
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 10:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D8E1411DE;
	Sun, 16 Jun 2024 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YkqGLWNE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B21225CB
	for <linux-i2c@vger.kernel.org>; Sun, 16 Jun 2024 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718535215; cv=none; b=FTER0/l0GbV8K2Bt8uZevZP5ti48UmHJh2LQYlg3wPV1XDvpM777WB03l4eHFhy9HyHHuGK2gaRPbBYZloqp5cxrC0no5nQRe4WDyD557d0xq6pXLLBr4bvbvJfBJ1QvtgSKULZ5khdjz40dAsmxNHTxOjSBlKGZOs8KA5UDrqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718535215; c=relaxed/simple;
	bh=pPmTG0e3YCiFCaBWDdmksqu5YnH+Vaq+F8hZderOmUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGbIWkKNPyX5sT3fs3e0k+pNVqSEYIcX/x8TxWvJ2KO6zLW+dIheR63CtaJwNSp1m2aDLFi6B3jITHN4Ye6IC+1TUmleZy5OKIq16j/GQcdxhHj0+pGSuZiLXpizu7U/Zd7maKu64mke+tvdz2g4cip2Wrsp7SlcXTFi4SnhUXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YkqGLWNE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aK4q
	AUhfCuvnKQy+JJXU1JgTKkO/38PbGFandX4M0Pc=; b=YkqGLWNEUvP8zn1gETZz
	sS1oG4AZgokdGRqdDyVr4Em38C00XOALy9hfNCBhw6bK64WsLwmZYasjuubO7STR
	QKMxZ/MgkMDiZO7vP30ZbO956sHsd1gOqCqJ66gfY4h3qN2oOIpwqmoFvOytu9SJ
	jbjh7oAWqpCA3If9Q3CRNSJ9X8s84UJP9UJhxq9lkYcU60Ba+PWTkxoUs5x7nywH
	FthTqDG9jeZmLsWpS1xn4KKryh+jqgw+mUelwTASZNLu9k1D9ggvxz/2GdFc2l0+
	jnv6u0/wF37+8uO//OqcYKGyXGWCtFyA9C4hSsMZercuxkKXZDHsI3qIaswadS4R
	UQ==
Received: (qmail 2010904 invoked from network); 16 Jun 2024 12:53:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jun 2024 12:53:21 +0200
X-UD-Smtp-Session: l3s3148p1@TWg3qP8aYJlehh9j
Date: Sun, 16 Jun 2024 12:53:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.10-rc4
Message-ID: <4go2yseotxrz6et7m5tkkdaml2cchs3ehyo2vkfrks33xzgbrs@l4y52c3zl6fa>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	Jean Delvare <jdelvare@suse.de>
References: <u4eloe4b6geus3g24orbcz4fz5r6ze55fhdue4q7dwluhakwh5@a6j4n3jgu3tt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l36jsmryuj45xhqm"
Content-Disposition: inline
In-Reply-To: <u4eloe4b6geus3g24orbcz4fz5r6ze55fhdue4q7dwluhakwh5@a6j4n3jgu3tt>


--l36jsmryuj45xhqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 01:34:17PM GMT, Andi Shyti wrote:
> Hi Wolfram,
>=20
> not many fixes in this period. This pull request includes two
> fixes from Jean that were queued up last week.
>=20
> Thanks,
> Andi
>=20
> The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa6=
70:
>=20
>   Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.10-rc4
>=20
> for you to fetch changes up to cbf3fb5b29e99e3689d63a88c3cddbffa1b8de99:
>=20
>   i2c: designware: Fix the functionality flags of the slave-only interfac=
e (2024-06-12 17:07:34 +0100)
>=20
> ----------------------------------------------------------------
> Two fixes from Jean aim to correctly report i2c functionality,
> specifically ensuring that I2C_FUNC_SLAVE is reported when a
> device operates solely as a slave interface.

Pulled, thanks!


--l36jsmryuj45xhqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZuxCAACgkQFA3kzBSg
KbaXmBAAmAxUF/YR+cdBBRl0CB7yi3nAxELS9b1r0+XEUK+rTLxhXlZfYw+g+vAv
UDfPPHVyQ+DPLZlHtYVDeLRV3lc45FRR2dkpREClL5CJjVbqN0ZgXfCPbkUL32ii
PMpY6zJrABNl+k3poSGFE5mDAqY7PxtQdiLq2f1ojuxs0X/Jyi6w4tXznXoRAiAF
tyaRoPuH3Bx/e9oA6HjZso3zgJLD31zzSSt2WM3iR0qPoAVgMsbtSSb1HLFv1tnm
0JQHBw4lc2xArtr/8P696JDKTewgV99LBXjmjUIxSdI0cKZTSDeve5OHcaO/D8YZ
RNsV4v0oIwGBh3KfBBuGB40pKR0j25guCeZKx6nKgMbHMQNPbVGkaZczNDzhiql/
XiZfFWKqk2/FsqWH2QbVJy04c+Noc95Dds+7to97y5HpuYdK1eM1CrC2owXjRcDW
+Sp/OBmczU2EpAbJEhW4NiwTHwDOcN7rg49egdUFJIUWfZFW5CkHbmJcBSmnngvm
n++d31LME5Kwgl9skpFaGroBGrUFRP8LZ8rOm4P8IcaKcDR4sOXBO2Fe3tbvb4GY
WhG5a3AeyKwfZpu1fjIeJD4wYBHTCild/zS1qaFHP93yCvfFfGIDjbjpoPKVArEg
bRrfzu2IlV26Dl/CDBTaRDHeSy1TFewpYa4NFAUS3Pby89ymUg4=
=B6Z+
-----END PGP SIGNATURE-----

--l36jsmryuj45xhqm--

