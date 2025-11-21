Return-Path: <linux-i2c+bounces-14212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C5C77B01
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 08:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 683904E1AD7
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 07:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CC0296BCB;
	Fri, 21 Nov 2025 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MEy4IGco"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520EF22D7B6
	for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763709883; cv=none; b=POtAB93cm28K2uhMoScxlajcZcdI/LGWIGgeCzAZKgdKR3ulvjf+8wfDtoypFAtfZ/gmTU4BsQ+0UnlY5CrCchxPtP+R0+szE7ysfI+vQDT5iVSA4ceINCL0y8wtBV7avNMSH4opaxiPsQgm9R/FYSi2syZs8vGrEfz+hd36blQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763709883; c=relaxed/simple;
	bh=fyfeWlQtA22gmramUXhEa0HTyZ1hJc/+KggzyHm5474=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBnlyy12ilNHFz+Fm4F0HFdXKkAVf4bXCjP8JkGlzCI4Xes8kcSaGpBnOAhH+/YnO0rvVBI+pRPTLKkRPEt3g73Og2vnTa41EH/LsOsUX9q2ttQgJEAKrNT+VljkMY8lbko9qCy+0R2XCxoUfimVBHiGYDG6ilLSN9Fcl22REuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MEy4IGco; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fyfe
	WlQtA22gmramUXhEa0HTyZ1hJc/+KggzyHm5474=; b=MEy4IGcoik1uhNmHc/+n
	ygli6aXaUnetGJdlO51qCA3oxA4TITfXdGsjnVwsdIbyYfnI6EKEhOOqJbnrE8Ut
	S40jiR4gNbFfOQRkvNq7ni0uGoz9mEODAOc6rENQsgW6bAN3GtezDGVp7ct0aEPi
	IhC4j2IVRop6k9nZX9xQ1QRhMGRtUgfg9PdB8ULE6mZ2EPZAi8zMhbcfsYTpAQU5
	A3fRxufYwgIQ8tiO2wzJqnEeKkSvelg3E/rtfYW+wv50zHWksDTSNaLqZ+rCawIy
	PSWxHsTtblqMMH4E4CryZ6EtzeWzAu5JXQRcEI2OMzQEqNjM/UdnKS+NtV4Fp1IA
	4w==
Received: (qmail 676231 invoked from network); 21 Nov 2025 08:24:35 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Nov 2025 08:24:35 +0100
X-UD-Smtp-Session: l3s3148p1@WH+VtBVErucujnvG
Date: Fri, 21 Nov 2025 08:24:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: lm75 on i2c-elektor.c
Message-ID: <aSATsgYaWt_-g1s9@shikoro>
References: <CA+=Fv5T4PqVOFHnad_aLoMcYRZpg4Oenrmn0XYvb=Gjt1+5L7g@mail.gmail.com>
 <aR-U3kr-IyXlgYdV@shikoro>
 <CA+=Fv5QbDy_2G3KiXF=asX2+61BWMWE70tz3nr9XE8_KhwRNmg@mail.gmail.com>
 <aR-dktlDxOem6mOX@shikoro>
 <CA+=Fv5TN6JQJY2gOmjxPA8VPZto1+dxqtfYvDTL-dEnoNnVDpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QRn+O7Ue0a0JRcdz"
Content-Disposition: inline
In-Reply-To: <CA+=Fv5TN6JQJY2gOmjxPA8VPZto1+dxqtfYvDTL-dEnoNnVDpQ@mail.gmail.com>


--QRn+O7Ue0a0JRcdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> they are not in torvalds linux git repo? I could only find history
> there dating back to 2005.

history.git is a dedicated tree, built after the facts ;)

https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/

Fun to browse for such questions...


--QRn+O7Ue0a0JRcdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkgE7IACgkQFA3kzBSg
KbZvqQ//X3ynJG6o3CcU1kVR4Px32Bg6gqobS3OGAjbHlbvNS7oR+TwaC7JKaDaS
X1xHybVtijrQct35IhvUdfw4FJL7dG7Cf4ucQtuOfUs7FutE0T6IkmBH4Si505aW
TiYzsNh1QOoRDuYDuIelMzU2GXLexxrjy0406oC9Jb+EMU881+IWv4vax+TG795Y
G9+/YsndSPAirzsVyf539H6dMG0GtaMNllz/CPn9XkKzVpnC9c48Y4+truz0bSIp
yFE43LASd2LZF/7zz0LU0LyUUlzar8Iux6MU8jc/bpJbEw8KdEWrWFIrXCYcI1bt
hHSP6am6bp/sWgaKa2+gvu4hroH/kKd3uTOoYmYcPlNyyemAUQoR9nDu0LkYuHg8
L/9iTtMK4cgYn2Jo9pTdQ0B+mm6BLvGEwzC1EUBmsgH5A5r5nwoJUJ8qzxJ2EhEP
4R7TYlHtqG05ZAKIfJtwQ8/yzk5rM3Ak3G7Ny+obIo7epWSE++JIc238HaSNs4w6
2jT+Lvbge5PaVMbehBlPpt/y3fSMMmjEFMs8c3UlAcUuEf7hQeijfFmu+aP/vgsn
5uwMZajSi9jT3zQ6xn8PpaTnTBdFQeXRtDMIcdyLTBvesywDvsno+Ub3bqYYft6w
CXbg7bFj7VjbxC8beAg7GSV23iKUR2qPaiYlWldr/kMADkdKqzo=
=gwWg
-----END PGP SIGNATURE-----

--QRn+O7Ue0a0JRcdz--

