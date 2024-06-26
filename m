Return-Path: <linux-i2c+bounces-4373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996D917E3F
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 12:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 440C0281A58
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 10:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACDD17D897;
	Wed, 26 Jun 2024 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gvJYmCBp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B79177998
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398102; cv=none; b=GaVowNBnjFvJjvu2bKvolc92UFll4L8BiTWpwdsxL7nWUatvG+fduhXYKa5Y85eKIExA79/gUXK2Y9S4dTuqmiYOUyUkcLJUeV8Iz4QdhyGTwNEdxwE7wQCX0Qj8ee/aDGrW4zwVZ09fJPFzJ65OFc/0NnCUdhFQL4BN/9s5yHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398102; c=relaxed/simple;
	bh=Xrn8QjrTKic0FWpUpl2MPsmOR1qBgD0GotGN74At9NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKYDD3tGeB729W4eG74fhlO4oml6cmExALfqocWvkvOe5K8eFEHNhD4mDzqmFZZVE8mET1osJ0QAodnSpGbogtJuqKxfCBTpvxjirVhUMuTtZ93BKwrMOopPjb3tIygGdnTJ/vTYDn+Kd3mGFbz3iDrvq0MCo63MFf5CM8vWLNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gvJYmCBp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Xrn8
	QjrTKic0FWpUpl2MPsmOR1qBgD0GotGN74At9NU=; b=gvJYmCBpRuLO9KILOtwW
	tRf0eNMhuKJT0hpCVZge51zrRwdGOscpPBgp4lubco6rnp0ibFpU3+Y0188A06u/
	oLjuEHRqWGfg1mRQEFq9EZKtzSj2AdnK8u9oPctfCAHug0rJuQSjUQdvNVzFUnme
	J1NBQjHm5If/0E7MtUHTo5t+XA3BjvVJrq2vhDOGIHKNX4adoEgVEugwVV5OR7VL
	XW5Jk7ILsL4L1qnKEuBMLgljQn33QAMrAvkeDSADN2s+y1EHO1NU7CzKS2cI2jy9
	lif011QVBIWMVBeN5tvPaA5fBWkks/UhDUTgvz1siH6t5+/y3S2dI+9r67fgp7oE
	kw==
Received: (qmail 537462 invoked from network); 26 Jun 2024 12:34:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 12:34:58 +0200
X-UD-Smtp-Session: l3s3148p1@WGjbkMgblu0gAwDPX0AHAIitiwsdozO7
Date: Wed, 26 Jun 2024 12:34:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <2w65aczf7aqomb4mx4zy5ss5sgbgcets4wxorb6e2zzkjhaxxp@k2woqgb53l4v>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
References: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g7biocmjcni5vhdp"
Content-Disposition: inline
In-Reply-To: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>


--g7biocmjcni5vhdp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 10:31:31AM GMT, Uwe Kleine-K=C3=B6nig wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>=20
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>=20
> While add it, also remove a comma after the sentinel entry.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Totally buying the 'cleanup' argument :)

Applied to for-next, thanks!


--g7biocmjcni5vhdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ77tEACgkQFA3kzBSg
KbZJog//Wpwk5fo2h8PWM8YFShst5ft0U9TLPX+8tkDqa62240HzWFOrDjhfzocy
TyomQKesmqRf/XEMiW+dgpgVA2r40UEeGL5VQfb+JDjcvL3IkQ9hH6F6yxDfv4Z8
kbWIMq0Nm0EIc6e8T5ApIyCpaplqBpmgVikgP3c+QH2dgSV9JGWjtB455aSxg1eD
L+Vxo1HN7yFiDVlJc+sAFD4/j3ZUO9XuFn0bEyxGiZTmjgTWoubTMbJK7f4kVxDE
Pa1mIWe9Eif2+Szvr8FiX4hWkSmT++R+jqP2aERF3jVMbSixWYYTg0ZF9RHZmmJz
Li821EuEj/ykvj6J461MYCllvZ8lK/7+bKfmxnnEzpgv59S4HXyFv6xlS7Jla5x/
4BOLgBth3SfbIIlt7Eb3E+En5Zgk0QXCinzNffl5Y36b6mh1TRPFTRz64Z9vX/OM
TQQ7SjddYAqIdJQuXOQuP2M/BwqhnQGiTm47IpTyvQCx6JYvw4j0fRjaxGXAap7G
vCB1XU7m0zTUcJE1az/Wx53ghFLLI9vBRd8WSWZlEWBV0NwbQ9coaBjSZiLm/qCK
4S1ZWCHSWbBtHuVv7Snx/zxQAWsWb14myDaRUp41nwIAnPu60GtVj0hHhNCOg779
jZJR35LD9wf15Ct4w/zYbBAk4yQ4v6777fy1mUnxwDozPp9JP64=
=XiOM
-----END PGP SIGNATURE-----

--g7biocmjcni5vhdp--

