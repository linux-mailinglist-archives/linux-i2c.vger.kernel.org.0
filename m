Return-Path: <linux-i2c+bounces-13121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F78B974A4
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 21:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 655623B3E87
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 19:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124F92DE70D;
	Tue, 23 Sep 2025 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HmOgefR2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726A2FB0BF
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758654491; cv=none; b=f5P9yjeCX6SdSGXCkNf4tqSKUxTjyaxw+U5EruzeTuana8zkBFCt+CcgT9Hah0ubPjitDuVcTqAVfPtsRqv+IE0DCBi/+k4qIfA6THdWqVa9a8WLTDgw6BJsahJNSKy+riw76F8n+jfDfOXgI++AWnmReZyW+Ez47eOrBBhVAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758654491; c=relaxed/simple;
	bh=ZJC5KaV2fLMJ8TZNBjC877m/RBczJLlVpRz1fVPL3Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6djpvG4XykhIFLyZ+pmhhu6zmAt/i/itntWtVNzX1gg06NULf11CoXfx2GhfKr6HhrQHaEjlKYjYCke/Kwkw7q5M5+wh6kGrOHD+VU4UqbpCmqi4sVKvsJgsox6zN9jNUKi+BoPETEM9XzuVybBXs/Sg2SKrgva8xCmm++1OkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HmOgefR2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DuJC
	TM80/1HgDUEunyWnF0ZeIwO41L91UXV61dWNYTU=; b=HmOgefR2KsXefoCAeAqA
	3Ni7V9j7gwrsghtvPzuu2GO6PMzoCe32eIqfNP5ZD3xubWXb/dRdq0UtnzHONQHM
	kKfHtkMU1+iMKE5LLVFJyUbjrdMgGqDYJypEc1luuruGfSriXk66P+e1sUoJgIa1
	cAKMUxNTp7Tu0ZOaFpn4iMqKJ7POG6O0C+ozuvETNM5NM8simCejJ+ze2MZkTLcG
	X1vnqJ/NzJyBjzO1SFOkekT5A5V+pdfnCq9EE8083/mpVxcrGnKiQWDZe2iavdEb
	NHDJkjBmDblmkfMzfmEJVeCy4eb+DS4R3+qxsVXpbJGrQP5H6yuUc5ZyuhA5IvUY
	zQ==
Received: (qmail 1215635 invoked from network); 23 Sep 2025 21:08:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 21:08:01 +0200
X-UD-Smtp-Session: l3s3148p1@Jq6mp3w/9Mgujnsp
Date: Tue, 23 Sep 2025 21:08:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24 updates for v6.18-rc1
Message-ID: <aNLwEevzIW0GJ64c@shikoro>
References: <20250918081624.6619-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="207P6gq7ypB70WKJ"
Content-Disposition: inline
In-Reply-To: <20250918081624.6619-1-brgl@bgdev.pl>


--207P6gq7ypB70WKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 10:16:24AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Wolfram,
>=20
> Please pull the following set of updates for the next merge window.
>=20
> Thanks,
> Bartosz
>=20
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v6.18-rc1
>=20
> for you to fetch changes up to c7ec58c39b0252e6635dde55e5c708132ab25cfc:
>=20
>   dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C (2025-0=
9-11 15:19:02 +0200)

Thanks, pulled!


--207P6gq7ypB70WKJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjS8A0ACgkQFA3kzBSg
KbYMgRAAtRZRV8e2diDCPuGauMJYVZlwxNkOq0sypIzCkWeyQTD7li+83O/0Pejl
Z7uDhYihhnlBqB68zZq7w8YNp+wCbOLLRMtPDLAJzLyDQGSsBC9NEebbzYEahZ8D
2W8kG+MrPBiZ1NgUD5ahv8Zy8gpVba9YBkmEKVKItsL1XlH43nqfE65wVhFSXWWR
/S6Ok5Apki5pJgpC6LokOGq1/Q1hKfMb9KzJnGXCDIoP4i63A0LzRQ4HrZaKhAuH
vNgRoeV7MNNEc5ycJ2elTkrGkIhI9PEP5YhVPLuTwZ2KAbeNg/wdoHx1cnjK0v8O
gnHdzQhYv65EYHQhjL2g6FCJWhMEkzG4D7PbdZ15nPtDIYRxYGDDoQKBnFoDdQdT
u21HdJjMqjMFrEG1rLSxtefkVUAE/yNS7efZjIUMlKLit6bdPUcLQIOsl0HiApG0
6DKs0Cy3v/Ry80r6FFW0/vaniuZWkhkrAfYt+ir4kKIa5TDzXiqMp1RE5TFlZ04f
oh3zNJGg3GR1aYUTXh8TjoHowtzpj+znr39zMk+GfWgISfMrr2XvfmItohVLxPbS
Ny+wvzDuciKOlXyRMZwqD5fOYCZcyjO4gEO4AHEcef9nQB3BB87RnxVwLQiLHZRc
9q31u6mMIMGqZTzOybVjns5CClZCXGSMDWC10LocnRJM/0dpmlo=
=Pbd0
-----END PGP SIGNATURE-----

--207P6gq7ypB70WKJ--

