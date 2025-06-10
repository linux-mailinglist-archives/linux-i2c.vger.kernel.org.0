Return-Path: <linux-i2c+bounces-11322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D652AD2F71
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 10:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21F537A6027
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 08:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9816628001A;
	Tue, 10 Jun 2025 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asf8Hhy6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD2025DD01;
	Tue, 10 Jun 2025 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542636; cv=none; b=Te19PWncqiLXiHnRK15G3+t262QH8H9ky4l6aCjIFVFme111rKHd8K1WRMPqCmjC6XSP/TuRtPmJNhomTJmTUMPPlZEvJSZCxJPXS+rvRI6uzDBQYo+YToffa09WUN86xe/XuCedpbxYm0kqK105LQRyT/BvUUhsH0q+J4j24lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542636; c=relaxed/simple;
	bh=FAtdwYBsvXPEoaHjvFc5YGiljKWciSkc5F7Z0z2W1uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9jf2QfGZTO9zu6KIh1UrFLMnt9SjD2rkqNLUf5qmY6by8UKDVHpnyaR1TzdTEbwysJKPgAJvtIdKIco0KnVbDJg3wH8aSVTtT9BCq6Cpl0ej3W04rCDhkfaOTAFOc0yn93hljkQns79T3ORWAWJ5cCYKKUQx7NaKLmVf/TJr9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asf8Hhy6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so2919443f8f.1;
        Tue, 10 Jun 2025 01:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749542633; x=1750147433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DwGvEtjKqTYeRC5wubNZzZpVFyth2ZZSuQ1hnRxcHZI=;
        b=asf8Hhy6rhNsLmcG33qKz7wKHDf6ll4w7zlMet7HhToXKCEqZT6KelEDy3Iw7b8APw
         cqKpnmV8geiEQdRURVG70cEkHemIQg4POtDv5UppGv10TCHghr4NjW+G4gxOi8erkQ9Y
         lXbfJivrEdW1Q5tGuAdcDH1Jt6z22Kye2XLVwKnQZL9VxFm+ksapcUV7MISUtDxzLtdp
         vsroS403Im2j7D8yAgCnoVasRObasf8VAkWlpHyHEm3gdxk+S8wTrvWPQJLjcF/8pjvR
         Ml7uECj/k3LJSFpug2RaiJY1xYtqC9F/EnwsUnwfXtQ9F+N59oN/9OdNgqIQfE2qMCVU
         3nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749542633; x=1750147433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwGvEtjKqTYeRC5wubNZzZpVFyth2ZZSuQ1hnRxcHZI=;
        b=DFbTzqQXA6UD20dgHL9eRhpp9e4N1bXa7zncBPtOXyJ1xY4XcipCHw7Nuyxxw1RlM0
         FiRBMMmZxgW51P5nN/sp6k3KGjJO8i7zpZF9sA39B+A1wchqWyBOPjYVV5bOqrHvwLzO
         uQWDWyqzr1NipwVlZjlGKN3X3vpCCw9mSQyyMgTQiZpuqMMkcVoxLnCZxV265DEfvq+H
         Ztj1MOL03W55bpNtcxnJHnnDG/DEu8xe74za3QpEr+eGMoR7p8ES0LLzxQ2HCf8ZIPdq
         5SFcbkoCbK/g96b3xU4Xj4jO+la+Te0zq0ZiHH7BNw0nvoAmcMXUULbQVM7rV6zqoe9w
         frLg==
X-Forwarded-Encrypted: i=1; AJvYcCVE/6taAP0u/Izod1vgDrUplppd6xi6xloNAKanKakbWKon9nEsrRfvwiX7TQYE8md3r9yGtYVnMyff@vger.kernel.org, AJvYcCWJMPDJhDZZMfi2LSh98tojRMfJETFh69ftMGwx92Zc3uWBZrVyn7jec9/OS8SGFr9qx8d0TYOgKPqg7tg=@vger.kernel.org, AJvYcCWh9qi23YXz/LPruLwozW3p3REDPNKC6Oii76vnSogRRvG8x+k0gk76KXMSNWL2y5V5V7KDvqP6EZzk@vger.kernel.org, AJvYcCWwkU5tp/t3xl8V5G6NSjoS1BZ042j++ncyB2dmHsZ0iz7IPUtToMOx10yrofewBHisUFuAH80tpcxoCz1S@vger.kernel.org
X-Gm-Message-State: AOJu0YzeO5RhwzDkllvcnqOFDIya2Ru27BlWVjefhTytTtl3w/jPNH9i
	RaEsSQ8keWYcJJnRTO5RMl26oHr92UJ+IZU7WZhK3j3SdzQkccUcdU/C0QCQLg==
