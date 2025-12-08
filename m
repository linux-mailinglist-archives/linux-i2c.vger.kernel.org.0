Return-Path: <linux-i2c+bounces-14471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B2CACF3F
	for <lists+linux-i2c@lfdr.de>; Mon, 08 Dec 2025 12:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCC03305C4F8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Dec 2025 11:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574A431282C;
	Mon,  8 Dec 2025 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SdFtGbJY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30742652B6
	for <linux-i2c@vger.kernel.org>; Mon,  8 Dec 2025 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191968; cv=none; b=jmCHVZ0V8f405gSidePNv1ku3AKy5YUgkR8in6AfQYev3cH691b+EC1nMquKugWSViEyRc4d5f1vHYTlwExzM0xXlOnvv8pr5I08ivAr0cGvHEyD+PLa76MEKEq/dax3OI7U+qvFJHQa5xQI9I/23n1yumd326wOjs5muB41qzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191968; c=relaxed/simple;
	bh=Sh4Tlei7sTNtVwSUe7d/N3s/w0/fTgm6pdFVcpYwrnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6y59NQShlBaQ5EROjzhu2SlWOI/9rw2VR6rz0LKf5oNzOqAoc4/dA8JbTqs+4xkDWzEQ6Jq4hEY0elHUvcClX6f2EFqiq7AehD9QnQjl7zhHHvquSBtZFayMHV4Sf7qb0UqxuQtvRIGb/L86L5eXdaWXQS9GbidG0JL8qaUr9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SdFtGbJY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IQDe
	mpLDxyILU4BGHdb8RR8beMWP5EiE9rZROHJ1xYs=; b=SdFtGbJYRvVFYYQZBQ7+
	02UDcQxw4/T9V1OLZbWUSK4minntuZoT12hPTdhP9APiUbMBlTl38plhbWQuydoM
	I1UAECf51uXc00DC7xzQmc5nIuh/o1PHyf1hLTtys2CWfNZp6HfS+Z8TDPHhlA1g
	H6UrSn0cPd4Sa714m6kwaZFHoJ6++kdRsRyuKM8xhqsPtmJlLGoBtUQu7QlDcS86
	TEaT3RDCpeRssqhVTRyFbk8YuotHYYXeFJezoX4lrllD1iHuBSXCsP0mF6HYt7ui
	EWODSjgvTA5oIaVq/QIcOMaY3vVEn/81woX7RlGPSShOjgr2f2QBaMG0kpQ+lCGr
	tw==
Received: (qmail 2503795 invoked from network); 8 Dec 2025 12:05:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Dec 2025 12:05:54 +0100
X-UD-Smtp-Session: l3s3148p1@Ggk4x25FAIjdcafS
Date: Mon, 8 Dec 2025 20:05:48 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL v2] i2c-host for v6.19
Message-ID: <aTaxDEQpgdaynqS9@shikoro>
References: <7cpbbfziaj7ez2yi7n2xs6jzyj6w52yp274x5xd742ww3clpov@3mkcm4lmozhy>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jkTTyLLibJqwb/M1"
Content-Disposition: inline
In-Reply-To: <7cpbbfziaj7ez2yi7n2xs6jzyj6w52yp274x5xd742ww3clpov@3mkcm4lmozhy>


--jkTTyLLibJqwb/M1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> as you requested, I restored from my original reflog the state
> prior to the rebase on top of v6.18.

Thank you, pulled!

> If you are still available for a part 2, I already have something
> ready to be pulled.

I would like a part 2 as well, I will need to see how Linus thinks about
it.

> Thank you, and sorry for this messy request,

Things happen, let's fix it for the future :)

   Wolfram

--jkTTyLLibJqwb/M1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmk2sQwACgkQFA3kzBSg
KbZ+DA/8ClMWsbEXKSBSxgtc5WX3NsvFaKMYHHcuZ8goRfIpO8E2P7IR7fLXoxZA
3KUvGCpHKFDVhP8KjfOY9JtUXnDuUefu7oeVoswWZbzUW8EQx/j8bXuPCb44ofEz
FFjEWdVw+CGVwVmNSqgBPOarlFjPWUVyCEffQDor5D31oQTE0N/JWhYHALRunY/u
hOh4a3wJzYflbkxyfh6srQvnJ3lopZ04mQFC3evttFhy66IC/7EuJnlUg9P/LXBk
JuHu+lMtj98a2AlK6ogESQTxsuCbq/fLImSg62UCTd1civZ+ZNzetr5cIDjdMWRT
CwCzPSsIdI2V9lmpKTEQiFjiWKvaHiWQMPHbWOYppOBVOt4I1f4bVXox8D3IpWbK
gaYmeR5gIAUudFgDGnufGrZsCyqR/65r7XMISm2HnU6ZhgQnIHQ8waDjv+c8TqTZ
cStcYoRrkIY+cb9P1Jtx95ytMiJp6Rwm5kAff72rNvsvaEIkUBpx3r8DN3Y/FRMy
prZC0BHhP+ja9SdVJY1q/zBd0o9cJsXJKioq8nPGT/EpmZxteftiu4NmA9CmOpRM
SwHF7p9UJRvxkj83/wASJKFzkOm+GOLN6/ELHLStn9lN0Yp+RvtV7FIJVvABRYFl
pdmNs0odoqMTNHVVK3IRau8qhWrXcX5gEN9X4KVMnvl1azDrVI8=
=6kkR
-----END PGP SIGNATURE-----

--jkTTyLLibJqwb/M1--

