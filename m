Return-Path: <linux-i2c+bounces-2808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7281E89B367
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 19:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123461F236AE
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 17:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888D83BBFE;
	Sun,  7 Apr 2024 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I8rcFXs8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74163BBD4
	for <linux-i2c@vger.kernel.org>; Sun,  7 Apr 2024 17:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712512257; cv=none; b=SjWYNU2Kfu0lygpDPBCjtpzE8TqOLyFgfRdt7Nlf2vp+Q3SRrzckOEtxzQ6GaouNACI+bQ5fqcmLwslNFEVT9cjt1x2ANMKLFuq0lTiqwXuubeXILBmQN6BOB/oZD5kqqDdFDC5hNDCvQJNgXA+zjCZczbGjkfiETdIpcDLlnoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712512257; c=relaxed/simple;
	bh=R/jq20IySS+sgGI9eBuSnT2kN35JE6wijH5AxS7Br70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNuYaCjDcfSOV+mvZKrFXcul/qJeg0EFKavuDefO0qKOe6Ysxxpz9bQZ18JuTa6R7bTwAU1t1yObasLkfu5KYT23ub7K9Cfcgx7VWKWJWmS7oXipGEzKjaMkSrTieIfWyYFFW2+s5wnReb9mZg1HEh8pUWk680+TO0g+Q/J3LQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I8rcFXs8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4t2Y
	Q/qy30jidZ7O24IB3uqzEABMi7K+pNMZ6EvQcas=; b=I8rcFXs8Ya99YYGwKQjv
	BDixyZfMkAM0HErrUX9O+UN9Cl4QLLoj+1+tW9ghHFlZcZLg19vMflJtIBWr6mWI
	kiREuEovpji1/WrfPNyyxzK+loDURCBXJYw+OqS0f5b7x/XJw2SkAD3LRrOpJ5T6
	T0JwU2yacMK0fgWJzl8kuPxknxooMbcY0LcPQsVNdLuBpf1Lnq1jdSlIfvMEfSAE
	STnGfKR202alQDncdL3TVlC5VPbqov6TNPuwo0CLHEtm3j9qvg4XBx392N8pPGLG
	5D6FQEzlzMX8kvu28JTDoA2tgyNWbZmW6r2OsRZBr5oP4flPBJMXUjGFHhLf8d2Y
	6w==
Received: (qmail 538382 invoked from network); 7 Apr 2024 19:50:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2024 19:50:45 +0200
X-UD-Smtp-Session: l3s3148p1@Dli0U4UVEoUgAQnoAF4/ADroH6KhJW9n
Date: Sun, 7 Apr 2024 19:50:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 00/14] Make I2C terminology more inclusive for I2C
 Algobit and consumers
Message-ID: <20240407175039.za3eg7la7i2jwvun@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <ffumcagmzdstcf3qcn3f26555pnu7i6azjppciyd4zvcoit7pv@vu262tsfnqyr>
 <3bd8d2f6-dfe1-479f-bff1-f2921b1940ed@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="otbz5n53lv3dv44g"
Content-Disposition: inline
In-Reply-To: <3bd8d2f6-dfe1-479f-bff1-f2921b1940ed@linux.microsoft.com>


--otbz5n53lv3dv44g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Easwar,

> Sorry, got excited. :) There were drivers I'd been part of that I specifi=
cally
> wanted to fixup, but then the scope grew to other users of algobit.

Well, you got some positive feedback, so that is good.

> > It is true that I changed quite some controller drivers within the i2c
> > realm. I did this to gain experience. As you also noticed quite some
> > questions came up. We need to agree on answers first. And once we are
> > happy with the answers we found, then IMO we can go outside of the i2c
> > realm and send patches to other subsystems referencing agreed
> > precedence. I intentionally did not go outside i2c yet. Since your
> > patches are already there, you probably want to foster them until they
> > are ready for inclusion.
>=20
> Sorry, I don't quite follow what you mean by foster in this context. Are
> you asking me to hold off on merging the series, or to follow through on
> getting it merged?

I think they are your patches, so this is up to you to decide. With
"foster", I meant you keep working on them until everyone is happy. I
haven't looked at the drivers you modify. I can't tell if they can be
converted right away or if they use a lot of I2C API calls, so that it
makes sense to wait until the core is converted. I trust you to decide
this.

Happy hacking,

   Wolfram

--otbz5n53lv3dv44g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYS3OoACgkQFA3kzBSg
KbYf7g/+KaVes7wupe7nkKcoPIanoG7cxHpUDAmN7oUnNvo+ohAUMW4QQArNIm2s
5XNlfsu3X6VylCN8OD2kzHwBeAv706tbSViyjCtxmeVKAaXEh7/WMAfKBkrcDZMr
RCcbCz3DiLj7jX+r4iaSebNE3FBuLX6seWUJgN0vF0M+RvsS5uQhsmUd4+cUHBo3
pMk38vgS7Q3H47QRW64JJRKsKT3N5S8NMoYZKGDMt8omF6hnkvgJ9W0TnvenD6Q9
QTMZur4Z25/gnF3Ds2WS4R4Y0VNo6EFludz5hNNg56DuMF9ErhUkGeixAYIgRJG2
6YxZ1f003gWC3SgXuw91vD32QNJoR49DTaE4AnRhSx/EFK7zvwMoA7jOj7xx43i1
xUPEpGjI4K68E32JP9wLj/rvjAW7REQyA+nKVaO7O6vbKVihpdMr/HgMq/UE3sIK
CpMJ1Czfd56FUKE38vNihyL4V70O9iqMMiJmGd0gTQZ+WLYootZU9u68kQeMDah7
2bbZnQzBSDy/xGzVdfrozrUkvAqd0Lo9qIJcCxTqMSrC7QWBGLkQXMOTWivlCRe7
TtE5kBO4N4deizuNFwQEnoBpM9RCV+P/Jxd9EXHbQ8uwVWC2xU0QAJdWJwjicO5x
Qmmz2/i/uKhU6Xwi82t8aASq+Lyc/L5LLwBDymYh51o1dRG3mVM=
=V5fB
-----END PGP SIGNATURE-----

--otbz5n53lv3dv44g--

