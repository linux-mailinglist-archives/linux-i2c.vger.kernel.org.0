Return-Path: <linux-i2c+bounces-4385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB569199A4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 23:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F3AD1F23542
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 21:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BB0193061;
	Wed, 26 Jun 2024 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mOHEY6Gj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820B114D6EB
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719436302; cv=none; b=JKInkI6L0KYUp6SwQkq0K1RWOF01n8U5icW3cpHbH5HDG5AXK9s1ximkoOQvuHBklyeRNJZAAy3zf/0rcUlPRZGUsj6jw5Htb70F6NhieqAe3xoltyf14OzWRcokK44T4jvMgIBGaKSKaoXoAsc46H64DfX4Yh/vfITzWF2NHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719436302; c=relaxed/simple;
	bh=hbiWWQ/oJDugE828YMkvhtxF/pjFeiNW8Uwklnmn2ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZ6CAK+CdIPVat0s4eaQoubZj5NcnmgwzTm42lfzz9Y8IAoCHyLKb6mULrQXMFvdY/H3aI71lRf0GcRbYNQQO4nO/7VIoYVyGR89C8Bwrh/hFyMdsdHqvsKi7EbN5TFFWiwpWhJwn+BQUb9G/OW1YUn9bHqQo9eDiruSNaqR9A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mOHEY6Gj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hbiW
	WQ/oJDugE828YMkvhtxF/pjFeiNW8Uwklnmn2ac=; b=mOHEY6GjA6d6V82w4lcZ
	OlK9bSNCZXonkxcFdCEj8PhFOfZRfPUGeP4hpTaW9kkHUfHsiYLreZ1RP5zTuPe1
	NMR4ZQdujGaAA/JCHnaEsUvLn8Tf4K0jzfqSrIjjerMuUK0i1Hm5GPYygXvX8iaz
	efRkuFpS4iUbWswqww5SCCo1AO6rQE5xciwutrLETxIcJ1gnSa+Hp/N+b5iITJV0
	NwrdZTYP4kQQU/Pz84HLg//EaNxB16+tm9HZeXXqZR+YcajDfoo5wYuLDRBchYI1
	wfKDouqzazg5Utg1TyoQVoXHTwxZknW66fKrwQK4TteODuOVfgJNhcJGF0WVHfmz
	Tg==
Received: (qmail 696487 invoked from network); 26 Jun 2024 23:11:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 23:11:30 +0200
X-UD-Smtp-Session: l3s3148p1@9KVIddEb8M1ehhrE
Date: Wed, 26 Jun 2024 23:11:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <x7fvsdutlbkraxhtg6vkwtkhvyelwf2gajcj6ofcz4vdvn4qmt@ubmfls3wzksy>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
References: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>
 <rb2fmtnhaqicg2behqfijfypfsvkqatud4h6klal77u6scw2gp@cznyn5vof4x4>
 <pja67neo74zw6rqpv5n7ekivlhejbmpuge6umtuatwhgjbmcwr@7u7f7vhpnwtt>
 <siwnljn7t22tsqybv6w3dndhuiynhvudtshkmyh67q6kyxjl6j@wuisjuqlovyg>
 <i25xsy5nnefy2gkk4htkhcxd2ifgpn5ljhps4kd7ixn3tcy5to@gd7vrvgjvbj4>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oqixy7aqgvzkwkjx"
Content-Disposition: inline
In-Reply-To: <i25xsy5nnefy2gkk4htkhcxd2ifgpn5ljhps4kd7ixn3tcy5to@gd7vrvgjvbj4>


--oqixy7aqgvzkwkjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Getting these all into alignment, maybe even picking a better name than
> "driver_data", would be the eventual goal. IMHO "driver_data" vs
> "data_ptr" looks strange, maybe I'd prefer "driver_ptr" over
> "data" and "data_ptr"?!

driver_data_ptr?


--oqixy7aqgvzkwkjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ8g/0ACgkQFA3kzBSg
KbZpEA//adOwJrbw34qC66Liru9eGMHDvIfwnty4yciceaIPb1g/LJsv0ylxE0jK
PV6Jck1SFJaKpj+gQhiDDoa4e96u4hnCebUDXtVvOm9yrPjl7ZAQyu5Q21RLd3Ra
h6srvW+BcRZORMDYRjG5fWXVLBRYAsw1AxADG0NAmHYrJdbilXdvUIX5hJH/ZN+5
++NLzSVYmfV3c7LBoXY3B2ZA4On0UuIF2qB9nkdQnAidM6n9dSQDKNNtxWsXObmP
om64VS1BNDRCESJBiZJMcr2vEMnUsu7bT6OJBPFz2jm2S46gTurUTpAYL5zhafsE
Ji1unK/gDyK6IMtGvh7qzUBkvnACm2+bO11lxEFZCRhVAoswZDCEibaWrxr0//by
+mVxFfREUlO+AFYgJAx3clCzUp6xC5GMfer88WsyBYIThnNPfqf9m2bc3YtqnzO4
/iA7WycufwENI2u80Krc28z0S97J7wBm58E6f7Bm0dYUQZo+AVINZ/2WLeDLrJ7E
tWw9MQyY/CFPDTwqIPMIeAoue5YmLLc+8KS1/+rMZE7FjOe4nvA3MjEMZPUOFmvE
PDoQW6wiKeGn8LQ5AxVh+tzvB7GTHpkNPFtoMEjaP0g22crHMxR7bZrf7Z0VR+xN
dGekO1AsSkh4rvuBktEzjYanqO6PvCo2bo4Q6/02N5Lu7dMqtz0=
=HD+Y
-----END PGP SIGNATURE-----

--oqixy7aqgvzkwkjx--

