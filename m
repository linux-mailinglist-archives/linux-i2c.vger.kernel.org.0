Return-Path: <linux-i2c+bounces-5255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F15294D14A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 15:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFCD01C218C1
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 13:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006FA194C75;
	Fri,  9 Aug 2024 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ErGP9x0E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67379194A43
	for <linux-i2c@vger.kernel.org>; Fri,  9 Aug 2024 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723210293; cv=none; b=nk9rjZUAQJZ3R79QhvdALhRBqzTP37Eys3y2TXMbAIquLw25cGH9bcSD+Iby9QXVfoiflqj0phQBM/PAD0u5kUF55A/8NqUXHoRaWM1eN85ASzxFjljG/wxk2mvGPzBhsLBOf9sF+gX9PptfbsBzYSTM68XFldUFzxkpTsY8YFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723210293; c=relaxed/simple;
	bh=lYtDZk0FLPC/JudIe9Jh+TGpstry2aKOQgO3D43H+Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tan7ttglfLWRQfUjGPIG5QW7gngwV/t5p9pdDg5+fsvkpL+3lXbNDIPEzgwOdt7zxRdO9kG7XKAhdwAG9PDSoNvoqq7JcJdDeoeLdseSc6j/ydA088SAJUrz2RyiBfAtsMjzF/F09xLQ6Pyv3JoQqepv+rxTkCEBew+g0X+PRQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ErGP9x0E; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=62G+
	6LGOoz3ndT//ceNMgtDoqs2jDeWVt6TUvAoLeF4=; b=ErGP9x0EiIrgAzW09wL+
	MwanHmQq6svTgG4S1aDmMctRRC+DR9iCnb21onHZsSBLuMnzznd2m68N0xhj1uw3
	L06mqIgUXVvqSEzGQFi39hDsM4f6bI1N1XTEAZjFd2aCe9CHFk5omWYbNMb7U12R
	cWSmiWE+PpOfW3bL29gZyE6t9o6Xl6rhbduU1mr1RQG1ix9iRb+NGx/pZLTpbteu
	SGDdDT/9lA4aSpGjZQWYTOadmMdiiN4FLcwCN2ZaSqxh5qZUx3CyS3UgU05buTBn
	oh2zT7EBhI6BjvMwUDw7h/uevh4m1H8BRb2ajzoYM0IXmHI0KlSwN1WQQm6KxoZj
	xw==
Received: (qmail 624119 invoked from network); 9 Aug 2024 15:31:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Aug 2024 15:31:26 +0200
X-UD-Smtp-Session: l3s3148p1@UGz3KEAfPoMujnvj
Date: Fri, 9 Aug 2024 15:31:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.11-rc3
Message-ID: <ZrYaLQ1GZFBAii0Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <3oxrthtenkyypr5pqpduxyndw6wxihn24s67p6ppogkcdd6mjd@s5pg3swp6flp>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zfFAmvyhCPUYaeQW"
Content-Disposition: inline
In-Reply-To: <3oxrthtenkyypr5pqpduxyndw6wxihn24s67p6ppogkcdd6mjd@s5pg3swp6flp>


--zfFAmvyhCPUYaeQW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> two fixes from Gaosheng in this pull request on the Qualcomm Geni
> device.

Pulled. But I wonder why this wasn't just one fix because it is the same
error path?

> Wish you a great weekend,

Thanks, same to you!

   Wolfram


--zfFAmvyhCPUYaeQW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma2GioACgkQFA3kzBSg
KbYhBw/+KWfj/9rT2OrbKjzS+C6/mMTDrE1I/5imx3gYpsQvODjuaY/QLFDp+Jt9
s9HqrnSTa7beCd/EoQuH1T+QikYFuXtAG/usJjZ+3lpoX9exYYHQG5Z/REyI6D1P
gjqw9GOXgIWRnpnRZL7prb6eXwMVCHHDSeguzX2LIcNtPJzYiuzc/SH9h8huHlhY
e4xax7SkXhnDpbNFuqnQWXWNsz5a3jDiC/mUcaJf+zNjUV4UyMq5VjfPFizx5SH2
W2gCQ+weCgUFmZRF4IMWhd7haGQRCym2bIo3VKIODIY0zuxvrbakJIyAphh6qiwq
DEQBg8tBIZ9CRdmP1yZeBV+6aDSeOvABe8oMGbOOe2gnh75Mn6qZrZ2HkrFXj46i
4dSd8fKtYrY42cbaB0Lg8Gm5aazxl2lYvVPLSwUR+nWP2dk19fD5bV39eFx5PaT3
eqgpDbCTjz3/SN/JA5CJMbgnkqXN4BhV8yTwOp1t9ZtMrZ+gw2dKN1/dVhfuUm5X
VNJC5H7DXXv+3tT2VWfIxdPbOHIVoUXrNauwf4ze6R4kJTfdTlp43l2mQJ+U5aXb
fsG5t3xvESo3u6JVfUCQZ+SEDGTfO+9U4TOna/o3g8A/aFudu+MxGjtyqXilGyYI
uA7CUOwKTnGzz6jexN/GJXrLpc9pF+a4gRq2ftJHobtQkzkILXE=
=JRKj
-----END PGP SIGNATURE-----

--zfFAmvyhCPUYaeQW--

