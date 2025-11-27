Return-Path: <linux-i2c+bounces-14315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89CAC8D948
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF243A44DC
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC07F329383;
	Thu, 27 Nov 2025 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7McMcWV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6CB324718
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236219; cv=none; b=NMtcAoK+Xsd7Ix//33Slo9hpucL8K7BKJiQDIQdcJN0t9cKuDCyAqOKKoJS2Mmvnz6fra4jySb/1qyfeyIfkNRTCwmwfDeGskjgMVCQDfguqBrubW+UA93ujbLJb5GmyMpMa4f/quTkGrudXM5YU6UwX+t1HAruKK0Ht0wgyQpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236219; c=relaxed/simple;
	bh=pY3yIpCqHy9NnfvKjK/24G32/d4GhZhQNfpvnRNw04k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0uUEXzhSt48vB/OPCfj7VHoAAqsdqdI7BwwihA3H87k2k/VTKLYd5Q0prvoNjGphaYMqq97BVbjpEOMVJJxA5iu8MqNLBgRkZEpZe8BIxu+sgzXGfNrTQJ17e65f5eIsYFfZYA2oCQoj7bdrUftmGWu57l+x+5OXnSEDyIArxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7McMcWV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so1430754a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764236215; x=1764841015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gu5JNlymI+xjkbE7SXCQkiY8aeTYQf5loqFwPHd5EQA=;
        b=V7McMcWV0LTvwaZz9adtMAXTmTg6dWvGW5iQ6rJ362bkMv0qnK3buREbZKPTlfOFj8
         0uQRVIDELnTb6Yu67wwRkGGlxN0220Fh3cHrEMsSx6m9z8Hq5nV9lW8wxHGjo+FYBwlz
         ee5Ssxml9pIldtjuUqLjfc+lW3jzuyjifEK4gkRITx4lq4uqGh6QVtEFC4+T01JI8Snx
         tTnpnz4rNBg/dBb6u7N7JZbzJj/t0c7jhAUvwBFy1gPO7K8R1ABGQSvnuzC0q7vn3b58
         k7IN8b2xH4HdwDC8h0t3/ko3YnmQwEK5w73UcqrbvNiECbSeb13Ms5WISU4vkX9Oa/yG
         4XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236215; x=1764841015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5JNlymI+xjkbE7SXCQkiY8aeTYQf5loqFwPHd5EQA=;
        b=bk5oCj9kt8/T/SNCCkXMLBuXw6uZgT9LIDp4wiyNMNFzp6+rWd0UyakpqMh4RUtKe+
         LJELRxI3D+mP+xTIuh5Fd2t/KetO1ymXxvJDuLL2SQqZFONpI7ZjuAzm54MGzl2H8CbK
         9hVjJvvMLqs+DZ6tivaRolClB3v4xxpximqXbMF8LpvDAKfPhCUzWqk7x2g4jMVAGzUi
         qqxZweULkdSgvJzI2id1ll2e1jWdVB4MG6rAO9oHzCn2PrsHvslCw+cK28KtUmTP59e2
         mnOyuy1/2Onww128zrZZvndxfb67kBqtlYPFSU5JDIlE2lU8SDm/oAbck4qDHJssHH6t
         7wXA==
X-Forwarded-Encrypted: i=1; AJvYcCX7PaguHwYkW/SoqDagiR2M/wyd+RsNYu3P062Jqg3RJC5hXZimDIST0SJuVr5kW2n8KEic7Ojn7gU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv6SDuY7j730pK9LJiOTzLsZug2hAgKoW3z0KQLQhjfM9lVl7w
	t5XpFSfXLb/Pb31bBRsQUqBLwpcm+NmujD/+mZ0/yqEydtnND146O2DUeTdkLg==
