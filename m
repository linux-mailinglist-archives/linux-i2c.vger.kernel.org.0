Return-Path: <linux-i2c+bounces-4571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD1D923B66
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 12:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DB7A1C229BD
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AEB15886E;
	Tue,  2 Jul 2024 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvHys8v2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063D374F5;
	Tue,  2 Jul 2024 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916172; cv=none; b=DVnpELo9GPmRKcm2t45mZwcxy7Y+obY1q8ATNU0rsu9/L9ZNZbq3OE2Kb1+cxBsOVNFTjoWQFOX0859XXjSG/wMnsddQf4ozWOmDtCaB2PNgBSMlyEyGeVSuvyFdoKLvlu+Isryast33cQ1PbyFBcy2x1FOHbzoyjpg9UyKLyVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916172; c=relaxed/simple;
	bh=H2/3ABc6eBv29cZXj/nd74OqEp38o2YnlcZ74Uiskbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWZQkY63cWOo1xSnprliRGAek9/Ll2QmHnGDw159XrFgMONakT+5AXXEmMO911PCoHnS3yoq7mnEjwy5bZkYjVEpJHDP7GwPBUYFDnGciw64S26PqiYGfMIHVRObb9QRfAlvUHEsxd6ga9zxwHlkKtd/E8UDZf6MhNn93taSGMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvHys8v2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso6042791e87.1;
        Tue, 02 Jul 2024 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719916169; x=1720520969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2/3ABc6eBv29cZXj/nd74OqEp38o2YnlcZ74Uiskbg=;
        b=gvHys8v265Cu0EfcvikWMzEnBoEi+tbRyMy0v+WXvyEPTmE9DKzfLHZyIY7KKidy5H
         FDRAZFw9UST1RcfRlcwBiozc8LJGKJ1qPnPh8suXhwsjaxA4s97/tNC69/FuDm32WENV
         7i4uPwtYPA7a/bHQlHvTl8x+Xv4zXf/lyNpNbJQzErAyT8XMOkE9X0OWruDiRPaCdCfB
         sVDPiTBHpv20JVC0rU6UsfCtSi0jvtFtzUCWt8+YwW/yfGBcnrO/scKyl6IHUOuGthgN
         Eo7+jBCdiVJJsM4dMnWPs3NTV6gnhjhFhybQDz7FYbNfV9bT9a6hCqM8cihmZMqA1DCp
         z/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719916169; x=1720520969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2/3ABc6eBv29cZXj/nd74OqEp38o2YnlcZ74Uiskbg=;
        b=sIs6WBSGV80QX3SydlJN1sk9Eek5PkArVC2kIL2aMB7NYcER2ydFvO9od6Ev2c0fJY
         95NZQYszfCkr5xyIK4f+BwvhZdj0JXYGOqWT2JnNgjSM9JQ+j0HwLDFrWs99LfeYQfVO
         6YypWSG6df5TZ2w2agOhv+fbFr26YLdlQHw2zYZ+G2dSfNRvzfgTWTcVZi0BAJbB3epk
         NrMMbroRDp7KtVdsYjC/6ynfDS7QzdUF5xB3ublNhEcMBHqz9kvX4zIXeuM1qnKFqCxA
         BYSWzk1MhmdvPhrniEhiQQ1SzNj1n99yjp0fSp0tXM6ZOnbKKGbEo/r3U1qlNP8Ivsgx
         Z91g==
X-Forwarded-Encrypted: i=1; AJvYcCX04wP670fQD1utgxIfPOktzmcC8fA69e68hLTUVlYy1WNJhdoS4LlmPPO+WkohTYmK8iG6Cl9IYCEdjfSHjO6q1H/iHCAfcDJ0DoUbk4MfoXPbcK42LZXrFXq6U8mwFfYjAWbP9JzJ0H/7vzfnYIvv923ouxnmCZV0JoFusrwiVmM2z2+lDw8ebJgLhzhjkeRC4Q5lzYvwarfZddveumoKNan60gVcKmtL5e6mg71bg18VfG+5L5oEIZWWYVoXZAcgJZUjkCDkOJa8vqN2a3Qyhf2tTJtF
X-Gm-Message-State: AOJu0YzswhKI+A7mMUOUxHun+8NjGbAVFJKVZ0sB8fINaO7vliq0K5ic
	mWmBQKusUQF6lcboYxs/qMmIrMvdrzbTPaK14Hp0XNROulDdVT8j
