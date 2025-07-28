Return-Path: <linux-i2c+bounces-12054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B595B138FF
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 12:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA1C4174248
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 10:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA52721B199;
	Mon, 28 Jul 2025 10:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jyQuzSfB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F88D28FD
	for <linux-i2c@vger.kernel.org>; Mon, 28 Jul 2025 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753698708; cv=none; b=gHnXm++5EvU8M2VdSCIAogMJIypR3ryXNTna5pk7tLwtfkz4LNlM06CYlXPb1Jzmq9G4hKgcehtjUT7/iovD/M2xv2eFX7UgC9lJhXuOEbppSAFSfHpBhT2rUNSJG8cAof0kphmlZ/3vs2l7AwPAUF5OWY9zz8JCh+gqIu4i6m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753698708; c=relaxed/simple;
	bh=cc5wL9C6sVJ0p18vU5oQI/666swL81L7ti9UR40UUaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sn5evlEBIXFqm1T+hiFJhE7zSBqDUDaRJuF1Y3BHs3C6e0ZKGA1aKziuvoPpY2EG9bhdiBQhzeLyax1TukvGxlgn592BeCbkmnRESWIc0GevpVipQjPZC0HqkQARCj1BiwUfw0pnT4q6dPSDQ85wpZOS355emM3dGqSx4nfyTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jyQuzSfB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cc5w
	L9C6sVJ0p18vU5oQI/666swL81L7ti9UR40UUaw=; b=jyQuzSfBQVbZMNDQyTjn
	4hHRXQUvSeJhdWJt1EWWJbHa4DQ3+0nhrzOklXQs03YIS/87MlZq5SIeZ2P0JTMN
	9Pv5bZ21qv7xyniyfnjhiUgm9dR8k789C57vQXNphyNAh9+2noWCKkStU5mmVLzX
	1OUEu+rigWcmCfnqi6EczCeLzo+oyminr1dP7p7gZ7hxqhkrBERmPbqJVBrBoOZQ
	0E1UvWdEQ2I2A9ZRD0wCBxcXTuq0hKFp9Ua3qkiPRPR3c0dkZzk6AVhH1XN8QZ4r
	XRHUD44hyosSy40i4YYPQDsOKmTsgYr08Bn9jF8QuUulCzqPfXrmANVLmULcAJ9j
	ow==
Received: (qmail 3402892 invoked from network); 28 Jul 2025 12:31:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2025 12:31:41 +0200
X-UD-Smtp-Session: l3s3148p1@pTsezPo63m5tKPLn
Date: Mon, 28 Jul 2025 12:31:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wojciech Siudy <wojciech.siudy@nokia.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	peda@axentia.se, andi.shyti@kernel.org, mariusz.madej@nokia.com
Subject: Re: [PATCH v6 RESEND 1/2] i2c: muxes: pca954x: Use reset controller
 only
Message-ID: <aIdRjB2fIa09m29A@shikoro>
References: <20250603124721.449739-1-wojciech.siudy@nokia.com>
 <20250603124721.449739-2-wojciech.siudy@nokia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Px5MLaBzWfo1OMoy"
Content-Disposition: inline
In-Reply-To: <20250603124721.449739-2-wojciech.siudy@nokia.com>


--Px5MLaBzWfo1OMoy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 03, 2025 at 02:47:20PM +0200, Wojciech Siudy wrote:
> Fallback to legacy reset-gpios is no more needed, because the framework
> can use reset-gpios properity now as well.
>=20
> Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>

Nice cleanup. But I can't apply the patch on top of 6.16-rc7. Against
which kernel was this developed?


--Px5MLaBzWfo1OMoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiHUYgACgkQFA3kzBSg
KbbDShAAotckOep4ATsmDNtdp1aqOwzcuPPPmKAkhHKijixotGTJ+TPRaF8/zW4f
L6uKrdj9nBAmJIui+++VyJhsH+ARCtTCpxHfX2ezQANIbT2oqa7GAucDJaopTMiM
9WBwDLEhVa5I3dhULAQesA6k63lchjWhfABiWm8nu8s6MAGE7k41AEHGA/wSbSd1
Wz5+C3FyN6o3OjjnwnmGUbsAxfW4yezP3Cwa2R5lviTtYIU0pd1S6ZQXodWY2rf+
5ELxg4sUD9zKZX39FusM+BmeFXH1/g+wugPltMqJEIQczZHb/Ow0FR58REFG8zMh
ypnRlZcaqBU62UlFWRbOE6ABSPgDUwgFtfKEa0NVTPLR0td64hINSltVHa+UxJyn
vQGltbA0ZBZ2UUSGZbI3eSogBn3DEjcAS5jlYStsvHRCQ2VgRBvyi/4XwO1eoS4k
+8vtSUEdBUVMuYpHPhWkM7ArZPT6wHK5/35JOEbbewpn865QZwX07kfBTFki36sN
daAUwRcuXyzG4izGDlyhm1WO1NQ78y56mEHDooCGWppKHb/pxDACPXKixchkEzZO
BKl1PJBZVQ55mVPZJl3pFQbd0Jg0ZZbUgrEoqUaUoeieCnNCmyNq8/J0lwj+g5Xv
3VcXBAteCmSKGpqdWmfXgA3PlC8yPimadQK1zF45bm2oQawzwd4=
=OWtI
-----END PGP SIGNATURE-----

--Px5MLaBzWfo1OMoy--

