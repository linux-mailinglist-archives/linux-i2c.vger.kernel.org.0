Return-Path: <linux-i2c+bounces-12103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C09B17FB0
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 11:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 718D97A294E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 09:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0702231A23;
	Fri,  1 Aug 2025 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyC/BOnP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E31917D0;
	Fri,  1 Aug 2025 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042186; cv=none; b=k8iKbPLuSphG0ZuSB7+D0q+tyDpRNxc0nvZe9eydnVNkJ02oTi94pCWbsGytSDv6MaapLmVs835xyTuqLgeUxh3gMmCoA/90qasxjPTjQVkZbmoKQwMONio7slUnmOvK5e+85Zl8+dfK0DFBlfv38bBdzA/d7U/Gfs3Em03/br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042186; c=relaxed/simple;
	bh=lQYzrkD+Px1qyVM1ZME3/oSd7U2c3OhzoOEJV5E/d3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb5n2m4mjapqMUpJ5W9lNch6talnsVk6ts2MoQ2KSYi7vg0CH6YBxqdD8f1Hos0FlEe/SaaQX/miPy9G77FPS+SvtSFYNxWZVGhtMOCoF4Q1XtvD0F9gvF2tO3feaSPjGGVnSTkvtXGPaVT/PIlBr/fvSOKLclFu4/mNfWJ6S1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyC/BOnP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so996332f8f.3;
        Fri, 01 Aug 2025 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754042183; x=1754646983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j0kfRiLHjJiKlOrEJoRAigC4AQ+3jmJWpddEgaBCKBg=;
        b=TyC/BOnPoRee6QQWxUCgT8UdNW+rCLt80RJ5TCwBh8TxL4SU4bCoPOYmCkS6FLl8iN
         chBvNbZHj4Fa2PJQXJEABjyhViAueSsUli/AwtyxXHIn6t11uTIRmVUpUAjiqk89RKig
         h57YY6RtXcxgJgkBKR9Fg7k+U7u7SbLomZ9Zy3HyvPhOfOCvFy1Q3KSozB7lu7d78xiY
         4/IE6fJjWoMRwLqI4OH7eAyZSxuuZjkaWA4I4pMF+EW+IyPW5tv4b2xr25wrzZUjFiQd
         7R/THfRJvQNd0jnVKG+0YHbw+D+naizs4EHSi6hECeRqSYnhx65fq7B6oA0tiOV6u3Ju
         hRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042183; x=1754646983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0kfRiLHjJiKlOrEJoRAigC4AQ+3jmJWpddEgaBCKBg=;
        b=j0ltY8BTJw1b1EsQpLclg5UuULbL0p28xUMNYAcrCPPq8tAXExHI0TnE7wfHwRVszA
         HtPZUVbBDqAX96620TMGCEQE8lqDct4+X2t4FB3t7uuxwU7eU8aLGrHuZKS0cPn5HUy+
         vr5BZngapq3+IO1/Iv5weeNlqcdo8j1Pt0Vf1c1Sg1Igdtwzjw9R+M2AICx0NQVWT0Dg
         nvLkn57gLfyR+CiqjhuQvSqmNR2az69AOVz7LgdIh0ftX2soIKNfQwgVlfF2zAgPRgTh
         FKv30b7MaUwW6watXrYRbJkz8tDFgu+Y9lT4mqR+sGGe9DhJ8svGHuIAj5+wQC0ZxaAG
         Tr9g==
X-Forwarded-Encrypted: i=1; AJvYcCVXBUDuShd0ApB7/EAL6DfxpIIfKf87XF/faZ2f4gdiagqvgYGTxTrRRsuNJx4d3jKIg8OWxOh2kDkU@vger.kernel.org, AJvYcCWFOgCmt3zh64suf1iym7RRRVgRj+uugVlA8IgLmz8lVrh1AHcxy9q3/kJsFxPNdguDlOh9eK076nvGxbM=@vger.kernel.org, AJvYcCWNqaLyNx/3aYF0+IjWo+rJ7azDkSwd85AjEsmO2eJz3pCxhXZHiMgEGJwlGQVfsnVvvt8CvexakOdqtpyZ@vger.kernel.org, AJvYcCXDgpwH/og1hrgq+3ztmtoNyQyKs5i+ZXWVeLDESUyUYo9hXJxXbDHaPewZHr88HPz9yDsI+Kr5q96p@vger.kernel.org
X-Gm-Message-State: AOJu0YyiI+zR30CuGNGfdQ2xXzrqH1w85FeRWyNlY93VbcG/+m1tjdcP
	N0YM6YS+1WE3pQtAjCzI3yG2Je59XBL6zCDiYe3pe0ua9t8jxJSudqzM3RN2eQ==
