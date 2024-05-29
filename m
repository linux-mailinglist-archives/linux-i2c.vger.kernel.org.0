Return-Path: <linux-i2c+bounces-3697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA28D8D2D95
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 08:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 154FA1C235FE
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 06:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91DC15B144;
	Wed, 29 May 2024 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E7ftm9ck"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6A8273DC
	for <linux-i2c@vger.kernel.org>; Wed, 29 May 2024 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965274; cv=none; b=oCq7ustBha+r7rlUyreHi+65cx/pT9/o0HUZJTAkt+kEXDYuvAhp3939zySq00fZ/b6kIxrSKWrgt6Gdp/e41qzRizefSr6KBgKdxFNmhrvTUEMwIHqRP/ZllfMcDGfNoIKTcW/0jDjYMdiY9Yup2KudMxcCNLLSdD0i2qaFBv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965274; c=relaxed/simple;
	bh=QmHCdhc/mlqBoOr0oFW0zwuSvgOYS1EtOT4a9Re3w98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mi14FXv/HKsFRzVmuMTPYgVyeuAv81v8dl+AC/rqhWqUrlGEo5DY4H0a3hNJCYNWnU4+WDUvoQKkHGbFUZVlAsILsQ86FC+I3xtzyLlgaxsIal6+Sln6V7b/5VpNd8adX/JdM4ZZK4pH40eMehelxgq3tw1Xu860me7/z2hNDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=E7ftm9ck; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0v7Y
	Z0DGoTlv5LbwocGv+P6A+uUTCQ30CCVAx/ZCEx8=; b=E7ftm9ck0lSppdUms6M5
	ZAV58PgI8DI6F5hFBa75dSPgM+Er8wmVPvCk8IjxCgpMdFFjFcCSu4vW2JhXI84m
	e0z5IFsv5hwOdWqAmngo4XuISnTxd5NDR4e6RyeQHFXmtFGaFSwPzRfge92DbE55
	z38O7/WCNYjkP2eoeERAiITk3kQTFo+84doVsvqCrLcUFClzd3CyBn1V98ioyVr7
	C7BZUy/0KRkpul92YNWAzgre3n9ZwBy1wCgttMHnlD1eSECZQuCKte47rG8XOjpf
	HQ8pssNEn1VhAPJEultutJsc41Pm73Eh177dK734ibgJFcIHuP0DDdVZaZQKgbcA
	Rw==
Received: (qmail 468843 invoked from network); 29 May 2024 08:47:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2024 08:47:38 +0200
X-UD-Smtp-Session: l3s3148p1@a9xNIJIZzswgAwDPXwS5AFh1mWvQq9Po
Date: Wed, 29 May 2024 08:47:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Evan Quan <evan.quan@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/pm: remove deprecated I2C_CLASS_SPD support from
 newly added SMU_14_0_2
Message-ID: <x7p5tf6tdgyflv4niimtvjc3hwovj72bo54a6dkmk3uxy4qvc6@2i2atfyfvgsv>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Alex Deucher <alexdeucher@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
 <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cb3f75dzqp4rngsr"
Content-Disposition: inline
In-Reply-To: <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com>


--cb3f75dzqp4rngsr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Thu, May 09, 2024 at 01:15:32PM -0400, Alex Deucher wrote:
> On Thu, May 9, 2024 at 8:02=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.=
com> wrote:
> >
> > Support for I2C_CLASS_SPD  is currently being removed from the kernel.
> > Only remaining step is to remove the definition of I2C_CLASS_SPD.
> > Setting I2C_CLASS_SPD  in a driver is a no-op meanwhile, so remove it
> > here.
> >
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> and applied.

TLDR: can you ack this so I can apply it for -rc2?

Reason: I2C_CLASS_SPD was scheduled to be removed for 5.10. For some
reason, the newly introduced usage of I2C_CLASS_SPD in this driver went
unnoticed in -next. I would really like to remove I2C_CLASS_SPD now
before other users appear in the next cycle. In my experience, it is
possible to send Linus such patches for early rcX. Like it fixes a "bug"
when trying to handle a moving target.

So, would that be possible that I push this upstream so I can ultimately
remove I2C_CLASS_SPD without further dependencies? If you prefer to push
it through your tree, can you send it to Linus soon?

Thanks and happy hacking,

   Wolfram


--cb3f75dzqp4rngsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZWz4YACgkQFA3kzBSg
Kbb4wRAAnmHF2z89VfGtBVsqHxdIowGPdNh2V6Tp6TrJzr7JsVbTdFOESEp9JpKG
+4NBNwp6pq08scDa9LzwvOEKFk9pr/G3CJCZofUpfOI8c2mbnvUD0QIBaOuxb/Dz
P6w38oAO6l3ujJ0nZuFPA272FXaMHoLyAuMfX6J8Oi+KHJwyVsdvCPWABtY/HXbk
k73iOhaWVcmfjGpFXTURuiGuJmiQsAFaze5DzcWDHqrryM8gsR+nwrR/KAjmhnUo
YXmw5wWUIaPZtg8+xChd6Qz5Q35pJdkyL9sTGh7CELxOMQjlUOK1JR9BlZw8QL2d
XFBCiU9ZiuHS7WjJ4fPSeD2EIEWX5YvXlQQBzaxHIj9jpTHjJSJEhbBSvVrw/AMl
q310OPOjlGxy9rnezn7ijCVTjqIsfE5+t7m3XZfqJPj0v3XTLs7AtCq2A6yDoMH/
T/BvvRKK9Bnlfgr+0dwzDy7kMpt8BQl3io+gDRciwz1FaF6Q4ZaJD4Nche15QtY/
z/gaPg8Dz/102E1e+w+wbqyA7dELhOWrjUDM0pe0lhW+YVHWE2+uegGeenjDvdW8
lO7b3xmvoFTAu4W7PXwuDpJU6c6eieI56VscVn/jC6so26/y5y9dzz7zVSK2aITY
xeYPkW8lWgH8DQ5xaMtLt1edhrBRy6oUl0VTednA25bhpRSm92w=
=ydZ4
-----END PGP SIGNATURE-----

--cb3f75dzqp4rngsr--

