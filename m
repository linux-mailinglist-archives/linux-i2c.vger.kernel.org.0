Return-Path: <linux-i2c+bounces-8245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FCB9DA6AE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 12:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AF2516695D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 11:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC021EE00F;
	Wed, 27 Nov 2024 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CdtAx3KB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2E19538D
	for <linux-i2c@vger.kernel.org>; Wed, 27 Nov 2024 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706187; cv=none; b=une9WLQWXA3uOf6bOfA5zFGnsRfkyYErm0m21anbbTkZikHV8z3E8+hfOSNbUlGcx1IjhfZUrg0y2gfp/p8faobZzo1C6nK2C9wPn10ITAXZO/Am+qHtGPed7Nv7S29v7Lj5qK8os3wOZcGaZIHiX8C5rFxRaLfF2tzFyO8lnz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706187; c=relaxed/simple;
	bh=12DqePLKoTrEy4MFBKf2pq2QIO8hf39o64WQAb2Jn8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0BTVk1Vcgq6gwTWlpu8hZxDbPBdSn3AdryHGNTEBd2Qs6TrJGxmpZdDBkFVjrVAlLGWhDw82Ye8E240iqiSM46tV8im2lofVhwA7iVIw2JQuRYSCjbCgu3qkriVv8OkZ4dgcFXuAnKpx374gE1XthfGG8+RP/fO5GYDNno5Qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CdtAx3KB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=12Dq
	ePLKoTrEy4MFBKf2pq2QIO8hf39o64WQAb2Jn8w=; b=CdtAx3KB0YICFDFVfczE
	4JUiYove8hph0vLsd7cIgmSUVQ+pr+9AoP41cqJHm+SsNM3lvPdNimaJOBFD9oSM
	H4CoVY6deMuSbMAd+6wiQ9CCGhSgQgvg74txg9RB3uSKqgQAKBg0JmQPIgfpUBsI
	YnAfUy7D1LChHIKnSabgTcywPNL1py9dTZdHOmDj2Fd+RUkk3sC5Ag2DnAFewOXn
	yn7nEGSFSUHEKFYhQPm1bHZVl5jZXPjnSe0ovLcfltTFHiUgHYviFDxn17jM1gel
	Fxj6ic1I5bbDlpYz0ATLWSQIpuhTFklXtxOHShGNbB4426S9gEHtjkgHlXG+lV55
	+w==
Received: (qmail 533524 invoked from network); 27 Nov 2024 12:16:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Nov 2024 12:16:16 +0100
X-UD-Smtp-Session: l3s3148p1@hlggGOMnatMujntz
Date: Wed, 27 Nov 2024 12:16:15 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wolfram Sang <wsa@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v11 0/7] platform/chrome: Introduce DT hardware prober
Message-ID: <Z0b_f0gg9KgSozPH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Wolfram Sang <wsa@kernel.org>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <CAGXv+5Fzrz9sBvE=FpV6URpcZtxvchxfY9WE4k4s+S3BzMWw2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HQnyox1fdhJ456xp"
Content-Disposition: inline
In-Reply-To: <CAGXv+5Fzrz9sBvE=FpV6URpcZtxvchxfY9WE4k4s+S3BzMWw2g@mail.gmail.com>


--HQnyox1fdhJ456xp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Just checking in. I just wanted to make sure that this is still on
> track for v6.13-rc1.

Eeeks, not only Andi was so busy that he lost track of patches. Please
accept my apologies, I was under the impression that this series was
still under discussion. I sadly missed that it was ready for prime time.

That being said, I applied it now and will send it to Linus by the end
of the week. Sadly, this series was not exposed to -next before, so I
hope a few days of -next will work for him.

But I will surely try. Sorry again!


--HQnyox1fdhJ456xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdG/3wACgkQFA3kzBSg
KbaO8Q//YQ/9g1dt8JdYH661u4RqF4lC38vtKoaZJEADzExdg71xeJQx5nw4Ucg7
wdvlvIVqq2quH31KM5oOz04t7bglWhsqGlLUUG5CAe3W55tjNpJYgBEnBQs+9ylf
VdxC/3js3Z2K07RQmCiCGDZuyF7eLkc0AOYrWg6vnGKpnZWO8aTsDRSe6XsDXFPF
saOY5F3nwjwpoOmUT/qY2ezh/Cls0qClCdXbvoSj5p6+XHcRObtGuMBCSdiYo9uU
Ec+25hpHSYChlEA0PdlXzw2jObBfp0fOUNWBqadOgAuYsLwK02jI90fvhymPRsiM
HJD8H1L2oulpK3VayJtRhjQowUW3UrdcdleoOwq91TY32vrlZ6SDtO/C8WphUqT+
ORaJHqIeBZSW2nwAXBOepoid1JR2pPYiEWZ02kfaKvG0g/sMFoHyXV9OB9GAWyRT
hNQPXZBFS0LV+6J7pIzmxjXxugwrTnI7AWJlGHGjxYxjc42Y9C8H7H8JfkadRuAW
w3wcqoPXRJUZsg3GZHBCwIDYtXgr3q7J2iwDPe5h/cDFE5CbtsCL8O8iV9NNqrjF
T928c/gxQjsRotHFRUBfihhIia/M2zLB8M6Rq+KRzaCCy78UiZkRhiDinstbzlki
sI0XLrvQAEQVgoJNDsr7K2orxIcijqjlZ0k6pqNf4roXjJJ8Hxc=
=h8vf
-----END PGP SIGNATURE-----

--HQnyox1fdhJ456xp--