X-Gm-Gg: ASbGnctdHRcCEbIm8e/zqd4WlUlFmWJermSB2mDnirX4DTOaSynbbZS0p/jFp7xdcP9
	8Em8ITASY0A0h13xpaxM/K/TYbjohmlBT65BpWveM99KUtcZ+4Em/6Xnfo+Ocr/AY8aknJFJvAq
	qwMuRQSpWvozW9sZ6DS0j8xyZDesCeq5ZA0zJTMfGVsp8l9hX0V0YofeMkUsYdYXEj4dm04C1WK
	3QdPTmOA4AbVGIEc163JUcMuzoNsyok/G934urZqkYWmykBWrb4aPl2ekw12owGZOX2ibyEdLo3
	GZ7t8sEOi+HkVdi0qywZcSn0UJCMpH8pJSz26TP6XigYaNklPkabJ7Jwsc3grJxQ0ArTHjtkiR1
	DUPQkjM0kL+OEd9BmNrciNTTZZSGessqC2f+1mR8trXREMar6w1Tt14imgthlhaUWcNBACvBnqD
	zoFMFJvF50WrukHpvT4wT6r2Gz2SDQR3ASefmdKWTk8cZN0eLmXwwzQL28Z8ZLKHyKPUvCZcU2h
	SftMw==
X-Google-Smtp-Source: AGHT+IGQ4H+rtLVq+LXq012Qv9pYnjuQXeNvOCcH+r5EbiQnQb/cgntH1MokjpKmaFRo2H6P138cbw==
X-Received: by 2002:a17:907:6e9e:b0:b73:6d56:7459 with SMTP id a640c23a62f3a-b7671705640mr2690672166b.38.1764236215082;
        Thu, 27 Nov 2025 01:36:55 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5199852sm121459866b.15.2025.11.27.01.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:36:53 -0800 (PST)
Date: Thu, 27 Nov 2025 10:36:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 6/6] i2c: tegra: Add Tegra264 support
Message-ID: <f5xz4k4udmisatxu4oeymngoy3uyxpoihxlaxd7ymenrvbocmh@cvkgtls3eiej>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-7-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="beon2rnby32vl4ue"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-7-akhilrajeev@nvidia.com>


--beon2rnby32vl4ue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 6/6] i2c: tegra: Add Tegra264 support
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:20PM +0530, Akhil R wrote:
> Add support for Tegra264 SoC which supports 17 generic I2C controllers,
> two of which are in the AON (always-on) partition of the SoC. In
> addition to the features supported by Tegra194 it also supports a
> SW mutex register to allow sharing the same I2C instance across
> multiple firmware.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> v4 -> v10:
>         * Set has_mst_reset =3D true for Tegra264.
> v1 -> v4:
>         * Update commit message to mention the SW mutex feature
>           available on Tegra264.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--beon2rnby32vl4ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoG7QACgkQ3SOs138+
s6Gm6w/6AgXf5tCWx6wKOvXGVYML8fA6p8cgTTKbMVCL0a9Cb30b6mlITGAwIcWQ
i0AuIno0SiR5dSNi9L4IzIOUqFlF/SY1sOeGgl+YbGlV8UWkLIsN8Y7t0UVh++RN
MNVgYxUKhvzJa+ECfM/vnqyITnKPwH9CK3HcaqmwHR1mwO8hEjampx/j1p525Z7l
r9xkWLbjLHok5+W3H9JE+AMo2/lx/7ZtHFV2HB4Ogl01knKoK2K23NEqilnsF7D3
PCR21yqRUwCjLS/Id093QOVYTiRhhTpc84srM3cFh5SmrRk4zgLtsKHnu4rnjqum
5xhsJlEdl5YZgmX3LCs++SCOlybQL+YRTR8zqyDhC71CwMD/vqZNWtlQSuklwr8J
R/YtjG7gTv5OxUnBsv5Wvr+tTO+ZeWs6qSVcwen+X6+/HdQI773/axFYi4prxA3F
K7qMg4x7aWwoH6f5pACNFLiyVE1ObOgcgpixCvr0e+s60ZZoUp+IusQ8ilcbS0UE
OnckUTZfCfn97SS+W3S1fZFxFOA9pzH5AxFs073zILDZU+Sa0EOh7Aa2/YVH/TkC
5qtrz01pPWymeHvwbP+V+UiIZgN2xNiRm/xFWA4fFfkTV+CUtCjaiPsdZIeC3GO6
0ISgFBLX8DY0PymnALm8DDZB6a7ncVOaIjlG1TYM7ttN/rRgeHY=
=xJ5v
-----END PGP SIGNATURE-----

--beon2rnby32vl4ue--

