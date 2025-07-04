Return-Path: <linux-i2c+bounces-11838-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4CAF985E
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 18:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6723BBC01
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 16:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB832BE04F;
	Fri,  4 Jul 2025 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ApolwPwA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415CD2F8C24
	for <linux-i2c@vger.kernel.org>; Fri,  4 Jul 2025 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646778; cv=none; b=pUyWP2ywFfUAPBUgdTJ8+C78phw4B4yW6O7JX517D6f1coyX0eW26tTbK2e3Cpv59rQC5N6p5K/KRgn/LZxJn+jAGKoQZO+BjgvEzHfl2nARP7/ggvc/Dn7TrRWAxP4K1NBAa4wOV50OZ19phgXqqn/7o1EwA/S1C9Ln2d37a34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646778; c=relaxed/simple;
	bh=nDpM3TeygD5Hn3GFZce15e8MB7CMD6z3/QFSaIpgCM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpJSwk6DmZAvhOaFKQOsr0Ktf0Es8/qrlg+II+odNTrbZ7ur0k7bDuOUfL2o7hk7FSLDpkQohDiRaEiaVUNCLGtVRIlWk7dJ2kXGvp/VRFu6GIFH4mEZuCD0/f2Wp1heFXvMvvc3heDyMmst3zj5EeimtYEoj2ZCxbSYBhViT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ApolwPwA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nDpM
	3TeygD5Hn3GFZce15e8MB7CMD6z3/QFSaIpgCM4=; b=ApolwPwAZhPghd7qIywM
	fa+lZXWQjAaRq0QJ3GpPlqTt/JXrRqV4qzNL9WJYoo+h/dU6Nnr74ry79LXjFja5
	Lti6SKYalb6e69Oshrvifixuhz8zn1e3Li+33//sbFHXP0oHilQjVhlBiQJ6j5fK
	R1nyiHGF/NYalpeiey3zkUxoACAgOB7zTghM7H3Bp2SjG3sE6qXIntH4JIMIYx8v
	1m0zLC6HLLt09qaY9D93gynnEZcFWVlC2cN9Nj4afEZK6MI1FaZEgjJud1Kbz9+p
	BCB62zH5SK59alQMgV3vw2SDWefNRptHOh+/Mse8J1MTQ3gSXr5yyp+yM/4kFTsq
	Pg==
Received: (qmail 196816 invoked from network); 4 Jul 2025 18:32:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2025 18:32:46 +0200
X-UD-Smtp-Session: l3s3148p1@HS9NCx05MqUujnsj
Date: Fri, 4 Jul 2025 18:32:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc5
Message-ID: <aGgCLs7KbTfxocND@shikoro>
References: <3ygvpeurj6vvve7d2vtlpyygjobbj2yzhgkpmlvyrxbpw24udw@o5zlnw6tx4ju>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dt8nWqguR520A3Nv"
Content-Disposition: inline
In-Reply-To: <3ygvpeurj6vvve7d2vtlpyygjobbj2yzhgkpmlvyrxbpw24udw@o5zlnw6tx4ju>


--dt8nWqguR520A3Nv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 09:00:57AM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> here's the fixes pull request. Nothing fancy this week, all seems
> normal.
>=20
> Have a great weekend,
> Andi

Thanks, pulled!


--dt8nWqguR520A3Nv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhoAikACgkQFA3kzBSg
KbbF1A//Z+opJIBupf2owlLzvLIekduRX5HR1um31igKyISmpNEfDFq3+kkYRZBt
ph6rfg1K7Gyp7NkiodzJSbE+wyzCtHuKC8OO09yIrjc0CAAz5EnM0AhHn+oGD4De
8JfM+cSepOVdMHgLWmxVYhPb6olG9h4FD/73Wkj7P+G4rm1bKJoz+KXEe6P9FBed
522tlTTHyCPnhOUmEr33Yzk2JDmmR1eVtVcCMlbQzud3Xy8TBKo6QTR3XtfVJdGK
a4TBlGnHsHXEHluAyRbw2OBh5Ahlr1SQ99m8Ho7KI9d0w8dKG6XLpQK8ZP0xgTEW
91r4n8USoJTwgcpTKq1FakkJxGojWh/yVrZMpo5nNyg0sx3M8H3nove3T9NrRY/x
/kAgdTJPial5ho3rGJVtyH05zv3Ou7P7zlwddnN36ciyndoxVvm5BA8FWDfMvg+5
MDmkSMOvEVj8GCWZM8MRmuCWlCiIC9TvBS7bTCbtcEAsWDaY1W5O0e6TdFNT4JJ/
Qp202OnQ5jDIqLTUc17v2uDbO6/ZJfnQ49aHdFFGIrLsBK6wcBkObKAZDvcArBef
4E9sQyxq7FKy8jKOR/dKV+3H7ATJG52hOCJeKQcQ0m18YkSa2HzHcxOGtyEJszvP
HdelCNdKJ2J8zIQoYAuwFQ3GUahJurV75B0YoCb7tVqf/bDei1Y=
=GxLc
-----END PGP SIGNATURE-----

--dt8nWqguR520A3Nv--

