Return-Path: <linux-i2c+bounces-14312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F02C8D8FD
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D6344E7134
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2152FF15E;
	Thu, 27 Nov 2025 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXsGE/lc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0D2296BC4
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235895; cv=none; b=t2XQ/CZKJIVT2ovN7Rsi8Q9Kx0eeTe1KYyKkVhKOiCVaxF2rNIG2gzHHqB8zITr9ueqM9jJMa/qzBo4F2j/ZDaU9S5iEnnBFor7Tan4uXUhgSzKYt9e4z3lFDgeN0qZldAWwMMm7vRkkPdLg9fJgxmrOwmYM2Kkkbymj8ZvA7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235895; c=relaxed/simple;
	bh=/08PcHxw51nm+it2dWrgJ5eWk8Yd/Pq/YzWZXPSWdUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiztsejfpqfeT0Akz29kRkTFXiMH65DpPFHYqOuEsH4STfFSJCLAvibUM3tOA/WuY7U5NRzDMpWqkxL1cSivp4wrahSP3Zv0hisPS/nmW4UOFGdPh77xXJDb/fy45u6t+CLeUvidbFfZvStxkmXPHpZC2Y5I2jOtVJXsg+EWDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXsGE/lc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so5540705e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764235892; x=1764840692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjpdIzupHn93R6eK11UuuUB2G3dSLzMnj28Tach0iXk=;
        b=hXsGE/lcbj1OKQ1NDZdvCpymphAqWwMgc9UwbG0xfOAt/iSQpDbJL298HyDQE51ua/
         cfR4hTtzLFyZv2DcwxZ0QefDbbvAesSdVoXDb2P8NYpnb/ZiZUrj5zuAPUqNrjTJBgcc
         OCAMON2zHHkoSTIKyFNWkxaMpYvmv54ogkZ0/cRvrp6JNCmtxIXkdLdl5iDwGpMNVIUe
         GyAJAKW0hoIHDwiW2TX8lxRczSMHuAimocz+hvHsFzUviAWw/GHqnRwurHczOM7J28mm
         uBqBcIPI1JxQzwV87AYUiQTD1FDW/H6ElXtEj+/KUxM+M8XsQt31wRXx8GHFPkqi5JPM
         0cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235892; x=1764840692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjpdIzupHn93R6eK11UuuUB2G3dSLzMnj28Tach0iXk=;
        b=fj7pVbEOB0EONHBjb6z3nb+STg+ZIOt0Q0QPJBSxaX3d9hwjmQOghu0xRBWfaQ/S5N
         xTlutv4OwB4olA9ZrSzKlOpsm9gOFFu41T9FOtruFo0Odxe1W6tjsncBgu9RCzrnaxJ3
         WKYg9DugM/bVd/xbZr9MgsMs5IgLks+wB4EgQo1nUQHNJzYxaoHlL0IFvE0cjZXcLi4e
         YgVKO7NH78sWsR4ddcf4ZH/BMK6dVPBast+dReJTESb0Jqpo1xF7Q4Q5AAxPfmXyzbav
         KssuoOUmANUhsjDy/kwh3m/k7UidNnJCEVlsGCIYIEthVU/W22/I7CPf30WrECnLi+nH
         62YA==
X-Forwarded-Encrypted: i=1; AJvYcCVpYrslCkidi2/rFvJ7rUKAVETK1UXduVLIAgA+NGUNSMVAfPqXyKGCpaxhR1UI090P4rnkg8J8kKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlSjr79wUW0VP3hQrWnCx2gdfagG9isjsjON53e5R8siwpfgq4
	I3x3SFi06MIZ92hpHjhdL6H1AAmaTnP7GehYb3sjrw6kVX7F3MAeKzHs
