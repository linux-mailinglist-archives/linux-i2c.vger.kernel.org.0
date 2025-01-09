Return-Path: <linux-i2c+bounces-8993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C6A07259
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 11:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F5D6164F84
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C369D215162;
	Thu,  9 Jan 2025 10:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y4oVVTRH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77E819E965
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416944; cv=none; b=mbXDFEwI9SVwDGONWdbHGD/9jbqU7u4lpQzmDyxLiy7LUQPSJHMXOIUY5+zijwidflG4I4ZfAFHjjkyjwgvruzAiAIUTDhg9X7tJAYlNrxOjmgho0lf/yxJ1eGaNKfOf6p3FIhINtfcLk6gGmdZtwsO0EaJzTLMnUacV5DtDmjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416944; c=relaxed/simple;
	bh=1577rdG/nkB7pRX1aCc7M/niKYu6L5qSdshNrIy/a+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHmrTtcBy3ZIXAhh7BD43oaI9pZ2sEPL4PfK6Aqi/HvJg/RjWf6yIS6yfKZQGQJZ3qHTNGAVpKew6+MGMhM+zgZ6eZnY1JQHqWgpZiz1yBnHg0xpEb9zF5cUZByZrBD7oZ0Oi8FgezE2YgZm/l+k1dyMFb83J2bBR4CQ8XGwF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y4oVVTRH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1577
	rdG/nkB7pRX1aCc7M/niKYu6L5qSdshNrIy/a+c=; b=Y4oVVTRHDwoyJ+NHNTjg
	x8BLeJXRF0+WARfxDiTqzMFscyhQa3fnyyK/ZvMf215yzt0WnW3Aa4hCH6sBld4L
	ltMgnpHzfZrpi8+hAv3CDUYaWshNQpR8uEdG567c3LR+RS3YV65wl74B6GKW764C
	G/37y+841EMljhMIKvLpmctuJDnREmW2gg3aBNLGJUur2XXdH9/VYSq8xWRDB+oF
	WyxV0veW3zFYT7q46Pc/mmScS/xe9KKLfcXr6f0BKMTWQAEpN/y53ilRFuzcfEko
	vr0IU+5qJ9eAGBRqmrsKGgtvkb/sYo/l6xUt/13RN+sUYCdePoz/vWHyXXMn9Xv9
	pg==
Received: (qmail 2861738 invoked from network); 9 Jan 2025 11:02:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 11:02:18 +0100
X-UD-Smtp-Session: l3s3148p1@iZ7CEkMrgosgAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 11:02:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: core: fix reference leak in i2c_register_adapter()
Message-ID: <Z3-eqecAEowpTF6P@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, linux-i2c@vger.kernel.org
References: <20241211030803.191789-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ygjXfAgA2cHrTmkc"
Content-Disposition: inline
In-Reply-To: <20241211030803.191789-1-joe@pf.is.s.u-tokyo.ac.jp>


--ygjXfAgA2cHrTmkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 12:08:03PM +0900, Joe Hattori wrote:
> The reference count of the device incremented in device_initialize() is
> not decremented when device_add() fails. Add a put_device() call before
> returning from the function.
>=20
> This bug was found by an experimental static analysis tool that I am
> developing.
>=20
> Fixes: 60f68597024d ("i2c: core: Setup i2c_adapter runtime-pm before call=
ing device_add()")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Applied to for-current, thanks!


--ygjXfAgA2cHrTmkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/nqUACgkQFA3kzBSg
KbaVEhAAlytx6ij3gWxdeuJ/tW+Tj+TSXokY9qrBST4iKGdLMAQBM6+TIGpxL8jG
uYzOQmC2XuQg56L+WOqYsmN/vDYx7KxH8UbDb/I3vwPHlob6CaMhkkfhBZDA/TUO
9FVB+Em9iPNcNwSUIPGyxZQP445b5eJmCxNfLnBUQ/1soeROZjpI8kIebApcsWC9
eDSD72H/bMgQuGZy2M7pCflZJl4kkbLvw06cZDOcIGFDTuAl2Y3VVPK5Rg5wD+IF
a4ziBWZNaFf4fVz+R3LcYZsZwvaqagp+Us15F2N+8WnZc0fXnwHvXdHIX9G21w7l
vzEh8phYnq1RPCMC5AoYNiesIoJK4ZWw4EB7VZd5EIL+kA+NjUT6z9XVosldB0Cm
C9nuVU03mtd8B9jvkWKf7jwsTE7NQotfgiuir5aw/NuE24FPrmZ0CbueNqZmNYrh
F1xZlXxFHuqrFPL03Ll6ULhGKjGlLsfKOjVvasNJqzMmyNlJMaVCmhntvx7xbIcP
3e4wm1EbxntHoD5eIaiPYXR3yvn2GqdoPaLx2T7fS2FubpNu/Iis2UFXq5ZH1Clm
3GZyiDFMmehDNDfH9gba7cVX9D/81JbfUzdEkeGX4pO92DhLbRWG7UsueVdrMV+u
fQcemhNaUu6xDk3T5sDDqJqZn2cwtkAfSCPY5i6CIqhz/XtUlMg=
=PX6W
-----END PGP SIGNATURE-----

--ygjXfAgA2cHrTmkc--

