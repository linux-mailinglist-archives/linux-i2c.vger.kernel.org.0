Return-Path: <linux-i2c+bounces-15151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D1BD1E7D3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 12:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5950E30FDF64
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 11:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54107396B96;
	Wed, 14 Jan 2026 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FbIj0Ne7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711C6395DA6
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390480; cv=none; b=kgNNYKbciorLDTFqDzgDBDJnHW7zWsyzizdI5wnBw79sDfqEG50foyTwW6ne9OV7FhoJ3qT/WlwshrkgZ7v9GBTzTbKQ0q40JokRb1SXNKS8ihSUftHEnnyVIxw6fMShPmc1zLZ30STbeIFw+ijo9gGDUkWtrIB2inYXbbzZITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390480; c=relaxed/simple;
	bh=lr2jaXKLTYSemiRd4WCZWM7A71D5r7zK+ViV8cSzJ+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6DQlRyFtW8juuvbczC4X/jt5TvFbkqIvNu07oyC9pyenNxIp+m8XXSAteWUJCgXA7lD9ZwlS1eEgEYZ4QncLbhh3B9nA6l4iUNVuduJKGunnlxKIRDdy+Ge+d98bdLeua317ohpFkaIw/Kp/Qzl1zvePkfpevq5V14pr5xJT8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FbIj0Ne7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lr2j
	aXKLTYSemiRd4WCZWM7A71D5r7zK+ViV8cSzJ+U=; b=FbIj0Ne7HcdUaAEP0iAU
	A55rGJ0oyna5P19mF+Qqxxdtkv9Cgi3ikY/VAziIha2Ymf37Sh7GcN6qaW4QeEEo
	sBd+8Q/J4ZH0/a8KKWXi52G6yRrBYbtJHOc1MKWYeouC1RokrNbBn26LBMwcnNgu
	8T93ffuZswv71EcU6CqAiK3f2JCJOYkgcxnkvqxbylojhjxtVsYe3sxNiK670Caz
	EFvOqfSrAgjRTV+nnMfGbAdKt7v7gg/v17ziuAIKwmm1lI2cmH/CktRAautTnLuL
	iGUMHmLaorf+k2EQ1TVUaIc7xjC+XNtiOXCvHeyQm9tY2O4ji9uDHLMak36lcI8j
	2w==
Received: (qmail 2108427 invoked from network); 14 Jan 2026 12:34:35 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 12:34:35 +0100
X-UD-Smtp-Session: l3s3148p1@WxbafVdI0IsujnsM
Date: Wed, 14 Jan 2026 12:34:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Wolfram Sang <wsa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use
 SE DMA
Message-ID: <aWd_RtYqGyUkjQao@ninjato>
References: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RMEH12Dl56iOtTld"
Content-Disposition: inline
In-Reply-To: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>


--RMEH12Dl56iOtTld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 07:07:42PM +0100, Neil Armstrong wrote:
> The I2C Hub controller is a simpler GENI I2C variant that doesn't
> support DMA at all, add a no_dma flag to make sure it nevers selects
> the SE DMA mode with mappable 32bytes long transfers.
>=20
> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub vari=
ant")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>>

Applied to for-current, thanks!


--RMEH12Dl56iOtTld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlnf0YACgkQFA3kzBSg
Kbb1YxAAmYs6M2P+MSlXvKQkXgfmS6UTFY09WDBcqX0ouXMPYG9zzTeTHlzkfvpK
Unobt+53hHGH1nMTnsIHOroZvR7EPWJt+myTKU9CFzS6wc3w5Su0JqaOMr1lYcT1
VaD8+QFvs6z2wJeng9NNZNDiF2LX4LaFF8zPG+i/0KdxS3QKm9YFtiL1zSPzMa7h
S8tg9AyR2lDDcxJwXThfEFj8QF74/iQw+nBJ5R/kfl4OWqDtYsv28y/t2ITpCWEM
09NKIOvyLhD/720LhLTuS7pjjHMJWynq99lYhsWOdhnD0ZZdVipiHAOxoowEZIzl
523xsVuFcLGzZLFqV2yDQU65txj6z1n/S8ycjkEiS+6pLXFvQ/Vozz1MOXz+7+1n
1AjbBFerjy8NxXHThvNYeneqx0sg9AwY79xLYa1EYTKYowlF2s8V028rCV3eIiuz
odsft7r7rqWs2I795ZeDL0EN/L0wtIJIxu6dVbJmzkExRbW5wdzyk/D8lvH6sCbt
aXcEl/DZpUyU4YCJluHyx5m/9jR7DjngfGfeYIwARk9+uqOjrjF+JFDIXguqaV4K
UUankoMGnmHJGvJNy45ttbB3QZZY4bgwcvk9WXlByMA8JlQ3aLEb7yi6T+PnCsUJ
JYqolaQBTWfCJyW/RNcRXtCDWFL4GBv2Ori4Y8rbqFTCO9B6Y+M=
=3JmV
-----END PGP SIGNATURE-----

--RMEH12Dl56iOtTld--