X-Gm-Gg: ASbGncssFNWZIPPKY5U62KM8jNgaZaG2wl5CSxSfeT1a0AT8OGtGFHl9dvV+8TecQz2
	v8yYjri0R1RsaX4xGfcjpUsMzuxzMla+LW5y6y2a25tx5EY2LLxETWzHeJR0X4i2L73JBPUexZx
	ii+aWRyCIEPkhJ5+TzFVd1rvBAbGgLOpLjaTn7KWcUwXzEJpyFdblnI52JDNkfwf7rFswk3B0K1
	CmgA/YH3uH766vFn70Oge8P4w1ti4oi7cWSNqTgbQxnhaAIyQ6cqxa8VNsiTRbmJzcOachv0xUc
	j3tFSweMfxbvWG8pZE5l4UWNKT1ttiLMhoKVgzu7nSaZ4SIXKLfXVaRYfDtvYLyTERBTgMbUhSX
	l8eg5+6SgjeP4sCJAiPTAzC60L8snYhGydw4uKs0MdGQfZKhRUTprdcFVTWf1BWO9A527YyxaWi
	Nu+pAEaS/cZ1J06Rj8sbRXftxA702IYfg+UXT/bECdUWXy/yEv8JTntO4jCDt9IdANIE1bzjEer
	m0PmA==
X-Google-Smtp-Source: AGHT+IHHZV1fl/8g9lI9eJxNjHacdNGXvjIn2me3Q9h4Yz4Yynh+5UaSfxvv9G3kOMyGmEYIeSSPNw==
X-Received: by 2002:a05:600c:8b37:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47904b1e86emr83504095e9.22.1764235891973;
        Thu, 27 Nov 2025 01:31:31 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc1d6sm84894705e9.12.2025.11.27.01.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:31:30 -0800 (PST)
Date: Thu, 27 Nov 2025 10:31:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 3/6] i2c: tegra: Update Tegra256 timing parameters
Message-ID: <7ras6ev4ljd4d3zwhq3igrpf3fph472q6o3zkxh7uyjj2gwb52@4wyse2zipszu>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-4-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ckj3gwx6elm5l37n"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-4-akhilrajeev@nvidia.com>


--ckj3gwx6elm5l37n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 3/6] i2c: tegra: Update Tegra256 timing parameters
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:17PM +0530, Akhil R wrote:
> Update the timing parameters of Tegra256 so that the signals are complaint

Nit: "compliant"

> with the I2C specification for SCL low time.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ckj3gwx6elm5l37n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoGnAACgkQ3SOs138+
s6H+qQ//UlZJT/+M2rR+ZHLJqLxmBqFCFZm6Ak8BLhKAUxVk3JVwQmEXm9VEoDLL
ljktGTY+4GTL77VGfhWAgY5J5Dv0vtxQMx/ggki9KC+0Tldj8W+4y14+H6mVwkPS
Xzei8Hom5FuT9NcThVx68Q83gOidXcy9+IQguW3cHsC2PZdhu4hdWH1ueC8uty2G
UK7USErbzpc3R28NLo6/Qo9PEou7uVXNVUIc+XgBkUC/lrPkSIDOMjohmNOiHWde
LbStpSUe8kqQGGTVmCnGEpp15eTgfnugBa3tXYMKZR3FLLK/ASOFV67uCbgqbcbj
YiVG+YO4y2n6dnDv00r0Z+vh+ROgsEm3KTplVaFVXxiiqFpucTWMAqQWlPFHOqcy
YEkMFxazIwrcm3CFhyPXJ4T2r+v/R1eHN4lbldETGXtCiSA3CyxEOG0aJatG4g4o
eZMZvG7096mLPPZG822Ycl9pjmoBLm03yQVki/178JujSNCxYI0PMQANz7JVIHH/
lAmVE077dhwcV/HOwktqEQ18aU0YIo36bgWXULy6f6NnOE/IVpZ9P5ZZDOZ4/Cel
Lxyt3lzziVIvP1ho0cCo+gVSi6Ba/o2hnwhwLHe9TKwZZTnREHU7+GrxrSMMmsgQ
CbLf91oqvDS9KringyXrbihoqRBgAMyu3vzSckNqfFGBcIWcxkg=
=kHv9
-----END PGP SIGNATURE-----

--ckj3gwx6elm5l37n--

