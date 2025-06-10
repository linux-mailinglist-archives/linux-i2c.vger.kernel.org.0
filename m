Return-Path: <linux-i2c+bounces-11330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01372AD32DD
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 11:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBFD3163C60
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 09:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1795228BA8B;
	Tue, 10 Jun 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RafLornX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360C91F0984;
	Tue, 10 Jun 2025 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549393; cv=none; b=Mx4Y/VScvcxbaGRLtnpiCjr7dd+LfTWoq/wreBWY9AuEH3eh72Yw3ZKW6spC97TrbQA/Z9TbQMNSCcmvIIAaa3m0mcHsi1WVmIfg6xqr8QrMnaggWb7NJPNnmn0w+54SuEiooRjzy+Q6tEYN8mM2VF/nH/2ARvaaLo8jLoFeC3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549393; c=relaxed/simple;
	bh=7WC6JszKdFjuYtwE1Sh6X5oOE2rmwf/LbZyZmSM2UqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mga5OAVJbUI6iFOPLTEJC4gITLMaE+QQJu42SrMm9KJqYMmVXJ5GzTSamhyhz/8i9ftJuJjrKdbmS44mFB9JCWC7dIpnj5WVGdkIjNJrpdBTbAoVGFTy0KgeGUrAiAxp12jD/hWdxk4CJGH/ZWnzrJBkCamINUj+NUW0E4nHTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RafLornX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso45628005e9.2;
        Tue, 10 Jun 2025 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749549390; x=1750154190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gplEX6r/F7V7kXoAgH0gPrYjD7RVn/2m11wpBALxX1g=;
        b=RafLornXvRUuYb5kJKo7Ks8FBpvRTNielG2mptpBMskDgPbZuV+2FtiniEaQYDAD8d
         fDotuusOOiYlUhni2R+Ag/s0Vv7ByHwi0sHNxpEouiAiQnPr/oux2K3edwhgAT6+epj3
         XoM8UMRxcoQsUYO+5JzqYWOTD/d3ICNobgs6kBMZhWBGCI/NfZYtvkhzzc1W1p7n/j4F
         ARcDYZQdoiUX5Jl9TxQ50SoWGF6fvvejiUzDys8JfqABhI+goJbkuIm8Ci0ishgmLVfx
         iFlxyK7Lf3ACkZPDdFORwbmSBqcTR+2XIIpcQBW/zMZjvFh3UgED2Pb3SmtMlFFZC+ld
         qOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549390; x=1750154190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gplEX6r/F7V7kXoAgH0gPrYjD7RVn/2m11wpBALxX1g=;
        b=COaD8DBpW42CwOlm8djGxmQeRO3uDGBCAJtbuUXHuuwLzEkMxGZXyYuAisBkSJ4Y1w
         wQxpCvnSDnWmpCW5vwEFqhQnwAE59Y7ABB4ZyxC6WsrN7DiSCm9OJFoDkLTSab1efvRj
         r/SSSbDJNTeEJovg0iIIq9vXyA5BDilRz3osnbfKP0QAgg9/XHjOi5kwoN2TCJiQGCOQ
         QxP1M18FUsO+h9W0Ue6tJmduebSzL5azLO0ZvilGkR/NQ8IpMB0pCrgavNP6EO73njIh
         KtmY/gN+WkcjzCuEZPxIvmyvXTlZV2fdTW8OZRMWhc6BNF2bfHU8kyCWLvcOL+Fup08b
         5qOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3QNYR9STbhTNN8fk+o73eu+Z6mKycrXiVr1ohs95amg7l+oRKO8rBAMpNlfcK61330xBF7p091o10YbGN@vger.kernel.org, AJvYcCVwexBdOIbC+xIN+huF46OOnscWkpjrzU50Pz4xFqOuutChP1NY034ZgID8HYPsbBzUDU0SQPR413vJ@vger.kernel.org, AJvYcCWHJPrCvGiLNNdMWl2z1xbk53xHl+/5uvhIrjd07pAnEZAqM19Pt2rp/FV1v7DGVm2a2a3n0Y8mJeyu1dw=@vger.kernel.org, AJvYcCXVbmefgt7gfLsxwqe2FSrYIqyyggBwqGLHA/B3Ua0GCZ+LETd2FV9wDjGpdOJWOeuMGIIFuejsH189@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3IGW2ZC9NJXt3CQ4tgsebKUtZTDvYRVpFdxgKU1dmk708rh7
	qVnoQmJudG3fPmW3Kg2FEeJF4FhrUjpb3NNmTks1C2jm3KnomWC6Nmmo