X-Google-Smtp-Source: AGHT+IH+UZ+cnnKf87ciV6pECjzYY5dFmRwXwK7sPq0mN/njl3BqGEi3ofEaZkVKjtvBMh44Emakkg==
X-Received: by 2002:a05:6512:3996:b0:52c:a1ad:18bd with SMTP id 2adb3069b0e04-52e82651a88mr6168223e87.6.1719916168007;
        Tue, 02 Jul 2024 03:29:28 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256d664052sm182632065e9.27.2024.07.02.03.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 03:29:27 -0700 (PDT)
Date: Tue, 2 Jul 2024 12:29:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krishna Yarlagadda <kyarlagadda@nvidia.com>, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jonathanh@nvidia.com, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org, 
	adrian.hunter@intel.com, digetx@gmail.com, ldewangan@nvidia.com, mkumard@nvidia.com
Subject: Re: [RFC PATCH V2 04/12] dt-bindings: misc: tegra-i2c: config
 settings
Message-ID: <hqlckp6hxvxwkkbiagdb5pm4eo5efu55hwuupdal6lojxj2xu5@5zibskqdbdju>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
 <20240701151231.29425-5-kyarlagadda@nvidia.com>
 <20240701174227.GA148633-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtzv7b6agyajbvep"
Content-Disposition: inline
In-Reply-To: <20240701174227.GA148633-robh@kernel.org>


--vtzv7b6agyajbvep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 11:42:27AM GMT, Rob Herring wrote:
> On Mon, Jul 01, 2024 at 08:42:22PM +0530, Krishna Yarlagadda wrote:
> > I2C interface timing registers are configured using config setting
> > framework. List available field properties for Tegra I2C controllers.
>=20
> How is I2C bus timing parameters specific to NVIDIA? Just because you=20
> have more controls? No. That's no reason to invent a whole new way to=20
> specify parameters. Extend what's already there and make it work for=20
> anyone.

This may be applicable to a subset of this, and yes, maybe we can find
generalizations for some of these parameters.

However, we're also looking for feedback specifically on these config
nodes that go beyond individual timing parameters. For example in the
case of I2C, how should parameters for different operating modes be
described?

Would you agree with something along the lines provided in this series?
Do you have any better suggestions?

Thanks,
Thierry

--vtzv7b6agyajbvep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmaD1oMACgkQ3SOs138+
s6EUWQ//d69gXBtNSFP7l+KPjDhDZ598cE4CgLGFB1MCw5CciuHjfQ0+hCmcttn9
uX9wbBufhK4HfhZibObvUSCRQMWASt8xovXIpwQ14fYvQHDZTACjBbrOYvKRjMXS
go95WVp45nVUe5vtvOMwkY2l7fJ7ooH4kRfsg6P3HHbAUIewyohXaVQxdjzosd7I
uQ4HtxHrQEVyS0i9ifbUHP/+1H89rBuXOgAbZ9hgXRh6X1uAKTBxdeMP3vC/2UDf
EUD8lPkAphVeLwOld4SOUtq9wS/MmoxEqr+vh+HNK2R7fHXbGxzyPgX8MhgYDddP
PjADI5XFQbc4CXpZRsVsgEfR3iOxNhOhqySEP0rMR9/M4/R9PluK2XrbgswwnKnT
Vn1mRRKDbcDIjyc35OMxB6bqLMLQNmYWAN8Abzkx8UY8VvVk2RSoS+SG/qR+xTZU
tNCq36PQN6dUnQ9fdq1/DJEtWNEGXJUMMZzGKF9UOg2x9dLap15nCgzB091vkURw
rnsQ4/3ff1nyVv+3gjOcIuYFuqvMz7SzvthZ8801PO811noTmblYVD9pVxhA/U0V
C9pmgSQDzRUeJWV+MoeGH7csaUrcSDBzuGLiH2dTLTCoLQQIiMfVSMrPjxMQ3BOb
ow4FkVuyyKsMuSSPB7RjPsplJ7PN/F0Emo+PoTlRmreN071u4Gg=
=egWb
-----END PGP SIGNATURE-----

--vtzv7b6agyajbvep--

