Return-Path: <linux-i2c+bounces-11867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA24AFB760
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 17:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D3B3ADB81
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 15:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595642E2EF6;
	Mon,  7 Jul 2025 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/Zt2SXG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861EA20010C;
	Mon,  7 Jul 2025 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751902194; cv=none; b=WkS+oYXN/GW1qM4XP/zDgOSpgfZ9XdWsCQZEVTW1mNbdu5enA/rCPNRemtIM874Rd+XHsqWmBubwGZtAtOLhbsYUnkXyCOMp/xybkDzyh3DwuI4kyIVrEFJmp2q51XEzkds84NjrW/4ZAizatKnA9sgFNpz1Dyk8Zy0310Nnia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751902194; c=relaxed/simple;
	bh=82uXt7EzIvxOXvmJCHBGzHY9y7rqqIUN+oiNahKi8JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DE9dGtqUl5lpxWz+yH25Z3VCR/yhxSjb8EHoOkIWKnSUsCKVkJnjHuseb8GQu3fA0mO0lFb+GIvag0bOcQWh8F1MYMkJsV0jPSIb9hHaGfbgvJXoX3v5n56rlASnQhf7RkvamuDxvyFbzjBZ+aPgtPB6rPOOVAUyTabRQYUgbOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/Zt2SXG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2012504f8f.3;
        Mon, 07 Jul 2025 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751902190; x=1752506990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4dS3gFvjVuC+iSHy9KZry37CTP3UXNpeO7kEez4d8Y=;
        b=L/Zt2SXGwlR8OYGK8vHD5F0I2GQl334qt6DL47efsnQLDxdmKFe229SXrujKpKBEco
         vNjojzSvY/mLG+7teG+3PIN4kChI0DtieKwcl+uba2lqJ5nNp3+qd6yN2BiKpQtqmZFS
         gOq2I90WkwZxuNJ61nXLT991TFgmUUj+sWWkmPvgm4+BxeExIIX4cTL2uAHk4YLVPy0d
         ja7H/7R9UmscWkV5MdylGUPMvh3Dg7ltRZlOPG5dnTOm3SSmwWkL1fC8tCb0FiTLCluV
         TprMA6gUQ7zvZA0liHh8cYxxE6DUGDaBD+xAbWrrrn+oFLu9N/512UsBfh/yzTkT9W1k
         GqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902190; x=1752506990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4dS3gFvjVuC+iSHy9KZry37CTP3UXNpeO7kEez4d8Y=;
        b=IAVqp/ikPePFEn0HWYA38wSc6+tfxAJNujdAUp2OaZwfzFBkHiYTBR+Ap6kc9XqFzC
         brf29dUUMseQILi3nwB9Q4nAnZP0W4W7UdQiuB4xlOoNSVKRnzV1DtJgPwZ/rteSgFcM
         /6aLajqxyF5CMuYN+lS4kqV2lZPSuWgaRk9rD0HXDkLi3xnOZeggGdLbqgeG+Lh1oY6v
         rmOJ769VvA0qP1AOX1E1ZBF130wH3gtuQwieOvhNu0gPf3fPC/FUjMBT9ed7GcPNeZhy
         N8c8IzwoEHQWLgRJQeAubPdz2d+3OQRttFeQii8R1F8gZAQfHfMEvSQ1cHMDjV5mh6dK
         YUww==
X-Forwarded-Encrypted: i=1; AJvYcCUtmsjoMCrHSjAznNj+peBMEwXCfktrkiGYmQJVz9KDPiWYjdYyYxRURMUvNspTsPaPLPegcUdo/0iO@vger.kernel.org, AJvYcCV2ix2j0ReDo8gXbjmf8dI/RRi13VCLM29aNA55cHoWkyAI2t4qIviAFNT6rzqGT7xmWWUvLkmxhMka@vger.kernel.org, AJvYcCXAGVKVrLVL5EZ0MWLNCXWvM1lXiTahRRyiLTcclZWV6GJ6+567DYRcRcnZSZfI39nDHFZEEoxQdTOpcKI=@vger.kernel.org, AJvYcCXNkICqw6yr5BH2OMGevqnHMdMkkN8zsie0sr8ysEaO4E3B82SY38WZ1ExE4kFBpdVun+y4yICZ13YD2+7C@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/H8i0wI8hQfxhjg2dv+XHIb2p49nRJsRQ5ljtutM0RmBHYAz
	BBltmqmGjxnT710LRf6eNhbbhuTXyfw8t2hKvQEUJSC1zXxwYi+QSOiM
X-Gm-Gg: ASbGnctMtKNaNBFrt0I9idMFFBbJI+IHuv1GA0N3YtdMjZnQYjydxCf/+c6XecNhcjC
	Kjdg4znGBt3r94dd5+YzmKy4Ms97MmsB5cHE8NUMnh9Jx9uVD8M88fqnFbgi3Xw2kp6U5A0Sk4g
	dV4iuAeaOfUgh2RI2Xm3/dqPaxRDcW4P6qAW08x/3la5m2IWO6MwfqBjfDiN42Eh3wcYcjboDjn
	pzGfrqN2DGzEk3kMggi0oLhboA3pxRfUbKkn3D0XIveNYVgviryxFhX6TCvLxm0v+rsdDqUuRfw
	9bdIoGoX83UGY8ivkpP/9g+xonz2AGJQONlpYR+ww73BwHI7DoiwblbRelqw1J2oOMrM9Bzk5xM
	Rz0A6+gPeBb6bsE2cg8qF6T1aRiTqVs05ooZtIwWBYr/JY43n1L3K7S4Sr7Y=
