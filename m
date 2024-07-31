Return-Path: <linux-i2c+bounces-5090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1C94261A
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 08:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C2B1F22445
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 06:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04794D59F;
	Wed, 31 Jul 2024 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Y+FLFMrB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4429CE1;
	Wed, 31 Jul 2024 06:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722405704; cv=none; b=Pd4i6TpaPPg0jZeRSJLsumecjlm/4zKLiBMUnn3uNiaCCqhhaivH9kcexHKKDQk37c9i9EK5IrQS8UU/Tb++9nN3RKEc/oDoEzpvAUjZm0JxkxsWmtuMeYAVJBJpXmOEQJbt/y4XZXYkD5M47+rZ1qvCRAkdgqtKY8t0UUnaNrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722405704; c=relaxed/simple;
	bh=F3gK9K6jM/Ut2UnX60EKOo2IsJnHumeVozR82BQmQ2I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S91OwS66Rue/I9raXRaw3qcwxuOaUsbtKOGFFyjz15TuDnnvUphG+GdkW8GKRPJvSShEe05+1LoqyWB4Xbt+3CsojyOPxyz5rIIbOoUcqtmwZ8O+NRHUmTlMGUpXHO1R+/sNyOPWVjBSHu9vW/hfUyVM9LRwEUByMtBwxbRPL0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Y+FLFMrB; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722405694;
	bh=gojGMfkKjsM9J6aga5vnl6TY2q5uJ85vagSCFyyceU0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y+FLFMrB/2bHdm2VqEOmMjhfpLWLytJyLcAfytsqz+42qV7eCWCiD31jvHFVfSzBg
	 oK79Bo7dQNkecMYQfqjTeGSRxabnWt4RedzjaaiqrUaFFMmTay9B1P9F+zvcdvxD+F
	 8hYfcF3dNf9Q5mis2ti049+EYUVUXavbJM2VIUNcfQNVzjywIXyxFBsWlysEkxhspj
	 E6JZ0hLeBkoEUJdb3Ms+EjLCOyaG/3nKPokw/htbi75FdHGaKED7FgR4D80ozoherm
	 zNtvNvDsyXZ/gyeebM0IgloswHa0lzIJUcj2W3NqjYESGMm7MblRyU/NpLW66v6g7K
	 bOy/wpv5s+zmA==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2C48664C85;
	Wed, 31 Jul 2024 14:01:26 +0800 (AWST)
Message-ID: <25b2bc6b5b4aec33396f4d6960654e65bf1c3d6e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: don't use ',' after delimiters
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Elie Morisse <syniurge@gmail.com>, Shyam Sundar S K
 <shyam-sundar.s-k@amd.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,  Joel Stanley
 <joel@jms.id.au>, Baruch Siach <baruch@tkos.co.il>, Dong Aisheng
 <aisheng.dong@nxp.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R
 <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org,  linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Date: Wed, 31 Jul 2024 15:31:25 +0930
In-Reply-To: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
References: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-07-31 at 00:01 +0200, Wolfram Sang wrote:
> Delimiters are meant to be last, no need for a ',' there. Remove a
> superfluous newline in the ali1535 driver while here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> @Andi: These changes are super trivial so I put them into one patch. Let
> me know if you prefer broken out patches. I think it is better if it
> goes through your tree, but I can also take if you prefer.
>=20
>  drivers/i2c/busses/i2c-ali1535.c      | 3 +--
>  drivers/i2c/busses/i2c-amd-mp2-plat.c | 2 +-
>  drivers/i2c/busses/i2c-aspeed.c       | 2 +-

Thanks for the cleanup.

For the Aspeed portion:

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

