Return-Path: <linux-i2c+bounces-11108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4BAC082D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 11:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3941BC138D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 09:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA13231849;
	Thu, 22 May 2025 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ISCJR0hU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C81E3DED
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904773; cv=none; b=iVmUJJPPPgxg2i/UdtBiHfPdsMHAk92dy3PcYZzlalH7DC1Miy2Hwe05oLZ5apnInBC8SzlpGtkueBZoZUAk+N6isF9ouE6FS9dlp2YK9Kxd22FS8o17j+I2675EdzZWN5mhJ2eI4nwhruTsVSN3FJZ6Lg307xsu6VrIPL71AYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904773; c=relaxed/simple;
	bh=1aA7HwU1n1v+3XowuECVC6hqzuKf1pDD5kgEoVS4InU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMVWVCe0IKrndlgb/mDVJVkicfssoiwoDoO0JNbQTr/W5WMbZCcPK70fWuXot0H6Wtyen+CgcyZnAiHbydhfYWYBFLA4/yasKvlsj+Rfc6eacJxJgGx2WjGGpiNwXcYmdqNiEbvQTCRgoo5ksrEODfIBtG5oC2xa9T+r9bTpblE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ISCJR0hU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1aA7
	HwU1n1v+3XowuECVC6hqzuKf1pDD5kgEoVS4InU=; b=ISCJR0hUQbkEnPpprBI8
	m0nc+QlFeliFgDjh86G6Fub/BVAfW8LhFlWvAb3HbhzbBJ7cfMR2TRSvQGO500Su
	ULuAhVOTfFHPKEAxpdGG1OBj15ZZJRZ2cXgreRDPNxuSkoCDDBV5HZayaszKwxgv
	Rilm24fk0KHvr0EZkd6JTBUUQP+zvRl2O4O0rXjZyQmnLp6tJsROpKmMsxmNYu/V
	Qf0dYMl678saimNHEh9rz9YZ0EtIwIAupM+It6VWmBkfHu2txeAq41TDsYN0fkdn
	0AzS7IzACNJEjob6HdBuCuHbRdCW7v4O4hNwmk5773DswEc5cemMXuEX1jA7BkEx
	kQ==
Received: (qmail 3586651 invoked from network); 22 May 2025 11:06:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 11:06:06 +0200
X-UD-Smtp-Session: l3s3148p1@BwC1yrU1sNIgAwDPXwj7ADHm2wGe7qss
Date: Thu, 22 May 2025 11:06:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 1/9] i2c: atr: Fix lockdep for nested ATRs
Message-ID: <aC7o_obqzBlhW0tE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
 <20250507121917.2364416-2-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GkNdphenG3CBojfr"
Content-Disposition: inline
In-Reply-To: <20250507121917.2364416-2-demonsingur@gmail.com>


--GkNdphenG3CBojfr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 03:19:07PM +0300, Cosmin Tanislav wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> When we have an ATR, and another ATR as a subdevice of the first ATR,
> we get lockdep warnings for the i2c_atr.lock and
> i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static key
> for the locks, and doesn't see the locks of the separate ATR instances
> as separate.
>=20
> Fix this by generating a dynamic lock key per lock instance.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Your SoB is missing. I will add it for you if you confirm here.


--GkNdphenG3CBojfr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgu6P4ACgkQFA3kzBSg
KbZMpxAAlHCxv5mOj63C/jK3br3u97V93aFPfK7YKaQztB1C3Dp188LFGlbtlfaU
VOLrTsXt5s+l7E0NasMyF4XmyhJ7H90ut0vJZxkDQiXT/xsAKaByQRz5d1EHLd2b
DiTDzo9qfT9eR3kqVE0473T5ET77IO3CPasphHfaZj/CAeBYYH2w+4Hlu3ZzjnH5
98HJJnTFCVS+qCbtT1Alf2xLG1Vik772F2hdfg8Z7URFT+aneB5FOkdqQLbgIYsI
Hb1yHk/0JnhHxsmLR7eBHNggyGZWfpHIyDli2HT6fAUJ5CabkIymw2SwVA0Eya5i
6zQwkI4me06EPXe48XRd+iH0s/GRnL7M1pGozg54laT/LG0Pw4rPsogrxMY8XoDS
SAI23WR6m7A7WDdO2SRDQIezXE6jwsK25MgG1e6BPurcFcfygA9fDTdf6bjJj45d
hZonWI5YVnYoeFH75Kqep1fnAO6oBJWVG6GxZzbA8ZJ3tmkdFB99F12i5tqxHMgi
H/JXKam7f3em6bT2ZjR2EsgqO3MJGa1BxXjIva/NJh94bsN0WnE7PrTaK+W5jkCv
bxQy9saYq0L3GyoJfP7+PxgpYzISIvhedwJl/DaRaE6OCUzpRr+3q8bQbrheK3Nf
lOP4M7OKkNsrSw/ZmVLHkBIvtoUKWP8O1565H89dTFbK/WBPvag=
=ljn4
-----END PGP SIGNATURE-----

--GkNdphenG3CBojfr--

