Return-Path: <linux-i2c+bounces-14310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC8C8D8B2
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7DA93A9BCD
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00812329C61;
	Thu, 27 Nov 2025 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKOBD/hp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAD8329C41
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235791; cv=none; b=elPeyS1sLq1VbTHjbLsMMb3UayZDM5uUp8owg95SAe6JoUry+yP9qMFpYC4f7WNM2e5icoECEWFrYEWPIP+3ISQKHsQSsxAnOhKlW6BPGrOtTN+l98XAN6jDN2+ivNZhs35uS+heiOUzQmo3J3q+Ma8J6yLTw2Rm4YFqH/P9S9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235791; c=relaxed/simple;
	bh=Wc2PpOCenk8efD3LHLhGFEMEJarnMlcDbW4Lo8rlLg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Na4t6/oM/0ZQ+tUwZmxq7Vpf7j0GU6OZ/EGHKeq9XHi8iScOEdNF3bmGi7UG+qG9rk/y1dL7xSegFiZK/qzXzObHn0fN+o7Nca1pCMDk7c1nBFvZp2F6afrTx15PCMFpMwH8R8NUsbats5I6OYiqsngNn6Eq+W/7WXAN2HoDfkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKOBD/hp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so2914635e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764235788; x=1764840588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bHohD/B8y1IALQgL+BLwCjzlOze2UaRFZ38SUoOZQDo=;
        b=KKOBD/hpqyGpSdUhO2sejGjOktOR4yPt44YZgjQB+984WFcXb6+vlkoQR1D27IXYFA
         27OICQum4U8WcoPJ7dpeb8VvAElNEWReJJIyLAwar1GD/YQ1aFzYzFemQM+N6DCK/NfE
         AQjZcWKciRlPcdXc9Jnaf6OCnW6Wzd3BCwPglbp4JeC9DTsbeTWbhfEc5PxLnU0dwd/x
         ZK+5Gxb/x8Pjv/k+lwaLe/x2ny18l/luLgmgBBR3La4DFtPP1P3JXR6lCSQNDRZ46G8f
         T3zmOsGwXDDW5F5NGEnPvt6r+jCb5pHa2H/agCHAZz+4ymGqxfMPBAIKyuZQYYFNsu2P
         VkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235788; x=1764840588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHohD/B8y1IALQgL+BLwCjzlOze2UaRFZ38SUoOZQDo=;
        b=m82FlHW3dqiTZFC7/KhTUnNt98xgKdTLd/premdZ/X+4f5kt4DNMU9/trTm0WjUQ/J
         x88qGG0WX0h3LdRFKue8KgB/m0qQjXkSzURSEZtV3mB4RqI2AhO9BS52z4bfts2Towka
         Yl6v9c0WNnLmPwr/r4zLzCxUcbvbepB6+WZC+xnIEoPpyi8VYzeRwvhompQIMJu8LUlw
         +EBvhE+0tp0elEY9EB8nPugynRLBAK3nATp3HRN46hCXIY9O9eWuQrmRFTQXXovGC8bl
         HtgCSNvnMiBgmmyQoQ2bdGEcJubhbD6N/vTdD8rhWS8ytmXbZohql0ov9FfRm3OKxcgq
         j4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVTvppKLmzuJyyK5gLbxMF3Gh1DVT3grJrjVPMBIpI6fHYzz489lY5ASKI8350+CXlyWOqum3ZgFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgM8VJiwckAHN58lIgjeMblsG/rQcl6+H7HeZbuDWmthhw1R42
	ahApW/2/WojOfeXqTe0I6RIbnNQRKLYKYvEOf5bsgTV3KUrwHEPaCs1q