X-Gm-Gg: ASbGnctfkLm8zb2DTRZ2bWFa0XFr+QUbxr89O8uW4aoLyBImdnPY3WTzT8V+V2jVs12
	T8El/DBR4aTKzrveIhjpgRvQhnQHHA+qUsCQ8am5FzXo9iFsZONULlTm79ikaGWukGa2Xu9TtXJ
	bV0lJKRnAkwwxjNTOXiGFkgLH1JDFvD6A9LdjsKtp7MUjThA1dkaUkXvGgLRC5a9LHj2rT9Kp4h
	6sZQCxIp2e+x5Zmwv6GKdZ6vfwoqm1TqSFJGFuHeOYnGrnHzfNbP/2JFdaK3iinDAFPk+pSLd9f
	H7EMzcdpE5vSIW3vpUASi6+37GJ45Vzc/PfCfbmF51M+IgA+H/L6OMQVWOa42nap/l9rxHgVtNa
	BxK1jChD11vlogKLKhom4cetKn6Py0oinIvWnShc8XoxaGKTMOVaJkbMUQZAgKsJLEQCHfTbrGW
	3Sv9daDoSG
X-Google-Smtp-Source: AGHT+IGElgkAj8MkFDsWsxMthPnhdGte3qm9LcW5uxm/KQfn17nwPXBb/8cTW7G5VEEbXAh7JeEj0g==
X-Received: by 2002:a05:6000:2a0b:b0:3b8:d519:3ec7 with SMTP id ffacd0b85a97d-3b8d519401fmr1221944f8f.13.1754042183281;
        Fri, 01 Aug 2025 02:56:23 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edf54bdsm61770995e9.6.2025.08.01.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:56:21 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:56:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	digetx@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	ldewangan@nvidia.com, robh@kernel.org
Subject: Re: [PATCH 2/2] i2c: tegra: Add Tegra256 support
Message-ID: <5j6kkegbnhjek64ucr7j4oj7qpxumjnekhm3d3ub7rvgrbgcj2@xvswbccar4u5>
References: <20250731091122.53921-1-akhilrajeev@nvidia.com>
 <20250731091122.53921-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7v55t2jggqofz3sp"
Content-Disposition: inline
In-Reply-To: <20250731091122.53921-3-akhilrajeev@nvidia.com>


--7v55t2jggqofz3sp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] i2c: tegra: Add Tegra256 support
MIME-Version: 1.0

On Thu, Jul 31, 2025 at 02:41:22PM +0530, Akhil R wrote:
> Add compatible and the hardware struct for Tegra256. Tegra256 controllers
> use a different parent clock. Hence the timing parameters are different
> from the previous generations to meet the expected frequencies.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--7v55t2jggqofz3sp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiMj0QACgkQ3SOs138+
s6HqIhAAgKLm58hnyCD3m9KGJlfOvJCaM7UwHyze83lFmLTCicZUIhyGXbNqTjln
eeIr4OBJaRPGMnsd2TgfOPHHtAH4KLjT6nI84Syq/NSc3SRU60nT+9ZKz3cO2bew
6Tv8oHZlNjFg49iG/a3W1fB0aJ1dNeclFQHgUDG7OyvAEmePGuCWSdl6mzFSyq8Q
eQ2OIJsr5lxoDUMpt2s/bCO+yG1dVUEaO8fWfQNfVHvARlIVBMH0nWBP27jmBArM
4NyJ7rWUUMyL3ejaXQSF22xgUrrIWKozP1Fslab9XxPFqdOEj2IkcmlQVAu3Qw7e
/l9qiOsCMI0NfyKINm9NU9MEyr9iVkh+6h1ZhPt9KZIh1WVK/p5pBXd4fcxUse+1
dFul8GyZ7+u+3G338Wgb+3CY0zrRDgA67DClO2WjwEqPfHdzI9hykOS4nB+ACRI5
HYy1gfvnt2pwqLk7HCpdRbHjr0QCpIiwCpPrz2WuGfDqrPJUwmiPqkZOgTjbGlUq
I0kB//A5YBnEqZnMBFVQ/NqVgvFRVcZ2kIdy7RNbg4ZHRxNvqdnUNzQgnGylTIh8
afA9O4V0WHlLjYHgLhQbh/MHlYOOS6gJ35jr/ZwqXtGH3U1WAyn8Aq3oGtZww6dd
s9VBj0SvSqOOWXt1/X+XPyu6YbyN4VlnNBEPxp6IYeeJziqx8BQ=
=7yKx
-----END PGP SIGNATURE-----

--7v55t2jggqofz3sp--

