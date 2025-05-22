Return-Path: <linux-i2c+bounces-11109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91EAC086C
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 11:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D212A25E6C
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 09:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA78D2686AF;
	Thu, 22 May 2025 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hDTTCkkt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933712638BC
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905531; cv=none; b=rKco1n5EvitM4N/SmvTrZCJs7mgQmBJUKfiuKhK8+rqhwpAyOn+FL9a6ItWon04myJ7XvBscz+vtAbpUWQIPbNqO9zZcz+kvMz3JVj8LU1X5U7FiEcM3fqqz4C9PysrLWMC2UlFAB0VdT6OQdX51q9A9snSu6NqT7nwZalXobMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905531; c=relaxed/simple;
	bh=KkCN38TKRlbZS2nF9xZ9ThTc5nIKDj8WH8y/28cUnEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqb2W9Eam3AMGpw5BAY/KRRYYmKHWjYkIDaOhEsjdPz6QBQ5TujNn7eM1oacsviyKvYrkImk+TTUY+ZCf/4kvIB8xYP34d/AuhzQXBZGewb0uVBYnASJWUE3TMbSP3TZUp5cEE5/wgn3p/waOTM+WXtDLLmLXX5x+ttGNu4bxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hDTTCkkt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KkCN
	38TKRlbZS2nF9xZ9ThTc5nIKDj8WH8y/28cUnEY=; b=hDTTCkktbJNNjk9bypiO
	bj9c6mqo/j5//J22QYhKR2aczNhwmcf6aLGQ1qPYZr3ZAmM2Mi/xlFXxDUMyrhTo
	fRgtyHA/dxn29CYFAq/BjG+yDfVSbYseeBx1Fow51mqxEt2fyHywNpL399C+J6R1
	35V9+6CdoynPaS+77aSE7ZvgJGox6QfkwASSwitKIJWzrAJRZVSQrIAQ0ojw6anl
	Rcq+j/Q1lfcKlTwQK0RjZD6Bi0GGJNocGZNjTk7hzf5axq78Wobu6I5qgeQZ+pJp
	ySklk2DefYpgFkxutoHfV6F0f9wcs0mgBQqNpWp5OQrAa3rvmtV0UxtfjeXe1wiY
	JQ==
Received: (qmail 3591207 invoked from network); 22 May 2025 11:18:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 11:18:47 +0200
X-UD-Smtp-Session: l3s3148p1@9j4I+LU1gLsgAwDPXwj7ADHm2wGe7qss
Date: Thu, 22 May 2025 11:18:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yuntao Liu <liuyuntao12@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	david-b@pacbell.net, khali@linux-fr.org
Subject: Re: [PATCH] i2c: fix module autoloading
Message-ID: <aC7r9oc0ODN9UisM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yuntao Liu <liuyuntao12@huawei.com>, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, david-b@pacbell.net, khali@linux-fr.org
References: <20240815090225.756845-1-liuyuntao12@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b3Bz3eaqe0RzovLW"
Content-Disposition: inline
In-Reply-To: <20240815090225.756845-1-liuyuntao12@huawei.com>


--b3Bz3eaqe0RzovLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 09:02:25AM +0000, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from i2c_device_id table.
>=20
> Fixes: e9f1373b64388 ("i2c: Add i2c_new_dummy() utility")
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>

Autoloading the dummy driver? What is the use case?


--b3Bz3eaqe0RzovLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgu6/YACgkQFA3kzBSg
KbapFhAAimWxaHK2MUbtBTftR4lqeW+F/rRtIvlPkMUHtKNHRcZfyS3uXQLJ0trx
0w44dXRmCeKsuA4X6dIqz/givWIuI6Q+oyj2pCzofLox+wS3C/DWdCBXNFNhNrp9
A3oqvlN2n1dXpfq0O2Rj82357mGREoI79Vbn8TRZc69IpWhiXegCJ+g0dAuMgBRr
oBo9bZ4x6pLVjncIk6Xqn+GLvvMH0cguXsH8oBYYO7zE4r1Of4eHfExR9fwKvKKN
wiTzCGYFSCA75VX/IywX1PGxZqmUeTlh02P58gEY4vC2YY4LcDWeQNzL1iJnXAFF
s0ocbs7kjTsaGkymEZwY9hfhRu0snGApxiISsy8Kq3crxxAFGxSPC3QChIlqwKaD
YZGC2I1xo3D7p431+O4ZB5H42yvtGVIWZbI46G4ZFMf3ddRMkV6okiuV66OpuicO
u55bhujDlfqx0Qu9kynWNRHpNrIlPggwvo9zuhv5Ub8IKcGlkQxan/rsSsf3VgXY
tnP5tCIBso5q35RYhROEvYX+cPD0bIFZYoL1oFBmN0DifSDpRgYx4r+qxJ54XOt3
2fr2gDmZ2z6ZkxqPjFgXFI9comTOyqGCdYPAfoMdg50lJQ/yf8Xm07L5yqFRRHSO
2CEUCU3FX2XTkJvtm3KiZQ8UHMCzIBSjAnIwsfTkmfCRoLp9VpI=
=64t1
-----END PGP SIGNATURE-----

--b3Bz3eaqe0RzovLW--

