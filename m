Return-Path: <linux-i2c+bounces-4812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0892CB20
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C74F2281D50
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 06:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195CA64CEC;
	Wed, 10 Jul 2024 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GCASBJhn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009064AEF4
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 06:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720593112; cv=none; b=r7+wlIdld2rhjpXU2dGhpenkM/g8tQJq/ePRyKd8+VvYOy6EAgJndUgqMjGBq2jR1XbJRTKBSHeAFJd0+J5SCZzE8rB3f0PWgEewrFcDX0a/BVV+WkIAjzmwp0iG8lGK1ugBDCz9rQ4WgeaX469Ts6lSmKqvqoDTatrpnug5EJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720593112; c=relaxed/simple;
	bh=YNDrrTRBQSjhUMAakyE2kGoYvvxbKHmBOp6I/Rc0QpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3xAb/UAgz/7krvbRdDyZNQC/Dx6QENorZlDKRxzpNTXnsjwVLJPKWU2U9q4/TdaNa3jIKiC/h/FoES3G5nA/vbyyuiQMC/mQpwmkUR4qfHz5lSrUO6jUpTLxSkUWRrNH7dxTN99ITonbH3fZ6Y0HsayRuUTK7dPh0I9QoAHOcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GCASBJhn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YNDr
	rTRBQSjhUMAakyE2kGoYvvxbKHmBOp6I/Rc0QpM=; b=GCASBJhnrUssM10ejZm9
	xA8xARZloXym1g7Fyzef3UUj69nj02V2BUKy9hvzADge2vvUJ+dXvCOfSsqGZXWD
	vKwedEiUVRocwlT4aCYF3q7f+whxxmfUBhF/P9LuKQGPAJQr1KpYG1H0iS0PjqM6
	aKMlc2GbYxVZ8EYFGU+U70cXU54zomHQ11U+02xAm0TBqpYEbnNBgp9giAtMIbfg
	TquFpXgwkzJ61OLPcC1yGHNFftZlOz1eeoAaru6IXwVkVwqNq4TtNemawF7qdltV
	v0eSl+dhZLifZwvqh5VHWqBnkoCWT7QTC/Q47Hp0QLKImCHgwu3N6sRpVTRZ3R7G
	FQ==
Received: (qmail 430513 invoked from network); 10 Jul 2024 08:31:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jul 2024 08:31:48 +0200
X-UD-Smtp-Session: l3s3148p1@8FcKzd4cPrAujnsa
Date: Wed, 10 Jul 2024 08:31:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: add debug message for detected HostNotify alerts
Message-ID: <Zo4q1NeXY-cI2GhD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240704032940.4268-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lNfHY2uifUQlosPe"
Content-Disposition: inline
In-Reply-To: <20240704032940.4268-2-wsa+renesas@sang-engineering.com>


--lNfHY2uifUQlosPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 05:28:59AM +0200, Wolfram Sang wrote:
> Setting up HostNotify can be tricky. Support debugging by stating
> when a HostNotify alert was received independent of the irq being
> mapped. Especially useful with the in-kernel i2c testunit. Update
> documentation as well.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-next, thanks!


--lNfHY2uifUQlosPe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaOKtQACgkQFA3kzBSg
KbZ7Fw/6A8i37TXaEbXEtYmoR7BsLnIcOdYClfNGNCbg3+AReDDs3lHRTRmtHJUA
v6Gn5EmgfBpBKi6potQf2mCrqGvosJrvwNdtk5/ydsMf9xRGp8p7MKFElMZoocQ1
det8Br9vzh6WXLtfnaU6vOyICp/gE1TUkzlQ032HMf/iFdTAEibogSRGZXpzu26u
sMIanEOiZ55++SOhXccY7yflvEggnAcZS93RPq1675FVeQxgBLp1t/VtsCgsITRN
4/x7ydn3renfwI851lngio8eF16wKoY9541SJWRIHFtSgvCcIfRGr/LNZZfKehEq
9Gutmjig1jFnB/Nma2iBknclzeyl9B+MEG+CExA1QZH0KgpjrpvydiWH5Ny8z0gY
FH5Nq/ivOZEES3K7YeTDuq8hEl6XUJXlEniL/+OWULMmx+CoDBJUeS2zBg6aNP68
Qt7/9llHwNyKIEaoQrxETfC3WP3I/wmXXiliHFI2RhJRh2dZblpHQ6ve66YXN0mb
jCgOX9udkxTLrwgdqJcZUSRDdHZEM5vSe5uDiu9gnEpEiS+hjS3CmopbaEn6dGx8
6nksdnAFsyocdCAW1WLxfw8lzaWhFvaCXjbJyXwAIxMhui6skoVAjvA0EXPB9nJ7
ocUh4cRXo8ITHNGMDGY0ND5N3L1AQ3YcE7jPJCognoL+PwcdwwQ=
=G+fr
-----END PGP SIGNATURE-----

--lNfHY2uifUQlosPe--

