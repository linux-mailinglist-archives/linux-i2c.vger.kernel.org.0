Return-Path: <linux-i2c+bounces-6021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 438B2969A7B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 12:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E09C61F240DF
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 10:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015DB1B984A;
	Tue,  3 Sep 2024 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SeSC/3Hs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEE71A0BEC
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360238; cv=none; b=Kq4VtF9NdTXmO5eN7XyJAAFaMtQYLIWBnRF5YOwSix4xfc7qZsGroitcr+XWzRpgByo66EUjHtZPkAnfksCETAPxXE63hG5szAyxZG0HUba927FfL0QbLWZ9/ZvsuB4aXJZMbAPCsmol6V7KJC1kWI7kMpeExhTcgCYDmtPleRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360238; c=relaxed/simple;
	bh=2i4B9G9+XVzEn2mX2eDNvkuMH6tzga34ElDfEQFuRlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T35x0AtXNHIPMQuB0ivJHdbWBZlmXFvca+Ofb3XC0ONJOM5o5yWLda+10zLgnGSx6a4DoSLngNUeHyFidoiaOsoIQZWKPe84vJuXm1YYUL93jT5cPanHK1cc9q06sO1HszQXjDWmMv0YLbDHj0FK2tTc755+oiaRLgnKTwymxIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SeSC/3Hs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XFLl
	8JzRHfz1hlmPwdert5vlD64V3d4tr2ywxwUOHp4=; b=SeSC/3HsA0tVUFCq99up
	kIrWsLaVrN8O0lMHm1OUamCuwXxkTherwIptSsHabdVb6+6uq8wZ6yXfBfSlveBG
	Vzv5bXwpWQgW8q0UrRENS1g4gNeplLaUUWf1CExSzMP2SqfMoHkeMIekTeaDL00j
	enV+pi7R99U5MBCg76u4pnIpp8dz/poaofGohqQ8sOrqc4/zDB4mqEj0emceN86O
	uDwN0VWXR7hDNjuWEi3ks4ScrQHRIvPx6kZVVjyMQIlUHFfxyRdLGI6LP10GkKyA
	3L5MxyhAdyGDA/lM3AbLFU0VZl0vRrv2zjo6R9szvrBmBw5hbPK0+/C4mZwipnth
	Pg==
Received: (qmail 221057 invoked from network); 3 Sep 2024 12:43:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Sep 2024 12:43:52 +0200
X-UD-Smtp-Session: l3s3148p1@6bLDuzQhZqggAwDPXwdRANgvu6DX4+2c
Date: Tue, 3 Sep 2024 12:43:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] driver core: class: warn if a compatibility class is
 registered
Message-ID: <ZtboaI4b_aTfRWNk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
 <7bc5fa50-59f6-4455-8f77-1c89f1e17d0b@gmail.com>
 <2024090242-smother-preview-a1d2@gregkh>
 <ZtbRLOUO48PzOKmC@shikoro>
 <ZtbRpMbX6g6vLUzO@shikoro>
 <2024090338-landfall-geek-58df@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zrcz/tOtrh2Pzhj8"
Content-Disposition: inline
In-Reply-To: <2024090338-landfall-geek-58df@gregkh>


--Zrcz/tOtrh2Pzhj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Delete the code and see if anyone notices?  :)

"Never ever break userspace, at least until Greg says so" :D

Seriously, Heiner initially sent a patch simply removing the code in
question [1]. May I interpret your above statement as "Acked-by"?

[1] https://lore.kernel.org/r/80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com


--Zrcz/tOtrh2Pzhj8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbW6GQACgkQFA3kzBSg
KbaB+RAArYXuYJrE39IZx8oz0n0QikWXtAEUIUH/AsZ39W1Z7/r5t0q+nfWCXVpJ
L3x4I1essT1a3NFYX5Mp7eKAEV6MO/vPTJoyUM9g+m6Qd184755kHLHa+ltpF6oZ
ksOcPnpFmeQoeKlUvf0C93+AKFYOYNB4DRDf0Wxc5UdWKREO7fGLtXPKJlicFMvP
xlcFjKpkgdkI7fuVULL6n3x1ZAGjhpzh/XMrYjnoP/3lHL8r6UlKBPJOCzBNBYSX
bFhtDGt+NH/ncJUh2HP+w64UpBIhrm06MIiz6EDOH4ylo62s+SCivF4TSStcoZY+
PbM+uLS0gkIRzYHOr4EHPoPFcaaRdOO175JFR7LZoUN8Gf4ZBWjCiJJavr1dBUFS
ruFyxXUu8uj/RvEiG73v5vquES1iafPfEzu5XeK5bR2AGknkDodcza0NKP4CYuty
bOLOh7YzhCnfK8XlRVTGg9N3wFk3K2sYVUrN3e42YST5BR5wwpxYTr5b/3azmEsF
nG3WOr2lK6qsl/vT9gUlLHAjwIZbi83Z3U+R/h06pfCbbD+DdtwbMwM7T0U9ZRZc
cd1DDmdgUUf0l1JdnPhgc/rvTuj03chRyCGDLs4CzoT8U4I6hbAcz2FVheVhfz8D
mmfIiadIjZFOhJLzUySVweUMjyQawmgQ19KY51na13/A80paZt0=
=j3eC
-----END PGP SIGNATURE-----

--Zrcz/tOtrh2Pzhj8--