X-Google-Smtp-Source: AGHT+IFu2akTpaC3RYN4UB6CtiPpywIo5wdBbRlRlCPEGeqYO+NEYTLmPxnkbZBXv5D7nGc81G2YJw==
X-Received: by 2002:a05:6000:26cb:b0:3a4:f936:7882 with SMTP id ffacd0b85a97d-3b4964edf3amr10563034f8f.55.1751902189667;
        Mon, 07 Jul 2025 08:29:49 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c4f9sm10435808f8f.88.2025.07.07.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:29:48 -0700 (PDT)
Date: Mon, 7 Jul 2025 17:29:46 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "digetx@gmail.com" <digetx@gmail.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] i2c: tegra: Add support for SW mutex register
Message-ID: <sw52lomjxlkpfhdhremnq5v2svbejyuj55w2zektyzar2rst2b@pjbyudumm7ru>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
 <20250609093420.3050641-5-kkartik@nvidia.com>
 <wgpcfddybwgdt4ggllooh35iukid24urb7mrbrcd5egs4blqyv@hty6js2piqug>
 <c4e51677c889e74dc3d138b436af640c126ca613.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajbwkm4ctnfhytyv"
Content-Disposition: inline
In-Reply-To: <c4e51677c889e74dc3d138b436af640c126ca613.camel@nvidia.com>


--ajbwkm4ctnfhytyv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/5] i2c: tegra: Add support for SW mutex register
MIME-Version: 1.0

On Mon, Jun 16, 2025 at 10:25:18AM +0000, Kartik Rajput wrote:
[...]
> > > diff --git a/drivers/i2c/busses/i2c-tegra.c
[...]
> > > +	if (!num_retries)
> > > +		dev_warn(i2c_dev->dev, "timeout while acquiring
> > > mutex, proceeding anyway\n");
> > > +}
> >=20
> > I take it there's no way to refuse operations since there's no return
> > value for this function? I wonder if it's the right interface for
> > this,
> > then. If there's no mechanism to enforce the lock in hardware, then
> > we
> > must somehow respect it in software. Proceeding even after failing to
> > acquire the lock seems like a recipe for breaking things.
>=20
> Should I move the lock/unlock operations to
> tegra_i2c_runtime_resume/suspend functions?
>=20
> That way we can propagate the error correctly and fail in case we do
> not acquire the mutex.

suspend/resume isn't the proper place for this. On one hand, returning
an error from suspend/resume typically indicates that something went
wrong with the power management bits, and the SW mutex is not that.

Also, runtime PM support can be disabled, so those callbacks are not
guaranteed to be called in the proper sequence.

I think we want to add calls for these to tegra_i2c_xfer(), after the
pm_runtime_get_sync() and before pm_runtime_put(), respectively.

Thierry

--ajbwkm4ctnfhytyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhr5+oACgkQ3SOs138+
s6GxUw//WtC5oQgZcUoQEpH4tFQYWE0G+mpxyI2OURkVygGtUgxzDyUDs0SNY8yE
PfHykClx0xpTU9ET5GrddoUcfgts50MR0b41fS+xfVD4d6CJQJQ91IB2ic3JSKJl
NzDkoiGaKvMMWPQ2pVF2Ce4Kg4yIpd4JN2IXpccMzpUzNH0jd4j2zSkIIuhTqlG5
bXQNwKS0LtQLuIkvevvmbzVpNg8+I/4WD7GXMYpKXdq5hq9bWmia/P6Yjs8g/HwH
yp1FRvzCHIRWSk32HEdLeUCV/dnLXgGf94qt+29V/tWeayqYEfj7+pv0R838FMIK
SHxmodNPH17sQgLXI0nSB+53fntCpftROfo+iHoIVpR2wsz73OeyWuTG9ubl3DEe
jkUf53zzKh738/LA4VIiC/sndtZLSjx2bqzTzpc25OXx6gz58nHvk0YWqlxplEQ7
Q1HuhVu5YfVmwuOzUejrbaRF2tPHPVZRpXieygjnSvjXDSEvwhlDsoAQRTV32Rur
pT5v3Z779leVBl1/tUuyzUHGT7cpjf1j556p7zeWcFkMZDl2aBUOhanMBihraz7/
/hwScLn+tSk3kyIzdFwxY0c87Qe3oGbylwbYJOF0LOfXSMAPCtPeupKf1eoBv8Uj
2P4SSSh5iUv24sJ4DL9Lao/FHdxlR7+YZ6xc06JD4DR8GcIDhAI=
=OK8/
-----END PGP SIGNATURE-----

--ajbwkm4ctnfhytyv--

