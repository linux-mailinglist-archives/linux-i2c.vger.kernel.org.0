Return-Path: <linux-i2c+bounces-7262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18219942F0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FCFE1C240CE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 08:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD3D17C7C9;
	Tue,  8 Oct 2024 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R7usSuq4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37217BEAC
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728376998; cv=none; b=SWF8KL7+Ymx22iuTNBB1A/q317vGTLMt9xyU/FXCGD+utUPvt44oumqMbB6sv3mgQ43lcBcx182IbkcNap3mx1zVaXg1itbPYEXN+0UJVmNen8tRMCDJ+lU3MTo47hiHU/1o2rNxefhIDuC97fuPIu3PFSrRAomE3VRBt02uARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728376998; c=relaxed/simple;
	bh=dsOaWUvgT64VC2VdT0gWtnv9bNDd0zd2Ft7vQVv1hAE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5A0Qnk70J+4cFBWOqDBpznxboEuxJnyJR2B5yb/mBpI/QEf8VUZzwLGteJPLqE7SSelLOCX1XxthvV6EQErFnFAS477HL180AO90JrJCHrSqJhl9HFyo7UlwZVCQZQDNJfHwIy6JVOC0o0Vanup+GJkjf4CT7u7W+8VK0Ne4FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R7usSuq4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dsOa
	WUvgT64VC2VdT0gWtnv9bNDd0zd2Ft7vQVv1hAE=; b=R7usSuq402Sx9DR5cx8V
	xDD3rScwHft2WIQGSYs0/jkHmuSmJuDIv6qjofWsAQss9jgFvuOGgjoVp+3CyzQc
	fkMiqoGKENTh1p/5sOkNUoZzny3vZ8Jt1QZE9VzLIB7GoxQ1PmhLLYPhEvKxK1Ec
	SQu2i77P8JbuacfSw+5Uk6eSx3Efo6nVA5U+QYyY3KBDpQ27H/hYCWfi5HK5UcV+
	ujTEXFNUzTCphtiHrcgz97D09BdAJ00kLrVZjycR38JLVfji5xoX1dKZYPo/ko2J
	VOe7PVxZoTZST2PKmFkiVRrG6NEliHGyjosT8cvNCVMR8cyiSVr5SVJiop8Abpje
	kQ==
Received: (qmail 405193 invoked from network); 8 Oct 2024 10:43:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 10:43:14 +0200
X-UD-Smtp-Session: l3s3148p1@zDbDIPMjwkZtKPHJ
Date: Tue, 8 Oct 2024 10:43:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/4] i2c: Replace lists of special clients with
 flagging of such clients
Message-ID: <ZwTwoQLAU9emhn13@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <ZtQ0KMWUk9iAUCCl@shikoro>
 <18306ded-6451-4880-9f74-6bceb0f26dea@gmail.com>
 <ZvqEhntonE9qWnPF@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9FUcZpkfTPPUAaWS"
Content-Disposition: inline
In-Reply-To: <ZvqEhntonE9qWnPF@shikoro>


--9FUcZpkfTPPUAaWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yes, hopefully this week.

Reviewing and testing now. What tests did you run?


--9FUcZpkfTPPUAaWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE8KEACgkQFA3kzBSg
KbbV7A//Us4MxYoeTCPW4rnYln7FBJi3+FjQAeE9PfPTP7J6vq3L4r7ZWI+t16JM
JU5TtskHaaAGovgVtEplCikd8U05nasqR7B9QwEuexBJLFmckQIhvz04qyE2VZzi
LG9ZpT4AxpX3u4RBZNSvwvrC7nFPjwv8krDnyH67MVdTa6HQU7kil5EEx7+PZz0M
g8YH7kJUl64xCuUjWvztMezYzRm0DTGnILmgQ0mDJva7kdgRmSu3xYBb3CotY+st
AtcL1rePErNbwmUpJdVCuCE3s2tox+TffQo51JdD+yc3E3TiC7byCNPria9XjIkb
pa9iVa+047SvZS3xhPRDwjyqvRSBMitBctNzwlrZToZIbeWosTOexMSg90WmeqhI
ryzdfZWN9RoG9Wilo3Yh9jFLx7rjwK+ojWVtj4MnSClzneVsFFpbTsGwzNqB0wmx
6n4vdn7/Gz+LKpPCakUsS84BLX6gUOw6+B81rx9tIadU5MNIBMadGrVD9/w/bkKd
bLNN1d97iJa8YCAvXWJlYKpTJeBF1RxZqP5A0m00i5tqIQkMZeDHFOUruht+tZLS
lfF5HVyzkSanfeQl6ScEwqJj7s63T2a7M2aiC9p1v03z5O2foFVfJCH2jOlp73sc
eAKpuO3hyilRF3qqi87Qg5eJkCBEmkEX+gAqbfqQwLCAtW4bnTM=
=T5Vt
-----END PGP SIGNATURE-----

--9FUcZpkfTPPUAaWS--

