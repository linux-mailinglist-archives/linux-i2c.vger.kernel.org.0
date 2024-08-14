Return-Path: <linux-i2c+bounces-5389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EE951EC7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 17:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7483B1F2329C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 15:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0271B5803;
	Wed, 14 Aug 2024 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OJq/c22m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD8B1B4C45
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650086; cv=none; b=dGI6KdmJSZofAN+I5CvBXUwh4TLpsVje2mHbE/ORKmZBo6OSmeVa6WH5LMa9xVebc8RwcRufMu896PWD4eH5Iy1OnGXoWI9bxmrVtmUUWgwEjfZYsR+xG808neDpihjx1XuGpJi4wFauqM77dAuNDG3Ph8yG//ClDiVuoDOFqk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650086; c=relaxed/simple;
	bh=NgaDpG6DTfA0N471gKketQJKffFKRH0SRwAgGTqaFaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5DXEQHyN/stIfVmhPMMpeqPmmNBsDVZwusq4S7EEpolf7sUTnDW6C3l6erg4TBNoJx53pdve2ijukSJAc2f17V+ozv6TnfP3m+up4mkTiiPBqlP/OJEpAZW+fVRXzYg0K7vC2qggSnNHxd1RCR9Odm964xIhpa+EuKi/TDE1wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OJq/c22m; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NgaD
	pG6DTfA0N471gKketQJKffFKRH0SRwAgGTqaFaE=; b=OJq/c22mtHWsUw8E+B/R
	yezmS+dts9K0n2vw4eOjYNPYvS2aUDkap+1pttF5c7HRIB9SSle1fCQeXI3RQgSo
	5VsbKZ4pt+PT+hPgX+x0HcfSnhlX3Iec/vP+wLd/COxv7EZPaYOFx2BLngRGM1lG
	QV5+vQIP9xv+Ehk2+r+42b23SOB0d34qE5OZaVM1ett5T+g0tO0+cs/5KE43nddC
	HcnrvOM9q4X6KC8NnzkwXM65Lt/OXAzt0XEe5p6nqMxAQUWc5mco7LyUt0I+1vNq
	e5z6kUdVW7R4aVzCqY1hX65X32B9sHpzTNPozjkhPBTLnzb714ps2IuQu04QbBzn
	ig==
Received: (qmail 2030307 invoked from network); 14 Aug 2024 17:41:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 17:41:19 +0200
X-UD-Smtp-Session: l3s3148p1@Gma3jqYfToFehhrc
Date: Wed, 14 Aug 2024 17:41:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: Use IS_REACHABLE() for substituting empty ACPI
 functions
Message-ID: <ZrzQH8F22tQWOH-Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	kernel test robot <lkp@intel.com>
References: <20240814121649.261693-1-rf@opensource.cirrus.com>
 <87mslfjk3n.wl-tiwai@suse.de>
 <Zry4eIOLOTwaYdaC@ninjato>
 <87ikw3jizv.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SvPW87wNirmHn1I2"
Content-Disposition: inline
In-Reply-To: <87ikw3jizv.wl-tiwai@suse.de>


--SvPW87wNirmHn1I2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It was a preliminary fix for the change I recently put after the rc3
> release, and now it surfaced.

Ah, that's an explanation. Thanks!


--SvPW87wNirmHn1I2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma80BsACgkQFA3kzBSg
Kba7AQ/6A41xPlTYz0zKa9qB9fP8o9xD62VW2fF4HImhtNQvaoG/pqr9sTDNVyrf
SdDfHQFd6eGTI07CWPeX6636W5guAQGvabGiewvmJsZsSEWKIqan3co+mCTDsjhs
6BrgfvC5WDPyDLfhR/CThWLXFtInm9ZfN6e8SLfblsx+pDijAs8XBAhTwxKNmRSr
cddpkYqK21iWAYHfNZQwhbZDoaEXblBZk6WHf+7BsHYlgjNbMZQfHVoMg5NLr0dS
lO/NHqRy3DjyZQgatMPhrrL9+kCpG/Qb9va8AnJoo611LSHFa3vNoV8qfF995VGY
Lw1xJ1eFsNtEeSdzpBryvY2tilpd4HaNLTltg7RG6VCVm/a2HuCfeWcFUy5ej1gB
E52v0yE9ZVFSSD1jFV106O1XwMH3ga0u0tvcNDUFxrxyF8cHSt92iCdXn3+mDiow
RMWsYS9lREMWqqG7RmL2MiNVVqbagAs19p/CV6v0jcK3Bt5zgn8HOOe793iP3fj1
ZlX6ZiWVlYdBeiE49kjjA64hDbfuXDipMdjesExJ4TAWmLQ0dCGnnBEoi5yalgrC
snaaMycv+FHtuTHXzZAy9DJSri7qDsBq4AuUDEzGUPahO2uNRRG3v4hSqu/NhnH/
K/vaJC9MU5S7YxLTVeboCW9ClGynwg/vKAK364XayQqHKX+7Nb8=
=5UOY
-----END PGP SIGNATURE-----

--SvPW87wNirmHn1I2--