X-Gm-Gg: ASbGncthXYA8IKC29bHdSiveRb8fn4gXDeO7poKLnCl3BF6KhH+/Lyke/nWyj0774/4
	21GUCrSaWEQymQQUBHqjNNj8ozoIRKJG53YyNUA9qEn5Tb2m+l/Hn9hjMxuJnjCvJx8YyIa4T2D
	vUAIn8qmhnaN/qnoe/dkjyRFT1Rh1jaJy5Dcw0WrxZHoiMgZTpkRcmBZVqU3NIPSOOu5s42N7rE
	TUmmERBkZ7WiUkDkbG6O2ATw62+k7seRvcW9zw2XMDVVCrLbsUGacm82qGKMq2jL2EuCm1BBFFb
	IXYe0YqpHvReDbydX0adBGcwRFMtIsg8eFAtxGWp0zkmmv2u/OZXax8s9eFwvz8PuHCNlbg+MLh
	/zSahsCFj+kCkvlMZ9V3MGB56sw3VdSGi+m3vZe7sIi5c5HGhZYDPcsRecRE=
X-Google-Smtp-Source: AGHT+IGO4ep1uHR7aNauRBBlU/RmREQAS1QtRrJVTcQ9PnzDcGl0Lg3A2/ATarqYpBeXhdDd7qUEIA==
X-Received: by 2002:a05:6000:2dc1:b0:3a4:ef48:23db with SMTP id ffacd0b85a97d-3a531cc55bamr12501548f8f.59.1749542632547;
        Tue, 10 Jun 2025 01:03:52 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229ddebsm11676331f8f.17.2025.06.10.01.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:03:51 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:03:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com, 
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 3/3] i2c: tegra: Remove dma_sync_*() calls
Message-ID: <t6lt7sazxaqf2qis55kjg65epcakoyj2cow5bbcjzyxj7ztywm@4r2oukvdhdu6>
References: <20250603153022.39434-1-akhilrajeev@nvidia.com>
 <20250603153022.39434-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qmkq6so74rg53u3d"
Content-Disposition: inline
In-Reply-To: <20250603153022.39434-3-akhilrajeev@nvidia.com>


--qmkq6so74rg53u3d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/3] i2c: tegra: Remove dma_sync_*() calls
MIME-Version: 1.0

On Tue, Jun 03, 2025 at 09:00:22PM +0530, Akhil R wrote:
> Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
> The driver should not be doing its own bounce-buffering if the buffer is
> allocated through dma_alloc_coherent()
>=20
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v3->v4: No change
> v2->v3: No change
> v1->v2: No change
>=20
>  drivers/i2c/busses/i2c-tegra.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)

I've had a patch like this in my local tree for a while and never got
around to send it out. It turns out that this is actually not just
unnecessary but can also cause issues. We were seeing really strange
crashes in the QSPI driver that seem related to this. I don't know
exactly what causes it, but removing the dma_sync_*() calls (for memory
that is also dma_alloc_coherent()-allocated) fixes things.

For QSPI I'm thinking it would probably be better to move to streaming
DMA mappings because the buffers in DMA mode are sufficiently large (at
least 2 cache lines) that we might see some benefit from the caching. I
don't know if this would apply for I2C as well? I vaguely recall that
certain transfers can be quite large and I wonder if cached mappings
would be advantageous here as well. Do you have good data on what the
usage patterns are?

That said, maybe the extra amount of work isn't worth it because both
I2C and QSPI are fairly slow busses, so the impact of caches is probably
minimal in comparison.

Anyway:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--qmkq6so74rg53u3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH5uIACgkQ3SOs138+
s6HvVg/9Eyg5/ttWDyh9UBRUi5nt8QKrx1syq1icibgq3/DVaLqNT3hKe8OqviSW
KAFZKvSsKp+FFODwERdnlJSPW8vjQa1rfSV8GBtoYyzZ2UZgOOAL7sk6tb0re7Zu
2FeajC2nrm5p+uEfB43PxK9qhsuydewV/Pw72MfsLiGOsGySFHgO01mXKINKx3RV
xbUW+c1yWYqjNFt9i7c7YQew+NTqzoQXcgZdWqINYXeAKRDG5hxcwyI2ixZh60yk
HIijcOXfOVlkH/ZlcJWOVpkBBwtiQamNJ6AKD5lDqSQnYnvlFE+2ueI8rWLUj8qt
Axjhpocaits8H78e+rU/iYnb3On8EDeMs1Vr2WVs/q8kClfQeTJjBNS/ihD/l/NZ
eDHK6YfytqfR7B1XDjn6vXKc3u0T9+GyZe4+7GXNyf+S6NlKtVVnHhlrnylcC682
Vhr+rpC5FLYOS23hPCQdoiJKkZ1HtXEI9BtYVYeeuzm5C1/ApHCx2fi+f6gpAv3J
uUVEYkrq2UHY010mL6myp//xh6L6W0tPCi/YqTmxOwEqVjD4U2piWXMabwynhiiB
ikJimEw/+tzV1mYzLKoLoyjP6pZDli9ZgR76C4In7ochpnh1f+/1MXrfGVKyM1bs
Ss5WfAMNQE0uxoi2eF5LzScESVohFn+TOgSCOedCaXCiGHpdzwU=
=nEmN
-----END PGP SIGNATURE-----

--qmkq6so74rg53u3d--