X-Gm-Gg: ASbGncvXZwo5czgdDAdLvvaNkst16/hR8iBVViqBWa9tFSYOrG6x+sBHd8UPi5eFY/M
	gE6VpS1eviIb3uqtrfNACt4fVpyXbuxnzSCzWiiUlxTAJc4MOs4K5m4ZPxk6Uz9ACQL9PI0uIMy
	WWb76DvX7c+RiKa5tTC2BA71WDLhOrXfMYodEi2/KdiJfbACVY0WnluX/dTzEueuU8WJDWcyByU
	cyq9G9uckyGqRdPvjC6lGyDUIZ9Y/6iy3lJg185ymA8Pju2XT8gHIxc4Tq2yrmO8yGx3YDNZ+0y
	qOEMFiPTsbKFzM7RGKtVTMEB0Z7PpDxBP+hHtoCXcTNTgmm8uzvYATaUdTzsDL0V81lw+z9jd2s
	16Dk9tkdeHRTL7bE6Eap2fOVU8Pxp9Gy8FWZ59kLOBu6OYum5
X-Google-Smtp-Source: AGHT+IGy8HQBEplQLRX26x+Fi9X5O/Q3+s+/Na3IbqLPC8OShsE1x0QUjapG+7x9GXX8CKT80Ic66A==
X-Received: by 2002:a05:600c:1913:b0:453:9bf:6f7c with SMTP id 5b1f17b1804b1-45309bf71a7mr94403275e9.9.1749549390530;
        Tue, 10 Jun 2025 02:56:30 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d6dsm135936935e9.3.2025.06.10.02.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:56:29 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:56:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	digetx@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org, ldewangan@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	p.zabel@pengutronix.de, robh@kernel.org
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Message-ID: <qhrsdrtq4qeyntpqz4edu6uj25hxqdxlc5a25pexw7mj3iuwi3@35vrlxvkl6kq>
References: <cs7polavxoyphttd4uuzb63eguayc5zrd6l6tvyq5nbizpkq2r@g6qvgewu2d2d>
 <20250610095157.12138-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jmdul6m3ak5z4bke"
Content-Disposition: inline
In-Reply-To: <20250610095157.12138-1-akhilrajeev@nvidia.com>


--jmdul6m3ak5z4bke
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
MIME-Version: 1.0

On Tue, Jun 10, 2025 at 03:21:57PM +0530, Akhil R wrote:
[...]
> >> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-t=
egra.c
[...]
> >> @@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i=
2c_dev)
> >>  	 */
> >>  	if (handle)
> >>  		err =3D acpi_evaluate_object(handle, "_RST", NULL, NULL);
> >
> > How is the internal reset handled on ACPI? Does the _RST method do the
> > internal reset?
>=20
> Right now, devices using ACPI would have to rely on the _RST method imple=
mentation.
> It is unlikely that it implements an internal reset mechanism.
>=20
> Do you suggest adding a check with 'acpi_has_method(handle, "_RST")' and =
fallback to
> internal reset when it is false?

I don't know if that's desirable (because _RST may be left unimplemented
on purpose on an ACPI platform, and using the internal reset may break
something), but yeah, that would be the equivalent of the DT path.

Thierry

--jmdul6m3ak5z4bke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhIAUsACgkQ3SOs138+
s6GSVw/+IN10Qn2zw91/SHZSyOjTa2VRsulLNdp5/eSY4HfNEHtEe32iL+Wma/AL
F9W0MnWQ/7wNMD1H5/atyFeP4tzMeiUev1irfeVcmIChZtOMOUrw7JWbmonebK2V
FeO+JqIzNZK2sW1RsFEv3dhKfkye+31KJY/7NsGI2kJWXOyEjM0m1qG754Gs9xvU
qiZdWTdmtWbB8rTK+goIzh2H1bZCohFeaHiEy39NDYRGAffSmvhqCUT2DQ+YDb0j
Z5XC2fofhr3gNwVCiumsYTi3pPIgM9bo1tIJD+FebL+svHC685AqP9rDTeJTq+zY
4ltXjAESN40vz+LZ8uc71S+kuYI9/r789nMgNh6N7bzfzPdrOVwNvRiE/V5dIBrQ
hLQ2yWzAGWKHpsgIQ0O/ZOrikUJgxWlse9a/rS5AmkhlmJhb0HUipoQmXQQFCtvZ
P47FR99JhnllSC7I+N7bzz8eBcIuqV58m3gX3K3Tz9MIM8qms8Hw+eE2SnNBHRdH
ZEk5pGyoIvFvxPObatwNjyCaEx/ZygXZ/t2ksRYHB4rW/l1AjJfL0ReR+73Pmfyq
40Y+qX5JvJvZht9hwRnqGxrb5gFwzD3ar6SulkEwWkHqdJAbO86t9BHQtw16kr7b
lnOK/Xo5G8MSB35X6TAAgCjCRBccpIwuBZhdH/v1B6nZiQ/ErpY=
=q6fL
-----END PGP SIGNATURE-----

--jmdul6m3ak5z4bke--

