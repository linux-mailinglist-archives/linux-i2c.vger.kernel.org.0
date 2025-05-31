Return-Path: <linux-i2c+bounces-11186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96369AC9AC0
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 14:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A45E189D628
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 12:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190C1239E78;
	Sat, 31 May 2025 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JgQJZLRo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03E1A5B92
	for <linux-i2c@vger.kernel.org>; Sat, 31 May 2025 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748692975; cv=none; b=p8zjlIwpUbq7dlTohKRXUGHnbRJHF2ExT7NS+Rrhr9DxD0i2owqfvi5UePri0dbEF+fp2noPrg9YL/ud/bkiUTixZ5OeInuyqb7efMUYcH6K9Izt0pYC/fhuAHngamVsKkJNja7Sh0suZr+w6vCsVnuqkHsnJRzHISAI7U5EgXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748692975; c=relaxed/simple;
	bh=g0Cl7sMjzvuqDdqrsXXlG3kYe+mPZeAnKJlI8HBSMhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5078wU2D71IhqOeorGwFBYRYyIfdP9aoEVIdcOIpB4v2XZNVqKZhwzj02ly9018YI6g1ubXyhgHMELz6XTNY8dVe4tFrVMOzfXMZ8XNU/uk16Afqwf+eYws3GGbnEAJ5OnePWMJ8lp5FuPAU5qeNDr/MptGbgRszt5RLDQMcq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JgQJZLRo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TxHX
	LCe1dZHMohiA5MINyJwo0Jz8ubxxXqfTUG6sOEg=; b=JgQJZLRogIF06PXEz+du
	iEyrMnNLdyLfeEFa5dRKLNxFFGK1eYKIGeLeOKesP6qTD4ohav0XO+hsZFOZPNzH
	un5Jd2pQQBdb602Ekqv6C21XC5NbVZcq7MzXCryFIcMAYYvDuv4pc6Cx4L/xzZoI
	aS+okx0U6/mv56pJC1q4thUCdH7fmgI6un5qjz45vpUSbnLUVt+bkYa7d6n99CRN
	LbKq+Zd5OGUVcgICoJlgyTNdHIynzcj9WgLgDgDt54DVNZTaA8yYl7O2zdhbhlhX
	Wf/nxbjeHRDvRgd2gQSP3QoMr2P4PFF0iZMCoodgBVcm8nhsqlOuFNwGrVhog4eO
	yw==
Received: (qmail 2656174 invoked from network); 31 May 2025 14:02:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 May 2025 14:02:42 +0200
X-UD-Smtp-Session: l3s3148p1@bcbRTm02O3ptKPEF
Date: Sat, 31 May 2025 14:02:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc1
Message-ID: <aDrv4dY0j4lvSDdO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
References: <aDnYz2PB_euziA01@shikoro>
 <CAHk-=wiKW=BPcDvBAsVDemdWBR0uh09A_WMOCoceqj3w3doGJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Llq5oZ+P1Z8gB2ai"
Content-Disposition: inline
In-Reply-To: <CAHk-=wiKW=BPcDvBAsVDemdWBR0uh09A_WMOCoceqj3w3doGJg@mail.gmail.com>


--Llq5oZ+P1Z8gB2ai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> That
>=20
>                 mutex_destroy(&rxport->aliased_addrs_lock);
>=20
> is wrong - it needs to be "mutex_destroy(&it.export..."

Thank you, I will feed this back.


--Llq5oZ+P1Z8gB2ai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg6790ACgkQFA3kzBSg
KbaPGw//bhguQD9I3qL2CJDxbttyu8XgljWOJa9dMmAd82MiHM9cW171PGKJUZbD
mYZz9COrPW8SAkJ9ly+DSwTH3/FiL8rPpcAWDpNm8yPUPP7gY6fPICS3K5F1LI3a
UnaPNaPAtJa86L0H9iC93mfiSmOqDUm7zY64TLhdYwp9XlJmZk74PjPQDWS+sXf6
kcIlFn4iMzfo6qfYL5wjouXw/FkXImipNRzzoz2EMx43pEGwF/DNgDonVgzvlcao
ebY+ERHsr+yWLXa8rj6rCbBudRMuQH9urxVxe1xERvfsgjtDNiGvOH+DEI0YBlWZ
Ydp47vRdVO99wfafch5zZMzg8FaNN/7ZzikhpSts5vzhj/IT12h0frCX4QhuCDec
TX2cBmMiepM9BpRw/t7zT6RnDLgPdaC/9SHYzopUPQXzzeIa9M5iFT0BGVGgwuca
CEyxuoBp3r9+YitGLoiUGamyiqLHvwH/F6biXSu7gkUbQCFdV/hFhh6WvDjJ/34+
tBPaH2giFwCOJCq1vU+RRL3EI7dV1QMOn1VoXehWdVImN4JG3CgQgaKpc4CP7HAo
7RE30mPB/qwv4Cst72/CODWkDXVo35dEWaj6gIqoi9VENjI8GJl4NVF6VrpxE5fv
0yg1gopX/VIz+NCIMxrkzQM6nL+/g8zociru3HjTuBv+pXugV0A=
=bTZx
-----END PGP SIGNATURE-----

--Llq5oZ+P1Z8gB2ai--