X-Gm-Gg: ASbGnctJd8OTqSROF8klqAmrJa50zWqB7rSIzeHUsuP2n9CAUTb8x7ySbB4EDQS1sXN
	ZP3zlYiUNk8M7fOfGZO78d+UF11O2RPv4pPQeMDqNFWgfl9Lw+xgVIaPr4lVLquTV3Ak0AC6SNs
	ibj7VH1iPuI6YpVNN8SkW6wY6W5kKAw/xQuOr2erVYWQTE8PX8EDpF8m2RdPxrspywvgmjWXZEi
	WF4X8iuq9mo+IMc+QiLDXOU7gc8WkL9MZKQzaEixzMVaY5XVHJA4chW1nAlKCXOM4p1wL/RP0gp
	SxM08UlB9/DHBb8uE2uyvcECdowPyI+o24dWUDlM9IT6WmjnPh5LmbgA4R1npwZYBbbjLd9FB+z
	mJI0/iDSbaqFyXK7kWvpz2zrTR0rUABFmMHT7jGgExJCTT9LC49KDBp3WQEC/DFwFR/VlQySKlt
	IxpkojT03bR5yzdw68MZxXp9H16lEPd1YXt2F6l5FL1NrPGuOUJvJabd6AOcJbc0bfPtOtqZ+1k
	5qPJQ==
X-Google-Smtp-Source: AGHT+IHKqEIF/V+I2B0f9Lo5m5QMWhh8MYuPyM2RucPecJW1AL/cCgw0bMKVU/mVbUKgNcGGbyMD6g==
X-Received: by 2002:a05:6000:4205:b0:42b:3aca:5a86 with SMTP id ffacd0b85a97d-42cc1d6261bmr25852732f8f.57.1764235788387;
        Thu, 27 Nov 2025 01:29:48 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1caa5d02sm2342980f8f.36.2025.11.27.01.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:29:47 -0800 (PST)
Date: Thu, 27 Nov 2025 10:29:45 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 1/6] i2c: tegra: Do not configure DMA if not supported
Message-ID: <tyhys3dozh4ij6gznrfr4b3qfpd3urtwdugz2ojsmshbrlhtqv@zzxyxkk4ce7v>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzas4rqfc5ddrcnv"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-2-akhilrajeev@nvidia.com>


--yzas4rqfc5ddrcnv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 1/6] i2c: tegra: Do not configure DMA if not supported
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:15PM +0530, Akhil R wrote:
> From: Kartik Rajput <kkartik@nvidia.com>
>=20
> On Tegra264, not all I2C controllers have the necessary interface to
> GPC DMA, this causes failures when function tegra_i2c_init_dma()
> is called.
>=20
> Ensure that "dmas" device-tree property is present before initializing
> DMA in function tegra_i2c_init_dma().
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> v4 -> v9:
>         * Moved the condition down to have all dma checks together.
> v2 -> v4:
>         * Add debug print if DMA is not supported by the I2C controller.
> v1 -> v2:
>         * Update commit message to clarify that some I2C controllers may
>           not have the necessary interface to GPC DMA.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--yzas4rqfc5ddrcnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoGgkACgkQ3SOs138+
s6HUxA/9FRQ3aQg9+/hxZIriOkZGUuaj+ZC2TmeSEj8wxgc7ulilt23XgfTo1bAc
7dasC55jQ/SmLXuOSUh9ZSXdsoA6FNCEL1JlL5gFm4QL4kicuyK+xNccliTGXLdS
5jOh3emAgPYnJamfZN0XAkaTI7PO38qURrKK3r0rq47i75Rc+5tmImQZAeG6usMQ
/1wKNLNbvtTmdTgEWB2Gremkhjc1uribOIECufWWt9ihZxhopZBnJnMoJdvMJX+O
z2SlCUD9BqEOL67V6iebfz0AfluYBODla0dI8bToz2HhuaWSl2AES0hQO//1C/QE
MrojjqVWhNUOB+tZkxI6nb38coe5935ohfcfqprSnTUdYk87AmFjq8S/KEc4R1fQ
3RjMnzlmgaPbmOBPD2CYm+H9K8M1om9rLQwOgleWqQCvkEWdKt46bPjE7vpIppj6
RZJaCqh4aaKYu0M/TJBw70TXv/8ng7T6zyAePDYKun89H5DBmkg7i6wV/XPp6GX7
HoNwScoaIu2O1pulRSf2BbM9b77h8X/xcfi/VyzugEBxknbAFdwkO4HoBJFHtmMb
J24JvATRnSQVlOgd7ZmjwX+iHN6UjgcUEwEu2Y1qjtJ+E2MOm94YBQJkxdqr9O8e
IbG6zeZjw80jr67zyMEO37iMeSlAy+JqLjWZQJEK435hcY75hQ8=
=JDLL
-----END PGP SIGNATURE-----

--yzas4rqfc5ddrcnv--

