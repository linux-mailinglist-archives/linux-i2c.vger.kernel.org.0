Return-Path: <linux-i2c+bounces-13250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79BBA63DE
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 00:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D33A17F4CD
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 22:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8F323909F;
	Sat, 27 Sep 2025 22:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZOn9qXbe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F15F2367D2
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759011268; cv=none; b=ehe96o0mIa2BAoNsgqj8QjogwDI3k9P4dQBmMwlmq9bD9snB6MH+W/R0zlIuLz0YZEnxmvn/KxMsYH74OxZYd0cVE5EpdazNOpXkDKkbLrpSNs6Mnv1iCANRo8eFoHFmX00esBS73IdNBT28A94GaD19aRflW27KFGW9sKaOKSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759011268; c=relaxed/simple;
	bh=thGhgPgh9nVsmWiLy9/kzUlePGKD+rPk4/eccJY97C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5SsyUu747igcFZ2Pulw3HpaFT60cOyIqZ8S3UzFygLym3UEVtgwAl8SVHgtBZhpKjAQgRxfyT0Xe7hNCI7wFc6JCSyH1k0f7zU8t8H4kywztZgjtrD4WyrxwxmpyE+EM0Lu9MS1JKflGQmAxu8J6eYD90jgQdNvydcWnkFUTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZOn9qXbe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=thGh
	gPgh9nVsmWiLy9/kzUlePGKD+rPk4/eccJY97C8=; b=ZOn9qXbeoCpD0K6PMsjO
	+7Ec1P3SGjTbvO+LcLUj6HskGENMFnLvePtppusbXNVlY/f0RRXLnFFn1dqo0MiY
	DWY5i7Zcb5U1BKhSQeohS59GYXT8g1g0eSjWzJBxanUL/d8sOlc4hzQhAuAd0B77
	6YUwa6vv0uL7xbgnnf9Q8hwhytuiwjN+WZnNzvzY8AwI+QUzqdRmVHeWZem6ZpC5
	3o6AHJFDbsTntk2jF/dr8cSHb/CUp0vSodmuhWSGGsijPhdGDZHM9kaak+eq0ZRD
	O1KEstlfNOO+d6jZSqbrsQUXaws6gxCrs+Qw1hWc3PrjnqZTkhlYrXrfcINTmYJx
	Hg==
Received: (qmail 2699930 invoked from network); 28 Sep 2025 00:14:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:14:16 +0200
X-UD-Smtp-Session: l3s3148p1@3rMMuc8/Pp8ujnsw
Date: Sun, 28 Sep 2025 00:14:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.18
Message-ID: <aNhht998M74XeIYN@shikoro>
References: <4osuv4vajewmcpgl5sqnea47addwsrm7nfl3s57ymwv7vaxade@unuwhsw4ccnx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MUd36uoUyHy3gn+L"
Content-Disposition: inline
In-Reply-To: <4osuv4vajewmcpgl5sqnea47addwsrm7nfl3s57ymwv7vaxade@unuwhsw4ccnx>


--MUd36uoUyHy3gn+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> this merge window pull request is rather small, and the blame is
> all on me. It has been a very messy period, leaving me with
> little time to look after the patches for 6.18.

I hope the messy things are gone by now...

> For now, I hope you will not mind a second part of this pull
> request, where I plan to include the most obvious patches from
> those still in the queue.

No worries...

> Thank you and wishing you a great weekend,

You, too!

Pulled.


--MUd36uoUyHy3gn+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjYYbAACgkQFA3kzBSg
KbbCmg//RyQgIEgrNYK7OG9aS9akPmfda6v3XVrVuKKoNVCyVSYmgS8/gH/kVCXb
VAJvJwuTxArTpGEUSj9TgRoT8BOmObHhwZ3n9D63o6c5NOLEtXsLUfbvdWqxryIi
MGFT7fL1XrwYdAG3iBT7xC9iMFCVedGx9/0MkicvHWUMfQOwN/LAyXVYO6YinwOC
LZcuao+9ddVZ1d3rgpw8pouSi+QsA+8PiSsiDrmSixlrkC8RBm6t+3rR12YsnU27
/m9vEc8/39DX4snT2HuQyrBQWNoQULEs/RNm82D9xSJOtoIxL61Feu8qua1z7Jcs
li2A+i8LMAvj1J2BP99AnOmUt4isIUTQPqjp/SY7m9Pe1Yii+B3ODgFzhLdV0xuz
RmJcOchGa3ZTBVN9eEZH89Qbp9Ftvz4tQmYbv1/PugdMhz4hLF9WtnyCas7FeviM
mRJQH0pmelpmUq5ya8d0a6rAt48uuK/GKKKtk5u0W6rbA0k20J+qx1ElioZVlB/w
FveO73oNsMDo0q0p06iydA7GgwtA/6ExumcHKzspFEl8HlGtk4nNgRmgLUXPTKYl
KRraUON0tJESy6sHfNBq+jZ1mKxq7JXkxz5Q16XrYEfE9CYA/wGVtUNE5fsG4AmM
zgxmZpeauEMdMSw3ZUWqV1NvcVmoe6qNr46GXVTmRhOp4aVjMEk=
=oQBQ
-----END PGP SIGNATURE-----

--MUd36uoUyHy3gn+L--

