Return-Path: <linux-i2c+bounces-12806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87201B50080
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 17:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAC7D1C62C5E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 15:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C54C350844;
	Tue,  9 Sep 2025 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJPu6eHc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937721930B
	for <linux-i2c@vger.kernel.org>; Tue,  9 Sep 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430088; cv=none; b=dB2G1L9YZowcTQPldYMH9zD0gaA38sAVvdy2L04XkW+7qYxr0LIAjHIFs+7yjhH8/f0+FKEYMTWth1ba/pLPA8Oy7wUxV5EAUU+SCg7OWei9IHr0RMAVkkLLNBCoPT93I0ZP0iL9iNJBexumtzHFhAqvKMnjM5eP1pSlbMq88FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430088; c=relaxed/simple;
	bh=PGs7vjYd8rYyzwAYvYDRUyeAJRynaK4QGuGr+OUHhzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGmUtap2OgYOpGUXRD2MCfSCdvD6s3WeiNZjnQiHrD2YAwQZMNX6JT/YqeCutmkG6gGz+xbDM2Uf3nNdwqZJs6LDdxGFqSA7M6XdLuY+VUVZNOKi9EiaG6tl9MzTL22sZVtmdwdBU+doMSoN8pRUluNqOxJK/XDufkZal2LFvE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJPu6eHc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45de6490e74so21974135e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 Sep 2025 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757430084; x=1758034884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oo2GzS1BKFjAKT93aaJtCs9JdrjrvpKho+/Kv3PPXfs=;
        b=DJPu6eHcPc89T+gUJKMvSDjEU1+YyDShz8B3EcEZ0ShWZTjwXr0AEcWj2kk/y3F8r0
         5tHk/Syd5reGr7wQap1HOZgtgQu2vyHo7LjxDDJPLoKpE+y3ibWGqWNimQB3w9I7BFVi
         gGSR32cDF+EOsza3l/bhd3woaciGOphwAsLuBcqxW25BGRPjFh/f0x9n3wf5dso3GT91
         0RKUdLNUThyUYj3T8YzRJ2wdz9Z0lToGj/jbYwMTxj2652jl7qsBWCeuV1NcV+eFhj2a
         AieNfhP7db8xVLr7G4XhKfFA4lvqzn/pEV2mjsVShT97VsUy4iQeTFpDUmpSl1P0Lj9M
         +spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430084; x=1758034884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oo2GzS1BKFjAKT93aaJtCs9JdrjrvpKho+/Kv3PPXfs=;
        b=l1GQxjvyvIMU71MwaLuVrRjxyOnRxcy58jz9Bk+t3tOv/Tb1C5Yjd00K27VADLSa4u
         t1GirUHLVoF1/9ioXmaNnWaej7b0lNN/bqvICdFIDKNL0L7Ml0jDkxIvrDTmCXXnSm/E
         ytGxv+DJWOGkMqIqFazRQuMFU+JXruYTtTMCELr6URM97IG7EDLgU+MhnK64kvJ9Hib/
         A9BRXOCyhUjAJwCTN2Jr6xDntHX3YeU2kYUSNVqQ80oyQLgjVGolCs/bxo+4ZZJjgDsQ
         Bm47CWNgd9lSFbutVeWz5OBSHI/+ZlPmSpp5qtjWUEUDxdsptHZ/fOud2PUVsSrGnIQj
         GuNw==
X-Forwarded-Encrypted: i=1; AJvYcCXsLFdMc37Eezs1EGa7kNJe6Rtz1IhHA72klbKZOrf7ZVk4ItuED249PsM/1iXSVxWCSuJ1I8FnnmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYogvDTtizHcQRo+hFh1NXxp/jl8hGhy99A4BdceaZBbK7/pJk
	ElaQAwlBdszjz4lA5Al0FYvHbi/j0mmfblSjQ7fH2rea8e2iSaVi+088
X-Gm-Gg: ASbGncvsFpa+gsHE/3ZWyrDmFznOe3CYOL8DvQPaxx6oMDQ2qo1DtPQ8kyfqSZ6cMFk
	eM3rlOUrVGud3v2wGoUwh4MhjmjueFvWUvRno9rAJSCC5whO2fA7jNKl1kNyhY9tyne5bEj8Gcc
	JQkPkXleMtqR/PpRQ3B3UsO4TSBfxpVU1PLHGe2hijPqCAHicaa3DljXOM/gmImgc/ArdapNfAe
	ZoQVG9ReZnWUTRT9TS0Ac+GWVL/yQKVBhOt3u2TLtovCMHSvWVznZlkW3Pw2Iqc1U/wXxzwdiII
	LCxQPBEm9wqGisCeQaEASN0uCnvkGMrQpcjjtYZQHITfLOMoHuzpLKC3MAk/8XP914tcZGwGRDM
	RsfixKLjT3WZQxAqsVIvCHUJbRxTLq2XziUMZdw3qxsgdGTckGi6DLWbYaWwS7bGH0wOInEnWaA
	WKvrujOuBMFL9UOWSQcjI=
