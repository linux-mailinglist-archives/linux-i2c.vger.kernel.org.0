Return-Path: <linux-i2c+bounces-12240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D7B20885
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 14:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B2C417A403
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 12:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FC72D3A60;
	Mon, 11 Aug 2025 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fY0pHNYS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6D222B8A9
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754914444; cv=none; b=a/+r+mWwSqwoVOMcP8ON/YY3odeCPqXKq2DcU0YtHAz+UJ97MKV9DfTnEaE60obFU5ITOud5XGlUcMdJPkr2jwmmlXX87KG39qmjjAzMf7YIRkHyl/dLUE60+ft3DrO5klTNBoXNlrMRPpToM6dUygdpj4t4twPsnG/DAyfJJa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754914444; c=relaxed/simple;
	bh=amponW7DJgmlj4XAt5exzzEGz1Qd4pt2+zsXs6yVGyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2+C3qDZz8KwUOPLf6Bw4iJEhOw3F9C0bx1PVbRtf8hhhvxSKu4W2aaHzCsPXt46pFawqU9tPfUrcuBdiJ0XhtVn9u+BxUYN+vgYwi5ukeYmdKgtNhnyh+QhLKgZU828VLTOzacz8m32qPxeqq6DU6a/EF/ufA4AgZnK+9THF6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fY0pHNYS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TRxN
	csCzqBQF4V1FzxDJHehigkCbHGb5hQfKzzkDwZ4=; b=fY0pHNYSxCGP8nuB4tKB
	nSOD1Y7afKB6S/SkX5mP7fkz1otFJczFHetIcP8Q+PZLWuzw997bwiYN9Ol09282
	igGg806Tj+pV9A1IeHHnJ1OwIORyCX3sgxD+B29wXZTFvXHHiHQRShqev5illj0L
	usk5SvYqtXsuA1v8F9bL7XAwSeneZi4CB6mWkpsxR90zWyqgZohxkjgfu4AGeBXK
	HblSY+Hbtdd7Z8PjjTtX4m7r+/YMWo9RUGsXb/OVqj7o3o9KxuObEBrIQlFre9t7
	/jN0FPX9w5d7HVyb73RfRVELaFl39JZ8xlrTWueGYVaOUJc2KT3kfBZhFhPgSyP6
	4A==
Received: (qmail 2790037 invoked from network); 11 Aug 2025 14:13:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2025 14:13:51 +0200
X-UD-Smtp-Session: l3s3148p1@2Z5D2xU8iNBtKLEk
Date: Mon, 11 Aug 2025 14:13:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] i2c: qcom-cci: Add msm8953 compatible
Message-ID: <aJnefpETGJm_cuRY@shikoro>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-2-e83f104cabfc@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9dxlZBEI2nsTtP8Z"
Content-Disposition: inline
In-Reply-To: <20250810-msm8953-cci-v1-2-e83f104cabfc@lucaweiss.eu>


--9dxlZBEI2nsTtP8Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 10, 2025 at 05:37:53PM +0200, Luca Weiss wrote:
> Add a config for the v1.2.5 CCI found on msm8953 which has different

Given the above version number...

>  static const struct of_device_id cci_dt_match[] = {
>  	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
> +	{ .compatible = "qcom,msm8953-cci", .data = &cci_msm8953_data},

... why don't we use it here to stay consistent? cci_v1_2_5_data?

>  	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
>  	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},

--9dxlZBEI2nsTtP8Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiZ3noACgkQFA3kzBSg
KbaAaBAArCu6nCG7A/KOAzgEA5qfKFQScxh7zN9wR66HVKX+n7OAazuXMA/9OPR7
D66/DgdxzPgB7AeK2GOUtfWKttYdtVpQjks6PGEFCkDBzwsWcqyubsB/wLLJvWkP
B7Zd/aj906kU+unp+yGUl6WCWBNaoreaRblkxC5Du1GPIK1qfPXkCymo0cniTyCI
lhIj4SQCqsz42rXcUxMTLr3JGbsxCmc3fhD4IhzueAU17+2mm03xFEfSSUtGA2YB
JaeL4trNM0WIWpM8WmeVucQOLkj2Kslb4sz8H3eXBpFZHXdNl+uNlllwHMIG4OX5
2mqZzvnkkzXMwsNWwQ+d4FayHfvxSkCNxlFZhld3DyOqTO3fZpQbkZJ3cZWXcudo
G8l6bv2yHI90ecIt4TZ6W8kcQHIZ0cDNdoUZAf3B8aNwgxn+M2kHMKbypVoDZMD+
LW+gbzkv0I8Nfpevb9l0hgxC7v5U6awDCAy64afLsQhKwVcw0yDyAZAI73maIRNj
FwpSzz/txwcXMH1tpqt4s5OcckiPKD/DSf9rGaPnjIuh6nJdE5R/TrlpVrjAUqAz
pAp+xYFQEfvzdzi0dmJkfCADMLt0Rr2HaaTXXEB6th65pXdB5gkF1AqmCcF0Pl4z
M1m4PZTYK/2DVgYwv5bfgiEUrtVHn5ZQNuBbkBew104+sr137vs=
=YyXL
-----END PGP SIGNATURE-----

--9dxlZBEI2nsTtP8Z--

