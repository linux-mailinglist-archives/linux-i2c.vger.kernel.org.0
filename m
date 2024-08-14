Return-Path: <linux-i2c+bounces-5394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F9A9521A4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 19:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A03591F21A39
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 17:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B371BD01A;
	Wed, 14 Aug 2024 17:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fhyM1Ff9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9311BD018
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658266; cv=none; b=EBtW1D+/inRe++VVoE6/+SvxqJNp3YtuQeSTwJHHqytNIFJ78IaAoXzJCnK3V0qg23zb6mua87o2l6K2EA27lf+bBeVD56MgNNQa5xHG94DK4rykPrKJ3PylgVpzG2DyknkVJhUecGobdHvi4QPBUSHlyc93sFtV0TFZGnanFqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658266; c=relaxed/simple;
	bh=CVGxYsbN06GrLC8ExIL+rpVxBNr6qYW+WOUkuBBFPlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLEnDvTlw3dg7whxbqZfy7lQjEKjLHk4YrwT+tSabJKy7vtGspOAS5dzuTEqU/UwQnPrqn1ZGW6rk1e/duOsBiNkxMcrVTpeZxmsu42SiTitZ5Hx2WbC6L7rcT0R8y/axJQXD1L16dAjnCfRJP+wLqveyElcFZNUf8Z/JNu1JXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fhyM1Ff9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CVGx
	YsbN06GrLC8ExIL+rpVxBNr6qYW+WOUkuBBFPlI=; b=fhyM1Ff9cBt8lrTOri4r
	laZfhkqahYRieFFws34ZLWLMnqTMddyCDpmtLYDhwhkXtPcq11eVBl66m1VYx6dG
	eEyP/K1GFAl8jT9jyoczGIubDk9pR9l1ita5u0pvLptfpeoxEqbC3qrfDEO3Z6Kp
	2vkZLMf5/Yz7OKRw0dGBXd/UfvpAPE2iNMKj3AWK1JH10Oisl3vHzjVDN2BEpFc3
	PaJuPrr3CwAkgZufwlPSk5YISosqJSVjbxExAWHPczZxaiWyqZqm2ct4T+cVl1a5
	Z+xyVQaRmkbW+dxYxLQtP8RB8RxZjV6H8uw/YbM5LC9C0V7eAOO2kIiTgDeL8zO5
	5g==
Received: (qmail 2060287 invoked from network); 14 Aug 2024 19:57:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 19:57:41 +0200
X-UD-Smtp-Session: l3s3148p1@sKdkdqgf8OkgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 19:57:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] i2c: testunit: add command to support versioning
 and test rep_start
Message-ID: <ZrzwFYEl8I8vPWQj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
 <20240811212317.16119-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/qvMj3QmOu+PIsVa"
Content-Disposition: inline
In-Reply-To: <20240811212317.16119-4-wsa+renesas@sang-engineering.com>


--/qvMj3QmOu+PIsVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 11:23:15PM +0200, Wolfram Sang wrote:
> For some devices, it is essential that controllers handle repeated start
> correctly and do not replace it with a stop/start combination. This
> addition helps to test that because it will only return a version string
> if repeated start is done properly.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--/qvMj3QmOu+PIsVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma88BUACgkQFA3kzBSg
KbbjPA//asbgVTnOoSh35lmne190vsWBCpdx+sTCMT5lwwhYGr8LNORncVdXQVyw
uevolMrdxmer0oJSYsLlBqhbYV+XgK1BVfNJl0xPxqcrG+veZhjnCdJe19GhmcoR
tmBWxlyJ4JAnoq/avWmSfVUX/G8mP1TTSYsLWSLqJay20HTcOrudmoAGANtLxTLL
d2yv5cAUm/29RS/JzRezro8xllpu3mimj4mXbTETPjW8XuAivYVhx1iHqd0D9aLk
Sc7jrov/BiCdm2/vLYa9d0g7RHAfxTjWIDpu0QAOlZlJ1mNLi6tsLYts7234ymEB
Oe6jMASoAehXA+frqxZjlzXKfva4Qz7bvFX4hlXTmBKnCY4Sq6W6uCEN4Ia17ViO
bJ5WUzocjWH/t9tvMxsHhaMSjRaN24X/7Wj2tKS+eWe7ZpUd7yPvcbbjamNcnqmE
0lhfImdJrSUdo0dQMMl1fB4HWhB6NhikKs/FQagWVqEA5F/BNG5KfpPIgi3NnEeY
zQpGvW/OAsgMESFW5Bhr8SWXc8UQs/HZivN4AKL4ZSYYB6H6lrkSjHxMdnlpg8i/
p1MWQTFIgCj5Cl15q8KMqFfXpM0QixI/Y8pce10FO4g3gzFSiESpRIjxovxMThQ2
UYdcQC3EHfQerwZYrRBY6FbxuCrM8XQpukTJxuH4QTUGF/eAj+g=
=hCr2
-----END PGP SIGNATURE-----

--/qvMj3QmOu+PIsVa--

