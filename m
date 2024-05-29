Return-Path: <linux-i2c+bounces-3708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74538D4114
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 00:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED5F4B228D0
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 22:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDC41C233B;
	Wed, 29 May 2024 22:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="amwE75pg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653801A0B06
	for <linux-i2c@vger.kernel.org>; Wed, 29 May 2024 22:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717020399; cv=none; b=TnemY5xqSBODI1ApaTCRsUA0Vnwgs3gm8Qm+0F/MF8VPG7Yn2X1+lHBykvSS4/eudngXB8VmkoftTWs/B0v437/TpCO2os8xyEepicGbGLOXpqVKOxBcorLUSzalYlfDAM+OotioTKN3aYsWMTjvfJVLbHRtDhVD895Gv9i+DR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717020399; c=relaxed/simple;
	bh=gqku+zLIpBCbEoUm2t9b4G4s51CT4cKXq/2L2o+D2Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skul7w8ypOonLoeTz+nGWGi0orl9+nenP94yJRUc3ySq+IhtXcHYu/c7IkG5jRz7PfKStvvrdiuUw5cXtrvMY96cr2jcDWaQJXXHwec+1p1KvzLg0inJGtYOwxl860RjUYTF3jq9qMu4jAn2ypAkqYGhPW0EXJtnwVPQmRSxntw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=amwE75pg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gqku
	+zLIpBCbEoUm2t9b4G4s51CT4cKXq/2L2o+D2Qg=; b=amwE75pgV5dK+4xFnPqo
	DyDtcsml9QX3OQIqAcBMzxdsM7JT9ENaCeu9m8uDlo/IqI+1/L8UL2GZtO/+wTMa
	1ocT/UUAYAdYP7eu7cHOpMbba8tznOdPTUWXkH3ed+bfSYKpEyTbyYS4zOuazQxQ
	Eh6ZPXh9FSt3dq+L/Ke6awVZt95S9hLnsoqiyLrAujdBeek8gWD6g9Uq6G1NQQO0
	bjyEqY5GdORi2p2OTgUb0kBJwdWjmuGV45y7EFH8sT2uSAfFX9h+hL+B41SutjiN
	0pSWM3LT+tkthnpuUpeYnRbOCDYAm+i1aOyKzPYGqOBqqR4s5QxJgUD5LwpPKXAL
	0Q==
Received: (qmail 701441 invoked from network); 30 May 2024 00:06:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 May 2024 00:06:33 +0200
X-UD-Smtp-Session: l3s3148p1@Ddue9p4Z5olehhYM
Date: Thu, 30 May 2024 00:06:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Evan Quan <evan.quan@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/pm: remove deprecated I2C_CLASS_SPD support from
 newly added SMU_14_0_2
Message-ID: <u7nhecqpzwxlwdygbbdza7savhjiy4y4ogvnv63gk6ywfqf4ju@negufshp53rs>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Alex Deucher <alexdeucher@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
 <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com>
 <x7p5tf6tdgyflv4niimtvjc3hwovj72bo54a6dkmk3uxy4qvc6@2i2atfyfvgsv>
 <CADnq5_M=sd_spEFnboWECMU2t4--y0XF-CcMAL8e_49Zt4dTig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jxe733gkonoiyxnn"
Content-Disposition: inline
In-Reply-To: <CADnq5_M=sd_spEFnboWECMU2t4--y0XF-CcMAL8e_49Zt4dTig@mail.gmail.com>


--jxe733gkonoiyxnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > remove I2C_CLASS_SPD without further dependencies? If you prefer to push
> > it through your tree, can you send it to Linus soon?
>=20
> Yes, I'll include the patch in my PR for this week.

Awesome, thank you!


--jxe733gkonoiyxnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZXpukACgkQFA3kzBSg
KbYAdQ//UqdmClsxjsSeZBz7JPdgtAFNhuqS5n2rZWzeQc7KReKCwlK2a4RRAgs/
0LgD55L4tHD1UQABiwDVvU9O9wiT4j2S6f8b+vfHjvXLJBRq7jSymCtyFlD+vZPN
pwS/WKCtp2XO+UDD/uRxihTFgvaImUsap5KAL/yQ7XJOAImhxvcKpEO4SV5HJEA3
vARvBwQp3daxxG3htBfGyb952+sm2qCmYaEGTYX+sdbbqdJ6CCbXvjhYwNOl647e
aJJk7yMvOJ01njJBPSiyUES6nLBdmY0cBrJyyc2osyOzQljTuaYQ+ftO3JDZW7jS
EEbtmi7ZhdueZBcrhCWi6G/IKq03JTH8Ve+xzqGAQ7/KHHROHPeeydr5NKfkfKSh
3bz9cDdVlbwBrzww1KM0hcWgOpJ05uaGt8gmDcb6skJNY4uf5N8yTCnD1TmkZg0E
Z60sm6BIady20o2pVk4NbQ3GDda7w0I6UIsgjZIZuJitq2H7sFbuIySpsz3z9LiY
umSRGL+a6QcqmZ35MRKaMxsye/2Dsi3AyM9kviQnv3s5t9AY3JdX6UONgztXsEW1
h35VOzqXvUhRUjWHSMNojqFDUqZnmg4kQrkP3yldb/oPXPJK+pXoBJzZfxR4+vip
bEa0tp6VWQJvIIMuUTriVHRHoWYKi2p22UHzoBg5sCGI1nZdkJE=
=g8mb
-----END PGP SIGNATURE-----

--jxe733gkonoiyxnn--