X-Google-Smtp-Source: AGHT+IErW2TZyqEDQbDkvq+unnrPg8Fy3yPvW1vBfInEWh2VajAX7rKgQG01C3JB6r+lA0fLdV97AA==
X-Received: by 2002:a05:600c:474a:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-45dddea4cccmr117427075e9.12.1757430082541;
        Tue, 09 Sep 2025 08:01:22 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521bfdc6sm2963648f8f.8.2025.09.09.08.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 08:01:20 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:01:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, digetx@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	ldewangan@nvidia.com, robh@kernel.org
Subject: Re: [PATCH RESEND 0/2] i2c: tegra: Add Tegra256 I2C controller
 support
Message-ID: <22ucj42wvcqr5trsv75hbb6uj4y5zhjigs46w7mxtckisodcr5@77pgwttvycpl>
References: <20250818043345.65899-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hbpzp3jncbfi5eid"
Content-Disposition: inline
In-Reply-To: <20250818043345.65899-1-akhilrajeev@nvidia.com>


--hbpzp3jncbfi5eid
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND 0/2] i2c: tegra: Add Tegra256 I2C controller
 support
MIME-Version: 1.0

On Mon, Aug 18, 2025 at 10:03:43AM +0530, Akhil R wrote:
> This series adds support for Tegra256 I2C controllers to the Tegra I2C dr=
iver.
>=20
> Tegra256 consists of 8 generic I2C controllers similar to previous Tegra =
generations,
> but with a different parent clock frequency requiring adjusted timing par=
ameters.
>=20
> The changes add the "nvidia,tegra256-i2c" compatible string to device tre=
e bindings
> and implement the corresponding hardware feature structure with appropria=
te timing
> parameters and clock divisors.
>=20
> Akhil R (2):
>   dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256 I2C
>   i2c: tegra: Add Tegra256 support
>=20
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml      |  6 +++++
>  drivers/i2c/busses/i2c-tegra.c                | 26 +++++++++++++++++++
>  2 files changed, 32 insertions(+)

Hi Andi, Wolfram,

Do you want me to pick up the DT bindings patch? There's currently no DT
files that require this, so taking both through the I2C tree is fine,
but either way works for me.

Thanks,
Thierry

--hbpzp3jncbfi5eid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjAQTsACgkQ3SOs138+
s6EeMBAAsb5QCvjIKGY18l8TqFMoUCTksq+dfSlHJJM+4LVgi4IoEq+FSwEopNk3
YDSVQuiqvURiv8PV2rptvO966RYxrywgDXUlmpWcQS+9C4EUAhEB9SKHKOWb2tJq
oL4LdO7NkaaC+AKWADz/WER1hrYFj71kKN9aQXfPmoBVtTCCfMijKpTSjCJ+aoVF
6vvLvYG/018WLCfU1iB6gUG9rKFFfMDvDEV+Q2WWxbAm0xFn80jJjnTxS36A6eOS
kzg/w4gcwvMHTIDqt33fjY4XE6dX/e+ttP8sTXFgK9ocNINKY03/MMJ+9n/c31jW
kaBLwqxiZ0HdEImf5451WyaOKzvjaaFedqvBM5XXIeFDQ+mHXJDdtvwhYDr2d4QU
py3nWWycW/pduNwqzlgkLJqxPTClmGjbG1xNfMVJk0NZVmobi4mIZyyph7PqkJwq
2wEE5Kvs2ny+k8ZGaim1ZHiqTvbdYgC1A4UaU87fqx/sYbMF5QQuw0EBsZ5nMZvp
GsIyitpvblYgXAMq3Ow3SN7IlgpOEMATRUDxkzO3iN/gpLihspvElAEUTYi012Ft
tlR6O7V5nV8GWuylcF8XuhQEQJNsIhoQVJk4zaMpTwllSXsA7N1w7hey39lQoALv
B+lCAFcr0SCT2o8UpXVWpOumY54UpQRiZFhk8F9DPHHTv1grZfA=
=Eq6T
-----END PGP SIGNATURE-----

--hbpzp3jncbfi5eid--

